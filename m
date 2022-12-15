Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D2664D8FA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 10:49:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5kiO-0008E4-BT; Thu, 15 Dec 2022 04:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p5kiK-0008Bo-O8
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 04:39:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p5kiI-0000bX-FR
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 04:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671097177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xvso+uqexrJS++o89EhHm9GXqK2SAyeGs3yfsu8kVfg=;
 b=hbDxFXrvicfj2c1HPumhwp5xRuNSytyPekxMHXpDlTqVTG1Mev+Hlc5CIurXjDpeVzgRuT
 R3BRJb89W5ZXOJqUYTi7E2ntXZFr0jjrx5j/Q0aallU2ObgHBat95oNRxweix6R8i0C6Fs
 Pv0z04j9O7VPClU4cuHWJ/U0CK8oP50=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-DXlUI5gkM92s6LbbHaOWlg-1; Thu, 15 Dec 2022 04:39:33 -0500
X-MC-Unique: DXlUI5gkM92s6LbbHaOWlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 183F58028B0;
 Thu, 15 Dec 2022 09:39:33 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7221240C2064;
 Thu, 15 Dec 2022 09:39:30 +0000 (UTC)
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
Subject: [PULL 12/19] migration: Teach PSS about host page
Date: Thu, 15 Dec 2022 10:38:42 +0100
Message-Id: <20221215093849.4771-13-quintela@redhat.com>
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

Migration code has a lot to do with host pages.  Teaching PSS core about
the idea of host page helps a lot and makes the code clean.  Meanwhile,
this prepares for the future changes that can leverage the new PSS helpers
that this patch introduces to send host page in another thread.

Three more fields are introduced for this:

  (1) host_page_sending: this is set to true when QEMU is sending a host
      page, false otherwise.

  (2) host_page_{start|end}: these point to the start/end of host page
      we're sending, and it's only valid when host_page_sending==true.

For example, when we look up the next dirty page on the ramblock, with
host_page_sending==true, we'll not try to look for anything beyond the
current host page boundary.  This can be slightly efficient than current
code because currently we'll set pss->page to next dirty bit (which can be
over current host page boundary) and reset it to host page boundary if we
found it goes beyond that.

With above, we can easily make migration_bitmap_find_dirty() self contained
by updating pss->page properly.  rs* parameter is removed because it's not
even used in old code.

When sending a host page, we should use the pss helpers like this:

  - pss_host_page_prepare(pss): called before sending host page
  - pss_within_range(pss): whether we're still working on the cur host page?
  - pss_host_page_finish(pss): called after sending a host page

Then we can use ram_save_target_page() to save one small page.

Currently ram_save_host_page() is still the only user. If there'll be
another function to send host page (e.g. in return path thread) in the
future, it should follow the same style.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 95 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 76 insertions(+), 19 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index f4cd9038f4..4d7b50ef79 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -481,6 +481,11 @@ struct PageSearchStatus {
      * postcopy pages via postcopy preempt channel.
      */
     bool         postcopy_target_channel;
+    /* Whether we're sending a host page */
+    bool          host_page_sending;
+    /* The start/end of current host page.  Only valid if host_page_sending==true */
+    unsigned long host_page_start;
+    unsigned long host_page_end;
 };
 typedef struct PageSearchStatus PageSearchStatus;
 
@@ -858,26 +863,38 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
 }
 
 /**
- * migration_bitmap_find_dirty: find the next dirty page from start
+ * pss_find_next_dirty: find the next dirty page of current ramblock
  *
- * Returns the page offset within memory region of the start of a dirty page
+ * This function updates pss->page to point to the next dirty page index
+ * within the ramblock to migrate, or the end of ramblock when nothing
+ * found.  Note that when pss->host_page_sending==true it means we're
+ * during sending a host page, so we won't look for dirty page that is
+ * outside the host page boundary.
  *
- * @rs: current RAM state
- * @rb: RAMBlock where to search for dirty pages
- * @start: page where we start the search
+ * @pss: the current page search status
  */
