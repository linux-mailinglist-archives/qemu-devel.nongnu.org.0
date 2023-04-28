Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4586F12E5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 09:54:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psIve-0003ed-9l; Fri, 28 Apr 2023 03:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1psIvZ-0003dx-Gm; Fri, 28 Apr 2023 03:54:01 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1psIvT-0006HD-Vz; Fri, 28 Apr 2023 03:54:01 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 4F09A45DFE;
 Fri, 28 Apr 2023 09:53:53 +0200 (CEST)
Message-ID: <39c503bc-fcc1-9dd9-c39e-efadc35bd97f@proxmox.com>
Date: Fri, 28 Apr 2023 09:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: QMP (without OOB) function running in thread different from the
 main thread as part of aio_poll
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Michael Roth <michael.roth@amd.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
References: <2a61b581-5a21-c945-bb98-b6863cac0c1f@proxmox.com>
 <877cu7gk1g.fsf@pond.sub.org>
 <CABgObfapoyrFhY9kna_=D7PJ4yAssTgzY3jxSZD=6v0zCGDcSA@mail.gmail.com>
 <3ba2f8b9-9818-6601-2247-7b0e20d7ab0d@proxmox.com>
 <ZEpWd+273aIVZrRV@redhat.com>
 <515e6a39-8515-b32b-05ce-6d7511779b1b@proxmox.com>
 <87zg6tbdep.fsf@secure.mitica> <ZEqNFKB09PGdsIVO@x1n>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <ZEqNFKB09PGdsIVO@x1n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 27.04.23 um 16:56 schrieb Peter Xu:
