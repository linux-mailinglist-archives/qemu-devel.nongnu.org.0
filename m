Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1724D2DBC74
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 09:10:08 +0100 (CET)
Received: from localhost ([::1]:59942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpRss-0006UA-K4
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 03:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kpRrt-0005vO-6C; Wed, 16 Dec 2020 03:09:05 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kpRrp-0003ec-Th; Wed, 16 Dec 2020 03:09:04 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cwnms2cztzkr5T;
 Wed, 16 Dec 2020 16:07:57 +0800 (CST)
Received: from [10.174.187.37] (10.174.187.37) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 16:08:37 +0800
Subject: Re: [PATCH 1/2] accel: kvm: Fix memory waste under mismatch page size
To: Andrew Jones <drjones@redhat.com>
References: <20201215071948.23940-1-zhukeqian1@huawei.com>
 <20201215071948.23940-2-zhukeqian1@huawei.com>
 <20201215112049.sb6kq4elecm4g4zw@kamzik.brq.redhat.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <65da7947-d2ae-5814-aad9-c0c28b206a4a@huawei.com>
Date: Wed, 16 Dec 2020 16:08:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20201215112049.sb6kq4elecm4g4zw@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=szxga04-in.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jiangkunkun@huawei.com,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, Zenghui Yu <yuzenghui@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi drew,

On 2020/12/15 19:20, Andrew Jones wrote:
> On Tue, Dec 15, 2020 at 03:19:47PM +0800, Keqian Zhu wrote:
>> When handle dirty log, we face qemu_real_host_page_size and
>> TARGET_PAGE_SIZE. The first one is the granule of KVM dirty
>> bitmap, and the second one is the granule of QEMU dirty bitmap.
>>
>> Generally speaking, qemu_real_host_page_size >= TARGET_PAGE_SIZE,
> 
> Not just generally speaking, but must be. We have
> 
>     /*
>      * On systems where the kernel can support different base page
>      * sizes, host page size may be different from TARGET_PAGE_SIZE,
>      * even with KVM.  TARGET_PAGE_SIZE is assumed to be the minimum
>      * page size for the system though.
>      */
>     assert(TARGET_PAGE_SIZE <= qemu_real_host_page_size);
Yes, I noticed it, but my statement (Generally speaking) is not suitable.
Thanks for pointing it out.

> 
> at the top of kvm_init() to enforce it.
> 
> The comment also says TARGET_PAGE_SIZE is assumed to be the minimum,
> which is more of a requirement than assumption. And, that requirement
> implies that we require all memory regions and base addresses to be
> aligned to the maximum possible target page size (in case the target
> actually uses something larger).
> 
> Please remove 'Generally speaking' from the commit message. It
> implies this change is based on an assumption rather than a rule.
> 
> (It'd be nice if we had these guest memory and TARGET_PAGE_SIZE
> requirements better documented and in one place.)
Maybe someone could do this :-)

> 
>> so misuse TARGET_PAGE_SIZE to init kvmslot dirty_bmap may waste
>> memory. For example, when qemu_real_host_page_size is 64K and
>> TARGET_PAGE_SIZE is 4K, this bugfix can save 93.75% memory.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> ---
>>  accel/kvm/kvm-all.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index baaa54249d..c5e06288eb 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -620,8 +620,12 @@ static void kvm_memslot_init_dirty_bitmap(KVMSlot *mem)
>>       * too, in most cases).
>>       * So for now, let's align to 64 instead of HOST_LONG_BITS here, in
>>       * a hope that sizeof(long) won't become >8 any time soon.
>> +     *
>> +     * Note: the granule of kvm dirty log is qemu_real_host_page_size.
>> +     * And mem->memory_size is aligned to it (otherwise this mem can't
>> +     * be registered to KVM).
>>       */
>> -    hwaddr bitmap_size = ALIGN(((mem->memory_size) >> TARGET_PAGE_BITS),
>> +    hwaddr bitmap_size = ALIGN(mem->memory_size / qemu_real_host_page_size,
>>                                          /*HOST_LONG_BITS*/ 64) / 8;
>>      mem->dirty_bmap = g_malloc0(bitmap_size);
>>  }
>> -- 
>> 2.23.0
>>
>>
> 
> Besides the commit message
> 
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> 
OK, I will correct it and send v2 soon.

Cheers,
Keqian
> 
> Thanks,
> drew
> 
> .
> 

