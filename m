Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F7D386BCD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 22:58:06 +0200 (CEST)
Received: from localhost ([::1]:58908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1likJR-0006Y5-RJ
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 16:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1likDf-0004IO-5E; Mon, 17 May 2021 16:52:07 -0400
Received: from [201.28.113.2] (port=12648 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1likDa-00013X-4i; Mon, 17 May 2021 16:52:03 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 17 May 2021 17:50:30 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 9B0E480139F;
 Mon, 17 May 2021 17:50:29 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 05/23] target/ppc: Move single-step check to ppc_tr_tb_stop
Date: Mon, 17 May 2021 17:50:07 -0300
Message-Id: <20210517205025.3777947-6-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2021 20:50:30.0081 (UTC)
 FILETIME=[45CD4B10:01D74B5E]
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

When single-stepping, force max_insns to 1 in init_disas
so that we exit the translation loop immediately.

Combine the single-step checks in tb_stop, and give the
gdb exception priority over the cpu exception, just as
we already do in gen_lookup_and_goto_ptr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
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
2.25.1


