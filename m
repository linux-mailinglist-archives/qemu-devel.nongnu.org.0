Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A147295DCF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 13:56:02 +0200 (CEST)
Received: from localhost ([::1]:43460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVZCL-0003QM-33
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 07:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kVZ2R-0001Cb-48
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 07:45:47 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kVZ23-0007EZ-4L
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 07:45:46 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f9170a20000>; Thu, 22 Oct 2020 04:44:34 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 22 Oct
 2020 11:45:12 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 22 Oct 2020 11:45:04 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH v27 04/17] vfio: Add migration region initialization and
 finalize function
Date: Thu, 22 Oct 2020 16:41:54 +0530
Message-ID: <1603365127-14202-5-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1603365127-14202-1-git-send-email-kwankhede@nvidia.com>
References: <1603365127-14202-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603367074; bh=v88C8L0J8GRNF+wNu6rxflgaGw1Tqv+Qq/yoYHVsdWM=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:X-NVConfidentiality:MIME-Version:Content-Type;
 b=QjrN+34NJd1HyckYkHKJocoawawmwU8tPyjjUNd0OfyFkeCHmjw1xbFZAblmd9K56
 SbrbpWZiE3Bo760f2x4AIEvV0HHguxiwZefsQWKbaSsMGT8+Bdp7oaOM+gqYlKEZ+P
 k5Betmdb+dR+XRnYOR35JKImcgvgQG/ViwOOVONpmxZQRrN+bibrCRwj9gV04euxtN
 fvADC/7Qhok0GdnL+7Se5yfbrq0KrIRPzAW2Op63UNkeeAC9XYDPuUk9SbP89h4FZ5
 1g08xRdUZqkHVwmLXbqre0gmsaqK/ExcaMI0OfAd4IR8XwSrc65yex3GrUqmC7gL70
 ulv1FtR69cKSg==
Received-SPF: pass client-ip=216.228.121.64; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate25.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 07:44:53
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
Cc: cohuck@redhat.com, zhi.wang.linux@gmail.com, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com,
 Kirti Wankhede <kwankhede@nvidia.com>, eauger@redhat.com, yi.l.liu@intel.com,
 quintela@redhat.com, ziye.yang@intel.com, armbru@redhat.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, felipe@nutanix.com,
 zhi.a.wang@intel.com, mcrossley@nvidia.com, kevin.tian@intel.com,
 yan.y.zhao@intel.com, dgilbert@redhat.com, changpeng.liu@intel.com,
 eskultet@redhat.com, Ken.Xue@amd.com, jonathan.davies@nutanix.com,
 pbonzini@redhat.com, dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Whether the VFIO device supports migration or not is decided based of
migration region query. If migration region query is successful and migration
region initialization is successful then migration is supported else
migration is blocked.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/vfio/meson.build           |   1 +
 hw/vfio/migration.c           | 129 ++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events          |   3 +
 include/hw/vfio/vfio-common.h |   9 +++
 4 files changed, 142 insertions(+)
 create mode 100644 hw/vfio/migration.c

diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
index 37efa74018bc..da9af297a0c5 100644
--- a/hw/vfio/meson.build
+++ b/hw/vfio/meson.build
@@ -2,6 +2,7 @@ vfio_ss = ss.source_set()
 vfio_ss.add(files(
   'common.c',
   'spapr.c',
+  'migration.c',
 ))
 vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
   'display.c',
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
new file mode 100644
index 000000000000..5f74a3ad1d72
--- /dev/null
+++ b/hw/vfio/migration.c
@@ -0,0 +1,129 @@
+/*
+ * Migration support for VFIO devices
+ *
+ * Copyright NVIDIA, Inc. 2020
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <linux/vfio.h>
+
+#include "hw/vfio/vfio-common.h"
+#include "cpu.h"
+#include "migration/migration.h"
+#include "migration/qemu-file.h"
+#include "migration/register.h"
+#include "migration/blocker.h"
+#include "migration/misc.h"
+#include "qapi/error.h"
+#include "exec/ramlist.h"
+#include "exec/ram_addr.h"
+#include "pci.h"
+#include "trace.h"
+
+static void vfio_migration_region_exit(VFIODevice *vbasedev)
+{
+    VFIOMigration *migration = vbasedev->migration;
+
+    if (!migration) {
+        return;
+    }
+
+    if (migration->region.size) {
+        vfio_region_exit(&migration->region);
+        vfio_region_finalize(&migration->region);
+    }
+}
+
+static int vfio_migration_init(VFIODevice *vbasedev,
+                               struct vfio_region_info *info)
+{
+    int ret;
+    Object *obj;
+    VFIOMigration *migration;
+
+    if (!vbasedev->ops->vfio_get_object) {
+        return -EINVAL;
+    }
+
+    obj = vbasedev->ops->vfio_get_object(vbasedev);
+    if (!obj) {
+        return -EINVAL;
+    }
+
+    migration = g_new0(VFIOMigration, 1);
+
+    ret = vfio_region_setup(obj, vbasedev, &migration->region,
+                            info->index, "migration");
+    if (ret) {
+        error_report("%s: Failed to setup VFIO migration region %d: %s",
+                     vbasedev->name, info->index, strerror(-ret));
+        goto err;
+    }
+
+    if (!migration->region.size) {
+        error_report("%s: Invalid zero-sized of VFIO migration region %d",
+                     vbasedev->name, info->index);
+        ret = -EINVAL;
+        goto err;
+    }
+
+    vbasedev->migration = migration;
+    return 0;
+
+err:
+    vfio_migration_region_exit(vbasedev);
+    g_free(migration);
+    return ret;
+}
+
+/* ---------------------------------------------------------------------- */
+
+int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
+{
+    struct vfio_region_info *info = NULL;
+    Error *local_err = NULL;
+    int ret;
+
+    ret = vfio_get_dev_region_info(vbasedev, VFIO_REGION_TYPE_MIGRATION,
+                                   VFIO_REGION_SUBTYPE_MIGRATION, &info);
+    if (ret) {
+        goto add_blocker;
+    }
+
+    ret = vfio_migration_init(vbasedev, info);
+    if (ret) {
+        goto add_blocker;
+    }
+
+    g_free(info);
+    trace_vfio_migration_probe(vbasedev->name, info->index);
+    return 0;
+
+add_blocker:
+    error_setg(&vbasedev->migration_blocker,
+               "VFIO device doesn't support migration");
+    g_free(info);
+
+    ret = migrate_add_blocker(vbasedev->migration_blocker, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        error_free(vbasedev->migration_blocker);
+        vbasedev->migration_blocker = NULL;
+    }
+    return ret;
+}
+
+void vfio_migration_finalize(VFIODevice *vbasedev)
+{
+    if (vbasedev->migration_blocker) {
+        migrate_del_blocker(vbasedev->migration_blocker);
+        error_free(vbasedev->migration_blocker);
+        vbasedev->migration_blocker = NULL;
+    }
+
+    vfio_migration_region_exit(vbasedev);
+    g_free(vbasedev->migration);
+}
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index a0c7b49a2ebc..9ced5ec6277c 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -145,3 +145,6 @@ vfio_display_edid_link_up(void) ""
 vfio_display_edid_link_down(void) ""
 vfio_display_edid_update(uint32_t prefx, uint32_t prefy) "%ux%u"
 vfio_display_edid_write_error(void) ""
+
+# migration.c
+vfio_migration_probe(const char *name, uint32_t index) " (%s) Region %d"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index ba6169cd926e..8275c4c68f45 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -57,6 +57,10 @@ typedef struct VFIORegion {
     uint8_t nr; /* cache the region number for debug */
 } VFIORegion;
 
+typedef struct VFIOMigration {
+    VFIORegion region;
+} VFIOMigration;
+
 typedef struct VFIOAddressSpace {
     AddressSpace *as;
     QLIST_HEAD(, VFIOContainer) containers;
@@ -113,6 +117,8 @@ typedef struct VFIODevice {
     unsigned int num_irqs;
     unsigned int num_regions;
     unsigned int flags;
+    VFIOMigration *migration;
+    Error *migration_blocker;
 } VFIODevice;
 
 struct VFIODeviceOps {
@@ -204,4 +210,7 @@ int vfio_spapr_create_window(VFIOContainer *container,
 int vfio_spapr_remove_window(VFIOContainer *container,
                              hwaddr offset_within_address_space);
 
+int vfio_migration_probe(VFIODevice *vbasedev, Error **errp);
+void vfio_migration_finalize(VFIODevice *vbasedev);
+
 #endif /* HW_VFIO_VFIO_COMMON_H */
-- 
2.7.0


