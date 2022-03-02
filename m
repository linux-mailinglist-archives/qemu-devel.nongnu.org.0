Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3442E4CA3DB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:35:25 +0100 (CET)
Received: from localhost ([::1]:37654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNGO-0001eO-8S
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:35:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqq-0000lC-Qm; Wed, 02 Mar 2022 06:09:03 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqo-0001mg-Tz; Wed, 02 Mar 2022 06:09:00 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2229Ilvd025595; 
 Wed, 2 Mar 2022 11:08:24 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej5uc22a9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:24 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2gZh028057;
 Wed, 2 Mar 2022 11:08:21 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3efbu9d2vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:21 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8JTn51970486
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:19 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46CB942041;
 Wed,  2 Mar 2022 11:08:19 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 025D04203F;
 Wed,  2 Mar 2022 11:08:19 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:18 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 451242201C1;
 Wed,  2 Mar 2022 12:08:18 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 16/87] target/ppc: Move Vector Compare Not Equal or Zero to
 decodetree
Date: Wed,  2 Mar 2022 12:06:52 +0100
Message-Id: <20220302110803.849505-17-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: g1kWcx_N9DH5pc_ksLZ2gDmtcISef_5w
X-Proofpoint-GUID: g1kWcx_N9DH5pc_ksLZ2gDmtcISef_5w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=955 malwarescore=0 bulkscore=0
 spamscore=0 clxscore=1034 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-11-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 |  9 ++--
 target/ppc/insn32.decode            |  4 ++
 target/ppc/int_helper.c             | 50 +++++-----------------
 target/ppc/translate/vmx-impl.c.inc | 66 +++++++++++++++++++++++++++--
 target/ppc/translate/vmx-ops.c.inc  |  3 --
 5 files changed, 80 insertions(+), 52 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 9f56547d8c81..e5dd1c53f5ba 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -142,16 +142,13 @@ DEF_HELPER_3(vabsduw, void, avr, avr, avr)
 DEF_HELPER_3(vavgsb, void, avr, avr, avr)
 DEF_HELPER_3(vavgsh, void, avr, avr, avr)
 DEF_HELPER_3(vavgsw, void, avr, avr, avr)
