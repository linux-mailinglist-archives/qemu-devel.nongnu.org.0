Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B471D7114
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 08:32:37 +0200 (CEST)
Received: from localhost ([::1]:39944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaZKG-0003dk-T3
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 02:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jaZHy-0001ow-QL
 for qemu-devel@nongnu.org; Mon, 18 May 2020 02:30:14 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jaZHw-00089A-Qa
 for qemu-devel@nongnu.org; Mon, 18 May 2020 02:30:14 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec22ae50000>; Sun, 17 May 2020 23:27:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 17 May 2020 23:30:10 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 17 May 2020 23:30:10 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 18 May
 2020 06:30:10 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 18 May 2020 06:30:03 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH Kernel v22 3/8] vfio iommu: Cache pgsize_bitmap in struct
 vfio_iommu
Date: Mon, 18 May 2020 11:26:32 +0530
Message-ID: <1589781397-28368-4-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1589781397-28368-1-git-send-email-kwankhede@nvidia.com>
References: <1589781397-28368-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1589783269; bh=ZBRmkoeTJZ1FSdM0f83CcxykXlKpxr6CXlXwN8RMx60=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=oNoBxkN2AYiOw8kiS0P7A9rTSbaT6v7YnEr34oQH1awveJB1HxoqMOX1XBlQ1rLhA
 6DOCUvXNh/QUtj3Ag9B3nMzgrGRy5kW1PA9ZYBN+E8vJSS1IrSLBfTxZ+FnnVmTnVx
 vSHly0x8SG6/vQJrImYc7BzwWQEIoTZDKbbBYie2ZYJi4hFgC9XXxISCi88/nY3IjV
 SdXY5AGIG+tkqFSVN84jA3O4Ryd+FZlynpHjE75nySVsX7w5xE9nLWNZlyqtmeEop9
 pfMPytSRUiVG20QgwUgDl/UMQ4IId0uygK0E47kvK7223WjTez2VbqCxWuAQZfh6GS
 DutYvWNU74TiQ==
Received-SPF: pass client-ip=216.228.121.143;
 envelope-from=kwankhede@nvidia.com; helo=hqnvemgate24.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 02:29:50
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Zhengxiao.zx@Alibaba-inc.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 yan.y.zhao@intel.com, kvm@vger.kernel.org, eskultet@redhat.com,
 ziye.yang@intel.com, qemu-devel@nongnu.org, cohuck@redhat.com,
 shuangtai.tst@alibaba-inc.com, dgilbert@redhat.com, zhi.a.wang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru,
 Kirti Wankhede <kwankhede@nvidia.com>, eauger@redhat.com, felipe@nutanix.com,
 jonathan.davies@nutanix.com, changpeng.liu@intel.com, Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Calculate and cache pgsize_bitmap when iommu->domain_list is updated
and iommu->external_domain is set for mdev device.
Add iommu->lock protection when cached pgsize_bitmap is accessed.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
---
 drivers/vfio/vfio_iommu_type1.c | 88 +++++++++++++++++++++++------------------
 1 file changed, 49 insertions(+), 39 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index fa735047b04d..de17787ffece 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -69,6 +69,7 @@ struct vfio_iommu {
 	struct rb_root		dma_list;
 	struct blocking_notifier_head notifier;
 	unsigned int		dma_avail;
+	uint64_t		pgsize_bitmap;
 	bool			v2;
 	bool			nesting;
 };
@@ -805,15 +806,14 @@ static void vfio_remove_dma(struct vfio_iommu *iommu, struct vfio_dma *dma)
 	iommu->dma_avail++;
 }
 
-static unsigned long vfio_pgsize_bitmap(struct vfio_iommu *iommu)
+static void vfio_pgsize_bitmap(struct vfio_iommu *iommu)
 {
 	struct vfio_domain *domain;
-	unsigned long bitmap = ULONG_MAX;
 
-	mutex_lock(&iommu->lock);
+	iommu->pgsize_bitmap = ULONG_MAX;
+
 	list_for_each_entry(domain, &iommu->domain_list, next)
-		bitmap &= domain->domain->pgsize_bitmap;
-	mutex_unlock(&iommu->lock);
+		iommu->pgsize_bitmap &= domain->domain->pgsize_bitmap;
 
 	/*
 	 * In case the IOMMU supports page sizes smaller than PAGE_SIZE
@@ -823,12 +823,10 @@ static unsigned long vfio_pgsize_bitmap(struct vfio_iommu *iommu)
 	 * granularity while iommu driver can use the sub-PAGE_SIZE size
 	 * to map the buffer.
 	 */
-	if (bitmap & ~PAGE_MASK) {
-		bitmap &= PAGE_MASK;
-		bitmap |= PAGE_SIZE;
+	if (iommu->pgsize_bitmap & ~PAGE_MASK) {
+		iommu->pgsize_bitmap &= PAGE_MASK;
+		iommu->pgsize_bitmap |= PAGE_SIZE;
 	}
-
-	return bitmap;
 }
 
 static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
@@ -839,19 +837,28 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
 	size_t unmapped = 0;
 	int ret = 0, retries = 0;
 
-	mask = ((uint64_t)1 << __ffs(vfio_pgsize_bitmap(iommu))) - 1;
+	mutex_lock(&iommu->lock);
+
+	mask = ((uint64_t)1 << __ffs(iommu->pgsize_bitmap)) - 1;
+
+	if (unmap->iova & mask) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	if (!unmap->size || unmap->size & mask) {
+		ret = -EINVAL;
+		goto unlock;
+	}
 
-	if (unmap->iova & mask)
-		return -EINVAL;
-	if (!unmap->size || unmap->size & mask)
-		return -EINVAL;
 	if (unmap->iova + unmap->size - 1 < unmap->iova ||
-	    unmap->size > SIZE_MAX)
-		return -EINVAL;
+	    unmap->size > SIZE_MAX) {
+		ret = -EINVAL;
+		goto unlock;
+	}
 
 	WARN_ON(mask & PAGE_MASK);
 again:
