Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB5A3310BB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:25:00 +0100 (CET)
Received: from localhost ([::1]:45350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGod-0003Kp-Pu
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lJGOu-0000TY-U1
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:58:24 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lJGOr-0004Fs-Q5
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:58:24 -0500
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4DvKdM43MBzRMtn;
 Mon,  8 Mar 2021 21:56:39 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 8 Mar 2021 21:58:15 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 8 Mar 2021 21:58:15 +0800
Subject: Re: [PATCH v3 3/3] migration/ram: Optimize ram_save_host_page()
To: Peter Xu <peterx@redhat.com>
References: <20210305075035.1852-1-jiangkunkun@huawei.com>
 <20210305075035.1852-4-jiangkunkun@huawei.com>
 <20210305143033.GF397383@xz-x1>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <228f70c3-4c4f-5d21-c2f0-1be7c0d7aea5@huawei.com>
Date: Mon, 8 Mar 2021 21:58:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210305143033.GF397383@xz-x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangkunkun@huawei.com; helo=szxga02-in.huawei.com
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
Cc: Juan Quintela <quintela@redhat.com>, David Edmondson <dme@dme.org>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alexey Romko <nevilad@yahoo.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2021/3/5 22:30, Peter Xu wrote:
> On Fri, Mar 05, 2021 at 03:50:35PM +0800, Kunkun Jiang wrote:
>> Starting from pss->page, ram_save_host_page() will check every page
>> and send the dirty pages up to the end of the current host page or
>> the boundary of used_length of the block. If the host page size is
>> a huge page, the step "check" will take a lot of time.
>>
>> This will improve performance to use migration_bitmap_find_dirty().
> Is there any measurement done?
I tested it on Kunpeng 920.  VM params: 1U 4G( page size 1G).
The time of ram_save_host_page() in the last round of ram saving:
before optimize: 9250us               after optimize: 34us
> This looks like an optimization, but to me it seems to have changed a lot
> context that it doesn't need to... Do you think it'll also work to just look up
> dirty again and update pss->page properly if migration_bitmap_clear_dirty()
> returned zero?
>
> Thanks,
This just inverted the body of the loop, suggested by @David Edmondson.
Here is the v2[1]. Do you mean to change it like this?

[1]: 
http://patchwork.ozlabs.org/project/qemu-devel/patch/20210301082132.1107-4-jiangkunkun@huawei.com/

Thanks,
Kunkun Jiang
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> ---
>>   migration/ram.c | 39 +++++++++++++++++++--------------------
>>   1 file changed, 19 insertions(+), 20 deletions(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 9fc5b2997c..28215aefe4 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -1991,6 +1991,8 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>>       int pages = 0;
>>       size_t pagesize_bits =
>>           qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
>> +    unsigned long hostpage_boundary =
>> +        QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
>>       unsigned long start_page = pss->page;
>>       int res;
>>   
>> @@ -2003,30 +2005,27 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>>           int pages_this_iteration = 0;
>>   
>>           /* Check if the page is dirty and send it if it is */
>> -        if (!migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
>> -            pss->page++;
>> -            continue;
>> -        }
>> -
>> -        pages_this_iteration = ram_save_target_page(rs, pss, last_stage);
>> -        if (pages_this_iteration < 0) {
>> -            return pages_this_iteration;
>> -        }
>> +        if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
>> +            pages_this_iteration = ram_save_target_page(rs, pss, last_stage);
>> +            if (pages_this_iteration < 0) {
>> +                return pages_this_iteration;
>> +            }
>>   
>> -        pages += pages_this_iteration;
>> -        pss->page++;
>> -        /*
>> -         * Allow rate limiting to happen in the middle of huge pages if
>> -         * something is sent in the current iteration.
>> -         */
>> -        if (pagesize_bits > 1 && pages_this_iteration > 0) {
>> -            migration_rate_limit();
>> +            pages += pages_this_iteration;
>> +            /*
>> +             * Allow rate limiting to happen in the middle of huge pages if
>> +             * something is sent in the current iteration.
>> +             */
>> +            if (pagesize_bits > 1 && pages_this_iteration > 0) {
>> +                migration_rate_limit();
>> +            }
>>           }
>> -    } while ((pss->page & (pagesize_bits - 1)) &&
>> +        pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
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
>>


