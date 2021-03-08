Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49EB330B59
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:36:51 +0100 (CET)
Received: from localhost ([::1]:36440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJDFq-0007XY-Sc
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lJDEB-0006Ye-1D
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:35:07 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lJDE8-0008Ax-KQ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:35:06 -0500
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4DvF5Q5gzTzWCrS;
 Mon,  8 Mar 2021 18:32:10 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 8 Mar 2021 18:35:00 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 8 Mar 2021 18:35:00 +0800
Subject: Re: [PATCH v3 2/3] migration/ram: Reduce unnecessary rate limiting
To: Peter Xu <peterx@redhat.com>
References: <20210305075035.1852-1-jiangkunkun@huawei.com>
 <20210305075035.1852-3-jiangkunkun@huawei.com>
 <20210305142250.GE397383@xz-x1>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <a4c34c08-b686-8ec1-8e8d-2770e26e38c5@huawei.com>
Date: Mon, 8 Mar 2021 18:34:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210305142250.GE397383@xz-x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On 2021/3/5 22:22, Peter Xu wrote:
> Kunkun,
>
> On Fri, Mar 05, 2021 at 03:50:34PM +0800, Kunkun Jiang wrote:
>> When the host page is a huge page and something is sent in the
>> current iteration, the migration_rate_limit() should be executed.
>> If not, this function can be omitted to save time.
>>
>> Rename tmppages to pages_this_iteration to express its meaning
>> more clearly.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> ---
>>   migration/ram.c | 21 ++++++++++++++-------
>>   1 file changed, 14 insertions(+), 7 deletions(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index a168da5cdd..9fc5b2997c 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -1988,7 +1988,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
>>   static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>>                                 bool last_stage)
>>   {
>> -    int tmppages, pages = 0;
>> +    int pages = 0;
>>       size_t pagesize_bits =
>>           qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
>>       unsigned long start_page = pss->page;
>> @@ -2000,21 +2000,28 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>>       }
>>   
>>       do {
>> +        int pages_this_iteration = 0;
>> +
>>           /* Check if the page is dirty and send it if it is */
>>           if (!migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
>>               pss->page++;
>>               continue;
>>           }
>>   
>> -        tmppages = ram_save_target_page(rs, pss, last_stage);
>> -        if (tmppages < 0) {
>> -            return tmppages;
>> +        pages_this_iteration = ram_save_target_page(rs, pss, last_stage);
>> +        if (pages_this_iteration < 0) {
>> +            return pages_this_iteration;
>>           }
>>   
>> -        pages += tmppages;
>> +        pages += pages_this_iteration;
> To me, both names are okay, it's just that the new name doesn't really provide
> a lot more new information, while it's even longer...
>
> Since you seem to prefer cleaning up tmppages, I'm actually thinking whether
> it should be called as "pages" at all since ram_save_target_page() majorly only
> returns either 1 if succeeded or <0 if error.  There's only one very corner
> case of xbzrle where it can return 0 in save_xbzrle_page():
>
>      if (encoded_len == 0) {
>          trace_save_xbzrle_page_skipping();
>          return 0;
>      }
>
> I think it means the page didn't change at all, then I'm also wondering maybe
> it can also return 1 showing one page migrated (though actually skipped!) which
> should still be fine for the callers, e.g., ram_find_and_save_block() who will
> finally check this "pages" value.
>
> So I think _maybe_ that's a nicer cleanup to change that "return 0" to "return
> 1", then another patch to make the return value to be (1) return 0 if page
> saved, or (2) return <0 if error.  Then here in ram_save_host_page() tmppages
> can be renamed to "ret" or "succeed".
Thanks for your advice.
change "return 0" to "return 1" would have a slight effect on 
'rs->target_page_count += pages'
in ram_save_iterate(). This may lead to consider more complex 
situations. What do you think of
this?
>>           pss->page++;
>> -        /* Allow rate limiting to happen in the middle of huge pages */
>> -        migration_rate_limit();
>> +        /*
>> +         * Allow rate limiting to happen in the middle of huge pages if
>> +         * something is sent in the current iteration.
>> +         */
>> +        if (pagesize_bits > 1 && pages_this_iteration > 0) {
>> +            migration_rate_limit();
>> +        }
> I don't know whether this matters either..  Two calls in there:
>
>      migration_update_counters(s, now);
>      qemu_file_rate_limit(s->to_dst_file);
>
> migration_update_counters() is mostly a noop for 99.9% cases. Looks still okay...
>
> Thanks,
I think even these two calls shouldn't be called if the host page size 
isn't a huge page or
nothing is sent in the current iteration.

Thanks,
Kunkun Jiang
>>       } while ((pss->page & (pagesize_bits - 1)) &&
>>                offset_in_ramblock(pss->block,
>>                                   ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
>> -- 
>> 2.23.0
>>


