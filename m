Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E73844035F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:40:11 +0200 (CEST)
Received: from localhost ([::1]:38402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXjT-0004bJ-Mg
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mgXVD-0006kd-5L; Fri, 29 Oct 2021 15:25:23 -0400
Received: from [201.28.113.2] (port=13933 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mgXVB-0008Cv-5l; Fri, 29 Oct 2021 15:25:22 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 29 Oct 2021 16:24:21 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id D73C2800B36;
 Fri, 29 Oct 2021 16:24:20 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 08/15] target/ppc: Do not update nip on DFP instructions
Date: Fri, 29 Oct 2021 16:24:10 -0300
Message-Id: <20211029192417.400707-9-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029192417.400707-1-luis.pires@eldorado.org.br>
References: <20211029192417.400707-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Oct 2021 19:24:21.0127 (UTC)
 FILETIME=[93064170:01D7CCFA]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793,
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
Cc: Luis Pires <luis.pires@eldorado.org.br>, richard.henderson@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before moving the existing DFP instructions to decodetree, drop the
nip update that shouldn't be done for these instructions.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
2.25.1


