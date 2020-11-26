Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829662C580C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 16:24:11 +0100 (CET)
Received: from localhost ([::1]:42950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiJ7y-0001TN-J4
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 10:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiJ3b-0005it-EZ
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:19:39 -0500
Received: from relay.sw.ru ([185.231.240.75]:50026 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiJ3Z-0008UJ-Aw
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:19:39 -0500
Received: from [192.168.15.178] (helo=andrey-MS-7B54.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiJ37-00AT4g-Uy; Thu, 26 Nov 2020 18:19:09 +0300
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH v4 4/6] implementation of background snapshot thread
Date: Thu, 26 Nov 2020 18:17:32 +0300
Message-Id: <20201126151734.743849-5-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay3.sw.ru
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URG_BIZ=0.573 autolearn=no autolearn_force=no
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

Introducing implementation of 'background' snapshot thread
which in overall follows the logic of precopy migration
while internally utilizes completely different mechanism
to 'freeze' vmstate at the start of snapshot creation.

This mechanism is based on userfault_fd with wr-protection
support and is Linux-specific.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 migration/migration.c | 177 +++++++++++++++++++++++++++++++++++++++++-
 migration/migration.h |   3 +
 migration/savevm.c    |   1 -
 migration/savevm.h    |   2 +
 4 files changed, 180 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 8be3bd2b8c..c2efaf72f2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1983,6 +1983,7 @@ void migrate_init(MigrationState *s)
      * locks.
      */
     s->cleanup_bh = 0;
+    s->vm_start_bh = 0;
     s->to_dst_file = NULL;
     s->state = MIGRATION_STATUS_NONE;
     s->rp_state.from_dst_file = NULL;
@@ -3521,6 +3522,21 @@ static void migration_iteration_finish(MigrationState *s)
     qemu_mutex_unlock_iothread();
 }
 
+static void bg_migration_iteration_finish(MigrationState *s)
+{
+    /* TODO: implement */
+}
+
+/*
+ * Return true if continue to the next iteration directly, false
+ * otherwise.
+ */
+static MigIterateState bg_migration_iteration_run(MigrationState *s)
+{
+    /* TODO: implement */
+    return MIG_ITERATE_RESUME;
+}
+
 void migration_make_urgent_request(void)
 {
     qemu_sem_post(&migrate_get_current()->rate_limit_sem);
@@ -3668,6 +3684,157 @@ static void *migration_thread(void *opaque)
     return NULL;
 }
 
+static void bg_migration_vm_start_bh(void *opaque)
+{
+    MigrationState *s = opaque;
+
+    qemu_bh_delete(s->vm_start_bh);
+    s->vm_start_bh = NULL;
+
+    vm_start();
+    s->downtime = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) - s->downtime_start;
+}
+
+/**
+ * Background snapshot thread, based on live migration code.
+ * This is an alternative implementation of live migration mechanism
+ * introduced specifically to support background snapshots.
+ *
+ * It takes advantage of userfault_fd write protection mechanism introduced
+ * in v5.7 kernel. Compared to existing dirty page logging migration much
+ * lesser stream traffic is produced resulting in smaller snapshot images,
+ * simply cause of no page duplicates can get into the stream.
+ *
+ * Another key point is that generated vmstate stream reflects machine state
+ * 'frozen' at the beginning of snapshot creation compared to dirty page logging
+ * mechanism, which effectively results in that saved snapshot is the state of VM
+ * at the end of the process.
+ */
+static void *bg_migration_thread(void *opaque)
+{
+    MigrationState *s = opaque;
+    int64_t setup_start;
+    MigThrError thr_error;
+    QEMUFile *fb;
+    bool early_fail = true;
+
+    rcu_register_thread();
+    object_ref(OBJECT(s));
+
+    qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
+
+    setup_start = qemu_clock_get_ms(QEMU_CLOCK_HOST);
+    /*
+     * We want to save vmstate for the moment when migration has been
+     * initiated but also we want to save RAM content while VM is running.
+     * The RAM content should appear first in the vmstate. So, we first
+     * stash the non-RAM part of the vmstate to the temporary buffer,
+     * then write RAM part of the vmstate to the migration stream
+     * with vCPUs running and, finally, write stashed non-RAM part of
+     * the vmstate from the buffer to the migration stream.
+     */
+    s->bioc = qio_channel_buffer_new(128 * 1024);
+    qio_channel_set_name(QIO_CHANNEL(s->bioc), "vmstate-buffer");
+    fb = qemu_fopen_channel_output(QIO_CHANNEL(s->bioc));
+    object_unref(OBJECT(s->bioc));
+
+    update_iteration_initial_status(s);
+
+    qemu_savevm_state_header(s->to_dst_file);
+    qemu_savevm_state_setup(s->to_dst_file);
+
+    if (qemu_savevm_state_guest_unplug_pending()) {
+        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
+                          MIGRATION_STATUS_WAIT_UNPLUG);
+
+        while (s->state == MIGRATION_STATUS_WAIT_UNPLUG &&
+               qemu_savevm_state_guest_unplug_pending()) {
+            qemu_sem_timedwait(&s->wait_unplug_sem, 250);
+        }
+
+        migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG,
+                          MIGRATION_STATUS_ACTIVE);
+    }
+    s->setup_time = qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
+
+    migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
+                      MIGRATION_STATUS_ACTIVE);
+    trace_migration_thread_setup_complete();
+    s->downtime_start = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+
+    qemu_mutex_lock_iothread();
+
+    if (global_state_store()) {
+        goto fail;
+    }
+    /* Forcibly stop VM before saving state of vCPUs and devices */
+    if (vm_stop_force_state(RUN_STATE_PAUSED)) {
+        goto fail;
+    }
+    /*
+     * Put vCPUs in sync with shadow context structures, then
+     * save their state to channel-buffer along with devices.
+     */
+    cpu_synchronize_all_states();
+    if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
+        goto fail;
+    }
+    /* Now initialize UFFD context and start tracking RAM writes */
+    if (ram_write_tracking_start()) {
+        goto fail;
+    }
+    early_fail = false;
+
+    /*
+     * Start VM from BH handler to avoid write-fault lock here.
+     * UFFD-WP protection for the whole RAM is already enabled so
+     * calling VM state change notifiers from vm_start() would initiate
+     * writes to virtio VQs memory which is in write-protected region.
+     */
+    s->vm_start_bh = qemu_bh_new(bg_migration_vm_start_bh, s);
+    qemu_bh_schedule(s->vm_start_bh);
+
+    qemu_mutex_unlock_iothread();
+
+    while (migration_is_active(s)) {
+        MigIterateState iter_state = bg_migration_iteration_run(s);
+        if (iter_state == MIG_ITERATE_SKIP) {
+            continue;
+        } else if (iter_state == MIG_ITERATE_BREAK) {
+            break;
+        }
+
+        /*
+         * Try to detect any kind of failures, and see whether we
+         * should stop the migration now.
+         */
+        thr_error = migration_detect_error(s);
+        if (thr_error == MIG_THR_ERR_FATAL) {
+            /* Stop migration */
+            break;
+        }
+
+        migration_update_counters(s, qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
+    }
+
+    trace_migration_thread_after_loop();
+
+fail:
+    if (early_fail) {
+        migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
+                MIGRATION_STATUS_FAILED);
+        qemu_mutex_unlock_iothread();
+    }
+
+    bg_migration_iteration_finish(s);
+
+    qemu_fclose(fb);
+    object_unref(OBJECT(s));
+    rcu_unregister_thread();
+
+    return NULL;
+}
+
 void migrate_fd_connect(MigrationState *s, Error *error_in)
 {
     Error *local_err = NULL;
@@ -3731,8 +3898,14 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
         migrate_fd_cleanup(s);
         return;
     }
