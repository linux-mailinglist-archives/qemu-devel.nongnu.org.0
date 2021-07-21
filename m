Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1A93D17DB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:18:14 +0200 (CEST)
Received: from localhost ([::1]:39082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IfV-0000ZU-NO
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOT-00031m-9f
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:38 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:47080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOP-00061F-09
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:37 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 nt18-20020a17090b2492b02901765d605e14so972372pjb.5
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WLlNOYb7V1szy63ymfXSKL8yHvS0NPcKsC3nVJw2dt4=;
 b=D9jPMEp1XjKm8nv0Y+A6UHZvKqtfRyoReYF1FbW7cX/ygVJoaDsQVq5ub8VYMtcrkF
 76dxIbJHZlHQPyKyf6XMvobA9Qn/2w/Hak9huxAIwkobJaqOESrBqLe29nUwpwvfstmY
 xSSGAJMYyZqm6SlLmcV9yWU1OIR73y2p1Gnyoho3/rVwnD4FeOIR0jRf0la9g1cgu0FW
 WdJj9ZUGrzGN5GKj1U7qBzS6e0n37nU2ZUMyQSJPwhkbzcFbTYpXCCyreQA+9yMEb1br
 SZ0UTbbe64cnPa+peJ62/sq3bG0Xm8Zsopxkm1wwrDsZNX4wGhERiY1Yn5RRFIuA0J/B
 cf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WLlNOYb7V1szy63ymfXSKL8yHvS0NPcKsC3nVJw2dt4=;
 b=aR8wgokI6g17gHXFywTXn1OfLgQmSrZbY7HdyZNLbtoaMILYgKF+cRjbzMCi2pgcpp
 oLDCU65vqG4XL4TbTnazrEwMqkk89EnSwwRXgmuSZZ15cCAn/RaNWFvSPSjqu4hzhyTN
 2cJyDrZusURmXPs0ZiUuvkOmhDpLZ79UIyN1KF3KrGyYEQefNtY8PIoiessUwVdvmiZj
 VbgNHu6Ay7iOFvFkIHImL9wk0sgd7sPinzkhTAjgjKSabRJj2PmPOmcqDB6TjeSww84Q
 UaMTWB27RPP9chI+KRV4hV9wpJEFOuMzNIb+mUMzgKBJitFRskLG0IKyoqpioCRctbzY
 EMAQ==
X-Gm-Message-State: AOAM531aROsvkdKe0xt7y8qGRBHRVzCSvHBcD30V86b0gp49fQIhiyyF
 JcPYfH5xEcjuEIl3MoQI91N8nI5JmNdyeg==
X-Google-Smtp-Source: ABdhPJygSrqr6d+8DU3P2eCphnEKWV66IxLyhMd2zN3DsLk/MY2lBN/EtzNn2GWcdPleUMAhY9tDoA==
X-Received: by 2002:a17:902:6b82:b029:120:3404:ce99 with SMTP id
 p2-20020a1709026b82b02901203404ce99mr28608151plk.49.1626897630999; 
 Wed, 21 Jul 2021 13:00:30 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/27] accel/tcg: Remove TranslatorOps.breakpoint_check
