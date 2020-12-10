Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C922D52C2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 05:25:50 +0100 (CET)
Received: from localhost ([::1]:44510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knDWW-0007Uh-Rs
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 23:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1knDUz-00071b-C5
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 23:24:14 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1knDUu-0000YE-8P
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 23:24:12 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cs14h3KNFzhpkb;
 Thu, 10 Dec 2020 12:23:32 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Dec 2020 12:23:48 +0800
Subject: Re: [PATCH] kvm: Take into account the unaligned section size when
 preparing bitmap
To: Peter Xu <peterx@redhat.com>
References: <20201208114013.875-1-yuzenghui@huawei.com>
 <20201208151654.GA6432@xz-x1>
 <bb4bcc8b-1d36-9529-d7cd-4d93162d092f@huawei.com>
 <20201209210907.GA3211@xz-x1>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <d737a0db-cf0e-80b2-82dc-7799f0ebd8a1@huawei.com>
Date: Thu, 10 Dec 2020 12:23:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20201209210907.GA3211@xz-x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=yuzenghui@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/12/10 5:09, Peter Xu wrote:
> On Wed, Dec 09, 2020 at 10:33:41AM +0800, Zenghui Yu wrote:
>> Hi Peter,
>>
>> Thanks for having a look at it.
>>
>> On 2020/12/8 23:16, Peter Xu wrote:
>>> Hi, Zenghui,
>>>
>>> On Tue, Dec 08, 2020 at 07:40:13PM +0800, Zenghui Yu wrote:
>>>> The kernel KVM_CLEAR_DIRTY_LOG interface has align requirement on both the
>>>> start and the size of the given range of pages. We have been careful to
>>>> handle the unaligned cases when performing CLEAR on one slot. But it seems
>>>> that we forget to take the unaligned *size* case into account when
>>>> preparing bitmap for the interface, and we may end up clearing dirty status
>>>> for pages outside of [start, start + size).
>>>
>>> Thanks for the patch, though my understanding is that this is not a bug.
>>>
>>> Please have a look at kvm_memslot_init_dirty_bitmap() where we'll allocate the
>>> dirty bitmap to be aligned to 8 bytes (assuming that's the possible max of the
>>> value sizeof(unsigned long)).  That exactly covers 64 pages.
>>>
>>> So here as long as start_delta==0 (so the value of "bmap_npages - size / psize"
>>> won't really matter a lot, imho), then we'll definitely have KVMSlot.dirty_bmap
>>> long enough to cover the range we'd like to clear.
>>
>> I agree.  But actually I'm not saying that KVMSlot.dirty_bmap is not
>> long enough.  What I was having in mind is something like:
>>
>>      // psize = qemu_real_host_page_size;
>>      // slot.start_addr = 0;
>>      // slot.memory_size = 64 * psize;
>>
>>      kvm_log_clear_one_slot(slot, as, 0 * psize, 32 * psize);   --> [1]
>>      kvm_log_clear_one_slot(slot, as, 32 * psize, 32 * psize);  --> [2]
>>
>> So the @size is not aligned with 64 pages.  Before this patch, we'll
>> clear dirty status for all pages(0-63) through [1].  It looks to me that
>> this violates the caller's expectation since we only want to clear
>> pages(0-31).
> 
> Now I see; I think you're right. :)
> 
>>
>> As I said, I don't think this will happen in practice -- the migration
>> code should always provide us with a 64-page aligned section (right?).
> 
> Yes, migration is the major consumer, and that should be guaranteed indeed, see
> CLEAR_BITMAP_SHIFT_MIN.
> 
> Not sure about VGA - that should try to do log clear even without migration,
> but I guess that satisfies the 64-page alignment too, since it's not a huge
> number (256KB).  The VGA buffer size could be related to screen resolution,
> then N*1024*768 could still guarantee a safe use of the fast path.
> 
>> I'm just thinking about the correctness of the specific algorithm used
>> by kvm_log_clear_one_slot().
> 
> Yeah, then I think it's okay to have this, just in case someday we'll hit it.
> 
> Acked-by: Peter Xu <peterx@redhat.com>

Thanks for that.

> (It would be nicer if above example could be squashed into commit message)

I'll squash it if v2 is needed.


Thanks,
Zenghui

