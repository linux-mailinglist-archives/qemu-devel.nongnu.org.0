Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66726252B17
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 12:04:44 +0200 (CEST)
Received: from localhost ([::1]:54572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAsIN-0005ih-HE
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 06:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kAsHG-0005Db-RS
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 06:03:34 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4268 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kAsHE-0003CM-Cj
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 06:03:34 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id F3E7EECAC5332C66EB52;
 Wed, 26 Aug 2020 18:03:23 +0800 (CST)
Received: from [127.0.0.1] (10.174.186.4) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Wed, 26 Aug 2020
 18:03:16 +0800
Subject: Re: [PATCH v5 03/12] migration/dirtyrate: Add RamlockDirtyInfo to
 store sampled page info
From: Zheng Chuan <zhengchuan@huawei.com>
To: David Edmondson <dme@dme.org>
References: <1598260480-64862-1-git-send-email-zhengchuan@huawei.com>
 <1598260480-64862-4-git-send-email-zhengchuan@huawei.com>
 <m2lfi1lpqj.fsf@dme.org> <a689e7ed-c685-231d-e9f8-61cc2167a71f@huawei.com>
Message-ID: <e1b489c1-b480-be1f-d41e-81aacaf50a9a@huawei.com>
Date: Wed, 26 Aug 2020 18:03:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a689e7ed-c685-231d-e9f8-61cc2167a71f@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.4]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhengchuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 06:03:24
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.602,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, alex.chen@huawei.com, ann.zhuangyanying@huawei.com,
 fangying1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/8/26 17:40, Zheng Chuan wrote:
> 
> 
> On 2020/8/26 17:29, David Edmondson wrote:
>> On Monday, 2020-08-24 at 17:14:31 +08, Chuan Zheng wrote:
>>
>>> Add RamlockDirtyInfo to store sampled page info of each ramblock.
>>>
>>> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
>>> ---
>>>  migration/dirtyrate.h | 18 ++++++++++++++++++
>>>  1 file changed, 18 insertions(+)
>>>
>>> diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
>>> index 33669b7..70000da 100644
>>> --- a/migration/dirtyrate.h
>>> +++ b/migration/dirtyrate.h
>>> @@ -19,6 +19,11 @@
>>>   */
>>>  #define DIRTYRATE_DEFAULT_SAMPLE_PAGES            512
>>>  
>>> +/*
>>> + * Record ramblock idstr
>>> + */
>>> +#define RAMBLOCK_INFO_MAX_LEN                     256
>>> +
>>>  /* Take 1s as default for calculation duration */
>>>  #define DEFAULT_FETCH_DIRTYRATE_TIME_SEC          1
>>>  
>>> @@ -27,6 +32,19 @@ struct DirtyRateConfig {
>>>      int64_t sample_period_seconds; /* time duration between two sampling */
>>>  };
>>>  
>>> +/*
>>> + * Store dirtypage info for each ramblock.
>>> + */
>>> +struct RamblockDirtyInfo {
>>> +    char idstr[RAMBLOCK_INFO_MAX_LEN]; /* idstr for each ramblock */
>>> +    uint8_t *ramblock_addr; /* base address of ramblock we measure */
>>> +    uint64_t ramblock_pages; /* ramblock size in 4K-page */
>>
>> It's probably a stupid question, but why not store a pointer to the
>> RAMBlock rather than copying some of the details?
>>
Missing this question:)
Since I only hold the RCU around each part separately, the RAMBlock
could disappear between the initial hash, and the later compare;  so
using the name makes it safe.
Again, Please refer to the newer patch series:)

>>> +    uint64_t *sample_page_vfn; /* relative offset address for sampled page */
>>> +    uint64_t sample_pages_count; /* count of sampled pages */
>>> +    uint64_t sample_dirty_count; /* cout of dirty pages we measure */
>>
>> "cout" -> "count"
>>
> Hi, David.
> Thank you for review.
> Actually I have resent [PATCH V5], but it's my fault to forget to add resent tag which may lead to confusing.
> In new patch series, this spell mistake is fixed.
> Please refer to the newer patch series:)
> 
>>> +    uint32_t *hash_result; /* array of hash result for sampled pages */
>>> +};
>>> +
>>>  void *get_dirtyrate_thread(void *arg);
>>>  #endif
>>>  
>>> -- 
>>> 1.8.3.1
>>
>> dme.
>>


