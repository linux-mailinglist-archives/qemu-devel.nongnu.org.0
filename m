Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A67744A6E5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:36:38 +0100 (CET)
Received: from localhost ([::1]:51660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKkG-0001hw-VQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:36:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3q-0004WE-Rn; Tue, 09 Nov 2021 00:52:47 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=38925
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3l-0006hc-IG; Tue, 09 Nov 2021 00:52:46 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp1XVLz4xdt; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=TszzFDHRDsgf7fifdZ9ElJmrYaQbXyWkhTiS5BvuWO0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cufdgHC+dbNJUZzyTSrMBZd1238KBwkrhJMKQGhUKxUNLarWpEcCOFI9M3jVLycxu
 pqOYWO9efc92YchD+MgWdkLZlNl3DhdIN58/qf4ytouGU/sxg0vJrkTsEUcy/s5eOA
 gWsUk0Hrk+n80utpLfh9jSzT/3s1mjb0oDtJtPNI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 18/54] target/ppc: Do not update nip on DFP instructions
Date: Tue,  9 Nov 2021 16:51:28 +1100
Message-Id: <20211109055204.230765-19-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

Before moving the existing DFP instructions to decodetree, drop the
nip update that shouldn't be done for these instructions.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029192417.400707-9-luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate/dfp-impl.c.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/ppc/translate/dfp-impl.c.inc b/target/ppc/translate/dfp-impl.c.inc
index e149777481..1431d955c6 100644
--- a/target/ppc/translate/dfp-impl.c.inc
+++ b/target/ppc/translate/dfp-impl.c.inc
@@ -15,7 +15,6 @@ static void gen_##name(DisasContext *ctx)        \
         gen_exception(ctx, POWERPC_EXCP_FPU);    \
         return;                                  \
     }                                            \
-    gen_update_nip(ctx, ctx->base.pc_next - 4);  \
     rd = gen_fprp_ptr(rD(ctx->opcode));          \
     ra = gen_fprp_ptr(rA(ctx->opcode));          \
     rb = gen_fprp_ptr(rB(ctx->opcode));          \
@@ -36,7 +35,6 @@ static void gen_##name(DisasContext *ctx)         \
         gen_exception(ctx, POWERPC_EXCP_FPU);     \
         return;                                   \
     }                                             \
-    gen_update_nip(ctx, ctx->base.pc_next - 4);            \
     ra = gen_fprp_ptr(rA(ctx->opcode));           \
     rb = gen_fprp_ptr(rB(ctx->opcode));           \
     gen_helper_##name(cpu_crf[crfD(ctx->opcode)], \
@@ -54,7 +52,6 @@ static void gen_##name(DisasContext *ctx)         \
         gen_exception(ctx, POWERPC_EXCP_FPU);     \
         return;                                   \
     }                                             \
-    gen_update_nip(ctx, ctx->base.pc_next - 4);            \
     uim = tcg_const_i32(UIMM5(ctx->opcode));      \
     rb = gen_fprp_ptr(rB(ctx->opcode));           \
     gen_helper_##name(cpu_crf[crfD(ctx->opcode)], \
@@ -72,7 +69,6 @@ static void gen_##name(DisasContext *ctx)         \
         gen_exception(ctx, POWERPC_EXCP_FPU);     \
         return;                                   \
     }                                             \
-    gen_update_nip(ctx, ctx->base.pc_next - 4);   \
     ra = gen_fprp_ptr(rA(ctx->opcode));           \
     dcm = tcg_const_i32(DCM(ctx->opcode));        \
     gen_helper_##name(cpu_crf[crfD(ctx->opcode)], \
@@ -90,7 +86,6 @@ static void gen_##name(DisasContext *ctx)             \
         gen_exception(ctx, POWERPC_EXCP_FPU);         \
         return;                                       \
     }                                                 \
-    gen_update_nip(ctx, ctx->base.pc_next - 4);       \
     rt = gen_fprp_ptr(rD(ctx->opcode));               \
     rb = gen_fprp_ptr(rB(ctx->opcode));               \
     u32_1 = tcg_const_i32(u32f1(ctx->opcode));        \
@@ -114,7 +109,6 @@ static void gen_##name(DisasContext *ctx)        \
         gen_exception(ctx, POWERPC_EXCP_FPU);    \
         return;                                  \
     }                                            \
-    gen_update_nip(ctx, ctx->base.pc_next - 4);  \
     rt = gen_fprp_ptr(rD(ctx->opcode));          \
     ra = gen_fprp_ptr(rA(ctx->opcode));          \
     rb = gen_fprp_ptr(rB(ctx->opcode));          \
@@ -137,7 +131,6 @@ static void gen_##name(DisasContext *ctx)        \
         gen_exception(ctx, POWERPC_EXCP_FPU);    \
         return;                                  \
     }                                            \
-    gen_update_nip(ctx, ctx->base.pc_next - 4);  \
     rt = gen_fprp_ptr(rD(ctx->opcode));          \
     rb = gen_fprp_ptr(rB(ctx->opcode));          \
     gen_helper_##name(cpu_env, rt, rb);          \
@@ -157,7 +150,6 @@ static void gen_##name(DisasContext *ctx)          \
         gen_exception(ctx, POWERPC_EXCP_FPU);      \
         return;                                    \
     }                                              \
-    gen_update_nip(ctx, ctx->base.pc_next - 4);    \
     rt = gen_fprp_ptr(rD(ctx->opcode));            \
     rs = gen_fprp_ptr(fprfld(ctx->opcode));        \
     i32 = tcg_const_i32(i32fld(ctx->opcode));      \
-- 
2.33.1


