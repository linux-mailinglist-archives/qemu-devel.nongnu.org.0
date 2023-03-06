Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3D16AB493
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 03:14:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ0Lm-0003KL-Et; Sun, 05 Mar 2023 21:13:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Lk-0003FQ-Lj
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:16 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Li-0005zN-Ot
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:16 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so11776391pjh.0
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 18:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678068794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=E6BOJx4r1pYVT6Z+5FzgOYkiXq4HsL5PEr5po56LIKU=;
 b=TEoGNawG74Fb/VR3i5ZHWnjlMBzlwP/7llGFD3QLD/3Dk23+mmHIzPcZpFQo9RQpea
 VbB655ZbOHm85akL0OI1HW/G1CeibN6dUzEqDRT3OeIO39/7VJFauyETzrsi+mx7SVxz
 csVxkm/cSSGh/TJyypwZnnB9DxeUg6cXmoLnuvJW8flD8rtZyzmLcd1v0rpxFB+Rg2wA
 C5BsVeqMtJS+cdm6pPQQJZN9mfrGagc5BdRfOJPKVVk0Kc3cjTAr0taEZZX2yhxuCyC5
 v1MizcA9nRP9qMOw4WtWTxGiP4uqYFu9edwXWw4I/dvV3rFOrL5sygSrAZcFw9DJIbk2
 KW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678068794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E6BOJx4r1pYVT6Z+5FzgOYkiXq4HsL5PEr5po56LIKU=;
 b=KcuqKy71z8RW5KSJWWDGx1WEKniDdQQ3wFW3+dPjMLJ74sFxdg5YE25wZjSi2sZ3Nb
 JaxHmFkHsR33SfYcDWTkgPCBOXCkP4wPbENJlx/ihW4UmQdyMXZi0UFl4tY6SegOarnA
 uEPQiC9cSwH9WmN0ZpfnglxkBx8CzC5BihplCXEsHeQ0t77sq4sXyqlRUjbQZPXmDt+p
 4dKU52ho+Aw+GWYctSR4P7ph7X8QiD2WBn7D1zIdMaejIYUcV1Ts11VB9za35/nWEy9W
 XskvDTuxepmCkzET/G6gZVFIZuGD0c78t/lKlB4qK/m7UA3ENXDujPwoQM34Fzp6S4fJ
 jx+w==
X-Gm-Message-State: AO0yUKVcyiMJ60lRcliWgItR/2FfWzH/9LiHofqDbr4Bs3icM85L1bls
 LDevJ4YISYm1LyORxHfiXW0AvNo+6lXQ3v9aOfOmmw==
X-Google-Smtp-Source: AK7set9r4jzRfwoe0G5C7oX/rUzmACNJSt2icrT9wyX4ZWrNkbOVcXf40slXSrOzk4V2gOKm9MC13g==
X-Received: by 2002:a05:6a20:7d9d:b0:cd:91bc:a9af with SMTP id
 v29-20020a056a207d9d00b000cd91bca9afmr10380897pzj.58.1678068793980; 
 Sun, 05 Mar 2023 18:13:13 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a630e12000000b005030136314dsm5048434pgl.71.2023.03.05.18.13.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 18:13:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] accel/tcg: Pass last not end to PAGE_FOR_EACH_TB
Date: Sun,  5 Mar 2023 18:13:04 -0800
Message-Id: <20230306021307.1879483-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306021307.1879483-1-richard.henderson@linaro.org>
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-maint.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index efefa08ee1..745912e60a 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -125,29 +125,29 @@ static void tb_remove(TranslationBlock *tb)
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
@@ -318,7 +318,7 @@ struct page_collection {
 };
 
 typedef int PageForEachNext;
-#define PAGE_FOR_EACH_TB(start, end, pagedesc, tb, n) \
+#define PAGE_FOR_EACH_TB(start, last, pagedesc, tb, n) \
     TB_FOR_EACH_TAGGED((pagedesc)->first_tb, tb, n, page_next)
 
 #ifdef CONFIG_DEBUG_TCG
@@ -993,10 +993,11 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
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
@@ -1028,6 +1029,7 @@ bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
     bool current_tb_modified;
     TranslationBlock *tb;
     PageForEachNext n;
+    tb_page_addr_t last;
 
     /*
      * Without precise smc semantics, or when outside of a TB,
@@ -1044,10 +1046,11 @@ bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
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
@@ -1089,12 +1092,13 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
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