Date: Wed, 21 Jul 2021 09:59:52 -1000
Message-Id: <20210721195954.879535-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The hook is now unused, with breakpoints checked outside translation.

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h     | 11 -----------
 target/arm/helper.h           |  2 --
 target/alpha/translate.c      | 16 ----------------
 target/arm/debug_helper.c     |  7 -------
 target/arm/translate-a64.c    | 25 -------------------------
 target/arm/translate.c        | 29 -----------------------------
 target/avr/translate.c        | 18 ------------------
 target/cris/translate.c       | 20 --------------------
 target/hexagon/translate.c    | 17 -----------------
 target/hppa/translate.c       | 11 -----------
 target/i386/tcg/translate.c   | 28 ----------------------------
 target/m68k/translate.c       | 18 ------------------
 target/microblaze/translate.c | 18 ------------------
 target/mips/tcg/translate.c   | 19 -------------------
 target/nios2/translate.c      | 27 ---------------------------
 target/openrisc/translate.c   | 17 -----------------
 target/ppc/translate.c        | 18 ------------------
 target/riscv/translate.c      | 17 -----------------
 target/rx/translate.c         | 14 --------------
 target/s390x/tcg/translate.c  | 24 ------------------------
 target/sh4/translate.c        | 18 ------------------
 target/sparc/translate.c      | 17 -----------------
 target/tricore/translate.c    | 16 ----------------
 target/xtensa/translate.c     | 17 -----------------
 24 files changed, 424 deletions(-)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index dd9c06d40d..d318803267 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -89,15 +89,6 @@ typedef struct DisasContextBase {
  * @insn_start:
  *      Emit the tcg_gen_insn_start opcode.
  *
- * @breakpoint_check:
- *      When called, the breakpoint has already been checked to match the PC,
- *      but the target may decide the breakpoint missed the address
- *      (e.g., due to conditions encoded in their flags).  Return true to
- *      indicate that the breakpoint did hit, in which case no more breakpoints
- *      are checked.  If the breakpoint did hit, emit any code required to
- *      signal the exception, and set db->is_jmp as necessary to terminate
- *      the main loop.
- *
  * @translate_insn:
  *      Disassemble one instruction and set db->pc_next for the start
  *      of the following instruction.  Set db->is_jmp as necessary to
@@ -113,8 +104,6 @@ typedef struct TranslatorOps {
     void (*init_disas_context)(DisasContextBase *db, CPUState *cpu);
     void (*tb_start)(DisasContextBase *db, CPUState *cpu);
     void (*insn_start)(DisasContextBase *db, CPUState *cpu);
-    bool (*breakpoint_check)(DisasContextBase *db, CPUState *cpu,
-                             const CPUBreakpoint *bp);
     void (*translate_insn)(DisasContextBase *db, CPUState *cpu);
     void (*tb_stop)(DisasContextBase *db, CPUState *cpu);
     void (*disas_log)(const DisasContextBase *db, CPUState *cpu);
diff --git a/target/arm/helper.h b/target/arm/helper.h
index db87d7d537..248569b0cd 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -54,8 +54,6 @@ DEF_HELPER_1(yield, void, env)
 DEF_HELPER_1(pre_hvc, void, env)
 DEF_HELPER_2(pre_smc, void, env, i32)
 
-DEF_HELPER_1(check_breakpoints, void, env)
-
 DEF_HELPER_3(cpsr_write, void, env, i32, i32)
 DEF_HELPER_2(cpsr_write_eret, void, env, i32)
 DEF_HELPER_1(cpsr_read, i32, env)
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 949ba6ffde..de6c0a8439 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -2967,21 +2967,6 @@ static void alpha_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(dcbase->pc_next);
 }
 
-static bool alpha_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                      const CPUBreakpoint *bp)
-{
-    DisasContext *ctx = container_of(dcbase, DisasContext, base);
-
-    ctx->base.is_jmp = gen_excp(ctx, EXCP_DEBUG, 0);
-
-    /* The address covered by the breakpoint must be included in
-       [tb->pc, tb->pc + tb->size) in order to for it to be
-       properly cleared -- thus we increment the PC here so that
-       the logic setting tb->size below does the right thing.  */
-    ctx->base.pc_next += 4;
-    return true;
-}
-
 static void alpha_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
@@ -3040,7 +3025,6 @@ static const TranslatorOps alpha_tr_ops = {
     .init_disas_context = alpha_tr_init_disas_context,
     .tb_start           = alpha_tr_tb_start,
     .insn_start         = alpha_tr_insn_start,
-    .breakpoint_check   = alpha_tr_breakpoint_check,
     .translate_insn     = alpha_tr_translate_insn,
     .tb_stop            = alpha_tr_tb_stop,
     .disas_log          = alpha_tr_disas_log,
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 4a0c479527..2983e36dd3 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -239,13 +239,6 @@ bool arm_debug_check_breakpoint(CPUState *cs)
     return false;
 }
 
-void HELPER(check_breakpoints)(CPUARMState *env)
-{
-    if (arm_debug_check_breakpoint(env_cpu(env))) {
-        HELPER(exception_internal(env, EXCP_DEBUG));
-    }
-}
-
 bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 {
     /*
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ca11a5fecd..422e2ac0c9 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14844,30 +14844,6 @@ static void aarch64_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     dc->insn_start = tcg_last_op();
 }
 
-static bool aarch64_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                        const CPUBreakpoint *bp)
-{
-    DisasContext *dc = container_of(dcbase, DisasContext, base);
-
-    if (bp->flags & BP_CPU) {
-        gen_a64_set_pc_im(dc->base.pc_next);
-        gen_helper_check_breakpoints(cpu_env);
-        /* End the TB early; it likely won't be executed */
-        dc->base.is_jmp = DISAS_TOO_MANY;
-    } else {
-        gen_exception_internal_insn(dc, dc->base.pc_next, EXCP_DEBUG);
-        /* The address covered by the breakpoint must be
-           included in [tb->pc, tb->pc + tb->size) in order
-           to for it to be properly cleared -- thus we
-           increment the PC here so that the logic setting
-           tb->size below does the right thing.  */
-        dc->base.pc_next += 4;
-        dc->base.is_jmp = DISAS_NORETURN;
-    }
-
-    return true;
-}
-
 static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
