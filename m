Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E75326F443F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:50:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptpRf-00027O-0i; Tue, 02 May 2023 08:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1ptpRc-000271-6q; Tue, 02 May 2023 08:49:24 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1ptpRV-0002RP-W8; Tue, 02 May 2023 08:49:23 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 2EDC146EF4;
 Tue,  2 May 2023 14:49:10 +0200 (CEST)
Message-ID: <ae2385f9-770f-d101-4cf0-96e30a3e85d4@proxmox.com>
Date: Tue, 2 May 2023 14:49:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: QMP (without OOB) function running in thread different from the
 main thread as part of aio_poll
Content-Language: en-US
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
 <31757c45-695d-4408-468c-c2de560aff9c@proxmox.com>
 <87r0rzt408.fsf@secure.mitica>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <87r0rzt408.fsf@secure.mitica>
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

Am 02.05.23 um 12:35 schrieb Juan Quintela:
> Fiona Ebner <f.ebner@proxmox.com> wrote:
>> Am 02.05.23 um 12:03 schrieb Fiona Ebner:
>>> Am 28.04.23 um 18:54 schrieb Juan Quintela:
>>>> Kevin Wolf <kwolf@redhat.com> wrote:
>>>>> Am 28.04.2023 um 10:38 hat Juan Quintela geschrieben:
>>>>>> Kevin Wolf <kwolf@redhat.com> wrote:
>>>>>>>> I am perhaps a bit ingenuous here, but it is there a way to convince
>>>>>>>> qemu that snapshot_save_job_bh *HAS* to run on the main thread?
>>>>>>>
>>>>>>> I believe we're talking about a technicality here. I asked another more
>>>>>>> fundamental question that nobody has answered yet:
>>>>>>>
>>>>>>> Why do you think that it's ok to call bdrv_writev_vmstate() without
>>>>>>> holding the BQL?
>>>>>>
>>>>>> I will say this function starts by bdrv_ (i.e. block layer people) and
>>>>>> endes with _vmstate (i.e. migration people).
>>>>>>
>>>>>> To be honest, I don't know.  That is why I _supposed_ you have an idea.
>>>>>
>>>>> My idea is that bdrv_*() can only be called when you hold the BQL, or
>>>>> for BlockDriverStates in an iothread the AioContext lock.
>>>>>
>>>>> Apparently dropping the BQL in migration code was introduced in Paolo's
>>>>> commit 9b095037527.
>>>>
>>>> Damn.  I reviewed it, so I am as guilty as the author.
>>>> 10 years later without problems I will not blame that patch.
>>>>
>>>> I guess we changed something else that broke doing it without the lock.
>>>>
>>>> But no, I still don't have suggestions/ideas.
>>>>
>>>
>>> I do feel like the issue might be very difficult to trigger under normal
>>> circumstances. Depending on the configuration and what you do in the
>>> guest, aio_poll in a vCPU thread does not happen often and I imagine
>>> snapshot-save is also not a super frequent operation for most people. It
>>> still takes me a while to trigger the issue by issuing lots of pflash
>>> writes and running snapshot-save in a loop, I'd guess about 30-60
>>> snapshots. Another reason might be that generated co-wrappers were less
>>> common in the past?
>>>
>>>>> I'm not sure what this was supposed to improve in
>>>>> the case of snapshots because the VM is stopped anyway.
>>>
>>> Is it? Quoting Juan:> d- snapshots are a completely different beast,
>>> that don't really stop
>>>>    the guest in the same way at that point, and sometimes it shows in
>>>>    this subtle details.
>>>
>>>>> Would anything bad happen if we removed the BQL unlock/lock section in
>>>>> qemu_savevm_state() again?
>>>>
>>>> Dunno.
>>>>
>>>> For what is worth, I can say that it survives migration-test, but don't
>>>> ask me why/how/...
>>>>
>>>> Fiona, can you check if it fixes your troubles?
>>>>
>>>
>>> Just removing the single section in qemu_savevm_state() breaks even the
>>> case where snapshot_save_job_bh() is executed in the main thread,
>>> because ram_init_bitmaps() will call qemu_mutex_lock_iothread_impl()
>>> which asserts that it's not already locked.
>>>
>>> Also removing the lock/unlock pair in ram_init_bitmaps() seems to work. 
>>
>> Well, after a few more attempts, I got a new failure (running with the
>> two changes mentioned above), but it seems to happen later and, at a
>> first glance, doesn't seem to be related to the lock anymore:
> 
> Can you revert the whole commit:
> 
> commmit 9b0950375277467fd74a9075624477ae43b9bb22
> Author: Paolo Bonzini <pbonzini@redhat.com>
> Date:   Fri Feb 22 17:36:28 2013 +0100
> 
>     migration: run setup callbacks out of big lock

Unfortunately, there were just too many changes. git revert won't even
detect the renamed files (e.g. migration.c -> migration/migration.c) for
me. I tried to revert manually, but I noticed another issue. A full
revert would also mean that migration holds the BQL around the
qemu_savevm_state_setup() call. But if we don't want that, we can't
remove the qemu_mutex_lock_iothread() call in ram_init_bitmaps() (and
similar for block_save_setup()), because migration relies on that. I
guess we could make the lock+unlock calls conditional, depending on
whether the BQL is already held, but it doesn't seem too nice either.

