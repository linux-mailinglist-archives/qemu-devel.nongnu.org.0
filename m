Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2FC37D3C6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:13:53 +0200 (CEST)
Received: from localhost ([::1]:59880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguIq-0006v8-2b
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu2Y-0006TA-0E; Wed, 12 May 2021 14:57:02 -0400
Received: from [201.28.113.2] (port=20812 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu2W-0007uU-3q; Wed, 12 May 2021 14:57:01 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:56:03 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id D4F968000C2;
 Wed, 12 May 2021 15:56:02 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 12/31] target/ppc: Replace POWERPC_EXCP_BRANCH with
 DISAS_NORETURN
Date: Wed, 12 May 2021 15:54:22 -0300
Message-Id: <20210512185441.3619828-13-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:56:03.0234 (UTC)
 FILETIME=[74C6D820:01D74760]
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

The translation of branch instructions always results in exit from
the TB.  Remove the synthetic "exception" after no more uses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 linux-user/ppc/cpu_loop.c | 3 ---
 target/ppc/cpu.h          | 2 --
 target/ppc/translate.c    | 8 ++------
 3 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index fe526693d2..fa91ea0eed 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -423,9 +423,6 @@ void cpu_loop(CPUPPCState *env)
             cpu_abort(cs, "Maintenance exception while in user mode. "
                       "Aborting\n");
             break;
-        case POWERPC_EXCP_BRANCH:   /* branch instruction:                   */
-            /* We just stopped because of a branch. Go on */
-            break;
         case POWERPC_EXCP_SYSCALL_USER:
             /* system call in user-mode emulation */
             /* WARNING:
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 22456f9a72..1c3486e9d0 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -131,8 +131,6 @@ enum {
     POWERPC_EXCP_SYSCALL_VECTORED = 102, /* scv exception                     */
     /* EOL                                                                   */
     POWERPC_EXCP_NB       = 103,
-    /* QEMU exceptions: used internally during code translation              */
-    POWERPC_EXCP_BRANCH       = 0x201, /* branch instruction                 */
     /* QEMU exceptions: special cases we want to stop translation            */
     POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
 };
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index db6f11d632..43320d2b8b 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4695,7 +4695,6 @@ static void gen_b(DisasContext *ctx)
 {
     target_ulong li, target;
 
-    ctx->exception = POWERPC_EXCP_BRANCH;
     /* sign extend LI */
     li = LI(ctx->opcode);
     li = (li ^ 0x02000000) - 0x02000000;
@@ -4709,6 +4708,7 @@ static void gen_b(DisasContext *ctx)
     }
     gen_update_cfar(ctx, ctx->cia);
     gen_goto_tb(ctx, 0, target);
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 #define BCOND_IM  0
@@ -4721,7 +4721,6 @@ static void gen_bcond(DisasContext *ctx, int type)
     uint32_t bo = BO(ctx->opcode);
     TCGLabel *l1;
     TCGv target;
-    ctx->exception = POWERPC_EXCP_BRANCH;
 
     if (type == BCOND_LR || type == BCOND_CTR || type == BCOND_TAR) {
         target = tcg_temp_local_new();
@@ -4828,6 +4827,7 @@ static void gen_bcond(DisasContext *ctx, int type)
         gen_set_label(l1);
         gen_goto_tb(ctx, 1, ctx->base.pc_next);
     }
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_bc(DisasContext *ctx)
@@ -9293,7 +9293,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     /* Check trace mode exceptions */
     if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP &&
                  (ctx->base.pc_next <= 0x100 || ctx->base.pc_next > 0xF00) &&
-                 ctx->exception != POWERPC_EXCP_BRANCH &&
                  ctx->base.is_jmp != DISAS_NORETURN)) {
         uint32_t excp = gen_prep_dbgex(ctx);
         gen_exception_nip(ctx, excp, ctx->base.pc_next);
@@ -9309,9 +9308,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         switch (ctx->exception) {
         case POWERPC_EXCP_NONE:
             break;
-        case POWERPC_EXCP_BRANCH:
-            ctx->base.is_jmp = DISAS_NORETURN;
-            break;
         default:
             /* Every other ctx->exception should have set NORETURN. */
             g_assert_not_reached();
-- 
2.25.1


