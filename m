Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CEC30F99B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:26:17 +0100 (CET)
Received: from localhost ([::1]:37146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7iOW-0004ju-Hx
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hgd-0001TF-2t
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:40:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hgY-0004y3-2d
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:40:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612456849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6nfrvNfSCyKfA/BX2b5QmFJgrDmLnqzA9oepRR5UN3I=;
 b=ewqrRTqsIW/4W+CD2JjjpliFhsOCXWSazYhjgNiOIlMnEegcTrIzWm922HA1/+3jKCtOWL
 0y8REsvPEJaX+pV9dKMuDOw8N6e0JhS8yVYf+nNQsAAqXf77gKxAfiwvki0iDSw9jQmm0L
 ix1mMVDoQcoI8YupyAbgRxSSEFv+S04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-oZ_g8wI7OxOSVbRJ20Evpw-1; Thu, 04 Feb 2021 11:40:47 -0500
X-MC-Unique: oZ_g8wI7OxOSVbRJ20Evpw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00577804022;
 Thu,  4 Feb 2021 16:40:46 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-21.ams2.redhat.com
 [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AB421A26A;
 Thu,  4 Feb 2021 16:40:41 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com
Subject: [PULL 08/27] migration: implementation of background snapshot thread
Date: Thu,  4 Feb 2021 16:39:40 +0000
Message-Id: <20210204163959.377618-9-dgilbert@redhat.com>
In-Reply-To: <20210204163959.377618-1-dgilbert@redhat.com>
References: <20210204163959.377618-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=ham autolearn_force=no
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

From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>

Introducing implementation of 'background' snapshot thread
which in overall follows the logic of precopy migration
while internally utilizes completely different mechanism
to 'freeze' vmstate at the start of snapshot creation.

This mechanism is based on userfault_fd with wr-protection
support and is Linux-specific.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Acked-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210129101407.103458-5-andrey.gruzdev@virtuozzo.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 255 +++++++++++++++++++++++++++++++++++++++++-
 migration/migration.h |   3 +
 migration/savevm.c    |   1 -
 migration/savevm.h    |   2 +
 4 files changed, 258 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 2262f348af..ecb4115d68 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2000,6 +2000,7 @@ void migrate_init(MigrationState *s)
      * locks.
      */
     s->cleanup_bh = 0;
+    s->vm_start_bh = 0;
     s->to_dst_file = NULL;
     s->state = MIGRATION_STATUS_NONE;
     s->rp_state.from_dst_file = NULL;
@@ -3217,6 +3218,50 @@ fail:
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
@@ -3557,6 +3602,47 @@ static void migration_iteration_finish(MigrationState *s)
     qemu_mutex_unlock_iothread();
 }
 
+static void bg_migration_iteration_finish(MigrationState *s)
+{
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
+}
+
+/*
+ * Return true if continue to the next iteration directly, false
+ * otherwise.
+ */
+static MigIterateState bg_migration_iteration_run(MigrationState *s)
+{
+    int res;
+
+    res = qemu_savevm_state_iterate(s->to_dst_file, false);
+    if (res > 0) {
+        bg_migration_completion(s);
+        return MIG_ITERATE_BREAK;
+    }
+
+    return MIG_ITERATE_RESUME;
+}
+
 void migration_make_urgent_request(void)
 {
     qemu_sem_post(&migrate_get_current()->rate_limit_sem);
@@ -3704,6 +3790,165 @@ static void *migration_thread(void *opaque)
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
+    } else {
+        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
+                MIGRATION_STATUS_ACTIVE);
+    }
+    s->setup_time = qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
+
+    trace_migration_thread_setup_complete();
+    s->downtime_start = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+
+    qemu_mutex_lock_iothread();
+
+    /*
+     * If VM is currently in suspended state, then, to make a valid runstate
+     * transition in vm_stop_force_state() we need to wakeup it up.
+     */
+    qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
+    s->vm_was_running = runstate_is_running();
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
@@ -3767,8 +4012,14 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
         migrate_fd_cleanup(s);
         return;
     }
-    qemu_thread_create(&s->thread, "live_migration", migration_thread, s,
-                       QEMU_THREAD_JOINABLE);
+
+    if (migrate_background_snapshot()) {
+        qemu_thread_create(&s->thread, "bg_snapshot",
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
index d1e6aaed60..d5bf53388f 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1378,7 +1378,6 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
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
2.29.2


