Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B00F5F152C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 23:48:26 +0200 (CEST)
Received: from localhost ([::1]:56864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeNrt-0001Jk-B8
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 17:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNX7-0006yg-FH
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:57 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:40879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNX5-0005O0-IZ
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:57 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id h10so1877604qvq.7
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 14:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=afI0yCZR6Q1F/Wo9LMRayMhZyCvQGZF4DBhTJQzHUJ4=;
 b=BYXETcQXPfpyZazWDpDLtrnDUTDiSUgvaKcV6e0oPlZa6oRSRAIRLHUPlz7UkpePOK
 yNn1mCCZR1guJHlq0DdFsjY/U3IEbDO55rADf2sQLl4BhUeoNx+RMWePnv34PDWmgOd/
 HepArF5oomiMnRRdWeXnkCzdXzLtjJQX2zR629xfXM5AB4ayW2fzfeJCg8n6x0+qkg1W
 c3LTM3RiJLIQZVeBUZWqlRwzEXjoghk6BwGFQ7fddXk7dbylCxNtqL3hRwI1Kb4rhxFc
 R5dyUksQd8DoHGttCqA4zRGmKJLu9sN2lIJR/JPy9G19vUmJMsvHVxT5DmyFrCYt+zl4
 WCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=afI0yCZR6Q1F/Wo9LMRayMhZyCvQGZF4DBhTJQzHUJ4=;
 b=dkfHc052ssZcWAMMTTdDA1xikqggJx6pny8WIekydNfDEyG1fPTCc3Iur0azKL6pM0
 LvmuM3yhwzRi+Xm1J/qQQsx5e8Hm/zUlfatMDeQwu8NFIoj/mi2vr8s3E4tboHNOcQu0
 IlaJqxOmDLu719zF3lMmMmKK7A/nh3ZT4Nen+Dg389610yZ5iWDWAFtLuRYmDq96FT8v
 epHY+yGZVXbuNblowDd0XVIkxT1NYk7hqCHemaz0gEogRzXkRNKICDWu7XgYwhcyWvtN
 vDVwA3zmwqjOh2ICyeP0no3DcaaWfYeITZMa3SvXXMOSKAHZYStaEXLz3mmL8rZa8t4w
 s8UA==
X-Gm-Message-State: ACrzQf0xpU9Co9LJqCH09V+roDY1a8sjQOyLZyyNu1uoifx4iBZahfIl
 3g8MJmdnOrAcV9UY9CcmbuJX0746ruJT+w==
X-Google-Smtp-Source: AMsMyM5aSiPdrP4+e8C0XbBzG/g5ZcjbpbXfCvHJ3c3+Kp0VeYpViarCrx0L0Lei/qijuwKDBKwYLw==
X-Received: by 2002:ad4:5ecc:0:b0:4b1:7959:d988 with SMTP id
 jm12-20020ad45ecc000000b004b17959d988mr1322104qvb.117.1664573214898; 
 Fri, 30 Sep 2022 14:26:54 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05620a28d200b006ce813bb306sm3696370qkp.125.2022.09.30.14.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:26:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linux.org,
	alex.bennee@linux.org
Subject: [PATCH v6 13/18] accel/tcg: Do not align tb->page_addr[0]
Date: Fri, 30 Sep 2022 14:26:17 -0700
Message-Id: <20220930212622.108363-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930212622.108363-1-richard.henderson@linaro.org>
References: <20220930212622.108363-1-richard.henderson@linaro.org>
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
index 361078471b..a0db2d32a8 100644
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
index ca685f6ede..3a63113c41 100644
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


