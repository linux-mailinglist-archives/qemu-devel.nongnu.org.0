Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C88344728
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:29:57 +0100 (CET)
Received: from localhost ([::1]:43638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLZ6-0002Hb-Ly
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lOL92-0005Sf-E5
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:03:00 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lOL8t-0005Kk-8B
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:02:59 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F3x303gY4znVGC;
 Mon, 22 Mar 2021 22:00:12 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Mon, 22 Mar 2021 22:02:39 +0800
Subject: Re: [PATCH v5 00/10] KVM: Dirty ring support (QEMU part)
To: Peter Xu <peterx@redhat.com>, <qemu-devel@nongnu.org>
References: <20210310203301.194842-1-peterx@redhat.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <2e057323-8102-7bfc-051b-cd3950c93875@huawei.com>
Date: Mon, 22 Mar 2021 22:02:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210310203301.194842-1-peterx@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 2021/3/11 4:32, Peter Xu wrote:
> This is v5 of the qemu dirty ring interface support.
> 
> 
> 
> v5:
> 
> - rebase
> 
> - dropped patch "update-linux-headers: Include const.h" after rebase
> 
> - dropped patch "KVM: Fixup kvm_log_clear_one_slot() ioctl return check" since
> 
>   similar patch got merged recently (38e0b7904eca7cd32f8953c3)
> 
> 
> 
> ========= v4 cover letter below =============
> 
> 
> 
> It is merely the same as v3 content-wise, but there're a few things to mention
> 
> besides the rebase itself:
> 
> 
> 
>   - I picked up two patches from Eric Farman for the linux-header updates (from
> 
>     Eric's v3 series) for convenience just in case any of the series would got
> 
>     queued by any maintainer.
> 
> 
> 
>   - One more patch is added as "KVM: Disable manual dirty log when dirty ring
> 
>     enabled".  I found this when testing the branch after rebasing to latest
> 
>     qemu, that not only the manual dirty log capability is not needed for kvm
> 
>     dirty ring, but more importantly INITIALLY_ALL_SET is totally against kvm
> 
>     dirty ring and it could silently crash the guest after migration.  For this
> 
>     new commit, I touched up "KVM: Add dirty-gfn-count property" a bit.
> 
> 
> 
>   - A few more documentation lines in qemu-options.hx.
> 
> 
> 
>   - I removed the RFC tag after kernel series got merged.
> 
> 
> 
> Again, this is only the 1st step to support dirty ring.  Ideally dirty ring
> 
> should grant QEMU the possibility to remove the whole layered dirty bitmap so
> 
> that dirty ring will work similarly as auto-converge enabled but should better;
> 
> we will just throttle vcpus with the dirty ring kvm exit rather than explicitly
> 
> adding a timer to stop the vcpu thread from entering the guest again (like what
> 
> we did with current migration auto-converge).  Some more information could also
> 
> be found in the kvm forum 2020 talk regarding kvm dirty ring (slides 21/22 [1]).
I have read this pdf and code, and I have some questions, hope you can help me. :)

You emphasize that dirty ring is a "Thread-local buffers", but dirty bitmap is global,
but I don't see it has optimization about "locking" compared to dirty bitmap.

The thread-local means that vCPU can flush hardware buffer into dirty ring without
locking, but for bitmap, vCPU can also use atomic set to mark dirty without locking.
Maybe I miss something?

The second question is that you observed longer migration time (55s->73s) when guest
has 24G ram and dirty rate is 800M/s. I am not clear about the reason. As with dirty
ring enabled, Qemu can get dirty info faster which means it handles dirty page more
quick, and guest can be throttled which means dirty page is generated slower. What's
the rationale for the longer migration time?

PS: As the dirty ring is still converted into dirty_bitmap of kvm_slot, so the
"get dirty info faster" maybe not true. :-(

Thanks,
Keqian

> 
> 
> 
> That next step (to remove all the dirty bitmaps, as mentioned above) is still
> 
> discussable: firstly I don't know whether there's anything I've overlooked in
> 
> there.  Meanwhile that's also only services huge VM cases, may not be extremely
> 
> helpful with a lot major scenarios where VMs are not that huge.
> 
> 
> 
> There's probably other ways to fix huge VM migration issues, majorly focusing
> 
> on responsiveness and convergence.  For example, Google has proposed some new
> 
> userfaultfd kernel capability called "minor modes" [2] to track page minor
> 
> faults and that could be finally served for that purpose too using postcopy.
> 
> That's another long story so I'll stop here, but just as a marker along with
> 
> the dirty ring series so there'll still be a record to reference.
> 
> 
> 
> Said that, I still think this series is very worth merging even if we don't
> 
> persue the next steps yet, since dirty ring is disabled by default, and we can
> 
> always work upon this series.
> 
> 
> 
> Please review, thanks.
> 
> 
> 
> V3: https://lore.kernel.org/qemu-devel/20200523232035.1029349-1-peterx@redhat.com/
> 
>     (V3 contains all the pre-v3 changelog)
> 
> 
> 
> QEMU branch for testing (requires kernel version 5.11-rc1+):
> 
>     https://github.com/xzpeter/qemu/tree/kvm-dirty-ring
> 
> 
> 
> [1] https://static.sched.com/hosted_files/kvmforum2020/97/kvm_dirty_ring_peter.pdf
> 
> [2] https://lore.kernel.org/lkml/20210107190453.3051110-1-axelrasmussen@google.com/
> 
> 
> 
> ---------------------------8<---------------------------------
> 
> 
> 
> Overview
> 
> ========
> 
> 
> 
> KVM dirty ring is a new interface to pass over dirty bits from kernel
> 
> to the userspace.  Instead of using a bitmap for each memory region,
> 
> the dirty ring contains an array of dirtied GPAs to fetch, one ring
> 
> per vcpu.
> 
> 
> 
> There're a few major changes comparing to how the old dirty logging
> 
> interface would work:
> 
> 
> 
> - Granularity of dirty bits
> 
> 
> 
>   KVM dirty ring interface does not offer memory region level
> 
>   granularity to collect dirty bits (i.e., per KVM memory
> 
>   slot). Instead the dirty bit is collected globally for all the vcpus
> 
>   at once.  The major effect is on VGA part because VGA dirty tracking
> 
>   is enabled as long as the device is created, also it was in memory
> 
>   region granularity.  Now that operation will be amplified to a VM
> 
>   sync.  Maybe there's smarter way to do the same thing in VGA with
> 
>   the new interface, but so far I don't see it affects much at least
> 
>   on regular VMs.
> 
> 
> 
> - Collection of dirty bits
> 
> 
> 
>   The old dirty logging interface collects KVM dirty bits when
> 
>   synchronizing dirty bits.  KVM dirty ring interface instead used a
> 
>   standalone thread to do that.  So when the other thread (e.g., the
> 
>   migration thread) wants to synchronize the dirty bits, it simply
> 
>   kick the thread and wait until it flushes all the dirty bits to the
> 
>   ramblock dirty bitmap.
> 
> 
> 
> A new parameter "dirty-ring-size" is added to "-accel kvm".  By
> 
> default, dirty ring is still disabled (size==0).  To enable it, we
> 
> need to be with:
> 
> 
> 
>   -accel kvm,dirty-ring-size=65536
> 
> 
> 
> This establishes a 64K dirty ring buffer per vcpu.  Then if we
> 
> migrate, it'll switch to dirty ring.
> 
> 
> 
> I gave it a shot with a 24G guest, 8 vcpus, using 10g NIC as migration
> 
> channel.  When idle or dirty workload small, I don't observe major
> 
> difference on total migration time.  When with higher random dirty
> 
> workload (800MB/s dirty rate upon 20G memory, worse for kvm dirty
> 
> ring). Total migration time is (ping pong migrate for 6 times, in
> 
> seconds):
> 
> 
> 
> |-------------------------+---------------|
> 
> | dirty ring (4k entries) | dirty logging |
> 
> |-------------------------+---------------|
> 
> |                      70 |            58 |
> 
> |                      78 |            70 |
> 
> |                      72 |            48 |
> 
> |                      74 |            52 |
> 
> |                      83 |            49 |
> 
> |                      65 |            54 |
> 
> |-------------------------+---------------|
> 
> 
> 
> Summary:
> 
> 
> 
> dirty ring average:    73s
> 
> dirty logging average: 55s
> 
> 
> 
> The KVM dirty ring will be slower in above case.  The number may show
> 
> that the dirty logging is still preferred as a default value because
> 
> small/medium VMs are still major cases, and high dirty workload
> 
> happens frequently too.  And that's what this series did.
> 
> 
> 
> TODO:
> 
> 
> 
> - Consider to drop the BQL dependency: then we can run the reaper thread in
> 
>   parallel of main thread.  Needs some thought around the race conditions.
> 
> 
> 
> - Consider to drop the kvmslot bitmap: logically this can be dropped with kvm
> 
>   dirty ring, not only for space saving, but also it's still another layer
> 
>   linear to guest mem size which is against the whole idea of kvm dirty ring.
> 
>   This should make above number (of kvm dirty ring) even smaller (but still may
> 
>   not be as good as dirty logging when with such high workload).
> 
> 
> 
> Please refer to the code and comment itself for more information.
> 
> 
> 
> Thanks,
> 
> 
> 
> Peter Xu (10):
> 
>   memory: Introduce log_sync_global() to memory listener
> 
>   KVM: Use a big lock to replace per-kml slots_lock
> 
>   KVM: Create the KVMSlot dirty bitmap on flag changes
> 
>   KVM: Provide helper to get kvm dirty log
> 
>   KVM: Provide helper to sync dirty bitmap from slot to ramblock
> 
>   KVM: Simplify dirty log sync in kvm_set_phys_mem
> 
>   KVM: Cache kvm slot dirty bitmap size
> 
>   KVM: Add dirty-gfn-count property
> 
>   KVM: Disable manual dirty log when dirty ring enabled
> 
>   KVM: Dirty ring support
> 
> 
> 
>  accel/kvm/kvm-all.c      | 585 +++++++++++++++++++++++++++++++++------
> 
>  accel/kvm/trace-events   |   7 +
> 
>  include/exec/memory.h    |  12 +
> 
>  include/hw/core/cpu.h    |   8 +
> 
>  include/sysemu/kvm_int.h |   7 +-
> 
>  qemu-options.hx          |  12 +
> 
>  softmmu/memory.c         |  33 ++-
> 
>  7 files changed, 565 insertions(+), 99 deletions(-)
> 
> 
> 

