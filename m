Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F09388EAA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:11:40 +0200 (CEST)
Received: from localhost ([::1]:51890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljLz9-0003ui-7g
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhK-0001T3-GI; Wed, 19 May 2021 08:53:14 -0400
Received: from ozlabs.org ([203.11.71.1]:59033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhG-0001KD-3h; Wed, 19 May 2021 08:53:14 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnh6YX2z9t1r; Wed, 19 May 2021 22:52:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428728;
 bh=wm6gL6C25/ZglghH2dRTWQXcAMseYyp2xvnue02EqCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bpU+adkufDgoBA4pP6fVmpzgsImGC9zWwrYm1yheak41Z3dm0/lkQGkbuVnORydlt
 p0KcIHTkVeGah2YkviwMcemOyHTQ7nKBLG7FHu32QYuTDlbuuUssV/A5TAo63359Uc
 kjINXax/Ofx6z2kjYQSUc1B6kseGHf/ugbtOfVeo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 26/48] target/ppc: Replace POWERPC_EXCP_STOP with
 DISAS_EXIT_UPDATE
Date: Wed, 19 May 2021 22:51:26 +1000
Message-Id: <20210519125148.27720-27-david@gibson.dropbear.id.au>
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

Remove the synthetic "exception" after no more uses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210517205025.3777947-3-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 linux-user/ppc/cpu_loop.c |  3 ---
 target/ppc/cpu.h          |  1 -
 target/ppc/translate.c    | 24 +++++++-----------------
 3 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index 4a0f6c8dc2..fe526693d2 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -423,9 +423,6 @@ void cpu_loop(CPUPPCState *env)
             cpu_abort(cs, "Maintenance exception while in user mode. "
                       "Aborting\n");
             break;
-        case POWERPC_EXCP_STOP:     /* stop translation                      */
-            /* We did invalidate the instruction cache. Go on */
-            break;
         case POWERPC_EXCP_BRANCH:   /* branch instruction:                   */
             /* We just stopped because of a branch. Go on */
             break;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 99ee1e09b2..9e38df685d 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -132,7 +132,6 @@ enum {
     /* EOL                                                                   */
     POWERPC_EXCP_NB       = 103,
     /* QEMU exceptions: used internally during code translation              */
-    POWERPC_EXCP_STOP         = 0x200, /* stop translation                   */
     POWERPC_EXCP_BRANCH       = 0x201, /* branch instruction                 */
     /* QEMU exceptions: special cases we want to stop translation            */
     POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 060ef83bc0..f57b67be5f 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -369,13 +369,6 @@ static inline void gen_hvpriv_exception(DisasContext *ctx, uint32_t error)
     gen_exception_err(ctx, POWERPC_EXCP_HV_EMU, POWERPC_EXCP_PRIV | error);
 }
 
-/* Stop translation */
-static inline void gen_stop_exception(DisasContext *ctx)
-{
-    gen_update_nip(ctx, ctx->base.pc_next);
-    ctx->exception = POWERPC_EXCP_STOP;
-}
-
 /*****************************************************************************/
 /* SPR READ/WRITE CALLBACKS */
 
@@ -829,7 +822,7 @@ void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_store_hid0_601(cpu_env, cpu_gpr[gprn]);
     /* Must stop the translation as endianness may have changed */
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 }
 #endif
 
@@ -877,7 +870,7 @@ void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
     gen_store_spr(sprn, cpu_gpr[gprn]);
     gen_helper_store_40x_dbcr0(cpu_env, cpu_gpr[gprn]);
     /* We must stop translation as we may have rebooted */
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 }
 
 void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
@@ -4080,7 +4073,7 @@ static void gen_isync(DisasContext *ctx)
         gen_check_tlb_flush(ctx, false);
     }
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 }
 
 #define MEMOP_GET_SIZE(x)  (1 << ((x) & MO_SIZE))
@@ -5312,7 +5305,7 @@ static void gen_mtmsrd(DisasContext *ctx)
         gen_helper_store_msr(cpu_env, cpu_gpr[rS(ctx->opcode)]);
     }
     /* Must stop the translation as machine state (may have) changed */
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 #endif /* !defined(CONFIG_USER_ONLY) */
 }
 #endif /* defined(TARGET_PPC64) */
@@ -5355,7 +5348,7 @@ static void gen_mtmsr(DisasContext *ctx)
         tcg_temp_free(msr);
     }
     /* Must stop the translation as machine state (may have) changed */
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 #endif
 }
 
@@ -7492,7 +7485,7 @@ static void gen_wrtee(DisasContext *ctx)
      * Stop translation to have a chance to raise an exception if we
      * just set msr_ee to 1
      */
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -7506,7 +7499,7 @@ static void gen_wrteei(DisasContext *ctx)
     if (ctx->opcode & 0x00008000) {
         tcg_gen_ori_tl(cpu_msr, cpu_msr, (1 << MSR_EE));
         /* Stop translation to have a chance to raise an exception */
-        gen_stop_exception(ctx);
+        ctx->base.is_jmp = DISAS_EXIT_UPDATE;
     } else {
         tcg_gen_andi_tl(cpu_msr, cpu_msr, ~(1 << MSR_EE));
     }
@@ -9128,9 +9121,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         case POWERPC_EXCP_BRANCH:
             ctx->base.is_jmp = DISAS_NORETURN;
             break;
-        case POWERPC_EXCP_STOP:
-            ctx->base.is_jmp = DISAS_EXIT;
-            break;
         default:
             /* Every other ctx->exception should have set NORETURN. */
             g_assert_not_reached();
-- 
2.31.1


