Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271A143B4E9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 16:55:58 +0200 (CEST)
Received: from localhost ([::1]:38884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfNrp-0002q6-6R
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 10:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1mfNpv-0000Vg-8L
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:53:59 -0400
Received: from kerio.kamp.de ([195.62.97.192]:46036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1mfNpp-0000sa-SL
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:53:58 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:53:44 +0200
Received: (qmail 51337 invoked from network); 26 Oct 2021 14:53:44 -0000
Received: from unknown (HELO ?172.20.250.22?) (pl@kamp.de@::ffff:172.20.250.22)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 26 Oct 2021 14:53:44 -0000
Subject: Re: [PATCH v5 0/6] block/rbd: migrate to coroutines and add write
 zeroes support
To: Kevin Wolf <kwolf@redhat.com>
References: <YObtGbd5jlQNUbn0@redhat.com>
 <77F23D4A-18B3-4367-9D4E-9710FA6269B2@kamp.de> <YOgjFRNxUH2GUXyN@redhat.com>
 <2f156d36-52f0-a375-cfe7-f17164b306ad@kamp.de>
 <32b18db2-0a39-2945-1d06-e189273062c2@kamp.de> <YXap8SAOT5Kb41E2@redhat.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <23e2ebe9-b600-cc60-0962-7e7d153a4d4d@kamp.de>
Date: Tue, 26 Oct 2021 16:53:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YXap8SAOT5Kb41E2@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.215,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Dryomov <idryomov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.10.21 um 14:58 schrieb Kevin Wolf:
> Am 25.10.2021 um 13:39 hat Peter Lieven geschrieben:
>> Am 16.09.21 um 14:34 schrieb Peter Lieven:
>>> Am 09.07.21 um 12:21 schrieb Kevin Wolf:
>>>> Am 08.07.2021 um 20:23 hat Peter Lieven geschrieben:
>>>>> Am 08.07.2021 um 14:18 schrieb Kevin Wolf <kwolf@redhat.com>:
>>>>>> Am 07.07.2021 um 20:13 hat Peter Lieven geschrieben:
>>>>>>>> Am 06.07.2021 um 17:25 schrieb Kevin Wolf <kwolf@redhat.com>:
>>>>>>>> Am 06.07.2021 um 16:55 hat Peter Lieven geschrieben:
>>>>>>>>> I will have a decent look after my vacation.
>>>>>>>> Sounds good, thanks. Enjoy your vacation!
>>>>>>> As I had to fire up my laptop to look into another issue anyway, I
>>>>>>> have sent two patches for updating MAINTAINERS and to fix the int vs.
>>>>>>> bool mix for task->complete.
>>>>>> I think you need to reevaluate your definition of vacation. ;-)
>>>>> Lets talk about this when the kids are grown up. Sometimes sending
>>>>> patches can be quite relaxing :-)
>>>> Heh, fair enough. :-)
>>>>
>>>>>> But thanks anyway.
>>>>>>
>>>>>>> As Paolos fix (5f50be9b5) is relatively new and there are maybe other
>>>>>>> non obvious problems when removing the BH indirection and we are close
>>>>>>> to soft freeze I would leave the BH removal change for 6.2.
>>>>>> Sure, code cleanups aren't urgent.
>>>>> Isn’t the indirection also a slight performance drop?
>>>> Yeah, I guess technically it is, though I doubt it's measurable.
>>>
>>> As promised I was trying to remove the indirection through the BH after Qemu 6.1 release.
>>>
>>> However, if I remove the BH I run into the following assertion while running some fio tests:
>>>
>>>
>>> qemu-system-x86_64: ../block/block-backend.c:1197: blk_wait_while_drained: Assertion `blk->in_flight > 0' failed.
>>>
>>>
>>> Any idea?
>>>
>>>
>>> This is what I changed:
>>>
>>>
>>> diff --git a/block/rbd.c b/block/rbd.c
>>> index 3cb24f9981..bc1dbc20f7 100644
>>> --- a/block/rbd.c
>>> +++ b/block/rbd.c
>>> @@ -1063,13 +1063,6 @@ static int qemu_rbd_resize(BlockDriverState *bs, uint64_t size)
>>>      return 0;
>>>  }
>>>
>>> -static void qemu_rbd_finish_bh(void *opaque)
>>> -{
>>> -    RBDTask *task = opaque;
>>> -    task->complete = true;
>>> -    aio_co_wake(task->co);
>>> -}
>>> -
>>>  /*
>>>   * This is the completion callback function for all rbd aio calls
>>>   * started from qemu_rbd_start_co().
>>> @@ -1083,8 +1076,8 @@ static void qemu_rbd_completion_cb(rbd_completion_t c, RBDTask *task)
>>>  {
>>>      task->ret = rbd_aio_get_return_value(c);
>>>      rbd_aio_release(c);
>>> -    aio_bh_schedule_oneshot(bdrv_get_aio_context(task->bs),
>>> -                            qemu_rbd_finish_bh, task);
>>> +    task->complete = true;
>>> +    aio_co_wake(task->co);
>>>  }
>> Kevin, Paolo, any idea?
> Not really, I don't see the connection between both places.
>
> Do you have a stack trace for the crash?


The crash seems not to be limited to that assertion. I have also seen:


qemu-system-x86_64: ../block/block-backend.c:1497: blk_aio_write_entry: Assertion `!qiov || qiov->size == acb->bytes' failed.


Altough harder to trigger I catch this backtrace in gdb:


