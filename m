Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CBC327849
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 08:35:41 +0100 (CET)
Received: from localhost ([::1]:37028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGd5f-0006E8-ST
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 02:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lGd3x-0005mc-7Y
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:33:53 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lGd3u-00020g-52
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:33:52 -0500
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4DpsQB5qJdz56d8;
 Mon,  1 Mar 2021 15:31:30 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 1 Mar 2021 15:33:36 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 1 Mar 2021 15:33:36 +0800
Subject: Re: [PATCH 3/3] migration/ram: Optimize ram_save_host_page()
To: David Edmondson <dme@dme.org>, Juan Quintela <quintela@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20210223021646.500-1-jiangkunkun@huawei.com>
 <20210223021646.500-4-jiangkunkun@huawei.com> <cuna6rs48l2.fsf@dme.org>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <5438e9c9-2eee-5a2b-8a30-24c0d707e125@huawei.com>
Date: Mon, 1 Mar 2021 15:33:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <cuna6rs48l2.fsf@dme.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=jiangkunkun@huawei.com; helo=szxga03-in.huawei.com
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com, Keqian
 Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/2/25 20:48, David Edmondson wrote:
> On Tuesday, 2021-02-23 at 10:16:45 +08, Kunkun Jiang wrote:
>
>> Starting from pss->page, ram_save_host_page() will check every page
>> and send the dirty pages up to the end of the current host page or
>> the boundary of used_length of the block. If the host page size is
>> a huge page, the step "check" will take a lot of time.
>>
>> This will improve performance to use migration_bitmap_find_dirty().
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> ---
>>   migration/ram.c | 14 ++++++++------
>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index c7e18dc2fc..c7a2350198 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -1994,6 +1994,8 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>>       int tmppages, pages = 0;
>>       size_t pagesize_bits =
>>           qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
>> +    unsigned long hostpage_boundary =
>> +        QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
>>       unsigned long start_page = pss->page;
>>       int res;
>>   
>> @@ -2005,8 +2007,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>>       do {
>>           /* Check the pages is dirty and if it is send it */
>>           if (!migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
>> -            pss->page++;
>> -            continue;
>> +            goto find_next;
>>           }
>>   
>>           tmppages = ram_save_target_page(rs, pss, last_stage);
>> @@ -2015,16 +2016,17 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>>           }
>>   
>>           pages += tmppages;
>> -        pss->page++;
>>           /* Allow rate limiting to happen in the middle of huge pages */
>>           if (pagesize_bits > 1) {
>>               migration_rate_limit();
>>           }
>> -    } while ((pss->page & (pagesize_bits - 1)) &&
>> +find_next:
>> +        pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
>> +    } while ((pss->page < hostpage_boundary) &&
>>                offset_in_ramblock(pss->block,
>>                                   ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
> This ends up looking very messy, with a goto inside the loop.
>
> Wouldn't it be cleaner to invert the sense of the
> migration_bitmap_clear_dirty() test, such that
> migration_bitmap_find_dirty() is called after the body of the test?
Sorry for the late reply.
Thanks for your advice.  I will post a v2 as soon as possible.

Best Regards.

Kunkun Jiang

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



