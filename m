Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A52EE6298EE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 13:32:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouupO-0005g4-9p; Tue, 15 Nov 2022 07:14:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouupH-0005QR-0u
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:14:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouupF-0004pV-4S
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668514440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+CMx7bhHy1RPM7Isd3Dgm8HDohp+a70XZsFhHXa7dk=;
 b=hk7/JWQpcL+eXGWPJkxZvGtDFS2WbMcJB2F/mCC2z9FjMELJvsk5LUlKZBmUBcZza8hOIu
 R1Of5BcBztzP+qCv8x1KecF/PleFcB/4RCsCxW1wJGvO73XZSynH305cTrcJMYb9b69u9K
 7Oe63YL+UTfB3fvF33YcUWlSMuje9Ig=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-IiAgsP_nOOmbJJHJNl6t1Q-1; Tue, 15 Nov 2022 07:13:58 -0500
X-MC-Unique: IiAgsP_nOOmbJJHJNl6t1Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE659185A78F;
 Tue, 15 Nov 2022 12:13:57 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 554B5492B05;
 Tue, 15 Nov 2022 12:13:55 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: [PATCH 27/30] migration: Send requested page directly in rp-return
 thread
Date: Tue, 15 Nov 2022 13:12:23 +0100
Message-Id: <20221115121226.26609-28-quintela@redhat.com>
In-Reply-To: <20221115121226.26609-1-quintela@redhat.com>
References: <20221115121226.26609-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URG_BIZ=0.573 autolearn=no autolearn_force=no
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

With all the facilities ready, send the requested page directly in the
rp-return thread rather than queuing it in the request queue, if and only
if postcopy preempt is enabled.  It can achieve so because it uses separate
channel for sending urgent pages.  The only shared data is bitmap and it's
protected by the bitmap_mutex.

Note that since we're moving the ownership of the urgent channel from the
migration thread to rp thread it also means the rp thread is responsible
for managing the qemufile, e.g. properly close it when pausing migration
happens.  For this, let migration_release_from_dst_file to cover shutdown
of the urgent channel too, renaming it as migration_release_dst_files() to
better show what it does.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c |  35 +++++++------
 migration/ram.c       | 112 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 131 insertions(+), 16 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 1f95877fb4..42f36c1e2c 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2868,8 +2868,11 @@ static int migrate_handle_rp_resume_ack(MigrationState *s, uint32_t value)
     return 0;
 }
 
-/* Release ms->rp_state.from_dst_file in a safe way */
-static void migration_release_from_dst_file(MigrationState *ms)
+/*
+ * Release ms->rp_state.from_dst_file (and postcopy_qemufile_src if
+ * existed) in a safe way.
+ */
+static void migration_release_dst_files(MigrationState *ms)
 {
     QEMUFile *file;
 
@@ -2882,6 +2885,18 @@ static void migration_release_from_dst_file(MigrationState *ms)
         ms->rp_state.from_dst_file = NULL;
     }
 
+    /*
+     * Do the same to postcopy fast path socket too if there is.  No
+     * locking needed because this qemufile should only be managed by
+     * return path thread.
+     */
+    if (ms->postcopy_qemufile_src) {
+        migration_ioc_unregister_yank_from_file(ms->postcopy_qemufile_src);
+        qemu_file_shutdown(ms->postcopy_qemufile_src);
+        qemu_fclose(ms->postcopy_qemufile_src);
+        ms->postcopy_qemufile_src = NULL;
+    }
+
     qemu_fclose(file);
 }
 
@@ -3026,7 +3041,7 @@ out:
              * Maybe there is something we can do: it looks like a
              * network down issue, and we pause for a recovery.
              */
-            migration_release_from_dst_file(ms);
+            migration_release_dst_files(ms);
             rp = NULL;
             if (postcopy_pause_return_path_thread(ms)) {
                 /*
@@ -3044,7 +3059,7 @@ out:
     }
 
     trace_source_return_path_thread_end();
-    migration_release_from_dst_file(ms);
+    migration_release_dst_files(ms);
     rcu_unregister_thread();
     return NULL;
 }
@@ -3567,18 +3582,6 @@ static MigThrError postcopy_pause(MigrationState *s)
         qemu_file_shutdown(file);
         qemu_fclose(file);
 
-        /*
-         * Do the same to postcopy fast path socket too if there is.  No
-         * locking needed because no racer as long as we do this before setting
-         * status to paused.
-         */
-        if (s->postcopy_qemufile_src) {
-            migration_ioc_unregister_yank_from_file(s->postcopy_qemufile_src);
-            qemu_file_shutdown(s->postcopy_qemufile_src);
-            qemu_fclose(s->postcopy_qemufile_src);
-            s->postcopy_qemufile_src = NULL;
-        }
-
         migrate_set_state(&s->state, s->state,
                           MIGRATION_STATUS_POSTCOPY_PAUSED);
 
diff --git a/migration/ram.c b/migration/ram.c
index dbdde5a6a5..5dc221a2fc 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -574,6 +574,8 @@ static QemuThread *decompress_threads;
 static QemuMutex decomp_done_lock;
 static QemuCond decomp_done_cond;
 
+static int ram_save_host_page_urgent(PageSearchStatus *pss);
+
 static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
                                  ram_addr_t offset, uint8_t *source_buf);
 
