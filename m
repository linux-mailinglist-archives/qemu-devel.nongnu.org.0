Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9353532347
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 08:33:35 +0200 (CEST)
Received: from localhost ([::1]:48788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntO6o-0008BO-Sj
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 02:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNtK-0008LJ-0J
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:38 -0400
Received: from mga17.intel.com ([192.55.52.151]:41983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNtI-0000HO-4N
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653373176; x=1684909176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8/TnV9NVIWyHgmix5BRtBbQKn+ZIngPWJh2/EHtAMo8=;
 b=NtXogOPG71EF9CBqEu/6jaV47498YKIenYGPkalpUV0bwTi9XrB+rPpT
 FYv6x6vqPuWsNh2NsYQTkRKAwi2c5+Bk4O9lVuecJrPRxLb0KZCBBMWeR
 ohjkjdtmJRHITp37BR+dHnNtBgw2nQVZ2K2TlJOkskbb+6j5k7Lv2bvn5
 cWUqw0LfNvhA24n3nLeWZBoT7fGPtIbDwqFmcbta/A1Z0HG/FhPdXKLWK
 vKXr5F082yG1b7EGUl06QGUlkiUpEZxpL+rdrCbFfD6MCx0Vk5K1vnpUs
 CKvKdQFrbGdsR5bqPKIqED738ba3ecx7Ekl/3M5XXOuWMUmLEXvD+Fph7 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="253943235"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="253943235"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 23:19:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="601059780"
Received: from leirao-pc.bj.intel.com ([10.238.156.102])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2022 23:19:32 -0700
From: Lei Rao <lei.rao@intel.com>
To: alex.williamson@redhat.com, kevin.tian@intel.com, eddie.dong@intel.com,
 jason.zeng@intel.com, quintela@redhat.com, dgilbert@redhat.com,
 yadong.li@intel.com, yi.l.liu@intel.com
Cc: qemu-devel@nongnu.org,
	Lei Rao <lei.rao@intel.com>
Subject: [RFC PATCH 08/13] vfio/migration: split migration handler registering
 from vfio_migration_init
Date: Tue, 24 May 2022 14:18:43 +0800
Message-Id: <20220524061848.1615706-9-lei.rao@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524061848.1615706-1-lei.rao@intel.com>
References: <20220524061848.1615706-1-lei.rao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lei.rao@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vfio_migration_init() is mainly related to initialization of In-Band approach.
Migration handler registering may also be used by other approaches. so split it
from vfio_migration_init() and move it to vfio_migration_probe().

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Eddie Dong <eddie.dong@intel.com>
---
 hw/vfio/migration.c | 56 ++++++++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 19 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index c114fab3a2..0c67ed85f3 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -882,6 +882,38 @@ static int vfio_migration_check(VFIODevice *vbasedev)
     return 0;
 }
 
+static int vfio_migration_register_handlers(VFIODevice *vbasedev)
+{
+    Object *obj;
+    char id[256] = "";
+    g_autofree char *path = NULL, *oid = NULL;
+    VFIOMigration *migration = vbasedev->migration;
+
+    obj = vbasedev->ops->vfio_get_object(vbasedev);
+    if (!obj) {
+        return -EINVAL;
+    }
+
+    oid = vmstate_if_get_id(VMSTATE_IF(DEVICE(obj)));
+    if (oid) {
+        path = g_strdup_printf("%s/vfio", oid);
+    } else {
+        path = g_strdup("vfio");
+    }
+    strpadcpy(id, sizeof(id), path, '\0');
+
+    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
+                         vbasedev);
+
+    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
+                                                           vfio_vmstate_change,
+                                                           vbasedev);
+    migration->migration_state.notify = vfio_migration_state_notifier;
+    add_migration_state_change_notifier(&migration->migration_state);
+
+    return 0;
+}
+
 static VFIOMigrationOps vfio_local_method = {
     .save_setup = vfio_migration_save_setup_local,
     .load_setup = vfio_migration_load_setup_local,
@@ -897,9 +929,7 @@ static int vfio_migration_probe_local(VFIODevice *vbasedev)
 {
     int ret;
     Object *obj;
-    char id[256] = "";
     struct vfio_region_info *info = NULL;
-    g_autofree char *path = NULL, *oid = NULL;
     VFIOMigration *migration = vbasedev->migration;
 
     obj = vbasedev->ops->vfio_get_object(vbasedev);
@@ -930,23 +960,6 @@ static int vfio_migration_probe_local(VFIODevice *vbasedev)
         goto err;
     }
 
-    oid = vmstate_if_get_id(VMSTATE_IF(DEVICE(obj)));
-    if (oid) {
-        path = g_strdup_printf("%s/vfio", oid);
-    } else {
-        path = g_strdup("vfio");
-    }
-    strpadcpy(id, sizeof(id), path, '\0');
-
-    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
-                         vbasedev);
-
-    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
-                                                           vfio_vmstate_change,
-                                                           vbasedev);
-    migration->migration_state.notify = vfio_migration_state_notifier;
-    add_migration_state_change_notifier(&migration->migration_state);
-
     trace_vfio_migration_probe_local(vbasedev->name, info->index);
     migration->ops = &vfio_local_method;
     g_free(info);
@@ -982,6 +995,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
         goto add_blocker;
     }
 
+    ret = vfio_migration_register_handlers(vbasedev);
+    if (ret) {
+        goto add_blocker;
+    }
+
     return 0;
 
 add_blocker:
-- 
2.32.0


