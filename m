Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096874BFC5A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:21:59 +0100 (CET)
Received: from localhost ([::1]:46582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMWzG-0005mN-2a
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:21:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWLc-0007PH-WF; Tue, 22 Feb 2022 09:41:02 -0500
Received: from [187.72.171.209] (port=46527 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWLb-0005jB-16; Tue, 22 Feb 2022 09:41:00 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 22 Feb 2022 11:37:43 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id A20A880047A;
 Tue, 22 Feb 2022 11:37:42 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 19/47] target/ppc: move vs[lr][a][bhwd] to decodetree
Date: Tue, 22 Feb 2022 11:36:17 -0300
Message-Id: <20220222143646.1268606-20-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Feb 2022 14:37:43.0055 (UTC)
 FILETIME=[C017B9F0:01D827F9]
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
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v4:
 -  New in v4.
---
 target/ppc/insn32.decode            | 17 ++++++++++++
 target/ppc/translate/vmx-impl.c.inc | 41 +++++++++++++++++++----------
 target/ppc/translate/vmx-ops.c.inc  | 13 +--------
 3 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 02df4a98e6..88baebe35e 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -467,6 +467,23 @@ VINSWVRX        000100 ..... ..... ..... 00110001111    @VX
 VSLDBI          000100 ..... ..... ..... 00 ... 010110  @VN
 VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
 
+## Vector Integer Shift Instruction
+
+VSLB            000100 ..... ..... ..... 00100000100    @VX
+VSLH            000100 ..... ..... ..... 00101000100    @VX
+VSLW            000100 ..... ..... ..... 00110000100    @VX
+VSLD            000100 ..... ..... ..... 10111000100    @VX
+
+VSRB            000100 ..... ..... ..... 01000000100    @VX
+VSRH            000100 ..... ..... ..... 01001000100    @VX
+VSRW            000100 ..... ..... ..... 01010000100    @VX
+VSRD            000100 ..... ..... ..... 11011000100    @VX
+
+VSRAB           000100 ..... ..... ..... 01100000100    @VX
+VSRAH           000100 ..... ..... ..... 01101000100    @VX
+VSRAW           000100 ..... ..... ..... 01110000100    @VX
+VSRAD           000100 ..... ..... ..... 01111000100    @VX
+
 ## Vector Integer Arithmetic Instructions
 
 VEXTSB2W        000100 ..... 10000 ..... 11000000010    @VX_tb
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 19219b0010..ec4f0e7654 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -799,21 +799,7 @@ static void trans_vclzd(DisasContext *ctx)
 }
 
 GEN_VXFORM_V(vmuluwm, MO_32, tcg_gen_gvec_mul, 4, 2);
-GEN_VXFORM_V(vslb, MO_8, tcg_gen_gvec_shlv, 2, 4);
-GEN_VXFORM_V(vslh, MO_16, tcg_gen_gvec_shlv, 2, 5);
-GEN_VXFORM_V(vslw, MO_32, tcg_gen_gvec_shlv, 2, 6);
 GEN_VXFORM(vrlwnm, 2, 6);
-GEN_VXFORM_DUAL(vslw, PPC_ALTIVEC, PPC_NONE, \
-                vrlwnm, PPC_NONE, PPC2_ISA300)
-GEN_VXFORM_V(vsld, MO_64, tcg_gen_gvec_shlv, 2, 23);
-GEN_VXFORM_V(vsrb, MO_8, tcg_gen_gvec_shrv, 2, 8);
-GEN_VXFORM_V(vsrh, MO_16, tcg_gen_gvec_shrv, 2, 9);
-GEN_VXFORM_V(vsrw, MO_32, tcg_gen_gvec_shrv, 2, 10);
-GEN_VXFORM_V(vsrd, MO_64, tcg_gen_gvec_shrv, 2, 27);
-GEN_VXFORM_V(vsrab, MO_8, tcg_gen_gvec_sarv, 2, 12);
-GEN_VXFORM_V(vsrah, MO_16, tcg_gen_gvec_sarv, 2, 13);
-GEN_VXFORM_V(vsraw, MO_32, tcg_gen_gvec_sarv, 2, 14);
-GEN_VXFORM_V(vsrad, MO_64, tcg_gen_gvec_sarv, 2, 15);
 GEN_VXFORM(vsrv, 2, 28);
 GEN_VXFORM(vslv, 2, 29);
 GEN_VXFORM(vslo, 6, 16);
