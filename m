Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E071D1D2055
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 22:42:09 +0200 (CEST)
Received: from localhost ([::1]:54842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYyCd-0005cx-AY
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 16:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jYy9E-000827-NJ
 for qemu-devel@nongnu.org; Wed, 13 May 2020 16:38:36 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:12780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jYy9C-0006yv-Rx
 for qemu-devel@nongnu.org; Wed, 13 May 2020 16:38:36 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ebc5abc0000>; Wed, 13 May 2020 13:38:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 13 May 2020 13:38:33 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 13 May 2020 13:38:33 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 May
 2020 20:38:32 +0000
Received: from kwankhede-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 13 May 2020 20:38:26 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH Kernel v19 6/8] vfio iommu: Update UNMAP_DMA ioctl to get
 dirty bitmap before unmap
Date: Thu, 14 May 2020 01:34:37 +0530
Message-ID: <1589400279-28522-7-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1589400279-28522-1-git-send-email-kwankhede@nvidia.com>
References: <1589400279-28522-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1589402301; bh=9LD0a/Z1ShtI/FKdxjy1MYmdGpWtLaS09SsstiNYbcw=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=g4rC62X8V/1QYSShMfUbYXJcsT9OGElk/QctCmltmW3oqeeRIGhmas1BPwx/WG2Sn
 /Emv/YkNLlh1vWu03uNa7rqN7z7LKlvVBv6ZD2Y2khkC/TUWpN04EybnlI8IjmUbMn
 3s0zkuGNoEItSRwjJovY5FFKSafJc57JeJCD5Kv9ph+gDW89WfqomBeIgUilsxLTKL
 uz4SEz5PUZV8D2mHWxndmFrOKerfpt9NjBYGRUqtdWbe9SAh+/MarexEZfUfYtdvsS
 hr9JeYj20Ab1oMh+azO8hupQs9g+GQE8jyO5Y9BCqIABoGRXpWX0dY4qbUJpJHm5/v
 uBGqKbuA1y62Q==
Received-SPF: pass client-ip=216.228.121.65; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate26.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 16:38:33
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

DMA mapped pages, including those pinned by mdev vendor drivers, might
get unpinned and unmapped while migration is active and device is still
running. For example, in pre-copy phase while guest driver could access
those pages, host device or vendor driver can dirty these mapped pages.
Such pages should be marked dirty so as to maintain memory consistency
for a user making use of dirty page tracking.

To get bitmap during unmap, user should allocate memory for bitmap, set
size of allocated memory, set page size to be considered for bitmap and
set flag VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
---
 drivers/vfio/vfio_iommu_type1.c | 102 +++++++++++++++++++++++++++++++++++-----
 include/uapi/linux/vfio.h       |  10 ++++
 2 files changed, 99 insertions(+), 13 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 469b09185b83..4358be26ff80 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -195,11 +195,15 @@ static void vfio_unlink_dma(struct vfio_iommu *iommu, struct vfio_dma *old)
 static int vfio_dma_bitmap_alloc(struct vfio_dma *dma, size_t pgsize)
 {
 	uint64_t npages = dma->size / pgsize;
+	size_t bitmap_size;
 
 	if (npages > DIRTY_BITMAP_PAGES_MAX)
 		return -EINVAL;
 
-	dma->bitmap = kvzalloc(DIRTY_BITMAP_BYTES(npages), GFP_KERNEL);
+	/* Allocate extra 64 bits which are used for bitmap manipulation */
+	bitmap_size = DIRTY_BITMAP_BYTES(npages) + sizeof(u64);
+
+	dma->bitmap = kvzalloc(bitmap_size, GFP_KERNEL);
 	if (!dma->bitmap)
 		return -ENOMEM;
 
@@ -979,23 +983,25 @@ static int verify_bitmap_size(uint64_t npages, uint64_t bitmap_size)
 }
 
 static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
