Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA4832B79D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 12:50:01 +0100 (CET)
Received: from localhost ([::1]:35074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQ0u-0004WJ-De
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 06:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lHPyo-000311-Vt
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 06:47:52 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lHPyl-0005Sx-Nn
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 06:47:50 -0500
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4DrByx1zNpzYFYJ;
 Wed,  3 Mar 2021 19:46:01 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 3 Mar 2021 19:47:33 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Wed, 3 Mar 2021 19:47:33 +0800
Subject: Re: [PATCH v2 3/3] migration/ram: Optimize ram_save_host_page()
To: David Edmondson <dme@dme.org>, Juan Quintela <quintela@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20210301082132.1107-1-jiangkunkun@huawei.com>
 <20210301082132.1107-4-jiangkunkun@huawei.com> <m2k0qoliok.fsf@dme.org>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <1e7cda11-7189-491b-9d2c-bfc1926f2b69@huawei.com>
Date: Wed, 3 Mar 2021 19:47:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <m2k0qoliok.fsf@dme.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme716-chm.china.huawei.com (10.1.199.112) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com, Keqian
 Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/3/3 16:56, David Edmondson wrote:
> On Monday, 2021-03-01 at 16:21:32 +08, Kunkun Jiang wrote:
>
>> Starting from pss->page, ram_save_host_page() will check every page
>> and send the dirty pages up to the end of the current host page or
>> the boundary of used_length of the block. If the host page size is
>> a huge page, the step "check" will take a lot of time.
>>
>> This will improve performance to use migration_bitmap_find_dirty().
> This is cleaner, thank you.
>
> I was hoping to just invert the body of the loop - something like
> (completely untested):
Sorry for my misunderstanding.
I will improve it in the next version.
> do {
>    int pages_this_iteration = 0;
>
>    /* Check if the page is dirty and, if so, send it. */
>    if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
>      pages_this_iteration = ram_save_target_page(rs, pss, last_stage);
>      if (pages_this_iteration < 0) {
>        return pages_this_iteration;
>      }
>
>      pages += pages_this_iteration;
>
>      /*
>       * Allow rate limiting to happen in the middle of huge pages if
>       * the current iteration sent something.
>       */
>      if (pagesize_bits > 1 && pages_this_iteration > 0) {
>        migration_rate_limit();
>      }
I missed the case that the value of pages_this_iteration is 0. 😅
>    }
>    pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
>   } while ((pss->page < hostpage_boundary) &&
>            offset_in_ramblock(pss->block,
>                               ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
> /* The offset we leave with is the min boundary of host page and block */
> pss->page = MIN(pss->page, hostpage_boundary) - 1;

Best Regards.

Kunkun Jiang

>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> ---
>>   migration/ram.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 3a9115b6dc..a1374db356 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -1991,6 +1991,8 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>>       int tmppages, pages = 0;
>>       size_t pagesize_bits =
>>           qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
>> +    unsigned long hostpage_boundary =
>> +        QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
>>       unsigned long start_page = pss->page;
>>       int res;
>>   
>> @@ -2002,7 +2004,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>>       do {
>>           /* Check the pages is dirty and if it is send it */
>>           if (!migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
>> -            pss->page++;
>> +            pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
>>               continue;
>>           }
>>   
>> @@ -2012,16 +2014,16 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>>           }
>>   
>>           pages += tmppages;
>> -        pss->page++;
>> +        pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
>>           /* Allow rate limiting to happen in the middle of huge pages */
>>           if (pagesize_bits > 1) {
>>               migration_rate_limit();
>>           }
>> -    } while ((pss->page & (pagesize_bits - 1)) &&
>> +    } while ((pss->page < hostpage_boundary) &&
>>                offset_in_ramblock(pss->block,
>>                                   ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
>> -    /* The offset we leave with is the last one we looked at */
>> -    pss->page--;
>> +    /* The offset we leave with is the min boundary of host page and block */
>> +    pss->page = MIN(pss->page, hostpage_boundary) - 1;
>>   
>>       res = ram_save_release_protection(rs, pss, start_page);
>>       return (res < 0 ? res : pages);
>> -- 
>> 2.23.0
> dme.



