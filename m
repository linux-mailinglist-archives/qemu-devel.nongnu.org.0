Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EB2267D64
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Sep 2020 05:00:05 +0200 (CEST)
Received: from localhost ([::1]:58658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHIFI-0006lP-VG
	for lists+qemu-devel@lfdr.de; Sat, 12 Sep 2020 23:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kHIEV-0006K0-96
 for qemu-devel@nongnu.org; Sat, 12 Sep 2020 22:59:15 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:43206 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kHIES-0001zj-Mt
 for qemu-devel@nongnu.org; Sat, 12 Sep 2020 22:59:14 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 574D74D7BA42887E260A;
 Sun, 13 Sep 2020 10:59:08 +0800 (CST)
Received: from [10.174.186.4] (10.174.186.4) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0;
 Sun, 13 Sep 2020 10:59:01 +0800
Subject: Re: [PATCH v7 06/12] migration/dirtyrate: Record hash results for
 each sampled page
To: Li Qiang <liq3ea@gmail.com>
References: <1599661096-127913-1-git-send-email-zhengchuan@huawei.com>
 <1599661096-127913-7-git-send-email-zhengchuan@huawei.com>
 <CAKXe6SJBwKU-hFvEOCnE-N4mqT5+iBHA+220HBbxX5C-F9b0Gw@mail.gmail.com>
From: Zheng Chuan <zhengchuan@huawei.com>
Message-ID: <e55d6294-6449-9015-0580-33ee05ada800@huawei.com>
Date: Sun, 13 Sep 2020 10:59:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAKXe6SJBwKU-hFvEOCnE-N4mqT5+iBHA+220HBbxX5C-F9b0Gw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.186.4]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhengchuan@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/12 22:59:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.543,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, dme@dme.org,
 Juan Quintela <quintela@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, xiexiangyou@huawei.com,
 Qemu Developers <qemu-devel@nongnu.org>, AlexChen <alex.chen@huawei.com>,
 ann.zhuangyanying@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/9/10 21:51, Li Qiang wrote:
