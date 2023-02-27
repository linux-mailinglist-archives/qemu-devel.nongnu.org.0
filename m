Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15926A4355
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:52:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdvW-0006Yr-9F; Mon, 27 Feb 2023 08:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pWdvT-0006Y0-Ug
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:52:23 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pWdvQ-0005T8-B8
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:52:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZoHXIPnoMvDmnxpBuEC/qwhQiJCJcIus8W7TNDt4pNY=; b=iQ17y+Ogdz54/btn4d9bAjVRBI
 5Tmv03QZVQBsAjgz5iuceEGV/E0J2W5LUwLBSRTuKFwKiOZF3TGuag563NMREMdbS0OktxNrGhnvd
 TdGj621VajwAj9csZoD4eaGZPSdDQ4i/LPijAxq9nCMzzrKJFZlqiwgqSacMN8VP5STQ=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 edgar.iglesias@gmail.com, philmd@linaro.org, shorne@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
Subject: [PATCH v3 04/27] accel/tcg: Replace `TARGET_TB_PCREL` with `CF_PCREL`
Date: Mon, 27 Feb 2023 14:51:39 +0100
Message-Id: <20230227135202.9710-5-anjo@rev.ng>
In-Reply-To: <20230227135202.9710-1-anjo@rev.ng>
References: <20230227135202.9710-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cpu-exec.c      |  8 +++----
 accel/tcg/internal.h      | 10 ++++----
 accel/tcg/perf.c          |  2 +-
 accel/tcg/tb-jmp-cache.h  | 48 +++++++++++++++++++--------------------
 accel/tcg/tb-maint.c      |  8 +++----
 accel/tcg/translate-all.c | 14 ++++++------
 6 files changed, 44 insertions(+), 46 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5357608b14..92b833adcf 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -185,7 +185,7 @@ static bool tb_lookup_cmp(const void *p, const void *d)
     const TranslationBlock *tb = p;
     const struct tb_desc *desc = d;
 
-    if ((TARGET_TB_PCREL || tb_pc(tb) == desc->pc) &&
+    if ((tb_cflags(tb) & CF_PCREL || tb_pc(tb) == desc->pc) &&
         tb_page_addr0(tb) == desc->page_addr0 &&
         tb->cs_base == desc->cs_base &&
         tb->flags == desc->flags &&
@@ -237,7 +237,7 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
         return NULL;
     }
     desc.page_addr0 = phys_pc;
-    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : pc),
+    h = tb_hash_func(phys_pc, (cflags & CF_PCREL ? 0 : pc),
                      flags, cflags, *cpu->trace_dstate);
     return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
 }
@@ -256,7 +256,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
 
     hash = tb_jmp_cache_hash_func(pc);
     jc = cpu->tb_jmp_cache;
