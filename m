Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9EF60D944
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:27:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVtt-0004wH-Et; Tue, 25 Oct 2022 22:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtq-0004w6-Bd
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:10 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVto-0001BR-CS
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:10 -0400
Received: by mail-pj1-x102e.google.com with SMTP id pb15so12676948pjb.5
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YEu7C5O9uXiNgclmsb1i1sQgwnCujdvj8kY+wGSE9K4=;
 b=R3lSb694bFlXHCpzVjqpZFeQXmosTiciBA77olyH0SjIMPxcPPN2WdOti0JOg/plab
 L598Qwrjj/Qd2Y9sD7iUqEeH26/HEH/tJj9ISOr02akPgeYY2IAuaTtIs/XH+EWuiTgQ
 TnEQNxA8cmzFuiMz2PjTH/Lfo00Dzw/DO3u/Y3KMHHozQeB+Dd9IFq9vYqfZb7/VhN98
 B1HERFKvdY6ngkGydJUaZINj6mDqXZwyQA7FeoVGw9onWlPApAB9p7UNhlYM7XJbvaSh
 4gHq3ikUx1WISkW1YrAd/qGumJwXFJZP4ySMwJ71QAWHAQEKLD/UHCg/B+49ymg77wiO
 Zi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YEu7C5O9uXiNgclmsb1i1sQgwnCujdvj8kY+wGSE9K4=;
 b=r3vHr51piw+sKsEzgtgY2izhgSXo+p0CIAgZK3EChmjfct6HPqTt0QNesbRJBIYv9d
 nO4rFLGuvva3UDLMub98vckNVqZRaDDS+3r3rn27igpkt7lea67BcNI74Mjb56uMHG5m
 cjlmdVXkaOBnD0GeMoVHbFu6wsM54Fx4EQ9JFqtWk9HIlHufUw0Mj3Z+UozEWVBl7CBh
 x+2VW5N3yPaXev5O4tbFRg1/hf0EoRNvbXDShWlWorcX0kh4kndMTEBtwp/j7QDRFi4R
 h95tz8Za+Hwu5QJMCcv6xvDIX0oK545rKF/2j1pZYFwiIrEJueHgKH8e37tLxaFbFjsH
 edIA==
X-Gm-Message-State: ACrzQf2QptEe+VpX9DV5YEo1zdlxDsB3y13BdJXO1MMG0s2m0vmYFx6k
 GdG2qSw0yLr6rbWWEXPbl5QdYZahTfhpvRQC
X-Google-Smtp-Source: AMsMyM7S3rdixOQb2NTmkaCGAJvto8NXOtAPqlRDqJjmsUwhJZolxHWAFcRgdsuT5FrUjKYB69ExmQ==
X-Received: by 2002:a17:90b:3a88:b0:209:f35d:ad53 with SMTP id
 om8-20020a17090b3a8800b00209f35dad53mr1519661pjb.102.1666750326884; 
 Tue, 25 Oct 2022 19:12:06 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 15/47] accel/tcg: Introduce tb_{set_}page_addr{0,1}
Date: Wed, 26 Oct 2022 12:10:44 +1000
Message-Id: <20221026021116.1988449-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This data structure will be replaced for user-only: add accessors.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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
index bb4b9e92ce..82b06c1824 100644
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
@@ -1019,7 +1020,7 @@ int cpu_exec(CPUState *cpu)
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


