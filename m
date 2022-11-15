Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7E76298D9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 13:28:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouupM-0005b0-Uq; Tue, 15 Nov 2022 07:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouupD-0005FR-AO
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:14:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouupB-0004p3-KP
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668514437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=koB3/mhLtylayQQdlhc6KiXJbQSyj75F0fbwswMjY8o=;
 b=brJQoEZnhjiaGEpOoU/YDDC12QOSui5z3Wioc0VzVDgIYCKBTgxnyTU4+XWU+6OGKsjQur
 0MpoMzrv2eS7+IWT2JSJwIlVNrZEc+2mfADoHs0NF0eBdjf0uoZT9srGdz5d5Hc4vr63yw
 m7CHqXM8JeZ1zpnb6SWSQQWSfPea6og=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-60RHSrnaNwmWK2ZPDFfgsA-1; Tue, 15 Nov 2022 07:13:53 -0500
X-MC-Unique: 60RHSrnaNwmWK2ZPDFfgsA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DF53833AED;
 Tue, 15 Nov 2022 12:13:52 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B62EF492B05;
 Tue, 15 Nov 2022 12:13:49 +0000 (UTC)
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
Subject: [PATCH 25/30] migration: Make PageSearchStatus part of RAMState
Date: Tue, 15 Nov 2022 13:12:21 +0100
Message-Id: <20221115121226.26609-26-quintela@redhat.com>
In-Reply-To: <20221115121226.26609-1-quintela@redhat.com>
References: <20221115121226.26609-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We used to allocate PSS structure on the stack for precopy when sending
pages.  Make it static, so as to describe per-channel ram migration status.

Here we declared RAM_CHANNEL_MAX instances, preparing for postcopy to use
it, even though this patch has not yet to start using the 2nd instance.

This should not have any functional change per se, but it already starts to
export PSS information via the RAMState, so that e.g. one PSS channel can
start to reference the other PSS channel.

Always protect PSS access using the same RAMState.bitmap_mutex.  We already
do so, so no code change needed, just some comment update.  Maybe we should
consider renaming bitmap_mutex some day as it's going to be a more commonly
and big mutex we use for ram states, but just leave it for later.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 112 ++++++++++++++++++++++++++----------------------
 1 file changed, 61 insertions(+), 51 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index a2e86623d3..bdb29ac4d9 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -113,6 +113,46 @@ static void __attribute__((constructor)) init_cpu_flag(void)
 
 XBZRLECacheStats xbzrle_counters;
 
