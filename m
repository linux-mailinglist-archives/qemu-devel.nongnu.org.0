Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E7B5F5F90
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:22:58 +0200 (CEST)
Received: from localhost ([::1]:50738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHTM-00073e-CK
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHII-0005YD-9W
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:30 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIG-0006xM-3j
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:30 -0400
Received: by mail-pl1-x629.google.com with SMTP id u24so505898plq.12
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=YOGYOig0+dCLVlylApGJJjbo/c533HaL1b5I4rINT1c=;
 b=OJYyza5CXXjCorkRAa+le1p4YE2hvIGvhJcaYNaJfWpoRlk08lC6fFyr6QICQL6cKI
 FryEiu3yZgf53yRcIEaH/xXbzQ/u7ALLcVXLH1hdZ7BuujcZv6RnTGQO6H8PCUknR66V
 5ne67dLhN1gLz8YKCRJxUtizLWpNtWTETwGEzcWRZ90gG+MdSGymtSwpa49pdzXhpC2g
 9pKGKgsFyzyh2wppx08npu1Z64JEL8QojZzS399uwZ5jENgZRksYY5rDZS2ghi0whhD0
 ObRkveBYVgE6Or3g2AAxYO/YmlvT8Fd16AZaEogNbTgE7pcXwZN+kYycKTLcY7O6orIb
 eYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YOGYOig0+dCLVlylApGJJjbo/c533HaL1b5I4rINT1c=;
 b=j9ixt1w9lJ2Axufi/a4DEiS01iuhsSbX2TahuVQS/RUsaSdUbjZHICBSEycyfW29uM
 sLUFtMh/WkBwgihG3Q4S6TkO1bnWXlxGHUbIPYO5oma75Sluds8uqTOEuJO6yUhxsTOq
 oyyIkmEzeqGGbeQX3MVGC5gm7/KMA1Drl4bOqEeGnfGm3B5BzO5/QYYhd3xIY/ALErIZ
 qQ1gPxBlVbVWRokeFBIpvkfiMkVQ9kUUwRcTCHtABK57vghwwtnbA85VDd+wZGyF0adO
 wfo9StYcw82AlN/QF6h6FQQbwSR7jzoVVaJiVt+BxZyjDqXSXrZkbX/3B+/uVGIVrlwt
 NyHw==
X-Gm-Message-State: ACrzQf0xk0ZfTdnzAJRH95234HL6EGVNCsHeSNLHJAkFy9bmga3oLwJw
 Z0JjnKOQZr1LNsba2DTOO6xka12+DXkMJw==
X-Google-Smtp-Source: AMsMyM4VW0YGs7ld/owY0iZ9aLjLsStnCvyXufk7HW2q+UKhe9CnNk+CRPa0VWUBj0DFKdIx3+uLwg==
X-Received: by 2002:a17:902:a9c6:b0:178:b2d4:f8b2 with SMTP id
 b6-20020a170902a9c600b00178b2d4f8b2mr2633464plr.79.1665025886668; 
 Wed, 05 Oct 2022 20:11:26 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 09/24] accel/tcg: Introduce tb_{set_}page_addr{0,1}
Date: Wed,  5 Oct 2022 20:10:58 -0700
Message-Id: <20221006031113.1139454-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

This data structure will be replaced for user-only: add accessors.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   | 22 ++++++++++++++++++++++
 accel/tcg/cpu-exec.c      |  9 +++++----
 accel/tcg/tb-maint.c      | 29 +++++++++++++++--------------
 accel/tcg/translate-all.c | 16 ++++++++--------
 accel/tcg/translator.c    |  9 +++++----
 5 files changed, 55 insertions(+), 30 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index b5bde1b56a..5900f4637b 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -610,6 +610,28 @@ static inline uint32_t tb_cflags(const TranslationBlock *tb)
     return qatomic_read(&tb->cflags);
 }
 
