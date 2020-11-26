Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BA52C5810
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 16:25:35 +0100 (CET)
Received: from localhost ([::1]:47568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiJ9K-0003Ob-7U
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 10:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiJ46-0005y2-Tp
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:20:12 -0500
Received: from relay.sw.ru ([185.231.240.75]:50168 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiJ40-00009x-CJ
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:20:10 -0500
Received: from [192.168.15.178] (helo=andrey-MS-7B54.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiJ3V-00AT4g-NF; Thu, 26 Nov 2020 18:19:33 +0300
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH v4 5/6] the rest of write tracking migration code
Date: Thu, 26 Nov 2020 18:17:33 +0300
Message-Id: <20201126151734.743849-6-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay3.sw.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
From: Andrey Gruzdev via <qemu-devel@nongnu.org>

Implementation of bg_migration- iteration/completion/finish.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 migration/migration.c | 74 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index c2efaf72f2..ef1522761c 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3182,6 +3182,50 @@ fail:
                       MIGRATION_STATUS_FAILED);
 }
 
+/**
+ * bg_migration_completion: Used by bg_migration_thread when after all the
+ *   RAM has been saved. The caller 'breaks' the loop when this returns.
+ *
+ * @s: Current migration state
+ */
+static void bg_migration_completion(MigrationState *s)
+{
+    int current_active_state = s->state;
+
+    /*
+     * Stop tracking RAM writes - un-protect memory, un-register UFFD
+     * memory ranges, flush kernel wait queues and wake up threads
+     * waiting for write fault to be resolved.
+     */
+    ram_write_tracking_stop();
+
+    if (s->state == MIGRATION_STATUS_ACTIVE) {
+        /*
+         * By this moment we have RAM content saved into the migration stream.
+         * The next step is to flush the non-RAM content (device state)
+         * right after the ram content. The device state has been stored into
+         * the temporary buffer before RAM saving started.
+         */
+        qemu_put_buffer(s->to_dst_file, s->bioc->data, s->bioc->usage);
+        qemu_fflush(s->to_dst_file);
+    } else if (s->state == MIGRATION_STATUS_CANCELLING) {
+        goto fail;
+    }
+
+    if (qemu_file_get_error(s->to_dst_file)) {
+        trace_migration_completion_file_err();
+        goto fail;
+    }
+
+    migrate_set_state(&s->state, current_active_state,
+                      MIGRATION_STATUS_COMPLETED);
+    return;
+
+fail:
+    migrate_set_state(&s->state, current_active_state,
+                      MIGRATION_STATUS_FAILED);
+}
+
 bool migrate_colo_enabled(void)
 {
     MigrationState *s = migrate_get_current();
@@ -3524,7 +3568,26 @@ static void migration_iteration_finish(MigrationState *s)
 
 static void bg_migration_iteration_finish(MigrationState *s)
 {
-    /* TODO: implement */
+    qemu_mutex_lock_iothread();
+    switch (s->state) {
+    case MIGRATION_STATUS_COMPLETED:
+        migration_calculate_complete(s);
+        break;
+
+    case MIGRATION_STATUS_ACTIVE:
+    case MIGRATION_STATUS_FAILED:
+    case MIGRATION_STATUS_CANCELLED:
+    case MIGRATION_STATUS_CANCELLING:
+        break;
+
+    default:
+        /* Should not reach here, but if so, forgive the VM. */
+        error_report("%s: Unknown ending state %d", __func__, s->state);
+        break;
+    }
+
+    migrate_fd_cleanup_schedule(s);
+    qemu_mutex_unlock_iothread();
 }
 
 /*
@@ -3533,7 +3596,14 @@ static void bg_migration_iteration_finish(MigrationState *s)
  */
 static MigIterateState bg_migration_iteration_run(MigrationState *s)
 {
-    /* TODO: implement */
+    int res;
+
+    res = qemu_savevm_state_iterate(s->to_dst_file, false);
+    if (res > 0) {
+        bg_migration_completion(s);
+        return MIG_ITERATE_BREAK;
+    }
+
     return MIG_ITERATE_RESUME;
 }
 
-- 
2.25.1


