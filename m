Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFE0386C1A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 23:17:43 +0200 (CEST)
Received: from localhost ([::1]:53640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1likcQ-0007SV-Dg
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 17:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1likFy-0007sD-F3; Mon, 17 May 2021 16:54:30 -0400
Received: from [201.28.113.2] (port=46491 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1likFw-0001mN-Od; Mon, 17 May 2021 16:54:30 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 17 May 2021 17:50:38 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id BA15180139F;
 Mon, 17 May 2021 17:50:37 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 23/23] target/ppc: Move cmp/cmpi/cmpl/cmpli to decodetree
Date: Mon, 17 May 2021 17:50:25 -0300
Message-Id: <20210517205025.3777947-24-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2021 20:50:38.0223 (UTC)
 FILETIME=[4AA7A9F0:01D74B5E]
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
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
index aef01af396..3fe58d0386 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1575,54 +1575,6 @@ static inline void gen_set_Rc0(DisasContext *ctx, TCGv reg)
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
@@ -7725,10 +7677,6 @@ GEN_HANDLER_E(brw, 0x1F, 0x1B, 0x04, 0x0000F801, PPC_NONE, PPC2_ISA310),
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
index 4f257a931c..49c8993333 100644
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
+    REQUIRE_INSNS_FLAGS(ctx, INTEGER);
+    if(a->l && (ctx->insns_flags & PPC_64B)) {
+        gen_op_cmp(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
+    } else {
+        gen_op_cmp32(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
+    }
+    return true;
+}
+
+static bool do_cmp_D(DisasContext *ctx, arg_D_bf *a, bool s)
+{
+    REQUIRE_INSNS_FLAGS(ctx, INTEGER);
+    if(a->l && (ctx->insns_flags & PPC_64B)) {
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
2.25.1


