Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0887762984E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 13:14:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouupD-00059Z-8v; Tue, 15 Nov 2022 07:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouuox-00050F-5m
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:13:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouuov-0004kR-Ju
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:13:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668514421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4gYdFB8JnzXjKUrplhGzUi3gnS4DOZf/usoccN+O3g=;
 b=ggDtqeYKdIwLyU0EmhdNeORoXefWtctbehyNPjV1NydhFDt7faEjb4VQkS0popJNzVdnSd
 HjjPEixd2dCfxZKVUDakTw5BOgPaP32/rE5y/5emecMkRCyEYT79ZuhHcJRhPO/XQImt6S
 Ba58/jechHGSPNCVAf9oryhpk62CW6Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-eJyLedonMPK0lOstvmcuVQ-1; Tue, 15 Nov 2022 07:13:38 -0500
X-MC-Unique: eJyLedonMPK0lOstvmcuVQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97E7B101A588;
 Tue, 15 Nov 2022 12:13:37 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84C86492B05;
 Tue, 15 Nov 2022 12:13:34 +0000 (UTC)
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
Subject: [PATCH 20/30] migration: Yield bitmap_mutex properly when
 sending/sleeping
Date: Tue, 15 Nov 2022 13:12:16 +0100
Message-Id: <20221115121226.26609-21-quintela@redhat.com>
In-Reply-To: <20221115121226.26609-1-quintela@redhat.com>
References: <20221115121226.26609-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

Don't take the bitmap mutex when sending pages, or when being throttled by
migration_rate_limit() (which is a bit tricky to call it here in ram code,
but seems still helpful).

It prepares for the possibility of concurrently sending pages in >1 threads
using the function ram_save_host_page() because all threads may need the
bitmap_mutex to operate on bitmaps, so that either sendmsg() or any kind of
qemu_sem_wait() blocking for one thread will not block the other from
progressing.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 46 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index ebc5664dcc..6428138194 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2480,9 +2480,14 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
  * a host page in which case the remainder of the hostpage is sent.
  * Only dirty target pages are sent. Note that the host page size may
  * be a huge page for this block.
+ *
  * The saving stops at the boundary of the used_length of the block
  * if the RAMBlock isn't a multiple of the host page size.
  *
+ * The caller must be with ram_state.bitmap_mutex held to call this
+ * function.  Note that this function can temporarily release the lock, but
+ * when the function is returned it'll make sure the lock is still held.
+ *
  * Returns the number of pages written or negative on error
  *
  * @rs: current RAM state
@@ -2490,6 +2495,7 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
  */
 static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
 {
+    bool page_dirty, preempt_active = postcopy_preempt_active();
     int tmppages, pages = 0;
     size_t pagesize_bits =
         qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
@@ -2513,22 +2519,40 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
             break;
         }
 
+        page_dirty = migration_bitmap_clear_dirty(rs, pss->block, pss->page);
+
         /* Check the pages is dirty and if it is send it */
-        if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
+        if (page_dirty) {
+            /*
+             * Properly yield the lock only in postcopy preempt mode
+             * because both migration thread and rp-return thread can
+             * operate on the bitmaps.
+             */
+            if (preempt_active) {
+                qemu_mutex_unlock(&rs->bitmap_mutex);
+            }
             tmppages = ram_save_target_page(rs, pss);
-            if (tmppages < 0) {
-                return tmppages;
+            if (tmppages >= 0) {
+                pages += tmppages;
+                /*
+                 * Allow rate limiting to happen in the middle of huge pages if
+                 * something is sent in the current iteration.
+                 */
+                if (pagesize_bits > 1 && tmppages > 0) {
+                    migration_rate_limit();
+                }
             }
-
-            pages += tmppages;
-            /*
-             * Allow rate limiting to happen in the middle of huge pages if
-             * something is sent in the current iteration.
-             */
-            if (pagesize_bits > 1 && tmppages > 0) {
-                migration_rate_limit();
+            if (preempt_active) {
+                qemu_mutex_lock(&rs->bitmap_mutex);
             }
+        } else {
+            tmppages = 0;
+        }
+
+        if (tmppages < 0) {
+            return tmppages;
         }
+
         pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
     } while ((pss->page < hostpage_boundary) &&
              offset_in_ramblock(pss->block,
-- 
2.38.1


