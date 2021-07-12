Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA933C5FB7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:49:34 +0200 (CEST)
Received: from localhost ([::1]:58376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2yBZ-0005Gz-J2
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2k-000411-Et
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:26 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:37446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2Y-0000wJ-6R
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:26 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 17so16775185pfz.4
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GsYTylIZOg07xboTBgz05SQc22Do7qgHV7kQGXX9qk8=;
 b=M8wJR9jum2z+ijrloNAVRevPL7iMHBW6PBvHHer/quN/bQBAKHmIQs/SES1sPESHM6
 PdPdhL6SlEvLCVCzi/WlbU77pyEI625pmcEKHRWjl/ilarOTlSBRXhH7ADPrR94/SlMB
 6egEw5re1Bf+5rN5+nqGIeQimmob9LOB2Fg0JnQX4gpqp08fyRoy6TYpJhJeDVZOsI/A
 v6Z7I6YVb4BbS1OqLMG3fiLCwqltz+sY060UMohmHlk5QfO/NecZklSJ3pTj41bokqLn
 /TV/Q6JsOM6gr/P8YocN36BZ5zeuxBaIi4c3zLmeBQD8cEmB2M9DgAcCcqBakyE7WY6m
 w5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GsYTylIZOg07xboTBgz05SQc22Do7qgHV7kQGXX9qk8=;
 b=S+laTTC7hUt2LcpF6SbUPF+no0hskGmDrCO1/wWnbKIkIgtti0IvPLcDo7f6957em2
 qprfxe56+1QpeFrziKLNuInHQAW37nGVkaGvCFAGw+a9KMKq6HJkazBcNInK4dAEIoDP
 dUaAQaQqrlQJwt7eJTtedE+wrXgIV842qv0+6tcP0ToRO+50YXUi3xxsG76Oe8WYiuak
 U1dkG3cTAs2pMA1Z7Kzhhqgz0/o9/gHB+ahItx5PaUhT4Z1kGV8/lUIKjw6LESOEEMYG
 vUjH0xCqFjFIBSCogkRU8iiS0R0IGOPMsTQ3oQQvwoVxZd+q35V7OthvXc2Caoj5PiBv
 gIBg==
X-Gm-Message-State: AOAM533WcvFF6YjHL3+3lsBZ+dIlxU0TibKYWrs9Mz7iWfq0MQN+2R7V
 dowEe58vMELzt1RVdJM7jN+ozUw/U+1itg==
X-Google-Smtp-Source: ABdhPJw31oE3zhbCA/9dCxagCnfyqFrScskEr8P6jUiqkPZp5evzVKk7jnSm5fwAa35MBMP6uKWzRQ==
X-Received: by 2002:a63:f750:: with SMTP id f16mr53105026pgk.292.1626104411377; 
 Mon, 12 Jul 2021 08:40:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b33sm18247635pgb.92.2021.07.12.08.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:40:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/10] accel/tcg: Encode breakpoint info into tb->cflags
Date: Mon, 12 Jul 2021 08:40:04 -0700
Message-Id: <20210712154004.1410832-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712154004.1410832-1-richard.henderson@linaro.org>
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mark.cave-ayland@ilande.co.uk, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Having this data in cflags means that hashing takes care
of selecting a TB with or without exceptions built in.
Which means that we no longer need to flush all TBs.

This does require that we single-step while we're within a page
that contains a breakpoint, so it's not yet ideal, but should be
an improvement over some corner-case slowdowns.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/404
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   |  7 ++++
 accel/tcg/cpu-exec.c      | 68 ++++++++++++++++++++++++++++++-
 accel/tcg/translate-all.c |  4 --
 accel/tcg/translator.c    | 85 +++++++++++++++++++++------------------
 cpu.c                     | 24 -----------
 5 files changed, 119 insertions(+), 69 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 6873cce8df..7ab2578f71 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -502,9 +502,16 @@ struct TranslationBlock {
 #define CF_USE_ICOUNT    0x00020000
 #define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_lock held */
 #define CF_PARALLEL      0x00080000 /* Generate code for a parallel context */
+#define CF_BP_MASK       0x00300000 /* See below */
+#define CF_BP_SHIFT      20
 #define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
 #define CF_CLUSTER_SHIFT 24
 
+#define CF_BP_NONE       (0 << CF_BP_SHIFT) /* TB does not interact with BPs */
+#define CF_BP_SSTEP      (1 << CF_BP_SHIFT) /* gdbstub single-step in effect */
+#define CF_BP_GDB        (2 << CF_BP_SHIFT) /* gdbstub breakpoint at tb->pc */
+#define CF_BP_CPU        (3 << CF_BP_SHIFT) /* arch breakpoint at tb->pc */
+
     /* Per-vCPU dynamic tracing state used to generate this TB */
     uint32_t trace_vcpu_dstate;
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 4d043a11aa..179a425ece 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -222,6 +222,65 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
     }
 }
 