-    qemu_thread_create(&s->thread, "live_migration", migration_thread, s,
-                       QEMU_THREAD_JOINABLE);
+
+    if (migrate_background_snapshot()) {
+        qemu_thread_create(&s->thread, "background_snapshot",
+                bg_migration_thread, s, QEMU_THREAD_JOINABLE);
+    } else {
+        qemu_thread_create(&s->thread, "live_migration",
+                migration_thread, s, QEMU_THREAD_JOINABLE);
+    }
     s->migration_thread_running = true;
 }
 
diff --git a/migration/migration.h b/migration/migration.h
index f40338cfbf..0723955cd7 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -20,6 +20,7 @@
 #include "qemu/thread.h"
 #include "qemu/coroutine_int.h"
 #include "io/channel.h"
+#include "io/channel-buffer.h"
 #include "net/announce.h"
 #include "qom/object.h"
 
@@ -147,8 +148,10 @@ struct MigrationState {
 
     /*< public >*/
     QemuThread thread;
+    QEMUBH *vm_start_bh;
     QEMUBH *cleanup_bh;
     QEMUFile *to_dst_file;
+    QIOChannelBuffer *bioc;
     /*
      * Protects to_dst_file pointer.  We need to make sure we won't
      * yield or hang during the critical section, since this lock will
diff --git a/migration/savevm.c b/migration/savevm.c
index 5f937a2762..62d5f8a869 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1352,7 +1352,6 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
     return 0;
 }
 
-static
 int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
                                                     bool in_postcopy,
                                                     bool inactivate_disks)
diff --git a/migration/savevm.h b/migration/savevm.h
index ba64a7e271..aaee2528ed 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -64,5 +64,7 @@ int qemu_loadvm_state(QEMUFile *f);
 void qemu_loadvm_state_cleanup(void);
 int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
 int qemu_load_device_state(QEMUFile *f);
+int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
+        bool in_postcopy, bool inactivate_disks);
 
 #endif
-- 
2.25.1


