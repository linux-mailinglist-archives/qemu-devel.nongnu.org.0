Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1F062F49
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 06:18:45 +0200 (CEST)
Received: from localhost ([::1]:46622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkhaW-00050S-Dp
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 00:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35865)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwankhede@nvidia.com>) id 1hkhUf-0007hN-WC
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 00:12:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1hkhUe-0005Gm-Mc
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 00:12:41 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:11066)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1hkhUe-0005Fu-7a
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 00:12:40 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d2414320003>; Mon, 08 Jul 2019 21:12:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 08 Jul 2019 21:12:39 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 08 Jul 2019 21:12:39 -0700
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Jul
 2019 02:02:26 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 9 Jul 2019 02:02:20 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Date: Tue, 9 Jul 2019 07:29:07 +0530
Message-ID: <1562637554-22439-7-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1562637554-22439-1-git-send-email-kwankhede@nvidia.com>
References: <1562637554-22439-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1562645554; bh=CzIjuh45DV8zioWi2bRTMYHoiTulp8p5NKtpMhF1Pz8=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=G8oTUaMgDkf4e3UKP5CfFol5L0TvrVwcwnIN7Xyuh6P2u7+Jxp3P6tpiy8ybC3pGH
 Iai110NQi2BRIzAu57vzge/rG4R9sVBGbZ8y34PTHJJpdg13t+Gckd4Yx8VpEsjIQl
 Lrto9vSYnCtKmJAOECHVB3zkn4RHdPjNKhyym4hfR47bsgwSnoQsSznl1bJW2efSnR
 rMWdE10FhsWI1ke3WGehMbM9g7sbZtgy0kDpoUpWGliEA7de8WFCs3S+a2i0OL7O3t
 msdcOgKnJ6k9LM+VRmt0hB6+OrOI+NRY6THX+dl6MWXMtxb1+qjSe+vMb8ClzAJ3vA
 QjgPgwpDnrBlA==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 216.228.121.143
Subject: [Qemu-devel] [PATCH v6 06/13] vfio: Add VM state change handler to
 know state of VM
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

VM state change handler gets called on change in VM's state. This is used to set
VFIO device state to _RUNNING.
VM state change handler, migration state change handler and log_sync listener
are called asynchronously, which sometimes lead to data corruption in migration
region. Initialised mutex that is used to serialize operations on migration data
region during saving state.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
---
 hw/vfio/migration.c           | 64 +++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events          |  2 ++
 include/hw/vfio/vfio-common.h |  4 +++
 3 files changed, 70 insertions(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index a2cfbd5af2e1..c01f08b659d0 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -78,6 +78,60 @@ err:
     return ret;
 }
 
+static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t state)
+{
+    VFIOMigration *migration = vbasedev->migration;
+    VFIORegion *region = &migration->region.buffer;
+    uint32_t device_state;
+    int ret = 0;
+
+    device_state = (state & VFIO_DEVICE_STATE_MASK) |
+                   (vbasedev->device_state & ~VFIO_DEVICE_STATE_MASK);
+
+    if ((device_state & VFIO_DEVICE_STATE_MASK) == VFIO_DEVICE_STATE_INVALID) {
+        return -EINVAL;
+    }
+
+    ret = pwrite(vbasedev->fd, &device_state, sizeof(device_state),
+                 region->fd_offset + offsetof(struct vfio_device_migration_info,
+                                              device_state));
+    if (ret < 0) {
+        error_report("%s: Failed to set device state %d %s",
+                     vbasedev->name, ret, strerror(errno));
+        return ret;
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
+        uint32_t dev_state;
+
+        if (running) {
+            dev_state = VFIO_DEVICE_STATE_RUNNING;
+        } else {
+            dev_state = (vbasedev->device_state & VFIO_DEVICE_STATE_MASK) &
+                     ~VFIO_DEVICE_STATE_RUNNING;
+        }
+
+        ret = vfio_migration_set_state(vbasedev, dev_state);
+        if (ret) {
+            error_report("%s: Failed to set device state 0x%x",
+                         vbasedev->name, dev_state);
+        }
+        vbasedev->vm_running = running;
+        trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
+                                  dev_state);
+    }
+}
+
 static int vfio_migration_init(VFIODevice *vbasedev,
                                struct vfio_region_info *info)
 {
@@ -93,6 +147,11 @@ static int vfio_migration_init(VFIODevice *vbasedev,
         return ret;
     }
 
+    qemu_mutex_init(&vbasedev->migration->lock);
+
+    vbasedev->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
+                                                          vbasedev);
+
     return 0;
 }
 
@@ -135,11 +194,16 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
         return;
     }
 
+    if (vbasedev->vm_state) {
+        qemu_del_vm_change_state_handler(vbasedev->vm_state);
+    }
+
     if (vbasedev->migration_blocker) {
         migrate_del_blocker(vbasedev->migration_blocker);
         error_free(vbasedev->migration_blocker);
     }
 
+    qemu_mutex_destroy(&vbasedev->migration->lock);
     vfio_migration_region_exit(vbasedev);
     g_free(vbasedev->migration);
 }
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 191a726a1312..3d15bacd031a 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -146,3 +146,5 @@ vfio_display_edid_write_error(void) ""
 
 # migration.c
 vfio_migration_probe(char *name, uint32_t index) " (%s) Region %d"
+vfio_migration_set_state(char *name, uint32_t state) " (%s) state %d"
+vfio_vmstate_change(char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 152da3f8d6f3..f6c70db3a9c1 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -29,6 +29,7 @@
 #ifdef CONFIG_LINUX
 #include <linux/vfio.h>
 #endif
+#include "sysemu/sysemu.h"
 
 #define VFIO_MSG_PREFIX "vfio %s: "
 
@@ -124,6 +125,9 @@ typedef struct VFIODevice {
     unsigned int flags;
     VFIOMigration *migration;
     Error *migration_blocker;
+    uint32_t device_state;
+    VMChangeStateEntry *vm_state;
+    int vm_running;
 } VFIODevice;
 
 struct VFIODeviceOps {
-- 
2.7.0


