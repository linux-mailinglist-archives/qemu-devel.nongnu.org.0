Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44492388EC6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:16:45 +0200 (CEST)
Received: from localhost ([::1]:39002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljM44-0005oK-6r
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhK-0001Sx-ER; Wed, 19 May 2021 08:53:14 -0400
Received: from ozlabs.org ([203.11.71.1]:40323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhG-0001KE-9n; Wed, 19 May 2021 08:53:14 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnj3p2qz9t1s; Wed, 19 May 2021 22:52:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428729;
 bh=qRid1Fy5HDgT9EYdy78EWqjRUnTiqZ12oEqK++StO+w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ifks3c3hnNxROxwDT+YfBibpS+fW8Z++/9BIDj68ZZS+WAc0eSvYNZkVlort+u2FU
 Tj5+ZLCMxSFopJtPRaOATDCIG5ErelyYMQ0bLiAKMUffO3alN+3jU3ygpHYxE42pnB
 i4q0/9fyibd73wKxHAVmD1vVeustRf2/oMuCgt+c=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 27/48] target/ppc: Replace POWERPC_EXCP_BRANCH with
 DISAS_NORETURN
Date: Wed, 19 May 2021 22:51:27 +1000
Message-Id: <20210519125148.27720-28-david@gibson.dropbear.id.au>
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

The translation of branch instructions always results in exit from
the TB. Remove the synthetic "exception" after no more uses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210517205025.3777947-4-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
index 9e38df685d..cab33a3680 100644
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
index f57b67be5f..d019454550 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4692,7 +4692,6 @@ static void gen_b(DisasContext *ctx)
 {
     target_ulong li, target;
 
-    ctx->exception = POWERPC_EXCP_BRANCH;
     /* sign extend LI */
     li = LI(ctx->opcode);
     li = (li ^ 0x02000000) - 0x02000000;
@@ -4706,6 +4705,7 @@ static void gen_b(DisasContext *ctx)
     }
     gen_update_cfar(ctx, ctx->cia);
     gen_goto_tb(ctx, 0, target);
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 #define BCOND_IM  0
@@ -4718,7 +4718,6 @@ static void gen_bcond(DisasContext *ctx, int type)
     uint32_t bo = BO(ctx->opcode);
     TCGLabel *l1;
     TCGv target;
-    ctx->exception = POWERPC_EXCP_BRANCH;
 
     if (type == BCOND_LR || type == BCOND_CTR || type == BCOND_TAR) {
         target = tcg_temp_local_new();
@@ -4825,6 +4824,7 @@ static void gen_bcond(DisasContext *ctx, int type)
         gen_set_label(l1);
         gen_goto_tb(ctx, 1, ctx->base.pc_next);
     }
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_bc(DisasContext *ctx)
@@ -9102,7 +9102,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     /* Check trace mode exceptions */
     if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP &&
                  (ctx->base.pc_next <= 0x100 || ctx->base.pc_next > 0xF00) &&
-                 ctx->exception != POWERPC_EXCP_BRANCH &&
                  ctx->base.is_jmp != DISAS_NORETURN)) {
         uint32_t excp = gen_prep_dbgex(ctx);
         gen_exception_nip(ctx, excp, ctx->base.pc_next);
@@ -9118,9 +9117,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
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
2.31.1


