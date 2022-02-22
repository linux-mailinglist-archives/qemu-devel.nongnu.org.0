Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD684BFC8F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:28:33 +0100 (CET)
Received: from localhost ([::1]:57872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMX5c-0005lV-N3
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:28:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWLi-0007So-Lq; Tue, 22 Feb 2022 09:41:06 -0500
Received: from [187.72.171.209] (port=46527 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWLh-0005jB-3y; Tue, 22 Feb 2022 09:41:06 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 22 Feb 2022 11:37:44 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id D61B080047A;
 Tue, 22 Feb 2022 11:37:43 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 23/47] target/ppc: move vrl[bhwd] to decodetree
Date: Tue, 22 Feb 2022 11:36:21 -0300
Message-Id: <20220222143646.1268606-24-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Feb 2022 14:37:44.0228 (UTC)
 FILETIME=[C0CAB640:01D827F9]
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
 target/ppc/insn32.decode            |  5 +++++
 target/ppc/translate/vmx-impl.c.inc | 13 +++++--------
 target/ppc/translate/vmx-ops.c.inc  |  6 ++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 7a9fc1dffa..d918e2d0f2 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -487,6 +487,11 @@ VSRAW           000100 ..... ..... ..... 01110000100    @VX
 VSRAD           000100 ..... ..... ..... 01111000100    @VX
 VSRAQ           000100 ..... ..... ..... 01100000101    @VX
 
+VRLB            000100 ..... ..... ..... 00000000100    @VX
+VRLH            000100 ..... ..... ..... 00001000100    @VX
+VRLW            000100 ..... ..... ..... 00010000100    @VX
+VRLD            000100 ..... ..... ..... 00011000100    @VX
+
 ## Vector Integer Arithmetic Instructions
 
 VEXTSB2W        000100 ..... 10000 ..... 11000000010    @VX_tb
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 2eee187499..9dcac4243f 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -834,6 +834,11 @@ TRANS_FLAGS(ALTIVEC, VSRAH, do_vector_gvec3_VX, MO_16, tcg_gen_gvec_sarv);
 TRANS_FLAGS(ALTIVEC, VSRAW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_sarv);
 TRANS_FLAGS2(ALTIVEC_207, VSRAD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec_sarv);
 
+TRANS_FLAGS(ALTIVEC, VRLB, do_vector_gvec3_VX, MO_8, tcg_gen_gvec_rotlv)
+TRANS_FLAGS(ALTIVEC, VRLH, do_vector_gvec3_VX, MO_16, tcg_gen_gvec_rotlv)
+TRANS_FLAGS(ALTIVEC, VRLW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_rotlv)
+TRANS_FLAGS2(ALTIVEC_207, VRLD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec_rotlv)
+
 static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool right,
                                  bool alg)
 {
@@ -968,16 +973,8 @@ GEN_VXFORM3(vsubeuqm, 31, 0);
 GEN_VXFORM3(vsubecuq, 31, 0);
 GEN_VXFORM_DUAL(vsubeuqm, PPC_NONE, PPC2_ALTIVEC_207, \
             vsubecuq, PPC_NONE, PPC2_ALTIVEC_207)
-GEN_VXFORM_V(vrlb, MO_8, tcg_gen_gvec_rotlv, 2, 0);
-GEN_VXFORM_V(vrlh, MO_16, tcg_gen_gvec_rotlv, 2, 1);
-GEN_VXFORM_V(vrlw, MO_32, tcg_gen_gvec_rotlv, 2, 2);
 GEN_VXFORM(vrlwmi, 2, 2);
-GEN_VXFORM_DUAL(vrlw, PPC_ALTIVEC, PPC_NONE, \
-                vrlwmi, PPC_NONE, PPC2_ISA300)
-GEN_VXFORM_V(vrld, MO_64, tcg_gen_gvec_rotlv, 2, 3);
 GEN_VXFORM(vrldmi, 2, 3);
-GEN_VXFORM_DUAL(vrld, PPC_NONE, PPC2_ALTIVEC_207, \
-                vrldmi, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_TRANS(vsl, 2, 7);
 GEN_VXFORM(vrldnm, 2, 7);
 GEN_VXFORM_DUAL(vsl, PPC_ALTIVEC, PPC_NONE, \
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 878bce92c6..a7acea3ca7 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -133,10 +133,8 @@ GEN_VXFORM_DUAL(vaddeuqm, vaddecuq, 30, 0xFF, PPC_NONE, PPC2_ALTIVEC_207),
 GEN_VXFORM_DUAL(vsubuqm, bcdtrunc, 0, 20, PPC2_ALTIVEC_207, PPC2_ISA300),
 GEN_VXFORM_DUAL(vsubcuq, bcdutrunc, 0, 21, PPC2_ALTIVEC_207, PPC2_ISA300),
 GEN_VXFORM_DUAL(vsubeuqm, vsubecuq, 31, 0xFF, PPC_NONE, PPC2_ALTIVEC_207),
-GEN_VXFORM(vrlb, 2, 0),
-GEN_VXFORM(vrlh, 2, 1),
-GEN_VXFORM_DUAL(vrlw, vrlwmi, 2, 2, PPC_ALTIVEC, PPC_NONE),
-GEN_VXFORM_DUAL(vrld, vrldmi, 2, 3, PPC_NONE, PPC2_ALTIVEC_207),
+GEN_VXFORM_300(vrlwmi, 2, 2),
+GEN_VXFORM_300(vrldmi, 2, 3),
 GEN_VXFORM_DUAL(vsl, vrldnm, 2, 7, PPC_ALTIVEC, PPC_NONE),
 GEN_VXFORM(vsr, 2, 11),
 GEN_VXFORM(vpkuhum, 7, 0),
-- 
2.25.1


