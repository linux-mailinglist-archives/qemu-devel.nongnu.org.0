Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB3430FAE5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:13:52 +0100 (CET)
Received: from localhost ([::1]:37700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7j8Z-0005ii-QZ
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iI2-0007HD-VR
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iHp-0005Ib-Fy
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ICTjmTIp4/9iz8NS7/XDDwyC855gnPc7jJgUvonyEI=;
 b=QM6bd/mqBxm/jfgDRqy95dFPvwxo4DFL1X7uxypGjHndrgpkImb30/p3xXyHp4aUcV5oiH
 0TDvbMNxxez2Aix6QuHuSzKestjMkVUZrMRGUAXDVNezsWx1MbeIO3NJ+yhRY5l1p+dxqx
 DlLHSQE8RUuZflIJ9+XeuLr3ZCT1Ka4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-3dPm2e_QOhySIEQCmfnOXg-1; Thu, 04 Feb 2021 12:19:16 -0500
X-MC-Unique: 3dPm2e_QOhySIEQCmfnOXg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7B1C80197B;
 Thu,  4 Feb 2021 17:19:15 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C580660CCF;
 Thu,  4 Feb 2021 17:19:09 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/33] migration: push Error **errp into qemu_loadvm_state()
Date: Thu,  4 Feb 2021 17:18:35 +0000
Message-Id: <20210204171907.901471-2-berrange@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 migration/migration.c |  4 ++--
 migration/savevm.c    | 36 ++++++++++++++++++++----------------
 migration/savevm.h    |  2 +-
 3 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 1986cb8573..287a18d269 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -519,7 +519,7 @@ static void process_incoming_migration_co(void *opaque)
     postcopy_state_set(POSTCOPY_INCOMING_NONE);
     migrate_set_state(&mis->state, MIGRATION_STATUS_NONE,
                       MIGRATION_STATUS_ACTIVE);
-    ret = qemu_loadvm_state(mis->from_src_file);
+    ret = qemu_loadvm_state(mis->from_src_file, &local_err);
 
     ps = postcopy_state_get();
     trace_process_incoming_migration_co_end(ret, ps);
@@ -563,7 +563,7 @@ static void process_incoming_migration_co(void *opaque)
     }
 
     if (ret < 0) {
-        error_report("load of migration failed: %s", strerror(-ret));
+        error_report_err(local_err);
         goto fail;
     }
     mis->bh = qemu_bh_new(process_incoming_migration_bh, mis);
diff --git a/migration/savevm.c b/migration/savevm.c
index 6b320423c7..c8d93eee1e 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2638,40 +2638,49 @@ out:
     return ret;
 }
 
-int qemu_loadvm_state(QEMUFile *f)
+int qemu_loadvm_state(QEMUFile *f, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
-    Error *local_err = NULL;
     int ret;
 
-    if (qemu_savevm_state_blocked(&local_err)) {
-        error_report_err(local_err);
-        return -EINVAL;
+    if (qemu_savevm_state_blocked(errp)) {
+        return -1;
     }
 
     ret = qemu_loadvm_state_header(f);
     if (ret) {
-        return ret;
+        error_setg(errp, "Error %d while loading VM state", ret);
+        return -1;
     }
 
     if (qemu_loadvm_state_setup(f) != 0) {
-        return -EINVAL;
+        error_setg(errp, "Error %d while loading VM state", -EINVAL);
+        return -1;
     }
 
     cpu_synchronize_all_pre_loadvm();
 
     ret = qemu_loadvm_state_main(f, mis);
+    if (ret < 0) {
+        error_setg(errp, "Error %d while loading VM state", ret);
+        ret = -1;
+    }
     qemu_event_set(&mis->main_thread_load_event);
 
     trace_qemu_loadvm_state_post_main(ret);
 
     if (mis->have_listen_thread) {
+        error_setg(errp, "Error %d while loading VM state", ret);
         /* Listen thread still going, can't clean up yet */
         return ret;
     }
 
     if (ret == 0) {
         ret = qemu_file_get_error(f);
+        if (ret < 0) {
+            error_setg(errp, "Error %d while loading VM state", ret);
+            ret = -1;
+        }
     }
 
     /*
@@ -2690,8 +2699,8 @@ int qemu_loadvm_state(QEMUFile *f)
         uint8_t  section_type = qemu_get_byte(f);
 
         if (section_type != QEMU_VM_VMDESCRIPTION) {
-            error_report("Expected vmdescription section, but got %d",
-                         section_type);
+            error_setg(errp, "Expected vmdescription section, but got %d",
+                       section_type);
             /*
              * It doesn't seem worth failing at this point since
              * we apparently have an otherwise valid VM state
@@ -2921,7 +2930,6 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
 {
     QEMUFile *f;
     QIOChannelFile *ioc;
-    int ret;
 
     /* Guest must be paused before loading the device state; the RAM state
      * will already have been loaded by xc
@@ -2940,11 +2948,8 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
     f = qemu_fopen_channel_input(QIO_CHANNEL(ioc));
     object_unref(OBJECT(ioc));
 
-    ret = qemu_loadvm_state(f);
+    qemu_loadvm_state(f, errp);
     qemu_fclose(f);
-    if (ret < 0) {
-        error_setg(errp, QERR_IO_ERROR);
-    }
     migration_incoming_state_destroy();
 }
 
@@ -3018,14 +3023,13 @@ bool load_snapshot(const char *name, const char *vmstate,
         goto err_drain;
     }
     aio_context_acquire(aio_context);
-    ret = qemu_loadvm_state(f);
+    ret = qemu_loadvm_state(f, errp);
     migration_incoming_state_destroy();
     aio_context_release(aio_context);
 
     bdrv_drain_all_end();
 
     if (ret < 0) {
-        error_setg(errp, "Error %d while loading VM state", ret);
         return false;
     }
 
diff --git a/migration/savevm.h b/migration/savevm.h
index ba64a7e271..1069e2dd4f 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -60,7 +60,7 @@ void qemu_savevm_send_colo_enable(QEMUFile *f);
 void qemu_savevm_live_state(QEMUFile *f);
 int qemu_save_device_state(QEMUFile *f);
 
-int qemu_loadvm_state(QEMUFile *f);
+int qemu_loadvm_state(QEMUFile *f, Error **errp);
 void qemu_loadvm_state_cleanup(void);
 int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
 int qemu_load_device_state(QEMUFile *f);
-- 
2.29.2