> 
> Because we are again at:
>>
>>> Thread 21 "CPU 0/KVM" received signal SIGABRT, Aborted.
>>> [Switching to Thread 0x7fd291ffb700 (LWP 136620)]
>>> __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
>>> 50	../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
>>> (gdb) bt
>>> #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
>>> #1  0x00007fd2b8b3e537 in __GI_abort () at abort.c:79
>>> #2 0x00007fd2b8b3e40f in __assert_fail_base (fmt=0x7fd2b8cb66a8
>>> "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n",
>>> assertion=0x557e0ebb7193 "!n->vhost_started", file=0x557e0ebb65f0
>>> "../hw/net/virtio-net.c", line=3811, function=<optimized out>) at
>>> assert.c:92
>>> #3 0x00007fd2b8b4d662 in __GI___assert_fail
>>> (assertion=0x557e0ebb7193 "!n->vhost_started", file=0x557e0ebb65f0
>>> "../hw/net/virtio-net.c", line=3811, function=0x557e0ebb7740
>>> <__PRETTY_FUNCTION__.3> "virtio_net_pre_save") at assert.c:101
>>> #4  0x0000557e0e6c21c9 in virtio_net_pre_save (opaque=0x557e12c480b0) at ../hw/net/virtio-net.c:3811
>>> #5 0x0000557e0e4f63ee in vmstate_save_state_v (f=0x7fd28442f730,
>>> vmsd=0x557e0efb53c0 <vmstate_virtio_net>, opaque=0x557e12c480b0,
>>> vmdesc=0x7fd2840978e0, version_id=11) at ../migration/vmstate.c:330
>>> #6 0x0000557e0e4f6390 in vmstate_save_state (f=0x7fd28442f730,
>>> vmsd=0x557e0efb53c0 <vmstate_virtio_net>, opaque=0x557e12c480b0,
>>> vmdesc_id=0x7fd2840978e0) at ../migration/vmstate.c:318
>>> #7 0x0000557e0e51c80a in vmstate_save (f=0x7fd28442f730,
>>> se=0x557e12c4c430, vmdesc=0x7fd2840978e0) at
>>> ../migration/savevm.c:1000
>>> #8 0x0000557e0e51d942 in
>>> qemu_savevm_state_complete_precopy_non_iterable (f=0x7fd28442f730,
>>> in_postcopy=false, inactivate_disks=false) at
>>> ../migration/savevm.c:1463
>>> #9 0x0000557e0e51db33 in qemu_savevm_state_complete_precopy
>>> (f=0x7fd28442f730, iterable_only=false, inactivate_disks=false) at
>>> ../migration/savevm.c:1529
>>> #10 0x0000557e0e51df3d in qemu_savevm_state (f=0x7fd28442f730, errp=0x7fd28425e1f8) at ../migration/savevm.c:1635
>>> #11 0x0000557e0e520548 in save_snapshot (name=0x7fd28425e2b0
>>> "snap0", overwrite=false, vmstate=0x7fd284479c20 "scsi0",
>>> has_devices=true, devices=0x7fd284097920, errp=0x7fd28425e1f8) at
>>> ../migration/savevm.c:2952
>>> #12 0x0000557e0e520f9b in snapshot_save_job_bh (opaque=0x7fd28425e130) at ../migration/savevm.c:3251
> 
> Here we are
> aio_bh_call()
> 
> ends calling snapshot_save_job_bh, and it didn't end well.
> 
> It appears that there is not an easy way to warantee that snapshot code
> is only run on the main io thread, so my only other suggestion right now
> is that you check snapshot_save_job_bh() and see if it ever happens on a
> non-vcpu thread when you get the test to run correctly.

Sorry, I'm not sure what you mean by "when you get the test to run
correctly". Yes, the assertion from above only happened in a vCPU thread
for me.

While save_snapshot() calls vm_stop(RUN_STATE_SAVE_VM), I guess it's
because of the following?

> int vm_stop(RunState state)
> {
>     if (qemu_in_vcpu_thread()) {
>         qemu_system_vmstop_request_prepare();
>         qemu_system_vmstop_request(state);
>         /*
>          * FIXME: should not return to device code in case
>          * vm_stop() has been requested.
>          */
>         cpu_stop_current();
>         return 0;
>     }
> 
>     return do_vm_stop(state, true);
> }

Would rescheduling snapshot_save_job_bh() until it runs in the main
thread be an option?

But Kevin said:

> My idea is that bdrv_*() can only be called when you hold the BQL, or
> for BlockDriverStates in an iothread the AioContext lock

So IIUC, having snapshot code keep dropping the BQL during setup would
still not be fully correct even if we ensure that snapshot code only
runs in the main thread. But when doing qemu_mutex_unlock_iothread() in
the main thread, qemu_get_current_aio_context() still returns the main
thread's AioContext (it returns 0x0 when the same thing is done in the
vCPU thread), so is it fine after all?

Another alternative would be to check in the QIOChannelBlock
implementation if we require the main thread's AioContext and acquire
the BQL before calling the bdrv_*_vmstate() functions? But that seems
rather ugly too.

Best Regards,
Fiona


