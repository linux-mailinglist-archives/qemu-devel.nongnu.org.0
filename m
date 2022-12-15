Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BD864D900
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 10:50:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5kiM-0008Cx-I7; Thu, 15 Dec 2022 04:39:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p5kiL-0008C0-3Z
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 04:39:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p5kiI-0000bf-MR
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 04:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671097178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30+Kq9dPR7peGz5envehc+sa5UbYD15LI+w9Psis5To=;
 b=IsSIXh57RQ69q+Z8zo60BK2N3i97MTaiTogDoc0mEQSK/Urhit1ro66Q06srwGfgvjDRZ6
 xZex/B+N5a5MbuiGiIwIbsgp1bb+/Q8EDcyj734CQ1QX1rTyxthAqOgVpNaT4Q1K32INSv
 xxS6CzwjixWTu9M49yDp27shN1hBTVY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-I_fneopRPfmsoEs9MKgU_w-1; Thu, 15 Dec 2022 04:39:27 -0500
X-MC-Unique: I_fneopRPfmsoEs9MKgU_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB9A11C07551;
 Thu, 15 Dec 2022 09:39:26 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D667E40C2064;
 Thu, 15 Dec 2022 09:39:23 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Fam Zheng <fam@euphon.net>
Subject: [PULL 10/19] migration: Yield bitmap_mutex properly when
 sending/sleeping
Date: Thu, 15 Dec 2022 10:38:40 +0100
Message-Id: <20221215093849.4771-11-quintela@redhat.com>
In-Reply-To: <20221215093849.4771-1-quintela@redhat.com>
References: <20221215093849.4771-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
index 6e3dc845c5..5379164749 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2452,9 +2452,14 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
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
@@ -2462,6 +2467,7 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
  */
 static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
 {
+    bool page_dirty, preempt_active = postcopy_preempt_active();
     int tmppages, pages = 0;
     size_t pagesize_bits =
         qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
@@ -2485,22 +2491,40 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
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


