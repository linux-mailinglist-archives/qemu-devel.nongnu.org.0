Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648BC6BED67
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 16:56:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdCQB-0002nG-M7; Fri, 17 Mar 2023 11:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdCQA-0002mr-A3
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:55:10 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdCQ8-0007yc-2R
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:55:10 -0400
Received: by mail-pg1-x52b.google.com with SMTP id t83so3152793pgb.11
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 08:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679068505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oPbJjioypis0BlpLlmson9HA/Y6srBTH0pbyV6CP7q4=;
 b=BF0CyX6j9na4LCuKnZVVYA/P8IrEMgckmlwkIMmkJS4NB2E6H/O+Fbp3PAmarVBDjW
 f/lMjOY/4Ff2ReYqg/uG5E7xCfV2Uh7TP5jrkzKYujwhUJj4JYbCs7sLP92WJ0l8dv7w
 PJ//aDby+cEsfwrA/zE6Xvio9ZynBdVhwjDwbAYyRjB3VERZ4NKg5mueNNCAeKmvX8aN
 uh/UggaLeaw716gHmlBDMuAxuH1Or/JRkWOR2j1rqlwmtFwBSLxmsKVzXaDjQhExUnt8
 S6XvBk4pfWcp1w7FMtpRiqoRWFHB6vki11ETc79cZoRRSa9LZ+0hO7Rsy8SRAAtv5ub4
 UKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679068505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oPbJjioypis0BlpLlmson9HA/Y6srBTH0pbyV6CP7q4=;
 b=eZ6wEECDweDv/dnHVrUDGnr65HYWURzEYreOL5tIbHg2b1f6VnhakXIgur1eSSZ/0s
 Rv6f+bak2elKRqZUI6aXxJ/997QLOuNfIbCtfo2gheuLzkou/V+trj160iCmcT401uhh
 S4TKMV72Mh2yUmWVKP+z1Fh2k8szj7AGqOJdrEOVp/KdE2OUnk1Wx1XrkALKQ8CdxsmH
 28vRcOKWIF8nE/TdNyTs75Q0O0PVRF2gRcykylbxyG9DTWwgHy+nWJEuvEx1XJzvVXIV
 7P5kJcBHy/EPzVX3eJp/x1GoAt4DYYJYPA5xgGHOs1DY4xhV/e+On5UBWEp9caqTZPqA
 bKqg==
X-Gm-Message-State: AO0yUKVRmoALkkWa1Cx/Pukm4PUkApBVQMDUlzxgHyIFwjI3abhhQxjd
 XsDmUby34dJQo7Ifr+UVrKEz2PAlyOMN5ZNZODU=
X-Google-Smtp-Source: AK7set+MzHQZDCgYZEYlLE7N20qfeDiMfFbUa9vrZbDDrJMmPJaDttEm6Z1SKMHgriilKpXOMMu4YA==
X-Received: by 2002:a62:3896:0:b0:626:26f:5e4b with SMTP id
 f144-20020a623896000000b00626026f5e4bmr4256885pfa.1.1679068505564; 
 Fri, 17 Mar 2023 08:55:05 -0700 (PDT)
Received: from stoup.. (96-82-119-43-static.hfc.comcastbusiness.net.
 [96.82.119.43]) by smtp.gmail.com with ESMTPSA id
 s5-20020a656445000000b004fb3e5681cesm1668986pgv.20.2023.03.17.08.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 08:55:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 6/9] accel/tcg: Pass last not end to PAGE_FOR_EACH_TB
Date: Fri, 17 Mar 2023 08:54:52 -0700
Message-Id: <20230317155455.341843-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230317155455.341843-1-richard.henderson@linaro.org>
References: <20230317155455.341843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
index 7246c1c46b..2c2e887196 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -126,29 +126,29 @@ static void tb_remove(TranslationBlock *tb)
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
@@ -319,7 +319,7 @@ struct page_collection {
 };
 
 typedef int PageForEachNext;
-#define PAGE_FOR_EACH_TB(start, end, pagedesc, tb, n) \
+#define PAGE_FOR_EACH_TB(start, last, pagedesc, tb, n) \
     TB_FOR_EACH_TAGGED((pagedesc)->first_tb, tb, n, page_next)
 
 #ifdef CONFIG_DEBUG_TCG
@@ -994,10 +994,11 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
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
@@ -1029,6 +1030,7 @@ bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
     bool current_tb_modified;
     TranslationBlock *tb;
     PageForEachNext n;
+    tb_page_addr_t last;
 
     /*
      * Without precise smc semantics, or when outside of a TB,
@@ -1045,10 +1047,11 @@ bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
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
@@ -1090,12 +1093,13 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
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