qemu-system-x86_64: ../block/block-backend.c:1497: blk_aio_write_entry: Assertion `!qiov || qiov->size == acb->bytes' failed.
[Wechseln zu Thread 0x7ffff7fa8f40 (LWP 17852)]

Thread 1 "qemu-system-x86" hit Breakpoint 1, __GI_abort () at abort.c:49
49    abort.c: Datei oder Verzeichnis nicht gefunden.
(gdb) bt
#0  0x00007ffff42567e0 in __GI_abort () at abort.c:49
#1  0x00007ffff424648a in __assert_fail_base (fmt=0x7ffff43cd750 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=assertion@entry=0x555555e638e0 "!qiov || qiov->size == acb->bytes", file=file@entry=0x555555e634b2 "../block/block-backend.c", line=line@entry=1497, function=function@entry=0x555555e63b20 <__PRETTY_FUNCTION__.32450> "blk_aio_write_entry") at assert.c:92
#2  0x00007ffff4246502 in __GI___assert_fail (assertion=assertion@entry=0x555555e638e0 "!qiov || qiov->size == acb->bytes", file=file@entry=0x555555e634b2 "../block/block-backend.c", line=line@entry=1497, function=function@entry=0x555555e63b20 <__PRETTY_FUNCTION__.32450> "blk_aio_write_entry") at assert.c:101
#3  0x0000555555becc78 in blk_aio_write_entry (opaque=0x555556b534f0) at ../block/block-backend.c:1497
#4  0x0000555555cf0e4c in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:173
#5  0x00007ffff426e7b0 in __start_context () at /lib/x86_64-linux-gnu/libc.so.6
#6  0x00007fffffffd5a0 in  ()
#7  0x0000000000000000 in  ()


(gdb) thread apply all bt full

Thread 27 (Thread 0x7fffb89ff700 (LWP 17884)):
#0  0x00007ffff4614ad3 in futex_wait_cancelable (private=<optimized out>, expected=0, futex_word=0x5555571d9dec) at ../sysdeps/unix/sysv/linux/futex-internal.h:88
        __ret = -512
        oldtype = 0
        err = <optimized out>
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffb89eb1d0, __canceltype = 0, __prev = 0x0}
        cbuffer = {wseq = 1103, cond = 0x5555571d9dc0, mutex = 0x5555571d9df8, private = 0}
        err = <optimized out>
        g = 1
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 551
#1  0x00007ffff4614ad3 in __pthread_cond_wait_common (abstime=0x0, mutex=0x5555571d9df8, cond=0x5555571d9dc0) at pthread_cond_wait.c:502
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffb89eb1d0, __canceltype = 0, __prev = 0x0}
        cbuffer = {wseq = 1103, cond = 0x5555571d9dc0, mutex = 0x5555571d9df8, private = 0}
        err = <optimized out>
        g = 1
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 551
#2  0x00007ffff4614ad3 in __pthread_cond_wait (cond=cond@entry=0x5555571d9dc0, mutex=mutex@entry=0x5555571d9df8) at pthread_cond_wait.c:655
#3  0x0000555555ce0d0b in qemu_cond_wait_impl (cond=0x5555571d9dc0, mutex=0x5555571d9df8, file=0x555555d65554 "../ui/vnc-jobs.c", line=248) at ../util/qemu-thread-posix.c:194
        err = <optimized out>
        __PRETTY_FUNCTION__ = "qemu_cond_wait_impl"
        __func__ = "qemu_cond_wait_impl"
#4  0x000055555584d1e9 in vnc_worker_thread_loop (queue=queue@entry=0x5555571d9dc0) at ../ui/vnc-jobs.c:248
        _f = <optimized out>
        job = <optimized out>
        entry = <optimized out>
        tmp = <optimized out>
        vs = Python Exception <class 'gdb.error'> value of type `VncState' requires 66304 bytes, which is more than max-value-size:
#5  0x000055555584df48 in vnc_worker_thread (arg=arg@entry=0x5555571d9dc0) at ../ui/vnc-jobs.c:361
        queue = 0x5555571d9dc0
#6  0x0000555555ce05b6 in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:557
        __cancel_buf = {__cancel_jmp_buf = {{__cancel_jmp_buf = {93825029951232, -891796517554577268, 140736290863040, 0, 93825029951232, 140737488346704, 891927086486954124, 6428070804076404876}, __mask_was_saved = 0}}, __pad = {0x7fffb89fb710, 0x0, 0x0, 0x0}}
        __cancel_routine = 0x555555ce0610 <qemu_thread_atexit_notify>
        __not_first_call = <optimized out>
        qemu_thread_args = <optimized out>
        start_routine = 0x55555584df30 <vnc_worker_thread>
        arg = 0x5555571d9dc0
        r = <optimized out>
#7  0x00007ffff460e6db in start_thread (arg=0x7fffb89ff700) at pthread_create.c:463
        pd = 0x7fffb89ff700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736290879232, -891796517554577268, 140736290863040, 0, 93825029951232, 140737488346704, 891927086447108236, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#8  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 26 (Thread 0x7fffba7fc700 (LWP 17882)):
#0  0x00007ffff432c317 in ioctl () at ../sysdeps/unix/syscall-template.S:78
#1  0x0000555555b7a327 in kvm_vcpu_ioctl (cpu=cpu@entry=0x555556c49090, type=type@entry=44672) at ../accel/kvm/kvm-all.c:3020
        ret = <optimized out>
        arg = 0x0
        ap = {{gp_offset = 16, fp_offset = 32767, overflow_arg_area = 0x7fffba7f85a0, reg_save_area = 0x7fffba7f8530}}
#2  0x0000555555b7a49a in kvm_cpu_exec (cpu=cpu@entry=0x555556c49090) at ../accel/kvm/kvm-all.c:2846
        attrs = {unspecified = 0, secure = 0, user = 0, requester_id = 0, byte_swap = 0, target_tlb_bit0 = 0, target_tlb_bit1 = 0, target_tlb_bit2 = 0}
        run = <optimized out>
        ret = <optimized out>
        run_ret = <optimized out>
#3  0x0000555555b7b84d in kvm_vcpu_thread_fn (arg=arg@entry=0x555556c49090) at ../accel/kvm/kvm-accel-ops.c:49
        cpu = 0x555556c49090
        r = <optimized out>
#4  0x0000555555ce05b6 in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:557
        __cancel_buf = {__cancel_jmp_buf = {{__cancel_jmp_buf = {93825016352880, -891796517554577268, 140736322308032, 0, 93825016352880, 140737488345904, 891931759948243084, 6428070804076404876}, __mask_was_saved = 0}}, __pad = {0x7fffba7f8710, 0x0, 0x0, 0x0}}
        __cancel_routine = 0x555555ce0610 <qemu_thread_atexit_notify>
        __not_first_call = <optimized out>

        qemu_thread_args = <optimized out>
        start_routine = 0x555555b7b7b0 <kvm_vcpu_thread_fn>
        arg = 0x555556c49090
        r = <optimized out>
