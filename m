Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01552433DF2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:59:55 +0200 (CEST)
Received: from localhost ([::1]:34718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mctOz-0000NI-BR
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel@labath.sk>) id 1mctIo-0003lu-9H
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 13:53:31 -0400
Received: from holomatrix.labath.sk ([92.48.125.149]:54670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel@labath.sk>) id 1mctIi-0003yB-Qt
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 13:53:29 -0400
Received: from [172.29.152.10] (unknown [172.29.152.10])
 by holomatrix.labath.sk (Postfix) with ESMTP id D63367760C5B;
 Tue, 19 Oct 2021 17:53:19 +0000 (GMT)
Subject: Re: [PATCH] gdbstub: Switch to the thread receiving a signal
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210930095111.23205-1-pavel@labath.sk>
 <87o87lvsy3.fsf@linaro.org>
From: Pavel Labath <pavel@labath.sk>
Message-ID: <400b1c4b-42d0-cd28-42cd-668de9439b68@labath.sk>
Date: Tue, 19 Oct 2021 19:53:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87o87lvsy3.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=92.48.125.149; envelope-from=pavel@labath.sk;
 helo=holomatrix.labath.sk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) NICE_REPLY_A=-2.074, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for taking a look. I've sent out a new version of the patch. 
Besides the Makefile change, I have also replaced the direct 
gdbserver_state manipulation with a call to gdb_set_stop_cpu.

Further responses inline.

On 19/10/2021 19:02, Alex Bennée wrote:
> 
> Pavel Labath <pavel@labath.sk> writes:
> 
>> Respond with Txxthread:yyyy; instead of a plain Sxx to indicate which
>> thread received the signal. Otherwise, the debugger will associate it
>> with the main one. Also automatically select this thread, as that is
>> what gdb expects.
>>
>> Signed-off-by: Pavel Labath <pavel@labath.sk>
>> ---
>>   gdbstub.c                                     |  9 ++-
>>   tests/tcg/multiarch/Makefile.target           |  7 +++
>>   .../gdbstub/test-thread-breakpoint.py         | 60 +++++++++++++++++++
>>   3 files changed, 74 insertions(+), 2 deletions(-)
>>   create mode 100644 tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
>>
>> diff --git a/gdbstub.c b/gdbstub.c
>> index 36b85aa..7bd4479 100644
>> --- a/gdbstub.c
>> +++ b/gdbstub.c
>> @@ -3138,8 +3138,13 @@ gdb_handlesig(CPUState *cpu, int sig)
>>       tb_flush(cpu);
>>   
>>       if (sig != 0) {
>> -        snprintf(buf, sizeof(buf), "S%02x", target_signal_to_gdb(sig));
>> -        put_packet(buf);
>> +        gdbserver_state.c_cpu = cpu;
>> +        gdbserver_state.g_cpu = cpu;
>> +        g_string_printf(gdbserver_state.str_buf,
>> +                        "T%02xthread:", target_signal_to_gdb(sig));
>> +        gdb_append_thread_id(cpu, gdbserver_state.str_buf);
>> +        g_string_append_c(gdbserver_state.str_buf, ';');
>> +        put_strbuf();
>>       }
>>       /* put_packet() might have detected that the peer terminated the
>>          connection.  */
>> diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
>> index 85a6fb7..c7b7e8b 100644
>> --- a/tests/tcg/multiarch/Makefile.target
>> +++ b/tests/tcg/multiarch/Makefile.target
>> @@ -73,6 +73,13 @@ run-gdbstub-qxfer-auxv-read: sha1
>>   		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-qxfer-auxv-read.py, \
>>   	"basic gdbstub qXfer:auxv:read support")
>>   
>> +run-gdbstub-thread-breakpoint: testthread
>> +	$(call run-test, $@, $(GDB_SCRIPT) \
>> +		--gdb $(HAVE_GDB_BIN) \
>> +		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
>> +		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-thread-breakpoint.py, \
>> +	"hitting a breakpoint on non-main thread")
>> +
> 
> You also need to add the test to EXTRA_RUNS here (or just bellow in fact).
Done.

> 
>>   else
>>   run-gdbstub-%:
>>   	$(call skip-test, "gdbstub test $*", "need working gdb")
>> diff --git a/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py b/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
>> new file mode 100644
>> index 0000000..798d508
>> --- /dev/null
>> +++ b/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
>> @@ -0,0 +1,60 @@
>> +from __future__ import print_function
>> +#
>> +# Test auxiliary vector is loaded via gdbstub
>> +#
>> +# This is launched via tests/guest-debug/run-test.py
>> +#
>> +
>> +import gdb
>> +import sys
>> +
>> +failcount = 0
>> +
>> +def report(cond, msg):
>> +    "Report success/fail of test"
>> +    if cond:
>> +        print ("PASS: %s" % (msg))
>> +    else:
>> +        print ("FAIL: %s" % (msg))
>> +        global failcount
>> +        failcount += 1
>> +
>> +def run_test():
>> +    "Run through the tests one by one"
>> +
>> +    sym, ok = gdb.lookup_symbol("thread1_func")
>> +    gdb.execute("b thread1_func")
>> +    gdb.execute("c")
>> +
>> +    frame = gdb.selected_frame()
>> +    report(str(frame.function()) == "thread1_func", "break @
>>   %s"%frame)
> 
> Does this actually check the correct thread is reported?
It does it indirectly -- there is only one thread which can have 
thread1_func on the stack. If we do not report the correct thread, 
selected_frame() will point into the bowels of pthread_join, as that's 
where the main thread will be stuck at.
I don't know of a direct way to check for the reported thread. 
gdb.selected_thread().name would be more direct, but I am not sure we 
would be able to correctly set the thread name on all supported platforms.

> 
>> +
>> +#
>> +# This runs as the script it sourced (via -x, via run-test.py)
>> +#
>> +try:
>> +    inferior = gdb.selected_inferior()
>> +    arch = inferior.architecture()
>> +    print("ATTACHED: %s" % arch.name())
>> +except (gdb.error, AttributeError):
>> +    print("SKIPPING (not connected)", file=sys.stderr)
>> +    exit(0)
>> +
>> +if gdb.parse_and_eval('$pc') == 0:
>> +    print("SKIP: PC not set")
>> +    exit(0)
>> +
>> +try:
>> +    # These are not very useful in scripts
>> +    gdb.execute("set pagination off")
>> +    gdb.execute("set confirm off")
>> +
>> +    # Run the actual tests
>> +    run_test()
>> +except (gdb.error):
>> +    print ("GDB Exception: %s" % (sys.exc_info()[0]))
>> +    failcount += 1
>> +    pass
>> +
>> +print("All tests complete: %d failures" % failcount)
>> +exit(failcount)
> 
> 


