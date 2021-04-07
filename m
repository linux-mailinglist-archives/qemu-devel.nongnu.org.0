Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A47D35681F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 11:34:19 +0200 (CEST)
Received: from localhost ([::1]:58468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU4Zm-0007wK-5c
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 05:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lU4YS-0007SP-B2
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 05:32:56 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lU4YO-0008AJ-4K
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 05:32:55 -0400
Received: from DGGEML403-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FFfH13Qn7z14D6t;
 Wed,  7 Apr 2021 17:29:17 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEML403-HUB.china.huawei.com (10.3.17.33) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 7 Apr 2021 17:32:46 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Wed, 7 Apr 2021 17:32:43 +0800
Subject: Re: [PATCH v4 0/2] Some modification about ram_save_host_page()
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210316125716.1243-1-jiangkunkun@huawei.com>
 <7e722b03-c6d4-4246-bcb6-d8393fa07a49@huawei.com> <YGyXEhvSxW32uywG@work-vm>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <04961810-a0d0-4bf4-27bd-fc2f3b208a6c@huawei.com>
Date: Wed, 7 Apr 2021 17:32:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YGyXEhvSxW32uywG@work-vm>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme708-chm.china.huawei.com (10.1.199.104) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=jiangkunkun@huawei.com; helo=szxga08-in.huawei.com
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
Cc: Juan Quintela <quintela@redhat.com>, David Edmondson <dme@dme.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alexey Romko <nevilad@yahoo.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Dave,

On 2021/4/7 1:14, Dr. David Alan Gilbert wrote:
> * Kunkun Jiang (jiangkunkun@huawei.com) wrote:
>> Kindly ping,
>>
>> Hi David Alan Gilbert,
>> Will this series be picked up soon, or is there any other work for me to do?
> You don't need to do anything, but it did miss the cutoff for soft
> freeze; since it's an optimisation not a fix; it's still on my list so
> it'll go in just as soon as 6.1 opens up.
>
> Dave
Okay, I see. Thank you.

Best Regards,
Kunkun Jiang
>> Best Regards,
>> Kunkun Jiang
>>
>> On 2021/3/16 20:57, Kunkun Jiang wrote:
>>> Hi all,
>>>
>>> This series include patches as below:
>>> Patch 1:
>>> - reduce unnecessary rate limiting in ram_save_host_page()
>>>
>>> Patch 2:
>>> - optimized ram_save_host_page() by using migration_bitmap_find_dirty() to find
>>> dirty pages
>>>
>>> History:
>>>
>>> v3 -> v4:
>>> - Remove the modification to ram_save_host_page() comment [Peter Xu]
>>> - Remove the renaming of tmppages
>>>
>>> v2 -> v3:
>>> - Reduce unnecessary rate limiting if nothing is sent in the current iteration [David Edmondson]
>>> - Invert the body of the loop in ram_save_host_page() [David Edmondson]
>>>
>>> v1 -> v2:
>>> - Modify ram_save_host_page() comment [David Edmondson]
>>> - Remove 'goto' [David Edmondson]
>>>
>>> Kunkun Jiang (2):
>>>     migration/ram: Reduce unnecessary rate limiting
>>>     migration/ram: Optimize ram_save_host_page()
>>>
>>>    migration/ram.c | 34 +++++++++++++++++++---------------
>>>    1 file changed, 19 insertions(+), 15 deletions(-)
>>>


