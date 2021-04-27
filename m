Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7307036CA47
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:23:53 +0200 (CEST)
Received: from localhost ([::1]:42428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRRA-0003rd-Dk
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbRLd-0001Kn-Bw; Tue, 27 Apr 2021 13:18:09 -0400
Received: from [201.28.113.2] (port=48284 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbRLb-00023I-Hb; Tue, 27 Apr 2021 13:18:09 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 27 Apr 2021 14:16:52 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 4231D80139F;
 Tue, 27 Apr 2021 14:16:52 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 02/15] target/ppc: Add cia field to DisasContext
Date: Tue, 27 Apr 2021 14:16:36 -0300
Message-Id: <20210427171649.364699-3-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427171649.364699-1-luis.pires@eldorado.org.br>
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Apr 2021 17:16:52.0449 (UTC)
 FILETIME=[1DA2DD10:01D73B89]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 0984ce637b..ee25badba2 100644
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
@@ -254,7 +255,7 @@ static void gen_exception_err(DisasContext *ctx, uint32_t excp, uint32_t error)
      * faulting instruction
      */
     if (ctx->exception == POWERPC_EXCP_NONE) {
-        gen_update_nip(ctx, ctx->base.pc_next - 4);
+        gen_update_nip(ctx, ctx->cia);
     }
     t0 = tcg_const_i32(excp);
     t1 = tcg_const_i32(error);
@@ -273,7 +274,7 @@ static void gen_exception(DisasContext *ctx, uint32_t excp)
      * faulting instruction
      */
     if (ctx->exception == POWERPC_EXCP_NONE) {
-        gen_update_nip(ctx, ctx->base.pc_next - 4);
+        gen_update_nip(ctx, ctx->cia);
     }
     t0 = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
@@ -3113,7 +3114,7 @@ static void gen_eieio(DisasContext *ctx)
          */
         if (!(ctx->insns_flags2 & PPC2_ISA300)) {
             qemu_log_mask(LOG_GUEST_ERROR, "invalid eieio using bit 6 at @"
-                          TARGET_FMT_lx "\n", ctx->base.pc_next - 4);
+                          TARGET_FMT_lx "\n", ctx->cia);
         } else {
             bar = TCG_MO_ST_LD;
         }
@@ -3782,14 +3783,14 @@ static void gen_b(DisasContext *ctx)
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
 
@@ -3888,11 +3889,11 @@ static void gen_bcond(DisasContext *ctx, int type)
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
@@ -4008,7 +4009,7 @@ static void gen_rfi(DisasContext *ctx)
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
     }
-    gen_update_cfar(ctx, ctx->base.pc_next - 4);
+    gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfi(cpu_env);
     gen_sync_exception(ctx);
 #endif
@@ -4025,7 +4026,7 @@ static void gen_rfid(DisasContext *ctx)
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
     }
-    gen_update_cfar(ctx, ctx->base.pc_next - 4);
+    gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfid(cpu_env);
     gen_sync_exception(ctx);
 #endif
@@ -4042,7 +4043,7 @@ static void gen_rfscv(DisasContext *ctx)
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
     }
-    gen_update_cfar(ctx, ctx->base.pc_next - 4);
+    gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfscv(cpu_env);
     gen_sync_exception(ctx);
 #endif
@@ -4338,7 +4339,7 @@ static inline void gen_op_mfspr(DisasContext *ctx)
             if (sprn != SPR_PVR) {
                 qemu_log_mask(LOG_GUEST_ERROR, "Trying to read privileged spr "
                               "%d (0x%03x) at " TARGET_FMT_lx "\n", sprn, sprn,
-                              ctx->base.pc_next - 4);
+                              ctx->cia);
             }
             gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
         }
@@ -4352,7 +4353,7 @@ static inline void gen_op_mfspr(DisasContext *ctx)
         /* Not defined */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "Trying to read invalid spr %d (0x%03x) at "
-                      TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
+                      TARGET_FMT_lx "\n", sprn, sprn, ctx->cia);
 
         /*
          * The behaviour depends on MSR:PR and SPR# bit 0x10, it can
@@ -4516,7 +4517,7 @@ static void gen_mtspr(DisasContext *ctx)
             /* Privilege exception */
             qemu_log_mask(LOG_GUEST_ERROR, "Trying to write privileged spr "
                           "%d (0x%03x) at " TARGET_FMT_lx "\n", sprn, sprn,
-                          ctx->base.pc_next - 4);
+                          ctx->cia);
             gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
         }
     } else {
@@ -4530,7 +4531,7 @@ static void gen_mtspr(DisasContext *ctx)
         /* Not defined */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "Trying to write invalid spr %d (0x%03x) at "
-                      TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
+                      TARGET_FMT_lx "\n", sprn, sprn, ctx->cia);
 
 
         /*
@@ -8002,6 +8003,7 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     LOG_DISAS("nip=" TARGET_FMT_lx " super=%d ir=%d\n",
               ctx->base.pc_next, ctx->mem_idx, (int)msr_ir);
 
+    ctx->cia = ctx->base.pc_next;
     ctx->opcode = translator_ldl_swap(env, ctx->base.pc_next,
                                       need_byteswap(ctx));
 
@@ -8031,7 +8033,7 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
                       TARGET_FMT_lx " %d\n",
                       opc1(ctx->opcode), opc2(ctx->opcode),
                       opc3(ctx->opcode), opc4(ctx->opcode),
-                      ctx->opcode, ctx->base.pc_next - 4, (int)msr_ir);
+                      ctx->opcode, ctx->cia, (int)msr_ir);
     } else {
         uint32_t inval;
 
@@ -8048,7 +8050,7 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
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


