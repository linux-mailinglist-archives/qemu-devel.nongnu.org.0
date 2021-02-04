Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FE630FB22
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:22:25 +0100 (CET)
Received: from localhost ([::1]:35808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jGq-0001zZ-GM
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:22:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iId-000827-E2
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIT-0005h6-9e
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3SCajtC8S663UCFTcL7hVo0uTYE9AJdkoFj1Wbl3yA4=;
 b=Sy4oYAEbFSEuLhy5uCkw4j7cai8Arh1tJy/2ZMpOWl5wPMW8PN8pvn3u93xykVknkdmIm4
 x0VO+pJoWMppqlaEKLySHULdR3d6tk+I/LTJbE8JFhQngg5Dz0NGGHrhVvfyWGStzfnaKj
 DeO1XDgTHx+iME3N7m/oBKdEAW/14dc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246--SaQnaJNMpCKOpy_j1O2mg-1; Thu, 04 Feb 2021 12:19:57 -0500
X-MC-Unique: -SaQnaJNMpCKOpy_j1O2mg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A5F1835E39;
 Thu,  4 Feb 2021 17:19:55 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 774EF60937;
 Thu,  4 Feb 2021 17:19:54 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/33] migration: push Error **errp into
 qemu_savevm_state_setup()
Date: Thu,  4 Feb 2021 17:18:58 +0000
Message-Id: <20210204171907.901471-25-berrange@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

In doing this the callers now actually honour the failures that can
be reported instead of carrying on as if everything was normal.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/migration.c |  9 ++++++++-
 migration/savevm.c    | 18 ++++++++++++------
 migration/savevm.h    |  2 +-
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index a85d101ad8..e814d47796 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3522,6 +3522,7 @@ static void *migration_thread(void *opaque)
     int64_t setup_start = qemu_clock_get_ms(QEMU_CLOCK_HOST);
     MigThrError thr_error;
     bool urgent = false;
+    Error *local_err = NULL;
 
     rcu_register_thread();
 
@@ -3556,7 +3557,12 @@ static void *migration_thread(void *opaque)
         qemu_savevm_send_colo_enable(s->to_dst_file);
     }
 
-    qemu_savevm_state_setup(s->to_dst_file);
+    if (qemu_savevm_state_setup(s->to_dst_file, &local_err) < 0) {
+        error_report_err(local_err);
+        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
+                          MIGRATION_STATUS_FAILED);
+        goto out;
+    }
 
     if (qemu_savevm_state_guest_unplug_pending()) {
         migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
@@ -3609,6 +3615,7 @@ static void *migration_thread(void *opaque)
 
     trace_migration_thread_after_loop();
     migration_iteration_finish(s);
+ out:
     object_unref(OBJECT(s));
     rcu_unregister_thread();
     return NULL;
diff --git a/migration/savevm.c b/migration/savevm.c
index fdf8b6edfb..318ba547bc 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1159,10 +1159,9 @@ bool qemu_savevm_state_guest_unplug_pending(void)
     return false;
 }
 
-void qemu_savevm_state_setup(QEMUFile *f)
+int qemu_savevm_state_setup(QEMUFile *f, Error **errp)
 {
     SaveStateEntry *se;
-    Error *local_err = NULL;
     int ret;
 
     trace_savevm_state_setup();
@@ -1180,14 +1179,18 @@ void qemu_savevm_state_setup(QEMUFile *f)
         ret = se->ops->save_setup(f, se->opaque);
         save_section_footer(f, se);
         if (ret < 0) {
+            error_setg_errno(errp, -ret,
+                             "Failed to setup device state handler");
             qemu_file_set_error(f, ret);
-            break;
+            return -1;
         }
     }
 
-    if (precopy_notify(PRECOPY_NOTIFY_SETUP, &local_err)) {
-        error_report_err(local_err);
+    if (precopy_notify(PRECOPY_NOTIFY_SETUP, errp)) {
+        return -1;
     }
+
+    return 0;
 }
 
 int qemu_savevm_state_resume_prepare(MigrationState *s)
@@ -1537,8 +1540,11 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
 
     qemu_mutex_unlock_iothread();
     qemu_savevm_state_header(f);
-    qemu_savevm_state_setup(f);
+    ret = qemu_savevm_state_setup(f, errp);
     qemu_mutex_lock_iothread();
+    if (ret < 0) {
+        goto fail;
+    }
 
     while (1) {
         ret = qemu_savevm_state_iterate(f, false, errp);
diff --git a/migration/savevm.h b/migration/savevm.h
index e187640806..b7133655f2 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -30,7 +30,7 @@
 #define QEMU_VM_SECTION_FOOTER       0x7e
 
 bool qemu_savevm_state_blocked(Error **errp);
-void qemu_savevm_state_setup(QEMUFile *f);
+int qemu_savevm_state_setup(QEMUFile *f, Error **errp);
 bool qemu_savevm_state_guest_unplug_pending(void);
 int qemu_savevm_state_resume_prepare(MigrationState *s);
 void qemu_savevm_state_header(QEMUFile *f);
-- 
2.29.2