-			     struct vfio_iommu_type1_dma_unmap *unmap)
+			     struct vfio_iommu_type1_dma_unmap *unmap,
+			     struct vfio_bitmap *bitmap)
 {
-	uint64_t mask;
 	struct vfio_dma *dma, *dma_last = NULL;
-	size_t unmapped = 0;
-	int ret = 0, retries = 0;
+	size_t unmapped = 0, pgsize;
+	int ret = 0, retries = 0, cnt = 0;
+	unsigned long pgshift, shift = 0, leftover;
 
 	mutex_lock(&iommu->lock);
 
-	mask = ((uint64_t)1 << __ffs(iommu->pgsize_bitmap)) - 1;
+	pgshift = __ffs(iommu->pgsize_bitmap);
+	pgsize = (size_t)1 << pgshift;
 
-	if (unmap->iova & mask) {
+	if (unmap->iova & (pgsize - 1)) {
 		ret = -EINVAL;
 		goto unlock;
 	}
 
-	if (!unmap->size || unmap->size & mask) {
+	if (!unmap->size || unmap->size & (pgsize - 1)) {
 		ret = -EINVAL;
 		goto unlock;
 	}
@@ -1006,9 +1012,15 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
 		goto unlock;
 	}
 
-	WARN_ON(mask & PAGE_MASK);
-again:
+	/* When dirty tracking is enabled, allow only min supported pgsize */
+	if ((unmap->flags & VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP) &&
+	    (!iommu->dirty_page_tracking || (bitmap->pgsize != pgsize))) {
+		ret = -EINVAL;
+		goto unlock;
+	}
 
+	WARN_ON((pgsize - 1) & PAGE_MASK);
+again:
 	/*
 	 * vfio-iommu-type1 (v1) - User mappings were coalesced together to
 	 * avoid tracking individual mappings.  This means that the granularity
@@ -1046,6 +1058,7 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
 			ret = -EINVAL;
 			goto unlock;
 		}
+
 		dma = vfio_find_dma(iommu, unmap->iova + unmap->size - 1, 0);
 		if (dma && dma->iova + dma->size != unmap->iova + unmap->size) {
 			ret = -EINVAL;
@@ -1063,6 +1076,39 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
 		if (dma->task->mm != current->mm)
 			break;
 
+		if ((unmap->flags & VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP) &&
+		    (dma_last != dma)) {
+			unsigned int nbits = dma->size >> pgshift;
+			int curr_lcnt = nbits / BITS_PER_LONG;
+
+			/*
+			 * mark all pages dirty if all pages are pinned and
+			 * mapped.
+			 */
+			if (dma->iommu_mapped)
+				bitmap_set(dma->bitmap, 0, nbits);
+
+			if (shift) {
+				bitmap_shift_left(dma->bitmap, dma->bitmap,
+						  shift, nbits + shift);
+				bitmap_or(dma->bitmap, dma->bitmap, &leftover,
+					  shift);
+				nbits += shift;
+				curr_lcnt = nbits / BITS_PER_LONG;
+			}
+
+			if (copy_to_user((void __user *)bitmap->data + cnt,
+				       dma->bitmap, curr_lcnt * sizeof(u64))) {
+				ret = -EFAULT;
+				break;
+			}
+
+			shift = nbits % BITS_PER_LONG;
+			if (shift)
+				leftover = *(u64 *)(dma->bitmap + curr_lcnt);
+			cnt += curr_lcnt;
+		}
+
 		if (!RB_EMPTY_ROOT(&dma->pfn_list)) {
 			struct vfio_iommu_type1_dma_unmap nb_unmap;
 
@@ -1093,6 +1139,13 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
 		vfio_remove_dma(iommu, dma);
 	}
 
+	if (!ret && (unmap->flags & VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP) &&
+	    shift) {
+		if (copy_to_user((void __user *)bitmap->data + cnt, &leftover,
+				 sizeof(leftover)))
+			ret = -EFAULT;
+	}
+
 unlock:
 	mutex_unlock(&iommu->lock);
 
@@ -2426,17 +2479,40 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
 
 	} else if (cmd == VFIO_IOMMU_UNMAP_DMA) {
 		struct vfio_iommu_type1_dma_unmap unmap;
-		long ret;
+		struct vfio_bitmap bitmap = { 0 };
+		int ret;
 
 		minsz = offsetofend(struct vfio_iommu_type1_dma_unmap, size);
 
 		if (copy_from_user(&unmap, (void __user *)arg, minsz))
 			return -EFAULT;
 
-		if (unmap.argsz < minsz || unmap.flags)
+		if (unmap.argsz < minsz ||
+		    unmap.flags & ~VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP)
 			return -EINVAL;
 
-		ret = vfio_dma_do_unmap(iommu, &unmap);
+		if (unmap.flags & VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP) {
+			unsigned long pgshift;
+
+			if (unmap.argsz < (minsz + sizeof(bitmap)))
+				return -EINVAL;
+
+			if (copy_from_user(&bitmap,
+					   (void __user *)(arg + minsz),
+					   sizeof(bitmap)))
+				return -EFAULT;
+
+			if (!access_ok((void __user *)bitmap.data, bitmap.size))
+				return -EINVAL;
+
+			pgshift = __ffs(bitmap.pgsize);
+			ret = verify_bitmap_size(unmap.size >> pgshift,
+						 bitmap.size);
+			if (ret)
+				return ret;
+		}
+
+		ret = vfio_dma_do_unmap(iommu, &unmap, &bitmap);
 		if (ret)
 			return ret;
 
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 5f359c63f5ef..e3cbf8b78623 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -1048,12 +1048,22 @@ struct vfio_bitmap {
  * field.  No guarantee is made to the user that arbitrary unmaps of iova
  * or size different from those used in the original mapping call will
  * succeed.
+ * VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP should be set to get dirty bitmap
+ * before unmapping IO virtual addresses. When this flag is set, user must
+ * provide data[] as structure vfio_bitmap. User must allocate memory to get
+ * bitmap and must set size of allocated memory in vfio_bitmap.size field.
+ * A bit in bitmap represents one page of user provided page size in 'pgsize',
+ * consecutively starting from iova offset. Bit set indicates page at that
+ * offset from iova is dirty. Bitmap of pages in the range of unmapped size is
+ * returned in vfio_bitmap.data
  */
 struct vfio_iommu_type1_dma_unmap {
 	__u32	argsz;
 	__u32	flags;
+#define VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP (1 << 0)
 	__u64	iova;				/* IO virtual address */
 	__u64	size;				/* Size of mapping (bytes) */
+	__u8    data[];
 };
 
 #define VFIO_IOMMU_UNMAP_DMA _IO(VFIO_TYPE, VFIO_BASE + 14)
-- 
2.7.0


