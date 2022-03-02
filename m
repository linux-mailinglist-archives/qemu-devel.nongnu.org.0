Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3424CA3EA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:37:38 +0100 (CET)
Received: from localhost ([::1]:46558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNIX-0007gc-Qw
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:37:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqu-0000mX-QR; Wed, 02 Mar 2022 06:09:05 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48564
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqp-0001mp-Ce; Wed, 02 Mar 2022 06:09:01 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228mgEF014279; 
 Wed, 2 Mar 2022 11:08:32 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej5d9jkdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:32 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2gZ5011735;
 Wed, 2 Mar 2022 11:08:30 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjpg58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:30 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8S6A51446132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:28 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F8EBA4069;
 Wed,  2 Mar 2022 11:08:28 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32ED5A407C;
 Wed,  2 Mar 2022 11:08:28 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:28 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6DF3E2201C1;
 Wed,  2 Mar 2022 12:08:27 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 30/87] target/ppc: move vrl[bhwd]nm/vrl[bhwd]mi to decodetree
Date: Wed,  2 Mar 2022 12:07:06 +0100
Message-Id: <20220302110803.849505-31-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XrYPEqAuMcLiuZp4Vn-x766CF6bDgqvm
X-Proofpoint-ORIG-GUID: XrYPEqAuMcLiuZp4Vn-x766CF6bDgqvm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 impostorscore=0 clxscore=1034 spamscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225210936.1749575-25-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 |   8 +-
 target/ppc/insn32.decode            |   6 ++
 target/ppc/int_helper.c             |  54 +++++-----
 target/ppc/translate/vmx-impl.c.inc | 152 ++++++++++++++++++++++++++--
 target/ppc/translate/vmx-ops.c.inc  |   5 +-
 5 files changed, 184 insertions(+), 41 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 2c6146d55eb0..4fa81093ca3b 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -273,10 +273,10 @@ DEF_HELPER_4(vmaxfp, void, env, avr, avr, avr)
 DEF_HELPER_4(vminfp, void, env, avr, avr, avr)
 DEF_HELPER_3(vrefp, void, env, avr, avr)
 DEF_HELPER_3(vrsqrtefp, void, env, avr, avr)
