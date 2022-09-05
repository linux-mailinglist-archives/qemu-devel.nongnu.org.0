Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818755AD377
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 15:11:26 +0200 (CEST)
Received: from localhost ([::1]:49184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVBsp-0008VU-6H
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 09:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oVBfs-0002mU-SZ
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:58:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oVBfo-0001mS-2j
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662382674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ib5OUHJ7s7dSVL7IHHZjpGVNNwEflqbPGN5wYRKu1cA=;
 b=G7xOemjjyCcK78Bv9o5mUywNjhaICA1y7OtA+2KpVdT76OWjO9Bs4QLJMaFQM6tmgj+POC
 F9hqbKWXQTWGMPwkCDbLfJrkcIfN8kJjxhVfBlZQTkMwLLPaj9/ahGxql9lmO6ftotQwZG
 w5Gzl5h0WnpruB5EyM+becZ5j853f/E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-KRvHihI-MGqJlSxERHFcow-1; Mon, 05 Sep 2022 08:57:50 -0400
X-MC-Unique: KRvHihI-MGqJlSxERHFcow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E567E3C216C0;
 Mon,  5 Sep 2022 12:57:49 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB6FA1415102;
 Mon,  5 Sep 2022 12:57:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qiaonuohan@cn.fujitsu.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 1/2] dump: simplify a bit kdump get_next_page()
Date: Mon,  5 Sep 2022 16:57:40 +0400
Message-Id: <20220905125741.95516-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220905125741.95516-1-marcandre.lureau@redhat.com>
References: <20220905125741.95516-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 dump/dump.c | 21 ++++++++-------------
 roms/SLOF   |  2 +-
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 4d9658ffa2..f465830371 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1110,17 +1110,11 @@ static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
     if (!block) {
         block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
         *blockptr = block;
-        assert((block->target_start & ~target_page_mask) == 0);
-        assert((block->target_end & ~target_page_mask) == 0);
-        *pfnptr = dump_paddr_to_pfn(s, block->target_start);
-        if (bufptr) {
-            *bufptr = block->host_addr;
-        }
-        return true;
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
@@ -1132,12 +1126,13 @@ static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
         if (!block) {
             return false;
         }
-        assert((block->target_start & ~target_page_mask) == 0);
-        assert((block->target_end & ~target_page_mask) == 0);
-        *pfnptr = dump_paddr_to_pfn(s, block->target_start);
+        addr = block->target_start;
         buf = block->host_addr;
     }
 
+    assert((block->target_start & ~target_page_mask) == 0);
+    assert((block->target_end & ~target_page_mask) == 0);
+    *pfnptr = dump_paddr_to_pfn(s, addr);
     if (bufptr) {
         *bufptr = buf;
     }
diff --git a/roms/SLOF b/roms/SLOF
index 6b6c16b4b4..5b4c5acdcd 160000
--- a/roms/SLOF
+++ b/roms/SLOF
@@ -1 +1 @@
-Subproject commit 6b6c16b4b40763507cf1f518096f3c3883c5cf2d
+Subproject commit 5b4c5acdcd552a4e1796aeca6bb700f6cbb0282d
-- 
2.37.2


