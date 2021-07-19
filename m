Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94EC3CEE25
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:33:58 +0200 (CEST)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ath-0000VR-TN
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aj9-0004bw-SJ
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:23:03 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aj7-0000vo-Qh
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:23:03 -0400
Received: by mail-pf1-x42f.google.com with SMTP id m83so17800411pfd.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fzLN6LJcZO2xicohFOFZSVceyKKHM7Y4lz49tfUv8WU=;
 b=RMCbkVMVo83FrqNbioGaWU0L1BqO058sKobmv9QGUn7pJZ0n1s6Z0VtO79ym2juh/c
 j5icU1iuqAalYcDOrbImDFp0C3Wmp/O/RSrZbH1ykSNK8GuOi9FO8P/XdlhcEuVCIKU+
 TsByRW9Saz5txWv7x2ZhQRgMorsrq/Y19BzZK+bV+vTwaEkexDGvpZfPjXC11kvptVEJ
 CGjzR1sSQtFevSG08htGxkwWEqjEuTe6yOFUO7g8Gx/c3FcWBe00e4k7vA5/dismzUpK
 gYRPl1VkIr0MthVD+5/p7L8Zu5AWX9NliyTNNoMfbq0Qb2w1GK6sh4cqewA00iw90/Xh
 OZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fzLN6LJcZO2xicohFOFZSVceyKKHM7Y4lz49tfUv8WU=;
 b=MlPJ67dFbiy0sUMI9hdpbLm+ickRCdRuen6ri3xy191ePrfQ3ag01of7AW6JnvNtkt
 StMz1+GcvF0LUAM+bUT9Wzyf82WWFJeKCqwAYmS0+7U08u/nM3E12cH7m52REev4yz4e
 FqzfkV7HC66ErkBKVeLtyzixM+ALXbPQ2BdTOZ/Nugx+D4zl/h7JxSvPRytjGyyZUjLW
 xALgdZvNE9SYDZa3MLqP8OCPxv1KW9rXU2Mn0xNLR1PnEq+2gZkJCWIS/NwNM7wCvKb5
 2pl/9Uuy5ptNbethdDfhWVyrGnyU9FpbPkum7Q0gWauE0hW+Y51VImf6l30GNyF4TiRU
 TvlA==
X-Gm-Message-State: AOAM531x6MkTcnqqvU19MSMPujsAF9DkPLBR6/H1biJshCnxPL++0Tx5
 PFc3nWx35yOopaLsdAy97HnH5Q+CQH6QtA==
X-Google-Smtp-Source: ABdhPJxZ4GkVDAEGxeKXbuHyvCNwWL//tFIMjPKjIkP++Z8e3LJUvRwWg6uhKjE52kWOG5Uhelie0w==
X-Received: by 2002:a63:de45:: with SMTP id y5mr26977124pgi.261.1626729780550; 
 Mon, 19 Jul 2021 14:23:00 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25008434pgi.94.2021.07.19.14.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:23:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v4 12/15] accel/tcg: Move breakpoint recognition
 outside translation
Date: Mon, 19 Jul 2021 11:22:36 -1000
Message-Id: <20210719212239.428740-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719212239.428740-1-richard.henderson@linaro.org>
References: <20210719212239.428740-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trigger breakpoints before beginning translation of a TB
that would begin with a BP.  Thus we never generate code
for the BP at all.

Single-step instructions within a page containing a BP so
that we are sure to check each insn for the BP as above.

We no longer need to flush any TBs when changing BPs.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/286
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/404
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/489
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c   | 69 ++++++++++++++++++++++++++++++++++++++++--
 accel/tcg/translator.c | 24 +--------------
 cpu.c                  | 20 ------------
 3 files changed, 68 insertions(+), 45 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 4d043a11aa..6710e15d8b 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -222,6 +222,62 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
     }
 }
 
