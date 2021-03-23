Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4FA3455B5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:50:42 +0100 (CET)
Received: from localhost ([::1]:56706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOX7x-0003qp-Rx
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lOX6Z-0003I6-Qe
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 22:49:15 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lOX6W-0006Oz-Pc
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 22:49:15 -0400
Received: from DGGEML404-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4F4G3z698szYNBG;
 Tue, 23 Mar 2021 10:47:11 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEML404-HUB.china.huawei.com (10.3.17.39) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Tue, 23 Mar 2021 10:49:00 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Tue, 23 Mar 2021 10:48:59 +0800
Subject: Re: [RFC PATCH 0/3] vfio/migration: Support manual clear vfio dirty
 log
To: "Tian, Kevin" <kevin.tian@intel.com>, Alex Williamson
 <alex.williamson@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Kirti Wankhede" <kwankhede@nvidia.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>, Tarun Gupta
 <targupta@nvidia.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20210310094106.2191-1-jiangkunkun@huawei.com>
 <MWHPR11MB188608DDA524E353866268AE8C699@MWHPR11MB1886.namprd11.prod.outlook.com>
 <ba20233b-c5c0-cf3f-e4fa-ecb1e054ff54@huawei.com>
 <MWHPR11MB1886BC40825E4FADA1BFB93F8C699@MWHPR11MB1886.namprd11.prod.outlook.com>
 <fa31ed64-1c6e-f7db-7650-656a22223501@huawei.com>
 <MWHPR11MB18868922447227A48272039F8C699@MWHPR11MB1886.namprd11.prod.outlook.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <c61b2170-2971-d2c4-29eb-cf1a3885ee0e@huawei.com>
Date: Tue, 23 Mar 2021 10:48:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB18868922447227A48272039F8C699@MWHPR11MB1886.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme709-chm.china.huawei.com (10.1.199.105) To
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
Cc: Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com"
 <shameerali.kolothum.thodi@huawei.com>, Zenghui Yu <yuzenghui@huawei.com>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/3/18 20:36, Tian, Kevin wrote:
>> From: Kunkun Jiang <jiangkunkun@huawei.com>
>> Sent: Thursday, March 18, 2021 8:29 PM
>>
>> Hi Kevin,
>>
>> On 2021/3/18 17:04, Tian, Kevin wrote:
>>>> From: Kunkun Jiang <jiangkunkun@huawei.com>
>>>> Sent: Thursday, March 18, 2021 3:59 PM
>>>>
>>>> Hi Kevin,
>>>>
>>>> On 2021/3/18 14:28, Tian, Kevin wrote:
>>>>>> From: Kunkun Jiang
>>>>>> Sent: Wednesday, March 10, 2021 5:41 PM
>>>>>>
>>>>>> Hi all,
>>>>>>
>>>>>> In the past, we clear dirty log immediately after sync dirty log to
>>>>>> userspace. This may cause redundant dirty handling if userspace
>>>>>> handles dirty log iteratively:
>>>>>>
>>>>>> After vfio clears dirty log, new dirty log starts to generate. These
>>>>>> new dirty log will be reported to userspace even if they are generated
>>>>>> before userspace handles the same dirty page.
>>>>>>
>>>>>> Since a new dirty log tracking method for vfio based on iommu
>> hwdbm[1]
>>>>>> has been introduced in the kernel and added a new capability named
>>>>>> VFIO_DIRTY_LOG_MANUAL_CLEAR, we can eliminate some redundant
>>>> dirty
>>>>>> handling by supporting it.
>>>>> Is there any performance data showing the benefit of this new method?
>>>>>
>>>> Current dirty log tracking method for VFIO:
>>>> [1] All pages marked dirty if not all iommu_groups have pinned_scope
>>>> [2] pinned pages by various vendor drivers if all iommu_groups have
>>>> pinned scope
>>>>
>>>> Both methods are coarse-grained and can not determine which pages are
>>>> really dirty. Each round may mark the pages that are not really dirty as
>>>> dirty
>>>> and send them to the destination. ( It might be better if the range of the
>>>> pinned_scope was smaller. ) This will result in a waste of resources.
>>>>
>>>> HWDBM is short for Hardware Dirty Bit Management.
>>>> (e.g. smmuv3 HTTU, Hardware Translation Table Update)
>>>>
>>>> About SMMU HTTU:
>>>> HTTU is a feature of ARM SMMUv3, it can update access flag or/and dirty
>>>> state of the TTD (Translation Table Descriptor) by hardware.
>>>>
>>>> With HTTU, stage1 TTD is classified into 3 types:
>>>>                                     DBM bit AP[2](readonly bit)
>>>> 1. writable_clean          1                            1
>>>> 2. writable_dirty           1                            0
>>>> 3. readonly                   0                            1
>>>>
>>>> If HTTU_HD (manage dirty state) is enabled, smmu can change TTD from
>>>> writable_clean to writable_dirty. Then software can scan TTD to sync dirty
>>>> state into dirty bitmap. With this feature, we can track the dirty log of
>>>> DMA continuously and precisely.
>>>>
>>>> The capability of VFIO_DIRTY_LOG_MANUAL_CLEAR is similar to that on
>>>> the KVM side. We add this new log_clear() interface only to split the old
>>>> log_sync() into two separated procedures:
>>>>
>>>> - use log_sync() to collect the collection only, and,
>>>> - use log_clear() to clear the dirty bitmap.
>>>>
>>>> If you're interested in this new method, you can take a look at our set of
>>>> patches.
>>>> [1]
>>>> https://lore.kernel.org/linux-iommu/20210310090614.26668-1-
>>>> zhukeqian1@huawei.com/
>>>>
>>> I know what you are doing. Intel is also working on VT-d dirty bit support
>>> based on above link. What I'm curious is the actual performance gain
>>> with this optimization. KVM doing that is one good reference, but IOMMU
>>> has different characteristics (e.g. longer invalidation latency) compared to
>>> CPU MMU. It's always good to understand what a so-called optimization
>>> can actually optimize in a context different from where it's originally
>> proved.😊
>>> Thanks
>>> Kevin
>> My understanding is that this is a new method, which is quite different
>> from the
>> previous two. So can you explain in more detail what performance data
>> you want?😁
>>
>> Thanks,
>> Kunkun Jiang
> When you have HTTU enabled, compare the migration efficiency with and
> without this manual clear interface.
>
> Thanks
> Kevin

Hi Kevin,

Sorry for late reply.

I tested it on our FPGA in two scenarios.
[1] perform limited times of DMA on a fixed ram area
[2] perform infinite DMA on a fixed ram area

In scenario [1], we can clearly see that lesser data is being transmitted
with this manual clear interface. For example, a total of 10 DMA are
performed, the amount of transferred data is the sum of 6 times. This
depends on whether the device performs a DMA on the dirty ram
area between log_sync() and log_clear().

In scenario [2], with or without this manual clear interface, it doesn't
make a big difference. Every time we call log_sync(), the fixed ram
area is dirty.

So, in general scenarios, it can reduce the amount of transmitted data.

In addition, regarding the difference between MMU and IOMMU (e.g.
longer invalidation latency) you mentioned last time, I think it has no
effect on this manual clear interface. Currently, the way we invalidate
IOMMU TLB is iommu_flush_iotlb_all(). It takes lesser time than multiple,
range-based invalidation.

Thanks,
Kunkun Jiang


