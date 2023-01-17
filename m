Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D7C670B60
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:11:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu9V-0001II-OQ; Tue, 17 Jan 2023 17:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9T-0001BU-QJ
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9R-0007aW-Qh
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Wpj//1KX4T5LSYnGijdyGTWi6aBZGHsD+WnZQl5RqE=;
 b=f+3vIusCgm1gcyFRG4I4u/QD/lke/mo2XtChuH9k26kULNHEFM4xfv+K24NFxifUKi1Ye6
 XvpYxfOPq65vK2YPBTpv+ccvOTOf9xjvyGDPX8Tz7VG5Cn2uBxRHNaN9oSVDlUY6KqGJAe
 i8hRORll98jGIngCSmuAFgKRV3/kf9o=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-73-enQ6GwqkPROwJHG9sNqTdw-1; Tue, 17 Jan 2023 17:09:52 -0500
X-MC-Unique: enQ6GwqkPROwJHG9sNqTdw-1
Received: by mail-qv1-f72.google.com with SMTP id
 jy13-20020a0562142b4d00b00535302dd1b8so1092402qvb.18
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Wpj//1KX4T5LSYnGijdyGTWi6aBZGHsD+WnZQl5RqE=;
 b=ArU7GYOkRst+aM/bRubzLcDPUCOeGFOgek1DVVRUCZDT5GksDsN0t6BfJ01MzeesxD
 1OQNW4xE2+7B3eT8bQ5xkrTmayVI2i0dIlSHG23HI+BeiYGZwaq+RHxY8ir2Na1VDwU6
 1bbKaokHLVAJ+HvRK2CZ3SdP2UP8pZdSxYu+kpxas1n4Mfm0igpMEpn6PrUZUcW8oikh
 MRsNioNNaf7QnNy8klec/ejt5NoP9FcXjH/6oh+4FoZ1Dh1GeUkKMLXGH5PKe72dhUe/
 Op3nOGvjrvrfTMTw4XMl9Wg43IAHfXJqRokPbAL4Q7RW46OsJvy71609eU7se7OBQ7vw
 a7OQ==
X-Gm-Message-State: AFqh2krJXyuDABIG5Vc8PIjcD+1OrowTkBzEr9n72Wik0zXpK1zD3JOW
 pY8w2PAhmUv1GW/Q/lQUuEWs/KEo/eVcsxcdgJvnfb5d67+l2dz7dpzWJ9jIR67oPe4DKGdSxlo
 lv1rxfJD65YZ6a/+ApFcf1LDzdI+Yan3qbIDeylLCOf+ZyaEBgD1Y4I1yWdUTapVo
X-Received: by 2002:a05:6214:3311:b0:534:ba17:9e71 with SMTP id
 mo17-20020a056214331100b00534ba179e71mr7883997qvb.9.1673993390885; 
 Tue, 17 Jan 2023 14:09:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXssfMGjJKQpdsxwqXyYeEPcOpe8i3cZIi3PWqFmhzsMr9BuFzLAJbsaC2VxIeVGCpQ50azxvA==
X-Received: by 2002:a05:6214:3311:b0:534:ba17:9e71 with SMTP id
 mo17-20020a056214331100b00534ba179e71mr7883959qvb.9.1673993390494; 
 Tue, 17 Jan 2023 14:09:50 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:09:49 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 12/21] migration: Introduce page size for-migration-only
Date: Tue, 17 Jan 2023 17:09:05 -0500
Message-Id: <20230117220914.2062125-13-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230117220914.2062125-1-peterx@redhat.com>
References: <20230117220914.2062125-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Migration may not want to recognize memory chunks in page size of the host
only, but sometimes we may want to recognize the memory in smaller chunks
if e.g. they're doubly mapped as both huge and small.

In those cases we'll prefer to assume the memory page size is always mapped
small (qemu_real_host_page_size) and we'll do things just like when the
pages was only smally mapped.

