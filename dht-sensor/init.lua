ok=pcall(dofile, "dht_ts_ifttt.lua")
if not ok then
	print("execution failed")
	print("module will sleep in 5 seconds")
	print("enter anything to abort...")
	tmr.alarm(0,5000,tmr.ALARM_SINGLE,function()
		print("sleep")
		node.dsleep(0)
	end)
	uart.on("data",0,function()
		tmr.stop(0)
		print("stop")
		uart.on("data",0,nil)
	end,1)
end
