Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4525E929E
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:13:11 +0200 (CEST)
Received: from localhost ([::1]:48288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocPZN-0000Qt-U8
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPF8-0003FR-95
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:52:16 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:34324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPF6-0000OQ-IR
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:52:14 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id ml1so2809669qvb.1
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=jW51FLpECaelauF3tfqNEO7fiQEkSJtAS7jBmQcUrE4=;
 b=wqFoxuI75fIDvxqnAeSpT7PpV9Qo2aUPcOQzALXG7IczNGpb/QUACeFiD50yUshbKr
 +TNSA7sF/mlq6Sp/lzptyPw9awkJOFFooH9xGq5NVzBcILbeUjPkE3ousJe1KhnN9tsr
 bZ+M/t0+oWu5lxkFuB0QadQitbWIHUo51zZ3BvKuwUxXNihaZusOI2rgzwTSaN3riLQs
 ZxfZV80GGm3FuX01Sp2/w+JibQFm3NtG92QzNh34PEtZcSq9BF+Acd8vkgMCJRYI0+fT
 HMfVV5TRAA+EUjGsrP027o8eBbbR3gdnJjqFLzqL3dHLkKupoZ8Hp8oXTpFS6GlUy6W0
 6JmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jW51FLpECaelauF3tfqNEO7fiQEkSJtAS7jBmQcUrE4=;
 b=RdWPUj+Ip3hEzAWMZozycV/UDwWlz7c/8J1/8XBVd4Fx94qKAs3yCB8oGid3KfaMpR
 SwfWWKBLuc3FEOlCgvQAGU4HIY9EbJzNjHZKxtA58H4776C73bT4IHWD7fnz4HaPCmPF
 nz2l5ATwGewi+1wFJj7Rkb3LKtvSIlUxIJkdxVifqXfQjD4/Bi+F5+v8Poxv99M3fuY4
 7RMB/teS9TQCyk9Th2rFLXoaO8XtcKeJG+L5RTfL+P9bKLMpyQyz2uDtZbjm9UnZsaYX
 i3I8/oWamCnfJDdR8cqne5RMGQEDCXiDyTqq50ONCCh/rfgUpuvlaBFTelouwJJqbYKC
 fqaA==
X-Gm-Message-State: ACrzQf0e5LR5qxCqzmNGIdckXTmYwzqlRdrt6ZUopWAId2a2xtm6RYWz
 TqZfbeN9Z62BOlJKsfpYKgZH9aDSNY265A==
X-Google-Smtp-Source: AMsMyM49OBOlXFzjJGqPHFGbtuuY8cl5KE+ROX6v8Gu7YIqVnIi4Mfaz1mJCz5X744A51VCONTEPSw==
X-Received: by 2002:a05:6214:300a:b0:4ad:61d6:5c15 with SMTP id
 ke10-20020a056214300a00b004ad61d65c15mr13718166qvb.125.1664103131659; 
 Sun, 25 Sep 2022 03:52:11 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a9:5c0e:1ec2:d482:4986:8538])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a0c4f00b006cf19068261sm10061132qki.116.2022.09.25.03.52.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 03:52:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/17] accel/tcg: Do not align tb->page_addr[0]
