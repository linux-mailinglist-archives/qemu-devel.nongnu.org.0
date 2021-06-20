Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284FA3ADD3F
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 07:31:16 +0200 (CEST)
Received: from localhost ([::1]:55068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luq39-000819-7T
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 01:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lupxx-00071N-Oq
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 01:25:53 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:43599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lupxs-00086T-Og
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 01:25:53 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso8256603pjp.2
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 22:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=97hEOAE2T1zJUCGrVXEvOQZzlJTC2bynntRqChN3bDw=;
 b=qGmKkoDdpZTu9LMsFXYQdbeu0V+75bx9qv/q8aNz9G0qyfsXzmzjpkQuVo7cHSOnvF
 aXRpPTJ1pqgAyx1RfwGGn1gYHRghOnrMmbmOZ7yRiA2PRFjsXIwCZKHBLD/iCgkN5c/f
 W8BzVJP8ZgyMGtuSAQJjyxNxnrea8H4tW1ViM0r2XgkLII3xiK6p7//fQe5eUCaMN2VE
 SAMqzXFw2/1x43FHOS1LiTJHWCNdVRgHKiO9Jsrmq5EB4fKSxRW2V6yvsHQzWwwDiLZ+
 7PI7I6fjfLN2hrSugV79JzB3pHKJxltywKqzGrJ3ADf2oDHo7Lzn1UeK8u/HoiDu+LMY
 pyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=97hEOAE2T1zJUCGrVXEvOQZzlJTC2bynntRqChN3bDw=;
 b=ty0CZ/qF12LWVw7BggRcV7/ydYxSo/UMGRA8de/Gx5kiAVG3KTv0I6QdS3rZTWgPaA
 VfZ/V7+NRfKmP1Fui39zDaLTVYrS53VRg4MLyTkXbA65E5pN3pqDp/ZknfiVqCcnabpH
 89260W4f0zlQNuuRqCKIOIWMo4MOTzmGewy3rUEsy1eSWSllcJrylhmPl06R4pK+cX4X
 ZV/Mqt8cDKf8R89PzP6BuRBpDWBj5ri0E62joHeT5D/XbwYONuWroiVh8F7afHQg6+HS
 lsmRQaR4L9VCvPnTJjQygW89Y7C6wVBCvr+W7MJ6am6tD6N1RY+ordAn/UT5HGaGrV9x
 uVIw==
X-Gm-Message-State: AOAM531JzQaocszY+plBV8h1qzAnBkno0jPhkrMUu5n4fTbh8aT7VCYY
 v17czQLAl8124nVUjzaI+kXDvptd8vUVPw==
X-Google-Smtp-Source: ABdhPJz57o4PxpZXAFKkoeFgVwIHJNdTVhHzSBd77zBr96yLnhyuDMAQk7U0TBaZ2fBWD2rd/slo1w==
X-Received: by 2002:a17:903:230c:b029:121:aa77:36d4 with SMTP id
 d12-20020a170903230cb0290121aa7736d4mr9555997plh.20.1624166747143; 
 Sat, 19 Jun 2021 22:25:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm11409741pfh.103.2021.06.19.22.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 22:25:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] target/nios2: Add DisasContextBase to DisasContext
Date: Sat, 19 Jun 2021 22:25:40 -0700
Message-Id: <20210620052543.1315091-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620052543.1315091-1-richard.henderson@linaro.org>
References: <20210620052543.1315091-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: marex@denx.de, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Migrate the is_jmp, tb and singlestep_enabled fields
from DisasContext into the base.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 51 +++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 24 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 6bdd388bd8..31653b7912 100644
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
@@ -812,11 +810,16 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     int num_insns;
 
     /* Initialize DC */
-    dc->is_jmp  = DISAS_NEXT;
+
+    dc->base.tb = tb;
+    dc->base.singlestep_enabled = cs->singlestep_enabled;
+    dc->base.is_jmp = DISAS_NEXT;
+    dc->base.pc_first = tb->pc;
+    dc->base.pc_next = tb->pc;
+
+    dc->zero    = NULL;
     dc->pc      = tb->pc;
-    dc->tb      = tb;
     dc->mem_idx = cpu_mmu_index(env, false);
-    dc->singlestep_enabled = cs->singlestep_enabled;
 
     /* Set up instruction counts */
     num_insns = 0;
@@ -855,12 +858,12 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
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
-- 
2.25.1


