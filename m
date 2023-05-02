Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902956F418A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:26:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnCa-0001TX-8l; Tue, 02 May 2023 06:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1ptnCK-0001SQ-6e; Tue, 02 May 2023 06:25:28 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1ptnCE-0004Be-9g; Tue, 02 May 2023 06:25:27 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 5DC7D46EC0;
 Tue,  2 May 2023 12:25:19 +0200 (CEST)
Message-ID: <31757c45-695d-4408-468c-c2de560aff9c@proxmox.com>
Date: Tue, 2 May 2023 12:25:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: QMP (without OOB) function running in thread different from the
 main thread as part of aio_poll
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
To: quintela@redhat.com, Kevin Wolf <kwolf@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Michael Roth <michael.roth@amd.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, Peter Xu <peterx@redhat.com>
References: <877cu7gk1g.fsf@pond.sub.org>
 <CABgObfapoyrFhY9kna_=D7PJ4yAssTgzY3jxSZD=6v0zCGDcSA@mail.gmail.com>
 <3ba2f8b9-9818-6601-2247-7b0e20d7ab0d@proxmox.com>
 <ZEpWd+273aIVZrRV@redhat.com>
 <515e6a39-8515-b32b-05ce-6d7511779b1b@proxmox.com>
 <87zg6tbdep.fsf@secure.mitica>
 <b1402ecd-1288-1ceb-ce58-65fc90636fac@proxmox.com>
 <87bkj8bg8g.fsf@secure.mitica> <ZEuEIhe86udi38kx@redhat.com>
 <87354kbdvc.fsf@secure.mitica> <ZEu6lVDVUh8AC6Af@redhat.com>
 <87jzxw9cco.fsf@secure.mitica>
 <df3b995e-884c-8e3c-e0cf-b720ff4fff56@proxmox.com>
In-Reply-To: <df3b995e-884c-8e3c-e0cf-b720ff4fff56@proxmox.com>
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

Am 02.05.23 um 12:03 schrieb Fiona Ebner:
> Am 28.04.23 um 18:54 schrieb Juan Quintela:
>> Kevin Wolf <kwolf@redhat.com> wrote:
>>> Am 28.04.2023 um 10:38 hat Juan Quintela geschrieben:
>>>> Kevin Wolf <kwolf@redhat.com> wrote:
>>>>>> I am perhaps a bit ingenuous here, but it is there a way to convince
>>>>>> qemu that snapshot_save_job_bh *HAS* to run on the main thread?
>>>>>
>>>>> I believe we're talking about a technicality here. I asked another more
>>>>> fundamental question that nobody has answered yet:
>>>>>
>>>>> Why do you think that it's ok to call bdrv_writev_vmstate() without
>>>>> holding the BQL?
>>>>
>>>> I will say this function starts by bdrv_ (i.e. block layer people) and
>>>> endes with _vmstate (i.e. migration people).
>>>>
>>>> To be honest, I don't know.  That is why I _supposed_ you have an idea.
>>>
>>> My idea is that bdrv_*() can only be called when you hold the BQL, or
>>> for BlockDriverStates in an iothread the AioContext lock.
>>>
>>> Apparently dropping the BQL in migration code was introduced in Paolo's
>>> commit 9b095037527.
>>
>> Damn.  I reviewed it, so I am as guilty as the author.
>> 10 years later without problems I will not blame that patch.
>>
>> I guess we changed something else that broke doing it without the lock.
>>
>> But no, I still don't have suggestions/ideas.
>>
> 
> I do feel like the issue might be very difficult to trigger under normal
> circumstances. Depending on the configuration and what you do in the
> guest, aio_poll in a vCPU thread does not happen often and I imagine
> snapshot-save is also not a super frequent operation for most people. It
> still takes me a while to trigger the issue by issuing lots of pflash
> writes and running snapshot-save in a loop, I'd guess about 30-60
> snapshots. Another reason might be that generated co-wrappers were less
> common in the past?
> 
>>> I'm not sure what this was supposed to improve in
>>> the case of snapshots because the VM is stopped anyway.
> 
> Is it? Quoting Juan:> d- snapshots are a completely different beast,
> that don't really stop
>>    the guest in the same way at that point, and sometimes it shows in
>>    this subtle details.
> 
>>> Would anything bad happen if we removed the BQL unlock/lock section in
>>> qemu_savevm_state() again?
>>
>> Dunno.
>>
>> For what is worth, I can say that it survives migration-test, but don't
>> ask me why/how/...
>>
>> Fiona, can you check if it fixes your troubles?
>>
> 
> Just removing the single section in qemu_savevm_state() breaks even the
> case where snapshot_save_job_bh() is executed in the main thread,
> because ram_init_bitmaps() will call qemu_mutex_lock_iothread_impl()
> which asserts that it's not already locked.
> 
> Also removing the lock/unlock pair in ram_init_bitmaps() seems to work. 