-static inline
-unsigned long migration_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
-                                          unsigned long start)
+static void pss_find_next_dirty(PageSearchStatus *pss)
 {
+    RAMBlock *rb = pss->block;
     unsigned long size = rb->used_length >> TARGET_PAGE_BITS;
     unsigned long *bitmap = rb->bmap;
 
     if (ramblock_is_ignored(rb)) {
-        return size;
+        /* Points directly to the end, so we know no dirty page */
+        pss->page = size;
+        return;
     }
 
-    return find_next_bit(bitmap, size, start);
+    /*
+     * If during sending a host page, only look for dirty pages within the
+     * current host page being send.
+     */
+    if (pss->host_page_sending) {
+        assert(pss->host_page_end);
+        size = MIN(size, pss->host_page_end);
+    }
+
+    pss->page = find_next_bit(bitmap, size, pss->page);
 }
 
 static void migration_clear_memory_region_dirty_bitmap(RAMBlock *rb,
@@ -1563,7 +1580,9 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
     pss->postcopy_requested = false;
     pss->postcopy_target_channel = RAM_CHANNEL_PRECOPY;
 
-    pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
+    /* Update pss->page for the next dirty bit in ramblock */
+    pss_find_next_dirty(pss);
+
     if (pss->complete_round && pss->block == rs->last_seen_block &&
         pss->page >= rs->last_page) {
         /*
@@ -2452,6 +2471,44 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
     }
 }
 
+/* Should be called before sending a host page */
+static void pss_host_page_prepare(PageSearchStatus *pss)
+{
+    /* How many guest pages are there in one host page? */
+    size_t guest_pfns = qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
+
+    pss->host_page_sending = true;
+    pss->host_page_start = ROUND_DOWN(pss->page, guest_pfns);
+    pss->host_page_end = ROUND_UP(pss->page + 1, guest_pfns);
+}
+
+/*
+ * Whether the page pointed by PSS is within the host page being sent.
+ * Must be called after a previous pss_host_page_prepare().
+ */
+static bool pss_within_range(PageSearchStatus *pss)
+{
+    ram_addr_t ram_addr;
+
+    assert(pss->host_page_sending);
+
+    /* Over host-page boundary? */
+    if (pss->page >= pss->host_page_end) {
+        return false;
+    }
+
+    ram_addr = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
+
+    return offset_in_ramblock(pss->block, ram_addr);
+}
+
+static void pss_host_page_finish(PageSearchStatus *pss)
+{
+    pss->host_page_sending = false;
+    /* This is not needed, but just to reset it */
+    pss->host_page_start = pss->host_page_end = 0;
+}
+
 /**
  * ram_save_host_page: save a whole host page
  *
@@ -2479,8 +2536,6 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
     int tmppages, pages = 0;
     size_t pagesize_bits =
         qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
-    unsigned long hostpage_boundary =
-        QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
     unsigned long start_page = pss->page;
     int res;
 
@@ -2493,6 +2548,9 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
         postcopy_preempt_choose_channel(rs, pss);
     }
 
+    /* Update host page boundary information */
+    pss_host_page_prepare(pss);
+
     do {
         if (postcopy_needs_preempt(rs, pss)) {
             postcopy_do_preempt(rs, pss);
@@ -2530,15 +2588,14 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
         }
 
         if (tmppages < 0) {
+            pss_host_page_finish(pss);
             return tmppages;
         }
 
-        pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
-    } while ((pss->page < hostpage_boundary) &&
-             offset_in_ramblock(pss->block,
-                                ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
-    /* The offset we leave with is the min boundary of host page and block */
-    pss->page = MIN(pss->page, hostpage_boundary);
+        pss_find_next_dirty(pss);
+    } while (pss_within_range(pss));
+
+    pss_host_page_finish(pss);
 
     /*
      * When with postcopy preempt mode, flush the data as soon as possible for
-- 
2.38.1


