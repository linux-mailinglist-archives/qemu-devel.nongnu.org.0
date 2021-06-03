Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F76399D0C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:48:48 +0200 (CEST)
Received: from localhost ([::1]:52204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loj1z-0002yE-M8
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loieM-0000dX-MS; Thu, 03 Jun 2021 04:24:22 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54421 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loieK-0000p9-HL; Thu, 03 Jun 2021 04:24:22 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5t1gwlz9t6h; Thu,  3 Jun 2021 18:22:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708562;
 bh=vNY+dFF7JfWfsdysrLG7jh7ZqrK20hj7GtOE6Iee0Qc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DFGBgEzzCshdH3MID42wMw+dfOGspS6JVdtNw3GJBeO5ZY7xyLmmt9E/VJ+8MVxH+
 rqHGhaaAfSjynGcYsAvOM0upgfeYB4zHGweqf6EycXTx9gRC+3UqubC8kIIaOo6pB0
 ma2G8i3bzpizfrnwRjZu5Q6fiDJ/IIrRJGQuotzI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 41/42] target/ppc: Move cmp/cmpi/cmpl/cmpli to decodetree
Date: Thu,  3 Jun 2021 18:22:30 +1000
Message-Id: <20210603082231.601214-42-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Additionally, REQUIRE_64BIT when L=1 to match what is specified in The
Programming Environments Manual:

"For 32-bit implementations, the L field must be cleared, otherwise the
instruction form is invalid."

Some CPUs are known to deviate from this specification by ignoring the
L bit [1]. The stricter behavior, however, can help users that test
software with qemu, making it more likely to detect bugs that would
otherwise be silent.

If deemed necessary, a future patch can adapt this behavior based on
the specific CPU model.

[1] The 601 manual is the only one I've found that explicitly states
that the L bit is ignored, but we also observe this behavior in a 7447A
v1.2.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210601193528.2533031-15-matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[dwg: Corrected whitespace error]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/insn32.decode                   | 14 ++++++
 target/ppc/translate.c                     | 52 ----------------------
 target/ppc/translate/fixedpoint-impl.c.inc | 31 +++++++++++++
 3 files changed, 45 insertions(+), 52 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 93e5d44d9e..9fd8d6b817 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -20,6 +20,10 @@
 &D              rt ra si:int64_t
 @D              ...... rt:5 ra:5 si:s16                 &D
 
+&D_bf           bf l:bool ra imm
+@D_bfs          ...... bf:3 - l:1 ra:5 imm:s16          &D_bf
+@D_bfu          ...... bf:3 - l:1 ra:5 imm:16           &D_bf
+
 %ds_si          2:s14  !function=times_4
 @DS             ...... rt:5 ra:5 .............. ..      &D si=%ds_si
 
@@ -36,6 +40,9 @@
 &X_bi           rt bi
 @X_bi           ...... rt:5 bi:5 ----- .......... -     &X_bi
 
+&X_bfl          bf l:bool ra rb
+@X_bfl          ...... bf:3 - l:1 ra:5 rb:5 ..........- &X_bfl
+
 ### Fixed-Point Load Instructions
 
 LBZ             100010 ..... ..... ................     @D
@@ -89,6 +96,13 @@ STDU            111110 ..... ..... ..............01     @DS
 STDX            011111 ..... ..... ..... 0010010101 -   @X
 STDUX           011111 ..... ..... ..... 0010110101 -   @X
 
+### Fixed-Point Compare Instructions
+
+CMP             011111 ... - . ..... ..... 0000000000 - @X_bfl
+CMPL            011111 ... - . ..... ..... 0000100000 - @X_bfl
+CMPI            001011 ... - . ..... ................   @D_bfs
+CMPLI           001010 ... - . ..... ................   @D_bfu
+
 ### Fixed-Point Arithmetic Instructions
 
 ADDI            001110 ..... ..... ................     @D
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 35d8831d44..95e4d9b815 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1489,54 +1489,6 @@ static inline void gen_set_Rc0(DisasContext *ctx, TCGv reg)
     }
 }
 