@@ -14982,7 +14958,6 @@ const TranslatorOps aarch64_translator_ops = {
     .init_disas_context = aarch64_tr_init_disas_context,
     .tb_start           = aarch64_tr_tb_start,
     .insn_start         = aarch64_tr_insn_start,
-    .breakpoint_check   = aarch64_tr_breakpoint_check,
     .translate_insn     = aarch64_tr_translate_insn,
     .tb_stop            = aarch64_tr_tb_stop,
     .disas_log          = aarch64_tr_disas_log,
diff --git a/target/arm/translate.c b/target/arm/translate.c
index e1a8152598..351afa43a2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9438,33 +9438,6 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     dc->insn_start = tcg_last_op();
 }
 
-static bool arm_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                    const CPUBreakpoint *bp)
-{
-    DisasContext *dc = container_of(dcbase, DisasContext, base);
-
-    if (bp->flags & BP_CPU) {
-        gen_set_condexec(dc);
-        gen_set_pc_im(dc, dc->base.pc_next);
-        gen_helper_check_breakpoints(cpu_env);
-        /* End the TB early; it's likely not going to be executed */
-        dc->base.is_jmp = DISAS_TOO_MANY;
-    } else {
-        gen_exception_internal_insn(dc, dc->base.pc_next, EXCP_DEBUG);
-        /* The address covered by the breakpoint must be
-           included in [tb->pc, tb->pc + tb->size) in order
-           to for it to be properly cleared -- thus we
-           increment the PC here so that the logic setting
-           tb->size below does the right thing.  */
-        /* TODO: Advance PC by correct instruction length to
-         * avoid disassembler error messages */
-        dc->base.pc_next += 2;
-        dc->base.is_jmp = DISAS_NORETURN;
-    }
-
-    return true;
-}
-
 static bool arm_pre_translate_insn(DisasContext *dc)
 {
 #ifdef CONFIG_USER_ONLY
@@ -9827,7 +9800,6 @@ static const TranslatorOps arm_translator_ops = {
     .init_disas_context = arm_tr_init_disas_context,
     .tb_start           = arm_tr_tb_start,
     .insn_start         = arm_tr_insn_start,
-    .breakpoint_check   = arm_tr_breakpoint_check,
     .translate_insn     = arm_tr_translate_insn,
     .tb_stop            = arm_tr_tb_stop,
     .disas_log          = arm_tr_disas_log,
@@ -9837,7 +9809,6 @@ static const TranslatorOps thumb_translator_ops = {
     .init_disas_context = arm_tr_init_disas_context,
     .tb_start           = arm_tr_tb_start,
     .insn_start         = arm_tr_insn_start,
-    .breakpoint_check   = arm_tr_breakpoint_check,
     .translate_insn     = thumb_tr_translate_insn,
     .tb_stop            = arm_tr_tb_stop,
     .disas_log          = arm_tr_disas_log,
diff --git a/target/avr/translate.c b/target/avr/translate.c
index f7202a646b..1111e08b83 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -2900,14 +2900,6 @@ static bool canonicalize_skip(DisasContext *ctx)
     return true;
 }
 
-static void gen_breakpoint(DisasContext *ctx)
-{
-    canonicalize_skip(ctx);
-    tcg_gen_movi_tl(cpu_pc, ctx->npc);
-    gen_helper_debug(cpu_env);
-    ctx->base.is_jmp = DISAS_NORETURN;
-}
-
 static void avr_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
@@ -2944,15 +2936,6 @@ static void avr_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     tcg_gen_insn_start(ctx->npc);
 }
 
-static bool avr_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                    const CPUBreakpoint *bp)
-{
-    DisasContext *ctx = container_of(dcbase, DisasContext, base);
-
-    gen_breakpoint(ctx);
-    return true;
-}
-
 static void avr_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
@@ -3055,7 +3038,6 @@ static const TranslatorOps avr_tr_ops = {
     .init_disas_context = avr_tr_init_disas_context,
     .tb_start           = avr_tr_tb_start,
     .insn_start         = avr_tr_insn_start,
-    .breakpoint_check   = avr_tr_breakpoint_check,
     .translate_insn     = avr_tr_translate_insn,
     .tb_stop            = avr_tr_tb_stop,
     .disas_log          = avr_tr_disas_log,
diff --git a/target/cris/translate.c b/target/cris/translate.c
index 9258c13e9f..a84b753349 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3118,25 +3118,6 @@ static void cris_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(dc->delayed_branch == 1 ? dc->ppc | 1 : dc->pc);
 }
 
