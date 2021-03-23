Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744183457E7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 07:42:50 +0100 (CET)
Received: from localhost ([::1]:42736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOakb-0002Pl-1G
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 02:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lOaio-0001zM-EO
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 02:40:58 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:4103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lOaik-0003z3-H3
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 02:40:58 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F4MCC2Tnhz92my;
 Tue, 23 Mar 2021 14:38:47 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Tue, 23 Mar 2021 14:40:43 +0800
Subject: Re: [PATCH v5 00/10] KVM: Dirty ring support (QEMU part)
To: Peter Xu <peterx@redhat.com>
References: <20210310203301.194842-1-peterx@redhat.com>
 <2e057323-8102-7bfc-051b-cd3950c93875@huawei.com>
 <20210322194533.GE16645@xz-x1>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <ddf6bf41-ab29-8bbc-d3fb-94938e42e215@huawei.com>
Date: Tue, 23 Mar 2021 14:40:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210322194533.GE16645@xz-x1>
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

Hi Peter,

On 2021/3/23 3:45, Peter Xu wrote:
> On Mon, Mar 22, 2021 at 10:02:38PM +0800, Keqian Zhu wrote:
>> Hi Peter,
> 
> Hi, Keqian,
> 
> [...]
> 
>> You emphasize that dirty ring is a "Thread-local buffers", but dirty bitmap is global,
>> but I don't see it has optimization about "locking" compared to dirty bitmap.
>>
>> The thread-local means that vCPU can flush hardware buffer into dirty ring without
>> locking, but for bitmap, vCPU can also use atomic set to mark dirty without locking.
>> Maybe I miss something?
> 
> Yes, the atomic ops guaranteed locking as you said, but afaiu atomics are
> expensive already, since at least on x86 I think it needs to lock the memory
> bus.  IIUC that'll become even slower as cores grow, as long as the cores share
> the memory bus.
> 
> KVM dirty ring is per-vcpu, it means its metadata can be modified locally
> without atomicity at all (but still, we'll need READ_ONCE/WRITE_ONCE to
> guarantee ordering of memory accesses).  It should scale better especially with
> hosts who have lots of cores.
That makes sense to me.

> 
>>
>> The second question is that you observed longer migration time (55s->73s) when guest
>> has 24G ram and dirty rate is 800M/s. I am not clear about the reason. As with dirty
>> ring enabled, Qemu can get dirty info faster which means it handles dirty page more
>> quick, and guest can be throttled which means dirty page is generated slower. What's
>> the rationale for the longer migration time?
> 
> Because dirty ring is more sensitive to dirty rate, while dirty bitmap is more
Emm... Sorry that I'm very clear about this... I think that higher dirty rate doesn't cause
slower dirty_log_sync compared to that of legacy bitmap mode. Besides, higher dirty rate
means we may have more full-exit, which can properly limit the dirty rate. So it seems that
dirty ring "prefers" higher dirty rate.

> sensitive to memory footprint.  In above 24G mem + 800MB/s dirty rate
> condition, dirty bitmap seems to be more efficient, say, collecting dirty
> bitmap of 24G mem (24G/4K/8=0.75MB) for each migration cycle is fast enough.
> 
> Not to mention that current implementation of dirty ring in QEMU is not
> complete - we still have two more layers of dirty bitmap, so it's actually a
> mixture of dirty bitmap and dirty ring.  This series is more like a POC on
> dirty ring interface, so as to let QEMU be able to run on KVM dirty ring.
> E.g., we won't have hang issue when getting dirty pages since it's totally
> async, however we'll still have some legacy dirty bitmap issues e.g. memory
> consumption of userspace dirty bitmaps are still linear to memory footprint.
The plan looks good and coordinated, but I have a concern. Our dirty ring actually depends
on the structure of hardware logging buffer (PML buffer). We can't say it can be properly
adapted to all kinds of hardware design in the future.

> 
> Moreover, IMHO another important feature that dirty ring provided is actually
> the full-exit, where we can pause a vcpu when it dirties too fast, while other
I think a proper pause time is hard to decide. Short time may have little effect
of throttle, but long time may have heavy effect on guest. Do you have a good algorithm?


> vcpus won't be affected.  That's something I really wanted to POC too but I
> don't have enough time.  I think it's a worth project in the future to really
> make the full-exit throttle vcpus, then ideally we'll remove all the dirty
> bitmaps in QEMU as long as dirty ring is on.
> 
> So I'd say the number I got at that time is not really helping a lot - as you
> can see for small VMs it won't make things faster.  Maybe a bit more efficient?
> I can't tell.  From design-wise it looks actually still better.  However dirty
> logging still has the reasoning to be the default interface we use for small
> vms, imho.
I see.

> 
>>
>> PS: As the dirty ring is still converted into dirty_bitmap of kvm_slot, so the
>> "get dirty info faster" maybe not true. :-(
> 
> We can get dirty info faster even now, I think, because previously we only do
> KVM_GET_DIRTY_LOG once per migration iteration, which could be tens of seconds
> for a VM mentioned above with 24G and 800MB/s dirty rate.  Dirty ring is fully
> async, we'll get that after the reaper thread timeout.  However I must also
> confess "get dirty info faster" doesn't help us a lot on anything yet, afaict,
> comparing to a full-featured dirty logging where clear dirty log and so on.
OK.

> 
> Hope above helps.
Sure, thanks. :)


Keqian

