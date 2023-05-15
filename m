Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D15702E21
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:30:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXv3-00021v-Tn; Mon, 15 May 2023 09:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pyXun-0001yC-P3
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:07:03 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pyXuk-0001xf-SC
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:07:01 -0400
Received: from mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c14:750a:0:640:e46:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 0398F60094;
 Mon, 15 May 2023 16:06:54 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown
 [2a02:6b8:8f:4:7a31:c1ff:fef2:bf07])
 by mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id f6aGDc2OcCg0-bFZyLkkH; Mon, 15 May 2023 16:06:53 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1684156013; bh=eh4HIu7Bu7VzD3j2R39m4GK9mBS+eAsuXhq07/vb8CY=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=ORBv2a6yjLCvxzt40V99Mxvge4bt88HqBjd5ViY/Yks7puWYylPVepUAjcas4ZwAl
 N5WBPxzVncXcZNHZIeVvA3Rb90J/6zFEmj+HdkyctkhxJTMUuWPT50taCwWLqsXw04
 fW3prJ9gmUgc22/a9TDjyR7IXOc6O29K34atuOqw=
Authentication-Results: mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, philmd@linaro.org, thuth@redhat.com,
 berrange@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 leobras@redhat.com, peterx@redhat.com, quintela@redhat.com,
 zhanghailiang@xfusion.com, chen.zhang@intel.com, lukasstraub2@web.de,
 vsementsov@yandex-team.ru
Subject: [PATCH v5 3/3] migration: process_incoming_migration_co(): move colo
 part to colo
Date: Mon, 15 May 2023 16:06:40 +0300
Message-Id: <20230515130640.46035-4-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515130640.46035-1-vsementsov@yandex-team.ru>
References: <20230515130640.46035-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Let's make better public interface for COLO: instead of
colo_process_incoming_thread and not trivial logic around creating the
thread let's make simple colo_incoming_co(), hiding implementation from
generic code.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 include/migration/colo.h |  9 ++++++++-
 migration/colo.c         | 39 ++++++++++++++++++++++++++++++++++++++-
 migration/migration.c    | 28 ++--------------------------
 stubs/colo.c             |  6 ++----
 4 files changed, 50 insertions(+), 32 deletions(-)

diff --git a/include/migration/colo.h b/include/migration/colo.h
index 7ef315473e..eaac07f26d 100644
--- a/include/migration/colo.h
+++ b/include/migration/colo.h
@@ -28,7 +28,6 @@ bool migration_in_colo_state(void);
 int migration_incoming_enable_colo(void);
 void migration_incoming_disable_colo(void);
 bool migration_incoming_colo_enabled(void);
-void *colo_process_incoming_thread(void *opaque);
 bool migration_incoming_in_colo_state(void);
 
 COLOMode get_colo_mode(void);
@@ -44,5 +43,13 @@ void colo_do_failover(void);
  */
 void colo_checkpoint_delay_set(void);
 
+/*
+ * Starts COLO incoming process. Called from process_incoming_migration_co()
+ * after loading the state.
+ *
+ * Called with BQL locked, may temporary release BQL.
+ */
+int coroutine_fn colo_incoming_co(void);
+
 void colo_shutdown(void);
 #endif
diff --git a/migration/colo.c b/migration/colo.c
index a688ac553a..72f4f7b37e 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -817,7 +817,7 @@ void colo_shutdown(void)
     }
 }
 
-void *colo_process_incoming_thread(void *opaque)
+static void *colo_process_incoming_thread(void *opaque)
 {
     MigrationIncomingState *mis = opaque;
     QEMUFile *fb = NULL;
@@ -918,3 +918,40 @@ out:
     rcu_unregister_thread();
     return NULL;
 }
+
+int coroutine_fn colo_incoming_co(void)
+{
+    MigrationIncomingState *mis = migration_incoming_get_current();
+    Error *local_err = NULL;
+    QemuThread th;
+
+    assert(qemu_mutex_iothread_locked());
+
+    if (!migration_incoming_colo_enabled()) {
+        return 0;
+    }
+
+    /* Make sure all file formats throw away their mutable metadata */
+    bdrv_activate_all(&local_err);
+    if (local_err) {
+        error_report_err(local_err);
+        return -EINVAL;
+    }
+
+    qemu_thread_create(&th, "COLO incoming", colo_process_incoming_thread,
+                       mis, QEMU_THREAD_JOINABLE);
+
+    mis->colo_incoming_co = qemu_coroutine_self();
+    qemu_coroutine_yield();
+    mis->colo_incoming_co = NULL;
+
+    qemu_mutex_unlock_iothread();
+    /* Wait checkpoint incoming thread exit before free resource */
+    qemu_thread_join(&th);
+    qemu_mutex_lock_iothread();
+
+    /* We hold the global iothread lock, so it is safe here */
+    colo_release_ram_cache();
+
+    return 0;
+}
diff --git a/migration/migration.c b/migration/migration.c
index e66b06d3ec..9d1896d6af 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -511,7 +511,6 @@ process_incoming_migration_co(void *opaque)
     MigrationIncomingState *mis = migration_incoming_get_current();
     PostcopyState ps;
     int ret;
-    Error *local_err = NULL;
 
     assert(mis->from_src_file);
 
@@ -555,37 +554,14 @@ process_incoming_migration_co(void *opaque)
         goto fail;
     }
 
-    /* we get COLO info, and know if we are in COLO mode */
-    if (migration_incoming_colo_enabled()) {
-        QemuThread colo_incoming_thread;
-
-        /* Make sure all file formats throw away their mutable metadata */
-        bdrv_activate_all(&local_err);
-        if (local_err) {
-            error_report_err(local_err);
-            goto fail;
-        }
-
-        qemu_thread_create(&colo_incoming_thread, "COLO incoming",
-             colo_process_incoming_thread, mis, QEMU_THREAD_JOINABLE);
-
-        mis->colo_incoming_co = qemu_coroutine_self();
-        qemu_coroutine_yield();
-        mis->colo_incoming_co = NULL;
-
-        qemu_mutex_unlock_iothread();
-        /* Wait checkpoint incoming thread exit before free resource */
-        qemu_thread_join(&colo_incoming_thread);
-        qemu_mutex_lock_iothread();
-        /* We hold the global iothread lock, so it is safe here */
-        colo_release_ram_cache();
+    if (colo_incoming_co() < 0) {
+        goto fail;
     }
 
     mis->bh = qemu_bh_new(process_incoming_migration_bh, mis);
     qemu_bh_schedule(mis->bh);
     return;
 fail:
-    local_err = NULL;
     migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
                       MIGRATION_STATUS_FAILED);
     qemu_fclose(mis->from_src_file);
diff --git a/stubs/colo.c b/stubs/colo.c
index cf9816d368..f33379d0fd 100644
--- a/stubs/colo.c
+++ b/stubs/colo.c
@@ -10,11 +10,9 @@ void colo_shutdown(void)
 {
 }
 
-void *colo_process_incoming_thread(void *opaque)
+int coroutine_fn colo_incoming_co(void)
 {
-    error_report("Impossible happend: trying to start COLO thread when COLO "
-                 "module is not built in");
-    abort();
+    return 0;
 }
 
 void colo_checkpoint_delay_set(void)
-- 
2.34.1


