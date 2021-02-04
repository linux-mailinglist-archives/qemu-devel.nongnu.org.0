Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0EA30FA70
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:58:14 +0100 (CET)
Received: from localhost ([::1]:57700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7itR-0006VX-6j
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:58:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iI4-0007MG-Ln
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iHv-0005Kk-48
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z82hPCuPNywI76qXcAVHA5376rMDOnpXCV/Rkt7SE5E=;
 b=GDG2/DH5koTnzPeKSGHk+6xFEv77iFHm9xjhEcUbbya7ja3sW6e4gJr/yCDTLRLHtLAdTx
 XuJhKGiQjcznHoyPw9qbHQcp0kVBzyhq55Nlx4BRMf3x8pcwvLNUWDMSuZhjfb5Ysl2XC3
 /l/PJiQApM8cbbUR3lVpNMoGR9Epgao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-i4L7Vw6sNoq2Ks7M5mhMCg-1; Thu, 04 Feb 2021 12:19:22 -0500
X-MC-Unique: i4L7Vw6sNoq2Ks7M5mhMCg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E2C4107ACF6;
 Thu,  4 Feb 2021 17:19:21 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 691EC60CCF;
 Thu,  4 Feb 2021 17:19:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/33] migration: push Error **errp into
 qemu_loadvm_state_main()
Date: Thu,  4 Feb 2021 17:18:39 +0000
Message-Id: <20210204171907.901471-6-berrange@redhat.com>
In-Reply-To: <20210204171907.901471-1-berrange@redhat.com>
References: <20210204171907.901471-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an incremental step in converting vmstate loading code to report
via Error objects instead of printing directly to the console/monitor.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/colo.c   |  3 +-
 migration/savevm.c | 73 +++++++++++++++++++++++++++++++---------------
 migration/savevm.h |  3 +-
 3 files changed, 52 insertions(+), 27 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index e344b7cf32..4a050ac579 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -705,11 +705,10 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
 
     qemu_mutex_lock_iothread();
     cpu_synchronize_all_states();
-    ret = qemu_loadvm_state_main(mis->from_src_file, mis);
+    ret = qemu_loadvm_state_main(mis->from_src_file, mis, errp);
     qemu_mutex_unlock_iothread();
 
     if (ret < 0) {
-        error_setg(errp, "Load VM's live state (ram) error");
         return;
     }
 
diff --git a/migration/savevm.c b/migration/savevm.c
index dd41292d4e..e47aec435c 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1819,6 +1819,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
     QEMUFile *f = mis->from_src_file;
     int load_res;
     MigrationState *migr = migrate_get_current();
+    Error *local_err = NULL;
 
     object_ref(OBJECT(migr));
 
@@ -1833,7 +1834,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
      * in qemu_file, and thus we must be blocking now.
      */
     qemu_file_set_blocking(f, true);
-    load_res = qemu_loadvm_state_main(f, mis);
+    load_res = qemu_loadvm_state_main(f, mis, &local_err);
 
     /*
      * This is tricky, but, mis->from_src_file can change after it
@@ -1849,6 +1850,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
     if (load_res < 0) {
         qemu_file_set_error(f, load_res);
         dirty_bitmap_mig_cancel_incoming();
+        error_report_err(local_err);
         if (postcopy_state_get() == POSTCOPY_INCOMING_RUNNING &&
             !migrate_postcopy_ram() && migrate_dirty_bitmaps())
         {
@@ -1859,12 +1861,10 @@ static void *postcopy_ram_listen_thread(void *opaque)
                          __func__, load_res);
             load_res = 0; /* prevent further exit() */
         } else {
-            error_report("%s: loadvm failed: %d", __func__, load_res);
             migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
                                            MIGRATION_STATUS_FAILED);
         }
-    }
-    if (load_res >= 0) {
+    } else {
         /*
          * This looks good, but it's possible that the device loading in the
          * main thread hasn't finished yet, and so we might not be in 'RUN'
@@ -2116,14 +2116,17 @@ static int loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
  * @mis: Incoming state
  * @length: Length of packaged data to read
  *
- * Returns: Negative values on error
- *
+ * Returns:
+ *   0: success
+ *   LOADVM_QUIT: success, but stop
+ *   -1: error
  */
 static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis)
 {
     int ret;
     size_t length;
     QIOChannelBuffer *bioc;
+    Error *local_err = NULL;
 
     length = qemu_get_be32(mis->from_src_file);
     trace_loadvm_handle_cmd_packaged(length);
@@ -2149,8 +2152,11 @@ static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis)
 
     QEMUFile *packf = qemu_fopen_channel_input(QIO_CHANNEL(bioc));
 
