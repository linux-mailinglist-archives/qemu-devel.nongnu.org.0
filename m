Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC261C4A78
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 01:40:05 +0200 (CEST)
Received: from localhost ([::1]:57142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVkgu-0003hM-7Z
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 19:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jVkNN-0002hA-EZ
 for qemu-devel@nongnu.org; Mon, 04 May 2020 19:19:53 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:19394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jVkNM-0008Mq-8U
 for qemu-devel@nongnu.org; Mon, 04 May 2020 19:19:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eb0a2d10000>; Mon, 04 May 2020 16:18:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 04 May 2020 16:19:50 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 04 May 2020 16:19:50 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May
 2020 23:19:50 +0000
Received: from kwankhede-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 4 May 2020 23:19:43 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH v18 QEMU 13/18] vfio: Add function to start and stop dirty
 pages tracking
Date: Tue, 5 May 2020 04:14:48 +0530
Message-ID: <1588632293-18932-14-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1588632293-18932-1-git-send-email-kwankhede@nvidia.com>
References: <1588632293-18932-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1588634321; bh=mpCFDKPu3PUsGQB8KmANUw7/xTSHSBYWKWqxh94MjYQ=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=P5r6jcY2Bno2qeUnk4QmDGJ1FRrxvLygtbC/cMwnv149PxIOs8AvU5cBaEJwi9U8M
 dLfTrbadRiYH9yPaTF6+bcDpVjFggI5IvazIoCQXvbkUSfnkGAFDIxfnCe45V1dLhe
 w+j+v9EwPMlNpcp0GcM1Gs2UhoUIrySA3mKqkNYGrn3qtM7vqjlXLxvQxH2+egasCE
 18sphf+3pcNZ16heXWyKQiJUPJHkREp0OgRIzqdee0gRkfj6jItIX3YeIKyaKcDTHg
 NI+2TkY6wz+f08wwHAHHfELGy2LWKCI6O8kWN0KrXIS9TRR+mc+D/VkPvrOrt8uqUL
 8F+yJgTzKpPbA==
Received-SPF: pass client-ip=216.228.121.64; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate25.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 19:18:33
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

Call VFIO_IOMMU_DIRTY_PAGES ioctl to start and stop dirty pages tracking
for VFIO devices.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
---
 hw/vfio/migration.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 3d11d212b1ce..7d1f64a96676 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
+#include <sys/ioctl.h>
 #include <linux/vfio.h>
 
 #include "sysemu/runstate.h"
@@ -297,6 +298,32 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
     return qemu_file_get_error(f);
 }
 
+static int vfio_start_dirty_page_tracking(VFIODevice *vbasedev, bool start)
+{
+    int ret;
+    VFIOContainer *container = vbasedev->group->container;
+    struct vfio_iommu_type1_dirty_bitmap dirty = {
+        .argsz = sizeof(dirty),
+    };
+
+    if (start) {
+        if (vbasedev->device_state & VFIO_DEVICE_STATE_SAVING) {
+            dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
+        } else {
+            return -EINVAL;
+        }
+    } else {
+            dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
+    }
+
+    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
+    if (ret) {
+        error_report("Failed to set dirty tracking flag 0x%x errno: %d",
+                     dirty.flags, errno);
+    }
+    return ret;
+}
+
 /* ---------------------------------------------------------------------- */
 
 static int vfio_save_setup(QEMUFile *f, void *opaque)
@@ -333,6 +360,11 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
      */
     qemu_put_be64(f, migration->region.size);
 
+    ret = vfio_start_dirty_page_tracking(vbasedev, true);
+    if (ret) {
+        return ret;
+    }
+
     qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
 
     ret = qemu_file_get_error(f);
@@ -348,6 +380,8 @@ static void vfio_save_cleanup(void *opaque)
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
 
+    vfio_start_dirty_page_tracking(vbasedev, false);
+
     if (migration->region.mmaps) {
         vfio_region_unmap(&migration->region);
     }
@@ -682,6 +716,8 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
         if (ret) {
             error_report("%s: Failed to set state RUNNING", vbasedev->name);
         }
+
+        vfio_start_dirty_page_tracking(vbasedev, false);
     }
 }
 
-- 
2.7.0


