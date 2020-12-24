Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF832E2584
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 09:45:00 +0100 (CET)
Received: from localhost ([::1]:59246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksMEx-0002f0-GT
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 03:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1ksMDT-00025i-Eb; Thu, 24 Dec 2020 03:43:23 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1ksMDO-00011d-Ev; Thu, 24 Dec 2020 03:43:23 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4D1k9122ZqzhwlN;
 Thu, 24 Dec 2020 16:42:29 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Thu, 24 Dec 2020 16:42:55 +0800
Subject: Re: [RFC v7 12/26] vfio: Set up nested stage mappings
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <alex.williamson@redhat.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
 <20201116181349.11908-13-eric.auger@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <c0afbbcb-ef4d-fff2-3667-663cfdfea6f3@huawei.com>
Date: Thu, 24 Dec 2020 16:42:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20201116181349.11908-13-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=yuzenghui@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.521,
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 2020/11/17 2:13, Eric Auger wrote:
> In nested mode, legacy vfio_iommu_map_notify cannot be used as
> there is no "caching" mode and we do not trap on map.
> 
> On Intel, vfio_iommu_map_notify was used to DMA map the RAM
> through the host single stage.
> 
> With nested mode, we need to setup the stage 2 and the stage 1
> separately. This patch introduces a prereg_listener to setup
> the stage 2 mapping.
> 
> The stage 1 mapping, owned by the guest, is passed to the host
> when the guest invalidates the stage 1 configuration, through
> a dedicated PCIPASIDOps callback. Guest IOTLB invalidations
> are cascaded downto the host through another IOMMU MR UNMAP
> notifier.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v6 -> v7:
> - remove PASID based invalidation
> 
> v5 -> v6:
> - add error_report_err()
> - remove the abort in case of nested stage case
> 
> v4 -> v5:
> - use VFIO_IOMMU_SET_PASID_TABLE
> - use PCIPASIDOps for config notification
> 
> v3 -> v4:
> - use iommu_inv_pasid_info for ASID invalidation
> 
> v2 -> v3:
> - use VFIO_IOMMU_ATTACH_PASID_TABLE
> - new user API
> - handle leaf
> 
> v1 -> v2:
> - adapt to uapi changes
> - pass the asid
> - pass IOMMU_NOTIFIER_S1_CFG when initializing the config notifier
> ---
>   hw/vfio/common.c     | 111 +++++++++++++++++++++++++++++++++++++++++--
>   hw/vfio/pci.c        |  21 ++++++++
>   hw/vfio/trace-events |   2 +
>   3 files changed, 129 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index a9e3c77863..6b3bba7ff9 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -597,6 +597,45 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
>       return true;
>   }
>   
> +/* Propagate a guest IOTLB invalidation to the host (nested mode) */
> +static void vfio_iommu_unmap_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> +{
> +    VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
> +    hwaddr start = iotlb->iova + giommu->iommu_offset;
> +    VFIOContainer *container = giommu->container;
> +    struct vfio_iommu_type1_cache_invalidate ustruct = {};
> +    struct iommu_inv_addr_info *addr_info = &ustruct.info.granu.addr_info;
> +    size_t size = iotlb->addr_mask + 1;
> +    int ret;
> +
> +    assert(iotlb->perm == IOMMU_NONE);
> +
> +    ustruct.argsz = sizeof(ustruct);
> +    ustruct.flags = 0;
> +    ustruct.info.argsz = sizeof(struct iommu_cache_invalidate_info);
> +    ustruct.info.version = IOMMU_CACHE_INVALIDATE_INFO_VERSION_1;
> +
> +    ustruct.info.cache = IOMMU_CACHE_INV_TYPE_IOTLB;
> +    ustruct.info.granularity = IOMMU_INV_GRANU_ADDR;

It seems that all guest IOTLB invalidation will be propagated to host
using the ADDR granularity. I'm afraid that TLBI_{NS}NH_ALL command
emulating will be a time consuming process...

> +    addr_info->flags = IOMMU_INV_ADDR_FLAGS_ARCHID;
> +    if (iotlb->leaf) {
> +        addr_info->flags |= IOMMU_INV_ADDR_FLAGS_LEAF;
> +    }
> +    addr_info->archid = iotlb->arch_id;

...and looks like both @arch_id and @leaf are not properly set in that
case. The same for TLBI_NH_ASID command.

(Or maybe I've missed something in the vsmmu code?)


Thanks,
Zenghui

> +    addr_info->addr = start;
> +    addr_info->granule_size = size;
> +    addr_info->nb_granules = 1;
> +    trace_vfio_iommu_addr_inv_iotlb(iotlb->arch_id, start, size, 1,
> +                                    iotlb->leaf);
> +
> +    ret = ioctl(container->fd, VFIO_IOMMU_CACHE_INVALIDATE, &ustruct);
> +    if (ret) {
> +        error_report("%p: failed to invalidate CACHE for 0x%"PRIx64
> +                     " mask=0x%"PRIx64" (%d)",
> +                     container, start, iotlb->addr_mask, ret);
> +    }
> +}