-static bool cris_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                     const CPUBreakpoint *bp)
-{
-    DisasContext *dc = container_of(dcbase, DisasContext, base);
-
-    cris_evaluate_flags(dc);
-    tcg_gen_movi_tl(env_pc, dc->pc);
-    t_gen_raise_exception(EXCP_DEBUG);
-    dc->base.is_jmp = DISAS_NORETURN;
-    /*
-     * The address covered by the breakpoint must be included in
-     * [tb->pc, tb->pc + tb->size) in order to for it to be
-     * properly cleared -- thus we increment the PC here so that
-     * the logic setting tb->size below does the right thing.
-     */
-    dc->pc += 2;
-    return true;
-}
-
 static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
@@ -3315,7 +3296,6 @@ static const TranslatorOps cris_tr_ops = {
     .init_disas_context = cris_tr_init_disas_context,
     .tb_start           = cris_tr_tb_start,
     .insn_start         = cris_tr_insn_start,
-    .breakpoint_check   = cris_tr_breakpoint_check,
     .translate_insn     = cris_tr_translate_insn,
     .tb_stop            = cris_tr_tb_stop,
     .disas_log          = cris_tr_disas_log,
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index b23d36adf5..54fdcaa5e8 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -540,22 +540,6 @@ static void hexagon_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(ctx->base.pc_next);
 }
 
-static bool hexagon_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                        const CPUBreakpoint *bp)
-{
-    DisasContext *ctx = container_of(dcbase, DisasContext, base);
-
-    gen_exception_end_tb(ctx, EXCP_DEBUG);
-    /*
-     * The address covered by the breakpoint must be included in
-     * [tb->pc, tb->pc + tb->size) in order to for it to be
-     * properly cleared -- thus we increment the PC here so that
-     * the logic setting tb->size below does the right thing.
-     */
-    ctx->base.pc_next += 4;
-    return true;
-}
-
 static bool pkt_crosses_page(CPUHexagonState *env, DisasContext *ctx)
 {
     target_ulong page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
@@ -631,7 +615,6 @@ static const TranslatorOps hexagon_tr_ops = {
     .init_disas_context = hexagon_tr_init_disas_context,
     .tb_start           = hexagon_tr_tb_start,
     .insn_start         = hexagon_tr_insn_start,
-    .breakpoint_check   = hexagon_tr_breakpoint_check,
     .translate_insn     = hexagon_tr_translate_packet,
     .tb_stop            = hexagon_tr_tb_stop,
     .disas_log          = hexagon_tr_disas_log,
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 2552747138..b18150ef8d 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -4159,16 +4159,6 @@ static void hppa_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     tcg_gen_insn_start(ctx->iaoq_f, ctx->iaoq_b);
 }
 
-static bool hppa_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                      const CPUBreakpoint *bp)
-{
-    DisasContext *ctx = container_of(dcbase, DisasContext, base);
-
-    gen_excp(ctx, EXCP_DEBUG);
-    ctx->base.pc_next += 4;
-    return true;
-}
-
 static void hppa_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