+static inline tb_page_addr_t tb_page_addr0(const TranslationBlock *tb)
+{
+    return tb->page_addr[0];
+}
+
+static inline tb_page_addr_t tb_page_addr1(const TranslationBlock *tb)
+{
+    return tb->page_addr[1];
+}
+
+static inline void tb_set_page_addr0(TranslationBlock *tb,
+                                     tb_page_addr_t addr)
+{
+    tb->page_addr[0] = addr;
+}
+
+static inline void tb_set_page_addr1(TranslationBlock *tb,
+                                     tb_page_addr_t addr)
+{
+    tb->page_addr[1] = addr;
+}
+
 /* current cflags for hashing/comparison */
 uint32_t curr_cflags(CPUState *cpu);
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index f9e5cc9ba0..70eb8a58d9 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -187,13 +187,14 @@ static bool tb_lookup_cmp(const void *p, const void *d)
     const struct tb_desc *desc = d;
 
     if ((TARGET_TB_PCREL || tb_pc(tb) == desc->pc) &&
-        tb->page_addr[0] == desc->page_addr0 &&
+        tb_page_addr0(tb) == desc->page_addr0 &&
         tb->cs_base == desc->cs_base &&
         tb->flags == desc->flags &&
         tb->trace_vcpu_dstate == desc->trace_vcpu_dstate &&
         tb_cflags(tb) == desc->cflags) {
         /* check next page if needed */
-        if (tb->page_addr[1] == -1) {
+        tb_page_addr_t tb_phys_page1 = tb_page_addr1(tb);
+        if (tb_phys_page1 == -1) {
             return true;
         } else {
             tb_page_addr_t phys_page1;
@@ -210,7 +211,7 @@ static bool tb_lookup_cmp(const void *p, const void *d)
              */
             virt_page1 = TARGET_PAGE_ALIGN(desc->pc);
             phys_page1 = get_page_addr_code(desc->env, virt_page1);
-            if (tb->page_addr[1] == phys_page1) {
+            if (tb_phys_page1 == phys_page1) {
                 return true;
             }
         }
@@ -1016,7 +1017,7 @@ int cpu_exec(CPUState *cpu)
              * direct jump to a TB spanning two pages because the mapping
              * for the second page can change.
              */
-            if (tb->page_addr[1] != -1) {
+            if (tb_page_addr1(tb) != -1) {
                 last_tb = NULL;
             }
 #endif
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 7f4e1e1299..15ec2f741d 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -44,8 +44,8 @@ static bool tb_cmp(const void *ap, const void *bp)
             a->flags == b->flags &&
             (tb_cflags(a) & ~CF_INVALID) == (tb_cflags(b) & ~CF_INVALID) &&
             a->trace_vcpu_dstate == b->trace_vcpu_dstate &&
-            a->page_addr[0] == b->page_addr[0] &&
-            a->page_addr[1] == b->page_addr[1]);
+            tb_page_addr0(a) == tb_page_addr0(b) &&
+            tb_page_addr1(a) == tb_page_addr1(b));
 }
 
 void tb_htable_init(void)
@@ -273,7 +273,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     qemu_spin_unlock(&tb->jmp_lock);
 
     /* remove the TB from the hash list */
-    phys_pc = tb->page_addr[0];
+    phys_pc = tb_page_addr0(tb);
     h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
                      tb->flags, orig_cflags, tb->trace_vcpu_dstate);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