#5  0x00007ffff460e6db in start_thread (arg=0x7fffba7fc700) at pthread_create.c:463
        pd = 0x7fffba7fc700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736322324224, -891796517554577268, 140736322308032, 0, 93825016352880, 140737488345904, 891931759908397196, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 25 (Thread 0x7fffbaffd700 (LWP 17879)):
#0  0x00007ffff4615065 in futex_abstimed_wait_cancelable (private=<optimized out>, abstime=0x7fffbaff9670, expected=0, futex_word=0x7fffbc003288) at ../sysdeps/unix/sysv/linux/futex-internal.h:205
        __ret = -516
        oldtype = 0
        err = <optimized out>
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffbaff95c0, __canceltype = -1157654928, __prev = 0x0}
        cbuffer = {wseq = 212, cond = 0x7fffbc003260, mutex = 0x7fffb408d6a8, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        maxspin = 0
        signals = <optimized out>
        result = 0
        seq = 106
#1  0x00007ffff4615065 in __pthread_cond_wait_common (abstime=0x7fffbaff9670, mutex=0x7fffb408d6a8, cond=0x7fffbc003260) at pthread_cond_wait.c:539
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffbaff95c0, __canceltype = -1157654928, __prev = 0x0}
        cbuffer = {wseq = 212, cond = 0x7fffbc003260, mutex = 0x7fffb408d6a8, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        maxspin = 0
        signals = <optimized out>
        result = 0
        seq = 106
#2  0x00007ffff4615065 in __pthread_cond_timedwait (cond=0x7fffbc003260, mutex=0x7fffb408d6a8, abstime=0x7fffbaff9670) at pthread_cond_wait.c:667
#3  0x00007ffff54df350 in  () at /usr/lib/librbd.so.1
#4  0x00007ffff54f501d in  () at /usr/lib/librbd.so.1
#5  0x00007ffff460e6db in start_thread (arg=0x7fffbaffd700) at pthread_create.c:463
        pd = 0x7fffbaffd700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736330716928, -891796517554577268, 140736330700736, 0, 140736347517600, 140736448130592, 891930660933640332, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 24 (Thread 0x7fffbb7fe700 (LWP 17878)):
#0  0x00007ffff4614ad3 in futex_wait_cancelable (private=<optimized out>, expected=0, futex_word=0x7fffbc003320) at ../sysdeps/unix/sysv/linux/futex-internal.h:88
        __ret = -512
        oldtype = 0
        err = <optimized out>
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffbb7fa5c0, __canceltype = 1453715840, __prev = 0x0}
        cbuffer = {wseq = 553868, cond = 0x7fffbc0032f8, mutex = 0x7fffbc0032d0, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 276934
#1  0x00007ffff4614ad3 in __pthread_cond_wait_common (abstime=0x0, mutex=0x7fffbc0032d0, cond=0x7fffbc0032f8) at pthread_cond_wait.c:502
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffbb7fa5c0, __canceltype = 1453715840, __prev = 0x0}
        cbuffer = {wseq = 553868, cond = 0x7fffbc0032f8, mutex = 0x7fffbc0032d0, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>

        signals = <optimized out>
        result = 0
        seq = 276934
#2  0x00007ffff4614ad3 in __pthread_cond_wait (cond=0x7fffbc0032f8, mutex=0x7fffbc0032d0) at pthread_cond_wait.c:655
#3  0x00007fffe7bd48bc in std::condition_variable::wait(std::unique_lock<std::mutex>&) () at /usr/lib/x86_64-linux-gnu/libstdc++.so.6
#4  0x00007fffe81558bc in Finisher::finisher_thread_entry() () at /usr/lib/ceph/libceph-common.so.0
#5  0x00007ffff460e6db in start_thread (arg=0x7fffbb7fe700) at pthread_create.c:463
        pd = 0x7fffbb7fe700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736339109632, -891796517554577268, 140736339093440, 0, 140736347517856, 140736448130320, 891929559811399820, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 23 (Thread 0x7fffbbfff700 (LWP 17877)):
#0  0x00007ffff4614ad3 in futex_wait_cancelable (private=<optimized out>, expected=0, futex_word=0x7fffb400b108) at ../sysdeps/unix/sysv/linux/futex-internal.h:88
        __ret = -512
        oldtype = 0
        err = <optimized out>
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffbbffb5c0, __canceltype = 0, __prev = 0x0}
        cbuffer = {wseq = 0, cond = 0x7fffb400b0e0, mutex = 0x7fffb400b0b8, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 0
#1  0x00007ffff4614ad3 in __pthread_cond_wait_common (abstime=0x0, mutex=0x7fffb400b0b8, cond=0x7fffb400b0e0) at pthread_cond_wait.c:502
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffbbffb5c0, __canceltype = 0, __prev = 0x0}
        cbuffer = {wseq = 0, cond = 0x7fffb400b0e0, mutex = 0x7fffb400b0b8, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 0
#2  0x00007ffff4614ad3 in __pthread_cond_wait (cond=0x7fffb400b0e0, mutex=0x7fffb400b0b8) at pthread_cond_wait.c:655
#3  0x00007fffe7bd48bc in std::condition_variable::wait(std::unique_lock<std::mutex>&) () at /usr/lib/x86_64-linux-gnu/libstdc++.so.6
#4  0x00007fffe81558bc in Finisher::finisher_thread_entry() () at /usr/lib/ceph/libceph-common.so.0
#5  0x00007ffff460e6db in start_thread (arg=0x7fffbbfff700) at pthread_create.c:463
        pd = 0x7fffbbfff700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736347502336, -891796517554577268, 140736347486144, 0, 140736213332360, 140736456523312, 891928460836642956, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 22 (Thread 0x7fffc0ff9700 (LWP 17876)):
#0  0x00007ffff4614ad3 in futex_wait_cancelable (private=<optimized out>, expected=0, futex_word=0x7fffb400ae08) at ../sysdeps/unix/sysv/linux/futex-internal.h:88
        __ret = -512
        oldtype = 0
        err = <optimized out>
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffc0ff55d0, __canceltype = -1057008016, __prev = 0x0}
        cbuffer = {wseq = 0, cond = 0x7fffb400ade0, mutex = 0x7fffb4006bf0, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 0
#1  0x00007ffff4614ad3 in __pthread_cond_wait_common (abstime=0x0, mutex=0x7fffb4006bf0, cond=0x7fffb400ade0) at pthread_cond_wait.c:502
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffc0ff55d0, __canceltype = -1057008016, __prev = 0x0}
        cbuffer = {wseq = 0, cond = 0x7fffb400ade0, mutex = 0x7fffb4006bf0, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>

        signals = <optimized out>
        result = 0
        seq = 0
#2  0x00007ffff4614ad3 in __pthread_cond_wait (cond=0x7fffb400ade0, mutex=0x7fffb4006bf0) at pthread_cond_wait.c:655
#3  0x00007fffe81a20c5 in SafeTimer::timer_thread() () at /usr/lib/ceph/libceph-common.so.0
#4  0x00007fffe81a383d in SafeTimerThread::entry() () at /usr/lib/ceph/libceph-common.so.0
#5  0x00007ffff460e6db in start_thread (arg=0x7fffc0ff9700) at pthread_create.c:463
        pd = 0x7fffc0ff9700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736431363840, -891796517554577268, 140736431347648, 0, 140736213314176, 140736456523312, 891767926770278540, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 21 (Thread 0x7fffc17fa700 (LWP 17875)):
#0  0x00007ffff4615065 in futex_abstimed_wait_cancelable (private=<optimized out>, abstime=0x7fffc17f6670, expected=0, futex_word=0x5555567968ac) at ../sysdeps/unix/sysv/linux/futex-internal.h:205
        __ret = -516
        oldtype = 0
        err = <optimized out>
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffc17f65d0, __canceltype = -1048615312, __prev = 0x0}
        cbuffer = {wseq = 349, cond = 0x555556796880, mutex = 0x555556796958, private = 0}
        err = <optimized out>
        g = 1
        flags = <optimized out>
        maxspin = 0
        signals = <optimized out>
        result = 0
        seq = 174
