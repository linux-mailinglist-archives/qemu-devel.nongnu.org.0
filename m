Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5AC6CCDCF
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 01:00:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phIGg-0006sU-BI; Tue, 28 Mar 2023 18:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGe-0006rv-EX
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:16 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGc-00073k-NL
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:16 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso16695170pjb.3
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 15:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680044293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8SVCaZUmE/Km0+IIG6EiSCxwnpR9ibdQSVxm7qmuBg=;
 b=EDyXLAKt8sR4o7bh2k1Tpgf0oK5fbBojrpiNHQ4HT6EkbcQVJOmWANSrDu5zm1eb+z
 dOePtEItL3aTXdmcLVuc47AkpJaum09IpbQItK4N+9LR45sxDSf7nF5RVF4hIPYFg9F7
 Hb2srV0WIyHc9L36qrh2XNOaAcoBgHPCzeo1ODVS5KkihvuGgvxC4szY4+HgR7NeT58w
 ORuhD5BiAmnuXBM+D57BEW/5/gKbIQSaPnwUouWno72+EvjKmA7Omn2k14Uq9XVboixq
 KIO060CiT0iofk2dBdtcGBH9hOjfxA7+gxBR+jykWcukfGOJrODCwbif+uSqTpfsnSvB
 2/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680044293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8SVCaZUmE/Km0+IIG6EiSCxwnpR9ibdQSVxm7qmuBg=;
 b=0lgTlxqmfu2NGiec9Hae5c+xllR896uPyUYq9B4N436l4/cyD5y9lv3XQg25X8lykM
 uwzEi+51cUBImT7S/jAREE4sOlwqCJFDLT+HFDzThYBh2KO62oHisanONrMvN1UU7z7t
 CP0nXB927pGcw9syDYvtamXNmioTBqQrnBvhLdL19XmUocmS+Cjq5sk+WJaJy/zDUr/v
 z6Op01KSOugSQa5W2EjVK3PN4byO5qBfyPy6AC5uk9IM329n0BlXb4L/kbztNNeSA+Qi
 GoHqEUifFk6/R4UiaxyUD2yScQqdyLcwHTldP+wuElvpLBCsptn7If+RuO+jJEVSh+ZT
 xC9w==
X-Gm-Message-State: AAQBX9f2jssQ1VqO2DDI5j46j211InN8YKv7aXhCwehgbU6PQegl9V+4
 /gaHo2rM/bU/uP0mvWRnfsMmAPuPvDj7E27zIzU=
X-Google-Smtp-Source: AKy350YSPf3Ekgdyq4K9H9Pn9a8KFG53wimV5cSmbvlwBmAfwoDFhpL63QhcCVCBT3qNqRO/r3J/HA==
X-Received: by 2002:a17:90a:1953:b0:240:973d:b431 with SMTP id
 19-20020a17090a195300b00240973db431mr5945113pjh.42.1680044293438; 
 Tue, 28 Mar 2023 15:58:13 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:c23d:b6:6be1:f147])
 by smtp.gmail.com with ESMTPSA id
 jw1-20020a170903278100b0019cd1ee1523sm21670633plb.30.2023.03.28.15.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:58:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 06/15] accel/tcg: Pass last not end to PAGE_FOR_EACH_TB
Date: Tue, 28 Mar 2023 15:57:57 -0700
Message-Id: <20230328225806.2278728-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328225806.2278728-1-richard.henderson@linaro.org>
References: <20230328225806.2278728-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Pass the address of the last byte to be changed, rather than
the first address past the last byte.  This avoids overflow
when the last page of the address space is involved.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-maint.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index a173db17e6..04d2751bb6 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -127,29 +127,29 @@ static void tb_remove(TranslationBlock *tb)
 }
 
 /* TODO: For now, still shared with translate-all.c for system mode. */