> Chuan Zheng <zhengchuan@huawei.com> 于2020年9月9日周三 下午10:14写道：
>>
>> Record hash results for each sampled page, crc32 is taken to calculate
>> hash results for each sampled length in TARGET_PAGE_SIZE.
>>
>> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
>> Signed-off-by: YanYing Zhuang <ann.zhuangyanying@huawei.com>
>> Reviewed-by: David Edmondson <david.edmondson@oracle.com>
>> ---
>>  migration/dirtyrate.c | 125 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 125 insertions(+)
>>
>> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
>> index d56cd93..bc87269 100644
>> --- a/migration/dirtyrate.c
>> +++ b/migration/dirtyrate.c
>> @@ -10,6 +10,7 @@
>>   * See the COPYING file in the top-level directory.
>>   */
>>
>> +#include <zlib.h>
>>  #include "qemu/osdep.h"
>>  #include "qapi/error.h"
>>  #include "cpu.h"
>> @@ -68,6 +69,130 @@ static void update_dirtyrate(uint64_t msec)
>>      DirtyStat.dirty_rate = dirtyrate;
>>  }
>>
>> +/*
>> + * get hash result for the sampled memory with length of TARGET_PAGE_SIZE
>> + * in ramblock, which starts from ramblock base address.
>> + */
>> +static uint32_t get_ramblock_vfn_hash(struct RamblockDirtyInfo *info,
>> +                                      uint64_t vfn)
>> +{
>> +    uint32_t crc;
>> +
>> +    crc = crc32(0, (info->ramblock_addr +
>> +                vfn * TARGET_PAGE_SIZE), TARGET_PAGE_SIZE);
>> +
>> +    return crc;
>> +}
>> +
>> +static int save_ramblock_hash(struct RamblockDirtyInfo *info)
>> +{
>> +    unsigned int sample_pages_count;
>> +    int i;
>> +    GRand *rand;
>> +
>> +    sample_pages_count = info->sample_pages_count;
>> +
>> +    /* ramblock size less than one page, return success to skip this ramblock */
>> +    if (unlikely(info->ramblock_pages == 0 || sample_pages_count == 0)) {
>> +        return 0;
>> +    }
>> +
>> +    info->hash_result = g_try_malloc0_n(sample_pages_count,
>> +                                        sizeof(uint32_t));
>> +    if (!info->hash_result) {
>> +        return -1;
>> +    }
>> +
>> +    info->sample_page_vfn = g_try_malloc0_n(sample_pages_count,
>> +                                            sizeof(uint64_t));
>> +    if (!info->sample_page_vfn) {
>> +        g_free(info->hash_result);
>> +        return -1;
>> +    }
>> +
>> +    rand  = g_rand_new();
>> +    for (i = 0; i < sample_pages_count; i++) {
>> +        info->sample_page_vfn[i] = g_rand_int_range(rand, 0,
>> +                                                    info->ramblock_pages - 1);
>> +        info->hash_result[i] = get_ramblock_vfn_hash(info,
>> +                                                     info->sample_page_vfn[i]);
>> +    }
>> +    g_rand_free(rand);
>> +
>> +    return 0;
>> +}
>> +
>> +static void get_ramblock_dirty_info(RAMBlock *block,
>> +                                    struct RamblockDirtyInfo *info,
>> +                                    struct DirtyRateConfig *config)
>> +{
>> +    uint64_t sample_pages_per_gigabytes = config->sample_pages_per_gigabytes;
>> +
>> +    /* Right shift 30 bits to calc ramblock size in GB */
>> +    info->sample_pages_count = (qemu_ram_get_used_length(block) *
>> +                                sample_pages_per_gigabytes) >> 30;
>> +    /* Right shift TARGET_PAGE_BITS to calc page count */
>> +    info->ramblock_pages = qemu_ram_get_used_length(block) >>
>> +                           TARGET_PAGE_BITS;
>> +    info->ramblock_addr = qemu_ram_get_host_addr(block);
>> +    strcpy(info->idstr, qemu_ram_get_idstr(block));
>> +}
>> +
>> +static struct RamblockDirtyInfo *
>> +alloc_ramblock_dirty_info(int *block_index,
>> +                          struct RamblockDirtyInfo *block_dinfo)
>> +{
>> +    struct RamblockDirtyInfo *info = NULL;
>> +    int index = *block_index;
>> +
>> +    if (!block_dinfo) {
>> +        index = 0;
>> +        block_dinfo = g_try_new(struct RamblockDirtyInfo, 1);
>> +    } else {
>> +        index++;
>> +        block_dinfo = g_try_realloc(block_dinfo, (index + 1) *
>> +                                    sizeof(struct RamblockDirtyInfo));
>> +    }
>> +    if (!block_dinfo) {
>> +        return NULL;
> 
> What if this case happens the 'index' has been increased?  but the
> allocation is failed.
> 
>> +    }
>> +
>> +    info = &block_dinfo[index];
>> +    *block_index = index;
>> +    memset(info, 0, sizeof(struct RamblockDirtyInfo));
>> +
>> +    return block_dinfo;
>> +}
>> +
>> +static int record_ramblock_hash_info(struct RamblockDirtyInfo **block_dinfo,
>> +                                     struct DirtyRateConfig config,
>> +                                     int *block_index)
>> +{
>> +    struct RamblockDirtyInfo *info = NULL;
>> +    struct RamblockDirtyInfo *dinfo = NULL;
>> +    RAMBlock *block = NULL;
>> +    int index = 0;
>> +
>> +    RAMBLOCK_FOREACH_MIGRATABLE(block) {
>> +        dinfo = alloc_ramblock_dirty_info(&index, dinfo);
> 
> Here for every migratable block, you call 'alloc_ramblock_dirty_info'.
> This also complicates the 'alloc_ramblock_dirty_info' itself as:
> 1. you need to differentiate the first and other element.
> 2. you need to use two out parameter which seems can make confusion.
> 
> Could we allocates this array at onetime.  This maybe two iteration
> the ram block list.
> But I think may make the code more simple and clean.
> 
> Thank,s
> Li Qiang
> 
Hi, Qiang.
Thank you for your review.
I am not sure if i fully understand what's you mean:)
You mean we first record total index by first iteration
the ram block list and allocate array at onetime？

>> +        if (dinfo == NULL) {
>> +            return -1;
>> +        }
>> +        info = &dinfo[index];
>> +        get_ramblock_dirty_info(block, info, &config);
>> +        if (save_ramblock_hash(info) < 0) {
>> +            *block_dinfo = dinfo;
>> +            *block_index = index;
> 
> As the first comment, here 'index' seems not right?
> 
> 
> Thanks,
> Li Qiang
>> +            return -1;
>> +        }
>> +    }
>> +
>> +    *block_dinfo = dinfo;
>> +    *block_index = index;
>> +
>> +    return 0;
>> +}
>> +
>>  static void calculate_dirtyrate(struct DirtyRateConfig config)
>>  {
>>      /* todo */
>> --
>> 1.8.3.1
>>
>>
> 
> .
> 

