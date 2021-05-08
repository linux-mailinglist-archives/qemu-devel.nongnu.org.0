Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A45BD3770F3
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 11:33:58 +0200 (CEST)
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfJLR-0008US-K2
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 05:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lfJJZ-0006ig-EP
 for qemu-devel@nongnu.org; Sat, 08 May 2021 05:32:01 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lfJJV-0005gH-3M
 for qemu-devel@nongnu.org; Sat, 08 May 2021 05:32:01 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fchnw25hCzQklf;
 Sat,  8 May 2021 17:28:36 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Sat, 8 May 2021 17:31:48 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, <kevin.tian@intel.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, "open list : All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH 3/3] vfio/migration: Add support for manual clear vfio
 dirty log
Date: Sat, 8 May 2021 17:31:05 +0800
Message-ID: <20210508093105.2558-4-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210508093105.2558-1-jiangkunkun@huawei.com>
References: <20210508093105.2558-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=jiangkunkun@huawei.com; helo=szxga05-in.huawei.com
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
the kernel, tweak the userspace side to use them.

Check if the kernel supports VFIO_DIRTY_LOG_MANUAL_CLEAR and
provide the log_clear() hook for vfio_memory_listener. If the
kernel supports it, deliever the clear message to kernel.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/vfio/common.c              | 149 +++++++++++++++++++++++++++++++++-
 include/hw/vfio/vfio-common.h |   1 +
 2 files changed, 148 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index b8b6418e69..9c41a36a61 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1082,7 +1082,9 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
     dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
 
     dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
-    dbitmap->flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP;
+    dbitmap->flags = container->dirty_log_manual_clear ?
+                     VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP_NOCLEAR :
+                     VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP;
     range = (struct vfio_iommu_type1_dirty_bitmap_get *)&dbitmap->data;
     range->iova = iova;
     range->size = size;
@@ -1213,12 +1215,148 @@ static void vfio_listener_log_sync(MemoryListener *listener,
     }
 }
 
