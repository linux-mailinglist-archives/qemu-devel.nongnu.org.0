Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3444F49B4C6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 14:18:54 +0100 (CET)
Received: from localhost ([::1]:38508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCLim-0004WW-NK
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 08:18:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCL7U-0000oe-Li; Tue, 25 Jan 2022 07:40:27 -0500
Received: from [187.72.171.209] (port=33425 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCL7S-0006vk-EU; Tue, 25 Jan 2022 07:40:20 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:36 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 4C57E80001E;
 Tue, 25 Jan 2022 09:20:36 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 07/38] target/ppc: Move vexts[bhw]2[wd] to decodetree
Date: Tue, 25 Jan 2022 09:19:12 -0300
Message-Id: <20220125121943.3269077-8-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:36.0710 (UTC)
 FILETIME=[F53E1860:01D811E5]
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
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>

Move the following instructions to decodetree:
vextsb2w: Vector Extend Sign Byte To Word
vextsh2w: Vector Extend Sign Halfword To Word
vextsb2d: Vector Extend Sign Byte To Doubleword
vextsh2d: Vector Extend Sign Halfword To Doubleword
vextsw2d: Vector Extend Sign Word To Doubleword

Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                 |  5 -----
 target/ppc/insn32.decode            |  8 ++++++++
 target/ppc/int_helper.c             | 15 ---------------
 target/ppc/translate/vmx-impl.c.inc | 25 ++++++++++++++++++++-----
 target/ppc/translate/vmx-ops.c.inc  |  5 -----
 5 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 96c113fe1c..97c4c827d3 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -249,11 +249,6 @@ DEF_HELPER_4(VINSBLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSHLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSWLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSDLX, void, env, avr, i64, tl)
-DEF_HELPER_2(vextsb2w, void, avr, avr)
-DEF_HELPER_2(vextsh2w, void, avr, avr)
-DEF_HELPER_2(vextsb2d, void, avr, avr)
-DEF_HELPER_2(vextsh2d, void, avr, avr)
-DEF_HELPER_2(vextsw2d, void, avr, avr)
 DEF_HELPER_2(vnegw, void, avr, avr)
 DEF_HELPER_2(vnegd, void, avr, avr)
 DEF_HELPER_2(vupkhpx, void, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index c4796260b6..757791f0ac 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -419,6 +419,14 @@ VINSWVRX        000100 ..... ..... ..... 00110001111    @VX
 VSLDBI          000100 ..... ..... ..... 00 ... 010110  @VN
 VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
 
+## Vector Integer Arithmetic Instructions
+
+VEXTSB2W        000100 ..... 10000 ..... 11000000010    @VX_tb
+VEXTSH2W        000100 ..... 10001 ..... 11000000010    @VX_tb
+VEXTSB2D        000100 ..... 11000 ..... 11000000010    @VX_tb
+VEXTSH2D        000100 ..... 11001 ..... 11000000010    @VX_tb
+VEXTSW2D        000100 ..... 11010 ..... 11000000010    @VX_tb
+
 ## Vector Mask Manipulation Instructions
 
 MTVSRBM         000100 ..... 10000 ..... 11001000010    @VX_tb
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 79cde68f19..630fbc579a 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1768,21 +1768,6 @@ XXBLEND(W, 32)
 XXBLEND(D, 64)
 #undef XXBLEND
 
-#define VEXT_SIGNED(name, element, cast)                            \
-void helper_##name(ppc_avr_t *r, ppc_avr_t *b)                      \
-{                                                                   \
-    int i;                                                          \
-    for (i = 0; i < ARRAY_SIZE(r->element); i++) {                  \
-        r->element[i] = (cast)b->element[i];                        \
-    }                                                               \
-}
-VEXT_SIGNED(vextsb2w, s32, int8_t)
-VEXT_SIGNED(vextsb2d, s64, int8_t)
-VEXT_SIGNED(vextsh2w, s32, int16_t)
-VEXT_SIGNED(vextsh2d, s64, int16_t)
-VEXT_SIGNED(vextsw2d, s64, int32_t)
-#undef VEXT_SIGNED
-
 #define VNEG(name, element)                                         \
 void helper_##name(ppc_avr_t *r, ppc_avr_t *b)                      \
 {                                                                   \
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index b7559cf94c..ec782c47ff 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1772,11 +1772,26 @@ GEN_VXFORM_TRANS(vclzw, 1, 30)
 GEN_VXFORM_TRANS(vclzd, 1, 31)
 GEN_VXFORM_NOA_2(vnegw, 1, 24, 6)
 GEN_VXFORM_NOA_2(vnegd, 1, 24, 7)
-GEN_VXFORM_NOA_2(vextsb2w, 1, 24, 16)
-GEN_VXFORM_NOA_2(vextsh2w, 1, 24, 17)
-GEN_VXFORM_NOA_2(vextsb2d, 1, 24, 24)
-GEN_VXFORM_NOA_2(vextsh2d, 1, 24, 25)
-GEN_VXFORM_NOA_2(vextsw2d, 1, 24, 26)
+
+static bool do_vexts(DisasContext *ctx, arg_VX_tb *a, int vece, int s)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_shli(vece, avr_full_offset(a->vrt), avr_full_offset(a->vrb),
+                      s, 16, 16);
+    tcg_gen_gvec_sari(vece, avr_full_offset(a->vrt), avr_full_offset(a->vrt),
+                      s, 16, 16);
+
+    return true;
+}
+
+TRANS(VEXTSB2W, do_vexts, MO_32, 24);
+TRANS(VEXTSH2W, do_vexts, MO_32, 16);
+TRANS(VEXTSB2D, do_vexts, MO_64, 56);
+TRANS(VEXTSH2D, do_vexts, MO_64, 48);
+TRANS(VEXTSW2D, do_vexts, MO_64, 32);
+
 GEN_VXFORM_NOA_2(vctzb, 1, 24, 28)
 GEN_VXFORM_NOA_2(vctzh, 1, 24, 29)
 GEN_VXFORM_NOA_2(vctzw, 1, 24, 30)
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 914e68e5b0..6787327f56 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -216,11 +216,6 @@ GEN_VXFORM(vspltish, 6, 13),
 GEN_VXFORM(vspltisw, 6, 14),
 GEN_VXFORM_300_EO(vnegw, 0x01, 0x18, 0x06),
 GEN_VXFORM_300_EO(vnegd, 0x01, 0x18, 0x07),
-GEN_VXFORM_300_EO(vextsb2w, 0x01, 0x18, 0x10),
-GEN_VXFORM_300_EO(vextsh2w, 0x01, 0x18, 0x11),
-GEN_VXFORM_300_EO(vextsb2d, 0x01, 0x18, 0x18),
-GEN_VXFORM_300_EO(vextsh2d, 0x01, 0x18, 0x19),
-GEN_VXFORM_300_EO(vextsw2d, 0x01, 0x18, 0x1A),
 GEN_VXFORM_300_EO(vctzb, 0x01, 0x18, 0x1C),
 GEN_VXFORM_300_EO(vctzh, 0x01, 0x18, 0x1D),
 GEN_VXFORM_300_EO(vctzw, 0x01, 0x18, 0x1E),
-- 
2.25.1