@@ -4330,7 +4320,6 @@ static const TranslatorOps hppa_tr_ops = {
     .init_disas_context = hppa_tr_init_disas_context,
     .tb_start           = hppa_tr_tb_start,
     .insn_start         = hppa_tr_insn_start,
-    .breakpoint_check   = hppa_tr_breakpoint_check,
     .translate_insn     = hppa_tr_translate_insn,
     .tb_stop            = hppa_tr_tb_stop,
     .disas_log          = hppa_tr_disas_log,
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 8520d5a1e2..aacb605eee 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2604,14 +2604,6 @@ static void gen_interrupt(DisasContext *s, int intno,
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_debug(DisasContext *s)
-{
-    gen_update_cc_op(s);
-    gen_jmp_im(s, s->base.pc_next - s->cs_base);
-    gen_helper_debug(cpu_env);
-    s->base.is_jmp = DISAS_NORETURN;
-}
-
 static void gen_set_hflag(DisasContext *s, uint32_t mask)
 {
     if ((s->flags & mask) == 0) {
@@ -8635,25 +8627,6 @@ static void i386_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(dc->base.pc_next, dc->cc_op);
 }
 
-static bool i386_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                     const CPUBreakpoint *bp)
-{
-    DisasContext *dc = container_of(dcbase, DisasContext, base);
-    /* If RF is set, suppress an internally generated breakpoint.  */
-    int flags = dc->base.tb->flags & HF_RF_MASK ? BP_GDB : BP_ANY;
-    if (bp->flags & flags) {
-        gen_debug(dc);
-        /* The address covered by the breakpoint must be included in
-           [tb->pc, tb->pc + tb->size) in order to for it to be
-           properly cleared -- thus we increment the PC here so that
-           the generic logic setting tb->size later does the right thing.  */
-        dc->base.pc_next += 1;
-        return true;
-    } else {
-        return false;
-    }
-}
-
 static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
@@ -8721,7 +8694,6 @@ static const TranslatorOps i386_tr_ops = {
     .init_disas_context = i386_tr_init_disas_context,
     .tb_start           = i386_tr_tb_start,
     .insn_start         = i386_tr_insn_start,
-    .breakpoint_check   = i386_tr_breakpoint_check,
     .translate_insn     = i386_tr_translate_insn,
     .tb_stop            = i386_tr_tb_stop,
     .disas_log          = i386_tr_disas_log,
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 1fee04b8dd..c34d9aed61 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -6208,23 +6208,6 @@ static void m68k_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(dc->base.pc_next, dc->cc_op);
 }
 
-static bool m68k_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                     const CPUBreakpoint *bp)
-{
-    DisasContext *dc = container_of(dcbase, DisasContext, base);
-
-    gen_exception(dc, dc->base.pc_next, EXCP_DEBUG);
-    /*
-     * The address covered by the breakpoint must be included in
-     * [tb->pc, tb->pc + tb->size) in order to for it to be
-     * properly cleared -- thus we increment the PC here so that
-     * the logic setting tb->size below does the right thing.
-     */
-    dc->base.pc_next += 2;
-
-    return true;
-}
-
 static void m68k_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
@@ -6310,7 +6293,6 @@ static const TranslatorOps m68k_tr_ops = {
     .init_disas_context = m68k_tr_init_disas_context,
     .tb_start           = m68k_tr_tb_start,
     .insn_start         = m68k_tr_insn_start,
-    .breakpoint_check   = m68k_tr_breakpoint_check,
     .translate_insn     = m68k_tr_translate_insn,
     .tb_stop            = m68k_tr_tb_stop,
     .disas_log          = m68k_tr_disas_log,
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index c68a84a219..a14ffed784 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1673,23 +1673,6 @@ static void mb_tr_insn_start(DisasContextBase *dcb, CPUState *cs)
     dc->insn_start = tcg_last_op();
 }
 
-static bool mb_tr_breakpoint_check(DisasContextBase *dcb, CPUState *cs,
-                                   const CPUBreakpoint *bp)
-{
-    DisasContext *dc = container_of(dcb, DisasContext, base);
-
-    gen_raise_exception_sync(dc, EXCP_DEBUG);
-
-    /*
-     * The address covered by the breakpoint must be included in
-     * [tb->pc, tb->pc + tb->size) in order to for it to be
-     * properly cleared -- thus we increment the PC here so that
-     * the logic setting tb->size below does the right thing.
-     */
-    dc->base.pc_next += 4;
-    return true;
-}
-
 static void mb_tr_translate_insn(DisasContextBase *dcb, CPUState *cs)
 {
     DisasContext *dc = container_of(dcb, DisasContext, base);
@@ -1854,7 +1837,6 @@ static const TranslatorOps mb_tr_ops = {
     .init_disas_context = mb_tr_init_disas_context,
     .tb_start           = mb_tr_tb_start,
     .insn_start         = mb_tr_insn_start,
-    .breakpoint_check   = mb_tr_breakpoint_check,
     .translate_insn     = mb_tr_translate_insn,
     .tb_stop            = mb_tr_tb_stop,
     .disas_log          = mb_tr_disas_log,
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index fd980ea966..5b03545f09 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16178,24 +16178,6 @@ static void mips_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
                        ctx->btarget);
 }
 
-static bool mips_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                     const CPUBreakpoint *bp)
-{
-    DisasContext *ctx = container_of(dcbase, DisasContext, base);
-
-    save_cpu_state(ctx, 1);
-    ctx->base.is_jmp = DISAS_NORETURN;
-    gen_helper_raise_exception_debug(cpu_env);
-    /*
-     * The address covered by the breakpoint must be included in
-     * [tb->pc, tb->pc + tb->size) in order to for it to be
-     * properly cleared -- thus we increment the PC here so that
-     * the logic setting tb->size below does the right thing.
-     */
-    ctx->base.pc_next += 4;
-    return true;
-}
-
 static void mips_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     CPUMIPSState *env = cs->env_ptr;