@@ -821,6 +807,33 @@ GEN_VXFORM(vsro, 6, 17);
 GEN_VXFORM(vaddcuw, 0, 6);
 GEN_VXFORM(vsubcuw, 0, 22);
 
+static bool do_vector_gvec3_VX(DisasContext *ctx, arg_VX *a, int vece,
+                               void (*gen_gvec)(unsigned, uint32_t, uint32_t,
+                                                uint32_t, uint32_t, uint32_t))
+{
+    REQUIRE_VECTOR(ctx);
+
+    gen_gvec(vece, avr_full_offset(a->vrt), avr_full_offset(a->vra),
+             avr_full_offset(a->vrb), 16, 16);
+
+    return true;
+}
+
+TRANS_FLAGS(ALTIVEC, VSLB, do_vector_gvec3_VX, MO_8, tcg_gen_gvec_shlv);
+TRANS_FLAGS(ALTIVEC, VSLH, do_vector_gvec3_VX, MO_16, tcg_gen_gvec_shlv);
+TRANS_FLAGS(ALTIVEC, VSLW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_shlv);
+TRANS_FLAGS2(ALTIVEC_207, VSLD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec_shlv);
+
+TRANS_FLAGS(ALTIVEC, VSRB, do_vector_gvec3_VX, MO_8, tcg_gen_gvec_shrv);
+TRANS_FLAGS(ALTIVEC, VSRH, do_vector_gvec3_VX, MO_16, tcg_gen_gvec_shrv);
+TRANS_FLAGS(ALTIVEC, VSRW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_shrv);
+TRANS_FLAGS2(ALTIVEC_207, VSRD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec_shrv);
+
+TRANS_FLAGS(ALTIVEC, VSRAB, do_vector_gvec3_VX, MO_8, tcg_gen_gvec_sarv);
+TRANS_FLAGS(ALTIVEC, VSRAH, do_vector_gvec3_VX, MO_16, tcg_gen_gvec_sarv);
+TRANS_FLAGS(ALTIVEC, VSRAW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_sarv);
+TRANS_FLAGS2(ALTIVEC_207, VSRAD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec_sarv);
+
 #define GEN_VXFORM_SAT(NAME, VECE, NORM, SAT, OPC2, OPC3)               \
 static void glue(glue(gen_, NAME), _vec)(unsigned vece, TCGv_vec t,     \
                                          TCGv_vec sat, TCGv_vec a,      \
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index cb4c5bb953..878bce92c6 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -102,18 +102,7 @@ GEN_VXFORM_300(vextubrx, 6, 28),
 GEN_VXFORM_300(vextuhrx, 6, 29),
 GEN_VXFORM_DUAL(vmrgew, vextuwrx, 6, 30, PPC_NONE, PPC2_ALTIVEC_207),
 GEN_VXFORM_207(vmuluwm, 4, 2),
-GEN_VXFORM(vslb, 2, 4),
-GEN_VXFORM(vslh, 2, 5),
-GEN_VXFORM_DUAL(vslw, vrlwnm, 2, 6, PPC_ALTIVEC, PPC_NONE),
-GEN_VXFORM_207(vsld, 2, 23),
-GEN_VXFORM(vsrb, 2, 8),
-GEN_VXFORM(vsrh, 2, 9),
-GEN_VXFORM(vsrw, 2, 10),
-GEN_VXFORM_207(vsrd, 2, 27),
-GEN_VXFORM(vsrab, 2, 12),
-GEN_VXFORM(vsrah, 2, 13),
-GEN_VXFORM(vsraw, 2, 14),
-GEN_VXFORM_207(vsrad, 2, 15),
+GEN_VXFORM_300(vrlwnm, 2, 6),
 GEN_VXFORM_300(vsrv, 2, 28),
 GEN_VXFORM_300(vslv, 2, 29),
 GEN_VXFORM(vslo, 6, 16),
-- 
2.25.1


