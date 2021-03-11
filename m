Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FE333699C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 02:26:42 +0100 (CET)
Received: from localhost ([::1]:45622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKA64-0008P8-Uu
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 20:26:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lKA4O-0007YV-D6
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 20:24:56 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:4387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lKA4K-0002aT-PS
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 20:24:56 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Dwrm96Fjvz17JSx;
 Thu, 11 Mar 2021 09:22:49 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Thu, 11 Mar 2021 09:24:31 +0800
Subject: Re: [PATCH] vfio: Support host translation granule size
To: Alex Williamson <alex.williamson@redhat.com>, Kunkun Jiang
 <jiangkunkun@huawei.com>
References: <20210304133446.1521-1-jiangkunkun@huawei.com>
 <20210309161713.1cc8ad2f@omen.home.shazbot.org>
 <40a933ef-25bb-d4e2-2284-639e446ee8bc@huawei.com>
 <20210310132446.26a621f9@omen.home.shazbot.org>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <381428a7-2e6b-0464-16fc-23b48f9e9924@huawei.com>
Date: Thu, 11 Mar 2021 09:24:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210310132446.26a621f9@omen.home.shazbot.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Liu Yi L <yi.l.liu@intel.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 shameerali.kolothum.thodi@huawei.com, Eric Auger <eric.auger@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 2021/3/11 4:24, Alex Williamson wrote:
> On Wed, 10 Mar 2021 15:19:33 +0800
> Kunkun Jiang <jiangkunkun@huawei.com> wrote:
> 
>> Hi Alex,
>>
>> On 2021/3/10 7:17, Alex Williamson wrote:
>>> On Thu, 4 Mar 2021 21:34:46 +0800
>>> Kunkun Jiang <jiangkunkun@huawei.com> wrote:
>>>  
>>>> The cpu_physical_memory_set_dirty_lebitmap() can quickly deal with
>>>> the dirty pages of memory by bitmap-traveling, regardless of whether
>>>> the bitmap is aligned correctly or not.
>>>>
>>>> cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap of
>>>> host page size. So it'd better to set bitmap_pgsize to host page size
>>>> to support more translation granule sizes.
>>>>
>>>> Fixes: 87ea529c502 (vfio: Get migration capability flags for container)
>>>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>>>> ---
>>>>   hw/vfio/common.c | 44 ++++++++++++++++++++++----------------------
>>>>   1 file changed, 22 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>>>> index 6ff1daa763..69fb5083a4 100644
>>>> --- a/hw/vfio/common.c
>>>> +++ b/hw/vfio/common.c
>>>> @@ -378,7 +378,7 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>>>>   {
>>>>       struct vfio_iommu_type1_dma_unmap *unmap;
>>>>       struct vfio_bitmap *bitmap;
>>>> -    uint64_t pages = TARGET_PAGE_ALIGN(size) >> TARGET_PAGE_BITS;
>>>> +    uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size;
>>>>       int ret;
>>>>   
>>>>       unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
>>>> @@ -390,12 +390,12 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>>>>       bitmap = (struct vfio_bitmap *)&unmap->data;
>>>>   
>>>>       /*
>>>> -     * cpu_physical_memory_set_dirty_lebitmap() expects pages in bitmap of
>>>> -     * TARGET_PAGE_SIZE to mark those dirty. Hence set bitmap_pgsize to
>>>> -     * TARGET_PAGE_SIZE.
>>>> +     * cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap of
>>>> +     * qemu_real_host_page_size to mark those dirty. Hence set bitmap_pgsize
>>>> +     * to qemu_real_host_page_size.  
>>>
>>> I don't see that this change is well supported by the code,
>>> cpu_physical_memory_set_dirty_lebitmap() seems to operate on  
>> Yes, cpu_physical_memory_set_dirty_lebitmap() is finally to operate on
>> TARGET_PAGE_SIZE. But actually it supports pages in bitmap of
>> qemu_real_host_page_size to mark those dirty. It uses
>> "hpratio = qemu_real_host_page_size / TARGET_PAGE_SIZE" to adapt to
>> different translation granule size(e.g. 4K 2M 1G).
> 
> Thanks for the explanation, it becomes more clear but I'm still a
> little confused.  It appears that
> cpu_physical_memory_set_dirty_lebitmap() requires a bitmap in terms of
> qemu_real_host_page_size which is translated to target pages using
> hpratio.  It's not clear to me by the explanation here and in the
> commit log that we're technically using the wrong page size reference
> for this function.
> 
>>> TARGET_PAGE_SIZE, and the next three patch chunks take a detour through
>>> memory listener code that seem unrelated to the change described in the
>>> commit log.  This claims to fix something, what is actually broken?
>>> Thanks,
>>>
>>> Alex  
>> This patch 87ea529c502 (vfio: Get migration capability flags for container)
>> is the start of the bug. The code of [1](marked below) restricts the host
>> page size must be TARGET_PAGE_SIZE(e.g. 4K) to set
>> container->dirty_pages_supported = true. It is inappropriate to limit the
>> page size to TARGET_PAGE_SIZE.
> 
> Right, the noted code requires that vfio supports the target page size,
> which for all practical purposes implies an hpratio = 1 currently.
> That unnecessarily restricts migration support to cases where target and
> host use the same page size, but this change allows migration in any
> case where vfio dirty bitmap supports the host page size, which is
> effectively any case where the device supports migration.  However, the
> hpratio calculation requires that qemu_real_host_page_size is >=
> TARGET_PAGE_SIZE, otherwise the value becomes zero and it appears we'd
> only ever dirty the target zero page.  Is this configuration restricted
> elsewhere, ex. 64K guest on 4K host?  Exchanging an unnecessary
> restriction for allowing a buggy configuration isn't a good trade-off.
> Thanks,
FYI, The restriction that (qemu_real_host_page_size is >= TARGET_PAGE_SIZE) has already
existed. As in the kvm_init(), we have an assert: assert(TARGET_PAGE_SIZE <= qemu_real_host_page_size);

As I understand, the TARGET_PAGE_SIZE is an architecture specific value,
and not affected by the page size of guest OS. For arm64, it is fixed to be
12 bit(4K), while the qemu_real_host_page_size depends on host kernel configuration,
it can be 4K, 16K or 64K.

IIUC, the kernel vfio/iommu_type1 actually reports supported page_size of dirty log
to be host_page_size, so if host use 16K or 64K, Qemu will refuse to support vfio migration.

Thanks,
Keqian



> 
> Alex
> 
>>>>        */
>>>>   
>>>> -    bitmap->pgsize = TARGET_PAGE_SIZE;
>>>> +    bitmap->pgsize = qemu_real_host_page_size;
>>>>       bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
>>>>                      BITS_PER_BYTE;
>>>>   
>>>> @@ -674,16 +674,16 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>>>           return;
>>>>       }
>>>>   
>>>> -    if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
>>>> -                 (section->offset_within_region & ~TARGET_PAGE_MASK))) {
>>>> +    if (unlikely((section->offset_within_address_space & ~qemu_real_host_page_mask) !=
>>>> +                 (section->offset_within_region & ~qemu_real_host_page_mask))) {
>>>>           error_report("%s received unaligned region", __func__);
>>>>           return;
>>>>       }
>>>>   
>>>> -    iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
>>>> +    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
>>>>       llend = int128_make64(section->offset_within_address_space);
>>>>       llend = int128_add(llend, section->size);
>>>> -    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
>>>> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
>>>>   
>>>>       if (int128_ge(int128_make64(iova), llend)) {
>>>>           return;
>>>> @@ -892,8 +892,8 @@ static void vfio_listener_region_del(MemoryListener *listener,
>>>>           return;
>>>>       }
>>>>   
>>>> -    if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
>>>> -                 (section->offset_within_region & ~TARGET_PAGE_MASK))) {
>>>> +    if (unlikely((section->offset_within_address_space & ~qemu_real_host_page_mask) !=
>>>> +                 (section->offset_within_region & ~qemu_real_host_page_mask))) {
>>>>           error_report("%s received unaligned region", __func__);
>>>>           return;
>>>>       }
>>>> @@ -921,10 +921,10 @@ static void vfio_listener_region_del(MemoryListener *listener,
>>>>            */
>>>>       }
>>>>   
>>>> -    iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
>>>> +    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
>>>>       llend = int128_make64(section->offset_within_address_space);
>>>>       llend = int128_add(llend, section->size);
>>>> -    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
>>>> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
>>>>   
>>>>       if (int128_ge(int128_make64(iova), llend)) {
>>>>           return;
>>>> @@ -1004,13 +1004,13 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>>>>       range->size = size;
>>>>   
>>>>       /*
>>>> -     * cpu_physical_memory_set_dirty_lebitmap() expects pages in bitmap of
>>>> -     * TARGET_PAGE_SIZE to mark those dirty. Hence set bitmap's pgsize to
>>>> -     * TARGET_PAGE_SIZE.
>>>> +     * cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap of
>>>> +     * qemu_real_host_page_size to mark those dirty. Hence set bitmap's pgsize
>>>> +     * to qemu_real_host_page_size.
>>>>        */
>>>> -    range->bitmap.pgsize = TARGET_PAGE_SIZE;
>>>> +    range->bitmap.pgsize = qemu_real_host_page_size;
>>>>   
>>>> -    pages = TARGET_PAGE_ALIGN(range->size) >> TARGET_PAGE_BITS;
>>>> +    pages = REAL_HOST_PAGE_ALIGN(range->size) / qemu_real_host_page_size;
>>>>       range->bitmap.size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
>>>>                                            BITS_PER_BYTE;
>>>>       range->bitmap.data = g_try_malloc0(range->bitmap.size);
>>>> @@ -1114,7 +1114,7 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
>>>>                  section->offset_within_region;
>>>>   
>>>>       return vfio_get_dirty_bitmap(container,
>>>> -                       TARGET_PAGE_ALIGN(section->offset_within_address_space),
>>>> +                       REAL_HOST_PAGE_ALIGN(section->offset_within_address_space),
>>>>                          int128_get64(section->size), ram_addr);
>>>>   }
>>>>   
>>>> @@ -1655,10 +1655,10 @@ static void vfio_get_iommu_info_migration(VFIOContainer *container,
>>>>                               header);
>>>>   
>>>>       /*
>>>> -     * cpu_physical_memory_set_dirty_lebitmap() expects pages in bitmap of
>>>> -     * TARGET_PAGE_SIZE to mark those dirty.
>>>> +     * cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap of
>>>> +     * qemu_real_host_page_size to mark those dirty.
>>>>        */
>>>> -    if (cap_mig->pgsize_bitmap & TARGET_PAGE_SIZE) {
>>>> +    if (cap_mig->pgsize_bitmap & qemu_real_host_page_size) {  
>> [1]
>>>>           container->dirty_pages_supported = true;
>>>>           container->max_dirty_bitmap_size = cap_mig->max_dirty_bitmap_size;
>>>>           container->dirty_pgsizes = cap_mig->pgsize_bitmap;  
>>> .  
>>
>>
> 
> .
> 