Well, after a few more attempts, I got a new failure (running with the
two changes mentioned above), but it seems to happen later and, at a
first glance, doesn't seem to be related to the lock anymore:

> qemu-system-x86_64: ../hw/net/virtio-net.c:3811: virtio_net_pre_save: Assertion `!n->vhost_started' failed.

> (gdb) call qemu_mutex_iothread_locked()
> $1 = true

Backtrace:

> Thread 21 "CPU 0/KVM" received signal SIGABRT, Aborted.
> [Switching to Thread 0x7fd291ffb700 (LWP 136620)]
> __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> 50	../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
> (gdb) bt
> #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> #1  0x00007fd2b8b3e537 in __GI_abort () at abort.c:79
> #2  0x00007fd2b8b3e40f in __assert_fail_base (fmt=0x7fd2b8cb66a8 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x557e0ebb7193 "!n->vhost_started", file=0x557e0ebb65f0 "../hw/net/virtio-net.c", line=3811, function=<optimized out>) at assert.c:92
> #3  0x00007fd2b8b4d662 in __GI___assert_fail (assertion=0x557e0ebb7193 "!n->vhost_started", file=0x557e0ebb65f0 "../hw/net/virtio-net.c", line=3811, function=0x557e0ebb7740 <__PRETTY_FUNCTION__.3> "virtio_net_pre_save") at assert.c:101
> #4  0x0000557e0e6c21c9 in virtio_net_pre_save (opaque=0x557e12c480b0) at ../hw/net/virtio-net.c:3811
> #5  0x0000557e0e4f63ee in vmstate_save_state_v (f=0x7fd28442f730, vmsd=0x557e0efb53c0 <vmstate_virtio_net>, opaque=0x557e12c480b0, vmdesc=0x7fd2840978e0, version_id=11) at ../migration/vmstate.c:330
> #6  0x0000557e0e4f6390 in vmstate_save_state (f=0x7fd28442f730, vmsd=0x557e0efb53c0 <vmstate_virtio_net>, opaque=0x557e12c480b0, vmdesc_id=0x7fd2840978e0) at ../migration/vmstate.c:318
> #7  0x0000557e0e51c80a in vmstate_save (f=0x7fd28442f730, se=0x557e12c4c430, vmdesc=0x7fd2840978e0) at ../migration/savevm.c:1000
> #8  0x0000557e0e51d942 in qemu_savevm_state_complete_precopy_non_iterable (f=0x7fd28442f730, in_postcopy=false, inactivate_disks=false) at ../migration/savevm.c:1463
> #9  0x0000557e0e51db33 in qemu_savevm_state_complete_precopy (f=0x7fd28442f730, iterable_only=false, inactivate_disks=false) at ../migration/savevm.c:1529
> #10 0x0000557e0e51df3d in qemu_savevm_state (f=0x7fd28442f730, errp=0x7fd28425e1f8) at ../migration/savevm.c:1635
> #11 0x0000557e0e520548 in save_snapshot (name=0x7fd28425e2b0 "snap0", overwrite=false, vmstate=0x7fd284479c20 "scsi0", has_devices=true, devices=0x7fd284097920, errp=0x7fd28425e1f8) at ../migration/savevm.c:2952
> #12 0x0000557e0e520f9b in snapshot_save_job_bh (opaque=0x7fd28425e130) at ../migration/savevm.c:3251
> #13 0x0000557e0e9f94de in aio_bh_call (bh=0x7fd2844703f0) at ../util/async.c:155
> #14 0x0000557e0e9f95e9 in aio_bh_poll (ctx=0x557e110ae910) at ../util/async.c:184
> #15 0x0000557e0e9dd78c in aio_poll (ctx=0x557e110ae910, blocking=true) at ../util/aio-posix.c:721
> #16 0x0000557e0e836ef0 in bdrv_poll_co (s=0x7fd291ff5eb0) at /home/febner/repos/qemu/block/block-gen.h:43
> #17 0x0000557e0e839c0e in blk_pwrite (blk=0x557e11320f40, offset=58880, bytes=512, buf=0x7fd290c0e600, flags=0) at block/block-gen.c:1650
> #18 0x0000557e0e2b2078 in pflash_update (pfl=0x557e11303b30, offset=58880, size=1) at ../hw/block/pflash_cfi01.c:394
> #19 0x0000557e0e2b2749 in pflash_write (pfl=0x557e11303b30, offset=59338, value=62, width=1, be=0) at ../hw/block/pflash_cfi01.c:522
> #20 0x0000557e0e2b2cda in pflash_mem_write_with_attrs (opaque=0x557e11303b30, addr=59338, value=62, len=1, attrs=...) at ../hw/block/pflash_cfi01.c:681
> #21 0x0000557e0e733354 in memory_region_write_with_attrs_accessor (mr=0x557e11303ef0, addr=59338, value=0x7fd291ff60c8, size=1, shift=0, mask=255, attrs=...) at ../softmmu/memory.c:514
> #22 0x0000557e0e733493 in access_with_adjusted_size (addr=59338, value=0x7fd291ff60c8, size=1, access_size_min=1, access_size_max=4, access_fn=0x557e0e73325a <memory_region_write_with_attrs_accessor>, mr=0x557e11303ef0, attrs=...) at ../softmmu/memory.c:555
> #23 0x0000557e0e7365c8 in memory_region_dispatch_write (mr=0x557e11303ef0, addr=59338, data=62, op=MO_8, attrs=...) at ../softmmu/memory.c:1522
> #24 0x0000557e0e7436de in flatview_write_continue (fv=0x7fd2848bce90, addr=4290832330, attrs=..., ptr=0x7fd2ba9b7028, len=1, addr1=59338, l=1, mr=0x557e11303ef0) at ../softmmu/physmem.c:2641
> #25 0x0000557e0e743841 in flatview_write (fv=0x7fd2848bce90, addr=4290832330, attrs=..., buf=0x7fd2ba9b7028, len=1) at ../softmmu/physmem.c:2683
> #26 0x0000557e0e743bf1 in address_space_write (as=0x557e0f3abb20 <address_space_memory>, addr=4290832330, attrs=..., buf=0x7fd2ba9b7028, len=1) at ../softmmu/physmem.c:2779
> #27 0x0000557e0e743c5e in address_space_rw (as=0x557e0f3abb20 <address_space_memory>, addr=4290832330, attrs=..., buf=0x7fd2ba9b7028, len=1, is_write=true) at ../softmmu/physmem.c:2789
> #28 0x0000557e0e7d7a5c in kvm_cpu_exec (cpu=0x557e11676910) at ../accel/kvm/kvm-all.c:2989
> #29 0x0000557e0e7da76e in kvm_vcpu_thread_fn (arg=0x557e11676910) at ../accel/kvm/kvm-accel-ops.c:51
> #30 0x0000557e0e9e2233 in qemu_thread_start (args=0x557e11553fb0) at ../util/qemu-thread-posix.c:541
> #31 0x00007fd2b9b17ea7 in start_thread (arg=<optimized out>) at pthread_create.c:477
> #32 0x00007fd2b8c18a2f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95


