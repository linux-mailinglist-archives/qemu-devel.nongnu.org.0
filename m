Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B592049B5EC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:19:12 +0100 (CET)
Received: from localhost ([::1]:39712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCMf9-0004yO-Q7
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:19:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAa-0001Xl-F5; Tue, 25 Jan 2022 07:43:36 -0500
Received: from [187.72.171.209] (port=41125 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAX-0007RA-BY; Tue, 25 Jan 2022 07:43:30 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:41 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id DFD2C8009AB;
 Tue, 25 Jan 2022 09:20:40 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 20/38] target/ppc: Move xxsel to decodetree
Date: Tue, 25 Jan 2022 09:19:25 -0300
Message-Id: <20220125121943.3269077-21-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:41.0262 (UTC)
 FILETIME=[F7F4ACE0:01D811E5]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  6 ++++
 target/ppc/insn64.decode            | 24 ++++++++--------
 target/ppc/translate/vsx-impl.c.inc | 20 ++++++--------
 target/ppc/translate/vsx-ops.c.inc  | 43 -----------------------------
 4 files changed, 26 insertions(+), 67 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 2ebb441550..e56aec7636 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -148,12 +148,16 @@
 %xx_xt          0:1 21:5
 %xx_xb          1:1 11:5
 %xx_xa          2:1 16:5
+%xx_xc          3:1 6:5
 &XX2            xt xb uim:uint8_t
 @XX2            ...... ..... ... uim:2 ..... ......... ..       &XX2 xt=%xx_xt xb=%xx_xb
 
 &XX3            xt xa xb
 @XX3            ...... ..... ..... ..... ........ ...           &XX3 xt=%xx_xt xa=%xx_xa xb=%xx_xb
 
+&XX4            xt xa xb xc
+@XX4            ...... ..... ..... ..... ..... .. ....          &XX4 xt=%xx_xt xa=%xx_xa xb=%xx_xb xc=%xx_xc
+
 &Z22_bf_fra     bf fra dm
 @Z22_bf_fra     ...... bf:3 .. fra:5 dm:6 ......... .           &Z22_bf_fra
 
@@ -538,6 +542,8 @@ STXVPX          011111 ..... ..... ..... 0111001101 -   @X_TSXP
 XXSPLTIB        111100 ..... 00 ........ 0101101000 .   @X_imm8
 XXSPLTW         111100 ..... ---.. ..... 010100100 . .  @XX2
 
+XXSEL           111100 ..... ..... ..... ..... 11 ....  @XX4
+
 ## VSX Vector Load Special Value Instruction
 
 LXVKQ           111100 ..... 11111 ..... 0101101000 .   @X_uim5
diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 39e610913d..9e4f531fb9 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -44,15 +44,15 @@
                 ...... ..... ....  . ................ \
                 &8RR_D si=%8rr_si xt=%8rr_xt
 
-# Format XX4
-&XX4            xt xa xb xc
-%xx4_xt         0:1 21:5
-%xx4_xa         2:1 16:5
-%xx4_xb         1:1 11:5
-%xx4_xc         3:1  6:5
-@XX4            ........ ........ ........ ........ \
+# Format 8RR:XX4
+%8rr_xx_xt      0:1 21:5
+%8rr_xx_xa      2:1 16:5
+%8rr_xx_xb      1:1 11:5
+%8rr_xx_xc      3:1  6:5
+&8RR_XX4        xt xa xb xc
+@8RR_XX4        ........ ........ ........ ........ \
                 ...... ..... ..... ..... ..... .. .... \
-                &XX4 xt=%xx4_xt xa=%xx4_xa xb=%xx4_xb xc=%xx4_xc
+                &8RR_XX4 xt=%8rr_xx_xt xa=%8rr_xx_xa xb=%8rr_xx_xb xc=%8rr_xx_xc
 
 ### Fixed-Point Load Instructions
 
@@ -187,10 +187,10 @@ XXSPLTI32DX     000001 01 0000 -- -- ................ \
                 100000 ..... 000 .. ................    @8RR_D_IX
 
 XXBLENDVD       000001 01 0000 -- ------------------ \
-                100001 ..... ..... ..... ..... 11 ....  @XX4
+                100001 ..... ..... ..... ..... 11 ....  @8RR_XX4
 XXBLENDVW       000001 01 0000 -- ------------------ \
-                100001 ..... ..... ..... ..... 10 ....  @XX4
+                100001 ..... ..... ..... ..... 10 ....  @8RR_XX4
 XXBLENDVH       000001 01 0000 -- ------------------ \
-                100001 ..... ..... ..... ..... 01 ....  @XX4
+                100001 ..... ..... ..... ..... 01 ....  @8RR_XX4
 XXBLENDVB       000001 01 0000 -- ------------------ \
-                100001 ..... ..... ..... ..... 00 ....  @XX4
+                100001 ..... ..... ..... ..... 00 ....  @8RR_XX4
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index b89be57272..83e3285e19 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1420,19 +1420,15 @@ static void glue(gen_, name)(DisasContext *ctx)             \
 VSX_XXMRG(xxmrghw, 1)
 VSX_XXMRG(xxmrglw, 0)
 
-static void gen_xxsel(DisasContext *ctx)
+static bool trans_XXSEL(DisasContext *ctx, arg_XX4 *a)
 {
-    int rt = xT(ctx->opcode);
-    int ra = xA(ctx->opcode);
-    int rb = xB(ctx->opcode);
-    int rc = xC(ctx->opcode);
+    REQUIRE_INSNS_FLAGS2(ctx, VSX);
+    REQUIRE_VSX(ctx);
 
-    if (unlikely(!ctx->vsx_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_VSXU);
-        return;
-    }
-    tcg_gen_gvec_bitsel(MO_64, vsr_full_offset(rt), vsr_full_offset(rc),
-                        vsr_full_offset(rb), vsr_full_offset(ra), 16, 16);
+    tcg_gen_gvec_bitsel(MO_64, vsr_full_offset(a->xt), vsr_full_offset(a->xc),
+                        vsr_full_offset(a->xb), vsr_full_offset(a->xa), 16, 16);
+
+    return true;
 }
 
 static bool trans_XXSPLTW(DisasContext *ctx, arg_XX2 *a)
@@ -2125,7 +2121,7 @@ static void gen_xxblendv_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
     tcg_temp_free_vec(tmp);
 }
 
