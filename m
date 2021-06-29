Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEBA3B7892
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:25:13 +0200 (CEST)
Received: from localhost ([::1]:33202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJM8-000689-U8
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0007zD-AP
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:16 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIst-0000qs-QG
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:06 -0400
Received: by mail-pj1-x102c.google.com with SMTP id q91so136966pjk.3
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jI3bEU+f0zZItWGOzZW4leD8dAQuDRrKyQbHa4mJbTE=;
 b=SYVIreNwVkmNgZxkL2935gLcc1YkH3mk+aFKjf7Q/fog9zTqyTq6kFs8etvR5H7xtz
 s58oWqImp6rC/S6pa6wuQc5haqmllksBEle+5rDuDGarI7pxLkKYMWO4Zp9RKOn95lhW
 JhBpQSNCoI4VdRZOR4YlTL7xsCYRM/uFRVzJ6/MsN4PLDJ90tR7T45b5IAuDwJp11tLd
 KVQV6zi7jTOomUwlILc4Kd4XonXT14RuqlD8cJtmL+3CBNVJMLGPzohDMXmzcsNkEOIz
 qbmMrteoyrzfQQa5XED3x0XQqpb8CEQf1/unfA8EotKv628foZ9Xw/VH9kGnXMDVvcz0
 kt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jI3bEU+f0zZItWGOzZW4leD8dAQuDRrKyQbHa4mJbTE=;
 b=lDyM1iUINmqRTEmZ0boofYHYcKup6uELxf4gk3TlnIiVt/nNQecSiUyjT/pm+DdJBg
 YRB0oAln1MroD+gWcAAHo0vo/aa7Eul9E7InIdKGAQez3PrEyPcx4cAv7MLR28N1LRfi
 oFeQbb+BM93EinlwKWOaaSOgaoRWqHx8CwEgN6NODntVv2+0qrmEzQY5UD8XOQeVXi8b
 rIMqZFcIdYXgeol0LMgVtsF5yFzAfEvWvfFlK3+vUnC+RTPQG+fUHpBjP85GLldWYLZS
 Ab6CWInGnx7nS11CPVO2tRfIv4leH2KEmTu+hIEgVO4Nm5kw0ltBNFchMXVY+gdY+upf
 Dnfg==
X-Gm-Message-State: AOAM533ubRL5ZAF8fdlBHDUoW3s161nNHMXfp5UoR4OfkRPLqKnQ17gB
 cdqaUvAbu3DklVi/1wKdV8ATQq6BZc0Y6w==
X-Google-Smtp-Source: ABdhPJwq2Ru07t5mRFjcW4kRitNfhSH7VffvUQN6UHOMmHA0pZa87kUQGg4T+aqwR4+js95dSgcNRQ==
X-Received: by 2002:a17:90a:e517:: with SMTP id
 t23mr321499pjy.110.1624992898319; 
 Tue, 29 Jun 2021 11:54:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:54:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/63] target/nios2: Add DisasContextBase to DisasContext
Date: Tue, 29 Jun 2021 11:53:56 -0700
Message-Id: <20210629185455.3131172-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Migrate the is_jmp, tb and singlestep_enabled fields from
DisasContext into the base.  Use pc_first instead of tb->pc.
Increment pc_next prior to decode, leaving the address of
the current insn in dc->pc.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 70 +++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 6bdd388bd8..64cba02230 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -97,12 +97,10 @@
     }
 
 typedef struct DisasContext {
+    DisasContextBase  base;
     TCGv_i32          zero;
-    int               is_jmp;
     target_ulong      pc;
-    TranslationBlock *tb;
     int               mem_idx;
-    bool              singlestep_enabled;
 } DisasContext;
 
 static TCGv cpu_R[NUM_CORE_REGS];
