Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EFD2B2C63
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 10:19:23 +0100 (CET)
Received: from localhost ([::1]:52978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdriM-00009o-41
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 04:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1kdrhV-0008B0-Jw; Sat, 14 Nov 2020 04:18:29 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1kdrhS-0006Dk-Lf; Sat, 14 Nov 2020 04:18:29 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CY8rL0WjjzLxxg;
 Sat, 14 Nov 2020 17:17:54 +0800 (CST)
Received: from DESKTOP-7FEPK9S.china.huawei.com (10.174.184.195) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Sat, 14 Nov 2020 17:17:59 +0800
From: Shenming Lu <lushenming@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RFC] vfio: Move the saving of the config space to the right
 place in VFIO migration
Date: Sat, 14 Nov 2020 17:17:31 +0800
Message-ID: <20201114091731.157-1-lushenming@huawei.com>
X-Mailer: git-send-email 2.27.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.184.195]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=lushenming@huawei.com; helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 04:18:10
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: Neo Jia <cjia@nvidia.com>, Marc Zyngier <maz@kernel.org>,
 qemu-devel@nongnu.org, lushenming@huawei.com, qemu-arm@nongnu.org,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running VFIO migration, I found that the restoring of VFIO PCI device’s
config space is before VGIC on ARM64 target. But generally, interrupt controllers
need to be restored before PCI devices. Besides, if a VFIO PCI device is
configured to have directly-injected MSIs (VLPIs), the restoring of its config
space will trigger the configuring of these VLPIs (in kernel), where it would
return an error as I saw due to the dependency on kvm’s vgic.

To avoid this, we can move the saving of the config space from the iterable
process to the non-iterable process, so that it will be called after VGIC
according to their priorities.

Signed-off-by: Shenming Lu <lushenming@huawei.com>
---
 hw/vfio/migration.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 3ce285ea39..028da35a25 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -351,7 +351,7 @@ static int vfio_update_pending(VFIODevice *vbasedev)
     return 0;
 }
 
-static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
+static void vfio_save_device_config_state(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
 
@@ -365,13 +365,14 @@ static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
 
     trace_vfio_save_device_config_state(vbasedev->name);
 
-    return qemu_file_get_error(f);
+    if (qemu_file_get_error(f))
+        error_report("%s: Failed to save device config space",
+                     vbasedev->name);
 }
 
 static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
-    uint64_t data;
 
     if (vbasedev->ops && vbasedev->ops->vfio_load_config) {
         int ret;
@@ -384,15 +385,8 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
         }
     }
 
-    data = qemu_get_be64(f);
-    if (data != VFIO_MIG_FLAG_END_OF_STATE) {
-        error_report("%s: Failed loading device config space, "
-                     "end flag incorrect 0x%"PRIx64, vbasedev->name, data);
-        return -EINVAL;
-    }
-
     trace_vfio_load_device_config_state(vbasedev->name);
-    return qemu_file_get_error(f);
+    return 0;
 }
 
 static int vfio_set_dirty_page_tracking(VFIODevice *vbasedev, bool start)
@@ -575,11 +569,6 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = vfio_save_device_config_state(f, opaque);
-    if (ret) {
-        return ret;
-    }
-
     ret = vfio_update_pending(vbasedev);
     if (ret) {
         return ret;
@@ -720,6 +709,7 @@ static SaveVMHandlers savevm_vfio_handlers = {
     .save_live_pending = vfio_save_pending,
     .save_live_iterate = vfio_save_iterate,
     .save_live_complete_precopy = vfio_save_complete_precopy,
+    .save_state = vfio_save_device_config_state,
     .load_setup = vfio_load_setup,
     .load_cleanup = vfio_load_cleanup,
     .load_state = vfio_load_state,
-- 
2.19.1