#1  0x00007ffff4615065 in __pthread_cond_wait_common (abstime=0x7fffc17f6670, mutex=0x555556796958, cond=0x555556796880) at pthread_cond_wait.c:539
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffc17f65d0, __canceltype = -1048615312, __prev = 0x0}
        cbuffer = {wseq = 349, cond = 0x555556796880, mutex = 0x555556796958, private = 0}
        err = <optimized out>
        g = 1
        flags = <optimized out>
        maxspin = 0
        signals = <optimized out>
        result = 0
        seq = 174
#2  0x00007ffff4615065 in __pthread_cond_timedwait (cond=0x555556796880, mutex=0x555556796958, abstime=0x7fffc17f6670) at pthread_cond_wait.c:667
#3  0x00007fffe81a24f2 in SafeTimer::timer_thread() () at /usr/lib/ceph/libceph-common.so.0
#4  0x00007fffe81a383d in SafeTimerThread::entry() () at /usr/lib/ceph/libceph-common.so.0
#5  0x00007ffff460e6db in start_thread (arg=0x7fffc17fa700) at pthread_create.c:463
        pd = 0x7fffc17fa700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736439756544, -891796517554577268, 140736439740352, 0, 93825015256320, 140737488342304, 891766825648038028, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 20 (Thread 0x7fffc1ffb700 (LWP 17874)):
#0  0x00007ffff4615065 in futex_abstimed_wait_cancelable (private=<optimized out>, abstime=0x7fffc1ff7490, expected=0, futex_word=0x5555567bbd24) at ../sysdeps/unix/sysv/linux/futex-internal.h:205
        __ret = -516
        oldtype = 0
        err = <optimized out>
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffc1ff73b0, __canceltype = 0, __prev = 0x0}
        cbuffer = {wseq = 1339747, cond = 0x5555567bbcf8, mutex = 0x5555567bbcd0, private = 0}
        err = <optimized out>
        g = 1
        flags = <optimized out>
        maxspin = 0
        signals = <optimized out>
        result = 0
        seq = 669873
#1  0x00007ffff4615065 in __pthread_cond_wait_common (abstime=0x7fffc1ff7490, mutex=0x5555567bbcd0, cond=0x5555567bbcf8) at pthread_cond_wait.c:539
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffc1ff73b0, __canceltype = 0, __prev = 0x0}
        cbuffer = {wseq = 1339747, cond = 0x5555567bbcf8, mutex = 0x5555567bbcd0, private = 0}

        err = <optimized out>
        g = 1
        flags = <optimized out>
        maxspin = 0
        signals = <optimized out>
        result = 0
        seq = 669873
#2  0x00007ffff4615065 in __pthread_cond_timedwait (cond=0x5555567bbcf8, mutex=0x5555567bbcd0, abstime=0x7fffc1ff7490) at pthread_cond_wait.c:667
#3  0x00007fffe81b5946 in ThreadPool::worker(ThreadPool::WorkThread*) () at /usr/lib/ceph/libceph-common.so.0
#4  0x00007fffe81b6c61 in ThreadPool::WorkThread::entry() () at /usr/lib/ceph/libceph-common.so.0
#5  0x00007ffff460e6db in start_thread (arg=0x7fffc1ffb700) at pthread_create.c:463
        pd = 0x7fffc1ffb700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736448149248, -891796517554577268, 140736448133056, 0, 93825015298832, 140737488342448, 891765726673281164, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 19 (Thread 0x7fffc27fc700 (LWP 17873)):