@@ -282,10 +282,11 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
     /* remove the TB from the page list */
     if (rm_from_page_list) {
-        p = page_find(tb->page_addr[0] >> TARGET_PAGE_BITS);
+        p = page_find(phys_pc >> TARGET_PAGE_BITS);
         tb_page_remove(p, tb);
-        if (tb->page_addr[1] != -1) {
-            p = page_find(tb->page_addr[1] >> TARGET_PAGE_BITS);
+        phys_pc = tb_page_addr1(tb);
+        if (phys_pc != -1) {
+            p = page_find(phys_pc >> TARGET_PAGE_BITS);
             tb_page_remove(p, tb);
         }
     }
@@ -358,16 +359,16 @@ static inline void page_unlock_tb(const TranslationBlock *tb) { }
 /* lock the page(s) of a TB in the correct acquisition order */
 static void page_lock_tb(const TranslationBlock *tb)
 {
-    page_lock_pair(NULL, tb->page_addr[0], NULL, tb->page_addr[1], false);
+    page_lock_pair(NULL, tb_page_addr0(tb), NULL, tb_page_addr1(tb), false);
 }
 
 static void page_unlock_tb(const TranslationBlock *tb)
 {
-    PageDesc *p1 = page_find(tb->page_addr[0] >> TARGET_PAGE_BITS);
+    PageDesc *p1 = page_find(tb_page_addr0(tb) >> TARGET_PAGE_BITS);
 
     page_unlock(p1);
-    if (unlikely(tb->page_addr[1] != -1)) {
-        PageDesc *p2 = page_find(tb->page_addr[1] >> TARGET_PAGE_BITS);
+    if (unlikely(tb_page_addr1(tb) != -1)) {
+        PageDesc *p2 = page_find(tb_page_addr1(tb) >> TARGET_PAGE_BITS);
 
         if (p2 != p1) {
             page_unlock(p2);
@@ -382,7 +383,7 @@ static void page_unlock_tb(const TranslationBlock *tb)
  */
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr)
 {
-    if (page_addr == -1 && tb->page_addr[0] != -1) {
+    if (page_addr == -1 && tb_page_addr0(tb) != -1) {
         page_lock_tb(tb);
         do_tb_phys_invalidate(tb, true);
         page_unlock_tb(tb);
@@ -516,11 +517,11 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
         if (n == 0) {
             /* NOTE: tb_end may be after the end of the page, but
                it is not a problem */
-            tb_start = tb->page_addr[0];
+            tb_start = tb_page_addr0(tb);
             tb_end = tb_start + tb->size;
         } else {
-            tb_start = tb->page_addr[1];
-            tb_end = tb_start + ((tb->page_addr[0] + tb->size)
+            tb_start = tb_page_addr1(tb);
+            tb_end = tb_start + ((tb_page_addr0(tb) + tb->size)
                                  & ~TARGET_PAGE_MASK);
         }
         if (!(tb_end <= start || tb_start >= end)) {
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 5e28e9fccd..bef4c56cff 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -698,9 +698,9 @@ page_collection_lock(tb_page_addr_t start, tb_page_addr_t end)
         }
         assert_page_locked(pd);
         PAGE_FOR_EACH_TB(pd, tb, n) {
-            if (page_trylock_add(set, tb->page_addr[0]) ||
-                (tb->page_addr[1] != -1 &&
-                 page_trylock_add(set, tb->page_addr[1]))) {
+            if (page_trylock_add(set, tb_page_addr0(tb)) ||
+                (tb_page_addr1(tb) != -1 &&
+                 page_trylock_add(set, tb_page_addr1(tb)))) {
                 /* drop all locks, and reacquire in order */
                 g_tree_foreach(set->tree, page_entry_unlock, NULL);
                 goto retry;
@@ -771,8 +771,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb->flags = flags;
     tb->cflags = cflags;
     tb->trace_vcpu_dstate = *cpu->trace_dstate;
-    tb->page_addr[0] = phys_pc;
-    tb->page_addr[1] = -1;
+    tb_set_page_addr0(tb, phys_pc);
+    tb_set_page_addr1(tb, -1);
     tcg_ctx->tb_cflags = cflags;
  tb_overflow:
 
@@ -970,7 +970,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
      * a temporary one-insn TB, and we have nothing left to do. Return early
      * before attempting to link to other TBs or add to the lookup table.
      */
-    if (tb->page_addr[0] == -1) {
+    if (tb_page_addr0(tb) == -1) {
         return tb;
     }
 
@@ -985,7 +985,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
      * No explicit memory barrier is required -- tb_link_page() makes the
      * TB visible in a consistent state.
      */
-    existing_tb = tb_link_page(tb, tb->page_addr[0], tb->page_addr[1]);
+    existing_tb = tb_link_page(tb, tb_page_addr0(tb), tb_page_addr1(tb));
     /* if the TB already exists, discard what we just translated */
     if (unlikely(existing_tb != tb)) {
         uintptr_t orig_aligned = (uintptr_t)gen_code_buf;
@@ -1140,7 +1140,7 @@ static gboolean tb_tree_stats_iter(gpointer key, gpointer value, gpointer data)
     if (tb->size > tst->max_target_size) {
         tst->max_target_size = tb->size;
     }
-    if (tb->page_addr[1] != -1) {
+    if (tb_page_addr1(tb) != -1) {
         tst->cross_page++;
     }
     if (tb->jmp_reset_offset[0] != TB_JMP_RESET_OFFSET_INVALID) {
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 8e78fd7a9c..061519691f 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -157,7 +157,7 @@ static void *translator_access(CPUArchState *env, DisasContextBase *db,
     tb = db->tb;
 
     /* Use slow path if first page is MMIO. */
-    if (unlikely(tb->page_addr[0] == -1)) {
+    if (unlikely(tb_page_addr0(tb) == -1)) {
         return NULL;
     }
 
@@ -169,13 +169,14 @@ static void *translator_access(CPUArchState *env, DisasContextBase *db,
         host = db->host_addr[1];
         base = TARGET_PAGE_ALIGN(db->pc_first);
         if (host == NULL) {
-            tb->page_addr[1] =
+            tb_page_addr_t phys_page =
                 get_page_addr_code_hostp(env, base, &db->host_addr[1]);
+            /* We cannot handle MMIO as second page. */
+            assert(phys_page != -1);
+            tb_set_page_addr1(tb, phys_page);
 #ifdef CONFIG_USER_ONLY
             page_protect(end);
 #endif
-            /* We cannot handle MMIO as second page. */
-            assert(tb->page_addr[1] != -1);
             host = db->host_addr[1];
         }
 
-- 
2.34.1