@@ -588,6 +590,16 @@ static void pss_init(PageSearchStatus *pss, RAMBlock *rb, ram_addr_t page)
     pss->complete_round = false;
 }
 
+/*
+ * Check whether two PSSs are actively sending the same page.  Return true
+ * if it is, false otherwise.
+ */
+static bool pss_overlap(PageSearchStatus *pss1, PageSearchStatus *pss2)
+{
+    return pss1->host_page_sending && pss2->host_page_sending &&
+        (pss1->host_page_start == pss2->host_page_start);
+}
+
 static void *do_data_compress(void *opaque)
 {
     CompressParam *param = opaque;
@@ -2288,6 +2300,57 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
         return -1;
     }
 
+    /*
+     * When with postcopy preempt, we send back the page directly in the
+     * rp-return thread.
+     */
+    if (postcopy_preempt_active()) {
+        ram_addr_t page_start = start >> TARGET_PAGE_BITS;
+        size_t page_size = qemu_ram_pagesize(ramblock);
+        PageSearchStatus *pss = &ram_state->pss[RAM_CHANNEL_POSTCOPY];
+        int ret = 0;
+
+        qemu_mutex_lock(&rs->bitmap_mutex);
+
+        pss_init(pss, ramblock, page_start);
+        /*
+         * Always use the preempt channel, and make sure it's there.  It's
+         * safe to access without lock, because when rp-thread is running
+         * we should be the only one who operates on the qemufile
+         */
+        pss->pss_channel = migrate_get_current()->postcopy_qemufile_src;
+        pss->postcopy_requested = true;
+        assert(pss->pss_channel);
+
+        /*
+         * It must be either one or multiple of host page size.  Just
+         * assert; if something wrong we're mostly split brain anyway.
+         */
+        assert(len % page_size == 0);
+        while (len) {
+            if (ram_save_host_page_urgent(pss)) {
+                error_report("%s: ram_save_host_page_urgent() failed: "
+                             "ramblock=%s, start_addr=0x"RAM_ADDR_FMT,
+                             __func__, ramblock->idstr, start);
+                ret = -1;
+                break;
+            }
+            /*
+             * NOTE: after ram_save_host_page_urgent() succeeded, pss->page
+             * will automatically be moved and point to the next host page
+             * we're going to send, so no need to update here.
+             *
+             * Normally QEMU never sends >1 host page in requests, so
+             * logically we don't even need that as the loop should only
+             * run once, but just to be consistent.
+             */
+            len -= page_size;
+        };
+        qemu_mutex_unlock(&rs->bitmap_mutex);
+
+        return ret;
+    }
+
     struct RAMSrcPageRequest *new_entry =
         g_new0(struct RAMSrcPageRequest, 1);
     new_entry->rb = ramblock;
@@ -2565,6 +2628,55 @@ static void pss_host_page_finish(PageSearchStatus *pss)
     pss->host_page_start = pss->host_page_end = 0;
 }
 
+/*
+ * Send an urgent host page specified by `pss'.  Need to be called with
+ * bitmap_mutex held.
+ *
+ * Returns 0 if save host page succeeded, false otherwise.
+ */
+static int ram_save_host_page_urgent(PageSearchStatus *pss)
+{
+    bool page_dirty, sent = false;
+    RAMState *rs = ram_state;
+    int ret = 0;
+
+    trace_postcopy_preempt_send_host_page(pss->block->idstr, pss->page);
+    pss_host_page_prepare(pss);
+
+    /*
+     * If precopy is sending the same page, let it be done in precopy, or
+     * we could send the same page in two channels and none of them will
+     * receive the whole page.
+     */
+    if (pss_overlap(pss, &ram_state->pss[RAM_CHANNEL_PRECOPY])) {
+        trace_postcopy_preempt_hit(pss->block->idstr,
+                                   pss->page << TARGET_PAGE_BITS);
+        return 0;
+    }
+
+    do {
+        page_dirty = migration_bitmap_clear_dirty(rs, pss->block, pss->page);
+
+        if (page_dirty) {
+            /* Be strict to return code; it must be 1, or what else? */
+            if (ram_save_target_page(rs, pss) != 1) {
+                error_report_once("%s: ram_save_target_page failed", __func__);
+                ret = -1;
+                goto out;
+            }
+            sent = true;
+        }
+        pss_find_next_dirty(pss);
+    } while (pss_within_range(pss));
+out:
+    pss_host_page_finish(pss);
+    /* For urgent requests, flush immediately if sent */
+    if (sent) {
+        qemu_fflush(pss->pss_channel);
+    }
+    return ret;
+}
+
 /**
  * ram_save_host_page: save a whole host page
  *
-- 
2.38.1


