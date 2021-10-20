Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6BE435104
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 19:13:01 +0200 (CEST)
Received: from localhost ([::1]:51120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdF99-0004U5-Po
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 13:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel@labath.sk>) id 1mdF24-00035e-K9
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:05:41 -0400
Received: from holomatrix.labath.sk ([92.48.125.149]:49298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel@labath.sk>) id 1mdF1z-0004zd-0n
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:05:39 -0400
Received: from [172.29.152.10] (unknown [172.29.152.10])
 by holomatrix.labath.sk (Postfix) with ESMTP id 616247760C5C;
 Wed, 20 Oct 2021 17:04:27 +0000 (GMT)
Subject: Re: [PATCH v2] gdbstub: Switch to the thread receiving a signal
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210930095111.23205-1-pavel@labath.sk>
 <20211019174953.36560-1-pavel@labath.sk> <87fsswvsfy.fsf@linaro.org>
From: Pavel Labath <pavel@labath.sk>
Message-ID: <4a9b5f62-3189-7afd-217f-1386f44e0e7c@labath.sk>
Date: Wed, 20 Oct 2021 19:04:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87fsswvsfy.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=92.48.125.149; envelope-from=pavel@labath.sk;
 helo=holomatrix.labath.sk
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.267,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org, stanshebs@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/2021 10:35, Alex Bennée wrote:
> 
> Pavel Labath <pavel@labath.sk> writes:
> 
>> Respond with Txxthread:yyyy; instead of a plain Sxx to indicate which
>> thread received the signal. Otherwise, the debugger will associate it
>> with the main one. Also automatically select this thread, as that is
>> what gdb expects.
> 
> Just for reference it's best to post vN's in a new thread as the
> Replied-to field can confuse some of the automatic tools (b4, patchew
> etc).

Got it.
> 
>> Signed-off-by: Pavel Labath <pavel@labath.sk>
>> ---
>>   gdbstub.c                                     |  8 ++-
>>   tests/tcg/multiarch/Makefile.target           | 10 +++-
>>   .../gdbstub/test-thread-breakpoint.py         | 60 +++++++++++++++++++
>>   3 files changed, 75 insertions(+), 3 deletions(-)
>>   create mode 100644 tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
>>
>> diff --git a/gdbstub.c b/gdbstub.c
>> index 36b85aa..23baaef 100644
>> --- a/gdbstub.c
>> +++ b/gdbstub.c
>> @@ -3138,8 +3138,12 @@ gdb_handlesig(CPUState *cpu, int sig)
>>       tb_flush(cpu);
>>   
>>       if (sig != 0) {
>> -        snprintf(buf, sizeof(buf), "S%02x", target_signal_to_gdb(sig));
>> -        put_packet(buf);
>> +        gdb_set_stop_cpu(cpu);
>> +        g_string_printf(gdbserver_state.str_buf,
>> +                        "T%02xthread:", target_signal_to_gdb(sig));
>> +        gdb_append_thread_id(cpu, gdbserver_state.str_buf);
>> +        g_string_append_c(gdbserver_state.str_buf, ';');
>> +        put_strbuf();
>>       }
>>       /* put_packet() might have detected that the peer terminated the
>>          connection.  */
>> diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
>> index 6ccb592..c84683f 100644
>> --- a/tests/tcg/multiarch/Makefile.target
>> +++ b/tests/tcg/multiarch/Makefile.target
>> @@ -70,11 +70,19 @@ run-gdbstub-qxfer-auxv-read: sha1
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
>>   else
>>   run-gdbstub-%:
>>   	$(call skip-test, "gdbstub test $*", "need working gdb")
>>   endif
>> -EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read
>> +EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read \
>> +	      run-gdbstub-thread-breakpoint
>>   
>>   # ARM Compatible Semi Hosting Tests
>>   #
>> diff --git a/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py b/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
>> new file mode 100644
>> index 0000000..798d508
>> --- /dev/null
>> +++ b/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
>> @@ -0,0 +1,60 @@
>> +from __future__ import print_function
>> +#
>> +# Test auxiliary vector is loaded via gdbstub
> 
> I'm fairly sure this isn't what the test is doing...
Oops. I'll fix this in the next version.

> 
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
>> %s"%frame)
> 
> I think we can do better here by checking gdb.selected_thread() and
> ensuring the num (or global_num) is not 1. Also maybe check the
> is_stopped() status:

Checking `num` is a good idea. Checking is_stopped() doesn't hurt 
either, though I believe that (in all-stop mode) gdb just hardwires this 
to True for all threads, even those that are not actually stopped (more 
on that below).

However, if that's ok with you, I think it'd still be nice to keep the 
frame check as well.
> 
>    https://sourceware.org/gdb/current/onlinedocs/gdb/Threads-In-Python.html
> 
> I noticed while running the test that output still continued for some
> time from the other thread but it was still doing that pre this change
> so I'm not quite sure what was going on there.
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
> I also tried some manual testing:
> 
>    ➜  ./qemu-aarch64 -g 1234 tests/tcg/aarch64-linux-user/testthread
>    fish: “./qemu-aarch64 -g 1234 tests/tc…” terminated by signal SIGSEGV (Address boundary error)
>    🕙12:33:49 alex@zen:qemu.git/builds/arm.all  on  gdbstub/next [$!?⇡] took 12s [⚡ SEGV]
>    ✗
> 
> where in the other window I did:
> 
>    0x00000000004005d0 in _start ()
>    (gdb) hbreak thread2_func
>    Hardware assisted breakpoint 1 at 0x400824: file /home/alex/lsrc/qemu.git/tests/tcg/multiarch/testthread.c, line 34.
>    (gdb) hbreak thread1_func
>    Hardware assisted breakpoint 2 at 0x400798: file /home/alex/lsrc/qemu.git/tests/tcg/multiarch/testthread.c, line 22.
>    (gdb) c
>    Continuing.
>    [New Thread 1.2748248]
>    Remote connection closed
> 
> which seems to indicate some problems with breaking on multiple threads.
> Maybe this is related to the weird output I was seeing above?
> 

Yes, that's definitely related. What's happening is that the qemu does 
not stop other thread when one of them hits a breakpoint (or stops for 
any other reason) -- as far as I can tell it does not have any code 
which would even attempt to do that. This is why you're seeing the 
output even after the process is purportedly stopped.

Things get even more interesting when you have two threads hitting a 
breakpoint simultaneously. At that point both of them will enter their 
gdb stubs and attempt to talk to gdb at the same time. As you can 
imagine, this cannot end well, and eventually the connection will become 
so messed up that one side just gives up and terminates the link.

I am aware of this issue, and I (well, Stan (cc'ed) is, for the most 
part) looking for a way to fix it. If you have any ideas, we'd very much 
like to hear them. The way I see it, we need to implement some kind of a 
"stop the world" mechanism, to stop/interrupt all threads whenever the 
gdb stub becomes active (and make sure it can handle simultaneous debug 
events). However, I am don't know enough about qemu internals to tell 
how to actually go about doing that.

My plan was to "get my feet wet" with a simple patch that improves the 
situation for the case when there are no simultaneous debug events, and 
eventually hopefully figure out a way how to address the bigger problem.

regards,
Pavel

