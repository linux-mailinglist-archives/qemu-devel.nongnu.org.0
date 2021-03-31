Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA9C34FDE8
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 12:19:03 +0200 (CEST)
Received: from localhost ([::1]:57370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXwE-0008H5-Bh
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 06:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lRXr5-0002X4-MB; Wed, 31 Mar 2021 06:13:43 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lRXr0-0005iE-0N; Wed, 31 Mar 2021 06:13:43 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9MXt33c5z1BG04;
 Wed, 31 Mar 2021 18:11:26 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 18:13:25 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, Yi Sun <yi.y.sun@linux.intel.com>, "open list:ARM
 SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 2/4] vfio: Add vfio_prereg_listener_log_sync in nested
 stage
Date: Wed, 31 Mar 2021 18:12:57 +0800
Message-ID: <20210331101259.2153-3-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210331101259.2153-1-jiangkunkun@huawei.com>
References: <20210331101259.2153-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=jiangkunkun@huawei.com; helo=szxga04-in.huawei.com
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
Cc: Liu Yi L <yi.l.liu@intel.com>, shameerali.kolothum.thodi@huawei.com,
 Kirti Wankhede <kwankhede@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Intel, the DMA mapped through the host single stage. Instead
we set up the stage 2 and stage 1 separately in nested mode as there
is no "Caching Mode".

Legacy vfio_listener_log_sync cannot be used in nested stage as we
don't need to pay close attention to stage 1 mapping. This patch adds
vfio_prereg_listener_log_sync to mark dirty pages in nested mode.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/vfio/common.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3117979307..86722814d4 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1284,6 +1284,22 @@ static int vfio_dma_sync_ram_section_dirty_bitmap(VFIOContainer *container,
                     int128_get64(section->size), ram_addr);
 }
 
+static void vfio_prereg_listener_log_sync(MemoryListener *listener,
+                                          MemoryRegionSection *section)
+{
+    VFIOContainer *container =
+        container_of(listener, VFIOContainer, prereg_listener);
+
+    if (!memory_region_is_ram(section->mr) ||
+        !container->dirty_pages_supported) {
+        return;
+    }
+
+    if (vfio_devices_all_dirty_tracking(container)) {
+        vfio_dma_sync_ram_section_dirty_bitmap(container, section);
+    }
+}
+
 typedef struct {
     IOMMUNotifier n;
     VFIOGuestIOMMU *giommu;
@@ -1328,6 +1344,16 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
     if (memory_region_is_iommu(section->mr)) {
         VFIOGuestIOMMU *giommu;
 
+        /*
+         * In nested mode, stage 2 (gpa->hpa) and stage 1 (giova->gpa) are
+         * set up separately. It is inappropriate to pass 'giova' to kernel
+         * to get dirty pages. We only need to focus on stage 2 mapping when
+         * marking dirty pages.
+         */
+        if (container->iommu_type == VFIO_TYPE1_NESTING_IOMMU) {
+            return 0;
+        }
+
         QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
             if (MEMORY_REGION(giommu->iommu) == section->mr &&
                 giommu->n.start == section->offset_within_region) {
@@ -1382,6 +1408,7 @@ static const MemoryListener vfio_memory_listener = {
 static MemoryListener vfio_memory_prereg_listener = {
     .region_add = vfio_prereg_listener_region_add,
     .region_del = vfio_prereg_listener_region_del,
+    .log_sync = vfio_prereg_listener_log_sync,
 };
 
 static void vfio_listener_release(VFIOContainer *container)
-- 
2.23.0