-/* cmp */
-static void gen_cmp(DisasContext *ctx)
-{
-    if ((ctx->opcode & 0x00200000) && (ctx->insns_flags & PPC_64B)) {
-        gen_op_cmp(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)],
-                   1, crfD(ctx->opcode));
-    } else {
-        gen_op_cmp32(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)],
-                     1, crfD(ctx->opcode));
-    }
-}
-
-/* cmpi */
-static void gen_cmpi(DisasContext *ctx)
-{
-    if ((ctx->opcode & 0x00200000) && (ctx->insns_flags & PPC_64B)) {
-        gen_op_cmpi(cpu_gpr[rA(ctx->opcode)], SIMM(ctx->opcode),
-                    1, crfD(ctx->opcode));
-    } else {
-        gen_op_cmpi32(cpu_gpr[rA(ctx->opcode)], SIMM(ctx->opcode),
-                      1, crfD(ctx->opcode));
-    }
-}
-
-/* cmpl */
-static void gen_cmpl(DisasContext *ctx)
-{
-    if ((ctx->opcode & 0x00200000) && (ctx->insns_flags & PPC_64B)) {
-        gen_op_cmp(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)],
-                   0, crfD(ctx->opcode));
-    } else {
-        gen_op_cmp32(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)],
-                     0, crfD(ctx->opcode));
-    }
-}
-
-/* cmpli */
-static void gen_cmpli(DisasContext *ctx)
-{
-    if ((ctx->opcode & 0x00200000) && (ctx->insns_flags & PPC_64B)) {
-        gen_op_cmpi(cpu_gpr[rA(ctx->opcode)], UIMM(ctx->opcode),
-                    0, crfD(ctx->opcode));
-    } else {
-        gen_op_cmpi32(cpu_gpr[rA(ctx->opcode)], UIMM(ctx->opcode),
-                      0, crfD(ctx->opcode));
-    }
-}
-
 /* cmprb - range comparison: isupper, isaplha, islower*/
 static void gen_cmprb(DisasContext *ctx)
 {
@@ -7639,10 +7591,6 @@ GEN_HANDLER_E(brw, 0x1F, 0x1B, 0x04, 0x0000F801, PPC_NONE, PPC2_ISA310),
 GEN_HANDLER_E(brh, 0x1F, 0x1B, 0x06, 0x0000F801, PPC_NONE, PPC2_ISA310),
 #endif
 GEN_HANDLER(invalid, 0x00, 0x00, 0x00, 0xFFFFFFFF, PPC_NONE),
-GEN_HANDLER(cmp, 0x1F, 0x00, 0x00, 0x00400000, PPC_INTEGER),
-GEN_HANDLER(cmpi, 0x0B, 0xFF, 0xFF, 0x00400000, PPC_INTEGER),
-GEN_HANDLER(cmpl, 0x1F, 0x00, 0x01, 0x00400001, PPC_INTEGER),
-GEN_HANDLER(cmpli, 0x0A, 0xFF, 0xFF, 0x00400000, PPC_INTEGER),
 #if defined(TARGET_PPC64)
 GEN_HANDLER_E(cmpeqb, 0x1F, 0x00, 0x07, 0x00600000, PPC_NONE, PPC2_ISA300),
 #endif
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 2713366791..8864ac4516 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -165,6 +165,37 @@ TRANS64(STDU, do_ldst_D, true, true, MO_Q)
 TRANS64(STDUX, do_ldst_X, true, true, MO_Q)
 TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_Q)
 
+/*
+ * Fixed-Point Compare Instructions
+ */
+
+static bool do_cmp_X(DisasContext *ctx, arg_X_bfl *a, bool s)
+{
+    if (a->l) {
+        REQUIRE_64BIT(ctx);
+        gen_op_cmp(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
+    } else {
+        gen_op_cmp32(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
+    }
+    return true;
+}
+
+static bool do_cmp_D(DisasContext *ctx, arg_D_bf *a, bool s)
+{
+    if (a->l) {
+        REQUIRE_64BIT(ctx);
+        gen_op_cmp(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->bf);
+    } else {
+        gen_op_cmp32(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->bf);
+    }
+    return true;
+}
+
+TRANS(CMP, do_cmp_X, true);
+TRANS(CMPL, do_cmp_X, false);
+TRANS(CMPI, do_cmp_D, true);
+TRANS(CMPLI, do_cmp_D, false);
+
 /*
  * Fixed-Point Arithmetic Instructions
  */
-- 
2.31.1


