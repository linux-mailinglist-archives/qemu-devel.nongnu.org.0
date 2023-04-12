Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCC66E0126
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 23:46:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmiHL-0008MU-Jp; Wed, 12 Apr 2023 17:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmiHJ-0008Lz-CD
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:45:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmiHH-0006aM-8A
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:45:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681335918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aOAts4EQWeMp5FtVkuj19suf6clyIKQzyY2dHDTLld0=;
 b=hyZRNHuV2sS66DGiolmQpKqMA1Gcm8Ba9+i4uskURPwYqanWCNiJKqsiU1Mei5yjK1K4hl
 gjjJ9ZNDbToCRwvvIrFSgwTnMz0ioJT7KPj7xxR6mP/Eyq8QQ1c1qvwa/pr8UWk654hQ2C
 umnuw6D2XmWhtw1LxqtQ1AZh4hO/U8E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-P5J1PEOHNJ-TIp_J8ZChqQ-1; Wed, 12 Apr 2023 17:45:14 -0400
X-MC-Unique: P5J1PEOHNJ-TIp_J8ZChqQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3D271C04B77;
 Wed, 12 Apr 2023 21:45:13 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FEB71121320;
 Wed, 12 Apr 2023 21:45:12 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Juan Quintela <quintela@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PULL 2/5] migration: Fix potential race on postcopy_qemufile_src
Date: Wed, 12 Apr 2023 23:45:04 +0200
Message-Id: <20230412214507.19816-3-quintela@redhat.com>
In-Reply-To: <20230412214507.19816-1-quintela@redhat.com>
References: <20230412214507.19816-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Peter Xu <peterx@redhat.com>

postcopy_qemufile_src object should be owned by one thread, either the main
thread (e.g. when at the beginning, or at the end of migration), or by the
return path thread (when during a preempt enabled postcopy migration).  If
that's not the case the access to the object might be racy.

postcopy_preempt_shutdown_file() can be potentially racy, because it's
called at the end phase of migration on the main thread, however during
which the return path thread hasn't yet been recycled; the recycle happens
in await_return_path_close_on_source() which is after this point.

It means, logically it's posslbe the main thread and the return path thread
are both operating on the same qemufile.  While I don't think qemufile is
thread safe at all.

postcopy_preempt_shutdown_file() used to be needed because that's where we
send EOS to dest so that dest can safely shutdown the preempt thread.

To avoid the possible race, remove this only place that a race can happen.
Instead we figure out another way to safely close the preempt thread on
dest.

The core idea during postcopy on deciding "when to stop" is that dest will
send a postcopy SHUT message to src, telling src that all data is there.
Hence to shut the dest preempt thread maybe better to do it directly on
dest node.

This patch proposed such a way that we change postcopy_prio_thread_created
into PreemptThreadStatus, so that we kick the preempt thread on dest qemu
by a sequence of:

  mis->preempt_thread_status = PREEMPT_THREAD_QUIT;
  qemu_file_shutdown(mis->postcopy_qemufile_dst);

While here shutdown() is probably so far the easiest way to kick preempt
thread from a blocked qemu_get_be64().  Then it reads preempt_thread_status
to make sure it's not a network failure but a willingness to quit the
thread.

We could have avoided that extra status but just rely on migration status.
The problem is postcopy_ram_incoming_cleanup() is just called early enough
so we're still during POSTCOPY_ACTIVE no matter what.. So just make it
simple to have the status introduced.

One flag x-preempt-pre-7-2 is added to keep old pre-7.2 behaviors of
postcopy preempt.

Fixes: 9358982744 ("migration: Send requested page directly in rp-return thread")
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h    | 34 +++++++++++++++++++++++++++++++++-
 hw/core/machine.c        |  1 +
 migration/migration.c    | 10 ++++++++--
 migration/postcopy-ram.c | 20 +++++++++++++++-----
 4 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 2da2f8a164..67baba2184 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -65,6 +65,12 @@ typedef struct {
     bool all_zero;
 } PostcopyTmpPage;
 
