Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB5D34FDE5
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 12:17:51 +0200 (CEST)
Received: from localhost ([::1]:53976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXv4-0006uX-CL
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 06:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lRXr7-0002a4-EW; Wed, 31 Mar 2021 06:13:45 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lRXr5-0005kV-8j; Wed, 31 Mar 2021 06:13:45 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F9MXz4YfJzyNQb;
 Wed, 31 Mar 2021 18:11:31 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 18:13:27 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, Yi Sun <yi.y.sun@linux.intel.com>, "open list:ARM
 SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 3/4] vfio: Add
 vfio_prereg_listener_global_log_start/stop in nested stage
Date: Wed, 31 Mar 2021 18:12:58 +0800
Message-ID: <20210331101259.2153-4-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210331101259.2153-1-jiangkunkun@huawei.com>
References: <20210331101259.2153-1-jiangkunkun@huawei.com>
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
Cc: Liu Yi L <yi.l.liu@intel.com>, shameerali.kolothum.thodi@huawei.com,
 Kirti Wankhede <kwankhede@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In nested mode, we set up the stage 2 and stage 1 separately. In my
opinion, vfio_memory_prereg_listener is used for stage 2 and
vfio_memory_listener is used for stage 1. So it feels weird to call
the global_log_start/stop interface in vfio_memory_listener to switch
dirty tracking, although this won't cause any errors. Add
global_log_start/stop interface in vfio_memory_prereg_listener
can separate stage 2 from stage 1.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/vfio/common.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 86722814d4..efea252e46 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1209,6 +1209,16 @@ static void vfio_listener_log_global_start(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
 
+    if (container->iommu_type != VFIO_TYPE1_NESTING_IOMMU) {
+        vfio_set_dirty_page_tracking(container, true);
+    }
+}
+
+static void vfio_prereg_listener_log_global_start(MemoryListener *listener)
+{
+    VFIOContainer *container =
+        container_of(listener, VFIOContainer, prereg_listener);
+
     vfio_set_dirty_page_tracking(container, true);
 }
 
@@ -1216,6 +1226,16 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
 
+    if (container->iommu_type != VFIO_TYPE1_NESTING_IOMMU) {
+        vfio_set_dirty_page_tracking(container, false);
+    }
+}
+
+static void vfio_prereg_listener_log_global_stop(MemoryListener *listener)
+{
+    VFIOContainer *container =
+        container_of(listener, VFIOContainer, prereg_listener);
+
     vfio_set_dirty_page_tracking(container, false);
 }
 
@@ -1408,6 +1428,8 @@ static const MemoryListener vfio_memory_listener = {
 static MemoryListener vfio_memory_prereg_listener = {
     .region_add = vfio_prereg_listener_region_add,
     .region_del = vfio_prereg_listener_region_del,
+    .log_global_start = vfio_prereg_listener_log_global_start,
+    .log_global_stop = vfio_prereg_listener_log_global_stop,
     .log_sync = vfio_prereg_listener_log_sync,
 };
 
-- 
2.23.0


