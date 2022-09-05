Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2C75AD383
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 15:14:56 +0200 (CEST)
Received: from localhost ([::1]:42998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVBw9-0005kK-TK
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 09:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oVBfz-0002pd-42
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:58:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oVBfs-0001n2-F4
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662382679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33MY53MhzkX7uol+cjzwlbU7yfO1koJ8zJLuzEguvNk=;
 b=EuMtFCnE+vqMLuDW5y23inT6wS7dYHHrzj8qt2WKpP3AazqvaGlYgkmDhZFUFhMXug2uSt
 cvoRneF45/EGG2ZUJzvSvB97Se/wYwhw1ktnVHR2uB2lRGAoiC/1DsgSQi3pcooCDF0OHG
 FF1kBU0fHif9Ljh36JpjgMkl/6FX27g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-HpWXyTynNaWOnqwAp2o1Gw-1; Mon, 05 Sep 2022 08:57:54 -0400
X-MC-Unique: HpWXyTynNaWOnqwAp2o1Gw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DA22805AF5;
 Mon,  5 Sep 2022 12:57:54 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9D9EC15BBD;
 Mon,  5 Sep 2022 12:57:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qiaonuohan@cn.fujitsu.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 2/2] dump: fix kdump to work over non-aligned blocks
Date: Mon,  5 Sep 2022 16:57:41 +0400
Message-Id: <20220905125741.95516-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220905125741.95516-1-marcandre.lureau@redhat.com>
References: <20220905125741.95516-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
encounters non aligned addresses, it will try to fill a page provided by
the caller.

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
 dump/dump.c | 79 +++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 56 insertions(+), 23 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index f465830371..500357bafe 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1094,50 +1094,81 @@ static uint64_t dump_pfn_to_paddr(DumpState *s, uint64_t pfn)
 }
 
 /*
- * exam every page and return the page frame number and the address of the page.
- * bufptr can be NULL. note: the blocks here is supposed to reflect guest-phys
- * blocks, so block->target_start and block->target_end should be interal
- * multiples of the target page size.
+ * Return the page frame number and the page content in *bufptr. bufptr can be
+ * NULL. If not NULL, *bufptr must contains a target page size of pre-allocated
+ * memory. This is not necessarily the memory returned.
  */
 static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
                           uint8_t **bufptr, DumpState *s)
 {
     GuestPhysBlock *block = *blockptr;
-    hwaddr addr, target_page_mask = ~((hwaddr)s->dump_info.page_size - 1);
-    uint8_t *buf;
+    uint32_t page_size = s->dump_info.page_size;
+    uint8_t *buf = NULL, *hbuf;
+    hwaddr addr;
 
     /* block == NULL means the start of the iteration */
     if (!block) {
         block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
         *blockptr = block;
         addr = block->target_start;
+        *pfnptr = dump_paddr_to_pfn(s, addr);
     } else {
-        addr = dump_pfn_to_paddr(s, *pfnptr + 1);
+        *pfnptr += 1;
+        addr = dump_pfn_to_paddr(s, *pfnptr);
     }
     assert(block != NULL);
 
-    if ((addr >= block->target_start) &&
-        (addr + s->dump_info.page_size <= block->target_end)) {
-        buf = block->host_addr + (addr - block->target_start);
-    } else {
-        /* the next page is in the next block */
-        block = QTAILQ_NEXT(block, next);
-        *blockptr = block;
-        if (!block) {
-            return false;
+    while (1) {
+        if (addr >= block->target_start && addr < block->target_end) {
+            size_t n = MIN(block->target_end - addr, page_size - addr % page_size);
+            hbuf = block->host_addr + (addr - block->target_start);
+            if (!buf) {
+                if (n == page_size) {
+                    /* this is a whole target page, go for it */
+                    assert(addr % page_size == 0);
+                    buf = hbuf;
+                    break;
+                } else if (bufptr) {
+                    assert(*bufptr);
+                    buf = *bufptr;
+                    memset(buf, 0, page_size);
+                } else {
+                    return true;
+                }
+            }
+
+            memcpy(buf + addr % page_size, hbuf, n);
+            addr += n;
+            if (addr % page_size == 0) {
+                /* we filled up the page */
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
+                if (buf) {
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
 
-    assert((block->target_start & ~target_page_mask) == 0);
-    assert((block->target_end & ~target_page_mask) == 0);
-    *pfnptr = dump_paddr_to_pfn(s, addr);
     if (bufptr) {
         *bufptr = buf;
     }
 
-    return true;
+    return buf != NULL;
 }
 
 static void write_dump_bitmap(DumpState *s, Error **errp)
@@ -1275,6 +1306,7 @@ static void write_dump_pages(DumpState *s, Error **errp)
     uint8_t *buf;
     GuestPhysBlock *block_iter = NULL;
     uint64_t pfn_iter;
+    g_autofree uint8_t *page = NULL;
 
     /* get offset of page_desc and page_data in dump file */
     offset_desc = s->offset_page;
@@ -1310,12 +1342,13 @@ static void write_dump_pages(DumpState *s, Error **errp)
     }
 
     offset_data += s->dump_info.page_size;
+    page = g_malloc(s->dump_info.page_size);
 
     /*
      * dump memory to vmcore page by page. zero page will all be resided in the
      * first page of page section
      */
-    while (get_next_page(&block_iter, &pfn_iter, &buf, s)) {
+    for (buf = page; get_next_page(&block_iter, &pfn_iter, &buf, s); buf = page) {
         /* check zero page */
         if (buffer_is_zero(buf, s->dump_info.page_size)) {
             ret = write_cache(&page_desc, &pd_zero, sizeof(PageDescriptor),
-- 
2.37.2