@@ -16303,7 +16285,6 @@ static const TranslatorOps mips_tr_ops = {
     .init_disas_context = mips_tr_init_disas_context,
     .tb_start           = mips_tr_tb_start,
     .insn_start         = mips_tr_insn_start,
-    .breakpoint_check   = mips_tr_breakpoint_check,
     .translate_insn     = mips_tr_translate_insn,
     .tb_stop            = mips_tr_tb_stop,
     .disas_log          = mips_tr_disas_log,
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 17742cebc7..08d7ac5398 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -744,16 +744,6 @@ static const char * const regnames[] = {
 
 #include "exec/gen-icount.h"
 
-static void gen_exception(DisasContext *dc, uint32_t excp)
-{
-    TCGv_i32 tmp = tcg_const_i32(excp);
-
-    tcg_gen_movi_tl(cpu_R[R_PC], dc->pc);
-    gen_helper_raise_exception(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
-    dc->base.is_jmp = DISAS_NORETURN;
-}
-
 /* generate intermediate code for basic block 'tb'.  */
 static void nios2_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
@@ -777,22 +767,6 @@ static void nios2_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     tcg_gen_insn_start(dcbase->pc_next);
 }
 
-static bool nios2_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                      const CPUBreakpoint *bp)
-{
-    DisasContext *dc = container_of(dcbase, DisasContext, base);
-
-    gen_exception(dc, EXCP_DEBUG);
-    /*
-     * The address covered by the breakpoint must be included in
-     * [tb->pc, tb->pc + tb->size) in order to for it to be
-     * properly cleared -- thus we increment the PC here so that
-     * the logic setting tb->size below does the right thing.
-     */
-    dc->base.pc_next += 4;
-    return true;
-}
-
 static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
@@ -870,7 +844,6 @@ static const TranslatorOps nios2_tr_ops = {
     .init_disas_context = nios2_tr_init_disas_context,
     .tb_start           = nios2_tr_tb_start,
     .insn_start         = nios2_tr_insn_start,
-    .breakpoint_check   = nios2_tr_breakpoint_check,
     .translate_insn     = nios2_tr_translate_insn,
     .tb_stop            = nios2_tr_tb_stop,
     .disas_log          = nios2_tr_disas_log,
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 059da48475..d6ea536744 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1609,22 +1609,6 @@ static void openrisc_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
                        | (dc->base.num_insns > 1 ? 2 : 0));
 }
 
-static bool openrisc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                         const CPUBreakpoint *bp)
-{
-    DisasContext *dc = container_of(dcbase, DisasContext, base);
-
-    tcg_gen_movi_tl(cpu_pc, dc->base.pc_next);
-    gen_exception(dc, EXCP_DEBUG);
-    dc->base.is_jmp = DISAS_NORETURN;
-    /* The address covered by the breakpoint must be included in
-       [tb->pc, tb->pc + tb->size) in order to for it to be
-       properly cleared -- thus we increment the PC here so that
-       the logic setting tb->size below does the right thing.  */
-    dc->base.pc_next += 4;
-    return true;
-}
-
 static void openrisc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
@@ -1727,7 +1711,6 @@ static const TranslatorOps openrisc_tr_ops = {
     .init_disas_context = openrisc_tr_init_disas_context,
     .tb_start           = openrisc_tr_tb_start,
     .insn_start         = openrisc_tr_insn_start,
-    .breakpoint_check   = openrisc_tr_breakpoint_check,
     .translate_insn     = openrisc_tr_translate_insn,
     .tb_stop            = openrisc_tr_tb_stop,
     .disas_log          = openrisc_tr_disas_log,
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 0a55cb7181..171b216e17 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -8565,23 +8565,6 @@ static void ppc_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     tcg_gen_insn_start(dcbase->pc_next);
 }
 
-static bool ppc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                    const CPUBreakpoint *bp)
-{
-    DisasContext *ctx = container_of(dcbase, DisasContext, base);
-
-    gen_update_nip(ctx, ctx->base.pc_next);
-    gen_debug_exception(ctx);
-    /*
-     * The address covered by the breakpoint must be included in
-     * [tb->pc, tb->pc + tb->size) in order to for it to be properly
-     * cleared -- thus we increment the PC here so that the logic
-     * setting tb->size below does the right thing.
-     */
-    ctx->base.pc_next += 4;
-    return true;
-}
-
 static bool is_prefix_insn(DisasContext *ctx, uint32_t insn)
 {
     REQUIRE_INSNS_FLAGS2(ctx, ISA310);
@@ -8710,7 +8693,6 @@ static const TranslatorOps ppc_tr_ops = {
     .init_disas_context = ppc_tr_init_disas_context,
     .tb_start           = ppc_tr_tb_start,
     .insn_start         = ppc_tr_insn_start,
-    .breakpoint_check   = ppc_tr_breakpoint_check,
     .translate_insn     = ppc_tr_translate_insn,
     .tb_stop            = ppc_tr_tb_stop,
     .disas_log          = ppc_tr_disas_log,
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index deda0c8a44..6983be5723 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -961,22 +961,6 @@ static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(ctx->base.pc_next);
 }
 
-static bool riscv_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                      const CPUBreakpoint *bp)
-{
-    DisasContext *ctx = container_of(dcbase, DisasContext, base);
-
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-    ctx->base.is_jmp = DISAS_NORETURN;
-    gen_exception_debug();
-    /* The address covered by the breakpoint must be included in
-       [tb->pc, tb->pc + tb->size) in order to for it to be
-       properly cleared -- thus we increment the PC here so that
-       the logic setting tb->size below does the right thing.  */
-    ctx->base.pc_next += 4;
-    return true;
-}
-
 static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
