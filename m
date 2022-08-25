Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEB25A11FB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 15:24:37 +0200 (CEST)
Received: from localhost ([::1]:59164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRCqZ-0005rQ-LJ
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 09:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oRCnW-0002Jp-NZ
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 09:21:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oRCnT-0000rI-Kt
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 09:21:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661433681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6RsaNSlRnxhrIkdYMtpbZcR2E/o687z00sVkGUTKAmg=;
 b=F3Dr8XR2UvToxWuFj/ZeIaljZafknNmectYyiYUAaHAb+TqVrl/GR78fzBIFliZ1uIQXa5
 fCEFEeFFqRpfTavUMGH305CyxxnN0dBQVdSWy87geN/3HzpMKa2vBRgJNaoxhsdgOIYmhw
 qk8dgi2i5artaNy/pU3oSqT+k9QcK/M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-6q4ISBs7OF6DoZSaPlAU3g-1; Thu, 25 Aug 2022 09:21:20 -0400
X-MC-Unique: 6q4ISBs7OF6DoZSaPlAU3g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37B0F38149A8;
 Thu, 25 Aug 2022 13:21:20 +0000 (UTC)
Received: from localhost (unknown [10.39.208.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44239492C3B;
 Thu, 25 Aug 2022 13:21:18 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qiaonuohan@cn.fujitsu.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [PATCH 1/2] dump: simplify a bit kdump get_next_page()
Date: Thu, 25 Aug 2022 17:21:09 +0400
Message-Id: <20220825132110.1500330-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220825132110.1500330-1-marcandre.lureau@redhat.com>
References: <20220825132110.1500330-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

This should be functionally equivalent, but slightly easier to read,
with simplified paths and checks at the end of the function.

The following patch is a major rewrite to get rid of the assert().

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 dump/dump.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 4d9658ffa2..18f06cffe2 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1107,37 +1107,31 @@ static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
     uint8_t *buf;
 
     /* block == NULL means the start of the iteration */
-    if (!block) {
-        block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
-        *blockptr = block;
-        assert((block->target_start & ~target_page_mask) == 0);
-        assert((block->target_end & ~target_page_mask) == 0);
-        *pfnptr = dump_paddr_to_pfn(s, block->target_start);
-        if (bufptr) {
-            *bufptr = block->host_addr;
-        }
-        return true;
+    if (block == NULL) {
+        *blockptr = block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
+        addr = block->target_start;
+    } else {
+        addr = dump_pfn_to_paddr(s, *pfnptr + 1);
     }
-
-    *pfnptr = *pfnptr + 1;
-    addr = dump_pfn_to_paddr(s, *pfnptr);
+    assert(block != NULL);
 
     if ((addr >= block->target_start) &&
         (addr + s->dump_info.page_size <= block->target_end)) {
         buf = block->host_addr + (addr - block->target_start);
     } else {
         /* the next page is in the next block */
-        block = QTAILQ_NEXT(block, next);
-        *blockptr = block;
+        *blockptr = block = QTAILQ_NEXT(block, next);
         if (!block) {
             return false;
         }
-        assert((block->target_start & ~target_page_mask) == 0);
-        assert((block->target_end & ~target_page_mask) == 0);
-        *pfnptr = dump_paddr_to_pfn(s, block->target_start);
+        addr = block->target_start;
         buf = block->host_addr;
     }
 
+    /* those checks are going away next */
+    assert((block->target_start & ~target_page_mask) == 0);
+    assert((block->target_end & ~target_page_mask) == 0);
+    *pfnptr = dump_paddr_to_pfn(s, addr);
     if (bufptr) {
         *bufptr = buf;
     }
-- 
2.37.2