+/*
+ * I'm not sure if there's any alignment requirement for the CLEAR_BITMAP
+ * ioctl. But copy from kvm side and align {start, size} with 64 pages.
+ *
+ * I think the code can be simplified a lot if no alignment requirement.
+ */
+#define VFIO_CLEAR_LOG_SHIFT  6
+#define VFIO_CLEAR_LOG_ALIGN  (qemu_real_host_page_size << VFIO_CLEAR_LOG_SHIFT)
+#define VFIO_CLEAR_LOG_MASK   (-VFIO_CLEAR_LOG_ALIGN)
+
+static int vfio_log_clear_one_range(VFIOContainer *container,
+        VFIODMARange *qrange, uint64_t start, uint64_t size)
+{
+    struct vfio_iommu_type1_dirty_bitmap *dbitmap;
+    struct vfio_iommu_type1_dirty_bitmap_get *range;
+
+    dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
+
+    dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
+    dbitmap->flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_CLEAR_BITMAP;
+    range = (struct vfio_iommu_type1_dirty_bitmap_get *)&dbitmap->data;
+
+    /*
+     * Now let's deal with the actual bitmap, which is almost the same
+     * as the kvm side.
+     */
+    uint64_t end, bmap_start, start_delta, bmap_npages;
+    unsigned long *bmap_clear = NULL, psize = qemu_real_host_page_size;
+    int ret;
+
+    bmap_start = start & VFIO_CLEAR_LOG_MASK;
+    start_delta = start - bmap_start;
+    bmap_start /= psize;
+
+    bmap_npages = DIV_ROUND_UP(size + start_delta, VFIO_CLEAR_LOG_ALIGN)
+        << VFIO_CLEAR_LOG_SHIFT;
+    end = qrange->size / psize;
+    if (bmap_npages > end - bmap_start) {
+        bmap_npages = end - bmap_start;
+    }
+    start_delta /= psize;
+
+    if (start_delta) {
+        bmap_clear = bitmap_new(bmap_npages);
+        bitmap_copy_with_src_offset(bmap_clear, qrange->bitmap,
+                                    bmap_start, start_delta + size / psize);
+        bitmap_clear(bmap_clear, 0, start_delta);
+        range->bitmap.data = (__u64 *)bmap_clear;
+    } else {
+        range->bitmap.data = (__u64 *)(qrange->bitmap + BIT_WORD(bmap_start));
+    }
+
+    range->iova = qrange->iova + bmap_start * psize;
+    range->size = bmap_npages * psize;
+    range->bitmap.size = ROUND_UP(bmap_npages, sizeof(__u64) * BITS_PER_BYTE) /
+                                               BITS_PER_BYTE;
+    range->bitmap.pgsize = qemu_real_host_page_size;
+
+    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
+    if (ret) {
+        error_report("Failed to clear dirty log for iova: 0x%"PRIx64
+                " size: 0x%"PRIx64" err: %d", (uint64_t)range->iova,
+                (uint64_t)range->size, errno);
+        goto err_out;
+    }
+
+    bitmap_clear(qrange->bitmap, bmap_start + start_delta, size / psize);
+err_out:
+    g_free(bmap_clear);
+    g_free(dbitmap);
+    return 0;
+}
+
+static int vfio_physical_log_clear(VFIOContainer *container,
+                                   MemoryRegionSection *section)
+{
+    uint64_t start, size, offset, count;
+    VFIODMARange *qrange;
+    int ret = 0;
+
+    if (!container->dirty_log_manual_clear) {
+        /* No need to do explicit clear */
+        return ret;
+    }
+
+    start = section->offset_within_address_space;
+    size = int128_get64(section->size);
+
+    if (!size) {
+        return ret;
+    }
+
+    QLIST_FOREACH(qrange, &container->dma_list, next) {
+        /*
+         * Discard ranges that do not overlap the section (e.g., the
+         * Memory BAR regions of the device)
+         */
+        if (qrange->iova > start + size - 1 ||
+            start > qrange->iova + qrange->size - 1) {
+            continue;
+        }
+
+        if (start >= qrange->iova) {
+            /* The range starts before section or is aligned to it. */
+            offset = start - qrange->iova;
+            count = MIN(qrange->size - offset, size);
+        } else {
+            /* The range starts after section. */
+            offset = 0;
+            count = MIN(qrange->size, size - (qrange->iova - start));
+        }
+        ret = vfio_log_clear_one_range(container, qrange, offset, count);
+        if (ret < 0) {
+            break;
+        }
+    }
+
+    return ret;
+}
+
+static void vfio_listener_log_clear(MemoryListener *listener,
+                                    MemoryRegionSection *section)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+
+    if (vfio_listener_skipped_section(section) ||
+        !container->dirty_pages_supported) {
+        return;
+    }
+
+    if (vfio_devices_all_dirty_tracking(container)) {
+        vfio_physical_log_clear(container, section);
+    }
+}
+
 static const MemoryListener vfio_memory_listener = {
     .region_add = vfio_listener_region_add,
     .region_del = vfio_listener_region_del,
     .log_global_start = vfio_listener_log_global_start,
     .log_global_stop = vfio_listener_log_global_stop,
     .log_sync = vfio_listener_log_sync,
+    .log_clear = vfio_listener_log_clear,
 };
 
 static void vfio_listener_release(VFIOContainer *container)
@@ -1646,7 +1784,7 @@ static int vfio_get_iommu_type(VFIOContainer *container,
 static int vfio_init_container(VFIOContainer *container, int group_fd,
                                Error **errp)
 {
-    int iommu_type, ret;
+    int iommu_type, dirty_log_manual_clear, ret;
 
     iommu_type = vfio_get_iommu_type(container, errp);
     if (iommu_type < 0) {
@@ -1675,6 +1813,13 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
     }
 
     container->iommu_type = iommu_type;
+
+    dirty_log_manual_clear = ioctl(container->fd, VFIO_CHECK_EXTENSION,
+                                   VFIO_DIRTY_LOG_MANUAL_CLEAR);
+    if (dirty_log_manual_clear) {
+        container->dirty_log_manual_clear = dirty_log_manual_clear;
+    }
+
     return 0;
 }
 
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index bd6eca9332..bcd6a0c440 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -93,6 +93,7 @@ typedef struct VFIOContainer {
     Error *error;
     bool initialized;
     bool dirty_pages_supported;
+    bool dirty_log_manual_clear;
     uint64_t dirty_pgsizes;
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
-- 
2.23.0