-DEF_HELPER_4(vcmpnezb, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpnezh, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpnezw, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpeqfp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgefp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgtfp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpbfp, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpnezb_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpnezh_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpnezw_dot, void, env, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VCMPNEZB, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(VCMPNEZH, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(VCMPNEZW, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
 DEF_HELPER_4(vcmpeqfp_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgefp_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgtfp_dot, void, env, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 5443ee0394be..be9e05cc73b3 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -397,6 +397,10 @@ VCMPNEB         000100 ..... ..... ..... . 000000011=
1   @VC
 VCMPNEH         000100 ..... ..... ..... . 0001000111   @VC
 VCMPNEW         000100 ..... ..... ..... . 0010000111   @VC
=20
+VCMPNEZB        000100 ..... ..... ..... . 0100000111   @VC
+VCMPNEZH        000100 ..... ..... ..... . 0101000111   @VC
+VCMPNEZW        000100 ..... ..... ..... . 0110000111   @VC
+
 ## Vector Bit Manipulation Instruction
=20
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 734b817b68d2..f31dba946942 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -662,46 +662,18 @@ VCF(ux, uint32_to_float32, u32)
 VCF(sx, int32_to_float32, s32)
 #undef VCF
=20
-#define VCMPNE_DO(suffix, element, etype, cmpzero, record)              =
\
-void helper_vcmpne##suffix(CPUPPCState *env, ppc_avr_t *r,              =
\
-                            ppc_avr_t *a, ppc_avr_t *b)                 =
\
-{                                                                       =
\
-    etype ones =3D (etype)-1;                                           =
  \
-    etype all =3D ones;                                                 =
  \
-    etype result, none =3D 0;                                           =
  \
-    int i;                                                              =
\
-                                                                        =
\
-    for (i =3D 0; i < ARRAY_SIZE(r->element); i++) {                    =
  \
-        if (cmpzero) {                                                  =
\
-            result =3D ((a->element[i] =3D=3D 0)                        =
      \
-                           || (b->element[i] =3D=3D 0)                  =
    \
-                           || (a->element[i] !=3D b->element[i]) ?      =
  \
-                           ones : 0x0);                                 =
\
-        } else {                                                        =
\
-            result =3D (a->element[i] !=3D b->element[i]) ? ones : 0x0; =
    \
-        }                                                               =
\
-        r->element[i] =3D result;                                       =
  \
-        all &=3D result;                                                =
  \
-        none |=3D result;                                               =
  \
-    }                                                                   =
\
-    if (record) {                                                       =
\
-        env->crf[6] =3D ((all !=3D 0) << 3) | ((none =3D=3D 0) << 1);   =
        \
-    }                                                                   =
\
+#define VCMPNEZ(NAME, ELEM) \
+void helper_##NAME(ppc_vsr_t *t, ppc_vsr_t *a, ppc_vsr_t *b, uint32_t de=
sc) \
+{                                                                       =
    \
+    for (int i =3D 0; i < ARRAY_SIZE(t->ELEM); i++) {                   =
      \
+        t->ELEM[i] =3D ((a->ELEM[i] =3D=3D 0) || (b->ELEM[i] =3D=3D 0) |=
|             \
+                      (a->ELEM[i] !=3D b->ELEM[i])) ? -1 : 0;           =
      \
+    }                                                                   =
    \
 }
-
-/*
- * VCMPNEZ - Vector compare not equal to zero
- *   suffix  - instruction mnemonic suffix (b: byte, h: halfword, w: wor=
d)
- *   element - element type to access from vector
- */
-#define VCMPNE(suffix, element, etype, cmpzero)         \
-    VCMPNE_DO(suffix, element, etype, cmpzero, 0)       \
-    VCMPNE_DO(suffix##_dot, element, etype, cmpzero, 1)
-VCMPNE(zb, u8, uint8_t, 1)
-VCMPNE(zh, u16, uint16_t, 1)
-VCMPNE(zw, u32, uint32_t, 1)
-#undef VCMPNE_DO
-#undef VCMPNE
+VCMPNEZ(VCMPNEZB, u8)
+VCMPNEZ(VCMPNEZH, u16)
+VCMPNEZ(VCMPNEZW, u32)
+#undef VCMPNEZ
=20
 #define VCMPFP_DO(suffix, compare, order, record)                       =
\
     void helper_vcmp##suffix(CPUPPCState *env, ppc_avr_t *r,            =
\
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index 7593b93eabb8..0574bb8bab7b 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -985,10 +985,6 @@ static void glue(gen_, name0##_##name1)(DisasContext=
 *ctx)             \
     }                                                                  \
 }
=20
-GEN_VXRFORM(vcmpnezb, 3, 4)
-GEN_VXRFORM(vcmpnezh, 3, 5)
-GEN_VXRFORM(vcmpnezw, 3, 6)
-
 static void do_vcmp_rc(int vrt)
 {
     TCGv_i64 tmp, set, clr;
@@ -1049,6 +1045,68 @@ TRANS_FLAGS2(ISA300, VCMPNEB, do_vcmp, TCG_COND_NE=
, MO_8)
 TRANS_FLAGS2(ISA300, VCMPNEH, do_vcmp, TCG_COND_NE, MO_16)
 TRANS_FLAGS2(ISA300, VCMPNEW, do_vcmp, TCG_COND_NE, MO_32)
=20
+static void gen_vcmpnez_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_=
vec b)
+{
+    TCGv_vec t0, t1, zero;
+
+    t0 =3D tcg_temp_new_vec_matching(t);
+    t1 =3D tcg_temp_new_vec_matching(t);
+    zero =3D tcg_constant_vec_matching(t, vece, 0);
+
+    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t0, a, zero);
+    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t1, b, zero);
+    tcg_gen_cmp_vec(TCG_COND_NE, vece, t, a, b);
+
+    tcg_gen_or_vec(vece, t, t, t0);
+    tcg_gen_or_vec(vece, t, t, t1);
+
+    tcg_temp_free_vec(t0);
+    tcg_temp_free_vec(t1);
+}
+
+static bool do_vcmpnez(DisasContext *ctx, arg_VC *a, int vece)
+{
+    static const TCGOpcode vecop_list[] =3D {
+        INDEX_op_cmp_vec, 0
+    };
+    static const GVecGen3 ops[3] =3D {
+        {
+            .fniv =3D gen_vcmpnez_vec,
+            .fno =3D gen_helper_VCMPNEZB,
+            .opt_opc =3D vecop_list,
+            .vece =3D MO_8
+        },
+        {
+            .fniv =3D gen_vcmpnez_vec,
+            .fno =3D gen_helper_VCMPNEZH,
+            .opt_opc =3D vecop_list,
+            .vece =3D MO_16
+        },
+        {
+            .fniv =3D gen_vcmpnez_vec,
+            .fno =3D gen_helper_VCMPNEZW,
+            .opt_opc =3D vecop_list,
+            .vece =3D MO_32
+        }
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), 16, 16, &ops[vece]);
+
+    if (a->rc) {
+        do_vcmp_rc(a->vrt);
+    }
+
+    return true;
+}
+
+TRANS(VCMPNEZB, do_vcmpnez, MO_8)
+TRANS(VCMPNEZH, do_vcmpnez, MO_16)
+TRANS(VCMPNEZW, do_vcmpnez, MO_32)
+
 GEN_VXRFORM(vcmpeqfp, 3, 3)
 GEN_VXRFORM(vcmpgefp, 3, 7)
 GEN_VXRFORM(vcmpgtfp, 3, 11)
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vm=
x-ops.c.inc
index 80d460c34ee2..cb4c5bb953c1 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -184,9 +184,6 @@ GEN_HANDLER2_E(name, str, 0x4, opc2, opc3, 0x00000000=
, PPC_NONE, PPC2_ISA300),
     GEN_VXRFORM1_300(name, name, #name, opc2, opc3)                     =
    \
     GEN_VXRFORM1_300(name##_dot, name##_, #name ".", opc2, (opc3 | (0x1 =
<< 4)))
=20
-GEN_VXRFORM_300(vcmpnezb, 3, 4)
-GEN_VXRFORM_300(vcmpnezh, 3, 5)
-GEN_VXRFORM_300(vcmpnezw, 3, 6)
 GEN_VXRFORM(vcmpeqfp, 3, 3)
 GEN_VXRFORM(vcmpgefp, 3, 7)
 GEN_VXRFORM(vcmpgtfp, 3, 11)
--=20
2.34.1


