Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838542C0E32
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:57:53 +0100 (CET)
Received: from localhost ([::1]:47394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khDHs-0007ok-KX
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1khDFn-0005pn-38
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:55:43 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1khDFl-00062g-83
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:55:42 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fbbcd710000>; Mon, 23 Nov 2020 06:55:45 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Nov
 2020 14:55:39 +0000
Received: from kwankhede-dev.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 23 Nov 2020 14:55:36 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cohuck@redhat.com>, <dgilbert@redhat.com>, 
 <cjia@nvidia.com>, <mcrossley@nvidia.com>
Subject: [PATCH v2 1/1] vfio: Change default dirty pages tracking behavior
 during migration
Date: Mon, 23 Nov 2020 19:53:19 +0530
Message-ID: <1606141399-22677-1-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1606143345; bh=Wp5NiKecTjDmG1K/4iKaZqGU2YMRnkEMaEfKIOqQSJk=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
 MIME-Version:Content-Type;
 b=FKt/5a2i64WIyZ3aiJ/aSJ8NQi2BbDsAn+N9e9EEhc0nQjCcMjHqukbAENsODo95U
 7zSAdBPIf97tQ55MVAMUg3r3BRR2fbLvHe9cobqxWkjAWoQ0+6LlFb2tPmC9rjS4B+
 TN0Y4dGdxoz775bVyWvaujYcw02XWCfaN0pR3pHIv8Fd0w5l3BK/NdR5/mjX0WNoKr
 oKnH9wPGYherl5UIrYoULIUC5jMrD1L2cx+tcljFexB1N0cxNxvsC2cN1EtzrSNuJ+
 7kYeuagM7l5AhorLHKTzmlKyB3+YZAy664qNw05kslXCJLBN3SfLHD0qwKX67FgiU6
 k+aplswCd37Vw==
Received-SPF: pass client-ip=216.228.121.143;
 envelope-from=kwankhede@nvidia.com; helo=hqnvemgate24.nvidia.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By default dirty pages tracking is enabled during iterative phase
(pre-copy phase).
Added per device opt-out option 'pre-copy-dirty-page-tracking' to
disable dirty pages tracking during iterative phase. If the option
'pre-copy-dirty-page-tracking=off' is set for any VFIO device, dirty
pages tracking during iterative phase will be disabled.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
---
 hw/vfio/common.c              | 11 +++++++----
 hw/vfio/pci.c                 |  3 +++
 include/hw/vfio/vfio-common.h |  1 +
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index c1fdbf17f2e6..6ff1daa763f8 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -311,7 +311,7 @@ bool vfio_mig_active(void)
     return true;
 }
 
-static bool vfio_devices_all_stopped_and_saving(VFIOContainer *container)
+static bool vfio_devices_all_saving(VFIOContainer *container)
 {
     VFIOGroup *group;
     VFIODevice *vbasedev;
@@ -329,8 +329,11 @@ static bool vfio_devices_all_stopped_and_saving(VFIOContainer *container)
                 return false;
             }
 
-            if ((migration->device_state & VFIO_DEVICE_STATE_SAVING) &&
-                !(migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
+            if (migration->device_state & VFIO_DEVICE_STATE_SAVING) {
+                if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
+                    && (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
+                        return false;
+                }
                 continue;
             } else {
                 return false;
@@ -1125,7 +1128,7 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
         return;
     }
 
-    if (vfio_devices_all_stopped_and_saving(container)) {
+    if (vfio_devices_all_saving(container)) {
         vfio_sync_dirty_bitmap(container, section);
     }
 }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 58c0ce8971e3..5601df6d6241 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3182,6 +3182,9 @@ static void vfio_instance_init(Object *obj)
 static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
     DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
+    DEFINE_PROP_ON_OFF_AUTO("x-pre-copy-dirty-page-tracking", VFIOPCIDevice,
+                            vbasedev.pre_copy_dirty_page_tracking,
+                            ON_OFF_AUTO_ON),
     DEFINE_PROP_ON_OFF_AUTO("display", VFIOPCIDevice,
                             display, ON_OFF_AUTO_OFF),
     DEFINE_PROP_UINT32("xres", VFIOPCIDevice, display_xres, 0),
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index baeb4dcff102..267cf854bbba 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -129,6 +129,7 @@ typedef struct VFIODevice {
     unsigned int flags;
     VFIOMigration *migration;
     Error *migration_blocker;
+    OnOffAuto pre_copy_dirty_page_tracking;
 } VFIODevice;
 
 struct VFIODeviceOps {
-- 
2.7.0