+/* used by the search for pages to send */
+struct PageSearchStatus {
+    /* The migration channel used for a specific host page */
+    QEMUFile    *pss_channel;
+    /* Current block being searched */
+    RAMBlock    *block;
+    /* Current page to search from */
+    unsigned long page;
+    /* Set once we wrap around */
+    bool         complete_round;
+    /*
+     * [POSTCOPY-ONLY] Whether current page is explicitly requested by
+     * postcopy.  When set, the request is "urgent" because the dest QEMU
+     * threads are waiting for us.
+     */
+    bool         postcopy_requested;
+    /*
+     * [POSTCOPY-ONLY] The target channel to use to send current page.
+     *
+     * Note: This may _not_ match with the value in postcopy_requested
+     * above. Let's imagine the case where the postcopy request is exactly
+     * the page that we're sending in progress during precopy. In this case
+     * we'll have postcopy_requested set to true but the target channel
+     * will be the precopy channel (so that we don't split brain on that
+     * specific page since the precopy channel already contains partial of
+     * that page data).
+     *
+     * Besides that specific use case, postcopy_target_channel should
+     * always be equal to postcopy_requested, because by default we send
+     * postcopy pages via postcopy preempt channel.
+     */
+    bool         postcopy_target_channel;
+    /* Whether we're sending a host page */
+    bool          host_page_sending;
+    /* The start/end of current host page.  Invalid if host_page_sending==false */
+    unsigned long host_page_start;
+    unsigned long host_page_end;
+};
+typedef struct PageSearchStatus PageSearchStatus;
+
 /* struct contains XBZRLE cache and a static page
    used by the compression */
 static struct {
@@ -347,6 +387,11 @@ typedef struct {
 struct RAMState {
     /* QEMUFile used for this migration */
     QEMUFile *f;
+    /*
+     * PageSearchStatus structures for the channels when send pages.
+     * Protected by the bitmap_mutex.
+     */
+    PageSearchStatus pss[RAM_CHANNEL_MAX];
     /* UFFD file descriptor, used in 'write-tracking' migration */
     int uffdio_fd;
     /* Last block that we have visited searching for dirty pages */
@@ -390,7 +435,12 @@ struct RAMState {
     uint64_t target_page_count;
     /* number of dirty bits in the bitmap */
     uint64_t migration_dirty_pages;
-    /* Protects modification of the bitmap and migration dirty pages */
+    /*
+     * Protects:
+     * - dirty/clear bitmap
+     * - migration_dirty_pages
+     * - pss structures
+     */
     QemuMutex bitmap_mutex;
     /* The RAMBlock used in the last src_page_requests */
     RAMBlock *last_req_rb;
@@ -479,46 +529,6 @@ void dirty_sync_missed_zero_copy(void)
     ram_counters.dirty_sync_missed_zero_copy++;
 }
 
-/* used by the search for pages to send */
-struct PageSearchStatus {
-    /* The migration channel used for a specific host page */
-    QEMUFile    *pss_channel;
-    /* Current block being searched */
-    RAMBlock    *block;
-    /* Current page to search from */
-    unsigned long page;
-    /* Set once we wrap around */
-    bool         complete_round;
-    /*
-     * [POSTCOPY-ONLY] Whether current page is explicitly requested by
-     * postcopy.  When set, the request is "urgent" because the dest QEMU
-     * threads are waiting for us.
-     */
-    bool         postcopy_requested;
-    /*
-     * [POSTCOPY-ONLY] The target channel to use to send current page.
-     *
-     * Note: This may _not_ match with the value in postcopy_requested
-     * above. Let's imagine the case where the postcopy request is exactly
-     * the page that we're sending in progress during precopy. In this case
-     * we'll have postcopy_requested set to true but the target channel
-     * will be the precopy channel (so that we don't split brain on that
-     * specific page since the precopy channel already contains partial of
-     * that page data).
-     *
-     * Besides that specific use case, postcopy_target_channel should
-     * always be equal to postcopy_requested, because by default we send
-     * postcopy pages via postcopy preempt channel.
-     */
-    bool         postcopy_target_channel;
-    /* Whether we're sending a host page */
-    bool          host_page_sending;
-    /* The start/end of current host page.  Only valid if host_page_sending==true */
-    unsigned long host_page_start;
-    unsigned long host_page_end;
-};
-typedef struct PageSearchStatus PageSearchStatus;
-
 CompressionStats compression_counters;
 
 struct CompressParam {
@@ -2665,7 +2675,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
  */
 static int ram_find_and_save_block(RAMState *rs)
 {
-    PageSearchStatus pss;
+    PageSearchStatus *pss = &rs->pss[RAM_CHANNEL_PRECOPY];
     int pages = 0;
     bool again, found;
 
@@ -2686,11 +2696,11 @@ static int ram_find_and_save_block(RAMState *rs)
         rs->last_page = 0;
     }
 
-    pss_init(&pss, rs->last_seen_block, rs->last_page);
+    pss_init(pss, rs->last_seen_block, rs->last_page);
 
     do {
         again = true;
-        found = get_queued_page(rs, &pss);
+        found = get_queued_page(rs, pss);
 
         if (!found) {
             /*
@@ -2698,27 +2708,27 @@ static int ram_find_and_save_block(RAMState *rs)
              * preempted precopy.  Otherwise find the next dirty bit.
              */
             if (postcopy_preempt_triggered(rs)) {
-                postcopy_preempt_restore(rs, &pss, false);
+                postcopy_preempt_restore(rs, pss, false);
                 found = true;
             } else {
                 /* priority queue empty, so just search for something dirty */
-                found = find_dirty_block(rs, &pss, &again);
+                found = find_dirty_block(rs, pss, &again);
             }
         }
 
         if (found) {
             /* Update rs->f with correct channel */
             if (postcopy_preempt_active()) {
-                postcopy_preempt_choose_channel(rs, &pss);
+                postcopy_preempt_choose_channel(rs, pss);
             }
             /* Cache rs->f in pss_channel (TODO: remove rs->f) */
-            pss.pss_channel = rs->f;
-            pages = ram_save_host_page(rs, &pss);
+            pss->pss_channel = rs->f;
+            pages = ram_save_host_page(rs, pss);
         }
     } while (!pages && again);
 
-    rs->last_seen_block = pss.block;
-    rs->last_page = pss.page;
+    rs->last_seen_block = pss->block;
+    rs->last_page = pss->page;
 
     return pages;
 }
-- 
2.38.1


