Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F7262936
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 21:23:11 +0200 (CEST)
Received: from localhost ([::1]:44152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkZEF-0006uF-2M
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 15:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35113)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwankhede@nvidia.com>) id 1hkZCK-00057f-5o
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 15:21:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1hkZCI-00033G-Ef
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 15:21:12 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:6402)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1hkZCI-0002yU-55
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 15:21:10 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d2397990001>; Mon, 08 Jul 2019 12:20:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 08 Jul 2019 12:21:01 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 08 Jul 2019 12:21:01 -0700
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 8 Jul
 2019 19:21:01 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 8 Jul 2019 19:20:54 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Date: Tue, 9 Jul 2019 00:47:27 +0530
Message-ID: <1562613452-24969-9-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1562613452-24969-1-git-send-email-kwankhede@nvidia.com>
References: <1562613452-24969-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1562613657; bh=8vUPg3KmhoNDzrGG08rPjtEGsYW1X/3yWpzwzoAlpYU=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=UrZ6paLAvEiAxNsVvfg2VcEYovIK+xoWrcf7dIFYE3+CodmQb2UnjNTuBfEkl6oCn
 MelyKtf/HjrrvCLDYXTFQOIiXv3JgPBa2HK/m3GS4ZlrNpk2EXS+snraD6oAORzCvA
 ok/PgQDtlydY8SwbHaRWxgK9tF5tp7oOppiUdomzdkPqHHAuKcK3NBU2cSG1vlWL++
 pLSnJ7BPabi234J8+h0Y2n9uFLqNTPsd75brmA/clvCBJfuoULNEm6ziw9Ljmjw2xF
 3naaYtd2fFC06KC0TfdxEZCjavEFlN38LIklDpSfRYTPcg+1JzQED5o9yP+1BsX9ZL
 mz7tH7b/pt2cw==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 216.228.121.143
Subject: [Qemu-devel] [PATCH v5 08/13] vfio: Register SaveVMHandlers for
 VFIO device
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
Cc: Zhengxiao.zx@Alibaba-inc.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 yan.y.zhao@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 qemu-devel@nongnu.org, cohuck@redhat.com, shuangtai.tst@alibaba-inc.com,
 dgilbert@redhat.com, zhi.a.wang@intel.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, aik@ozlabs.ru, Kirti Wankhede <kwankhede@nvidia.com>,
 eauger@redhat.com, felipe@nutanix.com, jonathan.davies@nutanix.com,
 changpeng.liu@intel.com, Ken.Xue@amd.com
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
 hw/vfio/migration.c  | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 hw/vfio/trace-events |  2 ++
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index e4a89a6f9bc7..0597a45fda2d 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -23,6 +23,17 @@
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
@@ -106,6 +117,74 @@ static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t state)
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
+    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
+
+    if (migration->region.buffer.mmaps) {
+        qemu_mutex_lock_iothread();
+        ret = vfio_region_mmap(&migration->region.buffer);
+        qemu_mutex_unlock_iothread();
+        if (ret) {
+            error_report("%s: Failed to mmap VFIO migration region %d: %s",
+                         vbasedev->name, migration->region.index,
+                         strerror(-ret));
+            return ret;
+        }
+    }
+
+    if (vbasedev->vm_running) {
+        ret = vfio_migration_set_state(vbasedev,
+                         VFIO_DEVICE_STATE_RUNNING | VFIO_DEVICE_STATE_SAVING);
+        if (ret) {
+            error_report("%s: Failed to set state RUNNING and SAVING",
+                         vbasedev->name);
+            return ret;
+        }
+    } else {
+        ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_SAVING);
+        if (ret) {
+            error_report("%s: Failed to set state STOP and SAVING",
+                         vbasedev->name);
+            return ret;
+        }
+    }
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
+
+    ret = qemu_file_get_error(f);
+    if (ret) {
+        return ret;
+    }
+
+    trace_vfio_save_setup(vbasedev->name);
+    return 0;
+}
+
+static void vfio_save_cleanup(void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+
+    if (migration->region.buffer.mmaps) {
+        vfio_region_unmap(&migration->region.buffer);
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
@@ -195,7 +274,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
     }
 
     qemu_mutex_init(&vbasedev->migration->lock);
-
+    register_savevm_live(vbasedev->dev, "vfio", -1, 1, &savevm_vfio_handlers,
+                         vbasedev);
     vbasedev->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
                                                           vbasedev);
 
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 69503228f20e..4bb43f18f315 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -149,3 +149,5 @@ vfio_migration_probe(char *name, uint32_t index) " (%s) Region %d"
 vfio_migration_set_state(char *name, uint32_t state) " (%s) state %d"
 vfio_vmstate_change(char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
 vfio_migration_state_notifier(char *name, int state) " (%s) state %d"
+vfio_save_setup(char *name) " (%s)"
+vfio_save_cleanup(char *name) " (%s)"
-- 
2.7.0


