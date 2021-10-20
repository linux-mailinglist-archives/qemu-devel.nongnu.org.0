Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD2C435255
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 20:05:54 +0200 (CEST)
Received: from localhost ([::1]:59896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdFyL-0008PP-AY
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 14:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdFsf-0002Jl-F5
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 14:00:01 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdFsa-0006or-4Q
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:59:59 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m22so140895wrb.0
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 10:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=oSP8OjQ/e3fbPuDu1kACwGuLYkcyqyq9spAVbZvLTo0=;
 b=rOZy1SBMCqKAgUzY4gJdYlwHMALKYTC22hLpSMA0gZ04nhpJ71yaVjaW6Nh5JDJDV7
 fbfCzHfQ78JpZLJa77X7CcbDvAqTMaaKSZsQgBFI/3SymVgQUSpQKxaGzAMpTmqqLL+a
 ZOs6/HjNkQ5H36lnXsuzsYlU3VsLqaZVGRb9zSSoHT8SQGG5NcDMPArjUacGeQOA3Cl3
 dLYWHK1cAOTJbE0Hz1xeT3Jx9O5QoxUwxdvqMUinvpQD4Lk2m3CGLFh6NSsvGJzLPoLf
 36jJA+7T/w94/AwexQByRLWCmsdQa6QtQttspIGTvM6BbBC8SQ7aSojcRws4OQhbsDuh
 xGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=oSP8OjQ/e3fbPuDu1kACwGuLYkcyqyq9spAVbZvLTo0=;
 b=3Y3emTxTFYQPUbHy7y8l5Yhasw5h8WG3G+LPfGxklO7WyuaAQWwapT1UxG8e7JZjiz
 EX/egR/ijrrKRTMd/PonLhvjQfvrNUxVpo8rNBk1w2NfKbxeEBt0tEhiHPFUQeEjxJgP
 rbOHcbgCMTQdpB3629CV6f7h6yBzlWAJMeQa+BWPEavRHNnjwYLzV7S4ihJ0jV1/NCQs
 WuK+7gY1mJ1BqHXwi0E4r+cBOhhNm8q3zb5lhdCSQmRN7JuejUw5XgfSLlbyuWJMIId3
 vrT1L7ZNdM2Ww8CHEseVlnHHu29WnybBFbyvQxlGc/KAhtT/gIPd0+4hmqHPP+UlCMYz
 rAaw==
X-Gm-Message-State: AOAM531dPlkJukkSsa/I82bfb64Acy/ihWOEBQkXoOOUvzF3T9L+DU4S
 NiNaHJ5QvzZma1OlqAtPMQwb8w2GpQniDA==
X-Google-Smtp-Source: ABdhPJyc7vJ5Dyp7c8dYmhG0EScN455vzvbWDNsibBPJQr4xxqZMCPTtj2KxMAqLefn9r3xWZJC0cA==
X-Received: by 2002:adf:f04c:: with SMTP id t12mr885083wro.7.1634752794042;
 Wed, 20 Oct 2021 10:59:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 133sm5789633wmb.24.2021.10.20.10.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 10:59:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 83BC91FF96;
 Wed, 20 Oct 2021 18:59:52 +0100 (BST)
References: <20210930095111.23205-1-pavel@labath.sk>
 <20211019174953.36560-1-pavel@labath.sk> <87fsswvsfy.fsf@linaro.org>
 <4a9b5f62-3189-7afd-217f-1386f44e0e7c@labath.sk>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Labath <pavel@labath.sk>
Subject: Re: [PATCH v2] gdbstub: Switch to the thread receiving a signal
Date: Wed, 20 Oct 2021 18:57:22 +0100
In-reply-to: <4a9b5f62-3189-7afd-217f-1386f44e0e7c@labath.sk>
Message-ID: <878rynvap3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org, stanshebs@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pavel Labath <pavel@labath.sk> writes:

> On 20/10/2021 10:35, Alex Benn=C3=A9e wrote:
>> Pavel Labath <pavel@labath.sk> writes:
>>=20
>>> Respond with Txxthread:yyyy; instead of a plain Sxx to indicate which
>>> thread received the signal. Otherwise, the debugger will associate it
>>> with the main one. Also automatically select this thread, as that is
>>> what gdb expects.
>> Just for reference it's best to post vN's in a new thread as the
>> Replied-to field can confuse some of the automatic tools (b4, patchew
>> etc).
>
> Got it.
>>=20
>>> Signed-off-by: Pavel Labath <pavel@labath.sk>
>>> ---
>>>   gdbstub.c                                     |  8 ++-
>>>   tests/tcg/multiarch/Makefile.target           | 10 +++-
>>>   .../gdbstub/test-thread-breakpoint.py         | 60 +++++++++++++++++++
>>>   3 files changed, 75 insertions(+), 3 deletions(-)
>>>   create mode 100644 tests/tcg/multiarch/gdbstub/test-thread-breakpoint=
.py
>>>
>>> diff --git a/gdbstub.c b/gdbstub.c
>>> index 36b85aa..23baaef 100644
>>> --- a/gdbstub.c
>>> +++ b/gdbstub.c
>>> @@ -3138,8 +3138,12 @@ gdb_handlesig(CPUState *cpu, int sig)
>>>       tb_flush(cpu);
>>>         if (sig !=3D 0) {
>>> -        snprintf(buf, sizeof(buf), "S%02x", target_signal_to_gdb(sig));
>>> -        put_packet(buf);
>>> +        gdb_set_stop_cpu(cpu);
>>> +        g_string_printf(gdbserver_state.str_buf,
>>> +                        "T%02xthread:", target_signal_to_gdb(sig));
>>> +        gdb_append_thread_id(cpu, gdbserver_state.str_buf);
>>> +        g_string_append_c(gdbserver_state.str_buf, ';');
>>> +        put_strbuf();
>>>       }
>>>       /* put_packet() might have detected that the peer terminated the
>>>          connection.  */
>>> diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/=
Makefile.target
>>> index 6ccb592..c84683f 100644
>>> --- a/tests/tcg/multiarch/Makefile.target
>>> +++ b/tests/tcg/multiarch/Makefile.target
>>> @@ -70,11 +70,19 @@ run-gdbstub-qxfer-auxv-read: sha1
>>>   		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-qxfer-auxv-read.py, \
>>>   	"basic gdbstub qXfer:auxv:read support")
>>>   +run-gdbstub-thread-breakpoint: testthread
>>> +	$(call run-test, $@, $(GDB_SCRIPT) \
>>> +		--gdb $(HAVE_GDB_BIN) \
>>> +		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
>>> +		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-thread-breakpoint.py, \
>>> +	"hitting a breakpoint on non-main thread")
>>> +
>>>   else
>>>   run-gdbstub-%:
>>>   	$(call skip-test, "gdbstub test $*", "need working gdb")
>>>   endif
>>> -EXTRA_RUNS +=3D run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read
>>> +EXTRA_RUNS +=3D run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read \
>>> +	      run-gdbstub-thread-breakpoint
>>>     # ARM Compatible Semi Hosting Tests
>>>   #
>>> diff --git a/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py b/te=
sts/tcg/multiarch/gdbstub/test-thread-breakpoint.py
>>> new file mode 100644
>>> index 0000000..798d508
>>> --- /dev/null
>>> +++ b/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
>>> @@ -0,0 +1,60 @@
>>> +from __future__ import print_function
>>> +#
>>> +# Test auxiliary vector is loaded via gdbstub
>> I'm fairly sure this isn't what the test is doing...
> Oops. I'll fix this in the next version.
>
>>=20
>>> +#
>>> +# This is launched via tests/guest-debug/run-test.py
>>> +#
>>> +
>>> +import gdb
>>> +import sys
>>> +
>>> +failcount =3D 0
>>> +
>>> +def report(cond, msg):
>>> +    "Report success/fail of test"
>>> +    if cond:
>>> +        print ("PASS: %s" % (msg))
>>> +    else:
>>> +        print ("FAIL: %s" % (msg))
>>> +        global failcount
>>> +        failcount +=3D 1
>>> +
>>> +def run_test():
>>> +    "Run through the tests one by one"
>>> +
>>> +    sym, ok =3D gdb.lookup_symbol("thread1_func")
>>> +    gdb.execute("b thread1_func")
>>> +    gdb.execute("c")
>>> +
>>> +    frame =3D gdb.selected_frame()
>>> +    report(str(frame.function()) =3D=3D "thread1_func", "break @
>>> %s"%frame)
>> I think we can do better here by checking gdb.selected_thread() and
>> ensuring the num (or global_num) is not 1. Also maybe check the
>> is_stopped() status:
>
> Checking `num` is a good idea. Checking is_stopped() doesn't hurt
> either, though I believe that (in all-stop mode) gdb just hardwires
> this to True for all threads, even those that are not actually stopped
> (more on that below).
>
> However, if that's ok with you, I think it'd still be nice to keep the
> frame check as well.

That's fine.

>>    https://sourceware.org/gdb/current/onlinedocs/gdb/Threads-In-Python.h=
tml
>> I noticed while running the test that output still continued for
>> some
>> time from the other thread but it was still doing that pre this change
>> so I'm not quite sure what was going on there.
>>=20
>>> +
>>> +#
>>> +# This runs as the script it sourced (via -x, via run-test.py)
>>> +#
>>> +try:
>>> +    inferior =3D gdb.selected_inferior()
>>> +    arch =3D inferior.architecture()
>>> +    print("ATTACHED: %s" % arch.name())
>>> +except (gdb.error, AttributeError):
>>> +    print("SKIPPING (not connected)", file=3Dsys.stderr)
>>> +    exit(0)
>>> +
>>> +if gdb.parse_and_eval('$pc') =3D=3D 0:
>>> +    print("SKIP: PC not set")
>>> +    exit(0)
>>> +
>>> +try:
>>> +    # These are not very useful in scripts
>>> +    gdb.execute("set pagination off")
>>> +    gdb.execute("set confirm off")
>>> +
>>> +    # Run the actual tests
>>> +    run_test()
>>> +except (gdb.error):
>>> +    print ("GDB Exception: %s" % (sys.exc_info()[0]))
>>> +    failcount +=3D 1
>>> +    pass
>>> +
>>> +print("All tests complete: %d failures" % failcount)
>>> +exit(failcount)
>> I also tried some manual testing:
>>    =E2=9E=9C  ./qemu-aarch64 -g 1234 tests/tcg/aarch64-linux-user/testth=
read
>>    fish: =E2=80=9C./qemu-aarch64 -g 1234 tests/tc=E2=80=A6=E2=80=9D term=
inated by signal SIGSEGV (Address boundary error)
>>    =F0=9F=95=9912:33:49 alex@zen:qemu.git/builds/arm.all  on =EE=82=A0 g=
dbstub/next [$!?=E2=87=A1] took 12s [=E2=9A=A1 SEGV]
>>    =E2=9C=97
>> where in the other window I did:
>>    0x00000000004005d0 in _start ()
>>    (gdb) hbreak thread2_func
>>    Hardware assisted breakpoint 1 at 0x400824: file /home/alex/lsrc/qemu=
.git/tests/tcg/multiarch/testthread.c, line 34.
>>    (gdb) hbreak thread1_func
>>    Hardware assisted breakpoint 2 at 0x400798: file /home/alex/lsrc/qemu=
.git/tests/tcg/multiarch/testthread.c, line 22.
>>    (gdb) c
>>    Continuing.
>>    [New Thread 1.2748248]
>>    Remote connection closed
>> which seems to indicate some problems with breaking on multiple
>> threads.
>> Maybe this is related to the weird output I was seeing above?
>>=20
>
> Yes, that's definitely related. What's happening is that the qemu does
> not stop other thread when one of them hits a breakpoint (or stops for
> any other reason) -- as far as I can tell it does not have any code
> which would even attempt to do that. This is why you're seeing the
> output even after the process is purportedly stopped.
>
> Things get even more interesting when you have two threads hitting a
> breakpoint simultaneously. At that point both of them will enter their
> gdb stubs and attempt to talk to gdb at the same time. As you can
> imagine, this cannot end well, and eventually the connection will
> become so messed up that one side just gives up and terminates the
> link.
>
> I am aware of this issue, and I (well, Stan (cc'ed) is, for the most
> part) looking for a way to fix it. If you have any ideas, we'd very
> much like to hear them. The way I see it, we need to implement some
> kind of a "stop the world" mechanism, to stop/interrupt all threads
> whenever the gdb stub becomes active (and make sure it can handle
> simultaneous debug events).

vm_stop(RUN_STATE_PAUSED) should do the trick. We do it elsewhere in
the gdbstub.

> However, I am don't know enough about qemu
> internals to tell how to actually go about doing that.
>
> My plan was to "get my feet wet" with a simple patch that improves the
> situation for the case when there are no simultaneous debug events,
> and eventually hopefully figure out a way how to address the bigger
> problem.

Great. Once you've made the changes I think the patch is ready to go in
and the larger questions can be dealt with later.

>
> regards,
> Pavel


--=20
Alex Benn=C3=A9e