@@ -149,17 +147,17 @@ static void t_gen_helper_raise_exception(DisasContext *dc,
     tcg_gen_movi_tl(cpu_R[R_PC], dc->pc);
     gen_helper_raise_exception(cpu_env, tmp);
     tcg_temp_free_i32(tmp);
-    dc->is_jmp = DISAS_NORETURN;
+    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static bool use_goto_tb(DisasContext *dc, uint32_t dest)
 {
-    if (unlikely(dc->singlestep_enabled)) {
+    if (unlikely(dc->base.singlestep_enabled)) {
         return false;
     }
 
 #ifndef CONFIG_USER_ONLY
-    return (dc->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+    return (dc->base.pc_first & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
 #else
     return true;
 #endif
@@ -167,7 +165,7 @@ static bool use_goto_tb(DisasContext *dc, uint32_t dest)
 
 static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
 {
-    TranslationBlock *tb = dc->tb;
+    const TranslationBlock *tb = dc->base.tb;
 
     if (use_goto_tb(dc, dest)) {
         tcg_gen_goto_tb(n);
@@ -186,7 +184,7 @@ static void gen_excp(DisasContext *dc, uint32_t code, uint32_t flags)
 
 static void gen_check_supervisor(DisasContext *dc)
 {
-    if (dc->tb->flags & CR_STATUS_U) {
+    if (dc->base.tb->flags & CR_STATUS_U) {
         /* CPU in user mode, privileged instruction called, stop. */
         t_gen_helper_raise_exception(dc, EXCP_SUPERI);
     }
@@ -208,7 +206,7 @@ static void jmpi(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     J_TYPE(instr, code);
     gen_goto_tb(dc, 0, (dc->pc & 0xF0000000) | (instr.imm26 << 2));
-    dc->is_jmp = DISAS_NORETURN;
+    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void call(DisasContext *dc, uint32_t code, uint32_t flags)
@@ -268,7 +266,7 @@ static void br(DisasContext *dc, uint32_t code, uint32_t flags)
     I_TYPE(instr, code);
 
     gen_goto_tb(dc, 0, dc->pc + 4 + (instr.imm16.s & -4));
-    dc->is_jmp = DISAS_NORETURN;
+    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
@@ -280,7 +278,7 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
     gen_goto_tb(dc, 0, dc->pc + 4);
     gen_set_label(l1);
     gen_goto_tb(dc, 1, dc->pc + 4 + (instr.imm16.s & -4));
-    dc->is_jmp = DISAS_NORETURN;
+    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 /* Comparison instructions */
@@ -402,7 +400,7 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
     tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
     tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_EA]);
 
-    dc->is_jmp = DISAS_JUMP;
+    dc->base.is_jmp = DISAS_JUMP;
 }
 
 /* PC <- ra */
@@ -410,7 +408,7 @@ static void ret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_RA]);
 
-    dc->is_jmp = DISAS_JUMP;
+    dc->base.is_jmp = DISAS_JUMP;
 }
 
 /* PC <- ba */
@@ -418,7 +416,7 @@ static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_BA]);
 
-    dc->is_jmp = DISAS_JUMP;
+    dc->base.is_jmp = DISAS_JUMP;
 }
 
 /* PC <- rA */
@@ -428,7 +426,7 @@ static void jmp(DisasContext *dc, uint32_t code, uint32_t flags)
 
     tcg_gen_mov_tl(cpu_R[R_PC], load_gpr(dc, instr.a));
 
-    dc->is_jmp = DISAS_JUMP;
+    dc->base.is_jmp = DISAS_JUMP;
 }
 
 /* rC <- PC + 4 */
@@ -452,7 +450,7 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
     tcg_gen_mov_tl(cpu_R[R_PC], load_gpr(dc, instr.a));
     tcg_gen_movi_tl(cpu_R[R_RA], dc->pc + 4);
 
-    dc->is_jmp = DISAS_JUMP;
+    dc->base.is_jmp = DISAS_JUMP;
 }
 
 /* rC <- ctlN */
