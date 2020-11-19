Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BACCE2B9309
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 14:04:53 +0100 (CET)
Received: from localhost ([::1]:38038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfjcK-0002GJ-Qi
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 08:04:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfjYg-0006Cy-Ky
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 08:01:06 -0500
Received: from relay.sw.ru ([185.231.240.75]:49698 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfjYe-0000SV-JT
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 08:01:06 -0500
Received: from [192.168.15.221] (helo=andrey-MS-7B54.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfjYQ-009NTF-3Y; Thu, 19 Nov 2020 16:00:50 +0300
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH v3 6/7] the rest of write tracking migration code
Date: Thu, 19 Nov 2020 15:59:39 +0300
Message-Id: <20201119125940.20017-7-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 07:59:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 migration/migration.c | 72 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index dba388f8bd..ccb451b238 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3212,6 +3212,48 @@ fail:
                       MIGRATION_STATUS_FAILED);
 }
 
+/**
+ * wt_migration_completion: Used by wt_migration_thread when after all the
+ *   RAM has been saved. The caller 'breaks' the loop when this returns.
+ *
+ * @s: Current migration state
+ */
+static void wt_migration_completion(MigrationState *s)
+{
+    int current_active_state = s->state;
+
+    /* Stop tracking RAM writes - un-protect memory, un-register UFFD memory ranges,
+     * flush kernel wait queues and wake up threads waiting for write fault to be
+     * resolved. All of this is essentially done by closing UFFD file descriptor */
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
@@ -3554,7 +3596,26 @@ static void migration_iteration_finish(MigrationState *s)
 
 static void wt_migration_iteration_finish(MigrationState *s)
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
@@ -3563,7 +3624,14 @@ static void wt_migration_iteration_finish(MigrationState *s)
  */
 static MigIterateState wt_migration_iteration_run(MigrationState *s)
 {
-    /* TODO: implement */
+    int res;
+
+    res = qemu_savevm_state_iterate(s->to_dst_file, false);
+    if (res) {
+        wt_migration_completion(s);
+        return MIG_ITERATE_BREAK;
+    }
+
     return MIG_ITERATE_RESUME;
 }
 
-- 
2.25.1