+static uint32_t cflags_for_breakpoints(CPUState *cpu, target_ulong pc,
+                                       uint32_t cflags)
+{
+    uint32_t bflags = 0;
+
+    if (unlikely(cpu->singlestep_enabled)) {
+        bflags = CF_BP_SSTEP;
+    } else {
+        bool match_page = false;
+        CPUBreakpoint *bp;
+
+        QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
+            /* Note exact pc matches */
+            if (pc == bp->pc) {
+                if (bp->flags & BP_GDB) {
+                    bflags = CF_BP_GDB;
+                    break;
+                }
+                if (bp->flags & BP_CPU) {
+                    bflags = CF_BP_CPU;
+                    break;
+                }
+            }
+            /* Note page matches */
+            if (((pc ^ bp->pc) & TARGET_PAGE_MASK) == 0) {
+                match_page = true;
+            }
+        }
+
+        if (likely(!bflags)) {
+            if (likely(!match_page)) {
+                return cflags;
+            }
+
+            /*
+             * Within the same page as a breakpoint, single-step,
+             * returning to helper_lookup_tb_ptr after each looking
+             * for the actual breakpoint.
+             *
+             * TODO: Perhaps better to record all of the TBs associated
+             * with a given virtual page that contains a breakpoint, and
+             * then invalidate them when a new overlapping breakpoint is
+             * set on the page.  Non-overlapping TBs would not be
+             * invalidated, nor would any TB need to be invalidated as
+             * breakpoints are removed.
+             */
+            bflags = CF_NO_GOTO_TB;
+        }
+    }
+
+    /*
+     * Reduce the TB to one insn.
+     * In the case of a BP hit, we will be raising an exception anyway.
+     * In the case of a page hit, return to helper_lookup_tb_ptr after
+     * every insn to look for the breakpoint.
+     */
+    return (cflags & ~CF_COUNT_MASK) | 1 | bflags;
+}
+
 /**
  * helper_lookup_tb_ptr: quick check for next tb
  * @env: current cpu state
@@ -235,11 +294,13 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
     CPUState *cpu = env_cpu(env);
     TranslationBlock *tb;
     target_ulong cs_base, pc;
-    uint32_t flags;
+    uint32_t flags, cflags;
 
     cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
 
-    tb = tb_lookup(cpu, pc, cs_base, flags, curr_cflags(cpu));
+    cflags = cflags_for_breakpoints(cpu, pc, curr_cflags(cpu));
+
+    tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
     if (tb == NULL) {
         return tcg_code_gen_epilogue;
     }
@@ -346,6 +407,8 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cflags &= ~CF_PARALLEL;
         /* After 1 insn, return and release the exclusive lock. */
         cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | 1;
