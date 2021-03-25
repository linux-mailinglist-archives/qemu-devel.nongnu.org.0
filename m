Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AED348665
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 02:23:31 +0100 (CET)
Received: from localhost ([::1]:38950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPEig-0005Fy-8E
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 21:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lPEhP-0004jl-Nu
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 21:22:11 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:4104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lPEhH-0002aD-PN
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 21:22:11 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F5S2M6zpXz9sd5;
 Thu, 25 Mar 2021 09:19:55 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 09:21:53 +0800
Subject: Re: [PATCH v5 00/10] KVM: Dirty ring support (QEMU part)
To: Peter Xu <peterx@redhat.com>
References: <20210310203301.194842-1-peterx@redhat.com>
 <2e057323-8102-7bfc-051b-cd3950c93875@huawei.com>
 <20210322194533.GE16645@xz-x1>
 <ddf6bf41-ab29-8bbc-d3fb-94938e42e215@huawei.com>
 <20210323143429.GB6486@xz-x1>
 <5da1dd71-58e9-6579-c7c1-6cb60baf7ac1@huawei.com>
 <20210324150943.GB219069@xz-x1>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <25da9dde-bd02-b557-66ed-06e4422c5634@huawei.com>
Date: Thu, 25 Mar 2021 09:21:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210324150943.GB219069@xz-x1>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhukeqian1@huawei.com;
 helo=szxga07-in.huawei.com
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
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter,

On 2021/3/24 23:09, Peter Xu wrote:
> On Wed, Mar 24, 2021 at 10:56:22AM +0800, Keqian Zhu wrote:
>> Hi Peter,
>>
>> On 2021/3/23 22:34, Peter Xu wrote:
>>> Keqian,
>>>
>>> On Tue, Mar 23, 2021 at 02:40:43PM +0800, Keqian Zhu wrote:
>>>>>> The second question is that you observed longer migration time (55s->73s) when guest
>>>>>> has 24G ram and dirty rate is 800M/s. I am not clear about the reason. As with dirty
>>>>>> ring enabled, Qemu can get dirty info faster which means it handles dirty page more
>>>>>> quick, and guest can be throttled which means dirty page is generated slower. What's
>>>>>> the rationale for the longer migration time?
>>>>>
>>>>> Because dirty ring is more sensitive to dirty rate, while dirty bitmap is more
>>>> Emm... Sorry that I'm very clear about this... I think that higher dirty rate doesn't cause
>>>> slower dirty_log_sync compared to that of legacy bitmap mode. Besides, higher dirty rate
>>>> means we may have more full-exit, which can properly limit the dirty rate. So it seems that
>>>> dirty ring "prefers" higher dirty rate.
>>>
>>> When I measured the 800MB/s it's in the guest, after throttling.
>>>
>>> Imagine another example: a VM has 1G memory keep dirtying with 10GB/s.  Dirty
>>> logging will need to collect even less for each iteration because memory size
>>> shrinked, collect even less frequent due to the high dirty rate, however dirty
>>> ring will use 100% cpu power to collect dirty pages because the ring keeps full.
>> Looks good.
>>
>> We have many places to collect dirty pages: the background reaper, vCPU exit handler,
>> and the migration thread. I think migration time is closely related to the migration thread.
>>
>> The migration thread calls kvm_dirty_ring_flush().
>> 1. kvm_cpu_synchronize_kick_all() will wait vcpu handles full-exit.
>> 2. kvm_dirty_ring_reap() collects and resets dirty pages.
>> The above two operation will spend more time with higher dirty rate.
>>
>> But I suddenly realize that the key problem maybe not at this. Though we have separate
>> "reset" operation for dirty ring, actually it is performed right after we collect dirty
>> ring to kvmslot. So in dirty ring mode, it likes legacy bitmap mode without manual_dirty_clear.
>>
>> If we can "reset" dirty ring just before we really handle the dirty pages, we can have
>> shorter migration time. But the design of dirty ring doesn't allow this, because we must
>> perform reset to make free space...
> 
> This is a very good point.
> 
> Dirty ring should have been better in quite some ways already, but from that
> pov as you said it goes a bit backwards on reprotection of pages (not to
> mention currently we can't even reset the ring per-vcpu; that seems to be not
> fully matching the full locality that the rings have provided as well; but
> Paolo and I discussed with that issue, it's about TLB flush expensiveness, so
> we still need to think more of it..).
> 
> Ideally the ring could have been both per-vcpu but also bi-directional (then
> we'll have 2*N rings, N=vcpu number), so as to split the state transition into
> "dirty ring" and "reprotect ring", then that reprotect ring will be the clear
> dirty log.  That'll look more like virtio as used ring.  However we'll still
> need to think about the TLB flush issue too as Paolo used to mention, as
> that'll exist too with any per-vcpu flush model (each reprotect of page will
> need a tlb flush of all vcpus).
> 
> Or.. maybe we can make the flush ring a standalone one, so we need N dirty ring
> and one global flush ring.
Yep, have separate "reprotect" ring(s) is a good idea.

> 
> Anyway.. Before that, I'd still think the next step should be how to integrate
> qemu to fully leverage current ring model, so as to be able to throttle in
> per-vcpu fashion.
> 
> The major issue (IMHO) with huge VM migration is:
> 
>   1. Convergence
>   2. Responsiveness
> 
> Here we'll have a chance to solve (1) by highly throttle the working vcpu
> threads, meanwhile still keep (2) by not throttle user interactive threads.
> I'm not sure whether this will really work as expected, but just show what I'm
> thinking about it.  These may not matter a lot yet with further improving ring
> reset mechanism, which definitely sounds even better, but seems orthogonal.
> 
> That's also why I think we should still merge this series first as a fundation
> for the rest.
I see.

> 
>>
>>>
>>>>
>>>>> sensitive to memory footprint.  In above 24G mem + 800MB/s dirty rate
>>>>> condition, dirty bitmap seems to be more efficient, say, collecting dirty
>>>>> bitmap of 24G mem (24G/4K/8=0.75MB) for each migration cycle is fast enough.
>>>>>
>>>>> Not to mention that current implementation of dirty ring in QEMU is not
>>>>> complete - we still have two more layers of dirty bitmap, so it's actually a
>>>>> mixture of dirty bitmap and dirty ring.  This series is more like a POC on
>>>>> dirty ring interface, so as to let QEMU be able to run on KVM dirty ring.
>>>>> E.g., we won't have hang issue when getting dirty pages since it's totally
>>>>> async, however we'll still have some legacy dirty bitmap issues e.g. memory
>>>>> consumption of userspace dirty bitmaps are still linear to memory footprint.
>>>> The plan looks good and coordinated, but I have a concern. Our dirty ring actually depends
>>>> on the structure of hardware logging buffer (PML buffer). We can't say it can be properly
>>>> adapted to all kinds of hardware design in the future.
>>>
>>> Sorry I don't get it - dirty ring can work with pure page wr-protect too?
>> Sure, it can. I just want to discuss many possible kinds of hardware logging buffer.
>> However, I'd like to stop at this, at least dirty ring works well with PML. :)
> 
> I see your point.  That'll be a good topic at least when we'd like to port
> dirty ring to other archs for sure.  However as you see I hoped we can start to
> use dirty ring first, find issues, fix it, even redesign some of it, make it
> really beneficial at least on one arch, then it'll make more sense to port it,
> or attract people porting it. :)
> 
> QEMU does not yet have a good solution for huge vm migration yet.  Maybe dirty
> ring is a good start for it, maybe not (e.g., with uffd minor mode postcopy has
> the other chance).  We'll see...
OK.

Thanks,
Keqian

