Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC52B3770F9
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 11:39:48 +0200 (CEST)
Received: from localhost ([::1]:38362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfJR5-0006h5-Tr
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 05:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lfJJb-0006j5-A8
 for qemu-devel@nongnu.org; Sat, 08 May 2021 05:32:03 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lfJJV-0005gM-8a
 for qemu-devel@nongnu.org; Sat, 08 May 2021 05:32:03 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fchnw2LFkzQkmJ;
 Sat,  8 May 2021 17:28:36 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Sat, 8 May 2021 17:31:45 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, <kevin.tian@intel.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, "open list : All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH 2/3] vfio: Maintain DMA mapping range for the container
Date: Sat, 8 May 2021 17:31:04 +0800
Message-ID: <20210508093105.2558-3-jiangkunkun@huawei.com>
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

When synchronizing dirty bitmap from kernel VFIO we do it in a
per-iova-range fashion and we allocate the userspace bitmap for each of the
ioctl. This patch introduces `struct VFIODMARange` to describe a range of
the given DMA mapping with respect to a VFIO_IOMMU_MAP_DMA operation, and
make the bitmap cache of this range be persistent so that we don't need to
g_try_malloc0() every time. Note that the new structure is almost a copy of
`struct vfio_iommu_type1_dma_map` but only internally used by QEMU.

More importantly, the cached per-iova-range dirty bitmap will be further
used when we want to add support for the CLEAR_BITMAP and this cached
bitmap will be used to guarantee we don't clear any unknown dirty bits
otherwise that can be a severe data loss issue for migration code.

It's pretty intuitive to maintain a bitmap per container since we perform
log_sync at this granule. But I don't know how to deal with things like
memory hot-{un}plug, sparse DMA mappings, etc. Suggestions welcome.

* yet something to-do:
  - can't work with guest viommu
  - no locks
  - etc

[ The idea and even the commit message are largely inherited from kvm side.
  See commit 9f4bf4baa8b820c7930e23c9566c9493db7e1d25. ]

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Kunkun Jiang <jinagkunkun@huawei.com>
---
 hw/vfio/common.c              | 62 +++++++++++++++++++++++++++++++----
 include/hw/vfio/vfio-common.h |  9 +++++
 2 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ae5654fcdb..b8b6418e69 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -421,6 +421,29 @@ unmap_exit:
     return ret;
 }
 
+static VFIODMARange *vfio_lookup_match_range(VFIOContainer *container,
+        hwaddr start_addr, hwaddr size)
+{
+    VFIODMARange *qrange;
+
+    QLIST_FOREACH(qrange, &container->dma_list, next) {
+        if (qrange->iova == start_addr && qrange->size == size) {
+            return qrange;
+        }
+    }
+    return NULL;
+}
+
+static void vfio_dma_range_init_dirty_bitmap(VFIODMARange *qrange)
+{
+    uint64_t pages, size;
+
+    pages = REAL_HOST_PAGE_ALIGN(qrange->size) / qemu_real_host_page_size;
+    size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) / BITS_PER_BYTE;
+
+    qrange->bitmap = g_malloc0(size);
+}
+
 /*
  * DMA - Mapping and unmapping for the "type1" IOMMU interface used on x86
  */
@@ -434,12 +457,29 @@ static int vfio_dma_unmap(VFIOContainer *container,
         .iova = iova,
         .size = size,
     };
+    VFIODMARange *qrange;
 
     if (iotlb && container->dirty_pages_supported &&
         vfio_devices_all_running_and_saving(container)) {
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
+    /*
+     * unregister the DMA range
+     *
+     * It seems that the memory layer will give us the same section as the one
+     * used in region_add(). Otherwise it'll be complicated to manipulate the
+     * bitmap across region_{add,del}. Is there any guarantee?
+     *
+     * But there is really not such a restriction on the kernel interface
+     * (VFIO_IOMMU_DIRTY_PAGES_FLAG_{UN}MAP_DMA, etc).
+     */
+    qrange = vfio_lookup_match_range(container, iova, size);
+    assert(qrange);
+    g_free(qrange->bitmap);
+    QLIST_REMOVE(qrange, next);
+    g_free(qrange);
+
     while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
         /*
          * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
@@ -476,6 +516,14 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         .iova = iova,
         .size = size,
     };
+    VFIODMARange *qrange;
+
+    qrange = g_malloc0(sizeof(*qrange));
+    qrange->iova = iova;
+    qrange->size = size;
+    QLIST_INSERT_HEAD(&container->dma_list, qrange, next);
+    /* XXX allocate the dirty bitmap on demand */
+    vfio_dma_range_init_dirty_bitmap(qrange);
 
     if (!readonly) {
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
@@ -1023,9 +1071,14 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
 {
     struct vfio_iommu_type1_dirty_bitmap *dbitmap;
     struct vfio_iommu_type1_dirty_bitmap_get *range;
+    VFIODMARange *qrange;
     uint64_t pages;
     int ret;
 
+    qrange = vfio_lookup_match_range(container, iova, size);
+    /* the same as vfio_dma_unmap() */
+    assert(qrange);
+
     dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
 
     dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
@@ -1044,11 +1097,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
     pages = REAL_HOST_PAGE_ALIGN(range->size) / qemu_real_host_page_size;
     range->bitmap.size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
                                          BITS_PER_BYTE;
-    range->bitmap.data = g_try_malloc0(range->bitmap.size);
-    if (!range->bitmap.data) {
-        ret = -ENOMEM;
-        goto err_out;
-    }
+
+    range->bitmap.data = (__u64 *)qrange->bitmap;
 
     ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
     if (ret) {
@@ -1064,7 +1114,6 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
     trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
                                 range->bitmap.size, ram_addr);
 err_out:
-    g_free(range->bitmap.data);
     g_free(dbitmap);
 
     return ret;
@@ -1770,6 +1819,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container->dirty_pages_supported = false;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
+    QLIST_INIT(&container->dma_list);
 
     ret = vfio_init_container(container, group->fd, errp);
     if (ret) {
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 6141162d7a..bd6eca9332 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -76,6 +76,14 @@ typedef struct VFIOAddressSpace {
 
 struct VFIOGroup;
 
+typedef struct VFIODMARange {
+    QLIST_ENTRY(VFIODMARange) next;
+    hwaddr iova;
+    size_t size;
+    void *vaddr; /* unused */
+    unsigned long *bitmap; /* dirty bitmap cache for this range */
+} VFIODMARange;
+
 typedef struct VFIOContainer {
     VFIOAddressSpace *space;
     int fd; /* /dev/vfio/vfio, empowered by the attached groups */
@@ -91,6 +99,7 @@ typedef struct VFIOContainer {
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
+    QLIST_HEAD(, VFIODMARange) dma_list;
     QLIST_ENTRY(VFIOContainer) next;
 } VFIOContainer;
 
-- 
2.23.0


