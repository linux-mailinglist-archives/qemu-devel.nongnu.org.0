Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F01A37D3C0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:08:33 +0200 (CEST)
Received: from localhost ([::1]:48732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguDg-0007ZH-3J
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu1n-0005RI-Ge; Wed, 12 May 2021 14:56:15 -0400
Received: from [201.28.113.2] (port=32220 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu1l-0007c5-TS; Wed, 12 May 2021 14:56:15 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:56:00 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id DC86380139F;
 Wed, 12 May 2021 15:55:59 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 03/31] target/ppc: Move DISAS_NORETURN setting into
 gen_exception*
Date: Wed, 12 May 2021 15:54:13 -0300
Message-Id: <20210512185441.3619828-4-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:56:00.0264 (UTC)
 FILETIME=[7301A880:01D74760]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

There are other valid settings for is_jmp besides
DISAS_NEXT and DISAS_NORETURN, so eliminating that
dichotomy from ppc_tr_translate_insn is helpful.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 3ad4c7163d..616ffc1508 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -261,7 +261,8 @@ static void gen_exception_err(DisasContext *ctx, uint32_t excp, uint32_t error)
     gen_helper_raise_exception_err(cpu_env, t0, t1);
     tcg_temp_free_i32(t0);
     tcg_temp_free_i32(t1);
-    ctx->exception = (excp);
+    ctx->exception = excp;
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_exception(DisasContext *ctx, uint32_t excp)
@@ -278,7 +279,8 @@ static void gen_exception(DisasContext *ctx, uint32_t excp)
     t0 = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
     tcg_temp_free_i32(t0);
-    ctx->exception = (excp);
+    ctx->exception = excp;
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
@@ -290,7 +292,8 @@ static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
     t0 = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
     tcg_temp_free_i32(t0);
-    ctx->exception = (excp);
+    ctx->exception = excp;
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 /*
@@ -336,6 +339,7 @@ static void gen_debug_exception(DisasContext *ctx)
     t0 = tcg_const_i32(EXCP_DEBUG);
     gen_helper_raise_exception(cpu_env, t0);
     tcg_temp_free_i32(t0);
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static inline void gen_inval_exception(DisasContext *ctx, uint32_t error)
@@ -9374,7 +9378,6 @@ static bool ppc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     gen_debug_exception(ctx);
-    dcbase->is_jmp = DISAS_NORETURN;
     /*
      * The address covered by the breakpoint must be included in
      * [tb->pc, tb->pc + tb->size) in order to for it to be properly
@@ -9404,18 +9407,19 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
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
@@ -9426,14 +9430,20 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
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
2.25.1