Let's do this to be prepared of postcopy double-mapping for hugetlbfs.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c    |  6 ++++--
 migration/postcopy-ram.c | 16 +++++++++-------
 migration/ram.c          | 29 ++++++++++++++++++++++-------
 migration/ram.h          |  1 +
 4 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index b174f2af92..f6fe474fc3 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -408,7 +408,7 @@ int migrate_send_rp_message_req_pages(MigrationIncomingState *mis,
 {
     uint8_t bufc[12 + 1 + 255]; /* start (8), len (4), rbname up to 256 */
     size_t msglen = 12; /* start + len */
-    size_t len = qemu_ram_pagesize(rb);
+    size_t len = migration_ram_pagesize(rb);
     enum mig_rp_message_type msg_type;
     const char *rbname;
     int rbname_len;
@@ -443,8 +443,10 @@ int migrate_send_rp_message_req_pages(MigrationIncomingState *mis,
 int migrate_send_rp_req_pages(MigrationIncomingState *mis,
                               RAMBlock *rb, ram_addr_t start, uint64_t haddr)
 {
-    void *aligned = (void *)(uintptr_t)ROUND_DOWN(haddr, qemu_ram_pagesize(rb));
     bool received = false;
+    void *aligned;
+
+    aligned = (void *)(uintptr_t)ROUND_DOWN(haddr, migration_ram_pagesize(rb));
 
     WITH_QEMU_LOCK_GUARD(&mis->page_request_mutex) {
         received = ramblock_recv_bitmap_test_byte_offset(rb, start);
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 2c86bfc091..acae1dc6ae 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -694,7 +694,7 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd,
                          uint64_t client_addr,
                          RAMBlock *rb)
 {
-    size_t pagesize = qemu_ram_pagesize(rb);
+    size_t pagesize = migration_ram_pagesize(rb);
     struct uffdio_range range;
     int ret;
     trace_postcopy_wake_shared(client_addr, qemu_ram_get_idstr(rb));
@@ -712,7 +712,9 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd,
 static int postcopy_request_page(MigrationIncomingState *mis, RAMBlock *rb,
                                  ram_addr_t start, uint64_t haddr)
 {
-    void *aligned = (void *)(uintptr_t)ROUND_DOWN(haddr, qemu_ram_pagesize(rb));
+    void *aligned;
+
+    aligned = (void *)(uintptr_t)ROUND_DOWN(haddr, migration_ram_pagesize(rb));
 
     /*
      * Discarded pages (via RamDiscardManager) are never migrated. On unlikely
@@ -722,7 +724,7 @@ static int postcopy_request_page(MigrationIncomingState *mis, RAMBlock *rb,
      * Checking a single bit is sufficient to handle pagesize > TPS as either
      * all relevant bits are set or not.
      */
-    assert(QEMU_IS_ALIGNED(start, qemu_ram_pagesize(rb)));
+    assert(QEMU_IS_ALIGNED(start, migration_ram_pagesize(rb)));
     if (ramblock_page_is_discarded(rb, start)) {
         bool received = ramblock_recv_bitmap_test_byte_offset(rb, start);
 
@@ -740,7 +742,7 @@ static int postcopy_request_page(MigrationIncomingState *mis, RAMBlock *rb,
 int postcopy_request_shared_page(struct PostCopyFD *pcfd, RAMBlock *rb,
                                  uint64_t client_addr, uint64_t rb_offset)
 {
-    uint64_t aligned_rbo = ROUND_DOWN(rb_offset, qemu_ram_pagesize(rb));
+    uint64_t aligned_rbo = ROUND_DOWN(rb_offset, migration_ram_pagesize(rb));
     MigrationIncomingState *mis = migration_incoming_get_current();
 
     trace_postcopy_request_shared_page(pcfd->idstr, qemu_ram_get_idstr(rb),
@@ -1020,7 +1022,7 @@ static void *postcopy_ram_fault_thread(void *opaque)
                 break;
             }
 
-            rb_offset = ROUND_DOWN(rb_offset, qemu_ram_pagesize(rb));
+            rb_offset = ROUND_DOWN(rb_offset, migration_ram_pagesize(rb));
             trace_postcopy_ram_fault_thread_request(msg.arg.pagefault.address,
                                                 qemu_ram_get_idstr(rb),
                                                 rb_offset,
@@ -1281,7 +1283,7 @@ int postcopy_notify_shared_wake(RAMBlock *rb, uint64_t offset)
 int postcopy_place_page(MigrationIncomingState *mis, void *host, void *from,
                         RAMBlock *rb)
 {
-    size_t pagesize = qemu_ram_pagesize(rb);
+    size_t pagesize = migration_ram_pagesize(rb);
 
     /* copy also acks to the kernel waking the stalled thread up
      * TODO: We can inhibit that ack and only do it if it was requested
@@ -1308,7 +1310,7 @@ int postcopy_place_page(MigrationIncomingState *mis, void *host, void *from,
 int postcopy_place_page_zero(MigrationIncomingState *mis, void *host,
                              RAMBlock *rb)
 {
-    size_t pagesize = qemu_ram_pagesize(rb);
+    size_t pagesize = migration_ram_pagesize(rb);
     trace_postcopy_place_page_zero(host);
 
     /* Normal RAMBlocks can zero a page using UFFDIO_ZEROPAGE
diff --git a/migration/ram.c b/migration/ram.c
index 334309f1c6..945c6477fd 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -121,6 +121,20 @@ static struct {
     uint8_t *decoded_buf;
 } XBZRLE;
 
+/* Get the page size we should use for migration purpose. */
+size_t migration_ram_pagesize(RAMBlock *block)
+{
+    /*
+     * When hugetlb doublemap is enabled, we should always use the smallest
+     * page for migration.
+     */
+    if (migrate_hugetlb_doublemap()) {
+        return qemu_real_host_page_size();
+    }
+
+    return qemu_ram_pagesize(block);
+}
+
 static void XBZRLE_cache_lock(void)
 {
     if (migrate_use_xbzrle()) {
@@ -1049,7 +1063,7 @@ bool ramblock_page_is_discarded(RAMBlock *rb, ram_addr_t start)
         MemoryRegionSection section = {
             .mr = rb->mr,
             .offset_within_region = start,
-            .size = int128_make64(qemu_ram_pagesize(rb)),
+            .size = int128_make64(migration_ram_pagesize(rb)),
         };
 
         return !ram_discard_manager_is_populated(rdm, &section);
@@ -2152,7 +2166,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
      */
     if (postcopy_preempt_active()) {
         ram_addr_t page_start = start >> TARGET_PAGE_BITS;
-        size_t page_size = qemu_ram_pagesize(ramblock);
+        size_t page_size = migration_ram_pagesize(ramblock);
         PageSearchStatus *pss = &ram_state->pss[RAM_CHANNEL_POSTCOPY];
         int ret = 0;
 
@@ -2316,7 +2330,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
 static void pss_host_page_prepare(PageSearchStatus *pss)
 {
     /* How many guest pages are there in one host page? */
-    size_t guest_pfns = qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
+    size_t guest_pfns = migration_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
 
     pss->host_page_sending = true;
     pss->host_page_start = ROUND_DOWN(pss->page, guest_pfns);
@@ -2425,7 +2439,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
     bool page_dirty, preempt_active = postcopy_preempt_active();
     int tmppages, pages = 0;
     size_t pagesize_bits =
-        qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
+        migration_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
     unsigned long start_page = pss->page;
     int res;
 
@@ -3518,7 +3532,7 @@ static void *host_page_from_ram_block_offset(RAMBlock *block,
 {
     /* Note: Explicitly no check against offset_in_ramblock(). */
     return (void *)QEMU_ALIGN_DOWN((uintptr_t)(block->host + offset),
-                                   block->page_size);
+                                   migration_ram_pagesize(block));
 }
 
 static ram_addr_t host_page_offset_from_ram_block_offset(RAMBlock *block,
@@ -3970,7 +3984,8 @@ int ram_load_postcopy(QEMUFile *f, int channel)
                 break;
             }
             tmp_page->target_pages++;
-            matches_target_page_size = block->page_size == TARGET_PAGE_SIZE;
+            matches_target_page_size =
+                migration_ram_pagesize(block) == TARGET_PAGE_SIZE;
             /*
              * Postcopy requires that we place whole host pages atomically;
              * these may be huge pages for RAMBlocks that are backed by
@@ -4005,7 +4020,7 @@ int ram_load_postcopy(QEMUFile *f, int channel)
              * page
              */
             if (tmp_page->target_pages ==
-                (block->page_size / TARGET_PAGE_SIZE)) {
+                (migration_ram_pagesize(block) / TARGET_PAGE_SIZE)) {
                 place_needed = true;
             }
             place_source = tmp_page->tmp_huge_page;
diff --git a/migration/ram.h b/migration/ram.h
index 81cbb0947c..162b3e7cb8 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -68,6 +68,7 @@ bool ramblock_is_ignored(RAMBlock *block);
         if (!qemu_ram_is_migratable(block)) {} else
 
 int xbzrle_cache_resize(uint64_t new_size, Error **errp);
+size_t migration_ram_pagesize(RAMBlock *block);
 uint64_t ram_bytes_remaining(void);
 uint64_t ram_bytes_total(void);
 void mig_throttle_counter_reset(void);
-- 
2.37.3


