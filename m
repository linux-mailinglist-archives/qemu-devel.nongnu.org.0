Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206C02B8AAE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 05:51:27 +0100 (CET)
Received: from localhost ([::1]:34118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfbun-0005fO-Ob
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 23:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kfbu3-00059x-DT
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 23:50:39 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kfbu0-000142-PO
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 23:50:38 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fb5f99e0000>; Wed, 18 Nov 2020 20:50:38 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Nov
 2020 04:50:34 +0000
Received: from kwankhede-dev.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 19 Nov 2020 04:50:31 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cohuck@redhat.com>, <dgilbert@redhat.com>, 
 <cjia@nvidia.com>, <mcrossley@nvidia.com>
Subject: [PATCH 1/1] vfio: Change default dirty pages tracking behavior during
 migration
Date: Thu, 19 Nov 2020 09:48:01 +0530
Message-ID: <1605759481-23726-1-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605761438; bh=WSmYqrkcOhZ0Sb30UnL4KTyvNoqYXJhdbhrmci5RJWA=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
 MIME-Version:Content-Type;
 b=gXPc6yoZzfbTXeDNF7w2d6xmp5zPs4SUoTkJpNweH9C6M0tMgQVVDeJJ4Z/xvkVHo
 2gBO4C66JrkRIfZ9hkOvjvWKHulI+uDuJAaKolmUwObtEEnEJAGmbQGn3nZ+38ZSjh
 2u1O68Y1HBko66NJNUuMyoCZsCIQAP5bSok9vmLTIPU9x1S/q9JVn9Uz3f7UFy+49w
 EzaN+cOwTXGcvEsdyOrq8c6VP+yPrsUa7JKkFbSgFlQcR6U3QLNcCy4j8uaimQrPir
 07vV4IRy3zuEJOZsG2QwsO2wSOFFbH3sxYEUGRXS9Kx0C4g1xwE/GTlTepn5bPfdDX
 HeK1M3bJK1WZQ==
Received-SPF: pass client-ip=216.228.121.65; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate26.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:50:35
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
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
index 58c0ce8971e3..5bea4b3e71f5 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3182,6 +3182,9 @@ static void vfio_instance_init(Object *obj)
 static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
     DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
+    DEFINE_PROP_ON_OFF_AUTO("pre-copy-dirty-page-tracking", VFIOPCIDevice,
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


