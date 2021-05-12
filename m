Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8E237D3CD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:19:58 +0200 (CEST)
Received: from localhost ([::1]:43822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguOj-0006qh-Pr
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu2a-0006Vq-ML; Wed, 12 May 2021 14:57:04 -0400
Received: from [201.28.113.2] (port=20812 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu2Z-0007uU-4q; Wed, 12 May 2021 14:57:04 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:56:03 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 35F7F80139F;
 Wed, 12 May 2021 15:56:03 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 13/31] target/ppc: Remove DisasContext.exception
Date: Wed, 12 May 2021 15:54:23 -0300
Message-Id: <20210512185441.3619828-14-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:56:03.0562 (UTC)
 FILETIME=[74F8E4A0:01D74760]
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

Now that we have removed all of the fake exceptions, and all real
exceptions exit via DISAS_NORETURN, we can remove this field.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v4:
- Remove the field.
- Changes applied to gen_scv on rebase.
---
 target/ppc/translate.c | 30 ++++--------------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 43320d2b8b..606897fa75 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -156,7 +156,6 @@ struct DisasContext {
     DisasContextBase base;
     target_ulong cia;  /* current instruction address */
     uint32_t opcode;
-    uint32_t exception;
     /* Routine used to access memory */
     bool pr, hv, dr, le_mode;
     bool lazy_tlb_flush;
@@ -258,15 +257,12 @@ static void gen_exception_err(DisasContext *ctx, uint32_t excp, uint32_t error)
      * These are all synchronous exceptions, we set the PC back to the
      * faulting instruction
      */
-    if (ctx->exception == POWERPC_EXCP_NONE) {
-        gen_update_nip(ctx, ctx->cia);
-    }
+    gen_update_nip(ctx, ctx->cia);
     t0 = tcg_const_i32(excp);
     t1 = tcg_const_i32(error);
     gen_helper_raise_exception_err(cpu_env, t0, t1);
     tcg_temp_free_i32(t0);
     tcg_temp_free_i32(t1);
-    ctx->exception = excp;
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -278,13 +274,10 @@ static void gen_exception(DisasContext *ctx, uint32_t excp)
      * These are all synchronous exceptions, we set the PC back to the
      * faulting instruction
      */
-    if (ctx->exception == POWERPC_EXCP_NONE) {
-        gen_update_nip(ctx, ctx->cia);
-    }
+    gen_update_nip(ctx, ctx->cia);
     t0 = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
     tcg_temp_free_i32(t0);
-    ctx->exception = excp;
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -297,7 +290,6 @@ static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
     t0 = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
     tcg_temp_free_i32(t0);
-    ctx->exception = excp;
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -4996,13 +4988,10 @@ static void gen_scv(DisasContext *ctx)
     uint32_t lev = (ctx->opcode >> 5) & 0x7F;
 
     /* Set the PC back to the faulting instruction. */
-    if (ctx->exception == POWERPC_EXCP_NONE) {
-        gen_update_nip(ctx, ctx->cia);
-    }
+    gen_update_nip(ctx, ctx->cia);
     gen_helper_scv(cpu_env, tcg_constant_i32(lev));
 
-    /* This need not be exact, just not POWERPC_EXCP_NONE */
-    ctx->exception = POWERPC_SYSCALL_VECTORED;
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 #endif
 #endif
@@ -9196,7 +9185,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     uint32_t hflags = ctx->base.tb->flags;
     int bound;
 
-    ctx->exception = POWERPC_EXCP_NONE;
     ctx->spr_cb = env->spr_cb;
     ctx->pr = (hflags >> HFLAGS_PR) & 1;
     ctx->mem_idx = (hflags >> HFLAGS_DMMU_IDX) & 7;
@@ -9303,16 +9291,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
                  "temporaries\n", opc1(ctx->opcode), opc2(ctx->opcode),
                  opc3(ctx->opcode), opc4(ctx->opcode), ctx->opcode);
     }
-
-    if (ctx->base.is_jmp == DISAS_NEXT) {
-        switch (ctx->exception) {
-        case POWERPC_EXCP_NONE:
-            break;
-        default:
-            /* Every other ctx->exception should have set NORETURN. */
-            g_assert_not_reached();
-        }
-    }
 }
 
 static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
-- 
2.25.1


