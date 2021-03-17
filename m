Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D510633E644
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 02:38:55 +0100 (CET)
Received: from localhost ([::1]:55168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lML9C-00013I-TP
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 21:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lML89-0008EO-1W
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 21:37:49 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lML85-0004iU-A1
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 21:37:48 -0400
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4F0Xl313v3z145kH;
 Wed, 17 Mar 2021 09:34:39 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 17 Mar 2021 09:37:39 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Wed, 17 Mar 2021 09:37:39 +0800
Subject: Re: [PATCH v4 1/2] migration/ram: Reduce unnecessary rate limiting
To: Peter Xu <peterx@redhat.com>, David Edmondson <dme@dme.org>
References: <20210316125716.1243-1-jiangkunkun@huawei.com>
 <20210316125716.1243-2-jiangkunkun@huawei.com>
 <20210316213906.GF395976@xz-x1>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <cbbe92e2-4ebf-476a-3733-8e1c7893702e@huawei.com>
Date: Wed, 17 Mar 2021 09:37:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210316213906.GF395976@xz-x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=jiangkunkun@huawei.com; helo=szxga08-in.huawei.com
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
Cc: Juan Quintela <quintela@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alexey Romko <nevilad@yahoo.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi  Peter,

On 2021/3/17 5:39, Peter Xu wrote:
> On Tue, Mar 16, 2021 at 08:57:15PM +0800, Kunkun Jiang wrote:
>> When the host page is a huge page and something is sent in the
>> current iteration, migration_rate_limit() should be executed.
>> If not, it can be omitted.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> Reviewed-by: David Edmondson <david.edmondson@oracle.com>
>> ---
>>   migration/ram.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 72143da0ac..3eb5b0d7a7 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -2015,8 +2015,13 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>>   
>>           pages += tmppages;
>>           pss->page++;
>> -        /* Allow rate limiting to happen in the middle of huge pages */
>> -        migration_rate_limit();
>> +        /*
>> +         * Allow rate limiting to happen in the middle of huge pages if
>> +         * something is sent in the current iteration.
>> +         */
>> +        if (pagesize_bits > 1 && tmppages > 0) {
>> +            migration_rate_limit();
>> +        }
> Sorry I'm still not a fan of this - I'd even prefer calling that once more just
> to make sure it won't be forgotten to be called..  Not to say it's merely a noop.
>
> I'll leave this to Dave..  Maybe I'm too harsh! :)
>
You are very serious and meticulous. I like your character very much.😉
This patch was used to reviewed by David. So, I want to know what
his opinion is.

@David
Hi David, what is your opinion on this patch?

Thanks,
Kunkun Jiang