+        /* Raise any post-instruction debug exceptions. */
+        cflags = cflags_for_breakpoints(cpu, pc, cflags);
 
         tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
         if (tb == NULL) {
@@ -524,6 +587,7 @@ static inline TranslationBlock *tb_find(CPUState *cpu,
     } else {
         cpu->cflags_next_tb = -1;
     }
+    cflags = cflags_for_breakpoints(cpu, pc, cflags);
 
     tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
     if (tb == NULL) {
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 491c1a56b2..1f98078608 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1432,10 +1432,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     }
     QEMU_BUILD_BUG_ON(CF_COUNT_MASK + 1 != TCG_MAX_INSNS);
 
-    if (cpu->singlestep_enabled) {
-        max_insns = 1;
-    }
-
  buffer_overflow:
     tb = tcg_tb_alloc(tcg_ctx);
     if (unlikely(!tb)) {
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 449159a27c..01b48137da 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -33,13 +33,8 @@ void translator_loop_temp_check(DisasContextBase *db)
 
 bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
 {
-    /* Suppress goto_tb if requested. */
-    if (tb_cflags(db->tb) & CF_NO_GOTO_TB) {
-        return false;
-    }
-
-    /* Suppress goto_tb in the case of single-steping.  */
-    if (db->singlestep_enabled) {
+    /* Suppress goto_tb if requested, or required by breakpoints. */
+    if (tb_cflags(db->tb) & (CF_NO_GOTO_TB | CF_BP_MASK)) {
         return false;
     }
 
@@ -51,6 +46,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
                      CPUState *cpu, TranslationBlock *tb, int max_insns)
 {
     uint32_t cflags = tb_cflags(tb);
+    int bp_flags = 0;
     bool plugin_enabled;
 
     /* Initialize DisasContext */
@@ -60,7 +56,23 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
     db->is_jmp = DISAS_NEXT;
     db->num_insns = 0;
     db->max_insns = max_insns;
-    db->singlestep_enabled = cpu->singlestep_enabled;
+    db->singlestep_enabled = false;
+
+    switch (cflags & CF_BP_MASK) {
+    case CF_BP_NONE:
+        break;
+    case CF_BP_SSTEP:
+        db->singlestep_enabled = true;
+        break;
+    case CF_BP_GDB:
+        bp_flags = BP_GDB;
+        break;
+    case CF_BP_CPU:
+        bp_flags = BP_CPU;
+        break;
+    default:
+        g_assert_not_reached();
+    }
 
     ops->init_disas_context(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
@@ -85,39 +97,34 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
         }
 
         /* Pass breakpoint hits to target for further processing */
-        if (!db->singlestep_enabled
-            && unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
-            CPUBreakpoint *bp;
-            QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
-                if (bp->pc == db->pc_next) {
-                    int len = ops->breakpoint_check(db, cpu, bp->flags);
+        if (unlikely(bp_flags)) {
+            int len = ops->breakpoint_check(db, cpu, bp_flags);
 
-                    /*
-                     * The breakpoint_check hook may use DISAS_TOO_MANY
-                     * to indicate that only one more instruction is to
-                     * be executed.  Otherwise it should use DISAS_NORETURN
-                     * when generating an exception, but may use a
-                     * DISAS_TARGET_* value for Something Else.
-                     */
-                    if (db->is_jmp > DISAS_TOO_MANY) {
-                        /*
-                         * The address covered by the breakpoint must be
-                         * included in [tb->pc, tb->pc + tb->size) in order
-                         * to for it to be properly cleared.  Thus we
-                         * increment the PC here so that the logic setting
-                         * tb->size below does the right thing.
-                         */
-                        tcg_debug_assert(len > 0);
-                        db->pc_next += len;
+            /*
+             * When there is a bp hit, we're going to execute a maximum
+             * of one instruction.  The breakpoint_check hook may use
+             * DISAS_NEXT or DISAS_TOO_MANY to indicate that the current
+             * instruction should be translated.  Anything else is taken
+             * to mean that an exception has been raised and that zero
+             * instructions will be executed.
+             */
+            if (db->is_jmp > DISAS_TOO_MANY) {
+                /*
+                 * The address covered by the breakpoint must be
+                 * included in [tb->pc, tb->pc + tb->size) in order
+                 * to for it to be properly cleared.  Thus we
+                 * increment the PC here so that the logic setting
+                 * tb->size below does the right thing.
+                 */
+                tcg_debug_assert(len > 0);
+                db->pc_next += len;
 
-                        /*
-                         * The breakpoint definitely hit, so decrement the
-                         * number of instructions completed for icount.
-                         */
-                        db->num_insns--;
-                        goto done;
-                    }
-                }
+                /*
+                 * The breakpoint definitely hit, so decrement the
+                 * number of instructions completed for icount.
+                 */
+                db->num_insns--;
+                goto done;
             }
         }
 
diff --git a/cpu.c b/cpu.c
index 83059537d7..addcb5db9c 100644
--- a/cpu.c
+++ b/cpu.c
@@ -225,11 +225,6 @@ void tb_invalidate_phys_addr(target_ulong addr)
     tb_invalidate_phys_page_range(addr, addr + 1);
     mmap_unlock();
 }
-
-static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
-{
-    tb_invalidate_phys_addr(pc);
-}
 #else
 void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs)
 {
@@ -250,17 +245,6 @@ void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs)
     ram_addr = memory_region_get_ram_addr(mr) + addr;
     tb_invalidate_phys_page_range(ram_addr, ram_addr + 1);
 }
-
-static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
-{
-    /*
-     * There may not be a virtual to physical translation for the pc
-     * right now, but there may exist cached TB for this pc.
-     * Flush the whole TB cache to force re-translation of such TBs.
-     * This is heavyweight, but we're debugging anyway.
-     */
-    tb_flush(cpu);
-}
 #endif
 
 /* Add a breakpoint.  */
@@ -281,8 +265,6 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
         QTAILQ_INSERT_TAIL(&cpu->breakpoints, bp, entry);
     }
 
-    breakpoint_invalidate(cpu, pc);
-
     if (breakpoint) {
         *breakpoint = bp;
     }
@@ -310,8 +292,6 @@ void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *bp)
 {
     QTAILQ_REMOVE(&cpu->breakpoints, bp, entry);
 
-    breakpoint_invalidate(cpu, bp->pc);
-
     trace_breakpoint_remove(cpu->cpu_index, bp->pc, bp->flags);
     g_free(bp);
 }
@@ -336,10 +316,6 @@ void cpu_single_step(CPUState *cpu, int enabled)
         cpu->singlestep_enabled = enabled;
         if (kvm_enabled()) {
             kvm_update_guest_debug(cpu, 0);
-        } else {
-            /* must flush all the translated code to avoid inconsistencies */
-            /* XXX: only flush what is necessary */
-            tb_flush(cpu);
         }
         trace_breakpoint_singlestep(cpu->cpu_index, enabled);
     }
-- 
2.25.1


