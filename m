Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFA44CA38D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:24:41 +0100 (CET)
Received: from localhost ([::1]:44548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPN60-0003Ae-Gy
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:24:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqP-0000Mj-Pi; Wed, 02 Mar 2022 06:08:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqN-0001jy-K0; Wed, 02 Mar 2022 06:08:33 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228qecJ009689; 
 Wed, 2 Mar 2022 11:08:21 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej425maju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:21 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2k1l009519;
 Wed, 2 Mar 2022 11:08:19 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3efbfj547q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:19 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 222B8Hat42991872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:17 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30F7B52076;
 Wed,  2 Mar 2022 11:08:17 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id DA8A352059;
 Wed,  2 Mar 2022 11:08:16 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 269E8220294;
 Wed,  2 Mar 2022 12:08:16 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 13/87] target/ppc: Move vexts[bhw]2[wd] to decodetree
Date: Wed,  2 Mar 2022 12:06:49 +0100
Message-Id: <20220302110803.849505-14-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sKhisSuq9hrDt2tOhfz34C7mv4s-Dd-9
X-Proofpoint-ORIG-GUID: sKhisSuq9hrDt2tOhfz34C7mv4s-Dd-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1034
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>

Move the following instructions to decodetree:
vextsb2w: Vector Extend Sign Byte To Word
vextsh2w: Vector Extend Sign Halfword To Word
vextsb2d: Vector Extend Sign Byte To Doubleword
vextsh2d: Vector Extend Sign Halfword To Doubleword
vextsw2d: Vector Extend Sign Word To Doubleword

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-8-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 |  5 ---
 target/ppc/insn32.decode            |  8 ++++
 target/ppc/int_helper.c             | 15 --------
 target/ppc/translate/vmx-impl.c.inc | 58 ++++++++++++++++++++++++++---
 target/ppc/translate/vmx-ops.c.inc  |  5 ---
 5 files changed, 61 insertions(+), 30 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 0fdf2e8a75a4..5e64c8371d6e 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -242,11 +242,6 @@ DEF_HELPER_4(VINSBLX, void, env, avr, i64, tl)
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
index 732a2bb79ed4..1dcf9c61e9c7 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -419,6 +419,14 @@ VINSWVRX        000100 ..... ..... ..... 00110001111=
    @VX
 VSLDBI          000100 ..... ..... ..... 00 ... 010110  @VN
 VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
=20
+## Vector Integer Arithmetic Instructions
+
+VEXTSB2W        000100 ..... 10000 ..... 11000000010    @VX_tb
+VEXTSH2W        000100 ..... 10001 ..... 11000000010    @VX_tb
+VEXTSB2D        000100 ..... 11000 ..... 11000000010    @VX_tb
+VEXTSH2D        000100 ..... 11001 ..... 11000000010    @VX_tb
+VEXTSW2D        000100 ..... 11010 ..... 11000000010    @VX_tb
+
 ## Vector Mask Manipulation Instructions
=20
 MTVSRBM         000100 ..... 10000 ..... 11001000010    @VX_tb
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 46ef3ffb3f62..a75a5482fcc6 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1630,21 +1630,6 @@ XXBLEND(W, 32)
 XXBLEND(D, 64)
 #undef XXBLEND
=20
-#define VEXT_SIGNED(name, element, cast)                            \
-void helper_##name(ppc_avr_t *r, ppc_avr_t *b)                      \
-{                                                                   \
-    int i;                                                          \
-    for (i =3D 0; i < ARRAY_SIZE(r->element); i++) {                  \
-        r->element[i] =3D (cast)b->element[i];                        \
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
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index fcff3418c5c8..aa021bdf542d 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1772,11 +1772,59 @@ GEN_VXFORM_TRANS(vclzw, 1, 30)
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
+    tcg_gen_sextract_i64(t, b, 0, 64 - s);
+}
+
+static void gen_vexts_i32(TCGv_i32 t, TCGv_i32 b, int32_t s)
+{
+    tcg_gen_sextract_i32(t, b, 0, 32 - s);
+}
+
+static void gen_vexts_vec(unsigned vece, TCGv_vec t, TCGv_vec b, int64_t=
 s)
+{
+    tcg_gen_shli_vec(vece, t, b, s);
+    tcg_gen_sari_vec(vece, t, t, s);
+}
+
+static bool do_vexts(DisasContext *ctx, arg_VX_tb *a, unsigned vece, int=
64_t s)
+{
+    static const TCGOpcode vecop_list[] =3D {
+        INDEX_op_shli_vec, INDEX_op_sari_vec, 0
+    };
+
+    static const GVecGen2i op[2] =3D {
+        {
+            .fni4 =3D gen_vexts_i32,
+            .fniv =3D gen_vexts_vec,
+            .opt_opc =3D vecop_list,
+            .vece =3D MO_32
+        },
+        {
+            .fni8 =3D gen_vexts_i64,
+            .fniv =3D gen_vexts_vec,
+            .opt_opc =3D vecop_list,
+            .vece =3D MO_64
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
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vm=
x-ops.c.inc
index 914e68e5b0be..6787327f56ad 100644
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
--=20
2.34.1


