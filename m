Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223F337F36D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 09:11:37 +0200 (CEST)
Received: from localhost ([::1]:35972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh5VP-0002Mx-QL
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 03:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lh5Ty-0001OD-Mj; Thu, 13 May 2021 03:10:06 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lh5Tv-0003BZ-TF; Thu, 13 May 2021 03:10:06 -0400
Received: from dggeml765-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FgjQc0yJ7zYQc4;
 Thu, 13 May 2021 15:07:20 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggeml765-chm.china.huawei.com (10.1.199.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 13 May 2021 15:09:48 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 13 May 2021 15:09:32 +0800
Subject: Re: [RFC v9 24/29] hw/arm/smmuv3: Fill the IOTLBEntry leaf field on
 NH_VA invalidation
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <alex.williamson@redhat.com>
References: <20210411120912.15770-1-eric.auger@redhat.com>
 <20210411120912.15770-25-eric.auger@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <1c70fb86-fb4b-e26c-8022-bd19b073d8fe@huawei.com>
Date: Thu, 13 May 2021 15:09:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210411120912.15770-25-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, vdumpa@nvidia.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 2021/4/11 20:09, Eric Auger wrote:
> Let's propagate the leaf attribute throughout the invalidation path.
> This hint is used to reduce the scope of the invalidations to the
> last level of translation. Not enforcing it induces large performance
> penalties in nested mode.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/arm/smmuv3.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 7beb55cd89..74a6408146 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -799,7 +799,7 @@ epilogue:
>   static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>                                  IOMMUNotifier *n,
>                                  int asid, dma_addr_t iova,
> -                               uint8_t tg, uint64_t num_pages)
> +                               uint8_t tg, uint64_t num_pages, bool leaf)
>   {
>       SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
>       IOMMUTLBEvent event = {};
> @@ -834,6 +834,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>       event.entry.perm = IOMMU_NONE;
>       event.entry.flags = IOMMU_INV_FLAGS_ARCHID;
>       event.entry.arch_id = asid;
> +    event.entry.leaf = leaf;
>   
>       memory_region_notify_iommu_one(n, &event);
>   }
> @@ -865,7 +866,7 @@ static void smmuv3_notify_asid(IOMMUMemoryRegion *mr,
>   
>   /* invalidate an asid/iova range tuple in all mr's */
>   static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
> -                                      uint8_t tg, uint64_t num_pages)
> +                                      uint8_t tg, uint64_t num_pages, bool leaf)
>   {
>       SMMUDevice *sdev;
Does the parameter 'leaf' need to be added to the trace?
> trace_smmuv3_inv_notifiers_iova(mr->parent_obj.name, asid, iova,
>                                         tg, num_pages);

Thanks,
Kunkun Jiang
>   
> @@ -877,7 +878,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
>                                           tg, num_pages);
>   
>           IOMMU_NOTIFIER_FOREACH(n, mr) {
> -            smmuv3_notify_iova(mr, n, asid, iova, tg, num_pages);
> +            smmuv3_notify_iova(mr, n, asid, iova, tg, num_pages, leaf);
>           }
>       }
>   }
> @@ -915,7 +916,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>           count = mask + 1;
>   
>           trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, count, ttl, leaf);
> -        smmuv3_inv_notifiers_iova(s, asid, addr, tg, count);
> +        smmuv3_inv_notifiers_iova(s, asid, addr, tg, count, leaf);
>           smmu_iotlb_inv_iova(s, asid, addr, tg, count, ttl);
>   
>           num_pages -= count;



