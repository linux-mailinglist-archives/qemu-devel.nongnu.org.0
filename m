Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84352532346
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 08:33:26 +0200 (CEST)
Received: from localhost ([::1]:48492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntO6f-0007x0-Jk
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 02:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNt3-0007nN-Hx
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:21 -0400
Received: from mga17.intel.com ([192.55.52.151]:41972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNt1-0000GZ-Q6
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653373159; x=1684909159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4mb5xQjmgPF5412Sdh4ynXjM0cMFDDt2pd56fHCzg4U=;
 b=X8dUCAA7SBOCJdN75jEejjxeTDaisah6W2vJDfAtfkrmZAAzqutA5oMe
 /VMxaFOe1lBnlGtps4UaIGMlL3BW7ELGbN8wdBxrKr0aeh1uU4LOiG3uU
 Md5pwvl/N3qm1N12mMnO6hVDaARAwh1N1XOEjYeBWxXBuHjTQKdtgdPwR
 wqk6OBcEQ5XJmxdHyjnznlfhv1OC0Z1M+Nf0vKzFA9y1X86JAh7uofE0x
 XffjpzSciQXVuwRl3EphfSekTv7LrAtConpzDn01+iqdK+lMkj+riv5W8
 M5MBxpa3PKY23DVmtPToAwHc8NA3nyxDzafNU9kN6l7JlbZuzbpOKiyFg Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="253943190"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="253943190"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 23:19:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="601059692"
Received: from leirao-pc.bj.intel.com ([10.238.156.102])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2022 23:19:15 -0700
From: Lei Rao <lei.rao@intel.com>
To: alex.williamson@redhat.com, kevin.tian@intel.com, eddie.dong@intel.com,
 jason.zeng@intel.com, quintela@redhat.com, dgilbert@redhat.com,
 yadong.li@intel.com, yi.l.liu@intel.com
Cc: qemu-devel@nongnu.org,
	Lei Rao <lei.rao@intel.com>
Subject: [RFC PATCH 04/13] vfio/migration: Separated functions that relate to
 the In-Band approach
Date: Tue, 24 May 2022 14:18:39 +0800
Message-Id: <20220524061848.1615706-5-lei.rao@intel.com>
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

Split functions of In-Band approach from common function, to prepare for
the introduction of generic VFIO live migration layer and another Sub-Ops.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Eddie Dong <eddie.dong@intel.com>
---
 hw/vfio/migration.c | 64 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 49 insertions(+), 15 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index e61c19171a..c2df2caae6 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -394,7 +394,7 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
     return qemu_file_get_error(f);
 }
 
-static void vfio_migration_cleanup(VFIODevice *vbasedev)
+static void vfio_migration_cleanup_local(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
 
@@ -403,17 +403,17 @@ static void vfio_migration_cleanup(VFIODevice *vbasedev)
     }
 }
 
+static void vfio_migration_cleanup(VFIODevice *vbasedev)
+{
+    vfio_migration_cleanup_local(vbasedev);
+}
+
 /* ---------------------------------------------------------------------- */
 
-static int vfio_save_setup(QEMUFile *f, void *opaque)
+static int vfio_migration_save_setup_local(VFIODevice *vbasedev)
 {
-    VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
-    int ret;
-
-    trace_vfio_save_setup(vbasedev->name);
-
-    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
+    int ret = -1;
 
     if (migration->region.mmaps) {
         /*
@@ -430,6 +430,24 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
             error_report("%s: Falling back to slow path", vbasedev->name);
         }
     }
+    return ret;
+}
+
+static int vfio_save_setup(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    int ret;
+
+    trace_vfio_save_setup(vbasedev->name);
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
+
+    ret = vfio_migration_save_setup_local(vbasedev);
+    if (ret) {
+        error_report("%s: Failed to vfio lm save setup:%s",
+                     vbasedev->name, strerror(-ret));
+        return ret;
+    }
 
     ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
                                    VFIO_DEVICE_STATE_V1_SAVING);
@@ -592,11 +610,10 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
     }
 }
 
-static int vfio_load_setup(QEMUFile *f, void *opaque)
+static int vfio_migration_load_setup_local(VFIODevice *vbasedev)
 {
-    VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
-    int ret = 0;
+    int ret = -1;
 
     if (migration->region.mmaps) {
         ret = vfio_region_mmap(&migration->region);
@@ -607,14 +624,26 @@ static int vfio_load_setup(QEMUFile *f, void *opaque)
             error_report("%s: Falling back to slow path", vbasedev->name);
         }
     }
+    return ret;
+}
+
+static int vfio_load_setup(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    int ret = 0;
+
+    ret = vfio_migration_load_setup_local(vbasedev);
+    if (ret < 0) {
+        error_report("%s: Failed to migration load setup", vbasedev->name);
+        return ret;
+    }
 
     ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
                                    VFIO_DEVICE_STATE_V1_RESUMING);
     if (ret) {
         error_report("%s: Failed to set state RESUMING", vbasedev->name);
-        if (migration->region.mmaps) {
-            vfio_region_unmap(&migration->region);
-        }
+        vfio_migration_cleanup(vbasedev);
+        return ret;
     }
     return ret;
 }
@@ -777,12 +806,17 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     }
 }
 
-static void vfio_migration_exit(VFIODevice *vbasedev)
+static void vfio_migration_exit_local(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
 
     vfio_region_exit(&migration->region);
     vfio_region_finalize(&migration->region);
+}
+
+static void vfio_migration_exit(VFIODevice *vbasedev)
+{
+    vfio_migration_exit_local(vbasedev);
     g_free(vbasedev->migration);
     vbasedev->migration = NULL;
 }
-- 
2.32.0


