Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAC234FDDC
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 12:15:01 +0200 (CEST)
Received: from localhost ([::1]:46264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXsK-0003g5-8c
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 06:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lRXr1-0002U3-4B; Wed, 31 Mar 2021 06:13:40 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lRXqw-0005iF-Jz; Wed, 31 Mar 2021 06:13:38 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9MXF1lGKznVL4;
 Wed, 31 Mar 2021 18:10:53 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 18:13:21 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, Yi Sun <yi.y.sun@linux.intel.com>, "open list:ARM
 SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 1/4] vfio: Introduce helpers to mark dirty pages of a
 RAM section
Date: Wed, 31 Mar 2021 18:12:56 +0800
Message-ID: <20210331101259.2153-2-jiangkunkun@huawei.com>
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

Extract part of the code from vfio_sync_dirty_bitmap to form a
new helper, which allows to mark dirty pages of a RAM section.
This helper will be called for nested stage.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/vfio/common.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 7da1e95b43..3117979307 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1271,6 +1271,19 @@ err_out:
     return ret;
 }
 
+static int vfio_dma_sync_ram_section_dirty_bitmap(VFIOContainer *container,
+                                                  MemoryRegionSection *section)
+{
+    ram_addr_t ram_addr;
+
+    ram_addr = memory_region_get_ram_addr(section->mr) +
+               section->offset_within_region;
+
+    return vfio_get_dirty_bitmap(container,
+                    REAL_HOST_PAGE_ALIGN(section->offset_within_address_space),
+                    int128_get64(section->size), ram_addr);
+}
+
 typedef struct {
     IOMMUNotifier n;
     VFIOGuestIOMMU *giommu;
@@ -1312,8 +1325,6 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 static int vfio_sync_dirty_bitmap(VFIOContainer *container,
                                   MemoryRegionSection *section)
 {
-    ram_addr_t ram_addr;
-
     if (memory_region_is_iommu(section->mr)) {
         VFIOGuestIOMMU *giommu;
 
@@ -1342,12 +1353,7 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
         return 0;
     }
 
-    ram_addr = memory_region_get_ram_addr(section->mr) +
-               section->offset_within_region;
-
-    return vfio_get_dirty_bitmap(container,
-                   REAL_HOST_PAGE_ALIGN(section->offset_within_address_space),
-                   int128_get64(section->size), ram_addr);
+    return vfio_dma_sync_ram_section_dirty_bitmap(container, section);
 }
 
 static void vfio_listener_log_sync(MemoryListener *listener,
-- 
2.23.0


