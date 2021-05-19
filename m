Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F185388EBC
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:13:33 +0200 (CEST)
Received: from localhost ([::1]:57586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljM0y-0007nK-HR
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgt-0000tQ-EK; Wed, 19 May 2021 08:52:47 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:33637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgl-0001Fh-S6; Wed, 19 May 2021 08:52:42 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnd65Rnz9t0T; Wed, 19 May 2021 22:52:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428725;
 bh=YepioIO6fM+22aWQNVJNN/CrWq02C6DWs1hzecs1a84=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gqpRfAV2JQ1LBZCCvgl9BFAj8BM/+Zbc6k1/IAWVzOvvSduQQna1hlEBjxanlHuxO
 Qm/PO4C/6yYrVT8p/tUvZdGq1MwgP5DrOgtHSFUlE5/VS9zMAl48HlUuTUa+BVIAWd
 GW4MinpqwFf/cnaGot7yXVlTzLb4e5a+2PeV04HA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 18/48] target/ppc: Move DISAS_NORETURN setting into
 gen_exception*
Date: Wed, 19 May 2021 22:51:18 +1000
Message-Id: <20210519125148.27720-19-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

There are other valid settings for is_jmp besides
DISAS_NEXT and DISAS_NORETURN, so eliminating that
dichotomy from ppc_tr_translate_insn is helpful.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210512185441.3619828-4-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d6a8a04380..ac0c0e5b2c 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -264,7 +264,8 @@ static void gen_exception_err(DisasContext *ctx, uint32_t excp, uint32_t error)
     gen_helper_raise_exception_err(cpu_env, t0, t1);
     tcg_temp_free_i32(t0);
     tcg_temp_free_i32(t1);
-    ctx->exception = (excp);
+    ctx->exception = excp;
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_exception(DisasContext *ctx, uint32_t excp)
@@ -281,7 +282,8 @@ static void gen_exception(DisasContext *ctx, uint32_t excp)
     t0 = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
     tcg_temp_free_i32(t0);
-    ctx->exception = (excp);
+    ctx->exception = excp;
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
@@ -293,7 +295,8 @@ static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
     t0 = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
     tcg_temp_free_i32(t0);
-    ctx->exception = (excp);
+    ctx->exception = excp;
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 /*
@@ -339,6 +342,7 @@ static void gen_debug_exception(DisasContext *ctx)
     t0 = tcg_const_i32(EXCP_DEBUG);
     gen_helper_raise_exception(cpu_env, t0);
     tcg_temp_free_i32(t0);
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static inline void gen_inval_exception(DisasContext *ctx, uint32_t error)
@@ -9183,7 +9187,6 @@ static bool ppc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     gen_debug_exception(ctx);
-    dcbase->is_jmp = DISAS_NORETURN;
     /*
      * The address covered by the breakpoint must be included in
      * [tb->pc, tb->pc + tb->size) in order to for it to be properly
@@ -9213,18 +9216,19 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     ok = decode_legacy(cpu, ctx, insn);
     if (!ok) {
         gen_invalid(ctx);
-        ctx->base.is_jmp = DISAS_NORETURN;
     }
 
 #if defined(DO_PPC_STATISTICS)
     handler->count++;
 #endif
+
     /* Check trace mode exceptions */
     if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP &&
                  (ctx->base.pc_next <= 0x100 || ctx->base.pc_next > 0xF00) &&
                  ctx->exception != POWERPC_SYSCALL &&
                  ctx->exception != POWERPC_EXCP_TRAP &&
-                 ctx->exception != POWERPC_EXCP_BRANCH)) {
+                 ctx->exception != POWERPC_EXCP_BRANCH &&
+                 ctx->base.is_jmp != DISAS_NORETURN)) {
         uint32_t excp = gen_prep_dbgex(ctx);
         gen_exception_nip(ctx, excp, ctx->base.pc_next);
     }
@@ -9235,14 +9239,20 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
                  opc3(ctx->opcode), opc4(ctx->opcode), ctx->opcode);
     }
 
-    ctx->base.is_jmp = ctx->exception == POWERPC_EXCP_NONE ?
-        DISAS_NEXT : DISAS_NORETURN;
+    if (ctx->base.is_jmp == DISAS_NEXT
+        && ctx->exception != POWERPC_EXCP_NONE) {
+        ctx->base.is_jmp = DISAS_TOO_MANY;
+    }
 }
 
 static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
+    if (ctx->base.is_jmp == DISAS_NORETURN) {
+        return;
+    }
+
     if (ctx->exception == POWERPC_EXCP_NONE) {
         gen_goto_tb(ctx, 0, ctx->base.pc_next);
     } else if (ctx->exception != POWERPC_EXCP_BRANCH) {
-- 
2.31.1


