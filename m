Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28073CF158
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:29:04 +0200 (CEST)
Received: from localhost ([::1]:35456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5eZD-00067H-Uc
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOu-0006l4-2B
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:24 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:43845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOr-0003Vf-VB
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:23 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 x13-20020a17090a46cdb0290175cf22899cso1521166pjg.2
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 18:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sktB4eiY9I4bWXSFU/pRtO5O5p+Es9NUgFHwnuAPhsQ=;
 b=VWW6NZ6a6qqAG15XDt/xw0Z6GgxTzwiUAVBVdXwC1PKZm1SFM3eo8QF/RgYTjhU3ez
 LCdMYKALLs+yfZPEsopxo7qGQY5IqIhs/bHnFTvZX8QsFIbtFNbl1e4U3mR+O71zNhYT
 prTbSt22xDN8T+gwES2m4oXOgdN5m1qkhUWyQzG1xocC+3vdvKHn6DyJGB5lt865x3U9
 QhlK0//J1A6Ew3W+dMVY2F114whZEJiFm6Lchzk2w2Kzx1FKEPtcL9W4lzAa86Yu9fln
 RVypLQUNIrpYFMXIkUt0T90nMkJ7gbJzTuYdRwcDph277Pw2MC+xHITD4I0m7+oWzqGt
 gCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sktB4eiY9I4bWXSFU/pRtO5O5p+Es9NUgFHwnuAPhsQ=;
 b=CM9Bp672KoAB6F3I/WNZqOoJTvIqhpAFCM3obL1rRuFvH9ujrjRAgYyFuoXbcw2mMb
 3Qo3XgZFmYwFjlh7gh6PDOeWGYScb2sfgMZFlUcQd2My6QHUJ9aI6ddfkW5vFjl0ILeb
 uneJkBgjtPsTVncw2lO5i4oYz1xZplpkCjZYJDc62Z2A3VSWjDiUYe4rGB27ta5qrco8
 tuDMDQd9+z1FWbi1KYxY9nGWK38PhTPHddFVUEIZ667nyaxbGsVp3srxlR52tFtm6yAg
 lXs9QCY4HJxSsuXjnGxxY0U7/xVsKPcNMcAiMubKxPFF7+VXIslCGxrkqZa5xo++Fbk4
 3A6g==
X-Gm-Message-State: AOAM5337wr4mtOadlKef7JrTdAzOz5VKjADchS+GEG84Hl2MUQAOZ0M3
 q7zCRAt+p8uazDA9B8Nq+EM82rZv6zdD2g==
X-Google-Smtp-Source: ABdhPJzZ3fjdXV+cIm464V5HZK/J0nA/E2q/4fjhzyTG9g/Q2uOSuZgm1dQeoKLV/QPWrIF8TsBRpw==
X-Received: by 2002:a17:90a:474f:: with SMTP id
 y15mr27749108pjg.2.1626743900712; 
 Mon, 19 Jul 2021 18:18:20 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25378054pgi.94.2021.07.19.18.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 18:18:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v5 12/15] accel/tcg: Move breakpoint recognition
 outside translation
Date: Mon, 19 Jul 2021 15:17:57 -1000
Message-Id: <20210720011800.483966-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720011800.483966-1-richard.henderson@linaro.org>
References: <20210720011800.483966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
 accel/tcg/cpu-exec.c   | 78 ++++++++++++++++++++++++++++++++++++++++--
 accel/tcg/translator.c | 24 +------------
 cpu.c                  | 20 -----------
 3 files changed, 76 insertions(+), 46 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index cde7069eb7..f5371e03d4 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -222,6 +222,63 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
     }
 }
 
+static bool check_for_breakpoints(CPUState *cpu, target_ulong pc,
+                                  uint32_t *cflags)
+{
+    CPUBreakpoint *bp;
+    bool match_page = false;
+
+    if (likely(QTAILQ_EMPTY(&cpu->breakpoints))) {
+        return false;
+    }
+
+    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
+        /*
+         * If we have an exact pc match, trigger the breakpoint.
+         * Otherwise, note matches within the page.
+         */
+        if (pc == bp->pc) {
+            bool match_bp = false;
+
+            if (bp->flags & BP_GDB) {
+                match_bp = true;
+            } else if (bp->flags & BP_CPU) {
+#ifdef CONFIG_USER_ONLY
+                g_assert_not_reached();
+#else
+                CPUClass *cc = CPU_GET_CLASS(cpu);
+                assert(cc->tcg_ops->debug_check_breakpoint);
+                match_bp = cc->tcg_ops->debug_check_breakpoint(cpu);
+#endif
+            }
+
+            if (match_bp) {
+                cpu->exception_index = EXCP_DEBUG;
+                return true;
+            }
+        } else if (((pc ^ bp->pc) & TARGET_PAGE_MASK) == 0) {
+            match_page = true;
+        }
+    }
+
+    /*
+     * Within the same page as a breakpoint, single-step,
+     * returning to helper_lookup_tb_ptr after each looking
+     * for the actual breakpoint.
+     *
+     * TODO: Perhaps better to record all of the TBs associated
+     * with a given virtual page that contains a breakpoint, and
+     * then invalidate them when a new overlapping breakpoint is
+     * set on the page.  Non-overlapping TBs would not be
+     * invalidated, nor would any TB need to be invalidated as
+     * breakpoints are removed.
+     */
+    if (match_page) {
+        *cflags = (*cflags & ~CF_COUNT_MASK) | CF_NO_GOTO_TB | 1;
+    }
+    return false;
+}
+
 /**
  * helper_lookup_tb_ptr: quick check for next tb
  * @env: current cpu state
@@ -235,11 +292,16 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
     CPUState *cpu = env_cpu(env);
     TranslationBlock *tb;
     target_ulong cs_base, pc;
-    uint32_t flags;
+    uint32_t flags, cflags;
 
     cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
 
-    tb = tb_lookup(cpu, pc, cs_base, flags, curr_cflags(cpu));
+    cflags = curr_cflags(cpu);
+    if (check_for_breakpoints(cpu, pc, &cflags)) {
+        cpu_loop_exit(cpu);
+    }
+
+    tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
     if (tb == NULL) {
         return tcg_code_gen_epilogue;
     }
@@ -346,6 +408,12 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cflags &= ~CF_PARALLEL;
         /* After 1 insn, return and release the exclusive lock. */
         cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | 1;
+        /*
+         * No need to check_for_breakpoints here.
+         * We only arrive in cpu_exec_step_atomic after beginning execution
+         * of an insn that includes an atomic operation we can't handle.
+         * Any breakpoint for this insn will have been recognized earlier.
+         */
 
         tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
         if (tb == NULL) {
@@ -837,6 +905,8 @@ int cpu_exec(CPUState *cpu)
             target_ulong cs_base, pc;
             uint32_t flags, cflags;
 
+            cpu_get_tb_cpu_state(cpu->env_ptr, &pc, &cs_base, &flags);
+
             /*
              * When requested, use an exact setting for cflags for the next
              * execution.  This is used for icount, precise smc, and stop-
@@ -851,7 +921,9 @@ int cpu_exec(CPUState *cpu)
                 cpu->cflags_next_tb = -1;
             }
 
-            cpu_get_tb_cpu_state(cpu->env_ptr, &pc, &cs_base, &flags);
+            if (check_for_breakpoints(cpu, pc, &cflags)) {
+                break;
+            }
 
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


