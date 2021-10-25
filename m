Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74B043A06E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 21:28:16 +0200 (CEST)
Received: from localhost ([::1]:59224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf5dn-0006Ms-Kb
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 15:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf5QE-0001GR-2c; Mon, 25 Oct 2021 15:14:14 -0400
Received: from [201.28.113.2] (port=13660 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf5QA-0000Ju-Gn; Mon, 25 Oct 2021 15:14:12 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 25 Oct 2021 16:12:28 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id BC269800145;
 Mon, 25 Oct 2021 16:12:27 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 12/19] target/ppc: Do not update nip on DFP instructions
Date: Mon, 25 Oct 2021 16:11:47 -0300
Message-Id: <20211025191154.350831-13-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025191154.350831-1-luis.pires@eldorado.org.br>
References: <20211025191154.350831-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Oct 2021 19:12:28.0081 (UTC)
 FILETIME=[405D1210:01D7C9D4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


