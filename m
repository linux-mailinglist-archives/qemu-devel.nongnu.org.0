Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B3229D110
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 17:44:52 +0100 (CET)
Received: from localhost ([::1]:48220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXoZ9-0002As-1W
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 12:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kXoUh-0005Mc-69
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 12:40:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kXoUe-0000qw-I2
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 12:40:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603903211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XE94pqoB7OjJCfXtMpOC8+9XOfDVwobB9fXwYDWxpQo=;
 b=hVEiDdnsMC8aowKlPyPPeZ+6hRfyRKxeAR2a8E5yc18UrXmw6IXc10RGZ7heeJOiqLqkXC
 25ZnjKBwWBxZqAb19VOL8+FywDQaXt2vRlMZpMMdwRW+C/4upL+W8l4zTT4KSqIDFKBL3U
 IDsbFezN0Al5psGnKklZxVZdxU/jR6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-rgGa7jo_P1eoAr_9S-gmTg-1; Wed, 28 Oct 2020 12:40:09 -0400
X-MC-Unique: rgGa7jo_P1eoAr_9S-gmTg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B2BD8EBA09;
 Wed, 28 Oct 2020 16:40:08 +0000 (UTC)
Received: from gimli.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33B545577D;
 Wed, 28 Oct 2020 16:40:05 +0000 (UTC)
Subject: [PULL v2 04/32] vfio: Add migration region initialization and
 finalize function
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Oct 2020 10:40:04 -0600
Message-ID: <160390320481.12234.17716211566677736705.stgit@gimli.home>
In-Reply-To: <160390309510.12234.8858324597971641979.stgit@gimli.home>
References: <160390309510.12234.8858324597971641979.stgit@gimli.home>
User-Agent: StGit/0.21-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:51:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Neo Jia <cjia@nvidia.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kirti Wankhede <kwankhede@nvidia.com>

Whether the VFIO device supports migration or not is decided based of
migration region query. If migration region query is successful and migration
region initialization is successful then migration is supported else
migration is blocked.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/meson.build           |    1 
 hw/vfio/migration.c           |  122 +++++++++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events          |    3 +
 include/hw/vfio/vfio-common.h |    9 +++
 4 files changed, 135 insertions(+)
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
index 000000000000..fd7faf423cdc
--- /dev/null
+++ b/hw/vfio/migration.c
@@ -0,0 +1,122 @@
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
+static void vfio_migration_exit(VFIODevice *vbasedev)
+{
+    VFIOMigration *migration = vbasedev->migration;
+
+    vfio_region_exit(&migration->region);
+    vfio_region_finalize(&migration->region);
+    g_free(vbasedev->migration);
+    vbasedev->migration = NULL;
+}
+
+static int vfio_migration_init(VFIODevice *vbasedev,
+                               struct vfio_region_info *info)
+{
+    int ret;
+    Object *obj;
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
+    vbasedev->migration = g_new0(VFIOMigration, 1);
+
+    ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
+                            info->index, "migration");
+    if (ret) {
+        error_report("%s: Failed to setup VFIO migration region %d: %s",
+                     vbasedev->name, info->index, strerror(-ret));
+        goto err;
+    }
+
+    if (!vbasedev->migration->region.size) {
+        error_report("%s: Invalid zero-sized VFIO migration region %d",
+                     vbasedev->name, info->index);
+        ret = -EINVAL;
+        goto err;
+    }
+    return 0;
+
+err:
+    vfio_migration_exit(vbasedev);
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
+    if (vbasedev->migration) {
+        vfio_migration_exit(vbasedev);
+    }
+
+    if (vbasedev->migration_blocker) {
+        migrate_del_blocker(vbasedev->migration_blocker);
+        error_free(vbasedev->migration_blocker);
+        vbasedev->migration_blocker = NULL;
+    }
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