-static bool do_xxblendv(DisasContext *ctx, arg_XX4 *a, unsigned vece)
+static bool do_xxblendv(DisasContext *ctx, arg_8RR_XX4 *a, unsigned vece)
 {
     static const TCGOpcode vecop_list[] = {
         INDEX_op_sari_vec, 0
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index c974324c4c..b0dbb38c80 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -347,47 +347,4 @@ GEN_XX3FORM_DM(xxsldwi, 0x08, 0x00),
 GEN_XX2FORM_EXT(xxextractuw, 0x0A, 0x0A, PPC2_ISA300),
 GEN_XX2FORM_EXT(xxinsertw, 0x0A, 0x0B, PPC2_ISA300),
 
-#define GEN_XXSEL_ROW(opc3) \
-GEN_HANDLER2_E(xxsel, "xxsel", 0x3C, 0x18, opc3, 0, PPC_NONE, PPC2_VSX), \
-GEN_HANDLER2_E(xxsel, "xxsel", 0x3C, 0x19, opc3, 0, PPC_NONE, PPC2_VSX), \
-GEN_HANDLER2_E(xxsel, "xxsel", 0x3C, 0x1A, opc3, 0, PPC_NONE, PPC2_VSX), \
-GEN_HANDLER2_E(xxsel, "xxsel", 0x3C, 0x1B, opc3, 0, PPC_NONE, PPC2_VSX), \
-GEN_HANDLER2_E(xxsel, "xxsel", 0x3C, 0x1C, opc3, 0, PPC_NONE, PPC2_VSX), \
-GEN_HANDLER2_E(xxsel, "xxsel", 0x3C, 0x1D, opc3, 0, PPC_NONE, PPC2_VSX), \
-GEN_HANDLER2_E(xxsel, "xxsel", 0x3C, 0x1E, opc3, 0, PPC_NONE, PPC2_VSX), \
-GEN_HANDLER2_E(xxsel, "xxsel", 0x3C, 0x1F, opc3, 0, PPC_NONE, PPC2_VSX), \
-
-GEN_XXSEL_ROW(0x00)
-GEN_XXSEL_ROW(0x01)
-GEN_XXSEL_ROW(0x02)
-GEN_XXSEL_ROW(0x03)
-GEN_XXSEL_ROW(0x04)
-GEN_XXSEL_ROW(0x05)
-GEN_XXSEL_ROW(0x06)
-GEN_XXSEL_ROW(0x07)
-GEN_XXSEL_ROW(0x08)
-GEN_XXSEL_ROW(0x09)
-GEN_XXSEL_ROW(0x0A)
-GEN_XXSEL_ROW(0x0B)
-GEN_XXSEL_ROW(0x0C)
-GEN_XXSEL_ROW(0x0D)
-GEN_XXSEL_ROW(0x0E)
-GEN_XXSEL_ROW(0x0F)
-GEN_XXSEL_ROW(0x10)
-GEN_XXSEL_ROW(0x11)
-GEN_XXSEL_ROW(0x12)
-GEN_XXSEL_ROW(0x13)
-GEN_XXSEL_ROW(0x14)
-GEN_XXSEL_ROW(0x15)
-GEN_XXSEL_ROW(0x16)
-GEN_XXSEL_ROW(0x17)
-GEN_XXSEL_ROW(0x18)
-GEN_XXSEL_ROW(0x19)
-GEN_XXSEL_ROW(0x1A)
-GEN_XXSEL_ROW(0x1B)
-GEN_XXSEL_ROW(0x1C)
-GEN_XXSEL_ROW(0x1D)
-GEN_XXSEL_ROW(0x1E)
-GEN_XXSEL_ROW(0x1F)
-
 GEN_XX3FORM_DM(xxpermdi, 0x08, 0x01),
-- 
2.25.1


