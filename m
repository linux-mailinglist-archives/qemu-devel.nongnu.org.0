Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D91F346FBE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 03:58:20 +0100 (CET)
Received: from localhost ([::1]:57270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOtis-00004z-WA
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 22:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lOthL-0007b7-B1
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 22:56:43 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lOthI-0008MC-Dl
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 22:56:43 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F4t9v6y0QzwQKc;
 Wed, 24 Mar 2021 10:54:27 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Mar 2021 10:56:22 +0800
Subject: Re: [PATCH v5 00/10] KVM: Dirty ring support (QEMU part)
To: Peter Xu <peterx@redhat.com>
References: <20210310203301.194842-1-peterx@redhat.com>
 <2e057323-8102-7bfc-051b-cd3950c93875@huawei.com>
 <20210322194533.GE16645@xz-x1>
 <ddf6bf41-ab29-8bbc-d3fb-94938e42e215@huawei.com>
 <20210323143429.GB6486@xz-x1>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <5da1dd71-58e9-6579-c7c1-6cb60baf7ac1@huawei.com>
Date: Wed, 24 Mar 2021 10:56:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210323143429.GB6486@xz-x1>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=szxga05-in.huawei.com
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

Hi Peter,

On 2021/3/23 22:34, Peter Xu wrote:
> Keqian,
> 
> On Tue, Mar 23, 2021 at 02:40:43PM +0800, Keqian Zhu wrote:
>>>> The second question is that you observed longer migration time (55s->73s) when guest
>>>> has 24G ram and dirty rate is 800M/s. I am not clear about the reason. As with dirty
>>>> ring enabled, Qemu can get dirty info faster which means it handles dirty page more
>>>> quick, and guest can be throttled which means dirty page is generated slower. What's
>>>> the rationale for the longer migration time?
>>>
>>> Because dirty ring is more sensitive to dirty rate, while dirty bitmap is more
>> Emm... Sorry that I'm very clear about this... I think that higher dirty rate doesn't cause
>> slower dirty_log_sync compared to that of legacy bitmap mode. Besides, higher dirty rate
>> means we may have more full-exit, which can properly limit the dirty rate. So it seems that
>> dirty ring "prefers" higher dirty rate.
> 
> When I measured the 800MB/s it's in the guest, after throttling.
> 
> Imagine another example: a VM has 1G memory keep dirtying with 10GB/s.  Dirty
> logging will need to collect even less for each iteration because memory size
> shrinked, collect even less frequent due to the high dirty rate, however dirty
> ring will use 100% cpu power to collect dirty pages because the ring keeps full.
Looks good.

We have many places to collect dirty pages: the background reaper, vCPU exit handler,
and the migration thread. I think migration time is closely related to the migration thread.

The migration thread calls kvm_dirty_ring_flush().
1. kvm_cpu_synchronize_kick_all() will wait vcpu handles full-exit.
2. kvm_dirty_ring_reap() collects and resets dirty pages.
The above two operation will spend more time with higher dirty rate.

But I suddenly realize that the key problem maybe not at this. Though we have separate
"reset" operation for dirty ring, actually it is performed right after we collect dirty
ring to kvmslot. So in dirty ring mode, it likes legacy bitmap mode without manual_dirty_clear.

If we can "reset" dirty ring just before we really handle the dirty pages, we can have
shorter migration time. But the design of dirty ring doesn't allow this, because we must
perform reset to make free space...

> 
>>
>>> sensitive to memory footprint.  In above 24G mem + 800MB/s dirty rate
>>> condition, dirty bitmap seems to be more efficient, say, collecting dirty
>>> bitmap of 24G mem (24G/4K/8=0.75MB) for each migration cycle is fast enough.
>>>
>>> Not to mention that current implementation of dirty ring in QEMU is not
>>> complete - we still have two more layers of dirty bitmap, so it's actually a
>>> mixture of dirty bitmap and dirty ring.  This series is more like a POC on
>>> dirty ring interface, so as to let QEMU be able to run on KVM dirty ring.
>>> E.g., we won't have hang issue when getting dirty pages since it's totally
>>> async, however we'll still have some legacy dirty bitmap issues e.g. memory
>>> consumption of userspace dirty bitmaps are still linear to memory footprint.
>> The plan looks good and coordinated, but I have a concern. Our dirty ring actually depends
>> on the structure of hardware logging buffer (PML buffer). We can't say it can be properly
>> adapted to all kinds of hardware design in the future.
> 
> Sorry I don't get it - dirty ring can work with pure page wr-protect too?
Sure, it can. I just want to discuss many possible kinds of hardware logging buffer.
However, I'd like to stop at this, at least dirty ring works well with PML. :)

> 
>>
>>>
>>> Moreover, IMHO another important feature that dirty ring provided is actually
>>> the full-exit, where we can pause a vcpu when it dirties too fast, while other
>> I think a proper pause time is hard to decide. Short time may have little effect
>> of throttle, but long time may have heavy effect on guest. Do you have a good algorithm?
> 
> That's the next thing we can discuss.  IMHO I think the dirty ring is nice
> already because we can measure dirty rate per-vcpu, also we can throttle in
> vcpu granule.  That's something required for a good algorithm, say we shouldn't
> block vcpu when there's small dirty rate, and in many cases that's the case for
> e.g. UI threads.  Any algorithm should be based on these facts.
OK.

Thanks,
Keqian

