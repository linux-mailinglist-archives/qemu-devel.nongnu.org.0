Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DD9532350
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 08:37:44 +0200 (CEST)
Received: from localhost ([::1]:51652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntOAp-0002BX-P2
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 02:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNtC-00084r-Kz
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:30 -0400
Received: from mga17.intel.com ([192.55.52.151]:41983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNtA-0000HO-8s
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653373168; x=1684909168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yFksj+5b6JElUXpSeZB4v3E5u0VKDCgdJjHfiu8AXMQ=;
 b=gneoSlny8W14l7ApHF2/AdFGeQ1QT2lIQaCWPf3iTEL8cjMndb0Dl720
 dasEQGrLoDXIEZ0odWv0GguwJvp8UL5sczVI4651us+hOP2b6UnShll1P
 zHggGUTkCMEDtUwQ0E4rClrrHnHrz3N0BbGYl3RQwdFiL3hKI0OcNw6Ad
 08xipmx1Y4RHZ9lhM9vSLjamm6yS5z1QatGEeq2uV7v395plyMu1mNabB
 W37dR8L+BI8IdZgIW68o0kIrVo/lQI8QLt1ImUspkjxmwglAVIEI+7au6
 LIF8PVjHAUpOLbY4aMUdJI0KAIX96iNgoFCALv0nNt0lIMD/6LlJaKMnk Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="253943203"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="253943203"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 23:19:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="601059733"
Received: from leirao-pc.bj.intel.com ([10.238.156.102])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2022 23:19:23 -0700
From: Lei Rao <lei.rao@intel.com>
To: alex.williamson@redhat.com, kevin.tian@intel.com, eddie.dong@intel.com,
 jason.zeng@intel.com, quintela@redhat.com, dgilbert@redhat.com,
 yadong.li@intel.com, yi.l.liu@intel.com
Cc: qemu-devel@nongnu.org,
	Lei Rao <lei.rao@intel.com>
Subject: [RFC PATCH 06/13] vfio/migration: introduce VFIOMigrationOps layer in
 VFIO live migration framework
Date: Tue, 24 May 2022 14:18:41 +0800
Message-Id: <20220524061848.1615706-7-lei.rao@intel.com>
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

Add an abstraction layer, VFIOMigrationOps, to the VFIO live migration
framework. Also adapt the In-Band approach to this abstraction layer by defining
its own VFIOMigrationOps callbacks.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Eddie Dong <eddie.dong@intel.com>
---
 hw/vfio/migration.c           | 203 +++++++++++++++++++++-------------
 include/hw/vfio/vfio-common.h |  14 +++
 2 files changed, 142 insertions(+), 75 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 04360e1f17..4736af90e7 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -407,7 +407,11 @@ static void vfio_migration_cleanup_local(VFIODevice *vbasedev)
 
 static void vfio_migration_cleanup(VFIODevice *vbasedev)
 {
-    vfio_migration_cleanup_local(vbasedev);
+    VFIOMigration *migration = vbasedev->migration;
+
+    if (migration->ops->cleanup) {
+        migration->ops->cleanup(vbasedev);
+    }
 }
 
 /* ---------------------------------------------------------------------- */
@@ -438,24 +442,29 @@ static int vfio_migration_save_setup_local(VFIODevice *vbasedev)
 static int vfio_save_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
     int ret;
 
     trace_vfio_save_setup(vbasedev->name);
 
     qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
 
-    ret = vfio_migration_save_setup_local(vbasedev);
-    if (ret) {
-        error_report("%s: Failed to vfio lm save setup:%s",
-                     vbasedev->name, strerror(-ret));
-        return ret;
+    if (migration->ops->save_setup) {
+        ret = migration->ops->save_setup(vbasedev);
+        if (ret) {
+            error_report("%s: Failed to vfio lm save setup:%s",
+                         vbasedev->name, strerror(-ret));
+            return ret;
+        }
     }
 
-    ret = vfio_migration_set_state_local(vbasedev, VFIO_DEVICE_STATE_MASK,
-                                         VFIO_DEVICE_STATE_V1_SAVING);
-    if (ret) {
-        error_report("%s: Failed to set state SAVING", vbasedev->name);
-        return ret;
+    if (migration->ops->set_state) {
+        ret = migration->ops->set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
+                                        VFIO_DEVICE_STATE_V1_SAVING);
+        if (ret) {
+            error_report("%s: Failed to set state SAVING", vbasedev->name);
+            return ret;
+        }
     }
 
     qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
@@ -486,9 +495,11 @@ static void vfio_save_pending(QEMUFile *f, void *opaque,
     VFIOMigration *migration = vbasedev->migration;
     int ret;
 
-    ret = vfio_migration_update_pending_local(vbasedev);
-    if (ret) {
-        return;
+    if (migration->ops->update_pending) {
+        ret = migration->ops->update_pending(vbasedev);
+        if (ret) {
+            return;
+        }
     }
 
     *res_precopy_only += migration->pending_bytes;
@@ -507,9 +518,11 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
     qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
 
     if (migration->pending_bytes == 0) {
-        ret = vfio_migration_update_pending_local(vbasedev);
-        if (ret) {
-            return ret;
+        if (migration->ops->update_pending) {
+            ret = migration->ops->update_pending(vbasedev);
+            if (ret) {
+                return ret;
+            }
         }
 
         if (migration->pending_bytes == 0) {
@@ -520,11 +533,13 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
         }
     }
 
-    ret = vfio_migration_save_buffer_local(f, vbasedev, &data_size);
-    if (ret) {
-        error_report("%s: vfio_miragion_save_buffer_local failed %s",
-                     vbasedev->name, strerror(errno));
-        return ret;
+    if (migration->ops->save_buffer) {
+        ret = migration->ops->save_buffer(f, vbasedev, &data_size);
+        if (ret) {
+            error_report("%s: vfio_miragion_save_buffer_local failed %s",
+                         vbasedev->name, strerror(errno));
+            return ret;
+        }
     }
 
     qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
@@ -551,35 +566,43 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
     uint64_t data_size;
     int ret;
 
-    ret = vfio_migration_set_state_local(vbasedev,
-                                         ~VFIO_DEVICE_STATE_V1_RUNNING,
-                                         VFIO_DEVICE_STATE_V1_SAVING);
-    if (ret) {
-        error_report("%s: Failed to set state STOP and SAVING",
-                     vbasedev->name);
-        return ret;
+    if (migration->ops->set_state) {
+        ret = migration->ops->set_state(vbasedev,
+                                        ~VFIO_DEVICE_STATE_V1_RUNNING,
+                                        VFIO_DEVICE_STATE_V1_SAVING);
+        if (ret) {
+            error_report("%s: Failed to set state STOP and SAVING",
+                         vbasedev->name);
+            return ret;
+        }
     }
 
-    ret = vfio_migration_update_pending_local(vbasedev);
-    if (ret) {
-        return ret;
+    if (migration->ops->update_pending) {
+        ret = migration->ops->update_pending(vbasedev);
+        if (ret) {
+            return ret;
+        }
     }
 
     while (migration->pending_bytes > 0) {
         qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
-        ret = vfio_migration_save_buffer_local(f, vbasedev, &data_size);
-        if (ret < 0) {
-            error_report("%s: Failed to save buffer", vbasedev->name);
-            return ret;
+        if (migration->ops->save_buffer) {
+            ret = migration->ops->save_buffer(f, vbasedev, &data_size);
+            if (ret < 0) {
+                error_report("%s: Failed to save buffer", vbasedev->name);
+                return ret;
+            }
         }
 
         if (data_size == 0) {
             break;
         }
 
-        ret = vfio_migration_update_pending_local(vbasedev);
-        if (ret) {
-            return ret;
+        if (migration->ops->update_pending) {
+            ret = migration->ops->update_pending(vbasedev);
+            if (ret) {
+                return ret;
+            }
         }
     }
 
@@ -590,11 +613,13 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = vfio_migration_set_state_local(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING,
-                                         0);
-    if (ret) {
-        error_report("%s: Failed to set state STOPPED", vbasedev->name);
-        return ret;
+    if (migration->ops->set_state) {
+        ret = migration->ops->set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING,
+                                        0);
+        if (ret) {
+            error_report("%s: Failed to set state STOPPED", vbasedev->name);
+            return ret;
+        }
     }
 
     trace_vfio_save_complete_precopy(vbasedev->name);
@@ -634,20 +659,25 @@ static int vfio_migration_load_setup_local(VFIODevice *vbasedev)
 static int vfio_load_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
     int ret = 0;
 
-    ret = vfio_migration_load_setup_local(vbasedev);
-    if (ret < 0) {
-        error_report("%s: Failed to migration load setup", vbasedev->name);
-        return ret;
+    if (migration->ops->load_setup) {
+        ret = migration->ops->load_setup(vbasedev);
+        if (ret < 0) {
+            error_report("%s: Failed to migration load setup", vbasedev->name);
+            return ret;
+        }
     }
 
-    ret = vfio_migration_set_state_local(vbasedev, ~VFIO_DEVICE_STATE_MASK,
-                                   VFIO_DEVICE_STATE_V1_RESUMING);
-    if (ret) {
-        error_report("%s: Failed to set state RESUMING", vbasedev->name);
-        vfio_migration_cleanup(vbasedev);
-        return ret;
+    if (migration->ops->set_state) {
+        ret = migration->ops->set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
+                                        VFIO_DEVICE_STATE_V1_RESUMING);
+        if (ret) {
+            error_report("%s: Failed to set state RESUMING", vbasedev->name);
+            vfio_migration_cleanup(vbasedev);
+            return ret;
+        }
     }
     return ret;
 }
@@ -692,11 +722,14 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
         case VFIO_MIG_FLAG_DEV_DATA_STATE:
         {
             uint64_t data_size = qemu_get_be64(f);
+            VFIOMigration *migration = vbasedev->migration;
 
             if (data_size) {
-                ret = vfio_migration_load_buffer_local(f, vbasedev, data_size);
-                if (ret < 0) {
-                    return ret;
+                if (migration->ops->load_buffer) {
+                    ret = migration->ops->load_buffer(f, vbasedev, data_size);
+                    if (ret < 0) {
+                        return ret;
+                    }
                 }
             }
             break;
@@ -736,7 +769,7 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
     uint32_t value, mask;
     int ret;
 
-    if (vbasedev->migration->vm_running == running) {
+    if (migration->vm_running == running) {
         return;
     }
 
@@ -769,17 +802,19 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
         }
     }
 
-    ret = vfio_migration_set_state_local(vbasedev, mask, value);
-    if (ret) {
-        /*
-         * Migration should be aborted in this case, but vm_state_notify()
-         * currently does not support reporting failures.
-         */
-        error_report("%s: Failed to set device state 0x%x", vbasedev->name,
-                     (migration->device_state & mask) | value);
-        qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
+    if (migration->ops->set_state) {
+        ret = migration->ops->set_state(vbasedev, mask, value);
+        if (ret) {
+            /*
+             * Migration should be aborted in this case, but vm_state_notify()
+             * currently does not support reporting failures.
+             */
+            error_report("%s: Failed to set device state 0x%x", vbasedev->name,
+                         (migration->device_state & mask) | value);
+            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
+        }
     }
-    vbasedev->migration->vm_running = running;
+    migration->vm_running = running;
     trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
             (migration->device_state & mask) | value);
 }
@@ -800,12 +835,14 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     case MIGRATION_STATUS_CANCELLED:
     case MIGRATION_STATUS_FAILED:
         bytes_transferred = 0;
-        ret = vfio_migration_set_state_local(vbasedev,
-                                             ~(VFIO_DEVICE_STATE_V1_SAVING |
-                                             VFIO_DEVICE_STATE_V1_RESUMING),
-                                             VFIO_DEVICE_STATE_V1_RUNNING);
-        if (ret) {
-            error_report("%s: Failed to set state RUNNING", vbasedev->name);
+        if (migration->ops->set_state) {
+            ret = migration->ops->set_state(vbasedev,
+                                            ~(VFIO_DEVICE_STATE_V1_SAVING |
+                                            VFIO_DEVICE_STATE_V1_RESUMING),
+                                            VFIO_DEVICE_STATE_V1_RUNNING);
+            if (ret) {
+                error_report("%s: Failed to set state RUNNING", vbasedev->name);
+            }
         }
     }
 }
@@ -820,7 +857,11 @@ static void vfio_migration_exit_local(VFIODevice *vbasedev)
 
 static void vfio_migration_exit(VFIODevice *vbasedev)
 {
-    vfio_migration_exit_local(vbasedev);
+    VFIOMigration *migration = vbasedev->migration;
+
+    if (migration->ops->exit) {
+        migration->ops->exit(vbasedev);
+    }
     g_free(vbasedev->migration);
     vbasedev->migration = NULL;
 }
@@ -840,6 +881,17 @@ static int vfio_migration_check(VFIODevice *vbasedev)
     return 0;
 }
 
+static VFIOMigrationOps vfio_local_method = {
+    .save_setup = vfio_migration_save_setup_local,
+    .load_setup = vfio_migration_load_setup_local,
+    .update_pending = vfio_migration_update_pending_local,
+    .save_buffer = vfio_migration_save_buffer_local,
+    .load_buffer = vfio_migration_load_buffer_local,
+    .set_state = vfio_migration_set_state_local,
+    .cleanup = vfio_migration_cleanup_local,
+    .exit = vfio_migration_exit_local,
+};
+
 static int vfio_migration_probe_local(VFIODevice *vbasedev)
 {
     int ret;
@@ -895,6 +947,7 @@ static int vfio_migration_probe_local(VFIODevice *vbasedev)
     add_migration_state_change_notifier(&migration->migration_state);
 
     trace_vfio_migration_probe_local(vbasedev->name, info->index);
+    migration->ops = &vfio_local_method;
     g_free(info);
     return 0;
 
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index e573f5a9f1..8ef85a871c 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -58,10 +58,13 @@ typedef struct VFIORegion {
     uint8_t nr; /* cache the region number for debug */
 } VFIORegion;
 
+typedef struct VFIOMigrationOps VFIOMigrationOps;
+
 typedef struct VFIOMigration {
     struct VFIODevice *vbasedev;
     VMChangeStateEntry *vm_state;
     VFIORegion region;
+    VFIOMigrationOps *ops;
     uint32_t device_state;
     int vm_running;
     Notifier migration_state;
@@ -154,6 +157,17 @@ struct VFIODeviceOps {
     int (*vfio_load_config)(VFIODevice *vdev, QEMUFile *f);
 };
 
+typedef struct VFIOMigrationOps {
+    int (*save_setup)(VFIODevice *vbasedev);
+    int (*load_setup)(VFIODevice *vbasedev);
+    int (*update_pending)(VFIODevice *vbasedev);
+    int (*save_buffer)(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size);
+    int (*load_buffer)(QEMUFile *f, VFIODevice *vbasedev, uint64_t data_size);
+    int (*set_state)(VFIODevice *vbasedev, uint32_t mask, uint32_t value);
+    void (*cleanup)(VFIODevice *vbasedev);
+    void (*exit)(VFIODevice *vbasedev);
+} VFIOMigrationOps;
+
 typedef struct VFIOGroup {
     int fd;
     int groupid;
-- 
2.32.0