-#define PAGE_FOR_EACH_TB(start, end, pagedesc, T, N)    \
-    for (T = foreach_tb_first(start, end),              \
-         N = foreach_tb_next(T, start, end);            \
+#define PAGE_FOR_EACH_TB(start, last, pagedesc, T, N)   \
+    for (T = foreach_tb_first(start, last),             \
+         N = foreach_tb_next(T, start, last);           \
          T != NULL;                                     \
-         T = N, N = foreach_tb_next(N, start, end))
+         T = N, N = foreach_tb_next(N, start, last))
 
 typedef TranslationBlock *PageForEachNext;
 
 static PageForEachNext foreach_tb_first(tb_page_addr_t start,
-                                        tb_page_addr_t end)
+                                        tb_page_addr_t last)
 {
-    IntervalTreeNode *n = interval_tree_iter_first(&tb_root, start, end - 1);
+    IntervalTreeNode *n = interval_tree_iter_first(&tb_root, start, last);
     return n ? container_of(n, TranslationBlock, itree) : NULL;
 }
 
 static PageForEachNext foreach_tb_next(PageForEachNext tb,
                                        tb_page_addr_t start,
-                                       tb_page_addr_t end)
+                                       tb_page_addr_t last)
 {
     IntervalTreeNode *n;
 
     if (tb) {
-        n = interval_tree_iter_next(&tb->itree, start, end - 1);
+        n = interval_tree_iter_next(&tb->itree, start, last);
         if (n) {
             return container_of(n, TranslationBlock, itree);
         }
@@ -320,7 +320,7 @@ struct page_collection {
 };
 
 typedef int PageForEachNext;
-#define PAGE_FOR_EACH_TB(start, end, pagedesc, tb, n) \
+#define PAGE_FOR_EACH_TB(start, last, pagedesc, tb, n) \
     TB_FOR_EACH_TAGGED((pagedesc)->first_tb, tb, n, page_next)
 
 #ifdef CONFIG_DEBUG_TCG
@@ -995,10 +995,11 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
 {
     TranslationBlock *tb;
     PageForEachNext n;
+    tb_page_addr_t last = end - 1;
 
     assert_memory_lock();
 
-    PAGE_FOR_EACH_TB(start, end, unused, tb, n) {
+    PAGE_FOR_EACH_TB(start, last, unused, tb, n) {
         tb_phys_invalidate__locked(tb);
     }
 }
@@ -1030,6 +1031,7 @@ bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
     bool current_tb_modified;
     TranslationBlock *tb;
     PageForEachNext n;
+    tb_page_addr_t last;
 
     /*
      * Without precise smc semantics, or when outside of a TB,
@@ -1046,10 +1048,11 @@ bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
     assert_memory_lock();
     current_tb = tcg_tb_lookup(pc);
 
+    last = addr | ~TARGET_PAGE_MASK;
     addr &= TARGET_PAGE_MASK;
     current_tb_modified = false;
 
-    PAGE_FOR_EACH_TB(addr, addr + TARGET_PAGE_SIZE, unused, tb, n) {
+    PAGE_FOR_EACH_TB(addr, last, unused, tb, n) {
         if (current_tb == tb &&
             (tb_cflags(current_tb) & CF_COUNT_MASK) != 1) {
             /*
@@ -1091,12 +1094,13 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
     bool current_tb_modified = false;
     TranslationBlock *current_tb = retaddr ? tcg_tb_lookup(retaddr) : NULL;
 #endif /* TARGET_HAS_PRECISE_SMC */
+    tb_page_addr_t last G_GNUC_UNUSED = end - 1;
 
     /*
      * We remove all the TBs in the range [start, end[.
      * XXX: see if in some cases it could be faster to invalidate all the code
      */
-    PAGE_FOR_EACH_TB(start, end, p, tb, n) {
+    PAGE_FOR_EACH_TB(start, last, p, tb, n) {
         /* NOTE: this is subtle as a TB may span two physical pages */
         if (n == 0) {
             /* NOTE: tb_end may be after the end of the page, but
-- 
2.34.1