-DEF_HELPER_3(vrlwmi, void, avr, avr, avr)
-DEF_HELPER_3(vrldmi, void, avr, avr, avr)
-DEF_HELPER_3(vrldnm, void, avr, avr, avr)
-DEF_HELPER_3(vrlwnm, void, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VRLWMI, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(VRLDMI, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(VRLDNM, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(VRLWNM, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
 DEF_HELPER_5(vmaddfp, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vnmsubfp, void, env, avr, avr, avr, avr)
 DEF_HELPER_3(vexptefp, void, env, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index d918e2d0f29f..e788dc51523d 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -492,6 +492,12 @@ VRLH            000100 ..... ..... ..... 00001000100=
    @VX
 VRLW            000100 ..... ..... ..... 00010000100    @VX
 VRLD            000100 ..... ..... ..... 00011000100    @VX
=20
+VRLWMI          000100 ..... ..... ..... 00010000101    @VX
+VRLDMI          000100 ..... ..... ..... 00011000101    @VX
+
+VRLWNM          000100 ..... ..... ..... 00110000101    @VX
+VRLDNM          000100 ..... ..... ..... 00111000101    @VX
+
 ## Vector Integer Arithmetic Instructions
=20
 VEXTSB2W        000100 ..... 10000 ..... 11000000010    @VX_tb
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 71b31fbd891d..f52242ca812e 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1275,33 +1275,33 @@ void helper_vrsqrtefp(CPUPPCState *env, ppc_avr_t=
 *r, ppc_avr_t *b)
     }
 }
=20
-#define VRLMI(name, size, element, insert)                            \
-void helper_##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)          \
-{                                                                     \
-    int i;                                                            \
-    for (i =3D 0; i < ARRAY_SIZE(r->element); i++) {                    =
\
-        uint##size##_t src1 =3D a->element[i];                          =
\
-        uint##size##_t src2 =3D b->element[i];                          =
\
-        uint##size##_t src3 =3D r->element[i];                          =
\
-        uint##size##_t begin, end, shift, mask, rot_val;              \
-                                                                      \
-        shift =3D extract##size(src2, 0, 6);                            =
\
-        end   =3D extract##size(src2, 8, 6);                            =
\
-        begin =3D extract##size(src2, 16, 6);                           =
\
-        rot_val =3D rol##size(src1, shift);                             =
\
-        mask =3D mask_u##size(begin, end);                              =
\
-        if (insert) {                                                 \
-            r->element[i] =3D (rot_val & mask) | (src3 & ~mask);        =
\
-        } else {                                                      \
-            r->element[i] =3D (rot_val & mask);                         =
\
-        }                                                             \
-    }                                                                 \
-}
-
-VRLMI(vrldmi, 64, u64, 1);
-VRLMI(vrlwmi, 32, u32, 1);
-VRLMI(vrldnm, 64, u64, 0);
-VRLMI(vrlwnm, 32, u32, 0);
+#define VRLMI(name, size, element, insert)                              =
    \
+void helper_##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, uint32_t de=
sc) \
+{                                                                       =
    \
+    int i;                                                              =
    \
+    for (i =3D 0; i < ARRAY_SIZE(r->element); i++) {                    =
      \
+        uint##size##_t src1 =3D a->element[i];                          =
      \
+        uint##size##_t src2 =3D b->element[i];                          =
      \
+        uint##size##_t src3 =3D r->element[i];                          =
      \
+        uint##size##_t begin, end, shift, mask, rot_val;                =
    \
+                                                                        =
    \
+        shift =3D extract##size(src2, 0, 6);                            =
      \
+        end   =3D extract##size(src2, 8, 6);                            =
      \
+        begin =3D extract##size(src2, 16, 6);                           =
      \
+        rot_val =3D rol##size(src1, shift);                             =
      \
+        mask =3D mask_u##size(begin, end);                              =
      \
+        if (insert) {                                                   =
    \
+            r->element[i] =3D (rot_val & mask) | (src3 & ~mask);        =
      \
+        } else {                                                        =
    \
+            r->element[i] =3D (rot_val & mask);                         =
      \
+        }                                                               =
    \
+    }                                                                   =
    \
+}
+
+VRLMI(VRLDMI, 64, u64, 1);
+VRLMI(VRLWMI, 32, u32, 1);
+VRLMI(VRLDNM, 64, u64, 0);
+VRLMI(VRLWNM, 32, u32, 0);
=20
 void helper_vsel(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t=
 *b,
                  ppc_avr_t *c)
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index f24b78d42efc..09d6c88e62a8 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -799,7 +799,6 @@ static void trans_vclzd(DisasContext *ctx)
 }
=20
 GEN_VXFORM_V(vmuluwm, MO_32, tcg_gen_gvec_mul, 4, 2);
-GEN_VXFORM(vrlwnm, 2, 6);
 GEN_VXFORM(vsrv, 2, 28);
 GEN_VXFORM(vslv, 2, 29);
 GEN_VXFORM(vslo, 6, 16);
@@ -839,6 +838,152 @@ TRANS_FLAGS(ALTIVEC, VRLH, do_vector_gvec3_VX, MO_1=
6, tcg_gen_gvec_rotlv)
 TRANS_FLAGS(ALTIVEC, VRLW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_rotlv=
)
 TRANS_FLAGS2(ALTIVEC_207, VRLD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec_=
rotlv)
=20
+static TCGv_vec do_vrl_mask_vec(unsigned vece, TCGv_vec vrb)
+{
+    TCGv_vec t0 =3D tcg_temp_new_vec_matching(vrb),
+             t1 =3D tcg_temp_new_vec_matching(vrb),
+             t2 =3D tcg_temp_new_vec_matching(vrb),
+             ones =3D tcg_constant_vec_matching(vrb, vece, -1);
+
+    /* Extract b and e */
+    tcg_gen_dupi_vec(vece, t2, (8 << vece) - 1);
+
+    tcg_gen_shri_vec(vece, t0, vrb, 16);
+    tcg_gen_and_vec(vece, t0, t0, t2);
+
+    tcg_gen_shri_vec(vece, t1, vrb, 8);
+    tcg_gen_and_vec(vece, t1, t1, t2);
+
+    /* Compare b and e to negate the mask where begin > end */
+    tcg_gen_cmp_vec(TCG_COND_GT, vece, t2, t0, t1);
+
+    /* Create the mask with (~0 >> b) ^ ((~0 >> e) >> 1) */
+    tcg_gen_shrv_vec(vece, t0, ones, t0);
+    tcg_gen_shrv_vec(vece, t1, ones, t1);
+    tcg_gen_shri_vec(vece, t1, t1, 1);
+    tcg_gen_xor_vec(vece, t0, t0, t1);
+
+    /* negate the mask */
+    tcg_gen_xor_vec(vece, t0, t0, t2);
+
+    tcg_temp_free_vec(t1);
+    tcg_temp_free_vec(t2);
+
+    return t0;
+}
+
+static void gen_vrlnm_vec(unsigned vece, TCGv_vec vrt, TCGv_vec vra,
+                          TCGv_vec vrb)
+{
+    TCGv_vec mask, n =3D tcg_temp_new_vec_matching(vrt);
+
+    /* Create the mask */
+    mask =3D do_vrl_mask_vec(vece, vrb);
+
+    /* Extract n */
+    tcg_gen_dupi_vec(vece, n, (8 << vece) - 1);
+    tcg_gen_and_vec(vece, n, vrb, n);
+
+    /* Rotate and mask */
+    tcg_gen_rotlv_vec(vece, vrt, vra, n);
+    tcg_gen_and_vec(vece, vrt, vrt, mask);
+
+    tcg_temp_free_vec(n);
+    tcg_temp_free_vec(mask);
+}
+
+static bool do_vrlnm(DisasContext *ctx, arg_VX *a, int vece)
+{
+    static const TCGOpcode vecop_list[] =3D {
+        INDEX_op_cmp_vec, INDEX_op_rotlv_vec, INDEX_op_sari_vec,
+        INDEX_op_shli_vec, INDEX_op_shri_vec, INDEX_op_shrv_vec, 0
+    };
+    static const GVecGen3 ops[2] =3D {
+        {
+            .fniv =3D gen_vrlnm_vec,
+            .fno =3D gen_helper_VRLWNM,
+            .opt_opc =3D vecop_list,
+            .load_dest =3D true,
+            .vece =3D MO_32
+        },
+        {
+            .fniv =3D gen_vrlnm_vec,
+            .fno =3D gen_helper_VRLDNM,
+            .opt_opc =3D vecop_list,
+            .load_dest =3D true,
+            .vece =3D MO_64
+        }
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VSX(ctx);
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), 16, 16, &ops[vece - 2]);
+
+    return true;
+}
+
+TRANS(VRLWNM, do_vrlnm, MO_32)
+TRANS(VRLDNM, do_vrlnm, MO_64)
+
+static void gen_vrlmi_vec(unsigned vece, TCGv_vec vrt, TCGv_vec vra,
+                          TCGv_vec vrb)
+{
+    TCGv_vec mask, n =3D tcg_temp_new_vec_matching(vrt),
+             tmp =3D tcg_temp_new_vec_matching(vrt);
+
+    /* Create the mask */
+    mask =3D do_vrl_mask_vec(vece, vrb);
+
+    /* Extract n */
+    tcg_gen_dupi_vec(vece, n, (8 << vece) - 1);
+    tcg_gen_and_vec(vece, n, vrb, n);
+
+    /* Rotate and insert */
+    tcg_gen_rotlv_vec(vece, tmp, vra, n);
+    tcg_gen_bitsel_vec(vece, vrt, mask, tmp, vrt);
+
+    tcg_temp_free_vec(n);
+    tcg_temp_free_vec(tmp);
+    tcg_temp_free_vec(mask);
+}
+
+static bool do_vrlmi(DisasContext *ctx, arg_VX *a, int vece)
+{
+    static const TCGOpcode vecop_list[] =3D {
+        INDEX_op_cmp_vec, INDEX_op_rotlv_vec, INDEX_op_sari_vec,
+        INDEX_op_shli_vec, INDEX_op_shri_vec, INDEX_op_shrv_vec, 0
+    };
+    static const GVecGen3 ops[2] =3D {
+        {
+            .fniv =3D gen_vrlmi_vec,
+            .fno =3D gen_helper_VRLWMI,
+            .opt_opc =3D vecop_list,
+            .load_dest =3D true,
+            .vece =3D MO_32
+        },
+        {
+            .fniv =3D gen_vrlnm_vec,
+            .fno =3D gen_helper_VRLDMI,
+            .opt_opc =3D vecop_list,
+            .load_dest =3D true,
+            .vece =3D MO_64
+        }
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VSX(ctx);
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), 16, 16, &ops[vece - 2]);
+
+    return true;
+}
+
+TRANS(VRLWMI, do_vrlmi, MO_32)
+TRANS(VRLDMI, do_vrlmi, MO_64)
+
 static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool righ=
