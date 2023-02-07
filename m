Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E74668D4AE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 11:45:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPLSY-0005ZL-Gb; Tue, 07 Feb 2023 05:44:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pPLSW-0005Yq-Nm
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:44:20 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pPLSS-000158-RJ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:44:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/YLNOUtPFloyMa9eHvDtNeMZ0jzx5tsz/r8+OouI5rE=; b=XnroZZ78ooUR/IO3lFElrlwss8
 L5FRJQiLrHpXMLTctorm3t3dKF8m+n3T0lsZxqvxxPmbNUi+doQOuWnygyfT2WRBfkXKbN898NCLK
 8h/lHS7ZBfhzWpkXjqeBZDoUU+Mo73i7+GTYk7+6bQwwHm66fVRzQGu9DgLEtUtG20mw=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org
Subject: [PATCH 2/3] Replace `TARGET_TB_PCREL` with `CF_PCREL`
Date: Tue,  7 Feb 2023 11:43:51 +0100
Message-Id: <20230207104352.11055-3-anjo@rev.ng>
In-Reply-To: <20230207104352.11055-1-anjo@rev.ng>
References: <20230207104352.11055-1-anjo@rev.ng>
MIME-Version: 1.0
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
---
 accel/tcg/cpu-exec.c        |  8 +++----
 accel/tcg/internal.h        | 10 ++++----
 accel/tcg/perf.c            |  2 +-
 accel/tcg/tb-jmp-cache.h    | 48 ++++++++++++++++++-------------------
 accel/tcg/tb-maint.c        |  8 +++----
 accel/tcg/translate-all.c   | 14 +++++------
 include/exec/cpu-defs.h     |  3 ---
 include/exec/exec-all.h     | 27 +++++++++------------
 target/arm/cpu.c            |  8 +++----
 target/arm/translate-a64.c  |  8 +++----
 target/arm/translate.c      |  6 ++---
 target/arm/translate.h      |  2 +-
 target/i386/helper.c        |  2 +-
 target/i386/tcg/tcg-cpu.c   |  6 ++---
 target/i386/tcg/translate.c | 26 ++++++++++----------
 15 files changed, 84 insertions(+), 94 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 9c857eeb07..0a84934ed4 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -186,7 +186,7 @@ static bool tb_lookup_cmp(const void *p, const void *d)
     const TranslationBlock *tb = p;
     const struct tb_desc *desc = d;
 
-    if ((TARGET_TB_PCREL || tb_pc(tb) == desc->pc) &&
+    if ((tb_cflags(tb) & CF_PCREL || tb_pc(tb) == desc->pc) &&
         tb_page_addr0(tb) == desc->page_addr0 &&
         tb->cs_base == desc->cs_base &&
         tb->flags == desc->flags &&
@@ -238,7 +238,7 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
         return NULL;
     }
     desc.page_addr0 = phys_pc;
-    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : pc),
+    h = tb_hash_func(phys_pc, (cflags & CF_PCREL ? 0 : pc),
                      flags, cflags, *cpu->trace_dstate);
     return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
 }
@@ -257,7 +257,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
 
     hash = tb_jmp_cache_hash_func(pc);
     jc = cpu->tb_jmp_cache;
