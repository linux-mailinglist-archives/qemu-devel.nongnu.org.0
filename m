Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753B23770F8
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 11:38:19 +0200 (CEST)
Received: from localhost ([::1]:35818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfJPe-00050W-FG
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 05:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lfJJU-0006eM-CU
 for qemu-devel@nongnu.org; Sat, 08 May 2021 05:31:56 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:5042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lfJJR-0005eH-Hs
 for qemu-devel@nongnu.org; Sat, 08 May 2021 05:31:55 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fchq92qSyzlc1R;
 Sat,  8 May 2021 17:29:41 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Sat, 8 May 2021 17:31:42 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, <kevin.tian@intel.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, "open list : All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH 1/3] linux-headers: update against 5.12 and "manual clear
 vfio dirty log" series
Date: Sat, 8 May 2021 17:31:03 +0800
Message-ID: <20210508093105.2558-2-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210508093105.2558-1-jiangkunkun@huawei.com>
References: <20210508093105.2558-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=jiangkunkun@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Kunkun Jiang <jiangkunkun@huawei.com>, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zenghui Yu <yuzenghui@huawei.com>

The new capability VFIO_DIRTY_LOG_MANUAL_CLEAR and the new ioctl
VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP_NOCLEAR and
VFIO_IOMMU_DIRTY_PAGES_FLAG_CLEAR_BITMAP have been introduced in
the kernel, update the header to add them.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 linux-headers/linux/vfio.h | 61 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index 609099e455..7e918c697f 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -46,6 +46,20 @@
  */
 #define VFIO_NOIOMMU_IOMMU		8
 
+/* Supports VFIO_DMA_UNMAP_FLAG_ALL */
+#define VFIO_UNMAP_ALL			9
+
+/* Supports the vaddr flag for DMA map and unmap */
+#define VFIO_UPDATE_VADDR		10
+
+/*
+ * The vfio_iommu driver may support user clears dirty log manually, which means
+ * dirty log is not cleared automatically after dirty log is copied to userspace,
+ * it's user's duty to clear dirty log. Note: when user queries this extension
+ * and vfio_iommu driver supports it, then it is enabled.
+ */
+#define VFIO_DIRTY_LOG_MANUAL_CLEAR	11
+
 /*
  * The IOCTL interface is designed for extensibility by embedding the
  * structure length (argsz) and flags into structures passed between
@@ -1074,12 +1088,22 @@ struct vfio_iommu_type1_info_dma_avail {
  *
  * Map process virtual addresses to IO virtual addresses using the
  * provided struct vfio_dma_map. Caller sets argsz. READ &/ WRITE required.
+ *
+ * If flags & VFIO_DMA_MAP_FLAG_VADDR, update the base vaddr for iova, and
+ * unblock translation of host virtual addresses in the iova range.  The vaddr
+ * must have previously been invalidated with VFIO_DMA_UNMAP_FLAG_VADDR.  To
+ * maintain memory consistency within the user application, the updated vaddr
+ * must address the same memory object as originally mapped.  Failure to do so
+ * will result in user memory corruption and/or device misbehavior.  iova and
+ * size must match those in the original MAP_DMA call.  Protection is not
+ * changed, and the READ & WRITE flags must be 0.
  */
 struct vfio_iommu_type1_dma_map {
 	__u32	argsz;
 	__u32	flags;
 #define VFIO_DMA_MAP_FLAG_READ (1 << 0)		/* readable from device */
 #define VFIO_DMA_MAP_FLAG_WRITE (1 << 1)	/* writable from device */
+#define VFIO_DMA_MAP_FLAG_VADDR (1 << 2)
 	__u64	vaddr;				/* Process virtual address */
 	__u64	iova;				/* IO virtual address */
 	__u64	size;				/* Size of mapping (bytes) */
@@ -1102,6 +1126,7 @@ struct vfio_bitmap {
  * field.  No guarantee is made to the user that arbitrary unmaps of iova
  * or size different from those used in the original mapping call will
  * succeed.
+ *
  * VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP should be set to get the dirty bitmap
  * before unmapping IO virtual addresses. When this flag is set, the user must
  * provide a struct vfio_bitmap in data[]. User must provide zero-allocated
@@ -1111,11 +1136,21 @@ struct vfio_bitmap {
  * indicates that the page at that offset from iova is dirty. A Bitmap of the
  * pages in the range of unmapped size is returned in the user-provided
  * vfio_bitmap.data.
+ *
+ * If flags & VFIO_DMA_UNMAP_FLAG_ALL, unmap all addresses.  iova and size
+ * must be 0.  This cannot be combined with the get-dirty-bitmap flag.
+ *
+ * If flags & VFIO_DMA_UNMAP_FLAG_VADDR, do not unmap, but invalidate host
+ * virtual addresses in the iova range.  Tasks that attempt to translate an
+ * iova's vaddr will block.  DMA to already-mapped pages continues.  This
+ * cannot be combined with the get-dirty-bitmap flag.
  */
 struct vfio_iommu_type1_dma_unmap {
 	__u32	argsz;
 	__u32	flags;
 #define VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP (1 << 0)
+#define VFIO_DMA_UNMAP_FLAG_ALL		     (1 << 1)
+#define VFIO_DMA_UNMAP_FLAG_VADDR	     (1 << 2)
 	__u64	iova;				/* IO virtual address */
 	__u64	size;				/* Size of mapping (bytes) */
 	__u8    data[];
@@ -1161,7 +1196,29 @@ struct vfio_iommu_type1_dma_unmap {
  * actual bitmap. If dirty pages logging is not enabled, an error will be
  * returned.
  *
- * Only one of the flags _START, _STOP and _GET may be specified at a time.
+ * The VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP_NOCLEAR flag is almost same as
+ * VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP, except that it requires underlying
+ * dirty bitmap is not cleared automatically. The user can clear it manually by
+ * calling the IOCTL with VFIO_IOMMU_DIRTY_PAGES_FLAG_CLEAR_BITMAP flag set.
+ *
+ * Calling the IOCTL with VFIO_IOMMU_DIRTY_PAGES_FLAG_CLEAR_BITMAP flag set,
+ * instructs the IOMMU driver to clear the dirty status of pages in a bitmap
+ * for IOMMU container for a given IOVA range. The user must specify the IOVA
+ * range, the bitmap and the pgsize through the structure
+ * vfio_iommu_type1_dirty_bitmap_get in the data[] portion. This interface
+ * supports clearing a bitmap of the smallest supported pgsize only and can be
+ * modified in future to clear a bitmap of any specified supported pgsize. The
+ * user must provide a memory area for the bitmap memory and specify its size
+ * in bitmap.size. One bit is used to represent one page consecutively starting
+ * from iova offset. The user should provide page size in bitmap.pgsize field.
+ * A bit set in the bitmap indicates that the page at that offset from iova is
+ * cleared the dirty status, and dirty tracking is re-enabled for that page. The
+ * caller must set argsz to a value including the size of structure
+ * vfio_iommu_dirty_bitmap_get, but excluing the size of the actual bitmap. If
+ * dirty pages logging is not enabled, an error will be returned.
+ *
+ * Only one of the flags _START, _STOP, _GET, _GET_NOCLEAR, and _CLEAR may be
+ * specified at a time.
  *
  */
 struct vfio_iommu_type1_dirty_bitmap {
@@ -1170,6 +1227,8 @@ struct vfio_iommu_type1_dirty_bitmap {
 #define VFIO_IOMMU_DIRTY_PAGES_FLAG_START	(1 << 0)
 #define VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP	(1 << 1)
 #define VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP	(1 << 2)
+#define VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP_NOCLEAR	(1 << 3)
+#define VFIO_IOMMU_DIRTY_PAGES_FLAG_CLEAR_BITMAP	(1 << 4)
 	__u8         data[];
 };
 
-- 
2.23.0


