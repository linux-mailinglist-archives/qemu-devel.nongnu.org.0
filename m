Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB5A20A180
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 17:02:56 +0200 (CEST)
Received: from localhost ([::1]:38308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joTOw-0001CH-M9
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 11:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1joTNj-0000g5-OW
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:01:39 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:4640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1joTNh-0007rw-85
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:01:39 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef4bc420002>; Thu, 25 Jun 2020 08:01:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 25 Jun 2020 08:01:35 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 25 Jun 2020 08:01:35 -0700
Received: from [10.40.100.228] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Jun
 2020 15:01:16 +0000
Subject: Re: [PATCH QEMU v25 15/17] vfio: Add ioctl to get dirty pages bitmap
 during dma unmap.
To: Alex Williamson <alex.williamson@redhat.com>
References: <1592684486-18511-1-git-send-email-kwankhede@nvidia.com>
 <1592684486-18511-16-git-send-email-kwankhede@nvidia.com>
 <20200624125614.5e742574@x1.home>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <8cf7ffdf-8ba4-d42d-cf8d-4af08686841a@nvidia.com>
Date: Thu, 25 Jun 2020 20:31:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200624125614.5e742574@x1.home>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593097282; bh=AveRosUOB9EBRLnR+jM6+lA1ALzsFCfCT1Fihe1EQSA=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=q7fSDIip0+CmP0aic2uG+GV6xPjDb7LGoRv9Su7mS+2vx42lDh6rGLxdZ3nmPr2OL
 m/u7UCR0kK7GSIKoWCpmTcKnUm4N4u4Y4rm9ctFtV9sM/k+zPWVCvbHczEdbHLnVfS
 dG3a5nrmYXjUoB+Mbojk0Ez+4m+eoTUYmQDKDkV34x3MZQqdbU47jnrf0khDBD6Drv
 +asEVdWBoys8kBvyeBMUvicx2EFKx3FoHljzsJyRCdcazBMSf/lFsrS0Hr2kkl7q1h
 E5dRdZNrf+yjakGd4N2InXINbuEfzcYPozKfoyIJsiL4OvMwa4CHhXknnDpgw1Hkqd
 zzK1Rk4UwMaiQ==
Received-SPF: pass client-ip=216.228.121.65; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate26.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 10:34:30
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: cohuck@redhat.com, cjia@nvidia.com, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com, eauger@redhat.com,
 yi.l.liu@intel.com, quintela@redhat.com, ziye.yang@intel.com,
 armbru@redhat.com, mlevitsk@redhat.com, pasic@linux.ibm.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, kevin.tian@intel.com,
 yan.y.zhao@intel.com, dgilbert@redhat.com, changpeng.liu@intel.com,
 eskultet@redhat.com, Ken.Xue@amd.com, jonathan.davies@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/25/2020 12:26 AM, Alex Williamson wrote:
> On Sun, 21 Jun 2020 01:51:24 +0530
> Kirti Wankhede <kwankhede@nvidia.com> wrote:
> 
>> With vIOMMU, IO virtual address range can get unmapped while in pre-copy
>> phase of migration. In that case, unmap ioctl should return pages pinned
>> in that range and QEMU should find its correcponding guest physical
>> addresses and report those dirty.
>>
>> Suggested-by: Alex Williamson <alex.williamson@redhat.com>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> Reviewed-by: Neo Jia <cjia@nvidia.com>
>> ---
>>   hw/vfio/common.c | 85 +++++++++++++++++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 81 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 0518cf228ed5..a06b8f2f66e2 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -311,11 +311,83 @@ static bool vfio_devices_are_stopped_and_saving(void)
>>       return true;
>>   }
>>   
>> +static bool vfio_devices_are_running_and_saving(void)
>> +{
>> +    VFIOGroup *group;
>> +    VFIODevice *vbasedev;
>> +
>> +    QLIST_FOREACH(group, &vfio_group_list, next) {
> 
> Same as previous, I'm curious if we should instead be looking at
> container granularity.  It especially seems to make sense here where
> we're unmapping from a container, so iterating every device in every
> group seems excessive.
> 

changing it with container argument.

>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            if ((vbasedev->device_state & VFIO_DEVICE_STATE_SAVING) &&
>> +                (vbasedev->device_state & VFIO_DEVICE_STATE_RUNNING)) {
>> +                continue;
>> +            } else {
>> +                return false;
>> +            }
> 
> I'm also not sure about the polarity of this function, should it be if
> any device is _SAVING we should report the dirty bitmap?  For example,
> what if we have a set of paried failover NICs where we intend to unplug
> one just prior to stopping the devices, aren't we going to lose dirtied
> pages with this logic that they all must be running and saving?  Thanks,
> 

If migration is initiated, is device unplug allowed? Ideally it 
shouldn't. If it is, then how QEMU handles data stream of device which 
doesn't exist at destination?

_SAVING flag is set during pre-copy and stop-and-copy phase. Here we 
only want to track pages which are unmapped during pre-copy phase, i.e. 
when vCPU are running. In case of VM suspend /saveVM, there is no 
pre-copy phase, but ideally we shouldn't see unmaps when vCPUs are 
stopped, right? But still for safer side, since we know exact phase, I 
would prefer to check for _SAVING and _RUNNING flags.

Thanks,
Kirti


> Alex
> 
>> +        }
>> +    }
>> +    return true;
>> +}
>> +
>> +static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>> +                                 hwaddr iova, ram_addr_t size,
>> +                                 IOMMUTLBEntry *iotlb)
>> +{
>> +    struct vfio_iommu_type1_dma_unmap *unmap;
>> +    struct vfio_bitmap *bitmap;
>> +    uint64_t pages = TARGET_PAGE_ALIGN(size) >> TARGET_PAGE_BITS;
>> +    int ret;
>> +
>> +    unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
>> +
>> +    unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
>> +    unmap->iova = iova;
>> +    unmap->size = size;
>> +    unmap->flags |= VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP;
>> +    bitmap = (struct vfio_bitmap *)&unmap->data;
>> +
>> +    /*
>> +     * cpu_physical_memory_set_dirty_lebitmap() expects pages in bitmap of
>> +     * TARGET_PAGE_SIZE to mark those dirty. Hence set bitmap_pgsize to
>> +     * TARGET_PAGE_SIZE.
>> +     */
>> +
>> +    bitmap->pgsize = TARGET_PAGE_SIZE;
>> +    bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
>> +                   BITS_PER_BYTE;
>> +
>> +    if (bitmap->size > container->max_dirty_bitmap_size) {
>> +        error_report("UNMAP: Size of bitmap too big 0x%llx", bitmap->size);
>> +        ret = -E2BIG;
>> +        goto unmap_exit;
>> +    }
>> +
>> +    bitmap->data = g_try_malloc0(bitmap->size);
>> +    if (!bitmap->data) {
>> +        ret = -ENOMEM;
>> +        goto unmap_exit;
>> +    }
>> +
>> +    ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
>> +    if (!ret) {
>> +        cpu_physical_memory_set_dirty_lebitmap((uint64_t *)bitmap->data,
>> +                iotlb->translated_addr, pages);
>> +    } else {
>> +        error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
>> +    }
>> +
>> +    g_free(bitmap->data);
>> +unmap_exit:
>> +    g_free(unmap);
>> +    return ret;
>> +}
>> +
>>   /*
>>    * DMA - Mapping and unmapping for the "type1" IOMMU interface used on x86
>>    */
>>   static int vfio_dma_unmap(VFIOContainer *container,
>> -                          hwaddr iova, ram_addr_t size)
>> +                          hwaddr iova, ram_addr_t size,
>> +                          IOMMUTLBEntry *iotlb)
>>   {
>>       struct vfio_iommu_type1_dma_unmap unmap = {
>>           .argsz = sizeof(unmap),
>> @@ -324,6 +396,11 @@ static int vfio_dma_unmap(VFIOContainer *container,
>>           .size = size,
>>       };
>>   
>> +    if (iotlb && container->dirty_pages_supported &&
>> +        vfio_devices_are_running_and_saving()) {
>> +        return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>> +    }
>> +
>>       while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
>>           /*
>>            * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
>> @@ -371,7 +448,7 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>>        * the VGA ROM space.
>>        */
>>       if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map) == 0 ||
>> -        (errno == EBUSY && vfio_dma_unmap(container, iova, size) == 0 &&
>> +        (errno == EBUSY && vfio_dma_unmap(container, iova, size, NULL) == 0 &&
>>            ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map) == 0)) {
>>           return 0;
>>       }
>> @@ -542,7 +619,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>>               }
>>           }
>>   
>> -        ret = vfio_dma_unmap(container, iova, iotlb->addr_mask + 1);
>> +        ret = vfio_dma_unmap(container, iova, iotlb->addr_mask + 1, iotlb);
>>           if (ret) {
>>               error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
>>                            "0x%"HWADDR_PRIx") = %d (%m)",
>> @@ -853,7 +930,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
>>       }
>>   
>>       if (try_unmap) {
>> -        ret = vfio_dma_unmap(container, iova, int128_get64(llsize));
>> +        ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
>>           if (ret) {
>>               error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
>>                            "0x%"HWADDR_PRIx") = %d (%m)",
> 

