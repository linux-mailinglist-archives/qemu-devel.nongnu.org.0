Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69593388EDB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:19:38 +0200 (CEST)
Received: from localhost ([::1]:47712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljM6r-0003Xc-FJ
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhL-0001ZF-Uu; Wed, 19 May 2021 08:53:15 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41139 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhH-0001Ly-B0; Wed, 19 May 2021 08:53:15 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnk2CV5z9t2G; Wed, 19 May 2021 22:52:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428730;
 bh=B+5+CBFSKc5hIzIcxZ8RF3BK6uJSaw1YPUgVkZADPZo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ux//wOvidDozkXZ5Q9U2PgU6JbJyXjlW49CTtAcWtV7/4ETOUm+nJSdBua+gykSEk
 CKPwsWDSX9d621euRdSWY/UVP8o6s9tbC4rfstYThVHd26sHeWMWKrmFIX1u0hQn1u
 Z0n86PIpBF6BWh/3AQ51eCiOvp4uTmRDXrwvnl74=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 29/48] target/ppc: Move single-step check to ppc_tr_tb_stop
Date: Wed, 19 May 2021 22:51:29 +1000
Message-Id: <20210519125148.27720-30-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: richard.henderson@linaro.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

When single-stepping, force max_insns to 1 in init_disas
so that we exit the translation loop immediately.

Combine the single-step checks in tb_stop, and give the
gdb exception priority over the cpu exception, just as
we already do in gen_lookup_and_goto_ptr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210517205025.3777947-6-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 80cd11b3f8..05e3c0417a 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -8992,7 +8992,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPUPPCState *env = cs->env_ptr;
     uint32_t hflags = ctx->base.tb->flags;
-    int bound;
 
     ctx->spr_cb = env->spr_cb;
     ctx->pr = (hflags >> HFLAGS_PR) & 1;
@@ -9032,8 +9031,12 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         ctx->singlestep_enabled |= GDBSTUB_SINGLE_STEP;
     }
 
-    bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
-    ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
+    if (ctx->singlestep_enabled & (CPU_SINGLE_STEP | GDBSTUB_SINGLE_STEP)) {
+        ctx->base.max_insns = 1;
+    } else {
+        int bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
+        ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
+    }
 }
 
 static void ppc_tr_tb_start(DisasContextBase *db, CPUState *cs)
@@ -9087,14 +9090,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     handler->count++;
 #endif
 
-    /* Check trace mode exceptions */
-    if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP &&
-                 (ctx->base.pc_next <= 0x100 || ctx->base.pc_next > 0xF00) &&
-                 ctx->base.is_jmp != DISAS_NORETURN)) {
-        uint32_t excp = gen_prep_dbgex(ctx);
-        gen_exception_nip(ctx, excp, ctx->base.pc_next);
-    }
-
     if (tcg_check_temp_count()) {
         qemu_log("Opcode %02x %02x %02x %02x (%08x) leaked "
                  "temporaries\n", opc1(ctx->opcode), opc2(ctx->opcode),
@@ -9107,6 +9102,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     DisasJumpType is_jmp = ctx->base.is_jmp;
     target_ulong nip = ctx->base.pc_next;
+    int sse;
 
     if (is_jmp == DISAS_NORETURN) {
         /* We have already exited the TB. */
@@ -9114,7 +9110,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     }
 
     /* Honor single stepping. */
-    if (unlikely(ctx->base.singlestep_enabled)) {
+    sse = ctx->singlestep_enabled & (CPU_SINGLE_STEP | GDBSTUB_SINGLE_STEP);
+    if (unlikely(sse)) {
         switch (is_jmp) {
         case DISAS_TOO_MANY:
         case DISAS_EXIT_UPDATE:
@@ -9127,8 +9124,16 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         default:
             g_assert_not_reached();
         }
-        gen_debug_exception(ctx);
-        return;
+
+        if (sse & GDBSTUB_SINGLE_STEP) {
+            gen_debug_exception(ctx);
+            return;
+        }
+        /* else CPU_SINGLE_STEP... */
+        if (nip <= 0x100 || nip > 0xf00) {
+            gen_exception(ctx, gen_prep_dbgex(ctx));
+            return;
+        }
     }
 
     switch (is_jmp) {
-- 
2.31.1


