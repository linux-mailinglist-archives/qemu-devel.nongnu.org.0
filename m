Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F0B202684
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jun 2020 22:57:24 +0200 (CEST)
Received: from localhost ([::1]:43220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmkYF-0006s5-O4
	for lists+qemu-devel@lfdr.de; Sat, 20 Jun 2020 16:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jmkWi-0005C1-IP
 for qemu-devel@nongnu.org; Sat, 20 Jun 2020 16:55:48 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jmkWe-0000J0-PR
 for qemu-devel@nongnu.org; Sat, 20 Jun 2020 16:55:47 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eee77750000>; Sat, 20 Jun 2020 13:54:13 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Sat, 20 Jun 2020 13:55:42 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Sat, 20 Jun 2020 13:55:42 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 20 Jun
 2020 20:55:32 +0000
Received: from kwankhede-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Sat, 20 Jun 2020 20:55:24 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH QEMU v25 07/17] vfio: Register SaveVMHandlers for VFIO device
Date: Sun, 21 Jun 2020 01:51:16 +0530
Message-ID: <1592684486-18511-8-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1592684486-18511-1-git-send-email-kwankhede@nvidia.com>
References: <1592684486-18511-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592686453; bh=ssgwQ+dYeBquOog0ic4yDdS8jDHl63cRDlskKzoP750=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=UWojAbVKVZ2Hz7ctpgse8M267F+s9gHoystXkPkf7L5bnaftgn6bsyXiMVcrBjsov
 +oPigKzinZ+99Ji6ee5ykwq3tyTgPirJUYa30KH4PpKEeVYykZnkSBPbZqm1OApeIK
 MX2qOcOJ9J9ZHLcw7sCaNu0/HiJgMz0HWVPxk08asPVDJ/RGyb5FPcIlLtbdb2LcS3
 J6PUO9j3Lzj7BS7A71rSR6ogUfFgabI6L5Syd6ARU/ybhUv6h33wEgaQ1LcnzsUBea
 wgfaN0bj3hKFBh8YSG2/ViUg1c39kqvJeBwEXfsJORi5i+zB1/6xBNQRzlzBlAya1/
 vrw+UPXm0ycDA==
Received-SPF: pass client-ip=216.228.121.143;
 envelope-from=kwankhede@nvidia.com; helo=hqnvemgate24.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/20 16:54:43
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: cohuck@redhat.com, aik@ozlabs.ru, Zhengxiao.zx@Alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, qemu-devel@nongnu.org, peterx@redhat.com,
 Kirti Wankhede <kwankhede@nvidia.com>, eauger@redhat.com, yi.l.liu@intel.com,
 quintela@redhat.com, ziye.yang@intel.com, armbru@redhat.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, felipe@nutanix.com,
 zhi.a.wang@intel.com, kevin.tian@intel.com, yan.y.zhao@intel.com,
 dgilbert@redhat.com, changpeng.liu@intel.com, eskultet@redhat.com,
 Ken.Xue@amd.com, jonathan.davies@nutanix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define flags to be used as delimeter in migration file stream.
Added .save_setup and .save_cleanup functions. Mapped & unmapped migration
region from these functions at source during saving or pre-copy phase.
Set VFIO device state depending on VM's state. During live migration, VM is
running when .save_setup is called, _SAVING | _RUNNING state is set for VFIO
device. During save-restore, VM is paused, _SAVING state is set for VFIO device.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
---
 hw/vfio/migration.c  | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events |  2 ++
 2 files changed, 94 insertions(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index e30bd8768701..133bb5b1b3b2 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -8,12 +8,15 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "qemu/cutils.h"
 #include <linux/vfio.h>
 
 #include "sysemu/runstate.h"
 #include "hw/vfio/vfio-common.h"
 #include "cpu.h"
 #include "migration/migration.h"
+#include "migration/vmstate.h"
 #include "migration/qemu-file.h"
 #include "migration/register.h"
 #include "migration/blocker.h"
@@ -24,6 +27,17 @@
 #include "pci.h"
 #include "trace.h"
 
+/*
+ * Flags used as delimiter:
+ * 0xffffffff => MSB 32-bit all 1s
+ * 0xef10     => emulated (virtual) function IO
+ * 0x0000     => 16-bits reserved for flags
+ */
+#define VFIO_MIG_FLAG_END_OF_STATE      (0xffffffffef100001ULL)
+#define VFIO_MIG_FLAG_DEV_CONFIG_STATE  (0xffffffffef100002ULL)
+#define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
+#define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
+
 static void vfio_migration_region_exit(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
@@ -126,6 +140,65 @@ static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
     return 0;
 }
 
+/* ---------------------------------------------------------------------- */
+
+static int vfio_save_setup(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+    int ret;
+
+    trace_vfio_save_setup(vbasedev->name);
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
+
+    if (migration->region.mmaps) {
+        qemu_mutex_lock_iothread();
+        ret = vfio_region_mmap(&migration->region);
+        qemu_mutex_unlock_iothread();
+        if (ret) {
+            error_report("%s: Failed to mmap VFIO migration region %d: %s",
+                         vbasedev->name, migration->region.nr,
+                         strerror(-ret));
+            return ret;
+        }
+    }
+
+    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
+                                   VFIO_DEVICE_STATE_SAVING);
+    if (ret) {
+        error_report("%s: Failed to set state SAVING", vbasedev->name);
+        return ret;
+    }
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
+
+    ret = qemu_file_get_error(f);
+    if (ret) {
+        return ret;
+    }
+
+    return 0;
+}
+
+static void vfio_save_cleanup(void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+
+    if (migration->region.mmaps) {
+        vfio_region_unmap(&migration->region);
+    }
+    trace_vfio_save_cleanup(vbasedev->name);
+}
+
+static SaveVMHandlers savevm_vfio_handlers = {
+    .save_setup = vfio_save_setup,
+    .save_cleanup = vfio_save_cleanup,
+};
+
+/* ---------------------------------------------------------------------- */
+
 static void vfio_vmstate_change(void *opaque, int running, RunState state)
 {
     VFIODevice *vbasedev = opaque;
@@ -180,6 +253,7 @@ static int vfio_migration_init(VFIODevice *vbasedev,
                                struct vfio_region_info *info)
 {
     int ret;
+    char id[256] = "";
 
     vbasedev->migration = g_new0(VFIOMigration, 1);
 
@@ -192,6 +266,24 @@ static int vfio_migration_init(VFIODevice *vbasedev,
         return ret;
     }
 
+    if (vbasedev->ops->vfio_get_object) {
+        Object *obj = vbasedev->ops->vfio_get_object(vbasedev);
+
+        if (obj) {
+            DeviceState *dev = DEVICE(obj);
+            char *oid = vmstate_if_get_id(VMSTATE_IF(dev));
+
+            if (oid) {
+                pstrcpy(id, sizeof(id), oid);
+                pstrcat(id, sizeof(id), "/");
+                g_free(oid);
+            }
+        }
+    }
+    pstrcat(id, sizeof(id), "vfio");
+
+    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
+                         vbasedev);
     vbasedev->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
                                                           vbasedev);
     vbasedev->migration_state.notify = vfio_migration_state_notifier;
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index bd3d47b005cb..86c18def016e 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -149,3 +149,5 @@ vfio_migration_probe(const char *name, uint32_t index) " (%s) Region %d"
 vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
 vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
+vfio_save_setup(const char *name) " (%s)"
+vfio_save_cleanup(const char *name) " (%s)"
-- 
2.7.0


