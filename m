Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5423F1DBD87
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 21:03:11 +0200 (CEST)
Received: from localhost ([::1]:54076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbTzi-0006Tk-ED
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 15:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jbTvY-0007sI-MY
 for qemu-devel@nongnu.org; Wed, 20 May 2020 14:58:52 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:3086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jbTvX-0004p9-F1
 for qemu-devel@nongnu.org; Wed, 20 May 2020 14:58:52 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec57ddd0000>; Wed, 20 May 2020 11:58:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 20 May 2020 11:58:50 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 20 May 2020 11:58:50 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 May
 2020 18:58:49 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 20 May 2020 18:58:41 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH QEMU v23 06/18] vfio: Add VM state change handler to know
 state of VM
Date: Wed, 20 May 2020 23:54:36 +0530
Message-ID: <1589999088-31477-7-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1589999088-31477-1-git-send-email-kwankhede@nvidia.com>
References: <1589999088-31477-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590001118; bh=NL3caF6Xfstg14riBEcUSrgXtR15ikejbp/eQUNUFm0=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=SKaw1512RsCHYm3rqjkAYyCjUV7V5r241FjQKaON2NjbyX/ocFMutIFaw839LUQHB
 c1fHqEs5PTgsyMEk7PkKWdJzEvA/3M8Y3UsjL7MJygE7cFYHPfOvW4EK56UfO4eAAw
 l+b8psxnKFsAeJEtLU8DTqSlVIV86YSsCB/i9zzAiwqgP7qi4fZoiF7pJu+xwP3PRZ
 R8W9Ex1q+SorTiNnEUr6OT3aXBfZ/rQkExdvvo0R9Wi6lyZAjP5bWWiGp1e+WcUWwA
 lOWeyJjyLpc0Xwjvs4WgReS2tvGiiMEzXDDZoj4OIYWXhB7w4CAP07U7fPKfywqXYa
 3axzCvAVm7bkg==
Received-SPF: pass client-ip=216.228.121.65; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate26.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 14:41:35
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

VM state change handler gets called on change in VM's state. This is used to set
VFIO device state to _RUNNING.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
---
 hw/vfio/migration.c           | 87 +++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events          |  2 +
 include/hw/vfio/vfio-common.h |  4 ++
 3 files changed, 93 insertions(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index bf9384907ec0..e79b34003079 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 #include <linux/vfio.h>
 
+#include "sysemu/runstate.h"
 #include "hw/vfio/vfio-common.h"
 #include "cpu.h"
 #include "migration/migration.h"
@@ -74,6 +75,85 @@ err:
     return ret;
 }
 
+static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
+                                    uint32_t value)
+{
+    VFIOMigration *migration = vbasedev->migration;
+    VFIORegion *region = &migration->region;
+    uint32_t device_state;
+    int ret;
+
+    ret = pread(vbasedev->fd, &device_state, sizeof(device_state),
+                region->fd_offset + offsetof(struct vfio_device_migration_info,
+                                              device_state));
+    if (ret < 0) {
+        error_report("%s: Failed to read device state %d %s",
+                     vbasedev->name, ret, strerror(errno));
+        return ret;
+    }
+
+    device_state = (device_state & mask) | value;
+
+    if (!VFIO_DEVICE_STATE_VALID(device_state)) {
+        return -EINVAL;
+    }
+
+    ret = pwrite(vbasedev->fd, &device_state, sizeof(device_state),
+                 region->fd_offset + offsetof(struct vfio_device_migration_info,
+                                              device_state));
+    if (ret < 0) {
+        error_report("%s: Failed to set device state %d %s",
+                     vbasedev->name, ret, strerror(errno));
+
+        ret = pread(vbasedev->fd, &device_state, sizeof(device_state),
+                region->fd_offset + offsetof(struct vfio_device_migration_info,
+                device_state));
+        if (ret < 0) {
+            error_report("%s: On failure, failed to read device state %d %s",
+                    vbasedev->name, ret, strerror(errno));
+            return ret;
+        }
+
+        if (VFIO_DEVICE_STATE_IS_ERROR(device_state)) {
+            error_report("%s: Device is in error state 0x%x",
+                         vbasedev->name, device_state);
+            return -EFAULT;
+        }
+    }
+
+    vbasedev->device_state = device_state;
+    trace_vfio_migration_set_state(vbasedev->name, device_state);
+    return 0;
+}
+
+static void vfio_vmstate_change(void *opaque, int running, RunState state)
+{
+    VFIODevice *vbasedev = opaque;
+
+    if ((vbasedev->vm_running != running)) {
+        int ret;
+        uint32_t value = 0, mask = 0;
+
+        if (running) {
+            value = VFIO_DEVICE_STATE_RUNNING;
+            if (vbasedev->device_state & VFIO_DEVICE_STATE_RESUMING) {
+                mask = ~VFIO_DEVICE_STATE_RESUMING;
+            }
+        } else {
+            mask = ~VFIO_DEVICE_STATE_RUNNING;
+        }
+
+        ret = vfio_migration_set_state(vbasedev, mask, value);
+        if (ret) {
+            error_report("%s: Failed to set device state 0x%x",
+                         vbasedev->name, value & mask);
+        }
+        vbasedev->vm_running = running;
+        trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
+                                  value & mask);
+    }
+}
+
 static int vfio_migration_init(VFIODevice *vbasedev,
                                struct vfio_region_info *info)
 {
@@ -90,6 +170,9 @@ static int vfio_migration_init(VFIODevice *vbasedev,
         return ret;
     }
 
+    vbasedev->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
+                                                          vbasedev);
+
     return 0;
 }
 
@@ -128,6 +211,10 @@ add_blocker:
 
 void vfio_migration_finalize(VFIODevice *vbasedev)
 {
+    if (vbasedev->vm_state) {
+        qemu_del_vm_change_state_handler(vbasedev->vm_state);
+    }
+
     if (vbasedev->migration_blocker) {
         migrate_del_blocker(vbasedev->migration_blocker);
         error_free(vbasedev->migration_blocker);
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index fd034ac53684..14b0a86c0035 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -146,3 +146,5 @@ vfio_display_edid_write_error(void) ""
 
 # migration.c
 vfio_migration_probe(const char *name, uint32_t index) " (%s) Region %d"
+vfio_migration_set_state(char *name, uint32_t state) " (%s) state %d"
+vfio_vmstate_change(char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index d4b268641173..3d18eb146b33 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -29,6 +29,7 @@
 #ifdef CONFIG_LINUX
 #include <linux/vfio.h>
 #endif
+#include "sysemu/sysemu.h"
 
 #define VFIO_MSG_PREFIX "vfio %s: "
 
@@ -119,6 +120,9 @@ typedef struct VFIODevice {
     unsigned int flags;
     VFIOMigration *migration;
     Error *migration_blocker;
+    VMChangeStateEntry *vm_state;
+    uint32_t device_state;
+    int vm_running;
 } VFIODevice;
 
 struct VFIODeviceOps {
-- 
2.7.0


