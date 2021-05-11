Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665A4379CE1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 04:21:56 +0200 (CEST)
Received: from localhost ([::1]:47088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgI1z-0008J5-HL
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 22:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lgHyJ-0002Ha-AG; Mon, 10 May 2021 22:18:07 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lgHyF-0001p9-Nc; Mon, 10 May 2021 22:18:07 -0400
Received: from dggeml702-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FfM0m5TS2z19NS3;
 Tue, 11 May 2021 10:13:44 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggeml702-chm.china.huawei.com (10.3.17.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 10:17:58 +0800
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 10:17:57 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH v3 1/4] vfio: Introduce helpers to mark dirty pages of a
 RAM section
Date: Tue, 11 May 2021 10:08:13 +0800
Message-ID: <20210511020816.2905-2-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210511020816.2905-1-jiangkunkun@huawei.com>
References: <20210511020816.2905-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=jiangkunkun@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: kevin.tian@intel.com, Kunkun Jiang <jiangkunkun@huawei.com>,
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
index dc8372c772..9fb8d44a6d 100644
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


