Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6637400C07
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 18:13:11 +0200 (CEST)
Received: from localhost ([::1]:58786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMYI2-0007br-Oe
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 12:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMYGB-0004vf-Es
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 12:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMYG9-0003fR-Mf
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 12:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630771872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9zo/Ec+LY+h7koZhGBepNNhKjKunEO5Z1K/ueig00VY=;
 b=guEivUop6v/FaA7BsVnoQvJAnaNAiXPbaDjK21dMtDJ6n+AOg2OFCszD3m3T+PNsPeUI92
 s/suIdY7gYWVXEXTDK5C1UaSXds19w25PLFDdrzmNQwrMms9NdAG77XOvOVZ/PuKaehMrz
 NHlLzFpLs+b9p1Ys7Bui5YZ+3jp6/lc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-S9fG2F2wN4CzLxbrp-Zesw-1; Sat, 04 Sep 2021 12:11:11 -0400
X-MC-Unique: S9fG2F2wN4CzLxbrp-Zesw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F69E1006C91;
 Sat,  4 Sep 2021 16:11:10 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B6F7610F0;
 Sat,  4 Sep 2021 16:10:59 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 7/9] migration: Simplify alignment and alignment checks
Date: Sat,  4 Sep 2021 18:09:11 +0200
Message-Id: <20210904160913.17785-8-david@redhat.com>
In-Reply-To: <20210904160913.17785-1-david@redhat.com>
References: <20210904160913.17785-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's use QEMU_ALIGN_DOWN() and friends to make the code a bit easier to
read.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/migration.c    | 6 +++---
 migration/postcopy-ram.c | 9 ++++-----
 migration/ram.c          | 2 +-
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index bb909781b7..c99360297b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -391,7 +391,7 @@ int migrate_send_rp_message_req_pages(MigrationIncomingState *mis,
 int migrate_send_rp_req_pages(MigrationIncomingState *mis,
                               RAMBlock *rb, ram_addr_t start, uint64_t haddr)
 {
-    void *aligned = (void *)(uintptr_t)(haddr & (-qemu_ram_pagesize(rb)));
+    void *aligned = (void *)(uintptr_t)ROUND_DOWN(haddr, qemu_ram_pagesize(rb));
     bool received = false;
 
     WITH_QEMU_LOCK_GUARD(&mis->page_request_mutex) {
@@ -2619,8 +2619,8 @@ static void migrate_handle_rp_req_pages(MigrationState *ms, const char* rbname,
      * Since we currently insist on matching page sizes, just sanity check
      * we're being asked for whole host pages.
      */
-    if (start & (our_host_ps - 1) ||
-       (len & (our_host_ps - 1))) {
+    if (!QEMU_IS_ALIGNED(start, our_host_ps) ||
+        !QEMU_IS_ALIGNED(len, our_host_ps)) {
         error_report("%s: Misaligned page request, start: " RAM_ADDR_FMT
                      " len: %zd", __func__, start, len);
         mark_source_rp_bad(ms);
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 3609ce7e52..e721f69d0f 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -402,7 +402,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
                      strerror(errno));
         goto out;
     }
-    g_assert(((size_t)testarea & (pagesize - 1)) == 0);
+    g_assert(QEMU_PTR_IS_ALIGNED(testarea, pagesize));
 
     reg_struct.range.start = (uintptr_t)testarea;
     reg_struct.range.len = pagesize;
@@ -660,7 +660,7 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd,
     struct uffdio_range range;
     int ret;
     trace_postcopy_wake_shared(client_addr, qemu_ram_get_idstr(rb));
-    range.start = client_addr & ~(pagesize - 1);
+    range.start = ROUND_DOWN(client_addr, pagesize);
     range.len = pagesize;
     ret = ioctl(pcfd->fd, UFFDIO_WAKE, &range);
     if (ret) {
@@ -702,8 +702,7 @@ static int postcopy_request_page(MigrationIncomingState *mis, RAMBlock *rb,
 int postcopy_request_shared_page(struct PostCopyFD *pcfd, RAMBlock *rb,
                                  uint64_t client_addr, uint64_t rb_offset)
 {
-    size_t pagesize = qemu_ram_pagesize(rb);
-    uint64_t aligned_rbo = rb_offset & ~(pagesize - 1);
+    uint64_t aligned_rbo = ROUND_DOWN(rb_offset, qemu_ram_pagesize(rb));
     MigrationIncomingState *mis = migration_incoming_get_current();
 
     trace_postcopy_request_shared_page(pcfd->idstr, qemu_ram_get_idstr(rb),
@@ -993,7 +992,7 @@ static void *postcopy_ram_fault_thread(void *opaque)
                 break;
             }
 
-            rb_offset &= ~(qemu_ram_pagesize(rb) - 1);
+            rb_offset = ROUND_DOWN(rb_offset, qemu_ram_pagesize(rb));
             trace_postcopy_ram_fault_thread_request(msg.arg.pagefault.address,
                                                 qemu_ram_get_idstr(rb),
                                                 rb_offset,
diff --git a/migration/ram.c b/migration/ram.c
index 56240f0f17..b225ec7507 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -811,7 +811,7 @@ static void migration_clear_memory_region_dirty_bitmap(RAMBlock *rb,
     assert(shift >= 6);
 
     size = 1ULL << (TARGET_PAGE_BITS + shift);
-    start = (((ram_addr_t)page) << TARGET_PAGE_BITS) & (-size);
+    start = QEMU_ALIGN_DOWN((ram_addr_t)page << TARGET_PAGE_BITS, size);
     trace_migration_bitmap_clear_dirty(rb->idstr, start, size, page);
     memory_region_clear_dirty_bitmap(rb->mr, start, size);
 }
-- 
2.31.1


