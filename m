Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0505F4A58
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 22:35:07 +0200 (CEST)
Received: from localhost ([::1]:59850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofod8-0006LQ-1v
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 16:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyW-0002Ei-WD
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:53:10 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyS-0000JM-R8
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:53:07 -0400
Received: by mail-pl1-x630.google.com with SMTP id x1so13564547plv.5
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HLcUorCJlB4lSvVTCc9YU9rdFfxf313/xQ83iKPFDkY=;
 b=po5HvnpOQF1VJWF6Lx8qW00fMOq+Ut7aItfQtoLTDLAogxOzfphSqnD5f29rsXoMUb
 Kz8ChcYRvGIyHXWqWF2agoQ8aqQXnuKVZR8ra+BMOk75ZeaU4Pj0s9zEnubA2+REQnCt
 btZWNWka45fWGCtY431R3NkWcWkm/V3l2qmMCb/dqfaYvy6s+8nHeZV6XiYq76HbXT9Z
 GnIH3XkmhKE6jYHfOhOUjy49Eh6ypayc4AWuQyWaw6pjWkzM/61YRMj9FpnHCuMEl2lu
 5TAxpnV84fOEJ4csO9S04Zh7l6moJKCvuMyegXSrztsZ4mlsRnCnVz6jd67r4cBN626r
 NHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HLcUorCJlB4lSvVTCc9YU9rdFfxf313/xQ83iKPFDkY=;
 b=KR4AGTPaT6MJDZDooO42EqHfDhg6KtrUzq40Ezd2tALPWtwxt7SwqBEOtnjx8NQ1Sz
 8TqBuQAtTcZqQ/a+avBqgYRYFWb4FVeRh67RqFM9v7UofJTlr+50gr1BkZ+MIpgHj1V0
 Fiv9zS6W2DHJyp+YjDjI+GXNCza6mFUniWOB5pZU1TfqBX56qgGu27i1O6JkleRW2dXB
 6bkPiqHNVm76uUmPabQ8KIturxcVZZ8yzoD5g+AO+H99bh+USWsyGhojPqac0uCQZZrh
 /yj6yWtvdqP7TzzSC7x1yr6da4Nd7QZiK6Yw1qAiVpGCt/YXe34ugUCp2pxHRmB0GaPs
 SKOA==
X-Gm-Message-State: ACrzQf2b2xTDE/kTMGD61CM6gecEgf/RzKVelgx68t+2fTEWWN/0ZaBc
 Pqszs5UfaWsznXqN9At9UrT8OuXJgNU07w==
X-Google-Smtp-Source: AMsMyM7P94nVJT8XGC1m7L1Ax9ETrZwj3rxhEVcs4Tyr/HSsCOmpAwULBevE544qVhLX9JU/8gBMaA==
X-Received: by 2002:a17:90a:fe13:b0:20a:8fc8:60ec with SMTP id
 ck19-20020a17090afe1300b0020a8fc860ecmr1314006pjb.69.1664913183440; 
 Tue, 04 Oct 2022 12:53:03 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a1709026e1700b00172973d3cd9sm9293406plk.55.2022.10.04.12.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 12:53:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PULL 20/20] target/sh4: Fix TB_FLAG_UNALIGN
Date: Tue,  4 Oct 2022 12:52:41 -0700
Message-Id: <20221004195241.46491-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004195241.46491-1-richard.henderson@linaro.org>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

The value previously chosen overlaps GUSA_MASK.

Rename all DELAY_SLOT_* and GUSA_* defines to emphasize
that they are included in TB_FLAGs.  Add aliases for the
FPSCR and SR bits that are included in TB_FLAGS, so that
we don't accidentally reassign those bits.