Date: Sun, 25 Sep 2022 10:51:20 +0000
Message-Id: <20220925105124.82033-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925105124.82033-1-richard.henderson@linaro.org>
References: <20220925105124.82033-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let tb->page_addr[0] contain the offset within the page of the
start of the translation block.  We need to recover this value
anyway at various points, and it is easier to discard the page
offset when it's not needed, which happens naturally via the
existing find_page shift.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c      | 16 ++++++++--------
 accel/tcg/cputlb.c        |  3 ++-
 accel/tcg/translate-all.c |  9 +++++----
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5f43b9769a..dd58a144a8 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -174,7 +174,7 @@ struct tb_desc {
     target_ulong pc;
     target_ulong cs_base;
     CPUArchState *env;
-    tb_page_addr_t phys_page1;
+    tb_page_addr_t page_addr0;
     uint32_t flags;
     uint32_t cflags;
     uint32_t trace_vcpu_dstate;
@@ -186,7 +186,7 @@ static bool tb_lookup_cmp(const void *p, const void *d)
     const struct tb_desc *desc = d;
 
     if (tb->pc == desc->pc &&
-        tb->page_addr[0] == desc->phys_page1 &&
+        tb->page_addr[0] == desc->page_addr0 &&
         tb->cs_base == desc->cs_base &&
         tb->flags == desc->flags &&
         tb->trace_vcpu_dstate == desc->trace_vcpu_dstate &&
@@ -195,8 +195,8 @@ static bool tb_lookup_cmp(const void *p, const void *d)
         if (tb->page_addr[1] == -1) {
             return true;
         } else {
-            tb_page_addr_t phys_page2;
-            target_ulong virt_page2;
+            tb_page_addr_t phys_page1;
+            target_ulong virt_page1;
 
             /*
              * We know that the first page matched, and an otherwise valid TB
@@ -207,9 +207,9 @@ static bool tb_lookup_cmp(const void *p, const void *d)
              * is different for the new TB.  Therefore any exception raised
              * here by the faulting lookup is not premature.
              */
-            virt_page2 = TARGET_PAGE_ALIGN(desc->pc);
-            phys_page2 = get_page_addr_code(desc->env, virt_page2);
-            if (tb->page_addr[1] == phys_page2) {
+            virt_page1 = TARGET_PAGE_ALIGN(desc->pc);
+            phys_page1 = get_page_addr_code(desc->env, virt_page1);
+            if (tb->page_addr[1] == phys_page1) {
                 return true;
             }
         }
@@ -235,7 +235,7 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
     if (phys_pc == -1) {
         return NULL;
     }
-    desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
+    desc.page_addr0 = phys_pc;
     h = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
     return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
 }
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 01a89b4a1f..f5e6ca2da2 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -951,7 +951,8 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
    can be detected */
 void tlb_protect_code(ram_addr_t ram_addr)
 {
-    cpu_physical_memory_test_and_clear_dirty(ram_addr, TARGET_PAGE_SIZE,
+    cpu_physical_memory_test_and_clear_dirty(ram_addr & TARGET_PAGE_MASK,
+                                             TARGET_PAGE_SIZE,
                                              DIRTY_MEMORY_CODE);
 }
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 69f39d669d..f429d33981 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1167,7 +1167,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     qemu_spin_unlock(&tb->jmp_lock);
 
     /* remove the TB from the hash list */
-    phys_pc = tb->page_addr[0] + (tb->pc & ~TARGET_PAGE_MASK);
+    phys_pc = tb->page_addr[0];
     h = tb_hash_func(phys_pc, tb->pc, tb->flags, orig_cflags,
                      tb->trace_vcpu_dstate);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
@@ -1291,7 +1291,7 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
      * we can only insert TBs that are fully initialized.
      */
     page_lock_pair(&p, phys_pc, &p2, phys_page2, true);
-    tb_page_add(p, tb, 0, phys_pc & TARGET_PAGE_MASK);
+    tb_page_add(p, tb, 0, phys_pc);
     if (p2) {
         tb_page_add(p2, tb, 1, phys_page2);
     } else {
@@ -1644,11 +1644,12 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
         if (n == 0) {
             /* NOTE: tb_end may be after the end of the page, but
                it is not a problem */
-            tb_start = tb->page_addr[0] + (tb->pc & ~TARGET_PAGE_MASK);
+            tb_start = tb->page_addr[0];
             tb_end = tb_start + tb->size;
         } else {
             tb_start = tb->page_addr[1];
-            tb_end = tb_start + ((tb->pc + tb->size) & ~TARGET_PAGE_MASK);
+            tb_end = tb_start + ((tb->page_addr[0] + tb->size)
+                                 & ~TARGET_PAGE_MASK);
         }
         if (!(tb_end <= start || tb_start >= end)) {
 #ifdef TARGET_HAS_PRECISE_SMC
-- 
2.34.1