-    ret = qemu_loadvm_state_main(packf, mis);
+    ret = qemu_loadvm_state_main(packf, mis, &local_err);
     trace_loadvm_handle_cmd_packaged_main(ret);
+    if (ret < 0) {
+        error_report_err(local_err);
+    }
     qemu_fclose(packf);
     object_unref(OBJECT(bioc));
 
@@ -2568,7 +2574,14 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
     return true;
 }
 
-int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis)
+/*
+ * Returns:
+ *   0: success
+ *   LOADVM_QUIT: success, but stop
+ *   -1: error
+ */
+int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis,
+                           Error **errp)
 {
     uint8_t section_type;
     int ret = 0;
@@ -2579,7 +2592,9 @@ retry:
 
         if (qemu_file_get_error(f)) {
             ret = qemu_file_get_error(f);
-            break;
+            error_setg(errp,
+                       "Failed to load device state section ID: %d", ret);
+            goto out;
         }
 
         trace_qemu_loadvm_state_section(section_type);
@@ -2588,6 +2603,9 @@ retry:
         case QEMU_VM_SECTION_FULL:
             ret = qemu_loadvm_section_start_full(f, mis);
             if (ret < 0) {
+                error_setg(errp,
+                           "Failed to load device state section start: %d",
+                           ret);
                 goto out;
             }
             break;
@@ -2595,29 +2613,38 @@ retry:
         case QEMU_VM_SECTION_END:
             ret = qemu_loadvm_section_part_end(f, mis);
             if (ret < 0) {
+                error_setg(errp,
+                           "Failed to load device state section end: %d", ret);
                 goto out;
             }
             break;
         case QEMU_VM_COMMAND:
             ret = loadvm_process_command(f);
             trace_qemu_loadvm_state_section_command(ret);
-            if ((ret < 0) || (ret == LOADVM_QUIT)) {
+            if (ret < 0) {
+                error_setg(errp,
+                           "Failed to load device state command: %d", ret);
+                goto out;
+            }
+            if (ret == LOADVM_QUIT) {
                 goto out;
             }
             break;
         case QEMU_VM_EOF:
             /* This is the end of migration */
+            ret = 0;
             goto out;
         default:
-            error_report("Unknown savevm section type %d", section_type);
-            ret = -EINVAL;
+            error_setg(errp,
+                       "Unknown savevm section type %d", section_type);
+            ret = -1;
             goto out;
         }
     }
 
 out:
     if (ret < 0) {
-        qemu_file_set_error(f, ret);
+        qemu_file_set_error(f, -EINVAL);
 
         /* Cancel bitmaps incoming regardless of recovery */
         dirty_bitmap_mig_cancel_incoming();
@@ -2643,6 +2670,12 @@ out:
     return ret;
 }
 
+/*
+ * Returns:
+ *   0: success
+ *   LOADVM_QUIT: success, but stop
+ *   -1: error
+ */
 int qemu_loadvm_state(QEMUFile *f, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
@@ -2662,17 +2695,12 @@ int qemu_loadvm_state(QEMUFile *f, Error **errp)
 
     cpu_synchronize_all_pre_loadvm();
 
-    ret = qemu_loadvm_state_main(f, mis);
-    if (ret < 0) {
-        error_setg(errp, "Error %d while loading VM state", ret);
-        ret = -1;
-    }
+    ret = qemu_loadvm_state_main(f, mis, errp);
     qemu_event_set(&mis->main_thread_load_event);
 
     trace_qemu_loadvm_state_post_main(ret);
 
     if (mis->have_listen_thread) {
-        error_setg(errp, "Error %d while loading VM state", ret);
         /* Listen thread still going, can't clean up yet */
         return ret;
     }
@@ -2729,13 +2757,10 @@ int qemu_loadvm_state(QEMUFile *f, Error **errp)
 int qemu_load_device_state(QEMUFile *f, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
-    int ret;
 
     /* Load QEMU_VM_SECTION_FULL section */
-    ret = qemu_loadvm_state_main(f, mis);
-    if (ret < 0) {
-        error_setg(errp, "Failed to load device state: %d", ret);
-        return ret;
+    if (qemu_loadvm_state_main(f, mis, errp) < 0) {
+        return -1;
     }
 
     cpu_synchronize_all_post_init();
diff --git a/migration/savevm.h b/migration/savevm.h
index c727bc103e..1cec83c729 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -62,7 +62,8 @@ int qemu_save_device_state(QEMUFile *f);
 
 int qemu_loadvm_state(QEMUFile *f, Error **errp);
 void qemu_loadvm_state_cleanup(void);
-int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
+int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis,
+                           Error **errp);
 int qemu_load_device_state(QEMUFile *f, Error **errp);
 
 #endif
-- 
2.29.2