> On Thu, Apr 27, 2023 at 04:36:14PM +0200, Juan Quintela wrote:
>> Fiona Ebner <f.ebner@proxmox.com> wrote:
>>> Am 27.04.23 um 13:03 schrieb Kevin Wolf:
>>>> Am 26.04.2023 um 16:31 hat Fiona Ebner geschrieben:
>>>>> Am 20.04.23 um 08:55 schrieb Paolo Bonzini:
>>
>> Hi
>>
>>> Our function is a custom variant of saving a snapshot and uses
>>> qemu_savevm_state_setup(), which is why the qemu_mutex_unlock_iothread()
>>> is there. I looked for inspiration for how upstream does things and it
>>> turns out that upstream QEMU v8.0.0 has essentially the same issue with
>>> snapshot-save. When snapshot_save_job_bh runs in a vCPU thread instead
>>> of the main thread, the situation is the same: after
>>> qemu_mutex_unlock_iothread(), qemu_get_current_aio_context() will return
>>> 0x0 and then the assertion in the AIO_WAIT_WHILE_INTERNAL macro fails
>>> (this time the generated coroutine wrapper is bdrv_writev_vmstate)[0].
>>>
>>>
>>> So all bottom halves scheduled for the main thread's AioContext can
>>> potentially get to run in a vCPU thread and need to be very careful with
>>> things like qemu_mutex_unlock_iothread.
>>>
>>> Is qemu_get_current_aio_context() returning 0x0 expected? I haven't
>>> looked into why it happens yet. Does there need to be a way to drop the
>>> BQL without also giving up the main thread's AioContext or would it be
>>> enough to re-acquire the context?
>>>
>>> CC-ing Juan as the migration maintainer.
>>
>> This is the world backwards.
>> The tradition is that migration people blame block layer people for
>> breaking things and for help, not the other way around O:-)
>>
>>> Best Regards,
>>> Fiona
>>>
>>> [0]:
>>>> Thread 21 "CPU 0/KVM" received signal SIGABRT, Aborted.
>>>> __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
>>>> 50	../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
>>>> (gdb) bt
>>>> #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
>>>> #1  0x00007f9027b3e537 in __GI_abort () at abort.c:79
>>>> #2 0x00007f9027b3e40f in __assert_fail_base (fmt=0x7f9027cb66a8
>>>> "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n",
>>>> assertion=0x558ed44fcec0 "qemu_get_current_aio_context() ==
>>>> qemu_get_aio_context()", file=0x558ed44fce80
>>>> "/home/febner/repos/qemu/block/block-gen.h", line=43,
>>>> function=<optimized out>) at assert.c:92
>>>> #3 0x00007f9027b4d662 in __GI___assert_fail
>>>> (assertion=0x558ed44fcec0 "qemu_get_current_aio_context() ==
>>>> qemu_get_aio_context()", file=0x558ed44fce80
>>>> "/home/febner/repos/qemu/block/block-gen.h", line=43,
>>>> function=0x558ed44fcf80 <__PRETTY_FUNCTION__.14> "bdrv_poll_co") at
>>>> assert.c:101
>>>> #4  0x0000558ed412df5f in bdrv_poll_co (s=0x7f8ffcff37a0) at /home/febner/repos/qemu/block/block-gen.h:43
>>>> #5  0x0000558ed412f4cd in bdrv_writev_vmstate (bs=0x558ed60536a0, qiov=0x7f8ffcff3840, pos=0) at block/block-gen.c:809
>>>> #6 0x0000558ed3df36d0 in qio_channel_block_writev
>>>> (ioc=0x7f8ff40ac060, iov=0x7f8ff43f6350, niov=1, fds=0x0, nfds=0,
>>>> flags=0, errp=0x7f8ffcff39c0) at ../migration/channel-block.c:89
>>>> #7 0x0000558ed40feedb in qio_channel_writev_full
>>>> (ioc=0x7f8ff40ac060, iov=0x7f8ff43f6350, niov=1, fds=0x0, nfds=0,
>>>> flags=0, errp=0x7f8ffcff39c0) at ../io/channel.c:108
>>>> #8 0x0000558ed40ff3c3 in qio_channel_writev_full_all
>>>> (ioc=0x7f8ff40ac060, iov=0x7f8ff4648040, niov=1, fds=0x0, nfds=0,
>>>> flags=0, errp=0x7f8ffcff39c0) at ../io/channel.c:263
>>>> #9 0x0000558ed40ff2e4 in qio_channel_writev_all (ioc=0x7f8ff40ac060,
>>>> iov=0x7f8ff4648040, niov=1, errp=0x7f8ffcff39c0) at
>>>> ../io/channel.c:242
>>>> #10 0x0000558ed3dee4dc in qemu_fflush (f=0x7f8ff4640000) at ../migration/qemu-file.c:302
>>>> #11 0x0000558ed4050f91 in ram_save_setup (f=0x7f8ff4640000, opaque=0x558ed4ca34c0 <ram_state>) at ../migration/ram.c:3302
>>>> #12 0x0000558ed3e141c8 in qemu_savevm_state_setup (f=0x7f8ff4640000) at ../migration/savevm.c:1266
>>>> #13 0x0000558ed3e14eed in qemu_savevm_state (f=0x7f8ff4640000, errp=0x558ed68c5238) at ../migration/savevm.c:1626
>>>> #14 0x0000558ed3e1755e in save_snapshot (name=0x558ed72af790
>>>> "snap0", overwrite=false, vmstate=0x558ed6708ce0 "scsi0",
>>>> has_devices=true, devices=0x558ed66d6a60, errp=0x558ed68c5238) at
>>>> ../migration/savevm.c:2954
>>>> #15 0x0000558ed3e17fb1 in snapshot_save_job_bh (opaque=0x558ed68c5170) at ../migration/savevm.c:3253
>>>> #16 0x0000558ed42f050a in aio_bh_call (bh=0x558ed671ae00) at ../util/async.c:155
>>>> #17 0x0000558ed42f0615 in aio_bh_poll (ctx=0x558ed5c62910) at ../util/async.c:184
>>>> #18 0x0000558ed42d47b8 in aio_poll (ctx=0x558ed5c62910, blocking=true) at ../util/aio-posix.c:721
>>>> #19 0x0000558ed412df1c in bdrv_poll_co (s=0x7f8ffcff3eb0) at /home/febner/repos/qemu/block/block-gen.h:43
>>>> #20 0x0000558ed4130c3a in blk_pwrite (blk=0x558ed5ed4f60,
>>>> offset=230912, bytes=512, buf=0x7f8ffc438600, flags=0) at
>>>> block/block-gen.c:1650
>>>> #21 0x0000558ed3ba9078 in pflash_update (pfl=0x558ed5eb7b30, offset=230912, size=1) at ../hw/block/pflash_cfi01.c:394
>>>> #22 0x0000558ed3ba9749 in pflash_write (pfl=0x558ed5eb7b30,
>>>> offset=231232, value=0, width=1, be=0) at
>>>> ../hw/block/pflash_cfi01.c:522
>>>> #23 0x0000558ed3ba9cda in pflash_mem_write_with_attrs
>>>> (opaque=0x558ed5eb7b30, addr=231232, value=0, len=1, attrs=...) at
>>>> ../hw/block/pflash_cfi01.c:681
>>>> #24 0x0000558ed402a36a in memory_region_write_with_attrs_accessor
>>>> (mr=0x558ed5eb7ef0, addr=231232, value=0x7f8ffcff40c8, size=1,
>>>> shift=0, mask=255, attrs=...) at ../softmmu/memory.c:514
>>>> #25 0x0000558ed402a4a9 in access_with_adjusted_size (addr=231232,
>>>> value=0x7f8ffcff40c8, size=1, access_size_min=1, access_size_max=4,
>>>> access_fn=0x558ed402a270 <memory_region_write_with_attrs_accessor>,
>>>> mr=0x558ed5eb7ef0, attrs=...) at ../softmmu/memory.c:555
>>>> #26 0x0000558ed402d5de in memory_region_dispatch_write
>>>> (mr=0x558ed5eb7ef0, addr=231232, data=0, op=MO_8, attrs=...) at
>>>> ../softmmu/memory.c:1522
>>>> #27 0x0000558ed403a6f4 in flatview_write_continue
>>>> (fv=0x558ed66d62c0, addr=4291004224, attrs=..., ptr=0x7f9029957028,
>>>> len=1, addr1=231232, l=1, mr=0x558ed5eb7ef0) at
>>>> ../softmmu/physmem.c:2641
>>>> #28 0x0000558ed403a857 in flatview_write (fv=0x558ed66d62c0,
>>>> addr=4291004224, attrs=..., buf=0x7f9029957028, len=1) at
>>>> ../softmmu/physmem.c:2683
>>>> #29 0x0000558ed403ac07 in address_space_write (as=0x558ed4ca2b20
>>>> <address_space_memory>, addr=4291004224, attrs=...,
>>>> buf=0x7f9029957028, len=1) at ../softmmu/physmem.c:2779
>>>> #30 0x0000558ed403ac74 in address_space_rw (as=0x558ed4ca2b20
>>>> <address_space_memory>, addr=4291004224, attrs=...,
>>>> buf=0x7f9029957028, len=1, is_write=true) at
>>>> ../softmmu/physmem.c:2789
>>>> #31 0x0000558ed40cea88 in kvm_cpu_exec (cpu=0x558ed622a910) at ../accel/kvm/kvm-all.c:2989
>>>> #32 0x0000558ed40d179a in kvm_vcpu_thread_fn (arg=0x558ed622a910) at ../accel/kvm/kvm-accel-ops.c:51
>>>> #33 0x0000558ed42d925f in qemu_thread_start (args=0x558ed5c68c80) at ../util/qemu-thread-posix.c:541
>>>> #34 0x00007f9028ab7ea7 in start_thread (arg=<optimized out>) at pthread_create.c:477
>>>> #35 0x00007f9027c18a2f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
> 
> Totally unfamiliar with block jobs, but... does it mean that
> snapshot_*_job_bh()s should just always make sure BQL taken?
> 

It is taken in the beginning, but qemu_savevm_state drops it. I suppose
there is a good reason for it, because when patching out the
qemu_mutex_unlock_iothread call, I get
../softmmu/cpus.c:503:qemu_mutex_lock_iothread_impl: assertion failed:
(!qemu_mutex_iothread_locked())when using the snapshot-save QMP command.

To avoid the assertion failure from the backtrace, I think it would be
enough to ensure still having acquired the main thread's AioContext
between the qemu_mutex_unlock_iothread and qemu_mutex_lock_iothread
calls (which currently is not the case when snapshot_save_job_bh runs in
a vCPU thread). But not sure if that is enough for full correctness.

Best Regards,
Fiona