-    tb = tb_jmp_cache_get_tb(jc, hash);
+    tb = tb_jmp_cache_get_tb(jc, cflags, hash);
 
     if (likely(tb &&
                tb_jmp_cache_get_pc(jc, hash, tb) == pc &&
@@ -459,7 +459,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
         if (cc->tcg_ops->synchronize_from_tb) {
             cc->tcg_ops->synchronize_from_tb(cpu, last_tb);
         } else {
-            assert(!TARGET_TB_PCREL);
+            tcg_debug_assert(!(tb_cflags(last_tb) & CF_PCREL));
             assert(cc->set_pc);
             cc->set_pc(cpu, tb_pc(last_tb));
         }
diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 6edff16fb0..261924e7fa 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -57,11 +57,11 @@ void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
 /* Return the current PC from CPU, which may be cached in TB. */
 static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
 {
-#if TARGET_TB_PCREL
-    return cpu->cc->get_pc(cpu);
-#else
-    return tb_pc(tb);
-#endif
+    if (tb_cflags(tb) & CF_PCREL) {
+        return cpu->cc->get_pc(cpu);
+    } else {
+        return tb_pc(tb);
+    }
 }
 
 #endif /* ACCEL_TCG_INTERNAL_H */
diff --git a/accel/tcg/perf.c b/accel/tcg/perf.c
index ae19f6e28f..65e35ea3b9 100644
--- a/accel/tcg/perf.c
+++ b/accel/tcg/perf.c
@@ -328,7 +328,7 @@ void perf_report_code(uint64_t guest_pc, TranslationBlock *tb,
     for (insn = 0; insn < tb->icount; insn++) {
         /* FIXME: This replicates the restore_state_to_opc() logic. */
         q[insn].address = tcg_ctx->gen_insn_data[insn][0];
-        if (TARGET_TB_PCREL) {
+        if (tb_cflags(tb) & CF_PCREL) {
             q[insn].address |= (guest_pc & TARGET_PAGE_MASK);
         } else {
 #if defined(TARGET_I386)
diff --git a/accel/tcg/tb-jmp-cache.h b/accel/tcg/tb-jmp-cache.h
index b3f6e78835..083939b302 100644
--- a/accel/tcg/tb-jmp-cache.h
+++ b/accel/tcg/tb-jmp-cache.h
@@ -14,53 +14,51 @@
 
 /*
  * Accessed in parallel; all accesses to 'tb' must be atomic.
- * For TARGET_TB_PCREL, accesses to 'pc' must be protected by
- * a load_acquire/store_release to 'tb'.
+ * For CF_PCREL, accesses to 'pc' must be protected by a
+ * load_acquire/store_release to 'tb'.
  */
 struct CPUJumpCache {
     struct rcu_head rcu;
     struct {
         TranslationBlock *tb;
-#if TARGET_TB_PCREL
         target_ulong pc;
-#endif
     } array[TB_JMP_CACHE_SIZE];
 };
 
 static inline TranslationBlock *
-tb_jmp_cache_get_tb(CPUJumpCache *jc, uint32_t hash)
+tb_jmp_cache_get_tb(CPUJumpCache *jc, uint32_t cflags, uint32_t hash)
 {
-#if TARGET_TB_PCREL
-    /* Use acquire to ensure current load of pc from jc. */
-    return qatomic_load_acquire(&jc->array[hash].tb);
-#else
-    /* Use rcu_read to ensure current load of pc from *tb. */
-    return qatomic_rcu_read(&jc->array[hash].tb);
-#endif
+    if (cflags & CF_PCREL) {
+        /* Use acquire to ensure current load of pc from jc. */
+        return qatomic_load_acquire(&jc->array[hash].tb);
+    } else {
+        /* Use rcu_read to ensure current load of pc from *tb. */
+        return qatomic_rcu_read(&jc->array[hash].tb);
+    }
 }
 
 static inline target_ulong
 tb_jmp_cache_get_pc(CPUJumpCache *jc, uint32_t hash, TranslationBlock *tb)
 {
-#if TARGET_TB_PCREL
-    return jc->array[hash].pc;
-#else
-    return tb_pc(tb);
-#endif
+    if (tb_cflags(tb) & CF_PCREL) {
+        return jc->array[hash].pc;
+    } else {
+        return tb_pc(tb);
+    }
 }
 
 static inline void
 tb_jmp_cache_set(CPUJumpCache *jc, uint32_t hash,
                  TranslationBlock *tb, target_ulong pc)
 {
-#if TARGET_TB_PCREL
-    jc->array[hash].pc = pc;
-    /* Use store_release on tb to ensure pc is written first. */
-    qatomic_store_release(&jc->array[hash].tb, tb);
-#else
-    /* Use the pc value already stored in tb->pc. */
-    qatomic_set(&jc->array[hash].tb, tb);
-#endif
+    if (tb_cflags(tb) & CF_PCREL) {
+        jc->array[hash].pc = pc;
+        /* Use store_release on tb to ensure pc is written first. */
+        qatomic_store_release(&jc->array[hash].tb, tb);
+    } else{
+        /* Use the pc value already stored in tb->pc. */
+        qatomic_set(&jc->array[hash].tb, tb);
+    }
 }
 
 #endif /* ACCEL_TCG_TB_JMP_CACHE_H */
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index b3d6529ae2..2dbc2ce172 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -44,7 +44,7 @@ static bool tb_cmp(const void *ap, const void *bp)
     const TranslationBlock *a = ap;
     const TranslationBlock *b = bp;
 
-    return ((TARGET_TB_PCREL || tb_pc(a) == tb_pc(b)) &&
+    return ((tb_cflags(a) & CF_PCREL || tb_pc(a) == tb_pc(b)) &&
             a->cs_base == b->cs_base &&
             a->flags == b->flags &&
             (tb_cflags(a) & ~CF_INVALID) == (tb_cflags(b) & ~CF_INVALID) &&
@@ -847,7 +847,7 @@ static void tb_jmp_cache_inval_tb(TranslationBlock *tb)
 {
     CPUState *cpu;
 
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(tb) & CF_PCREL) {
         /* A TB may be at any virtual address */
         CPU_FOREACH(cpu) {
             tcg_flush_jmp_cache(cpu);
@@ -885,7 +885,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
     /* remove the TB from the hash list */
     phys_pc = tb_page_addr0(tb);
-    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
+    h = tb_hash_func(phys_pc, (orig_cflags & CF_PCREL ? 0 : tb_pc(tb)),
                      tb->flags, orig_cflags, tb->trace_vcpu_dstate);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
         return;
@@ -966,7 +966,7 @@ TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     tb_record(tb, p, p2);
 
     /* add in the hash table */
-    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
+    h = tb_hash_func(phys_pc, (tb->cflags & CF_PCREL ? 0 : tb_pc(tb)),
                      tb->flags, tb->cflags, tb->trace_vcpu_dstate);
     qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 9e925c10f3..6ae3cc9d71 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -135,7 +135,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
 
         for (j = 0; j < TARGET_INSN_START_WORDS; ++j) {
             if (i == 0) {
-                prev = (!TARGET_TB_PCREL && j == 0 ? tb_pc(tb) : 0);
+                prev = (!(tb_cflags(tb) & CF_PCREL) && j == 0 ? tb_pc(tb) : 0);
             } else {
                 prev = tcg_ctx->gen_insn_data[i - 1][j];
             }
@@ -170,7 +170,7 @@ static int cpu_unwind_data_from_tb(TranslationBlock *tb, uintptr_t host_pc,
     }
 
     memset(data, 0, sizeof(uint64_t) * TARGET_INSN_START_WORDS);
-    if (!TARGET_TB_PCREL) {
+    if (!(tb_cflags(tb) & CF_PCREL)) {
         data[0] = tb_pc(tb);
     }
 
@@ -341,9 +341,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
     gen_code_buf = tcg_ctx->code_gen_ptr;
     tb->tc.ptr = tcg_splitwx_to_rx(gen_code_buf);
-#if !TARGET_TB_PCREL
-    tb->pc = pc;
-#endif
+    if (!(cflags & CF_PCREL)) {
+        tb->pc = pc;
+    }
     tb->cs_base = cs_base;
     tb->flags = flags;
     tb->cflags = cflags;
@@ -408,8 +408,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb->tc.size = gen_code_size;
 
     /*
-     * For TARGET_TB_PCREL, attribute all executions of the generated
-     * code to its first mapping.
+     * For CF_PCREL, attribute all executions of the generated code
+     * to its first mapping.
      */
     perf_report_code(pc, tb, tcg_splitwx_to_rx(gen_code_buf));
 
-- 
2.39.1


