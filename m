Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18864BFBBF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:02:29 +0100 (CET)
Received: from localhost ([::1]:46628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMWgO-0002n2-Oa
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:02:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWJj-0004kl-3f; Tue, 22 Feb 2022 09:39:03 -0500
Received: from [187.72.171.209] (port=3932 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWJh-00057A-GR; Tue, 22 Feb 2022 09:39:02 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 22 Feb 2022 11:37:39 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 0F91380047A;
 Tue, 22 Feb 2022 11:37:39 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 07/47] target/ppc: Move vexts[bhw]2[wd] to decodetree
Date: Tue, 22 Feb 2022 11:36:05 -0300
Message-Id: <20220222143646.1268606-8-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Feb 2022 14:37:39.0470 (UTC)
 FILETIME=[BDF4B2E0:01D827F9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 target/ppc/helper.h                 |  5 ---
 target/ppc/insn32.decode            |  8 ++++
 target/ppc/int_helper.c             | 15 --------
 target/ppc/translate/vmx-impl.c.inc | 60 ++++++++++++++++++++++++++---
 target/ppc/translate/vmx-ops.c.inc  |  5 ---
 5 files changed, 63 insertions(+), 30 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index d0c5a3fef1..6ac72868bb 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -244,11 +244,6 @@ DEF_HELPER_4(VINSBLX, void, env, avr, i64, tl)
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
index 732a2bb79e..1dcf9c61e9 100644
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
index 64c87d9418..ade2b28795 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1646,21 +1646,6 @@ XXBLEND(W, 32)
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
index afe895ab7f..522f8ac142 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1772,11 +1772,61 @@ GEN_VXFORM_TRANS(vclzw, 1, 30)
 GEN_VXFORM_TRANS(vclzd, 1, 31)
 GEN_VXFORM_NOA_2(vnegw, 1, 24, 6)
 GEN_VXFORM_NOA_2(vnegd, 1, 24, 7)
-GEN_VXFORM_NOA_2(vextsb2w, 1, 24, 16)
-GEN_VXFORM_NOA_2(vextsh2w, 1, 24, 17)
-GEN_VXFORM_NOA_2(vextsb2d, 1, 24, 24)
-GEN_VXFORM_NOA_2(vextsh2d, 1, 24, 25)
-GEN_VXFORM_NOA_2(vextsw2d, 1, 24, 26)
+
+static void gen_vexts_i64(TCGv_i64 t, TCGv_i64 b, int64_t s)
+{
+    tcg_gen_shli_i64(t, b, s);
+    tcg_gen_sari_i64(t, t, s);
+}
+
+static void gen_vexts_i32(TCGv_i32 t, TCGv_i32 b, int32_t s)
+{
+    tcg_gen_shli_i32(t, b, s);
+    tcg_gen_sari_i32(t, t, s);
+}
+
+static void gen_vexts_vec(unsigned vece, TCGv_vec t, TCGv_vec b, int64_t s)
+{
+    tcg_gen_shli_vec(vece, t, b, s);
+    tcg_gen_sari_vec(vece, t, t, s);
+}
+
+static bool do_vexts(DisasContext *ctx, arg_VX_tb *a, unsigned vece, int64_t s)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shli_vec, INDEX_op_sari_vec, 0
+    };
+
+    static const GVecGen2i op[2] = {
+        {
+            .fni4 = gen_vexts_i32,
+            .fniv = gen_vexts_vec,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = gen_vexts_i64,
+            .fniv = gen_vexts_vec,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_2i(avr_full_offset(a->vrt), avr_full_offset(a->vrb),
+                    16, 16, s, &op[vece - MO_32]);
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