@@ -1029,7 +1013,6 @@ static const TranslatorOps riscv_tr_ops = {
     .init_disas_context = riscv_tr_init_disas_context,
     .tb_start           = riscv_tr_tb_start,
     .insn_start         = riscv_tr_insn_start,
-    .breakpoint_check   = riscv_tr_breakpoint_check,
     .translate_insn     = riscv_tr_translate_insn,
     .tb_stop            = riscv_tr_tb_stop,
     .disas_log          = riscv_tr_disas_log,
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 23a626438a..a3cf720455 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2309,19 +2309,6 @@ static void rx_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     tcg_gen_insn_start(ctx->base.pc_next);
 }
 
-static bool rx_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                    const CPUBreakpoint *bp)
-{
-    DisasContext *ctx = container_of(dcbase, DisasContext, base);
-
-    /* We have hit a breakpoint - make sure PC is up-to-date */
-    tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
-    gen_helper_debug(cpu_env);
-    ctx->base.is_jmp = DISAS_NORETURN;
-    ctx->base.pc_next += 1;
-    return true;
-}
-
 static void rx_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
@@ -2373,7 +2360,6 @@ static const TranslatorOps rx_tr_ops = {
     .init_disas_context = rx_tr_init_disas_context,
     .tb_start           = rx_tr_tb_start,
     .insn_start         = rx_tr_insn_start,
-    .breakpoint_check   = rx_tr_breakpoint_check,
     .translate_insn     = rx_tr_translate_insn,
     .tb_stop            = rx_tr_tb_stop,
     .disas_log          = rx_tr_disas_log,
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 92fa7656c2..0632b0374b 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6552,29 +6552,6 @@ static void s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
 {
 }
 
-static bool s390x_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                      const CPUBreakpoint *bp)
-{
-    DisasContext *dc = container_of(dcbase, DisasContext, base);
-
-    /*
-     * Emit an insn_start to accompany the breakpoint exception.
-     * The ILEN value is a dummy, since this does not result in
-     * an s390x exception, but an internal qemu exception which
-     * brings us back to interact with the gdbstub.
-     */
-    tcg_gen_insn_start(dc->base.pc_next, dc->cc_op, 2);
-
-    dc->base.is_jmp = DISAS_PC_STALE;
-    dc->do_debug = true;
-    /* The address covered by the breakpoint must be included in
-       [tb->pc, tb->pc + tb->size) in order to for it to be
-       properly cleared -- thus we increment the PC here so that
-       the logic setting tb->size does the right thing.  */
-    dc->base.pc_next += 2;
-    return true;
-}
-
 static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     CPUS390XState *env = cs->env_ptr;
@@ -6642,7 +6619,6 @@ static const TranslatorOps s390x_tr_ops = {
     .init_disas_context = s390x_tr_init_disas_context,
     .tb_start           = s390x_tr_tb_start,
     .insn_start         = s390x_tr_insn_start,
-    .breakpoint_check   = s390x_tr_breakpoint_check,
     .translate_insn     = s390x_tr_translate_insn,
     .tb_stop            = s390x_tr_tb_stop,
     .disas_log          = s390x_tr_disas_log,
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 40898e2393..8704fea1ca 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -2289,23 +2289,6 @@ static void sh4_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     tcg_gen_insn_start(ctx->base.pc_next, ctx->envflags);
 }
 
-static bool sh4_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                    const CPUBreakpoint *bp)
-{
-    DisasContext *ctx = container_of(dcbase, DisasContext, base);
-
-    /* We have hit a breakpoint - make sure PC is up-to-date */
-    gen_save_cpu_state(ctx, true);
-    gen_helper_debug(cpu_env);
-    ctx->base.is_jmp = DISAS_NORETURN;
-    /* The address covered by the breakpoint must be included in
-       [tb->pc, tb->pc + tb->size) in order to for it to be
-       properly cleared -- thus we increment the PC here so that
-       the logic setting tb->size below does the right thing.  */
-    ctx->base.pc_next += 2;
-    return true;
-}
-
 static void sh4_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     CPUSH4State *env = cs->env_ptr;
