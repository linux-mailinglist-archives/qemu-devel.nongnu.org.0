Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3397D2D5079
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 02:48:46 +0100 (CET)
Received: from localhost ([::1]:36360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knB4X-0004Vu-3g
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 20:48:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1knB2J-00040c-HL
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 20:46:27 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1knB2C-0007kX-1y
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 20:46:27 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CrxZY2J3Fzhm6J;
 Thu, 10 Dec 2020 09:45:41 +0800 (CST)
Received: from [10.174.187.37] (10.174.187.37) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Dec 2020 09:46:06 +0800
Subject: Re: [PATCH] kvm: Take into account the unaligned section size when
 preparing bitmap
To: Zenghui Yu <yuzenghui@huawei.com>, Peter Xu <peterx@redhat.com>
References: <20201208114013.875-1-yuzenghui@huawei.com>
 <20201208151654.GA6432@xz-x1>
 <bb4bcc8b-1d36-9529-d7cd-4d93162d092f@huawei.com>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <6dc82702-9246-4684-4f28-e104abc0c11d@huawei.com>
Date: Thu, 10 Dec 2020 09:46:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <bb4bcc8b-1d36-9529-d7cd-4d93162d092f@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I see that if start or size is not PAGE aligned, it also clears areas
which beyond caller's expectation, so do we also need to consider this?

Thanks,
Keqian

On 2020/12/9 10:33, Zenghui Yu wrote:
> Hi Peter,
> 
> Thanks for having a look at it.
> 
> On 2020/12/8 23:16, Peter Xu wrote:
>> Hi, Zenghui,
>>
>> On Tue, Dec 08, 2020 at 07:40:13PM +0800, Zenghui Yu wrote:
>>> The kernel KVM_CLEAR_DIRTY_LOG interface has align requirement on both the
>>> start and the size of the given range of pages. We have been careful to
>>> handle the unaligned cases when performing CLEAR on one slot. But it seems
>>> that we forget to take the unaligned *size* case into account when
>>> preparing bitmap for the interface, and we may end up clearing dirty status
>>> for pages outside of [start, start + size).
>>
>> Thanks for the patch, though my understanding is that this is not a bug.
>>
>> Please have a look at kvm_memslot_init_dirty_bitmap() where we'll allocate the
>> dirty bitmap to be aligned to 8 bytes (assuming that's the possible max of the
>> value sizeof(unsigned long)).  That exactly covers 64 pages.
>>
>> So here as long as start_delta==0 (so the value of "bmap_npages - size / psize"
>> won't really matter a lot, imho), then we'll definitely have KVMSlot.dirty_bmap
>> long enough to cover the range we'd like to clear.
> 
> I agree.  But actually I'm not saying that KVMSlot.dirty_bmap is not
> long enough.  What I was having in mind is something like:
> 
>     // psize = qemu_real_host_page_size;
>     // slot.start_addr = 0;
>     // slot.memory_size = 64 * psize;
> 
>     kvm_log_clear_one_slot(slot, as, 0 * psize, 32 * psize);   --> [1]
>     kvm_log_clear_one_slot(slot, as, 32 * psize, 32 * psize);  --> [2]
> 
> So the @size is not aligned with 64 pages.  Before this patch, we'll
> clear dirty status for all pages(0-63) through [1].  It looks to me that
> this violates the caller's expectation since we only want to clear
> pages(0-31).
> 
> As I said, I don't think this will happen in practice -- the migration
> code should always provide us with a 64-page aligned section (right?).
> I'm just thinking about the correctness of the specific algorithm used
> by kvm_log_clear_one_slot().
> 
> Or maybe I had missed some other points obvious ;-) ?
> 
> 
> Thanks,
> Zenghui
> 
>> Note that the size of KVMSlot.dirty_bmap can be bigger than the actually size
>> of the kvm memslot, however since kvm_memslot_init_dirty_bitmap() initialized
>> it to all zero so the extra bits will always be zero for the whole lifecycle of
>> the vm/bitmap.
>>
>> Thanks,
>>
>>>
>>> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
>>> ---
>>>   accel/kvm/kvm-all.c | 7 +++++--
>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>>> index bed2455ca5..05d323ba1f 100644
>>> --- a/accel/kvm/kvm-all.c
>>> +++ b/accel/kvm/kvm-all.c
>>> @@ -747,7 +747,7 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>>>       assert(bmap_start % BITS_PER_LONG == 0);
>>>       /* We should never do log_clear before log_sync */
>>>       assert(mem->dirty_bmap);
>>> -    if (start_delta) {
>>> +    if (start_delta || bmap_npages - size / psize) {
>>>           /* Slow path - we need to manipulate a temp bitmap */
>>>           bmap_clear = bitmap_new(bmap_npages);
>>>           bitmap_copy_with_src_offset(bmap_clear, mem->dirty_bmap,
>>> @@ -760,7 +760,10 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>>>           bitmap_clear(bmap_clear, 0, start_delta);
>>>           d.dirty_bitmap = bmap_clear;
>>>       } else {
>>> -        /* Fast path - start address aligns well with BITS_PER_LONG */
>>> +        /*
>>> +         * Fast path - both start and size align well with BITS_PER_LONG
>>> +         * (or the end of memory slot)
>>> +         */
>>>           d.dirty_bitmap = mem->dirty_bmap + BIT_WORD(bmap_start);
>>>       }
>>>   -- 
>>> 2.19.1
>>>
>>>
>>
> 
> .
> 