@@ -516,11 +514,11 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
     /* If interrupts were enabled using WRCTL, trigger them. */
 #if !defined(CONFIG_USER_ONLY)
     if ((instr.imm5 + CR_BASE) == CR_STATUS) {
-        if (tb_cflags(dc->tb) & CF_USE_ICOUNT) {
+        if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
         gen_helper_check_interrupts(cpu_env);
-        dc->is_jmp = DISAS_UPDATE;
+        dc->base.is_jmp = DISAS_UPDATE;
     }
 #endif
 }
@@ -801,7 +799,7 @@ static void gen_exception(DisasContext *dc, uint32_t excp)
     tcg_gen_movi_tl(cpu_R[R_PC], dc->pc);
     gen_helper_raise_exception(cpu_env, tmp);
     tcg_temp_free_i32(tmp);
-    dc->is_jmp = DISAS_NORETURN;
+    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 /* generate intermediate code for basic block 'tb'.  */
@@ -812,11 +810,14 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     int num_insns;
 
     /* Initialize DC */
-    dc->is_jmp  = DISAS_NEXT;
-    dc->pc      = tb->pc;
-    dc->tb      = tb;
+
+    dc->base.tb = tb;
+    dc->base.singlestep_enabled = cs->singlestep_enabled;
+    dc->base.is_jmp = DISAS_NEXT;
+    dc->base.pc_first = tb->pc;
+    dc->base.pc_next = tb->pc;
+
     dc->mem_idx = cpu_mmu_index(env, false);
-    dc->singlestep_enabled = cs->singlestep_enabled;
 
     /* Set up instruction counts */
     num_insns = 0;
@@ -829,10 +830,10 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
 
     gen_tb_start(tb);
     do {
-        tcg_gen_insn_start(dc->pc);
+        tcg_gen_insn_start(dc->base.pc_next);
         num_insns++;
 
-        if (unlikely(cpu_breakpoint_test(cs, dc->pc, BP_ANY))) {
+        if (unlikely(cpu_breakpoint_test(cs, dc->base.pc_next, BP_ANY))) {
             gen_exception(dc, EXCP_DEBUG);
             /* The address covered by the breakpoint must be included in
                [tb->pc, tb->pc + tb->size) in order to for it to be
@@ -846,25 +847,26 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
             gen_io_start();
         }
 
+        dc->pc = dc->base.pc_next;
+        dc->base.pc_next += 4;
+
         /* Decode an instruction */
         handle_instruction(dc, env);
 
-        dc->pc += 4;
-
         /* Translation stops when a conditional branch is encountered.
          * Otherwise the subsequent code could get translated several times.
          * Also stop translation when a page boundary is reached.  This
          * ensures prefetch aborts occur at the right place.  */
-    } while (!dc->is_jmp &&
+    } while (!dc->base.is_jmp &&
              !tcg_op_buf_full() &&
              num_insns < max_insns);
 
     /* Indicate where the next block should start */
-    switch (dc->is_jmp) {
+    switch (dc->base.is_jmp) {
     case DISAS_NEXT:
     case DISAS_UPDATE:
         /* Save the current PC back into the CPU register */
-        tcg_gen_movi_tl(cpu_R[R_PC], dc->pc);
+        tcg_gen_movi_tl(cpu_R[R_PC], dc->base.pc_next);
         tcg_gen_exit_tb(NULL, 0);
         break;
 
@@ -883,15 +885,15 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     gen_tb_end(tb, num_insns);
 
     /* Mark instruction starts for the final generated instruction */
-    tb->size = dc->pc - tb->pc;
+    tb->size = dc->base.pc_next - dc->base.pc_first;
     tb->icount = num_insns;
 
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
-        && qemu_log_in_addr_range(tb->pc)) {
+        && qemu_log_in_addr_range(dc->base.pc_first)) {
         FILE *logfile = qemu_log_lock();
-        qemu_log("IN: %s\n", lookup_symbol(tb->pc));
-        log_target_disas(cs, tb->pc, dc->pc - tb->pc);
+        qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
+        log_target_disas(cs, tb->pc, tb->size);
         qemu_log("\n");
         qemu_log_unlock(logfile);
     }
-- 
2.25.1