@@ -2369,7 +2352,6 @@ static const TranslatorOps sh4_tr_ops = {
     .init_disas_context = sh4_tr_init_disas_context,
     .tb_start           = sh4_tr_tb_start,
     .insn_start         = sh4_tr_insn_start,
-    .breakpoint_check   = sh4_tr_breakpoint_check,
     .translate_insn     = sh4_tr_translate_insn,
     .tb_stop            = sh4_tr_tb_stop,
     .disas_log          = sh4_tr_disas_log,
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index e530cb4aa8..11de5a4963 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5854,22 +5854,6 @@ static void sparc_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     }
 }
 
-static bool sparc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
-                                      const CPUBreakpoint *bp)
-{
-    DisasContext *dc = container_of(dcbase, DisasContext, base);
-
-    if (dc->pc != dc->base.pc_first) {
-        save_state(dc);
-    }
-    gen_helper_debug(cpu_env);
-    tcg_gen_exit_tb(NULL, 0);
-    dc->base.is_jmp = DISAS_NORETURN;
-    /* update pc_next so that the current instruction is included in tb->size */
-    dc->base.pc_next += 4;
-    return true;
-}
-
 static void sparc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
@@ -5932,7 +5916,6 @@ static const TranslatorOps sparc_tr_ops = {
     .init_disas_context = sparc_tr_init_disas_context,
     .tb_start           = sparc_tr_tb_start,
     .insn_start         = sparc_tr_insn_start,
-    .breakpoint_check   = sparc_tr_breakpoint_check,
     .translate_insn     = sparc_tr_translate_insn,
     .tb_stop            = sparc_tr_tb_stop,
     .disas_log          = sparc_tr_disas_log,
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 865020754d..a0cc0f1cb3 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -8810,21 +8810,6 @@ static void tricore_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(ctx->base.pc_next);
 }
 
-static bool tricore_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                      const CPUBreakpoint *bp)
-{
-    DisasContext *ctx = container_of(dcbase, DisasContext, base);
-    generate_qemu_excp(ctx, EXCP_DEBUG);
-    /*
-     * The address covered by the breakpoint must be included in
-     * [tb->pc, tb->pc + tb->size) in order to for it to be
-     * properly cleared -- thus we increment the PC here so that
-     * the logic setting tb->size below does the right thing.
-     */
-    ctx->base.pc_next += 4;
-    return true;
-}
-
 static bool insn_crosses_page(CPUTriCoreState *env, DisasContext *ctx)
 {
     /*
@@ -8898,7 +8883,6 @@ static const TranslatorOps tricore_tr_ops = {
     .init_disas_context = tricore_tr_init_disas_context,
     .tb_start           = tricore_tr_tb_start,
     .insn_start         = tricore_tr_insn_start,
-    .breakpoint_check   = tricore_tr_breakpoint_check,
     .translate_insn     = tricore_tr_translate_insn,
     .tb_stop            = tricore_tr_tb_stop,
     .disas_log          = tricore_tr_disas_log,
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 7094cfcf1d..20399d6a04 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1232,22 +1232,6 @@ static void xtensa_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(dcbase->pc_next);
 }
 
-static bool xtensa_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
-                                       const CPUBreakpoint *bp)
-{
-    DisasContext *dc = container_of(dcbase, DisasContext, base);
-
-    tcg_gen_movi_i32(cpu_pc, dc->base.pc_next);
-    gen_exception(dc, EXCP_DEBUG);
-    dc->base.is_jmp = DISAS_NORETURN;
-    /* The address covered by the breakpoint must be included in
-       [tb->pc, tb->pc + tb->size) in order to for it to be
-       properly cleared -- thus we increment the PC here so that
-       the logic setting tb->size below does the right thing.  */
-    dc->base.pc_next += 2;
-    return true;
-}
-
 static void xtensa_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
@@ -1330,7 +1314,6 @@ static const TranslatorOps xtensa_translator_ops = {
     .init_disas_context = xtensa_tr_init_disas_context,
     .tb_start           = xtensa_tr_tb_start,
     .insn_start         = xtensa_tr_insn_start,
-    .breakpoint_check   = xtensa_tr_breakpoint_check,
     .translate_insn     = xtensa_tr_translate_insn,
     .tb_stop            = xtensa_tr_tb_stop,
     .disas_log          = xtensa_tr_disas_log,
-- 
2.25.1


