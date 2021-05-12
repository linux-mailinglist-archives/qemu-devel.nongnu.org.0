Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1A537D3D6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:26:05 +0200 (CEST)
Received: from localhost ([::1]:57392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguUe-0007pf-Pg
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu6p-0002el-SP; Wed, 12 May 2021 15:01:27 -0400
Received: from [201.28.113.2] (port=1436 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu6o-0002Bm-BR; Wed, 12 May 2021 15:01:27 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:56:09 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 0554E80139F;
 Wed, 12 May 2021 15:56:08 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 31/31] target/ppc: Move addpcis to decodetree
Date: Wed, 12 May 2021 15:54:41 -0300
Message-Id: <20210512185441.3619828-32-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:56:09.0392 (UTC)
 FILETIME=[78727B00:01D74760]
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
 target/ppc/insn32.decode                   | 6 ++++++
 target/ppc/translate.c                     | 9 ---------
 target/ppc/translate/fixedpoint-impl.c.inc | 7 +++++++
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 73b5ea0422..a827d0bdee 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -23,6 +23,10 @@
 %ds_si          2:s14  !function=times_4
 @DS             ...... rt:5 ra:5 .............. ..      &D si=%ds_si
 
+&DX             rt d
+%dx_d           6:s10 16:5 0:1
+@DX             ...... rt:5  ..... .......... ..... .   &DX d=%dx_d
+
 &VX             vrt vra vrb
 @VX             ...... vrt:5 vra:5 vrb:5 .......... .   &VX
 
@@ -90,6 +94,8 @@ STDUX           011111 ..... ..... ..... 0010110101 -   @X
 ADDI            001110 ..... ..... ................     @D
 ADDIS           001111 ..... ..... ................     @D
 
+ADDPCIS         010011 ..... ..... .......... 00010 .   @DX
+
 ## Fixed-Point Logical Instructions
 
 CFUGED          011111 ..... ..... ..... 0011011100 -   @X
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 847de8e012..26368cf402 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1868,14 +1868,6 @@ static void gen_addic_(DisasContext *ctx)
     gen_op_addic(ctx, 1);
 }
 
-/* addpcis */
-static void gen_addpcis(DisasContext *ctx)
-{
-    target_long d = DX(ctx->opcode);
-
-    tcg_gen_movi_tl(cpu_gpr[rD(ctx->opcode)], ctx->base.pc_next + (d << 16));
-}
-
 static inline void gen_op_arith_divw(DisasContext *ctx, TCGv ret, TCGv arg1,
                                      TCGv arg2, int sign, int compute_ov)
 {
@@ -7748,7 +7740,6 @@ GEN_HANDLER_E(cmprb, 0x1F, 0x00, 0x06, 0x00400001, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(isel, 0x1F, 0x0F, 0xFF, 0x00000001, PPC_ISEL),
 GEN_HANDLER(addic, 0x0C, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
 GEN_HANDLER2(addic_, "addic.", 0x0D, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
-GEN_HANDLER_E(addpcis, 0x13, 0x2, 0xFF, 0x00000000, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(mulhw, 0x1F, 0x0B, 0x02, 0x00000400, PPC_INTEGER),
 GEN_HANDLER(mulhwu, 0x1F, 0x0B, 0x00, 0x00000400, PPC_INTEGER),
 GEN_HANDLER(mullw, 0x1F, 0x0B, 0x07, 0x00000000, PPC_INTEGER),
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 4617f7356b..5e13a67af3 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -194,6 +194,13 @@ static bool trans_ADDIS(DisasContext *ctx, arg_D *a)
     return trans_ADDI(ctx, a);
 }
 
+static bool trans_ADDPCIS(DisasContext *ctx, arg_DX *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    tcg_gen_movi_tl(cpu_gpr[a->rt], ctx->base.pc_next + (a->d<<16));
+    return true;
+}
+
 static bool trans_PNOP(DisasContext *ctx, arg_PNOP *a)
 {
     if (a->invalid_suffix) {
-- 
2.25.1