-	mutex_lock(&iommu->lock);
 
 	/*
 	 * vfio-iommu-type1 (v1) - User mappings were coalesced together to
@@ -930,6 +937,7 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
 			blocking_notifier_call_chain(&iommu->notifier,
 						    VFIO_IOMMU_NOTIFY_DMA_UNMAP,
 						    &nb_unmap);
+			mutex_lock(&iommu->lock);
 			goto again;
 		}
 		unmapped += dma->size;
@@ -1045,24 +1053,28 @@ static int vfio_dma_do_map(struct vfio_iommu *iommu,
 	if (map->size != size || map->vaddr != vaddr || map->iova != iova)
 		return -EINVAL;
 
-	mask = ((uint64_t)1 << __ffs(vfio_pgsize_bitmap(iommu))) - 1;
-
-	WARN_ON(mask & PAGE_MASK);
-
 	/* READ/WRITE from device perspective */
 	if (map->flags & VFIO_DMA_MAP_FLAG_WRITE)
 		prot |= IOMMU_WRITE;
 	if (map->flags & VFIO_DMA_MAP_FLAG_READ)
 		prot |= IOMMU_READ;
 
-	if (!prot || !size || (size | iova | vaddr) & mask)
-		return -EINVAL;
+	mutex_lock(&iommu->lock);
 
-	/* Don't allow IOVA or virtual address wrap */
-	if (iova + size - 1 < iova || vaddr + size - 1 < vaddr)
-		return -EINVAL;
+	mask = ((uint64_t)1 << __ffs(iommu->pgsize_bitmap)) - 1;
 
-	mutex_lock(&iommu->lock);
+	WARN_ON(mask & PAGE_MASK);
+
+	if (!prot || !size || (size | iova | vaddr) & mask) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	/* Don't allow IOVA or virtual address wrap */
+	if (iova + size - 1 < iova || vaddr + size - 1 < vaddr) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
 
 	if (vfio_find_dma(iommu, iova, size)) {
 		ret = -EEXIST;
@@ -1668,6 +1680,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
 			if (!iommu->external_domain) {
 				INIT_LIST_HEAD(&domain->group_list);
 				iommu->external_domain = domain;
+				vfio_pgsize_bitmap(iommu);
 			} else {
 				kfree(domain);
 			}
@@ -1793,6 +1806,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
 	}
 
 	list_add(&domain->next, &iommu->domain_list);
+	vfio_pgsize_bitmap(iommu);
 done:
 	/* Delete the old one and insert new iova list */
 	vfio_iommu_iova_insert_copy(iommu, &iova_copy);
@@ -2004,6 +2018,7 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 			list_del(&domain->next);
 			kfree(domain);
 			vfio_iommu_aper_expand(iommu, &iova_copy);
+			vfio_pgsize_bitmap(iommu);
 		}
 		break;
 	}
@@ -2136,8 +2151,6 @@ static int vfio_iommu_iova_build_caps(struct vfio_iommu *iommu,
 	size_t size;
 	int iovas = 0, i = 0, ret;
 
-	mutex_lock(&iommu->lock);
-
 	list_for_each_entry(iova, &iommu->iova_list, list)
 		iovas++;
 
@@ -2146,17 +2159,14 @@ static int vfio_iommu_iova_build_caps(struct vfio_iommu *iommu,
 		 * Return 0 as a container with a single mdev device
 		 * will have an empty list
 		 */
-		ret = 0;
-		goto out_unlock;
+		return 0;
 	}
 
 	size = sizeof(*cap_iovas) + (iovas * sizeof(*cap_iovas->iova_ranges));
 
 	cap_iovas = kzalloc(size, GFP_KERNEL);
-	if (!cap_iovas) {
-		ret = -ENOMEM;
-		goto out_unlock;
-	}
+	if (!cap_iovas)
+		return -ENOMEM;
 
 	cap_iovas->nr_iovas = iovas;
 
@@ -2169,8 +2179,6 @@ static int vfio_iommu_iova_build_caps(struct vfio_iommu *iommu,
 	ret = vfio_iommu_iova_add_cap(caps, cap_iovas, size);
 
 	kfree(cap_iovas);
-out_unlock:
-	mutex_unlock(&iommu->lock);
 	return ret;
 }
 
@@ -2215,11 +2223,13 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
 			info.cap_offset = 0; /* output, no-recopy necessary */
 		}
 
+		mutex_lock(&iommu->lock);
 		info.flags = VFIO_IOMMU_INFO_PGSIZES;
 
-		info.iova_pgsizes = vfio_pgsize_bitmap(iommu);
+		info.iova_pgsizes = iommu->pgsize_bitmap;
 
 		ret = vfio_iommu_iova_build_caps(iommu, &caps);
+		mutex_unlock(&iommu->lock);
 		if (ret)
 			return ret;
 
-- 
2.7.0