+typedef enum {
+    PREEMPT_THREAD_NONE = 0,
+    PREEMPT_THREAD_CREATED,
+    PREEMPT_THREAD_QUIT,
+} PreemptThreadStatus;
+
 /* State for the incoming migration */
 struct MigrationIncomingState {
     QEMUFile *from_src_file;
@@ -124,7 +130,12 @@ struct MigrationIncomingState {
     QemuSemaphore postcopy_qemufile_dst_done;
     /* Postcopy priority thread is used to receive postcopy requested pages */
     QemuThread postcopy_prio_thread;
-    bool postcopy_prio_thread_created;
+    /*
+     * Always set by the main vm load thread only, but can be read by the
+     * postcopy preempt thread.  "volatile" makes sure all reads will be
+     * uptodate across cores.
+     */
+    volatile PreemptThreadStatus preempt_thread_status;
     /*
      * Used to sync between the ram load main thread and the fast ram load
      * thread.  It protects postcopy_qemufile_dst, which is the postcopy
@@ -364,6 +375,27 @@ struct MigrationState {
      * do not trigger spurious decompression errors.
      */
     bool decompress_error_check;
+    /*
+     * This variable only affects behavior when postcopy preempt mode is
+     * enabled.
+     *
+     * When set:
+     *
+     * - postcopy preempt src QEMU instance will generate an EOS message at
+     *   the end of migration to shut the preempt channel on dest side.
+     *
+     * When clear:
+     *
+     * - postcopy preempt src QEMU instance will _not_ generate an EOS
+     *   message at the end of migration, the dest qemu will shutdown the
+     *   channel itself.
+     *
+     * NOTE: See message-id <ZBoShWArKDPpX/D7@work-vm> on qemu-devel
+     * mailing list for more information on the possible race.  Everyone
+     * should probably just keep this value untouched after set by the
+     * machine type (or the default).
+     */
+    bool preempt_pre_7_2;
 
     /*
      * This decides the size of guest memory chunk that will be used
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 45e3d24fdc..cd13b8b0a3 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -42,6 +42,7 @@
 GlobalProperty hw_compat_7_2[] = {
     { "e1000e", "migrate-timadj", "off" },
     { "virtio-mem", "x-early-migration", "false" },
+    { "migration", "x-preempt-pre-7-2", "true" },
 };
 const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
 
diff --git a/migration/migration.c b/migration/migration.c
index ae2025d9d8..37fc4fb3e2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3464,8 +3464,12 @@ static void migration_completion(MigrationState *s)
         qemu_savevm_state_complete_postcopy(s->to_dst_file);
         qemu_mutex_unlock_iothread();
 
-        /* Shutdown the postcopy fast path thread */
-        if (migrate_postcopy_preempt()) {
+        /*
+         * Shutdown the postcopy fast path thread.  This is only needed
+         * when dest QEMU binary is old (7.1/7.2).  QEMU 8.0+ doesn't need
+         * this.
+         */
+        if (migrate_postcopy_preempt() && s->preempt_pre_7_2) {
             postcopy_preempt_shutdown_file(s);
         }
 
@@ -4443,6 +4447,8 @@ static Property migration_properties[] = {
                       decompress_error_check, true),
     DEFINE_PROP_UINT8("x-clear-bitmap-shift", MigrationState,
                       clear_bitmap_shift, CLEAR_BITMAP_SHIFT_DEFAULT),
+    DEFINE_PROP_BOOL("x-preempt-pre-7-2", MigrationState,
+                     preempt_pre_7_2, false),
 
     /* Migration parameters */
     DEFINE_PROP_UINT8("x-compress-level", MigrationState,
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 41c0713650..263bab75ec 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -568,9 +568,14 @@ int postcopy_ram_incoming_cleanup(MigrationIncomingState *mis)
 {
     trace_postcopy_ram_incoming_cleanup_entry();
 
-    if (mis->postcopy_prio_thread_created) {
+    if (mis->preempt_thread_status == PREEMPT_THREAD_CREATED) {
+        /* Notify the fast load thread to quit */
+        mis->preempt_thread_status = PREEMPT_THREAD_QUIT;
+        if (mis->postcopy_qemufile_dst) {
+            qemu_file_shutdown(mis->postcopy_qemufile_dst);
+        }
         qemu_thread_join(&mis->postcopy_prio_thread);
-        mis->postcopy_prio_thread_created = false;
+        mis->preempt_thread_status = PREEMPT_THREAD_NONE;
     }
 
     if (mis->have_fault_thread) {
@@ -1203,7 +1208,7 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
          */
         postcopy_thread_create(mis, &mis->postcopy_prio_thread, "fault-fast",
                                postcopy_preempt_thread, QEMU_THREAD_JOINABLE);
-        mis->postcopy_prio_thread_created = true;
+        mis->preempt_thread_status = PREEMPT_THREAD_CREATED;
     }
 
     trace_postcopy_ram_enable_notify();
@@ -1652,6 +1657,11 @@ static void postcopy_pause_ram_fast_load(MigrationIncomingState *mis)
     trace_postcopy_pause_fast_load_continued();
 }
 
+static bool preempt_thread_should_run(MigrationIncomingState *mis)
+{
+    return mis->preempt_thread_status != PREEMPT_THREAD_QUIT;
+}
+
 void *postcopy_preempt_thread(void *opaque)
 {
     MigrationIncomingState *mis = opaque;
@@ -1671,11 +1681,11 @@ void *postcopy_preempt_thread(void *opaque)
 
     /* Sending RAM_SAVE_FLAG_EOS to terminate this thread */
     qemu_mutex_lock(&mis->postcopy_prio_thread_mutex);
-    while (1) {
+    while (preempt_thread_should_run(mis)) {
         ret = ram_load_postcopy(mis->postcopy_qemufile_dst,
                                 RAM_CHANNEL_POSTCOPY);
         /* If error happened, go into recovery routine */
-        if (ret) {
+        if (ret && preempt_thread_should_run(mis)) {
             postcopy_pause_ram_fast_load(mis);
         } else {
             /* We're done */
-- 
2.39.2