Fixes: 4da06fb3062 ("target/sh4: Implement prctl_unalign_sigbus")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/856
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/cpu.h        | 56 +++++++++++++------------
 linux-user/sh4/signal.c |  6 +--
 target/sh4/cpu.c        |  6 +--
 target/sh4/helper.c     |  6 +--
 target/sh4/translate.c  | 90 ++++++++++++++++++++++-------------------
 5 files changed, 88 insertions(+), 76 deletions(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 9f15ef913c..727b829598 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -78,26 +78,33 @@
 #define FPSCR_RM_NEAREST       (0 << 0)
 #define FPSCR_RM_ZERO          (1 << 0)
 
-#define DELAY_SLOT_MASK        0x7
-#define DELAY_SLOT             (1 << 0)
-#define DELAY_SLOT_CONDITIONAL (1 << 1)
-#define DELAY_SLOT_RTE         (1 << 2)
+#define TB_FLAG_DELAY_SLOT       (1 << 0)
+#define TB_FLAG_DELAY_SLOT_COND  (1 << 1)
+#define TB_FLAG_DELAY_SLOT_RTE   (1 << 2)
+#define TB_FLAG_PENDING_MOVCA    (1 << 3)
+#define TB_FLAG_GUSA_SHIFT       4                      /* [11:4] */
+#define TB_FLAG_GUSA_EXCLUSIVE   (1 << 12)
+#define TB_FLAG_UNALIGN          (1 << 13)
+#define TB_FLAG_SR_FD            (1 << SR_FD)           /* 15 */
+#define TB_FLAG_FPSCR_PR         FPSCR_PR               /* 19 */
+#define TB_FLAG_FPSCR_SZ         FPSCR_SZ               /* 20 */
+#define TB_FLAG_FPSCR_FR         FPSCR_FR               /* 21 */
+#define TB_FLAG_SR_RB            (1 << SR_RB)           /* 29 */
+#define TB_FLAG_SR_MD            (1 << SR_MD)           /* 30 */
 
-#define TB_FLAG_PENDING_MOVCA  (1 << 3)
-#define TB_FLAG_UNALIGN        (1 << 4)
-
-#define GUSA_SHIFT             4
-#ifdef CONFIG_USER_ONLY
-#define GUSA_EXCLUSIVE         (1 << 12)
-#define GUSA_MASK              ((0xff << GUSA_SHIFT) | GUSA_EXCLUSIVE)
-#else
-/* Provide dummy versions of the above to allow tests against tbflags
-   to be elided while avoiding ifdefs.  */
-#define GUSA_EXCLUSIVE         0
-#define GUSA_MASK              0
-#endif
-
-#define TB_FLAG_ENVFLAGS_MASK  (DELAY_SLOT_MASK | GUSA_MASK)
+#define TB_FLAG_DELAY_SLOT_MASK  (TB_FLAG_DELAY_SLOT |       \
+                                  TB_FLAG_DELAY_SLOT_COND |  \
+                                  TB_FLAG_DELAY_SLOT_RTE)
+#define TB_FLAG_GUSA_MASK        ((0xff << TB_FLAG_GUSA_SHIFT) | \
+                                  TB_FLAG_GUSA_EXCLUSIVE)
+#define TB_FLAG_FPSCR_MASK       (TB_FLAG_FPSCR_PR | \
+                                  TB_FLAG_FPSCR_SZ | \
+                                  TB_FLAG_FPSCR_FR)
+#define TB_FLAG_SR_MASK          (TB_FLAG_SR_FD | \
+                                  TB_FLAG_SR_RB | \
+                                  TB_FLAG_SR_MD)
+#define TB_FLAG_ENVFLAGS_MASK    (TB_FLAG_DELAY_SLOT_MASK | \
+                                  TB_FLAG_GUSA_MASK)
 
 typedef struct tlb_t {
     uint32_t vpn;		/* virtual page number */
@@ -258,7 +265,7 @@ static inline int cpu_mmu_index (CPUSH4State *env, bool ifetch)
 {
     /* The instruction in a RTE delay slot is fetched in privileged
        mode, but executed in user mode.  */
-    if (ifetch && (env->flags & DELAY_SLOT_RTE)) {
+    if (ifetch && (env->flags & TB_FLAG_DELAY_SLOT_RTE)) {
         return 0;
     } else {
         return (env->sr & (1u << SR_MD)) == 0 ? 1 : 0;
@@ -366,11 +373,10 @@ static inline void cpu_get_tb_cpu_state(CPUSH4State *env, target_ulong *pc,
 {
     *pc = env->pc;
     /* For a gUSA region, notice the end of the region.  */
-    *cs_base = env->flags & GUSA_MASK ? env->gregs[0] : 0;
-    *flags = env->flags /* TB_FLAG_ENVFLAGS_MASK: bits 0-2, 4-12 */
-            | (env->fpscr & (FPSCR_FR | FPSCR_SZ | FPSCR_PR))  /* Bits 19-21 */
-            | (env->sr & ((1u << SR_MD) | (1u << SR_RB)))      /* Bits 29-30 */
-            | (env->sr & (1u << SR_FD))                        /* Bit 15 */
+    *cs_base = env->flags & TB_FLAG_GUSA_MASK ? env->gregs[0] : 0;
+    *flags = env->flags
+            | (env->fpscr & TB_FLAG_FPSCR_MASK)
+            | (env->sr & TB_FLAG_SR_MASK)
             | (env->movcal_backup ? TB_FLAG_PENDING_MOVCA : 0); /* Bit 3 */
 #ifdef CONFIG_USER_ONLY
     *flags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
index f6a18bc6b5..c4ba962708 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -161,7 +161,7 @@ static void restore_sigcontext(CPUSH4State *regs, struct target_sigcontext *sc)
     __get_user(regs->fpul, &sc->sc_fpul);
 
     regs->tra = -1;         /* disable syscall checks */
-    regs->flags &= ~(DELAY_SLOT_MASK | GUSA_MASK);
+    regs->flags = 0;
 }
 
 void setup_frame(int sig, struct target_sigaction *ka,
@@ -199,7 +199,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     regs->gregs[5] = 0;
     regs->gregs[6] = frame_addr += offsetof(typeof(*frame), sc);
     regs->pc = (unsigned long) ka->_sa_handler;
-    regs->flags &= ~(DELAY_SLOT_MASK | GUSA_MASK);
+    regs->flags &= ~(TB_FLAG_DELAY_SLOT_MASK | TB_FLAG_GUSA_MASK);
 
     unlock_user_struct(frame, frame_addr, 1);
     return;
@@ -251,7 +251,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     regs->gregs[5] = frame_addr + offsetof(typeof(*frame), info);
     regs->gregs[6] = frame_addr + offsetof(typeof(*frame), uc);
     regs->pc = (unsigned long) ka->_sa_handler;
-    regs->flags &= ~(DELAY_SLOT_MASK | GUSA_MASK);
+    regs->flags &= ~(TB_FLAG_DELAY_SLOT_MASK | TB_FLAG_GUSA_MASK);
 
     unlock_user_struct(frame, frame_addr, 1);
     return;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index a65a66de43..56c50530da 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -47,7 +47,7 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
     SuperHCPU *cpu = SUPERH_CPU(cs);
 
     cpu->env.pc = tb_pc(tb);
-    cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
+    cpu->env.flags = tb->flags;
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -57,10 +57,10 @@ static bool superh_io_recompile_replay_branch(CPUState *cs,
     SuperHCPU *cpu = SUPERH_CPU(cs);
     CPUSH4State *env = &cpu->env;
 
-    if ((env->flags & ((DELAY_SLOT | DELAY_SLOT_CONDITIONAL))) != 0
+    if ((env->flags & (TB_FLAG_DELAY_SLOT | TB_FLAG_DELAY_SLOT_COND))
         && env->pc != tb_pc(tb)) {
         env->pc -= 2;
-        env->flags &= ~(DELAY_SLOT | DELAY_SLOT_CONDITIONAL);
+        env->flags &= ~(TB_FLAG_DELAY_SLOT | TB_FLAG_DELAY_SLOT_COND);
         return true;
     }
     return false;
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 6a620e36fc..e02e7af607 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -147,11 +147,11 @@ void superh_cpu_do_interrupt(CPUState *cs)
     env->sr |= (1u << SR_BL) | (1u << SR_MD) | (1u << SR_RB);
     env->lock_addr = -1;
 
-    if (env->flags & DELAY_SLOT_MASK) {
+    if (env->flags & TB_FLAG_DELAY_SLOT_MASK) {
         /* Branch instruction should be executed again before delay slot. */
 	env->spc -= 2;
 	/* Clear flags for exception/interrupt routine. */
-        env->flags &= ~DELAY_SLOT_MASK;
+        env->flags &= ~TB_FLAG_DELAY_SLOT_MASK;
     }
 
     if (do_exp) {
@@ -786,7 +786,7 @@ bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         CPUSH4State *env = &cpu->env;
 
         /* Delay slots are indivisible, ignore interrupts */
-        if (env->flags & DELAY_SLOT_MASK) {
+        if (env->flags & TB_FLAG_DELAY_SLOT_MASK) {
             return false;
         } else {
             superh_cpu_do_interrupt(cs);
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 01056571c3..26231b2a5a 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -175,13 +175,13 @@ void superh_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 		    i, env->gregs[i], i + 1, env->gregs[i + 1],
 		    i + 2, env->gregs[i + 2], i + 3, env->gregs[i + 3]);
     }
-    if (env->flags & DELAY_SLOT) {
+    if (env->flags & TB_FLAG_DELAY_SLOT) {
         qemu_printf("in delay slot (delayed_pc=0x%08x)\n",
 		    env->delayed_pc);
-    } else if (env->flags & DELAY_SLOT_CONDITIONAL) {
+    } else if (env->flags & TB_FLAG_DELAY_SLOT_COND) {
         qemu_printf("in conditional delay slot (delayed_pc=0x%08x)\n",
 		    env->delayed_pc);
-    } else if (env->flags & DELAY_SLOT_RTE) {
+    } else if (env->flags & TB_FLAG_DELAY_SLOT_RTE) {
         qemu_fprintf(f, "in rte delay slot (delayed_pc=0x%08x)\n",
                      env->delayed_pc);
     }
@@ -223,7 +223,7 @@ static inline void gen_save_cpu_state(DisasContext *ctx, bool save_pc)
 
 static inline bool use_exit_tb(DisasContext *ctx)
 {
-    return (ctx->tbflags & GUSA_EXCLUSIVE) != 0;
+    return (ctx->tbflags & TB_FLAG_GUSA_EXCLUSIVE) != 0;
 }
 
 static bool use_goto_tb(DisasContext *ctx, target_ulong dest)
@@ -276,12 +276,12 @@ static void gen_conditional_jump(DisasContext *ctx, target_ulong dest,
     TCGLabel *l1 = gen_new_label();
     TCGCond cond_not_taken = jump_if_true ? TCG_COND_EQ : TCG_COND_NE;
 
-    if (ctx->tbflags & GUSA_EXCLUSIVE) {
+    if (ctx->tbflags & TB_FLAG_GUSA_EXCLUSIVE) {
         /* When in an exclusive region, we must continue to the end.
            Therefore, exit the region on a taken branch, but otherwise
            fall through to the next instruction.  */
         tcg_gen_brcondi_i32(cond_not_taken, cpu_sr_t, 0, l1);
-        tcg_gen_movi_i32(cpu_flags, ctx->envflags & ~GUSA_MASK);
+        tcg_gen_movi_i32(cpu_flags, ctx->envflags & ~TB_FLAG_GUSA_MASK);
         /* Note that this won't actually use a goto_tb opcode because we
            disallow it in use_goto_tb, but it handles exit + singlestep.  */
         gen_goto_tb(ctx, 0, dest);
@@ -307,14 +307,14 @@ static void gen_delayed_conditional_jump(DisasContext * ctx)
     tcg_gen_mov_i32(ds, cpu_delayed_cond);
     tcg_gen_discard_i32(cpu_delayed_cond);
 
-    if (ctx->tbflags & GUSA_EXCLUSIVE) {
+    if (ctx->tbflags & TB_FLAG_GUSA_EXCLUSIVE) {
         /* When in an exclusive region, we must continue to the end.
            Therefore, exit the region on a taken branch, but otherwise
            fall through to the next instruction.  */
         tcg_gen_brcondi_i32(TCG_COND_EQ, ds, 0, l1);
 
         /* Leave the gUSA region.  */
-        tcg_gen_movi_i32(cpu_flags, ctx->envflags & ~GUSA_MASK);
+        tcg_gen_movi_i32(cpu_flags, ctx->envflags & ~TB_FLAG_GUSA_MASK);
         gen_jump(ctx);
 
         gen_set_label(l1);
@@ -361,8 +361,8 @@ static inline void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
 #define XHACK(x) ((((x) & 1 ) << 4) | ((x) & 0xe))
 
 #define CHECK_NOT_DELAY_SLOT \
-    if (ctx->envflags & DELAY_SLOT_MASK) {  \
-        goto do_illegal_slot;               \
+    if (ctx->envflags & TB_FLAG_DELAY_SLOT_MASK) {  \
+        goto do_illegal_slot;                       \
     }
 
 #define CHECK_PRIVILEGED \
@@ -436,7 +436,7 @@ static void _decode_opc(DisasContext * ctx)
     case 0x000b:		/* rts */
 	CHECK_NOT_DELAY_SLOT
 	tcg_gen_mov_i32(cpu_delayed_pc, cpu_pr);
-        ctx->envflags |= DELAY_SLOT;
+        ctx->envflags |= TB_FLAG_DELAY_SLOT;
 	ctx->delayed_pc = (uint32_t) - 1;
 	return;
     case 0x0028:		/* clrmac */
@@ -458,7 +458,7 @@ static void _decode_opc(DisasContext * ctx)
 	CHECK_NOT_DELAY_SLOT
         gen_write_sr(cpu_ssr);
 	tcg_gen_mov_i32(cpu_delayed_pc, cpu_spc);
-        ctx->envflags |= DELAY_SLOT_RTE;
+        ctx->envflags |= TB_FLAG_DELAY_SLOT_RTE;
 	ctx->delayed_pc = (uint32_t) - 1;
         ctx->base.is_jmp = DISAS_STOP;
 	return;
@@ -513,12 +513,15 @@ static void _decode_opc(DisasContext * ctx)
 	return;
     case 0xe000:		/* mov #imm,Rn */
 #ifdef CONFIG_USER_ONLY
-        /* Detect the start of a gUSA region.  If so, update envflags
-           and end the TB.  This will allow us to see the end of the
-           region (stored in R0) in the next TB.  */
+        /*
+         * Detect the start of a gUSA region (mov #-n, r15).
+         * If so, update envflags and end the TB.  This will allow us
+         * to see the end of the region (stored in R0) in the next TB.
+         */
         if (B11_8 == 15 && B7_0s < 0 &&
             (tb_cflags(ctx->base.tb) & CF_PARALLEL)) {
-            ctx->envflags = deposit32(ctx->envflags, GUSA_SHIFT, 8, B7_0s);
+            ctx->envflags =
+                deposit32(ctx->envflags, TB_FLAG_GUSA_SHIFT, 8, B7_0s);
             ctx->base.is_jmp = DISAS_STOP;
         }
 #endif
@@ -544,13 +547,13 @@ static void _decode_opc(DisasContext * ctx)
     case 0xa000:		/* bra disp */
 	CHECK_NOT_DELAY_SLOT
         ctx->delayed_pc = ctx->base.pc_next + 4 + B11_0s * 2;
-        ctx->envflags |= DELAY_SLOT;
+        ctx->envflags |= TB_FLAG_DELAY_SLOT;
 	return;
     case 0xb000:		/* bsr disp */
 	CHECK_NOT_DELAY_SLOT
         tcg_gen_movi_i32(cpu_pr, ctx->base.pc_next + 4);
         ctx->delayed_pc = ctx->base.pc_next + 4 + B11_0s * 2;
-        ctx->envflags |= DELAY_SLOT;
+        ctx->envflags |= TB_FLAG_DELAY_SLOT;
 	return;
     }
 
@@ -1194,7 +1197,7 @@ static void _decode_opc(DisasContext * ctx)
 	CHECK_NOT_DELAY_SLOT
         tcg_gen_xori_i32(cpu_delayed_cond, cpu_sr_t, 1);
         ctx->delayed_pc = ctx->base.pc_next + 4 + B7_0s * 2;
-        ctx->envflags |= DELAY_SLOT_CONDITIONAL;
+        ctx->envflags |= TB_FLAG_DELAY_SLOT_COND;
 	return;
     case 0x8900:		/* bt label */
 	CHECK_NOT_DELAY_SLOT
@@ -1204,7 +1207,7 @@ static void _decode_opc(DisasContext * ctx)
 	CHECK_NOT_DELAY_SLOT
         tcg_gen_mov_i32(cpu_delayed_cond, cpu_sr_t);
         ctx->delayed_pc = ctx->base.pc_next + 4 + B7_0s * 2;
-        ctx->envflags |= DELAY_SLOT_CONDITIONAL;
+        ctx->envflags |= TB_FLAG_DELAY_SLOT_COND;
 	return;
     case 0x8800:		/* cmp/eq #imm,R0 */
         tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, REG(0), B7_0s);
@@ -1388,14 +1391,14 @@ static void _decode_opc(DisasContext * ctx)
     case 0x0023:		/* braf Rn */
 	CHECK_NOT_DELAY_SLOT
         tcg_gen_addi_i32(cpu_delayed_pc, REG(B11_8), ctx->base.pc_next + 4);
-        ctx->envflags |= DELAY_SLOT;
+        ctx->envflags |= TB_FLAG_DELAY_SLOT;
 	ctx->delayed_pc = (uint32_t) - 1;
 	return;
     case 0x0003:		/* bsrf Rn */
 	CHECK_NOT_DELAY_SLOT
         tcg_gen_movi_i32(cpu_pr, ctx->base.pc_next + 4);
 	tcg_gen_add_i32(cpu_delayed_pc, REG(B11_8), cpu_pr);
-        ctx->envflags |= DELAY_SLOT;
+        ctx->envflags |= TB_FLAG_DELAY_SLOT;
 	ctx->delayed_pc = (uint32_t) - 1;
 	return;
     case 0x4015:		/* cmp/pl Rn */
@@ -1411,14 +1414,14 @@ static void _decode_opc(DisasContext * ctx)
     case 0x402b:		/* jmp @Rn */
 	CHECK_NOT_DELAY_SLOT
 	tcg_gen_mov_i32(cpu_delayed_pc, REG(B11_8));
-        ctx->envflags |= DELAY_SLOT;
+        ctx->envflags |= TB_FLAG_DELAY_SLOT;
 	ctx->delayed_pc = (uint32_t) - 1;
 	return;
     case 0x400b:		/* jsr @Rn */
 	CHECK_NOT_DELAY_SLOT
         tcg_gen_movi_i32(cpu_pr, ctx->base.pc_next + 4);
 	tcg_gen_mov_i32(cpu_delayed_pc, REG(B11_8));
-        ctx->envflags |= DELAY_SLOT;
+        ctx->envflags |= TB_FLAG_DELAY_SLOT;
 	ctx->delayed_pc = (uint32_t) - 1;
 	return;
     case 0x400e:		/* ldc Rm,SR */
@@ -1839,7 +1842,7 @@ static void _decode_opc(DisasContext * ctx)
     fflush(stderr);
 #endif
  do_illegal:
-    if (ctx->envflags & DELAY_SLOT_MASK) {
+    if (ctx->envflags & TB_FLAG_DELAY_SLOT_MASK) {
  do_illegal_slot:
         gen_save_cpu_state(ctx, true);
         gen_helper_raise_slot_illegal_instruction(cpu_env);
@@ -1852,7 +1855,7 @@ static void _decode_opc(DisasContext * ctx)
 
  do_fpu_disabled:
     gen_save_cpu_state(ctx, true);
-    if (ctx->envflags & DELAY_SLOT_MASK) {
+    if (ctx->envflags & TB_FLAG_DELAY_SLOT_MASK) {
         gen_helper_raise_slot_fpu_disable(cpu_env);
     } else {
         gen_helper_raise_fpu_disable(cpu_env);
@@ -1867,23 +1870,23 @@ static void decode_opc(DisasContext * ctx)
 
     _decode_opc(ctx);
 
-    if (old_flags & DELAY_SLOT_MASK) {
+    if (old_flags & TB_FLAG_DELAY_SLOT_MASK) {
         /* go out of the delay slot */
-        ctx->envflags &= ~DELAY_SLOT_MASK;
+        ctx->envflags &= ~TB_FLAG_DELAY_SLOT_MASK;
 
         /* When in an exclusive region, we must continue to the end
            for conditional branches.  */
-        if (ctx->tbflags & GUSA_EXCLUSIVE
-            && old_flags & DELAY_SLOT_CONDITIONAL) {
+        if (ctx->tbflags & TB_FLAG_GUSA_EXCLUSIVE
+            && old_flags & TB_FLAG_DELAY_SLOT_COND) {
             gen_delayed_conditional_jump(ctx);
             return;
         }
         /* Otherwise this is probably an invalid gUSA region.
            Drop the GUSA bits so the next TB doesn't see them.  */
-        ctx->envflags &= ~GUSA_MASK;
+        ctx->envflags &= ~TB_FLAG_GUSA_MASK;
 
         tcg_gen_movi_i32(cpu_flags, ctx->envflags);
-        if (old_flags & DELAY_SLOT_CONDITIONAL) {
+        if (old_flags & TB_FLAG_DELAY_SLOT_COND) {
 	    gen_delayed_conditional_jump(ctx);
         } else {
             gen_jump(ctx);
@@ -2223,7 +2226,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
     }
 
     /* The entire region has been translated.  */
-    ctx->envflags &= ~GUSA_MASK;
+    ctx->envflags &= ~TB_FLAG_GUSA_MASK;
     ctx->base.pc_next = pc_end;
     ctx->base.num_insns += max_insns - 1;
     return;
@@ -2234,7 +2237,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
 
     /* Restart with the EXCLUSIVE bit set, within a TB run via
        cpu_exec_step_atomic holding the exclusive lock.  */
-    ctx->envflags |= GUSA_EXCLUSIVE;
+    ctx->envflags |= TB_FLAG_GUSA_EXCLUSIVE;
     gen_save_cpu_state(ctx, false);
     gen_helper_exclusive(cpu_env);
     ctx->base.is_jmp = DISAS_NORETURN;
@@ -2267,17 +2270,19 @@ static void sh4_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
                   (tbflags & (1 << SR_RB))) * 0x10;
     ctx->fbank = tbflags & FPSCR_FR ? 0x10 : 0;
 
-    if (tbflags & GUSA_MASK) {
+#ifdef CONFIG_USER_ONLY
+    if (tbflags & TB_FLAG_GUSA_MASK) {
+        /* In gUSA exclusive region. */
         uint32_t pc = ctx->base.pc_next;
         uint32_t pc_end = ctx->base.tb->cs_base;
-        int backup = sextract32(ctx->tbflags, GUSA_SHIFT, 8);
+        int backup = sextract32(ctx->tbflags, TB_FLAG_GUSA_SHIFT, 8);
         int max_insns = (pc_end - pc) / 2;
 
         if (pc != pc_end + backup || max_insns < 2) {
             /* This is a malformed gUSA region.  Don't do anything special,
                since the interpreter is likely to get confused.  */
-            ctx->envflags &= ~GUSA_MASK;
-        } else if (tbflags & GUSA_EXCLUSIVE) {
+            ctx->envflags &= ~TB_FLAG_GUSA_MASK;
+        } else if (tbflags & TB_FLAG_GUSA_EXCLUSIVE) {
             /* Regardless of single-stepping or the end of the page,
                we must complete execution of the gUSA region while
                holding the exclusive lock.  */
@@ -2285,6 +2290,7 @@ static void sh4_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
             return;
         }
     }
+#endif
 
     /* Since the ISA is fixed-width, we can bound by the number
        of instructions remaining on the page.  */
@@ -2309,8 +2315,8 @@ static void sh4_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
 #ifdef CONFIG_USER_ONLY
-    if (unlikely(ctx->envflags & GUSA_MASK)
-        && !(ctx->envflags & GUSA_EXCLUSIVE)) {
+    if (unlikely(ctx->envflags & TB_FLAG_GUSA_MASK)
+        && !(ctx->envflags & TB_FLAG_GUSA_EXCLUSIVE)) {
         /* We're in an gUSA region, and we have not already fallen
            back on using an exclusive region.  Attempt to parse the
            region into a single supported atomic operation.  Failure
@@ -2330,9 +2336,9 @@ static void sh4_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
-    if (ctx->tbflags & GUSA_EXCLUSIVE) {
+    if (ctx->tbflags & TB_FLAG_GUSA_EXCLUSIVE) {
         /* Ending the region of exclusivity.  Clear the bits.  */
-        ctx->envflags &= ~GUSA_MASK;
+        ctx->envflags &= ~TB_FLAG_GUSA_MASK;
     }
 
     switch (ctx->base.is_jmp) {
-- 
2.34.1


