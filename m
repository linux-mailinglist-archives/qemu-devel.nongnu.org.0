Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C165762995
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 21:29:02 +0200 (CEST)
Received: from localhost ([::1]:44248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkZJu-0006yu-0O
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 15:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35018)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwankhede@nvidia.com>) id 1hkZCF-00050R-Su
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 15:21:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1hkZCB-0002z1-9J
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 15:21:07 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:6377)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1hkZC8-0002so-Ls
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 15:21:02 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d2397920000>; Mon, 08 Jul 2019 12:20:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 08 Jul 2019 12:20:54 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 08 Jul 2019 12:20:54 -0700
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 8 Jul
 2019 19:20:54 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 8 Jul 2019 19:20:48 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Date: Tue, 9 Jul 2019 00:47:26 +0530
Message-ID: <1562613452-24969-8-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1562613452-24969-1-git-send-email-kwankhede@nvidia.com>
References: <1562613452-24969-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1562613650; bh=SI3JRw38FBSF2Z2uCSJm8vd8dZhbA/5dfd1kkJAiy8A=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=lFa8uVnmbmUGODeKFzz3Pwvg/mVCDhRuLuIhTMO32KPuFeK4flZeyGLl85DYxOQNL
 hyn0Kbz0uxCS22G+rxqMlS65m6h/6334+CDt22AqBwlZf4NCymZGyjyVvOQrt4bVO4
 tkFhJLQuTAOC/WcoAuW+Chq9E5BDMYD2kzZxKnYjejLFQ7YDob1Xwv5+Iwvmzy0CKt
 BktlpTe6NJ7eylCF1LnZQSbpZB3sB4ssTQREQ+pqBhiaaGQt99aZtpX5sv4Pf+ip2o
 bM8pUd6+5SNURNrDKYZCMy0qMI4wkI81Y5hWy394eLjVEav+bmhH80v9+v9eh7k7Qj
 /NrnU0Z+gi/eQ==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 216.228.121.143
Subject: [Qemu-devel] [PATCH v5 07/13] vfio: Add migration state change
 notifier
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

Added migration state change notifier to get notification on migration state
change. These states are translated to VFIO device state and conveyed to vendor
driver.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
---
 hw/vfio/migration.c           | 54 +++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events          |  1 +
 include/hw/vfio/vfio-common.h |  1 +
 3 files changed, 56 insertions(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index c01f08b659d0..e4a89a6f9bc7 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -132,6 +132,53 @@ static void vfio_vmstate_change(void *opaque, int running, RunState state)
     }
 }
 
+static void vfio_migration_state_notifier(Notifier *notifier, void *data)
+{
+    MigrationState *s = data;
+    VFIODevice *vbasedev = container_of(notifier, VFIODevice, migration_state);
+    int ret;
+
+    trace_vfio_migration_state_notifier(vbasedev->name, s->state);
+
+    switch (s->state) {
+    case MIGRATION_STATUS_ACTIVE:
+        if (vbasedev->device_state & VFIO_DEVICE_STATE_RUNNING) {
+            if (vbasedev->vm_running) {
+                ret = vfio_migration_set_state(vbasedev,
+                          VFIO_DEVICE_STATE_RUNNING | VFIO_DEVICE_STATE_SAVING);
+                if (ret) {
+                    error_report("%s: Failed to set state RUNNING and SAVING",
+                                  vbasedev->name);
+                }
+            } else {
+                ret = vfio_migration_set_state(vbasedev,
+                                               VFIO_DEVICE_STATE_SAVING);
+                if (ret) {
+                    error_report("%s: Failed to set state STOP and SAVING",
+                                 vbasedev->name);
+                }
+            }
+        } else {
+            ret = vfio_migration_set_state(vbasedev,
+                                           VFIO_DEVICE_STATE_RESUMING);
+            if (ret) {
+                error_report("%s: Failed to set state RESUMING",
+                             vbasedev->name);
+            }
+        }
+        return;
+
+    case MIGRATION_STATUS_CANCELLING:
+    case MIGRATION_STATUS_CANCELLED:
+    case MIGRATION_STATUS_FAILED:
+        ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING);
+        if (ret) {
+            error_report("%s: Failed to set state RUNNING", vbasedev->name);
+        }
+        return;
+    }
+}
+
 static int vfio_migration_init(VFIODevice *vbasedev,
                                struct vfio_region_info *info)
 {
@@ -152,6 +199,9 @@ static int vfio_migration_init(VFIODevice *vbasedev,
     vbasedev->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
                                                           vbasedev);
 
+    vbasedev->migration_state.notify = vfio_migration_state_notifier;
+    add_migration_state_change_notifier(&vbasedev->migration_state);
+
     return 0;
 }
 
@@ -194,6 +244,10 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
         return;
     }
 
+    if (vbasedev->migration_state.notify) {
+        remove_migration_state_change_notifier(&vbasedev->migration_state);
+    }
+
     if (vbasedev->vm_state) {
         qemu_del_vm_change_state_handler(vbasedev->vm_state);
     }
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 3d15bacd031a..69503228f20e 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -148,3 +148,4 @@ vfio_display_edid_write_error(void) ""
 vfio_migration_probe(char *name, uint32_t index) " (%s) Region %d"
 vfio_migration_set_state(char *name, uint32_t state) " (%s) state %d"
 vfio_vmstate_change(char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
+vfio_migration_state_notifier(char *name, int state) " (%s) state %d"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index f6c70db3a9c1..a022484d2636 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -128,6 +128,7 @@ typedef struct VFIODevice {
     uint32_t device_state;
     VMChangeStateEntry *vm_state;
     int vm_running;
+    Notifier migration_state;
 } VFIODevice;
 
 struct VFIODeviceOps {
-- 
2.7.0


