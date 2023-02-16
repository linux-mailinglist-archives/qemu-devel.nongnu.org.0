Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA12169A20C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:03:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnGl-00022G-AE; Thu, 16 Feb 2023 18:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSnGg-00021K-QF
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:02:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSnGf-0005ZT-1K
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:02:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676588540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVvQIawD01BlIIhR8ZPsrqhfbCF2OqctJG5kiI/xEXM=;
 b=JMH9FCMekvI6ZnSjmGeVNaIpK1iWYycUbj2yHrqMXbffWQIp1fZCht6Il9Uol9n/eFenjn
 ZS66ujL5JmhBiL793CnDL5GgFBqYDEyViwUlIsu/9SCSHgbwQA9PjZEwiFyalnd8CwBDRK
 W1dX4pRWOD0A7WOmBXa7Sh7oArQGWB8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-WImv3ZT4O6u_2exyUT6DOw-1; Thu, 16 Feb 2023 18:02:19 -0500
X-MC-Unique: WImv3ZT4O6u_2exyUT6DOw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 952F63C0F1A7;
 Thu, 16 Feb 2023 23:02:18 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 361592166B30;
 Thu, 16 Feb 2023 23:02:18 +0000 (UTC)
Subject: [PULL 05/12] vfio/migration: Block multiple devices migration
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, avihaih@nvidia.com, clg@redhat.com
Date: Thu, 16 Feb 2023 16:02:17 -0700
Message-ID: <167658853778.932837.3119890343408861820.stgit@omen>
In-Reply-To: <167658846945.932837.1420176491103357684.stgit@omen>
References: <167658846945.932837.1420176491103357684.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Avihai Horon <avihaih@nvidia.com>

Currently VFIO migration doesn't implement some kind of intermediate
quiescent state in which P2P DMAs are quiesced before stopping or
running the device. This can cause problems in multi-device migration
where the devices are doing P2P DMAs, since the devices are not stopped
together at the same time.

Until such support is added, block migration of multiple devices.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Link: https://lore.kernel.org/r/20230216143630.25610-6-avihaih@nvidia.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c              |   53 +++++++++++++++++++++++++++++++++++++++++
 hw/vfio/migration.c           |    6 +++++
 include/hw/vfio/vfio-common.h |    2 ++
 3 files changed, 61 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3a35f4afad64..fe80ccf91419 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -41,6 +41,7 @@
 #include "qapi/error.h"
 #include "migration/migration.h"
 #include "migration/misc.h"
+#include "migration/blocker.h"
 #include "sysemu/tpm.h"
 
 VFIOGroupList vfio_group_list =
@@ -337,6 +338,58 @@ bool vfio_mig_active(void)
     return true;
 }
 
+static Error *multiple_devices_migration_blocker;
+
+static unsigned int vfio_migratable_device_num(void)
+{
+    VFIOGroup *group;
+    VFIODevice *vbasedev;
+    unsigned int device_num = 0;
+
+    QLIST_FOREACH(group, &vfio_group_list, next) {
+        QLIST_FOREACH(vbasedev, &group->device_list, next) {
+            if (vbasedev->migration) {
+                device_num++;
+            }
+        }
+    }
+
+    return device_num;
+}
+
+int vfio_block_multiple_devices_migration(Error **errp)
+{
+    int ret;
+
+    if (multiple_devices_migration_blocker ||
+        vfio_migratable_device_num() <= 1) {
+        return 0;
+    }
+
+    error_setg(&multiple_devices_migration_blocker,
+               "Migration is currently not supported with multiple "
+               "VFIO devices");
+    ret = migrate_add_blocker(multiple_devices_migration_blocker, errp);
+    if (ret < 0) {
+        error_free(multiple_devices_migration_blocker);
+        multiple_devices_migration_blocker = NULL;
+    }
+
+    return ret;
+}
+
+void vfio_unblock_multiple_devices_migration(void)
+{
+    if (!multiple_devices_migration_blocker ||
+        vfio_migratable_device_num() > 1) {
+        return;
+    }
+
+    migrate_del_blocker(multiple_devices_migration_blocker);
+    error_free(multiple_devices_migration_blocker);
+    multiple_devices_migration_blocker = NULL;
+}
+
 static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
 {
     VFIOGroup *group;
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index e56eef1ee83c..8e9699966962 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -878,6 +878,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
         goto add_blocker;
     }
 
+    ret = vfio_block_multiple_devices_migration(errp);
+    if (ret) {
+        return ret;
+    }
+
     trace_vfio_migration_probe(vbasedev->name, info->index);
     g_free(info);
     return 0;
@@ -904,6 +909,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
         qemu_del_vm_change_state_handler(migration->vm_state);
         unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
         vfio_migration_exit(vbasedev);
+        vfio_unblock_multiple_devices_migration();
     }
 
     if (vbasedev->migration_blocker) {
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index e573f5a9f19f..56b168382469 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -218,6 +218,8 @@ typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
 extern VFIOGroupList vfio_group_list;
 
 bool vfio_mig_active(void);
+int vfio_block_multiple_devices_migration(Error **errp);
+void vfio_unblock_multiple_devices_migration(void);
 int64_t vfio_mig_bytes_transferred(void);
 
 #ifdef CONFIG_LINUX



