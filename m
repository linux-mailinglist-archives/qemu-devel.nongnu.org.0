Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B58430FADF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:11:49 +0100 (CET)
Received: from localhost ([::1]:60970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7j6a-0003bE-9l
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIb-00080Y-1A
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIO-0005gE-Ky
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8WYJ3HZdayK/AJ9gA6TonVUP3nIEkbEYBNgFqG7V72k=;
 b=NoP3HqukbAPzIn48jnqKCskiKmSDKgWSLgPevdijJATcok1KwEZ66fLW5K1E6L/epgT+6P
 8mLKaJrWqB8xB3MPIFEIVA7EIL74ngemHuZdpilAagr6xgC/0Xx1AN2B2jyu/IXFMBEad4
 xq3t9hVreNjlXv4AjEjQ4ivg+OAmcWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-CTirUH6HNjCOpGJLrtDHbA-1; Thu, 04 Feb 2021 12:19:53 -0500
X-MC-Unique: CTirUH6HNjCOpGJLrtDHbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADF4B100C660;
 Thu,  4 Feb 2021 17:19:52 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 881CD60CFA;
 Thu,  4 Feb 2021 17:19:51 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/33] migration: push Error **errp into
 qemu_savevm_state_iterate()
Date: Thu,  4 Feb 2021 17:18:56 +0000
Message-Id: <20210204171907.901471-23-berrange@redhat.com>
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
 migration/migration.c |  8 +++++++-
 migration/savevm.c    | 47 ++++++++++++++++++++++++++-----------------
 migration/savevm.h    |  2 +-
 3 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 395a1b10f5..a85d101ad8 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3393,6 +3393,8 @@ static MigIterateState migration_iteration_run(MigrationState *s)
                           pend_pre, pend_compat, pend_post);
 
     if (pending_size && pending_size >= s->threshold_size) {
+        int ret;
+        Error *local_err = NULL;
         /* Still a significant amount to transfer */
         if (!in_postcopy && pend_pre <= s->threshold_size &&
             qatomic_read(&s->start_postcopy)) {
@@ -3402,7 +3404,11 @@ static MigIterateState migration_iteration_run(MigrationState *s)
             return MIG_ITERATE_SKIP;
         }
         /* Just another iteration step */
-        qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
+        ret = qemu_savevm_state_iterate(s->to_dst_file, in_postcopy,
+                                        &local_err);
+        if (ret < 0) {
+            error_report_err(local_err);
+        }
     } else {
         trace_migration_thread_low_pending(pending_size);
         migration_completion(s);
diff --git a/migration/savevm.c b/migration/savevm.c
index 6a7b930b1c..23e4d5a1a2 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1220,8 +1220,9 @@ int qemu_savevm_state_resume_prepare(MigrationState *s)
  *   negative: there was one error, and we have -errno.
  *   0 : We haven't finished, caller have to go again
  *   1 : We have finished, we can go to complete phase
+ *  -1 : error reported, go to cleanup phase
  */
-int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy)
+int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy, Error **errp)
 {
     SaveStateEntry *se;
     int ret = 1;
@@ -1261,11 +1262,13 @@ int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy)
         save_section_footer(f, se);
 
         if (ret < 0) {
-            error_report("failed to save SaveStateEntry with id(name): %d(%s)",
-                         se->section_id, se->idstr);
+            error_setg(errp,
+                       "failed to save SaveStateEntry with id(name): %d(%s)",
+                       se->section_id, se->idstr);
             qemu_file_set_error(f, ret);
+            return -1;
         }
-        if (ret <= 0) {
+        if (ret == 0) {
             /* Do not proceed to the next vmstate before this one reported
                completion of the current stage. This serializes the migration
                and reduces the probability that a faster changing state is
@@ -1517,7 +1520,6 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
 {
     int ret;
     MigrationState *ms = migrate_get_current();
-    MigrationStatus status;
 
     if (migration_is_running(ms->state)) {
         error_setg(errp, QERR_MIGRATION_ACTIVE);
@@ -1538,34 +1540,43 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
     qemu_savevm_state_setup(f);
     qemu_mutex_lock_iothread();
 
-    while (qemu_file_get_error(f) == 0) {
-        if (qemu_savevm_state_iterate(f, false) > 0) {
+    while (1) {
+        ret = qemu_savevm_state_iterate(f, false, errp);
+        if (ret < 0) {
+            goto fail;
+        }
+        if (ret > 0) {
             break;
         }
+        ret = qemu_file_get_error(f);
+        if (ret != 0) {
+            error_setg_errno(errp, -ret, "Error while writing VM state");
+            goto fail;
+        }
     }
 
+    qemu_savevm_state_complete_precopy(f, false, false);
     ret = qemu_file_get_error(f);
-    if (ret == 0) {
-        qemu_savevm_state_complete_precopy(f, false, false);
-        ret = qemu_file_get_error(f);
-    }
-    qemu_savevm_state_cleanup();
     if (ret != 0) {
         error_setg_errno(errp, -ret, "Error while writing VM state");
+        goto fail;
     }
 
-    if (ret != 0) {
-        status = MIGRATION_STATUS_FAILED;
-    } else {
-        status = MIGRATION_STATUS_COMPLETED;
-    }
-    migrate_set_state(&ms->state, MIGRATION_STATUS_SETUP, status);
+    qemu_savevm_state_cleanup();
+    migrate_set_state(&ms->state, MIGRATION_STATUS_SETUP,
+                      MIGRATION_STATUS_COMPLETED);
 
     /* f is outer parameter, it should not stay in global migration state after
      * this function finished */
     ms->to_dst_file = NULL;
 
     return ret;
+
+ fail:
+    qemu_savevm_state_cleanup();
+    migrate_set_state(&ms->state, MIGRATION_STATUS_SETUP,
+                      MIGRATION_STATUS_FAILED);
+    return -1;
 }
 
 void qemu_savevm_live_state(QEMUFile *f)
diff --git a/migration/savevm.h b/migration/savevm.h
index 1cec83c729..e187640806 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -34,7 +34,7 @@ void qemu_savevm_state_setup(QEMUFile *f);
 bool qemu_savevm_state_guest_unplug_pending(void);
 int qemu_savevm_state_resume_prepare(MigrationState *s);
 void qemu_savevm_state_header(QEMUFile *f);
-int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy);
+int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy, Error **errp);
 void qemu_savevm_state_cleanup(void);
 void qemu_savevm_state_complete_postcopy(QEMUFile *f);
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
-- 
2.29.2