-    tb = tb_jmp_cache_get_tb(jc, hash);
+    tb = tb_jmp_cache_get_tb(jc, cflags, hash);
 
     if (likely(tb &&
                tb_jmp_cache_get_pc(jc, hash, tb) == pc &&
@@ -460,7 +460,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
         if (cc->tcg_ops->synchronize_from_tb) {
             cc->tcg_ops->synchronize_from_tb(cpu, last_tb);
         } else {
-            assert(!TARGET_TB_PCREL);
+            assert(!(tb_cflags(last_tb) & CF_PCREL));
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
 
diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 21309cf567..67239b4e5e 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -54,9 +54,6 @@
 #  error TARGET_PAGE_BITS must be defined in cpu-param.h
 # endif
 #endif
-#ifndef TARGET_TB_PCREL
-# define TARGET_TB_PCREL 0
-#endif
 
 #define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
 
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index b54df1c28f..74646016aa 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -504,22 +504,20 @@ struct tb_tc {
 };
 
 struct TranslationBlock {
-#if !TARGET_TB_PCREL
     /*
      * Guest PC corresponding to this block.  This must be the true
      * virtual address.  Therefore e.g. x86 stores EIP + CS_BASE, and
      * targets like Arm, MIPS, HP-PA, which reuse low bits for ISA or
      * privilege, must store those bits elsewhere.
      *
-     * If TARGET_TB_PCREL, the opcodes for the TranslationBlock are
-     * written such that the TB is associated only with the physical
-     * page and may be run in any virtual address context.  In this case,
-     * PC must always be taken from ENV in a target-specific manner.
+     * If CF_PCREL, the opcodes for the TranslationBlock are written
+     * such that the TB is associated only with the physical page and
+     * may be run in any virtual address context.  In this case, PC
+     * must always be taken from ENV in a target-specific manner.
      * Unwind information is taken as offsets from the page, to be
      * deposited into the "current" PC.
      */
     target_ulong pc;
-#endif
 
     /*
      * Target-specific data associated with the TranslationBlock, e.g.:
@@ -613,22 +611,19 @@ struct TranslationBlock {
     uintptr_t jmp_dest[2];
 };
 
-/* Hide the read to avoid ifdefs for TARGET_TB_PCREL. */
-static inline target_ulong tb_pc(const TranslationBlock *tb)
-{
-#if TARGET_TB_PCREL
-    qemu_build_not_reached();
-#else
-    return tb->pc;
-#endif
-}
-
 /* Hide the qatomic_read to make code a little easier on the eyes */
 static inline uint32_t tb_cflags(const TranslationBlock *tb)
 {
     return qatomic_read(&tb->cflags);
 }
 
+/* Hide the read to avoid ifdefs for CF_PCREL. */
+static inline target_ulong tb_pc(const TranslationBlock *tb)
+{
+    assert(!(tb_cflags(tb) & CF_PCREL));
+    return tb->pc;
+}
+
 static inline tb_page_addr_t tb_page_addr0(const TranslationBlock *tb)
 {
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5f63316dbf..31dc595e11 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -75,8 +75,8 @@ static vaddr arm_cpu_get_pc(CPUState *cs)
 void arm_cpu_synchronize_from_tb(CPUState *cs,
                                  const TranslationBlock *tb)
 {
-    /* The program counter is always up to date with TARGET_TB_PCREL. */
-    if (!TARGET_TB_PCREL) {
+    /* The program counter is always up to date with CF_PCREL. */
+    if (!(tb_cflags(tb) & CF_PCREL)) {
         CPUARMState *env = cs->env_ptr;
         /*
          * It's OK to look at env for the current mode here, because it's
@@ -97,7 +97,7 @@ void arm_restore_state_to_opc(CPUState *cs,
     CPUARMState *env = cs->env_ptr;
 
     if (is_a64(env)) {
-        if (TARGET_TB_PCREL) {
+        if (tb_cflags(tb) & CF_PCREL) {
             env->pc = (env->pc & TARGET_PAGE_MASK) | data[0];
         } else {
             env->pc = data[0];
@@ -105,7 +105,7 @@ void arm_restore_state_to_opc(CPUState *cs,
         env->condexec_bits = 0;
         env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
     } else {
-        if (TARGET_TB_PCREL) {
+        if (tb_cflags(tb) & CF_PCREL) {
             env->regs[15] = (env->regs[15] & TARGET_PAGE_MASK) | data[0];
         } else {
             env->regs[15] = data[0];
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index da9f877476..b6d00b81da 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -143,7 +143,7 @@ static void reset_btype(DisasContext *s)
 static void gen_pc_plus_diff(DisasContext *s, TCGv_i64 dest, target_long diff)
 {
     assert(s->pc_save != -1);
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         tcg_gen_addi_i64(dest, cpu_pc, (s->pc_curr - s->pc_save) + diff);
     } else {
         tcg_gen_movi_i64(dest, s->pc_curr + diff);
@@ -393,7 +393,7 @@ static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
          * update to pc to the unlinked path.  A long chain of links
          * can thus avoid many updates to the PC.
          */
-        if (TARGET_TB_PCREL) {
+        if (tb_cflags(s->base.tb) & CF_PCREL) {
             gen_a64_update_pc(s, diff);
             tcg_gen_goto_tb(n);
         } else {
@@ -4297,7 +4297,7 @@ static void disas_pc_rel_adr(DisasContext *s, uint32_t insn)
     if (page) {
         /* ADRP (page based) */
         offset <<= 12;
-        /* The page offset is ok for TARGET_TB_PCREL. */
+        /* The page offset is ok for CF_PCREL. */
         offset -= s->pc_curr & 0xfff;
     }
 
@@ -14809,7 +14809,7 @@ static void aarch64_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     target_ulong pc_arg = dc->base.pc_next;
 
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(dcbase->tb) & CF_PCREL) {
         pc_arg &= ~TARGET_PAGE_MASK;
     }
     tcg_gen_insn_start(pc_arg, 0, 0);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c23a3462bf..0e7d3b8561 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -269,7 +269,7 @@ static target_long jmp_diff(DisasContext *s, target_long diff)
 static void gen_pc_plus_diff(DisasContext *s, TCGv_i32 var, target_long diff)
 {
     assert(s->pc_save != -1);
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         tcg_gen_addi_i32(var, cpu_R[15], (s->pc_curr - s->pc_save) + diff);
     } else {
         tcg_gen_movi_i32(var, s->pc_curr + diff);
@@ -2620,7 +2620,7 @@ static void gen_goto_tb(DisasContext *s, int n, target_long diff)
          * update to pc to the unlinked path.  A long chain of links
          * can thus avoid many updates to the PC.
          */
-        if (TARGET_TB_PCREL) {
+        if (tb_cflags(s->base.tb) & CF_PCREL) {
             gen_update_pc(s, diff);
             tcg_gen_goto_tb(n);
         } else {
@@ -9542,7 +9542,7 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t condexec_bits;
     target_ulong pc_arg = dc->base.pc_next;
 
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(dcbase->tb) & CF_PCREL) {
         pc_arg &= ~TARGET_PAGE_MASK;
     }
     if (dc->eci) {
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 3717824b75..4001372acd 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -23,7 +23,7 @@ typedef struct DisasContext {
     /* The address of the current instruction being translated. */
     target_ulong pc_curr;
     /*
-     * For TARGET_TB_PCREL, the full value of cpu_pc is not known
+     * For CF_PCREL, the full value of cpu_pc is not known
      * (although the page offset is known).  For convenience, the
      * translation loop uses the full virtual address that triggered
      * the translation, from base.pc_start through pc_curr.
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 0ac2da066d..8857444819 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -520,7 +520,7 @@ static inline target_ulong get_memio_eip(CPUX86State *env)
     }
 
     /* Per x86_restore_state_to_opc. */
-    if (TARGET_TB_PCREL) {
+    if (cs->tcg_cflags & CF_PCREL) {
         return (env->eip & TARGET_PAGE_MASK) | data[0];
     } else {
         return data[0] - env->segs[R_CS].base;
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 79ac5908f7..c090ce152b 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -49,8 +49,8 @@ static void x86_cpu_exec_exit(CPUState *cs)
 static void x86_cpu_synchronize_from_tb(CPUState *cs,
                                         const TranslationBlock *tb)
 {
-    /* The instruction pointer is always up to date with TARGET_TB_PCREL. */
-    if (!TARGET_TB_PCREL) {
+    /* The instruction pointer is always up to date with CF_PCREL. */
+    if (!(tb_cflags(tb) & CF_PCREL)) {
         CPUX86State *env = cs->env_ptr;
         env->eip = tb_pc(tb) - tb->cs_base;
     }
@@ -64,7 +64,7 @@ static void x86_restore_state_to_opc(CPUState *cs,
     CPUX86State *env = &cpu->env;
     int cc_op = data[1];
 
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(tb) & CF_PCREL) {
         env->eip = (env->eip & TARGET_PAGE_MASK) | data[0];
     } else {
         env->eip = data[0] - tb->cs_base;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 9d9392b009..3fed6d96f9 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -545,7 +545,7 @@ static inline void gen_op_st_rm_T0_A0(DisasContext *s, int idx, int d)
 static void gen_update_eip_cur(DisasContext *s)
 {
     assert(s->pc_save != -1);
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         tcg_gen_addi_tl(cpu_eip, cpu_eip, s->base.pc_next - s->pc_save);
     } else {
         tcg_gen_movi_tl(cpu_eip, s->base.pc_next - s->cs_base);
@@ -556,7 +556,7 @@ static void gen_update_eip_cur(DisasContext *s)
 static void gen_update_eip_next(DisasContext *s)
 {
     assert(s->pc_save != -1);
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         tcg_gen_addi_tl(cpu_eip, cpu_eip, s->pc - s->pc_save);
     } else {
         tcg_gen_movi_tl(cpu_eip, s->pc - s->cs_base);
@@ -588,7 +588,7 @@ static TCGv_i32 eip_next_i32(DisasContext *s)
     if (CODE64(s)) {
         return tcg_constant_i32(-1);
     }
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         TCGv_i32 ret = tcg_temp_new_i32();
         tcg_gen_trunc_tl_i32(ret, cpu_eip);
         tcg_gen_addi_i32(ret, ret, s->pc - s->pc_save);
@@ -601,7 +601,7 @@ static TCGv_i32 eip_next_i32(DisasContext *s)
 static TCGv eip_next_tl(DisasContext *s)
 {
     assert(s->pc_save != -1);
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         TCGv ret = tcg_temp_new();
         tcg_gen_addi_tl(ret, cpu_eip, s->pc - s->pc_save);
         return ret;
@@ -613,7 +613,7 @@ static TCGv eip_next_tl(DisasContext *s)
 static TCGv eip_cur_tl(DisasContext *s)
 {
     assert(s->pc_save != -1);
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         TCGv ret = tcg_temp_new();
         tcg_gen_addi_tl(ret, cpu_eip, s->base.pc_next - s->pc_save);
         return ret;
@@ -1830,7 +1830,7 @@ static void gen_rot_rm_T1(DisasContext *s, MemOp ot, int op1, int is_right)
     tcg_temp_free_i32(t0);
     tcg_temp_free_i32(t1);
 
-    /* The CC_OP value is no longer predictable.  */ 
+    /* The CC_OP value is no longer predictable.  */
     set_cc_op(s, CC_OP_DYNAMIC);
 }
 
@@ -1923,7 +1923,7 @@ static void gen_rotc_rm_T1(DisasContext *s, MemOp ot, int op1,
         gen_op_ld_v(s, ot, s->T0, s->A0);
     else
         gen_op_mov_v_reg(s, ot, s->T0, op1);
-    
+
     if (is_right) {
         switch (ot) {
         case MO_8:
@@ -2319,7 +2319,7 @@ static TCGv gen_lea_modrm_1(DisasContext *s, AddressParts a, bool is_vsib)
         ea = cpu_regs[a.base];
     }
     if (!ea) {
-        if (TARGET_TB_PCREL && a.base == -2) {
+        if (tb_cflags(s->base.tb) & CF_PCREL && a.base == -2) {
             /* With cpu_eip ~= pc_save, the expression is pc-relative. */
             tcg_gen_addi_tl(s->A0, cpu_eip, a.disp - s->pc_save);
         } else {
@@ -2867,7 +2867,7 @@ static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
     if (!CODE64(s)) {
         if (ot == MO_16) {
             mask = 0xffff;
-            if (TARGET_TB_PCREL && CODE32(s)) {
+            if (tb_cflags(s->base.tb) & CF_PCREL && CODE32(s)) {
                 use_goto_tb = false;
             }
         } else {
@@ -2879,7 +2879,7 @@ static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
     gen_update_cc_op(s);
     set_cc_op(s, CC_OP_DYNAMIC);
 
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         tcg_gen_addi_tl(cpu_eip, cpu_eip, new_pc - s->pc_save);
         /*
          * If we can prove the branch does not leave the page and we have
@@ -2896,13 +2896,13 @@ static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
         translator_use_goto_tb(&s->base, new_eip + s->cs_base)) {
         /* jump to same page: we can use a direct jump */
         tcg_gen_goto_tb(tb_num);
-        if (!TARGET_TB_PCREL) {
+        if (!(tb_cflags(s->base.tb) & CF_PCREL)) {
             tcg_gen_movi_tl(cpu_eip, new_eip);
         }
         tcg_gen_exit_tb(s->base.tb, tb_num);
         s->base.is_jmp = DISAS_NORETURN;
     } else {
-        if (!TARGET_TB_PCREL) {
+        if (!(tb_cflags(s->base.tb) & CF_PCREL)) {
             tcg_gen_movi_tl(cpu_eip, new_eip);
         }
         if (s->jmp_opt) {
@@ -7065,7 +7065,7 @@ static void i386_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     target_ulong pc_arg = dc->base.pc_next;
 
     dc->prev_insn_end = tcg_last_op();
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(dcbase->tb) & CF_PCREL) {
         pc_arg -= dc->cs_base;
         pc_arg &= ~TARGET_PAGE_MASK;
     }
-- 
2.39.1


