Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDEF587712
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 08:23:41 +0200 (CEST)
Received: from localhost ([::1]:59074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIlJb-0000mI-Ro
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 02:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIlG4-00074K-VT
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:20:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIlFz-0005ax-JA
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659421194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WkzXCabTuKxVAI3S7XBy6Bgpt95BXXwTSi5dgLfHCaU=;
 b=aEDXl2kqjNO6chzGx4ojcuBd2k3ZAlJOE2di9qXluvIImZxbcS1Wu0t7DOw62w4wE1GhDN
 pr0WLV540uDaeI6TlyEfrFMNs8l+IQA4E5nDtOBbL7ndD53OyFj6s9K5YvENBR1Y21vC/O
 6X7k5sGAXZ5YNqMzlyQk4nDd5Lg4nTY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-w0ZFlQotNlSHWUephyn_iA-1; Tue, 02 Aug 2022 02:19:53 -0400
X-MC-Unique: w0ZFlQotNlSHWUephyn_iA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2052C811E76
 for <qemu-devel@nongnu.org>; Tue,  2 Aug 2022 06:19:53 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F116790A04;
 Tue,  2 Aug 2022 06:19:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH for-7.1] Revert "migration: Simplify unqueue_page()"
Date: Tue,  2 Aug 2022 08:19:49 +0200
Message-Id: <20220802061949.331576-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URG_BIZ=0.573 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit cfd66f30fb0f735df06ff4220e5000290a43dad3.

The simplification of unqueue_page() introduced a bug that sometimes
breaks migration on s390x hosts. Seems like there are still pages here
that do not have their dirty bit set.
The problem is not fully understood yet, but since we are already in
the freeze for QEMU 7.1 and we need something working there, let's
revert this patch for the upcoming release. The optimization can be
redone later again in a proper way if necessary.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2099934
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 migration/ram.c        | 37 ++++++++++++++++++++++++++-----------
 migration/trace-events |  3 ++-
 2 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index b94669ba5d..dc1de9ddbc 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1612,7 +1612,6 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
 {
     struct RAMSrcPageRequest *entry;
     RAMBlock *block = NULL;
-    size_t page_size;
 
     if (!postcopy_has_request(rs)) {
         return NULL;
@@ -1629,13 +1628,10 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
     entry = QSIMPLEQ_FIRST(&rs->src_page_requests);
     block = entry->rb;
     *offset = entry->offset;
-    page_size = qemu_ram_pagesize(block);
-    /* Each page request should only be multiple page size of the ramblock */
-    assert((entry->len % page_size) == 0);
 
-    if (entry->len > page_size) {
-        entry->len -= page_size;
-        entry->offset += page_size;
+    if (entry->len > TARGET_PAGE_SIZE) {
+        entry->len -= TARGET_PAGE_SIZE;
+        entry->offset += TARGET_PAGE_SIZE;
     } else {
         memory_region_unref(block->mr);
         QSIMPLEQ_REMOVE_HEAD(&rs->src_page_requests, next_req);
@@ -1643,9 +1639,6 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
         migration_consume_urgent_request();
     }
 
-    trace_unqueue_page(block->idstr, *offset,
-                       test_bit((*offset >> TARGET_PAGE_BITS), block->bmap));
-
     return block;
 }
 
@@ -2069,8 +2062,30 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
 {
     RAMBlock  *block;
     ram_addr_t offset;
+    bool dirty;
+
+    do {
+        block = unqueue_page(rs, &offset);
+        /*
+         * We're sending this page, and since it's postcopy nothing else
+         * will dirty it, and we must make sure it doesn't get sent again
+         * even if this queue request was received after the background
+         * search already sent it.
+         */
+        if (block) {
+            unsigned long page;
+
+            page = offset >> TARGET_PAGE_BITS;
+            dirty = test_bit(page, block->bmap);
+            if (!dirty) {
+                trace_get_queued_page_not_dirty(block->idstr, (uint64_t)offset,
+                                                page);
+            } else {
+                trace_get_queued_page(block->idstr, (uint64_t)offset, page);
+            }
+        }
 
-    block = unqueue_page(rs, &offset);
+    } while (block && !dirty);
 
     if (block) {
         /* See comment above postcopy_preempted_contains() */
diff --git a/migration/trace-events b/migration/trace-events
index a34afe7b85..57003edcbd 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -85,6 +85,8 @@ put_qlist_end(const char *field_name, const char *vmsd_name) "%s(%s)"
 qemu_file_fclose(void) ""
 
 # ram.c
+get_queued_page(const char *block_name, uint64_t tmp_offset, unsigned long page_abs) "%s/0x%" PRIx64 " page_abs=0x%lx"
+get_queued_page_not_dirty(const char *block_name, uint64_t tmp_offset, unsigned long page_abs) "%s/0x%" PRIx64 " page_abs=0x%lx"
 migration_bitmap_sync_start(void) ""
 migration_bitmap_sync_end(uint64_t dirty_pages) "dirty_pages %" PRIu64
 migration_bitmap_clear_dirty(char *str, uint64_t start, uint64_t size, unsigned long page) "rb %s start 0x%"PRIx64" size 0x%"PRIx64" page 0x%lx"
@@ -110,7 +112,6 @@ ram_save_iterate_big_wait(uint64_t milliconds, int iterations) "big wait: %" PRI
 ram_load_complete(int ret, uint64_t seq_iter) "exit_code %d seq iteration %" PRIu64
 ram_write_tracking_ramblock_start(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
 ram_write_tracking_ramblock_stop(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
-unqueue_page(char *block, uint64_t offset, bool dirty) "ramblock '%s' offset 0x%"PRIx64" dirty %d"
 postcopy_preempt_triggered(char *str, unsigned long page) "during sending ramblock %s offset 0x%lx"
 postcopy_preempt_restored(char *str, unsigned long page) "ramblock %s offset 0x%lx"
 postcopy_preempt_hit(char *str, uint64_t offset) "ramblock %s offset 0x%"PRIx64
-- 
2.31.1


