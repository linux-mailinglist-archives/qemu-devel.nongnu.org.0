Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260A05A1206
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 15:27:07 +0200 (CEST)
Received: from localhost ([::1]:42566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRCsz-00082c-Q5
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 09:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oRCnl-0002LR-7s
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 09:21:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oRCnd-0000sZ-0q
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 09:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661433691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wzGsCWdlvNsNp9At+1/QNe2WO4Un1pBycwc68LIA0R8=;
 b=GuFKXk/tb4UYWt6W9xIx3hFEPq0YEg8Mw9QLAG9Gto79a61Vgl7HKmcH7PXQBLdVL/38/3
 38+1+gF6ENNtKVsrnvlCAMm47z4VZMXqtjVi6PLXeWAnC04WnnzraPoqcjo6gQAj4Ht4zY
 qdmgOr5l346heI5ZkEnWM3vV2zthack=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-mcDGCLQQOZizef06RdlvBA-1; Thu, 25 Aug 2022 09:21:28 -0400
X-MC-Unique: mcDGCLQQOZizef06RdlvBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE4B3185A7BA;
 Thu, 25 Aug 2022 13:21:27 +0000 (UTC)
Received: from localhost (unknown [10.39.208.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BBB0141510F;
 Thu, 25 Aug 2022 13:21:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qiaonuohan@cn.fujitsu.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [PATCH 2/2] dump: fix kdump to work over non-aligned blocks
Date: Thu, 25 Aug 2022 17:21:10 +0400
Message-Id: <20220825132110.1500330-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220825132110.1500330-1-marcandre.lureau@redhat.com>
References: <20220825132110.1500330-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Rewrite get_next_page() to work over non-aligned blocks. When it
encounters non aligned addresses, it will allocate a zero-page and try
to fill it.

This solves a kdump crash with "tpm-crb-cmd" RAM memory region,
qemu-kvm: ../dump/dump.c:1162: _Bool get_next_page(GuestPhysBlock **,
uint64_t *, uint8_t **, DumpState *): Assertion `(block->target_start &
~target_page_mask) == 0' failed.

because:
guest_phys_block_add_section: target_start=00000000fed40080 target_end=00000000fed41000: added (count: 4)

Fixes:
https://bugzilla.redhat.com/show_bug.cgi?id=2120480

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 dump/dump.c | 89 ++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 64 insertions(+), 25 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 18f06cffe2..9aeed88688 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1094,49 +1094,79 @@ static uint64_t dump_pfn_to_paddr(DumpState *s, uint64_t pfn)
 }
 
 /*
- * exam every page and return the page frame number and the address of the page.
- * bufptr can be NULL. note: the blocks here is supposed to reflect guest-phys
- * blocks, so block->target_start and block->target_end should be interal
- * multiples of the target page size.
+ * Return the page frame number and the page content in *bufptr.
+ * bufptr and allocptr can be NULL. If alloced, *bufptr must be freed.
  */
 static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
-                          uint8_t **bufptr, DumpState *s)
+                          uint8_t **bufptr, bool *allocptr, DumpState *s)
 {
     GuestPhysBlock *block = *blockptr;
-    hwaddr addr, target_page_mask = ~((hwaddr)s->dump_info.page_size - 1);
-    uint8_t *buf;
+    uint32_t page_size = s->dump_info.page_size;
+    bool alloced = false;
+    uint8_t *buf = NULL, *hbuf;
+    hwaddr addr;
 
     /* block == NULL means the start of the iteration */
     if (block == NULL) {
         *blockptr = block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
         addr = block->target_start;
+        *pfnptr = dump_paddr_to_pfn(s, addr);
     } else {
-        addr = dump_pfn_to_paddr(s, *pfnptr + 1);
+        assert(block != NULL);
+        *pfnptr += 1;
+        addr = dump_pfn_to_paddr(s, *pfnptr);
     }
     assert(block != NULL);
 
-    if ((addr >= block->target_start) &&
-        (addr + s->dump_info.page_size <= block->target_end)) {
-        buf = block->host_addr + (addr - block->target_start);
-    } else {
-        /* the next page is in the next block */
-        *blockptr = block = QTAILQ_NEXT(block, next);
-        if (!block) {
-            return false;
+    while (1) {
+        if (addr >= block->target_start && addr < block->target_end) {
+            size_t n = MIN(block->target_end - addr, page_size - addr % page_size);
+            hbuf = block->host_addr + (addr - block->target_start);
+            if (!alloced) {
+                if (n == page_size) {
+                    /* this is a whole host page, go for it */
+                    assert(addr % page_size == 0);
+                    buf = hbuf;
+                    break;
+                } else {
+                    buf = g_malloc0(page_size);
+                    alloced = true;
+                }
+            }
+
+            memcpy(buf + addr % page_size, hbuf, n);
+            addr += n;
+            if (addr % page_size == 0) {
+                /* we filled up the alloc page */
+                break;
+            }
+        } else {
+            /* the next page is in the next block */
+            *blockptr = block = QTAILQ_NEXT(block, next);
+            if (!block) {
+                break;
+            }
+
+            addr = block->target_start;
+            /* are we still in the same page? */
+            if (dump_paddr_to_pfn(s, addr) != *pfnptr) {
+                if (alloced) {
+                    /* no, but we already filled something earlier, return it */
+                    break;
+                } else {
+                    /* else continue from there */
+                    *pfnptr = dump_paddr_to_pfn(s, addr);
+                }
+            }
         }
-        addr = block->target_start;
-        buf = block->host_addr;
     }
 
-    /* those checks are going away next */
-    assert((block->target_start & ~target_page_mask) == 0);
-    assert((block->target_end & ~target_page_mask) == 0);
-    *pfnptr = dump_paddr_to_pfn(s, addr);
     if (bufptr) {
         *bufptr = buf;
+        *allocptr = alloced;
     }
 
-    return true;
+    return buf != NULL;
 }
 
 static void write_dump_bitmap(DumpState *s, Error **errp)
@@ -1159,7 +1189,7 @@ static void write_dump_bitmap(DumpState *s, Error **errp)
      * exam memory page by page, and set the bit in dump_bitmap corresponded
      * to the existing page.
      */
-    while (get_next_page(&block_iter, &pfn, NULL, s)) {
+    while (get_next_page(&block_iter, &pfn, NULL, NULL, s)) {
         ret = set_dump_bitmap(last_pfn, pfn, true, dump_bitmap_buf, s);
         if (ret < 0) {
             error_setg(errp, "dump: failed to set dump_bitmap");
@@ -1274,6 +1304,7 @@ static void write_dump_pages(DumpState *s, Error **errp)
     uint8_t *buf;
     GuestPhysBlock *block_iter = NULL;
     uint64_t pfn_iter;
+    bool freebuf = false;
 
     /* get offset of page_desc and page_data in dump file */
     offset_desc = s->offset_page;
@@ -1314,7 +1345,7 @@ static void write_dump_pages(DumpState *s, Error **errp)
      * dump memory to vmcore page by page. zero page will all be resided in the
      * first page of page section
      */
-    while (get_next_page(&block_iter, &pfn_iter, &buf, s)) {
+    while (get_next_page(&block_iter, &pfn_iter, &buf, &freebuf, s)) {
         /* check zero page */
         if (buffer_is_zero(buf, s->dump_info.page_size)) {
             ret = write_cache(&page_desc, &pd_zero, sizeof(PageDescriptor),
@@ -1403,6 +1434,10 @@ static void write_dump_pages(DumpState *s, Error **errp)
                 error_setg(errp, "dump: failed to write page desc");
                 goto out;
             }
+            if (freebuf) {
+                g_free(buf);
+                freebuf = false;
+            }
         }
         s->written_size += s->dump_info.page_size;
     }
@@ -1419,6 +1454,10 @@ static void write_dump_pages(DumpState *s, Error **errp)
     }
 
 out:
+    if (freebuf) {
+        g_free(buf);
+    }
+
     free_data_cache(&page_desc);
     free_data_cache(&page_data);
 
-- 
2.37.2


