Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AED35C7F3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 15:49:59 +0200 (CEST)
Received: from localhost ([::1]:55842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVwww-0002k5-EL
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 09:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lVwsz-0007TH-To; Mon, 12 Apr 2021 09:45:55 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lVwsu-0004Yw-8v; Mon, 12 Apr 2021 09:45:53 -0400
Received: from DGGEML404-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FJqfH3NffzWX5V;
 Mon, 12 Apr 2021 21:41:59 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEML404-HUB.china.huawei.com (10.3.17.39) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 12 Apr 2021 21:45:35 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 12 Apr 2021 21:45:35 +0800
Subject: Re: [RFC PATCH 1/3] vfio: Introduce helpers to mark dirty pages of a
 RAM section
To: Auger Eric <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20210219094230.231-1-jiangkunkun@huawei.com>
 <20210219094230.231-2-jiangkunkun@huawei.com>
 <41dc3143-34ce-4794-e70e-f91ec96cced6@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <f10582da-b15a-85e3-a7cc-892ea6668831@huawei.com>
Date: Mon, 12 Apr 2021 21:45:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <41dc3143-34ce-4794-e70e-f91ec96cced6@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme705-chm.china.huawei.com (10.1.199.101) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
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
 Zhu <zhukeqian1@huawei.com>, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 2021/4/8 21:46, Auger Eric wrote:
> Hi Kunkun,
>
> On 2/19/21 10:42 AM, Kunkun Jiang wrote:
>> Extract part of the code from vfio_sync_dirty_bitmap to form a
>> new helper, which allows to mark dirty pages of a RAM section.
>> This helper will be called for nested stage.
>>
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> ---
>>   hw/vfio/common.c | 22 ++++++++++++++--------
>>   1 file changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 9225f10722..7c50905856 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -1203,6 +1203,19 @@ err_out:
>>       return ret;
>>   }
>>   
>> +static int vfio_dma_sync_ram_section_dirty_bitmap(VFIOContainer *container,
>> +                                                  MemoryRegionSection *section)
>> +{
>> +    ram_addr_t ram_addr;
>> +
>> +    ram_addr = memory_region_get_ram_addr(section->mr) +
>> +               section->offset_within_region;
>> +
>> +    return vfio_get_dirty_bitmap(container,
>> +                       TARGET_PAGE_ALIGN(section->offset_within_address_space),
>> +                       int128_get64(section->size), ram_addr);
>> +}
>> +
>>   typedef struct {
>>       IOMMUNotifier n;
>>       VFIOGuestIOMMU *giommu;
>> @@ -1244,8 +1257,6 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>>   static int vfio_sync_dirty_bitmap(VFIOContainer *container,
>>                                     MemoryRegionSection *section)
>>   {
>> -    ram_addr_t ram_addr;
>> -
>>       if (memory_region_is_iommu(section->mr)) {
>>           VFIOGuestIOMMU *giommu;
>>   
>> @@ -1274,12 +1285,7 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
>>           return 0;
>>       }
>>   
>> -    ram_addr = memory_region_get_ram_addr(section->mr) +
>> -               section->offset_within_region;
>> -
>> -    return vfio_get_dirty_bitmap(container,
>> -                       TARGET_PAGE_ALIGN(section->offset_within_address_space),
> this is now REAL_HOST_PAGE_ALIGN
>
> Thanks
>
> Eric
Sorry for late replay.

Yes, it is REAL_HOST_PAGE_ALIGN now which modified by a patch I sent 
earlier.

I posted v2 a few days ago and I have modified TARGET_PAGE_ALIGN to
REAL_HOST_PAGE_ALIGN.[1]

[1] 
https://lore.kernel.org/qemu-devel/20210331101259.2153-2-jiangkunkun@huawei.com/

Thanks,
Kunkun Jiang
>> -                       int128_get64(section->size), ram_addr);
>> +    return vfio_dma_sync_ram_section_dirty_bitmap(container, section);
>>   }
>>   
>>   static void vfio_listerner_log_sync(MemoryListener *listener,
>>
> .



