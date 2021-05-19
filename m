Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6465A388E9F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:06:29 +0200 (CEST)
Received: from localhost ([::1]:35220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljLu8-00016u-Fl
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgl-0000ng-O8; Wed, 19 May 2021 08:52:41 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39421 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgh-0001ED-Qs; Wed, 19 May 2021 08:52:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnc6cqGz9sxS; Wed, 19 May 2021 22:52:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428724;
 bh=FzhpfnsG8zVulwkWbQDPAqH2EUbJv3lkHvgZSaQR6Ok=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MHtY5JwcEz2Cq5PYMOvL8AIpqg2Wg8c3+gVNleh8l+hbWK7bFbm4YI6oefrls19BI
 3iRRwTuB+MIlwJKGAyWgqX8+2NadEb3X/+tdzMFgIAd0+eUwofgTwhdWPI8fSWjt6u
 NMp4cWqaQWMW3i9tjRWMU9T/HQfwL4kDYG2jPvXg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 16/48] target/ppc: Add cia field to DisasContext
Date: Wed, 19 May 2021 22:51:16 +1000
Message-Id: <20210519125148.27720-17-david@gibson.dropbear.id.au>
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 Bruno Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210512185441.3619828-2-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 6c68d7006a..abdef7e291 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -157,6 +157,7 @@ void ppc_translate_init(void)
 /* internal defines */
 struct DisasContext {
     DisasContextBase base;
+    target_ulong cia;  /* current instruction address */
     uint32_t opcode;
     uint32_t exception;
     /* Routine used to access memory */
@@ -256,7 +257,7 @@ static void gen_exception_err(DisasContext *ctx, uint32_t excp, uint32_t error)
      * faulting instruction
      */
     if (ctx->exception == POWERPC_EXCP_NONE) {
-        gen_update_nip(ctx, ctx->base.pc_next - 4);
+        gen_update_nip(ctx, ctx->cia);
     }
     t0 = tcg_const_i32(excp);
     t1 = tcg_const_i32(error);
@@ -275,7 +276,7 @@ static void gen_exception(DisasContext *ctx, uint32_t excp)
      * faulting instruction
      */
     if (ctx->exception == POWERPC_EXCP_NONE) {
-        gen_update_nip(ctx, ctx->base.pc_next - 4);
+        gen_update_nip(ctx, ctx->cia);
     }
     t0 = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
@@ -4137,7 +4138,7 @@ static void gen_eieio(DisasContext *ctx)
          */
         if (!(ctx->insns_flags2 & PPC2_ISA300)) {
             qemu_log_mask(LOG_GUEST_ERROR, "invalid eieio using bit 6 at @"
-                          TARGET_FMT_lx "\n", ctx->base.pc_next - 4);
+                          TARGET_FMT_lx "\n", ctx->cia);
         } else {
             bar = TCG_MO_ST_LD;
         }
@@ -4806,14 +4807,14 @@ static void gen_b(DisasContext *ctx)
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
 
@@ -4912,11 +4913,11 @@ static void gen_bcond(DisasContext *ctx, int type)
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
@@ -5032,7 +5033,7 @@ static void gen_rfi(DisasContext *ctx)
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
     }
-    gen_update_cfar(ctx, ctx->base.pc_next - 4);
+    gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfi(cpu_env);
     gen_sync_exception(ctx);
 #endif
@@ -5049,7 +5050,7 @@ static void gen_rfid(DisasContext *ctx)
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
     }
-    gen_update_cfar(ctx, ctx->base.pc_next - 4);
+    gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfid(cpu_env);
     gen_sync_exception(ctx);
 #endif
@@ -5066,7 +5067,7 @@ static void gen_rfscv(DisasContext *ctx)
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
     }
-    gen_update_cfar(ctx, ctx->base.pc_next - 4);
+    gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfscv(cpu_env);
     gen_sync_exception(ctx);
 #endif
@@ -5109,7 +5110,7 @@ static void gen_scv(DisasContext *ctx)
 
     /* Set the PC back to the faulting instruction. */
     if (ctx->exception == POWERPC_EXCP_NONE) {
-        gen_update_nip(ctx, ctx->base.pc_next - 4);
+        gen_update_nip(ctx, ctx->cia);
     }
     gen_helper_scv(cpu_env, tcg_constant_i32(lev));
 
@@ -5317,7 +5318,7 @@ static inline void gen_op_mfspr(DisasContext *ctx)
             if (sprn != SPR_PVR) {
                 qemu_log_mask(LOG_GUEST_ERROR, "Trying to read privileged spr "
                               "%d (0x%03x) at " TARGET_FMT_lx "\n", sprn, sprn,
-                              ctx->base.pc_next - 4);
+                              ctx->cia);
             }
             gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
         }
@@ -5331,7 +5332,7 @@ static inline void gen_op_mfspr(DisasContext *ctx)
         /* Not defined */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "Trying to read invalid spr %d (0x%03x) at "
-                      TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
+                      TARGET_FMT_lx "\n", sprn, sprn, ctx->cia);
 
         /*
          * The behaviour depends on MSR:PR and SPR# bit 0x10, it can
@@ -5495,7 +5496,7 @@ static void gen_mtspr(DisasContext *ctx)
             /* Privilege exception */
             qemu_log_mask(LOG_GUEST_ERROR, "Trying to write privileged spr "
                           "%d (0x%03x) at " TARGET_FMT_lx "\n", sprn, sprn,
-                          ctx->base.pc_next - 4);
+                          ctx->cia);
             gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
         }
     } else {
@@ -5509,7 +5510,7 @@ static void gen_mtspr(DisasContext *ctx)
         /* Not defined */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "Trying to write invalid spr %d (0x%03x) at "
-                      TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
+                      TARGET_FMT_lx "\n", sprn, sprn, ctx->cia);
 
 
         /*
@@ -9148,6 +9149,7 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     LOG_DISAS("nip=" TARGET_FMT_lx " super=%d ir=%d\n",
               ctx->base.pc_next, ctx->mem_idx, (int)msr_ir);
 
+    ctx->cia = ctx->base.pc_next;
     ctx->opcode = translator_ldl_swap(env, ctx->base.pc_next,
                                       need_byteswap(ctx));
 
@@ -9177,7 +9179,7 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
                       TARGET_FMT_lx " %d\n",
                       opc1(ctx->opcode), opc2(ctx->opcode),
                       opc3(ctx->opcode), opc4(ctx->opcode),
-                      ctx->opcode, ctx->base.pc_next - 4, (int)msr_ir);
+                      ctx->opcode, ctx->cia, (int)msr_ir);
     } else {
         uint32_t inval;
 
@@ -9194,7 +9196,7 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
                           TARGET_FMT_lx "\n", ctx->opcode & inval,
                           opc1(ctx->opcode), opc2(ctx->opcode),
                           opc3(ctx->opcode), opc4(ctx->opcode),
-                          ctx->opcode, ctx->base.pc_next - 4);
+                          ctx->opcode, ctx->cia);
             gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
             ctx->base.is_jmp = DISAS_NORETURN;
             return;
-- 
2.31.1


