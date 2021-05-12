Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C94037D3B4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:00:59 +0200 (CEST)
Received: from localhost ([::1]:37988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgu6M-0008Fq-3g
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu1k-0005Me-Sd; Wed, 12 May 2021 14:56:12 -0400
Received: from [201.28.113.2] (port=2227 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu1j-0007jW-0I; Wed, 12 May 2021 14:56:12 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:55:59 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 2D23C80139F;
 Wed, 12 May 2021 15:55:59 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 01/31] target/ppc: Add cia field to DisasContext
Date: Wed, 12 May 2021 15:54:11 -0300
Message-Id: <20210512185441.3619828-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:55:59.0560 (UTC)
 FILETIME=[72963C80:01D74760]
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 98850f0c30..9abe03222d 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -154,6 +154,7 @@ void ppc_translate_init(void)
 /* internal defines */
 struct DisasContext {
     DisasContextBase base;
+    target_ulong cia;  /* current instruction address */
     uint32_t opcode;
     uint32_t exception;
     /* Routine used to access memory */
@@ -253,7 +254,7 @@ static void gen_exception_err(DisasContext *ctx, uint32_t excp, uint32_t error)
      * faulting instruction
      */
     if (ctx->exception == POWERPC_EXCP_NONE) {
-        gen_update_nip(ctx, ctx->base.pc_next - 4);
+        gen_update_nip(ctx, ctx->cia);
     }
     t0 = tcg_const_i32(excp);
     t1 = tcg_const_i32(error);
@@ -272,7 +273,7 @@ static void gen_exception(DisasContext *ctx, uint32_t excp)
      * faulting instruction
      */
     if (ctx->exception == POWERPC_EXCP_NONE) {
-        gen_update_nip(ctx, ctx->base.pc_next - 4);
+        gen_update_nip(ctx, ctx->cia);
     }
     t0 = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
@@ -4140,7 +4141,7 @@ static void gen_eieio(DisasContext *ctx)
          */
         if (!(ctx->insns_flags2 & PPC2_ISA300)) {
             qemu_log_mask(LOG_GUEST_ERROR, "invalid eieio using bit 6 at @"
-                          TARGET_FMT_lx "\n", ctx->base.pc_next - 4);
+                          TARGET_FMT_lx "\n", ctx->cia);
         } else {
             bar = TCG_MO_ST_LD;
         }
@@ -4809,14 +4810,14 @@ static void gen_b(DisasContext *ctx)
     li = LI(ctx->opcode);
     li = (li ^ 0x02000000) - 0x02000000;
     if (likely(AA(ctx->opcode) == 0)) {
-        target = ctx->base.pc_next + li - 4;
+        target = ctx->cia + li;
     } else {
         target = li;
     }
     if (LK(ctx->opcode)) {
         gen_setlr(ctx, ctx->base.pc_next);
     }
-    gen_update_cfar(ctx, ctx->base.pc_next - 4);
+    gen_update_cfar(ctx, ctx->cia);
     gen_goto_tb(ctx, 0, target);
 }
 
@@ -4915,11 +4916,11 @@ static void gen_bcond(DisasContext *ctx, int type)
         }
         tcg_temp_free_i32(temp);
     }
-    gen_update_cfar(ctx, ctx->base.pc_next - 4);
+    gen_update_cfar(ctx, ctx->cia);
     if (type == BCOND_IM) {
         target_ulong li = (target_long)((int16_t)(BD(ctx->opcode)));
         if (likely(AA(ctx->opcode) == 0)) {
-            gen_goto_tb(ctx, 0, ctx->base.pc_next + li - 4);
+            gen_goto_tb(ctx, 0, ctx->cia + li);
         } else {
             gen_goto_tb(ctx, 0, li);
         }
@@ -5035,7 +5036,7 @@ static void gen_rfi(DisasContext *ctx)
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
     }
