Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CDA3D1729
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 21:37:35 +0200 (CEST)
Received: from localhost ([::1]:46896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6I2A-00065O-Vo
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 15:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6Hz2-0000iO-W7
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 15:34:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6Hz0-000528-NP
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 15:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626896058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JY/hBnyyaXIQ1Hc7JqYuUGXeJi6bgQg0sNKHhut1eJs=;
 b=c1tXbjOuxbPIQ+jpxsfVlhqoYRe2L0AzxRLirLnEP3aRqgsXvzxmGdFv8vHmCMceDrh9UA
 Po3lbDSKFPJJO5Ts22pej36BX0OWotoKkjo+Ph6g2kYK8hljO7N/n+rtfZ/3BejdvJMvgI
 wHgnjd6VMnRjEvtYhVA7yOyUeH83yEg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-gbKTX51gMM-bZMOCn3-54g-1; Wed, 21 Jul 2021 15:34:17 -0400
X-MC-Unique: gbKTX51gMM-bZMOCn3-54g-1
Received: by mail-qv1-f72.google.com with SMTP id
 x18-20020ad440d20000b02902e121b2b364so2239010qvp.12
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 12:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JY/hBnyyaXIQ1Hc7JqYuUGXeJi6bgQg0sNKHhut1eJs=;
 b=Kq7vXzymaqvomOnJQBRTP7b9qUlyG8lvWRlrKTBH9W+NzNUAzrBDqMdV2tPEhYB/Le
 2apqU1ntz2bjBqq2Lsvq7GUrP+ll25rG/+OUKBx9Q4GmMx7sZ8GL7WIYwM9WDpawBGNZ
 ICm0NKw+ZOQ5O1xFMMbdMi67EzukWel3HrZ6XotsOGZkdEJKJTBWkAO6WK4vWPpAiD06
 PBY4hvdscpKOK5RHfoRLuBPTExzj2TyFDCjmppknRob1TvDlDQwtk8Px/I5qU6c4BDD8
 DZEm5ua81zkW7+BkdPvapGrJi5O9UEhCQ6olykbGfi4Uc9zvmXvoH3tSkPxCEg6ErX1h
 vNvA==
X-Gm-Message-State: AOAM533+HFOHjps1n4sv0YL6D9a1V27qv0K/Z8fsp3bF4bSjkwDh5gYe
 uXlf6K4mmxPEAMp9BUZqe/qT9KtTU1NCx+/Mm9rBvHK1wM/57FLGtkpc1gx7Y+BLhHIrKnqCRGw
 p1Dhq9rn9zaQvzhCKyITAHespi1iqGJhjalh3FR1FmKPNPKmaRW39PDx6MzyC1jfW
X-Received: by 2002:ac8:4a19:: with SMTP id x25mr32834306qtq.389.1626896056385; 
 Wed, 21 Jul 2021 12:34:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoewZfJIwBXYm+fAx7PCXKDTu1C9EmASd2dJ3aBVi9f/huaPFR4J/bbdlHtNZaX/dy8xpWQA==
X-Received: by 2002:ac8:4a19:: with SMTP id x25mr32834275qtq.389.1626896056065; 
 Wed, 21 Jul 2021 12:34:16 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id 8sm10755867qkb.105.2021.07.21.12.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 12:34:15 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] migration: Make from_dst_file accesses thread-safe
Date: Wed, 21 Jul 2021 15:34:06 -0400
Message-Id: <20210721193409.910462-3-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721193409.910462-1-peterx@redhat.com>
References: <20210721193409.910462-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 32 +++++++++++++++++++++++++-------
 migration/migration.h |  8 +++++---
 migration/ram.c       |  1 +
 3 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 21b94f75a3..fa70400f98 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1879,10 +1879,12 @@ static void migrate_fd_cancel(MigrationState *s)
     QEMUFile *f = migrate_get_current()->to_dst_file;
     trace_migrate_fd_cancel();
 
+    qemu_mutex_lock(&s->qemu_file_lock);
     if (s->rp_state.from_dst_file) {
         /* shutdown the rp socket, so causing the rp thread to shutdown */
         qemu_file_shutdown(s->rp_state.from_dst_file);
     }
+    qemu_mutex_unlock(&s->qemu_file_lock);
 
     do {
         old_state = s->state;
@@ -2686,6 +2688,22 @@ static int migrate_handle_rp_resume_ack(MigrationState *s, uint32_t value)
     return 0;
 }
 
+/* Release ms->rp_state.from_dst_file in a safe way */
+static void migration_release_from_dst_file(MigrationState *ms)
+{
+    QEMUFile *file = ms->rp_state.from_dst_file;
+
+    qemu_mutex_lock(&ms->qemu_file_lock);
+    /*
+     * Reset the from_dst_file pointer first before releasing it, as we can't
+     * block within lock section
+     */
+    ms->rp_state.from_dst_file = NULL;
+    qemu_mutex_unlock(&ms->qemu_file_lock);
+
+    qemu_fclose(file);
+}
+
 /*
  * Handles messages sent on the return path towards the source VM
  *
@@ -2827,11 +2845,13 @@ out:
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
+                 * Reload rp, reset the rest.  Referencing it is save since
+                 * it's reset only by us above, or when migration completes
+                 */
                 rp = ms->rp_state.from_dst_file;
                 ms->rp_state.error = false;
                 goto retry;
@@ -2843,8 +2863,7 @@ out:
     }
 
     trace_source_return_path_thread_end();
-    ms->rp_state.from_dst_file = NULL;
-    qemu_fclose(rp);
+    migration_release_from_dst_file(ms);
     rcu_unregister_thread();
     return NULL;
 }
@@ -2852,7 +2871,6 @@ out:
 static int open_return_path_on_source(MigrationState *ms,
                                       bool create_thread)
 {
-
     ms->rp_state.from_dst_file = qemu_file_get_return_path(ms->to_dst_file);
     if (!ms->rp_state.from_dst_file) {
         return -1;
@@ -3746,7 +3764,7 @@ static void *migration_thread(void *opaque)
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