#0  0x00007ffff4614ad3 in futex_wait_cancelable (private=<optimized out>, expected=0, futex_word=0x555556a09250) at ../sysdeps/unix/sysv/linux/futex-internal.h:88
        __ret = -512
        oldtype = 0
        err = <optimized out>
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffc27f85c0, __canceltype = -1031830016, __prev = 0x0}
        cbuffer = {wseq = 490660, cond = 0x555556a09228, mutex = 0x555556a09200, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 245330
#1  0x00007ffff4614ad3 in __pthread_cond_wait_common (abstime=0x0, mutex=0x555556a09200, cond=0x555556a09228) at pthread_cond_wait.c:502
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffc27f85c0, __canceltype = -1031830016, __prev = 0x0}
        cbuffer = {wseq = 490660, cond = 0x555556a09228, mutex = 0x555556a09200, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 245330
#2  0x00007ffff4614ad3 in __pthread_cond_wait (cond=0x555556a09228, mutex=0x555556a09200) at pthread_cond_wait.c:655
#3  0x00007fffe7bd48bc in std::condition_variable::wait(std::unique_lock<std::mutex>&) () at /usr/lib/x86_64-linux-gnu/libstdc++.so.6
#4  0x00007fffe81558bc in Finisher::finisher_thread_entry() () at /usr/lib/ceph/libceph-common.so.0
#5  0x00007ffff460e6db in start_thread (arg=0x7fffc27fc700) at pthread_create.c:463
        pd = 0x7fffc27fc700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736456541952, -891796517554577268, 140736456525760, 0, 93825013945040, 140737488342576, 891773430233997452, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 18 (Thread 0x7fffc2ffd700 (LWP 17872)):
#0  0x00007ffff4614ad3 in futex_wait_cancelable (private=<optimized out>, expected=0, futex_word=0x555556a090b0) at ../sysdeps/unix/sysv/linux/futex-internal.h:88
        __ret = -512
        oldtype = 0
        err = <optimized out>
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffc2ff95d0, __canceltype = -1023437200, __prev = 0x0}
        cbuffer = {wseq = 0, cond = 0x555556a09088, mutex = 0x555556a08ff0, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 0
#1  0x00007ffff4614ad3 in __pthread_cond_wait_common (abstime=0x0, mutex=0x555556a08ff0, cond=0x555556a09088) at pthread_cond_wait.c:502
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffc2ff95d0, __canceltype = -1023437200, __prev = 0x0}

        cbuffer = {wseq = 0, cond = 0x555556a09088, mutex = 0x555556a08ff0, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 0
#2  0x00007ffff4614ad3 in __pthread_cond_wait (cond=0x555556a09088, mutex=0x555556a08ff0) at pthread_cond_wait.c:655
#3  0x00007fffe81a20c5 in SafeTimer::timer_thread() () at /usr/lib/ceph/libceph-common.so.0
#4  0x00007fffe81a383d in SafeTimerThread::entry() () at /usr/lib/ceph/libceph-common.so.0
#5  0x00007ffff460e6db in start_thread (arg=0x7fffc2ffd700) at pthread_create.c:463
        pd = 0x7fffc2ffd700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736464934656, -891796517554577268, 140736464918464, 0, 93825014997344, 140737488342576, 891772331259240588, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 17 (Thread 0x7fffc37fe700 (LWP 17871)):
#0  0x00007ffff4614ad3 in futex_wait_cancelable (private=<optimized out>, expected=0, futex_word=0x555556a08d78) at ../sysdeps/unix/sysv/linux/futex-internal.h:88
        __ret = -512
        oldtype = 0
        err = <optimized out>
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffc37fa5d0, __canceltype = -1015044496, __prev = 0x0}
        cbuffer = {wseq = 0, cond = 0x555556a08d50, mutex = 0x555556a08cb0, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 0
#1  0x00007ffff4614ad3 in __pthread_cond_wait_common (abstime=0x0, mutex=0x555556a08cb0, cond=0x555556a08d50) at pthread_cond_wait.c:502
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffc37fa5d0, __canceltype = -1015044496, __prev = 0x0}
        cbuffer = {wseq = 0, cond = 0x555556a08d50, mutex = 0x555556a08cb0, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 0
#2  0x00007ffff4614ad3 in __pthread_cond_wait (cond=0x555556a08d50, mutex=0x555556a08cb0) at pthread_cond_wait.c:655
#3  0x00007fffe81a20c5 in SafeTimer::timer_thread() () at /usr/lib/ceph/libceph-common.so.0
#4  0x00007fffe81a383d in SafeTimerThread::entry() () at /usr/lib/ceph/libceph-common.so.0
#5  0x00007ffff460e6db in start_thread (arg=0x7fffc37fe700) at pthread_create.c:463
        pd = 0x7fffc37fe700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736473327360, -891796517554577268, 140736473311168, 0, 93825014995888, 140737488342544, 891771230137000076, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 16 (Thread 0x7fffc3fff700 (LWP 17870)):
#0  0x00007ffff4614ad3 in futex_wait_cancelable (private=<optimized out>, expected=0, futex_word=0x555556a0885c) at ../sysdeps/unix/sysv/linux/futex-internal.h:88
        __ret = -512
        oldtype = 0
        err = <optimized out>
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffc3ffb5c0, __canceltype = -735858672, __prev = 0x0}
        cbuffer = {wseq = 7, cond = 0x555556a08830, mutex = 0x555556a08808, private = 0}
        err = <optimized out>
        g = 1
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 3
#1  0x00007ffff4614ad3 in __pthread_cond_wait_common (abstime=0x0, mutex=0x555556a08808, cond=0x555556a08830) at pthread_cond_wait.c:502
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffc3ffb5c0, __canceltype = -735858672, __prev = 0x0}

        cbuffer = {wseq = 7, cond = 0x555556a08830, mutex = 0x555556a08808, private = 0}
        err = <optimized out>
        g = 1
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 3
#2  0x00007ffff4614ad3 in __pthread_cond_wait (cond=0x555556a08830, mutex=0x555556a08808) at pthread_cond_wait.c:655
#3  0x00007fffe7bd48bc in std::condition_variable::wait(std::unique_lock<std::mutex>&) () at /usr/lib/x86_64-linux-gnu/libstdc++.so.6
#4  0x00007fffe81558bc in Finisher::finisher_thread_entry() () at /usr/lib/ceph/libceph-common.so.0
#5  0x00007ffff460e6db in start_thread (arg=0x7fffc3fff700) at pthread_create.c:463
        pd = 0x7fffc3fff700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736481720064, -891796517554577268, 140736481703872, 0, 93825013942488, 140737488342432, 891770131162243212, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 15 (Thread 0x7fffd8ff9700 (LWP 17869)):
