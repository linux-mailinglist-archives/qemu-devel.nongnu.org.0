Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E7D194ACA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 22:41:55 +0100 (CET)
Received: from localhost ([::1]:60966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHaGA-0007M1-Tw
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 17:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34106)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwankhede@nvidia.com>) id 1jHaET-0005bO-If
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 17:40:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1jHaES-0004DD-2f
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 17:40:09 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:15217)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1jHaER-0004Cr-Rp
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 17:40:08 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e7d21080000>; Thu, 26 Mar 2020 14:39:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 26 Mar 2020 14:40:06 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 26 Mar 2020 14:40:06 -0700
Received: from [10.40.103.35] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 26 Mar
 2020 21:39:49 +0000
Subject: Re: [PATCH v16 Kernel 5/7] vfio iommu: Update UNMAP_DMA ioctl to get
 dirty bitmap before unmap
To: Yan Zhao <yan.y.zhao@intel.com>
References: <1585078359-20124-1-git-send-email-kwankhede@nvidia.com>
 <1585078359-20124-6-git-send-email-kwankhede@nvidia.com>
 <20200325021800.GC20109@joy-OptiPlex-7040>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <3cabb357-b9c5-f8b3-5d57-1178ec0dde5a@nvidia.com>
Date: Fri, 27 Mar 2020 03:09:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200325021800.GC20109@joy-OptiPlex-7040>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1585258760; bh=bCv8xFt67Ype0cXdZilDfCCaBvXkLNGrD7lATqJeSx8=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=hjNSb8P22yDn3ELLPwuMVm3Jk6sIlC9546/4bKQJghCPUozI67kcGkx7rPkec6BcK
 hBcBc46u1Vy7kOcJzY7GaZV8SVvLOR+HSX92fJkLLbCkLYtOOBt8duarTT9w0Yd3P2
 j4pbf7HVs/shlq+V+buL0BhzE/RlsmJ2wgTULjZjU3N6OJ5wFgajGW/9TNMr9VR7qR
 OftW4oH/EHynpXW0LDYLSdt+HToDgcU9/SlUszi5dvB/oM1vnQTbKYwZrSnrHNNwyp
 p9eWQRvUmxTsVVN61tqzEGDcyYnFU0SJ77feeSqLhAN2L4g4QnkZ/1Rurxphi3TVps
 b8XHa00GWqx/Q==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 216.228.121.64
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
Cc: "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@Alibaba-inc.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "Wang, 
 Zhi A" <zhi.a.wang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "eauger@redhat.com" <eauger@redhat.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "Liu,
 Changpeng" <changpeng.liu@intel.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/25/2020 7:48 AM, Yan Zhao wrote:
> On Wed, Mar 25, 2020 at 03:32:37AM +0800, Kirti Wankhede wrote:
>> DMA mapped pages, including those pinned by mdev vendor drivers, might
>> get unpinned and unmapped while migration is active and device is still
>> running. For example, in pre-copy phase while guest driver could access
>> those pages, host device or vendor driver can dirty these mapped pages.
>> Such pages should be marked dirty so as to maintain memory consistency
>> for a user making use of dirty page tracking.
>>
>> To get bitmap during unmap, user should allocate memory for bitmap, set
>> size of allocated memory, set page size to be considered for bitmap and
>> set flag VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP.
>>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> Reviewed-by: Neo Jia <cjia@nvidia.com>
>> ---
>>   drivers/vfio/vfio_iommu_type1.c | 54 ++++++++++++++++++++++++++++++++++++++---
>>   include/uapi/linux/vfio.h       | 10 ++++++++
>>   2 files changed, 60 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
>> index 27ed069c5053..b98a8d79e13a 100644
>> --- a/drivers/vfio/vfio_iommu_type1.c
>> +++ b/drivers/vfio/vfio_iommu_type1.c
>> @@ -982,7 +982,8 @@ static int verify_bitmap_size(uint64_t npages, uint64_t bitmap_size)
>>   }
>>   
>>   static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
>> -			     struct vfio_iommu_type1_dma_unmap *unmap)
>> +			     struct vfio_iommu_type1_dma_unmap *unmap,
>> +			     struct vfio_bitmap *bitmap)
>>   {
>>   	uint64_t mask;
>>   	struct vfio_dma *dma, *dma_last = NULL;
>> @@ -1033,6 +1034,10 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
>>   	 * will be returned if these conditions are not met.  The v2 interface
>>   	 * will only return success and a size of zero if there were no
>>   	 * mappings within the range.
>> +	 *
>> +	 * When VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP flag is set, unmap request
>> +	 * must be for single mapping. Multiple mappings with this flag set is
>> +	 * not supported.
>>   	 */
>>   	if (iommu->v2) {
>>   		dma = vfio_find_dma(iommu, unmap->iova, 1);
>> @@ -1040,6 +1045,13 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
>>   			ret = -EINVAL;
>>   			goto unlock;
>>   		}
>> +
>> +		if ((unmap->flags & VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP) &&
>> +		    (dma->iova != unmap->iova || dma->size != unmap->size)) {
> potential NULL pointer!
> 
> And could you address the comments in v14?
> How to handle DSI unmaps in vIOMMU
> (https://lore.kernel.org/kvm/20200323011041.GB5456@joy-OptiPlex-7040/)
> 

Sorry, I drafted reply to it, but I missed to send, it remained in my drafts

 >
 > it happens in vIOMMU Domain level invalidation of IOTLB
 > (domain-selective invalidation, see vtd_iotlb_domain_invalidate() in 
qemu).
 > common in VTD lazy mode, and NOT just happening once at boot time.
 > rather than invalidate page by page, it batches the page invalidation.
 > so, when this invalidation takes place, even higher level page tables
 > have been invalid and therefore it has to invalidate a bigger 
combined range.
 > That's why we see IOVAs are mapped in 4k pages, but are unmapped in 2M
 > pages.
 >
 > I think those UNMAPs should also have GET_DIRTY_BIMTAP flag on, right?


vtd_iotlb_domain_invalidate()
   vtd_sync_shadow_page_table()
     vtd_sync_shadow_page_table_range(vtd_as, &ce, 0, UINT64_MAX)
       vtd_page_walk()
         vtd_page_walk_level() - walk over specific level for IOVA range
           vtd_page_walk_one()
             memory_region_notify_iommu()
             ...
               vfio_iommu_map_notify()

In the above trace, isn't page walk will take care of creating proper 
IOTLB entry which should be same as created during mapping for that 
IOTLB entry?


 >>>
 >>> Such unmap would callback vfio_iommu_map_notify() in QEMU. In
 >>> vfio_iommu_map_notify(), unmap is called on same range <iova,
 >>> iotlb->addr_mask + 1> which was used for map. Secondly unmap with 
bitmap
 >>> will be called only when device state has _SAVING flag set.
 >>
 > in this case, iotlb->addr_mask in unmap is 0x200000 -1.
 > different than 0x1000 -1 used for map.
 >> It might be helpful for Yan, and everyone else, to see the latest QEMU
 >> patch series.  Thanks,
 >>
 > yes, please. also curious of log_sync part for vIOMMU. given most 
IOVAs in
 > address space are unmapped and therefore no IOTLBs are able to be found.
 >
	
Qemu patches compatible with v16 version are at:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg691806.html

Hope that helps.

Thanks,
Kirti


