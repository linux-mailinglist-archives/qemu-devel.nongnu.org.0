Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F123D59C6
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:49:25 +0200 (CEST)
Received: from localhost ([::1]:43142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m802u-000067-MH
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zxf-0000Bi-UB
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:43:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zxd-0007qM-Ul
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627303437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q+LP+hPMA1owHGXjwUkB2LoCimXQUKCWKxOFN2urMxQ=;
 b=To1aCqN2izySj/gtzj0GneDvDueHur+xnxXwqgiInsUc4YwHPxS7t6k8uKSLJ5UEai5Yps
 /7z3++K4h5vXURrRWo8yHcVYm/6OHHx1BqXdxuaMUKY/zLmHgPEaXZjyqkLqlOXzTowC9R
 P5+W3Ji6w8D49nCPGnpaOYYJcSxx7Eg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-KEQ6XA1QOMCiX9vS2iI8ew-1; Mon, 26 Jul 2021 08:43:55 -0400
X-MC-Unique: KEQ6XA1QOMCiX9vS2iI8ew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE65A3639F;
 Mon, 26 Jul 2021 12:43:54 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-117.ams2.redhat.com
 [10.36.113.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6332860C4A;
 Mon, 26 Jul 2021 12:43:53 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	wei.w.wang@intel.com,
	peterx@redhat.com
Subject: [PULL 3/7] migration: Make from_dst_file accesses thread-safe
Date: Mon, 26 Jul 2021 13:43:27 +0100
Message-Id: <20210726124331.124710-4-dgilbert@redhat.com>
In-Reply-To: <20210726124331.124710-1-dgilbert@redhat.com>
References: <20210726124331.124710-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berrange@redhat.com, leobras@redhat.com, david@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Accessing from_dst_file is potentially racy in current code base like below:

  if (s->from_dst_file)
    do_something(s->from_dst_file);

Because from_dst_file can be reset right after the check in another
thread (rp_thread).  One example is migrate_fd_cancel().

Use the same qemu_file_lock to protect it too, just like to_dst_file.

When it's safe to access without lock, comment it.

There's one special reference in migration_thread() that can be replaced by
the newly introduced rp_thread_created flag.

Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Message-Id: <20210722175841.938739-3-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  with Peter's fixup
---
 migration/migration.c | 39 +++++++++++++++++++++++++++++----------
 migration/migration.h |  8 +++++---
 migration/ram.c       |  1 +
 3 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 21b94f75a3..62dbcb7d52 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1879,9 +1879,11 @@ static void migrate_fd_cancel(MigrationState *s)
     QEMUFile *f = migrate_get_current()->to_dst_file;
     trace_migrate_fd_cancel();
 
-    if (s->rp_state.from_dst_file) {
-        /* shutdown the rp socket, so causing the rp thread to shutdown */
-        qemu_file_shutdown(s->rp_state.from_dst_file);
+    WITH_QEMU_LOCK_GUARD(&s->qemu_file_lock) {
+        if (s->rp_state.from_dst_file) {
+            /* shutdown the rp socket, so causing the rp thread to shutdown */
+            qemu_file_shutdown(s->rp_state.from_dst_file);
+        }
     }
 
     do {
@@ -2686,6 +2688,23 @@ static int migrate_handle_rp_resume_ack(MigrationState *s, uint32_t value)
     return 0;
 }
 
+/* Release ms->rp_state.from_dst_file in a safe way */
+static void migration_release_from_dst_file(MigrationState *ms)
+{
+    QEMUFile *file;
+
+    WITH_QEMU_LOCK_GUARD(&ms->qemu_file_lock) {
+        /*
+         * Reset the from_dst_file pointer first before releasing it, as we
+         * can't block within lock section
+         */
+        file = ms->rp_state.from_dst_file;
+        ms->rp_state.from_dst_file = NULL;
+    }
+
+    qemu_fclose(file);
+}
+
 /*
  * Handles messages sent on the return path towards the source VM
  *
@@ -2827,11 +2846,13 @@ out:
              * Maybe there is something we can do: it looks like a
              * network down issue, and we pause for a recovery.
              */
-            qemu_fclose(rp);
-            ms->rp_state.from_dst_file = NULL;
+            migration_release_from_dst_file(ms);
             rp = NULL;
             if (postcopy_pause_return_path_thread(ms)) {
-                /* Reload rp, reset the rest */
+                /*
+                 * Reload rp, reset the rest.  Referencing it is safe since
+                 * it's reset only by us above, or when migration completes
+                 */
                 rp = ms->rp_state.from_dst_file;
                 ms->rp_state.error = false;
                 goto retry;
@@ -2843,8 +2864,7 @@ out:
     }
 
     trace_source_return_path_thread_end();
-    ms->rp_state.from_dst_file = NULL;
-    qemu_fclose(rp);
+    migration_release_from_dst_file(ms);
     rcu_unregister_thread();
     return NULL;
 }
@@ -2852,7 +2872,6 @@ out:
 static int open_return_path_on_source(MigrationState *ms,
                                       bool create_thread)
 {
-
     ms->rp_state.from_dst_file = qemu_file_get_return_path(ms->to_dst_file);
     if (!ms->rp_state.from_dst_file) {
         return -1;
@@ -3746,7 +3765,7 @@ static void *migration_thread(void *opaque)
      * If we opened the return path, we need to make sure dst has it
      * opened as well.
      */
-    if (s->rp_state.from_dst_file) {
+    if (s->rp_state.rp_thread_created) {
         /* Now tell the dest that it should open its end so it can reply */
         qemu_savevm_send_open_return_path(s->to_dst_file);
 
diff --git a/migration/migration.h b/migration/migration.h
index c302879fad..7a5aa8c2fd 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -154,12 +154,13 @@ struct MigrationState {
     QemuThread thread;
     QEMUBH *vm_start_bh;
     QEMUBH *cleanup_bh;
+    /* Protected by qemu_file_lock */
     QEMUFile *to_dst_file;
     QIOChannelBuffer *bioc;
     /*
-     * Protects to_dst_file pointer.  We need to make sure we won't
-     * yield or hang during the critical section, since this lock will
-     * be used in OOB command handler.
+     * Protects to_dst_file/from_dst_file pointers.  We need to make sure we
+     * won't yield or hang during the critical section, since this lock will be
+     * used in OOB command handler.
      */
     QemuMutex qemu_file_lock;
 
@@ -192,6 +193,7 @@ struct MigrationState {
 
     /* State related to return path */
     struct {
+        /* Protected by qemu_file_lock */
         QEMUFile     *from_dst_file;
         QemuThread    rp_thread;
         bool          error;
diff --git a/migration/ram.c b/migration/ram.c
index b5fc454b2f..f728f5072f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4012,6 +4012,7 @@ static void ram_dirty_bitmap_reload_notify(MigrationState *s)
 int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *block)
 {
     int ret = -EINVAL;
+    /* from_dst_file is always valid because we're within rp_thread */
     QEMUFile *file = s->rp_state.from_dst_file;
     unsigned long *le_bitmap, nbits = block->used_length >> TARGET_PAGE_BITS;
     uint64_t local_size = DIV_ROUND_UP(nbits, 8);
-- 
2.31.1