#0  0x00007ffff4615065 in futex_abstimed_wait_cancelable (private=<optimized out>, abstime=0x7fffd8ff5670, expected=0, futex_word=0x555556a08778) at ../sysdeps/unix/sysv/linux/futex-internal.h:205
        __ret = -516
        oldtype = 0
        err = <optimized out>
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffd8ff55d0, __canceltype = -654354943, __prev = 0x0}
        cbuffer = {wseq = 22, cond = 0x555556a08750, mutex = 0x555556a086f8, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        maxspin = 0
        signals = <optimized out>
        result = 0
        seq = 11
#1  0x00007ffff4615065 in __pthread_cond_wait_common (abstime=0x7fffd8ff5670, mutex=0x555556a086f8, cond=0x555556a08750) at pthread_cond_wait.c:539
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffd8ff55d0, __canceltype = -654354943, __prev = 0x0}
        cbuffer = {wseq = 22, cond = 0x555556a08750, mutex = 0x555556a086f8, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        maxspin = 0
        signals = <optimized out>
        result = 0
        seq = 11
#2  0x00007ffff4615065 in __pthread_cond_timedwait (cond=0x555556a08750, mutex=0x555556a086f8, abstime=0x7fffd8ff5670) at pthread_cond_wait.c:667
#3  0x00007fffe81a24f2 in SafeTimer::timer_thread() () at /usr/lib/ceph/libceph-common.so.0
#4  0x00007fffe81a383d in SafeTimerThread::entry() () at /usr/lib/ceph/libceph-common.so.0
#5  0x00007ffff460e6db in start_thread (arg=0x7fffd8ff9700) at pthread_create.c:463
        pd = 0x7fffd8ff9700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736834017024, -891796517554577268, 140736834000832, 0, 93825014947296, 140737488342432, 891715150212145292, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 14 (Thread 0x7fffd97fa700 (LWP 17868)):
#0  0x00007ffff4614ad3 in futex_wait_cancelable (private=<optimized out>, expected=0, futex_word=0x555556a4c720) at ../sysdeps/unix/sysv/linux/futex-internal.h:88
        __ret = -512
        oldtype = 0
        err = <optimized out>
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffd97f65c0, __canceltype = 0, __prev = 0x0}
        cbuffer = {wseq = 0, cond = 0x555556a4c6f8, mutex = 0x555556a4c6b8, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 0
#1  0x00007ffff4614ad3 in __pthread_cond_wait_common (abstime=0x0, mutex=0x555556a4c6b8, cond=0x555556a4c6f8) at pthread_cond_wait.c:502

        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffd97f65c0, __canceltype = 0, __prev = 0x0}
        cbuffer = {wseq = 0, cond = 0x555556a4c6f8, mutex = 0x555556a4c6b8, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 0
#2  0x00007ffff4614ad3 in __pthread_cond_wait (cond=0x555556a4c6f8, mutex=0x555556a4c6b8) at pthread_cond_wait.c:655
#3  0x00007fffe833966c in DispatchQueue::run_local_delivery() () at /usr/lib/ceph/libceph-common.so.0
#4  0x00007fffe83ebf4d in DispatchQueue::LocalDeliveryThread::entry() () at /usr/lib/ceph/libceph-common.so.0
#5  0x00007ffff460e6db in start_thread (arg=0x7fffd97fa700) at pthread_create.c:463
        pd = 0x7fffd97fa700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736842409728, -891796517554577268, 140736842393536, 0, 93825014220680, 140737488342544, 891714049089904780, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 13 (Thread 0x7fffd9ffb700 (LWP 17867)):
#0  0x00007ffff4614ad3 in futex_wait_cancelable (private=<optimized out>, expected=0, futex_word=0x555556a4c574) at ../sysdeps/unix/sysv/linux/futex-internal.h:88
        __ret = -512
        oldtype = 0
        err = <optimized out>
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffd9ff7280, __canceltype = 0, __prev = 0x0}
        cbuffer = {wseq = 35, cond = 0x555556a4c548, mutex = 0x555556a4c508, private = 0}
        err = <optimized out>
        g = 1
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 17
#1  0x00007ffff4614ad3 in __pthread_cond_wait_common (abstime=0x0, mutex=0x555556a4c508, cond=0x555556a4c548) at pthread_cond_wait.c:502
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffd9ff7280, __canceltype = 0, __prev = 0x0}
        cbuffer = {wseq = 35, cond = 0x555556a4c548, mutex = 0x555556a4c508, private = 0}
        err = <optimized out>
        g = 1
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 17
#2  0x00007ffff4614ad3 in __pthread_cond_wait (cond=0x555556a4c548, mutex=0x555556a4c508) at pthread_cond_wait.c:655
#3  0x00007fffe833a285 in DispatchQueue::entry() () at /usr/lib/ceph/libceph-common.so.0
#4  0x00007fffe83ebe3d in DispatchQueue::DispatchThread::entry() () at /usr/lib/ceph/libceph-common.so.0
#5  0x00007ffff460e6db in start_thread (arg=0x7fffd9ffb700) at pthread_create.c:463
        pd = 0x7fffd9ffb700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736850802432, -891796517554577268, 140736850786240, 0, 93825014220392, 140737488342512, 891712950115147916, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 12 (Thread 0x7fffda7fc700 (LWP 17866)):
#0  0x00007ffff4615065 in futex_abstimed_wait_cancelable (private=<optimized out>, abstime=0x7fffda7f8680, expected=0, futex_word=0x555556a61de4) at ../sysdeps/unix/sysv/linux/futex-internal.h:205
        __ret = -516
        oldtype = 0
        err = <optimized out>
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffda7f85f0, __canceltype = 1454415344, __prev = 0x0}
        cbuffer = {wseq = 49, cond = 0x555556a61db8, mutex = 0x555556a61d90, private = 0}
        err = <optimized out>
        g = 1
        flags = <optimized out>
        maxspin = 0
        signals = <optimized out>
        result = 0
        seq = 24

#1  0x00007ffff4615065 in __pthread_cond_wait_common (abstime=0x7fffda7f8680, mutex=0x555556a61d90, cond=0x555556a61db8) at pthread_cond_wait.c:539
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffda7f85f0, __canceltype = 1454415344, __prev = 0x0}
        cbuffer = {wseq = 49, cond = 0x555556a61db8, mutex = 0x555556a61d90, private = 0}
        err = <optimized out>
        g = 1
        flags = <optimized out>
        maxspin = 0
        signals = <optimized out>
        result = 0
        seq = 24
#2  0x00007ffff4615065 in __pthread_cond_timedwait (cond=0x555556a61db8, mutex=0x555556a61d90, abstime=0x7fffda7f8680) at pthread_cond_wait.c:667
#3  0x00007ffff4e7b354 in  () at /usr/lib/librados.so.2
#4  0x00007fffe7bda6df in  () at /usr/lib/x86_64-linux-gnu/libstdc++.so.6
#5  0x00007ffff460e6db in start_thread (arg=0x7fffda7fc700) at pthread_create.c:463
        pd = 0x7fffda7fc700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736859195136, -891796517554577268, 140736859178944, 0, 93825014218800, 140737488343248, 891720653675864204, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 11 (Thread 0x7fffdaffd700 (LWP 17865)):
