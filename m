Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F15C6C4F0C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:09:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf04k-0003Up-HH; Wed, 22 Mar 2023 11:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf04J-0002zq-3K
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:08:03 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf04C-0007Jn-QR
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:08:02 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso23930404pjb.0
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679497675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8SVCaZUmE/Km0+IIG6EiSCxwnpR9ibdQSVxm7qmuBg=;
 b=xw/9c7dWnXZ+TSfBjuEjcmhtRO0cMDYz6vsXm2WrJYTeXcf6qlYIu1OEMXJ/KpOhZP
 k7p1ufqW4ls1CsQEXE/IUG8DtJ0NqJPaMnnKrRPNjLX9GPsJyTIZ4AUbiqOxBNNYO4xy
 qPdptXr5gzDtm1Q/rLc78A+Xf+sQuACdiT6TiGubAL5CHEH+tPwE1IidVXn3A1abEZsO
 RMfDOu71FjF9t37Lfao/lwcM7kGVrhcTmUG9KrZt15fYTbka5nA/euoqOtA1Z5s3OT/h
 2pLPgH4woK0xzh5Jm4FI9ocPBtahdzwcgW77lGqXYJE955ynRWPt5+Y7ohR5+Rl3YfTJ
 Vjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679497675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8SVCaZUmE/Km0+IIG6EiSCxwnpR9ibdQSVxm7qmuBg=;
 b=R5Iz4w4Zyr/48SnaSJMkmJpibbj27OzCjvhpTI/Wv85F4g4oqRJ3Q2qP6Y1loif2iK
 k2JI+WyBlXAnWhXmVLAlkcXaSk3ZNtm75JShomHJ391r/R5np/xMw2S9FH6k/A6humEh
 XUEHiQVxf9mbi8KOdCb6uLsNEGZMuj0pMCNi6DWXYWfeLsfDbe6lo4XbIcDqvCYwE2Pd
 4a1mwfJKRob+qu6H4MwvR9phYYXfyX4BRR0kOQwkcqI3BZcCmjS4IIMHkN1SCcGFt/j4
 K+b0CZNpLS9Kb9NMuOlSaGlrQJi5kez/m9pkBcqAMIv51TSMgGhj0mSZXEEK/eZsLIVD
 5LMQ==
X-Gm-Message-State: AO0yUKUymtc2J94dSDpNdEcB19AXr6NG4y1UI5QbEigr7aQaJgwp42j/
 zFIJsSBKzcUI6YQtrqikNc0Sa2nnPq/KvzgPDOM=
X-Google-Smtp-Source: AK7set88WeevV3Tacp2T7nHTkOmvfLl7E6UPcn6VUF1KAMnZEUhI3f5lzmI8652zCakVBXT/Q0eZCw==
X-Received: by 2002:a17:902:7c11:b0:19e:872b:e844 with SMTP id
 x17-20020a1709027c1100b0019e872be844mr2574829pll.40.1679497675428; 
 Wed, 22 Mar 2023 08:07:55 -0700 (PDT)
Received: from stoup.. (24-113-166-229.wavecable.com. [24.113.166.229])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b0019339f3368asm10757555plo.3.2023.03.22.08.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 08:07:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 07/11] accel/tcg: Pass last not end to PAGE_FOR_EACH_TB
Date: Wed, 22 Mar 2023 08:07:40 -0700
Message-Id: <20230322150744.175010-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322150744.175010-1-richard.henderson@linaro.org>
References: <20230322150744.175010-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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


