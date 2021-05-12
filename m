Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED6437D3D1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:22:16 +0200 (CEST)
Received: from localhost ([::1]:48364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguQv-0001Xl-TM
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu2A-0006FL-19; Wed, 12 May 2021 14:56:38 -0400
Received: from [201.28.113.2] (port=20812 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu28-0007uU-BU; Wed, 12 May 2021 14:56:37 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:56:02 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 86A4A80139F;
 Wed, 12 May 2021 15:56:02 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 11/31] target/ppc: Replace POWERPC_EXCP_STOP with
 DISAS_EXIT_UPDATE
Date: Wed, 12 May 2021 15:54:21 -0300
Message-Id: <20210512185441.3619828-12-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:56:02.0875 (UTC)
 FILETIME=[749010B0:01D74760]
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

Remove the synthetic "exception" after no more uses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
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
index 503de6db85..22456f9a72 100644
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
index f6410dc76c..db6f11d632 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -366,13 +366,6 @@ static inline void gen_hvpriv_exception(DisasContext *ctx, uint32_t error)
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
 
@@ -832,7 +825,7 @@ static void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_store_hid0_601(cpu_env, cpu_gpr[gprn]);
     /* Must stop the translation as endianness may have changed */
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 }
 #endif
 
@@ -880,7 +873,7 @@ static void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
     gen_store_spr(sprn, cpu_gpr[gprn]);
     gen_helper_store_40x_dbcr0(cpu_env, cpu_gpr[gprn]);
     /* We must stop translation as we may have rebooted */
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 }
 
 static void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
@@ -4083,7 +4076,7 @@ static void gen_isync(DisasContext *ctx)
         gen_check_tlb_flush(ctx, false);
     }
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 }
 
 #define MEMOP_GET_SIZE(x)  (1 << ((x) & MO_SIZE))
@@ -5315,7 +5308,7 @@ static void gen_mtmsrd(DisasContext *ctx)
         gen_helper_store_msr(cpu_env, cpu_gpr[rS(ctx->opcode)]);
     }
     /* Must stop the translation as machine state (may have) changed */
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 #endif /* !defined(CONFIG_USER_ONLY) */
 }
 #endif /* defined(TARGET_PPC64) */
@@ -5358,7 +5351,7 @@ static void gen_mtmsr(DisasContext *ctx)
         tcg_temp_free(msr);
     }
     /* Must stop the translation as machine state (may have) changed */
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 #endif
 }
 
@@ -7495,7 +7488,7 @@ static void gen_wrtee(DisasContext *ctx)
      * Stop translation to have a chance to raise an exception if we
      * just set msr_ee to 1
      */
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -7509,7 +7502,7 @@ static void gen_wrteei(DisasContext *ctx)
     if (ctx->opcode & 0x00008000) {
         tcg_gen_ori_tl(cpu_msr, cpu_msr, (1 << MSR_EE));
         /* Stop translation to have a chance to raise an exception */
-        gen_stop_exception(ctx);
+        ctx->base.is_jmp = DISAS_EXIT_UPDATE;
     } else {
         tcg_gen_andi_tl(cpu_msr, cpu_msr, ~(1 << MSR_EE));
     }
@@ -9319,9 +9312,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
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
2.25.1


