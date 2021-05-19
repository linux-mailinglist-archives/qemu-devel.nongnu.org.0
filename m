Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A60388EC3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:16:13 +0200 (CEST)
Received: from localhost ([::1]:37544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljM3X-0004jY-GU
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgz-0001JP-NI; Wed, 19 May 2021 08:52:56 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:36237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgx-0001KJ-1N; Wed, 19 May 2021 08:52:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnk0b1fz9t25; Wed, 19 May 2021 22:52:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428730;
 bh=X+Y5b5/xIZsPnjiDvYYY3iKVgaD26GtrNAB6EytgFyA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PdpcuvMozvJFSzwLTsDLc17b8kAi9ydiQ9uLCyMgELRyx0mhKTXUNJ5LXWq7IFWAt
 r7rDRdpD40MmeIhlXlLimmow2r5zK6SLimtDsCAZVzbZuwtzKmBZ0zCcIHHUGZrQaC
 FURCEO7MFHkYsptdtZOMxnjkG+vWKjadsmPCOn+c=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 28/48] target/ppc: Remove DisasContext.exception
Date: Wed, 19 May 2021 22:51:28 +1000
Message-Id: <20210519125148.27720-29-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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

Now that we have removed all of the fake exceptions, and all real
exceptions exit via DISAS_NORETURN, we can remove this field.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210517205025.3777947-5-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 30 ++++--------------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d019454550..80cd11b3f8 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -159,7 +159,6 @@ struct DisasContext {
     DisasContextBase base;
     target_ulong cia;  /* current instruction address */
     uint32_t opcode;
-    uint32_t exception;
     /* Routine used to access memory */
     bool pr, hv, dr, le_mode;
     bool lazy_tlb_flush;
@@ -261,15 +260,12 @@ static void gen_exception_err(DisasContext *ctx, uint32_t excp, uint32_t error)
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
 
@@ -281,13 +277,10 @@ static void gen_exception(DisasContext *ctx, uint32_t excp)
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
 
@@ -300,7 +293,6 @@ static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
     t0 = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
     tcg_temp_free_i32(t0);
-    ctx->exception = excp;
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -4993,13 +4985,10 @@ static void gen_scv(DisasContext *ctx)
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
@@ -9005,7 +8994,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     uint32_t hflags = ctx->base.tb->flags;
     int bound;
 
-    ctx->exception = POWERPC_EXCP_NONE;
     ctx->spr_cb = env->spr_cb;
     ctx->pr = (hflags >> HFLAGS_PR) & 1;
     ctx->mem_idx = (hflags >> HFLAGS_DMMU_IDX) & 7;
@@ -9112,16 +9100,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
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
2.31.1