+static uint32_t cflags_for_breakpoints(CPUState *cpu, target_ulong pc,
+                                       uint32_t cflags)
+{
+    uint32_t bflags = 0;
+
+    if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
+        CPUBreakpoint *bp;
+
+        QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
+            /*
+             * If we have an exact pc match, trigger the breakpoint.
+             * Otherwise, note matches within the page.
+             */
+            if (pc == bp->pc) {
+                bool match_bp = false;
+
+                if (bp->flags & BP_GDB) {
+                    match_bp = true;
+                } else if (bp->flags & BP_CPU) {
+#ifdef CONFIG_USER_ONLY
+                    g_assert_not_reached();
+#else
+                    CPUClass *cc = CPU_GET_CLASS(cpu);
+                    assert(cc->tcg_ops->debug_check_breakpoint);
+                    match_bp = cc->tcg_ops->debug_check_breakpoint(cpu);
+#endif
+                }
+
+                if (match_bp) {
+                    cpu->exception_index = EXCP_DEBUG;
+                    cpu_loop_exit(cpu);
+                }
+            } else if (((pc ^ bp->pc) & TARGET_PAGE_MASK) == 0) {
+                /*
+                 * Within the same page as a breakpoint, single-step,
+                 * returning to helper_lookup_tb_ptr after each looking
+                 * for the actual breakpoint.
+                 *
+                 * TODO: Perhaps better to record all of the TBs associated
+                 * with a given virtual page that contains a breakpoint, and
+                 * then invalidate them when a new overlapping breakpoint is
+                 * set on the page.  Non-overlapping TBs would not be
+                 * invalidated, nor would any TB need to be invalidated as
+                 * breakpoints are removed.
+                 */
+                bflags = CF_NO_GOTO_TB | 1;
+            }
+        }
+    }
+
+    if (unlikely(bflags)) {
+        cflags = (cflags & ~CF_COUNT_MASK) | bflags;
+    }
+    return cflags;
+}
+
 /**
  * helper_lookup_tb_ptr: quick check for next tb
  * @env: current cpu state
@@ -235,11 +291,13 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
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
@@ -346,6 +404,12 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cflags &= ~CF_PARALLEL;
         /* After 1 insn, return and release the exclusive lock. */
         cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | 1;
+        /*
+         * No need to check cflags_for_breakpoints here.
+         * We only arrive in cpu_exec_step_atomic after beginning execution
+         * of an insn that includes an atomic operation we can't handle.
+         * Any breakpoint for this insn will have been recognized earlier.
+         */
 
         tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
         if (tb == NULL) {
@@ -524,6 +588,7 @@ static inline TranslationBlock *tb_find(CPUState *cpu,
     } else {
         cpu->cflags_next_tb = -1;
     }
+    cflags = cflags_for_breakpoints(cpu, pc, cflags);
 
     tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
     if (tb == NULL) {
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index a59eb7c11b..4f3728c278 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -50,7 +50,6 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
 void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
                      CPUState *cpu, TranslationBlock *tb, int max_insns)
 {
-    int bp_insn = 0;
     bool plugin_enabled;
 
     /* Initialize DisasContext */
@@ -85,27 +84,6 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
             plugin_gen_insn_start(cpu, db);
         }
 
-        /* Pass breakpoint hits to target for further processing */
-        if (!db->singlestep_enabled
-            && unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
-            CPUBreakpoint *bp;
-            QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
-                if (bp->pc == db->pc_next) {
-                    if (ops->breakpoint_check(db, cpu, bp)) {
-                        bp_insn = 1;
-                        break;
-                    }
-                }
-            }
-            /* The breakpoint_check hook may use DISAS_TOO_MANY to indicate
-               that only one more instruction is to be executed.  Otherwise
-               it should use DISAS_NORETURN when generating an exception,
-               but may use a DISAS_TARGET_* value for Something Else.  */
-            if (db->is_jmp > DISAS_TOO_MANY) {
-                break;
-            }
-        }
-
         /* Disassemble one instruction.  The translate_insn hook should
            update db->pc_next and db->is_jmp to indicate what should be
            done next -- either exiting this loop or locate the start of
@@ -144,7 +122,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
 
     /* Emit code to exit the TB, as indicated by db->is_jmp.  */
     ops->tb_stop(db, cpu);
-    gen_tb_end(db->tb, db->num_insns - bp_insn);
+    gen_tb_end(db->tb, db->num_insns);
 
     if (plugin_enabled) {
         plugin_gen_tb_end(cpu);
diff --git a/cpu.c b/cpu.c
index 83059537d7..660b56f431 100644
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
-- 
2.25.1