-    gen_update_cfar(ctx, ctx->base.pc_next - 4);
+    gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfi(cpu_env);
     gen_sync_exception(ctx);
 #endif
@@ -5052,7 +5053,7 @@ static void gen_rfid(DisasContext *ctx)
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
     }
-    gen_update_cfar(ctx, ctx->base.pc_next - 4);
+    gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfid(cpu_env);
     gen_sync_exception(ctx);
 #endif
@@ -5069,7 +5070,7 @@ static void gen_rfscv(DisasContext *ctx)
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
     }
-    gen_update_cfar(ctx, ctx->base.pc_next - 4);
+    gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfscv(cpu_env);
     gen_sync_exception(ctx);
 #endif
@@ -5112,7 +5113,7 @@ static void gen_scv(DisasContext *ctx)
 
     /* Set the PC back to the faulting instruction. */
     if (ctx->exception == POWERPC_EXCP_NONE) {
-        gen_update_nip(ctx, ctx->base.pc_next - 4);
+        gen_update_nip(ctx, ctx->cia);
     }
     gen_helper_scv(cpu_env, tcg_constant_i32(lev));
 
@@ -5320,7 +5321,7 @@ static inline void gen_op_mfspr(DisasContext *ctx)
             if (sprn != SPR_PVR) {
                 qemu_log_mask(LOG_GUEST_ERROR, "Trying to read privileged spr "
                               "%d (0x%03x) at " TARGET_FMT_lx "\n", sprn, sprn,
-                              ctx->base.pc_next - 4);
+                              ctx->cia);
             }
             gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
         }
@@ -5334,7 +5335,7 @@ static inline void gen_op_mfspr(DisasContext *ctx)
         /* Not defined */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "Trying to read invalid spr %d (0x%03x) at "
-                      TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
+                      TARGET_FMT_lx "\n", sprn, sprn, ctx->cia);
 
         /*
          * The behaviour depends on MSR:PR and SPR# bit 0x10, it can
@@ -5498,7 +5499,7 @@ static void gen_mtspr(DisasContext *ctx)
             /* Privilege exception */
             qemu_log_mask(LOG_GUEST_ERROR, "Trying to write privileged spr "
                           "%d (0x%03x) at " TARGET_FMT_lx "\n", sprn, sprn,
-                          ctx->base.pc_next - 4);
+                          ctx->cia);
             gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
         }
     } else {
@@ -5512,7 +5513,7 @@ static void gen_mtspr(DisasContext *ctx)
         /* Not defined */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "Trying to write invalid spr %d (0x%03x) at "
-                      TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
+                      TARGET_FMT_lx "\n", sprn, sprn, ctx->cia);
 
 
         /*
@@ -9339,6 +9340,7 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     LOG_DISAS("nip=" TARGET_FMT_lx " super=%d ir=%d\n",
               ctx->base.pc_next, ctx->mem_idx, (int)msr_ir);
 
+    ctx->cia = ctx->base.pc_next;
     ctx->opcode = translator_ldl_swap(env, ctx->base.pc_next,
                                       need_byteswap(ctx));
 
@@ -9368,7 +9370,7 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
                       TARGET_FMT_lx " %d\n",
                       opc1(ctx->opcode), opc2(ctx->opcode),
                       opc3(ctx->opcode), opc4(ctx->opcode),
-                      ctx->opcode, ctx->base.pc_next - 4, (int)msr_ir);
+                      ctx->opcode, ctx->cia, (int)msr_ir);
     } else {
         uint32_t inval;
 
@@ -9385,7 +9387,7 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
                           TARGET_FMT_lx "\n", ctx->opcode & inval,
                           opc1(ctx->opcode), opc2(ctx->opcode),
                           opc3(ctx->opcode), opc4(ctx->opcode),
-                          ctx->opcode, ctx->base.pc_next - 4);
+                          ctx->opcode, ctx->cia);
             gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
             ctx->base.is_jmp = DISAS_NORETURN;
             return;
-- 
2.25.1