#0  0x00007ffff4615065 in futex_abstimed_wait_cancelable (private=<optimized out>, abstime=0x7fffdaff96a0, expected=0, futex_word=0x555556a09610) at ../sysdeps/unix/sysv/linux/futex-internal.h:205
        __ret = -516
        oldtype = 0
        err = <optimized out>
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffdaff9610, __canceltype = -194944912, __prev = 0x0}
        cbuffer = {wseq = 44, cond = 0x555556a095e8, mutex = 0x555556a095c0, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        maxspin = 0
        signals = <optimized out>
        result = 0
        seq = 22
#1  0x00007ffff4615065 in __pthread_cond_wait_common (abstime=0x7fffdaff96a0, mutex=0x555556a095c0, cond=0x555556a095e8) at pthread_cond_wait.c:539
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffdaff9610, __canceltype = -194944912, __prev = 0x0}
        cbuffer = {wseq = 44, cond = 0x555556a095e8, mutex = 0x555556a095c0, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        maxspin = 0
        signals = <optimized out>
        result = 0
        seq = 22
#2  0x00007ffff4615065 in __pthread_cond_timedwait (cond=0x555556a095e8, mutex=0x555556a095c0, abstime=0x7fffdaff96a0) at pthread_cond_wait.c:667
#3  0x00007fffe81f2736 in CephContextServiceThread::entry() () at /usr/lib/ceph/libceph-common.so.0
#4  0x00007ffff460e6db in start_thread (arg=0x7fffdaffd700) at pthread_create.c:463
        pd = 0x7fffdaffd700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736867587840, -891796517554577268, 140736867571648, 0, 93825013945760, 140737488342320, 891719554701107340, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#5  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 6 (Thread 0x7fffdb7fe700 (LWP 17860)):
#0  0x00007ffff4337a47 in epoll_wait (epfd=15, events=0x555556abd660, maxevents=5000, timeout=30000) at ../sysdeps/unix/sysv/linux/epoll_wait.c:30
        resultvar = 18446744073709551612
        sc_cancel_oldtype = 0
#1  0x00007fffe8462a1e in EpollDriver::event_wait(std::vector<FiredFileEvent, std::allocator<FiredFileEvent> >&, timeval*) () at /usr/lib/ceph/libceph-common.so.0
#2  0x00007fffe8449723 in EventCenter::process_events(unsigned int, std::chrono::duration<unsigned long, std::ratio<1l, 1000000000l> >*) () at /usr/lib/ceph/libceph-common.so.0
#3  0x00007fffe844ea78 in  () at /usr/lib/ceph/libceph-common.so.0
#4  0x00007fffe7bda6df in  () at /usr/lib/x86_64-linux-gnu/libstdc++.so.6
#5  0x00007ffff460e6db in start_thread (arg=0x7fffdb7fe700) at pthread_create.c:463
        pd = 0x7fffdb7fe700
        now = <optimized out>
        unwind_buf =

              {cancel_jmp_buf = {{jmp_buf = {140736875980544, -891796517554577268, 140736875964352, 0, 93825014864512, 140737488342000, 891718453578866828, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 5 (Thread 0x7fffdbfff700 (LWP 17859)):
#0  0x00007ffff4337a47 in epoll_wait (epfd=12, events=0x555556a90870, maxevents=5000, timeout=30000) at ../sysdeps/unix/sysv/linux/epoll_wait.c:30
        resultvar = 18446744073709551612
        sc_cancel_oldtype = 0
#1  0x00007fffe8462a1e in EpollDriver::event_wait(std::vector<FiredFileEvent, std::allocator<FiredFileEvent> >&, timeval*) () at /usr/lib/ceph/libceph-common.so.0
#2  0x00007fffe8449723 in EventCenter::process_events(unsigned int, std::chrono::duration<unsigned long, std::ratio<1l, 1000000000l> >*) () at /usr/lib/ceph/libceph-common.so.0
#3  0x00007fffe844ea78 in  () at /usr/lib/ceph/libceph-common.so.0
#4  0x00007fffe7bda6df in  () at /usr/lib/x86_64-linux-gnu/libstdc++.so.6
#5  0x00007ffff460e6db in start_thread (arg=0x7fffdbfff700) at pthread_create.c:463
        pd = 0x7fffdbfff700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736884373248, -891796517554577268, 140736884357056, 0, 93825014863888, 140737488342000, 891717354604109964, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 4 (Thread 0x7fffe0bc1700 (LWP 17858)):
#0  0x00007ffff4337a47 in epoll_wait (epfd=9, events=0x555556a63d10, maxevents=5000, timeout=30000) at ../sysdeps/unix/sysv/linux/epoll_wait.c:30
        resultvar = 18446744073709551612
        sc_cancel_oldtype = 0
#1  0x00007fffe8462a1e in EpollDriver::event_wait(std::vector<FiredFileEvent, std::allocator<FiredFileEvent> >&, timeval*) () at /usr/lib/ceph/libceph-common.so.0
#2  0x00007fffe8449723 in EventCenter::process_events(unsigned int, std::chrono::duration<unsigned long, std::ratio<1l, 1000000000l> >*) () at /usr/lib/ceph/libceph-common.so.0
#3  0x00007fffe844ea78 in  () at /usr/lib/ceph/libceph-common.so.0
#4  0x00007fffe7bda6df in  () at /usr/lib/x86_64-linux-gnu/libstdc++.so.6
#5  0x00007ffff460e6db in start_thread (arg=0x7fffe0bc1700) at pthread_create.c:463
        pd = 0x7fffe0bc1700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736963811072, -891796517554577268, 140736963794880, 0, 93825014863312, 140737488342000, 891838883924975756, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 3 (Thread 0x7fffe1bbb700 (LWP 17857)):
#0  0x00007ffff4614ad3 in futex_wait_cancelable (private=<optimized out>, expected=0, futex_word=0x5555568e0cd8) at ../sysdeps/unix/sysv/linux/futex-internal.h:88
        __ret = -512
        oldtype = 0
        err = <optimized out>
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffe1bb7630, __canceltype = -194959278, __prev = 0x0}
        cbuffer = {wseq = 256, cond = 0x5555568e0cb0, mutex = 0x5555568e0c30, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 128
#1  0x00007ffff4614ad3 in __pthread_cond_wait_common (abstime=0x0, mutex=0x5555568e0c30, cond=0x5555568e0cb0) at pthread_cond_wait.c:502
        spin = 0
        buffer = {__routine = 0x7ffff4614770 <__condvar_cleanup_waiting>, __arg = 0x7fffe1bb7630, __canceltype = -194959278, __prev = 0x0}
        cbuffer = {wseq = 256, cond = 0x5555568e0cb0, mutex = 0x5555568e0c30, private = 0}
        err = <optimized out>
        g = 0
        flags = <optimized out>
        signals = <optimized out>
        result = 0
        seq = 128
#2  0x00007ffff4614ad3 in __pthread_cond_wait (cond=0x5555568e0cb0, mutex=0x5555568e0c30) at pthread_cond_wait.c:655
#3  0x00007fffe7bd48bc in std::condition_variable::wait(std::unique_lock<std::mutex>&) () at /usr/lib/x86_64-linux-gnu/libstdc++.so.6
#4  0x00007fffe8493daf in ceph::logging::Log::entry() () at /usr/lib/ceph/libceph-common.so.0
#5  0x00007ffff460e6db in start_thread (arg=0x7fffe1bbb700) at pthread_create.c:463
        pd = 0x7fffe1bbb700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140736980563712, -891796517554577268, 140736980547520, 0, 93825012730880, 140737488342688, 891836679533011084, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}

        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 2 (Thread 0x7fffe300f700 (LWP 17856)):
#0  0x00007ffff4331639 in syscall () at ../sysdeps/unix/sysv/linux/x86_64/syscall.S:38
#1  0x0000555555ce140b in qemu_futex_wait (val=<optimized out>, f=<optimized out>) at /home/lieven/git/qemu-6.0.0/include/qemu/futex.h:29
        value = <optimized out>
        __PRETTY_FUNCTION__ = "qemu_event_wait"
#2  0x0000555555ce140b in qemu_event_wait (ev=ev@entry=0x55555666f268 <rcu_call_ready_event>) at ../util/qemu-thread-posix.c:480
        value = <optimized out>
        __PRETTY_FUNCTION__ = "qemu_event_wait"
#3  0x0000555555ce9258 in call_rcu_thread (opaque=opaque@entry=0x0) at ../util/rcu.c:258
        tries = 0
        n = <optimized out>
        node = <optimized out>
#4  0x0000555555ce05b6 in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:557
        __cancel_buf = {__cancel_jmp_buf = {{__cancel_jmp_buf = {93825010610432, -891796517554577268, 140737001863104, 0, 93825010610432, 140737488347232, 891842243702988940, 6428070804076404876}, __mask_was_saved = 0}}, __pad = {0x7fffe300b710, 0x0, 0x0, 0x0}}
        __cancel_routine = 0x555555ce0610 <qemu_thread_atexit_notify>
        __not_first_call = <optimized out>
        qemu_thread_args = <optimized out>
        start_routine = 0x555555ce9200 <call_rcu_thread>
        arg = 0x0
        r = <optimized out>
#5  0x00007ffff460e6db in start_thread (arg=0x7fffe300f700) at pthread_create.c:463
        pd = 0x7fffe300f700
        now = <optimized out>
        unwind_buf =
              {cancel_jmp_buf = {{jmp_buf = {140737001879296, -891796517554577268, 140737001863104, 0, 93825010610432, 140737488347232, 891842243663143052, 891812829063979148}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x0, 0x0}, data = {prev = 0x0, cleanup = 0x0, canceltype = 0}}}
        not_first_call = <optimized out>
#6  0x00007ffff433771f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 1 (Thread 0x7ffff7fa8f40 (LWP 17852)):
#0  0x00007ffff42567e0 in __GI_abort () at abort.c:49
        act =
          {__sigaction_handler = {sa_handler = 0x555556a4e240, sa_sigaction = 0x555556a4e240}, sa_mask = {__val = {0, 0, 0, 0, 140733912637160, 0, 0, 5, 140733912636992, 140737291030896, 140737291016016, 0, 3954949963032095744, 140737291000980, 0, 140737291016016}}, sa_flags = 1441150130, sa_restorer = 0x555555e638e0}
        sigs =
            {__val = {93825001732896, 140737291011849, 93825001731250, 3954949963032095744, 140737293330048, 93825001731250, 93825001732320, 1497, 140737291016016, 140737289732025, 206158430232, 140733912637232, 140733912637040, 3954949963032095744, 93825001731250, 1497}}
#1  0x00007ffff424648a in __assert_fail_base (fmt=0x7ffff43cd750 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=assertion@entry=0x555555e638e0 "!qiov || qiov->size == acb->bytes", file=file@entry=0x555555e634b2 "../block/block-backend.c", line=line@entry=1497, function=function@entry=0x555555e63b20 <__PRETTY_FUNCTION__.32450> "blk_aio_write_entry") at assert.c:92
        str = 0x555556a4e240 "\320\361mWUU"
        total = 4096
#2  0x00007ffff4246502 in __GI___assert_fail (assertion=assertion@entry=0x555555e638e0 "!qiov || qiov->size == acb->bytes", file=file@entry=0x555555e634b2 "../block/block-backend.c", line=line@entry=1497, function=function@entry=0x555555e63b20 <__PRETTY_FUNCTION__.32450> "blk_aio_write_entry") at assert.c:101
#3  0x0000555555becc78 in blk_aio_write_entry (opaque=0x555556b534f0) at ../block/block-backend.c:1497
        acb = 0x555556b534f0
        rwco = 0x555556b53518
        qiov = <optimized out>
        opaque = 0x555556b534f0
        acb = 0x555556b534f0
        rwco = 0x555556b53518
        qiov = <optimized out>
#4  0x0000555555cf0e4c in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:173
        arg = <optimized out>
        self = <optimized out>
        co = 0x5555570f73a0
#5  0x00007ffff426e7b0 in __start_context () at /lib/x86_64-linux-gnu/libc.so.6
#6  0x00007fffffffd5a0 in  ()
#7  0x0000000000000000 in  ()