t,
                                  bool alg)
 {
@@ -975,12 +1120,7 @@ GEN_VXFORM3(vsubeuqm, 31, 0);
 GEN_VXFORM3(vsubecuq, 31, 0);
 GEN_VXFORM_DUAL(vsubeuqm, PPC_NONE, PPC2_ALTIVEC_207, \
             vsubecuq, PPC_NONE, PPC2_ALTIVEC_207)
-GEN_VXFORM(vrlwmi, 2, 2);
-GEN_VXFORM(vrldmi, 2, 3);
 GEN_VXFORM_TRANS(vsl, 2, 7);
-GEN_VXFORM(vrldnm, 2, 7);
-GEN_VXFORM_DUAL(vsl, PPC_ALTIVEC, PPC_NONE, \
-                vrldnm, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_TRANS(vsr, 2, 11);
 GEN_VXFORM_ENV(vpkuhum, 7, 0);
 GEN_VXFORM_ENV(vpkuwum, 7, 1);
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vm=
x-ops.c.inc
index a7acea3ca78e..3a8a9cc564a2 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -102,7 +102,6 @@ GEN_VXFORM_300(vextubrx, 6, 28),
 GEN_VXFORM_300(vextuhrx, 6, 29),
 GEN_VXFORM_DUAL(vmrgew, vextuwrx, 6, 30, PPC_NONE, PPC2_ALTIVEC_207),
 GEN_VXFORM_207(vmuluwm, 4, 2),
-GEN_VXFORM_300(vrlwnm, 2, 6),
 GEN_VXFORM_300(vsrv, 2, 28),
 GEN_VXFORM_300(vslv, 2, 29),
 GEN_VXFORM(vslo, 6, 16),
@@ -133,9 +132,7 @@ GEN_VXFORM_DUAL(vaddeuqm, vaddecuq, 30, 0xFF, PPC_NON=
E, PPC2_ALTIVEC_207),
 GEN_VXFORM_DUAL(vsubuqm, bcdtrunc, 0, 20, PPC2_ALTIVEC_207, PPC2_ISA300)=
,
 GEN_VXFORM_DUAL(vsubcuq, bcdutrunc, 0, 21, PPC2_ALTIVEC_207, PPC2_ISA300=
),
 GEN_VXFORM_DUAL(vsubeuqm, vsubecuq, 31, 0xFF, PPC_NONE, PPC2_ALTIVEC_207=
),
-GEN_VXFORM_300(vrlwmi, 2, 2),
-GEN_VXFORM_300(vrldmi, 2, 3),
-GEN_VXFORM_DUAL(vsl, vrldnm, 2, 7, PPC_ALTIVEC, PPC_NONE),
+GEN_VXFORM(vsl, 2, 7),
 GEN_VXFORM(vsr, 2, 11),
 GEN_VXFORM(vpkuhum, 7, 0),
 GEN_VXFORM(vpkuwum, 7, 1),
--=20
2.34.1


