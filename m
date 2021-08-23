Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985C43F4A25
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 13:58:37 +0200 (CEST)
Received: from localhost ([::1]:42252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI8b6-0001GA-5n
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 07:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mI8Zh-0008Gs-AK
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 07:57:09 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mI8Ze-0000sD-MZ
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 07:57:09 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GtVxP68xYzbhLv;
 Mon, 23 Aug 2021 19:53:13 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 23 Aug 2021 19:57:01 +0800
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 23 Aug 2021 19:57:01 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH 2/2] vfio/common: Fix address alignment in
 region_add/region_del
Date: Mon, 23 Aug 2021 19:56:39 +0800
Message-ID: <20210823115640.817-3-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210823115640.817-1-jiangkunkun@huawei.com>
References: <20210823115640.817-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: wanghaibin.wang@huawei.com, Kunkun Jiang <jiangkunkun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The page sizes supported by IOMMU may not match the CPU page size.
For example, the CPU page size is 16KB, but ARM SMMU may not support
16KB. So it is inappropriate to use qemu_real_host_page_mask in
region_add/region_del.

The vfio iommu page sizes exposed via VFIO_IOMMU_GET_INFO. So use
the smallest page size to align the address.

Fixes: 1eb7f642750 (vfio: Support host translation granule size)
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/vfio/common.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index bbb8d1ea0c..62f338cd78 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -859,10 +859,13 @@ static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
     g_free(vrdl);
 }
 
+#define VFIO_IOMMU_MIN_PAGE_ALIGN(addr, pgsize) ROUND_UP((addr), (pgsize))
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    uint64_t vfio_iommu_min_page_size, vfio_iommu_min_page_mask;
     hwaddr iova, end;
     Int128 llend, llsize;
     void *vaddr;
@@ -879,17 +882,21 @@ static void vfio_listener_region_add(MemoryListener *listener,
         return;
     }
 
+    vfio_iommu_min_page_size = 1 << ctz64(container->pgsizes);
+    vfio_iommu_min_page_mask = ~(vfio_iommu_min_page_size - 1);
+
     if (unlikely((section->offset_within_address_space &
-                  ~qemu_real_host_page_mask) !=
-                 (section->offset_within_region & ~qemu_real_host_page_mask))) {
+                  ~vfio_iommu_min_page_mask) !=
+                 (section->offset_within_region & ~vfio_iommu_min_page_mask))) {
         error_report("%s received unaligned region", __func__);
         return;
     }
 
-    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
+    iova = VFIO_IOMMU_MIN_PAGE_ALIGN(section->offset_within_address_space,
+                                     vfio_iommu_min_page_size);
     llend = int128_make64(section->offset_within_address_space);
     llend = int128_add(llend, section->size);
-    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
+    llend = int128_and(llend, int128_exts64(vfio_iommu_min_page_mask));
 
     if (int128_ge(int128_make64(iova), llend)) {
         if (memory_region_is_ram_device(section->mr)) {
@@ -897,7 +904,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
                 memory_region_name(section->mr),
                 section->offset_within_address_space,
                 int128_getlo(section->size),
-                qemu_real_host_page_size);
+                vfio_iommu_min_page_size);
         }
         return;
     }
@@ -1102,6 +1109,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    uint64_t vfio_iommu_min_page_size, vfio_iommu_min_page_mask;
     hwaddr iova, end;
     Int128 llend, llsize;
     int ret;
@@ -1115,9 +1123,12 @@ static void vfio_listener_region_del(MemoryListener *listener,
         return;
     }
 
+    vfio_iommu_min_page_size = 1 << ctz64(container->pgsizes);
+    vfio_iommu_min_page_mask = ~(vfio_iommu_min_page_size - 1);
+
     if (unlikely((section->offset_within_address_space &
-                  ~qemu_real_host_page_mask) !=
-                 (section->offset_within_region & ~qemu_real_host_page_mask))) {
+                  ~vfio_iommu_min_page_mask) !=
+                 (section->offset_within_region & ~vfio_iommu_min_page_mask))) {
         error_report("%s received unaligned region", __func__);
         return;
     }
@@ -1145,10 +1156,11 @@ static void vfio_listener_region_del(MemoryListener *listener,
          */
     }
 
-    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
+    iova = VFIO_IOMMU_MIN_PAGE_ALIGN(section->offset_within_address_space,
+                                     vfio_iommu_min_page_size);
     llend = int128_make64(section->offset_within_address_space);
     llend = int128_add(llend, section->size);
-    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
+    llend = int128_and(llend, int128_exts64(vfio_iommu_min_page_mask));
 
     if (int128_ge(int128_make64(iova), llend)) {
         return;
-- 
2.23.0


