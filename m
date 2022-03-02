Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E193A4CA3B2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:29:58 +0100 (CET)
Received: from localhost ([::1]:54692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNB7-0002An-Kh
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:29:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqS-0000VI-QL; Wed, 02 Mar 2022 06:08:40 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19120
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqP-0001kb-Ls; Wed, 02 Mar 2022 06:08:36 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222ANT2I020693; 
 Wed, 2 Mar 2022 11:08:23 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej6sr0tcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:23 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2dMu014271;
 Wed, 2 Mar 2022 11:08:21 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3efbu8w0g7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8Ih753870880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:18 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B91FA4070;
 Wed,  2 Mar 2022 11:08:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E84FA4069;
 Wed,  2 Mar 2022 11:08:18 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:18 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 93690220294;
 Wed,  2 Mar 2022 12:08:17 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 15/87] target/ppc: Move Vector Compare Equal/Not Equal/Greater
 Than to decodetree
Date: Wed,  2 Mar 2022 12:06:51 +0100
Message-Id: <20220302110803.849505-16-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: q6xTkMTYFjRYSph9E9833WqCwJGEpdcO
X-Proofpoint-GUID: q6xTkMTYFjRYSph9E9833WqCwJGEpdcO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1034 mlxscore=0
 mlxlogscore=745 classifier=spam adjust=0 reason=mlx scancount=1
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-10-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 | 30 ----------
 target/ppc/insn32.decode            | 24 ++++++++
 target/ppc/int_helper.c             | 54 -----------------
 target/ppc/translate/vmx-impl.c.inc | 89 ++++++++++++++++++++---------
 target/ppc/translate/vmx-ops.c.inc  | 15 +----
 5 files changed, 88 insertions(+), 124 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 5e64c8371d6e..9f56547d8c81 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -142,46 +142,16 @@ DEF_HELPER_3(vabsduw, void, avr, avr, avr)
 DEF_HELPER_3(vavgsb, void, avr, avr, avr)
 DEF_HELPER_3(vavgsh, void, avr, avr, avr)
 DEF_HELPER_3(vavgsw, void, avr, avr, avr)
-DEF_HELPER_4(vcmpequb, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpequh, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpequw, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpequd, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpneb, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpneh, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpnew, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpnezb, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpnezh, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpnezw, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtub, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtuh, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtuw, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtud, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtsb, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtsh, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtsw, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtsd, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpeqfp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgefp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgtfp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpbfp, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpequb_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpequh_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpequw_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpequd_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpneb_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpneh_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpnew_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpnezb_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpnezh_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpnezw_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtub_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtuh_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtuw_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtud_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtsb_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtsh_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtsw_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtsd_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpeqfp_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgefp_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgtfp_dot, void, env, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index cba680075b23..5443ee0394be 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -51,6 +51,9 @@
 &VA             vrt vra vrb rc
 @VA             ...... vrt:5 vra:5 vrb:5 rc:5 ......    &VA
=20
+&VC             vrt vra vrb rc:bool
+@VC             ...... vrt:5 vra:5 vrb:5 rc:1 ..........        &VC
+
 &VN             vrt vra vrb sh
 @VN             ...... vrt:5 vra:5 vrb:5 .. sh:3 ......         &VN
=20
@@ -373,6 +376,27 @@ DSCLIQ          111111 ..... ..... ...... 001000010 =
.   @Z22_tap_sh_rc
 DSCRI           111011 ..... ..... ...... 001100010 .   @Z22_ta_sh_rc
 DSCRIQ          111111 ..... ..... ...... 001100010 .   @Z22_tap_sh_rc
=20
+## Vector Integer Instructions
+
+VCMPEQUB        000100 ..... ..... ..... . 0000000110   @VC
+VCMPEQUH        000100 ..... ..... ..... . 0001000110   @VC
+VCMPEQUW        000100 ..... ..... ..... . 0010000110   @VC
+VCMPEQUD        000100 ..... ..... ..... . 0011000111   @VC
+
+VCMPGTSB        000100 ..... ..... ..... . 1100000110   @VC
+VCMPGTSH        000100 ..... ..... ..... . 1101000110   @VC
+VCMPGTSW        000100 ..... ..... ..... . 1110000110   @VC
+VCMPGTSD        000100 ..... ..... ..... . 1111000111   @VC
+
+VCMPGTUB        000100 ..... ..... ..... . 1000000110   @VC
+VCMPGTUH        000100 ..... ..... ..... . 1001000110   @VC
+VCMPGTUW        000100 ..... ..... ..... . 1010000110   @VC
+VCMPGTUD        000100 ..... ..... ..... . 1011000111   @VC
+
+VCMPNEB         000100 ..... ..... ..... . 0000000111   @VC
+VCMPNEH         000100 ..... ..... ..... . 0001000111   @VC
+VCMPNEW         000100 ..... ..... ..... . 0010000111   @VC
+
 ## Vector Bit Manipulation Instruction
=20
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index a75a5482fcc6..734b817b68d2 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -662,57 +662,6 @@ VCF(ux, uint32_to_float32, u32)
 VCF(sx, int32_to_float32, s32)
 #undef VCF
=20
-#define VCMP_DO(suffix, compare, element, record)                       =
\
-    void helper_vcmp##suffix(CPUPPCState *env, ppc_avr_t *r,            =
\
-                             ppc_avr_t *a, ppc_avr_t *b)                =
\
-    {                                                                   =
\
-        uint64_t ones =3D (uint64_t)-1;                                 =
  \
-        uint64_t all =3D ones;                                          =
  \
-        uint64_t none =3D 0;                                            =
  \
-        int i;                                                          =
\
-                                                                        =
\
-        for (i =3D 0; i < ARRAY_SIZE(r->element); i++) {                =
  \
-            uint64_t result =3D (a->element[i] compare b->element[i] ?  =
  \
-                               ones : 0x0);                             =
\
-            switch (sizeof(a->element[0])) {                            =
\
-            case 8:                                                     =
\
-                r->u64[i] =3D result;                                   =
  \
-                break;                                                  =
\
-            case 4:                                                     =
\
-                r->u32[i] =3D result;                                   =
  \
-                break;                                                  =
\
-            case 2:                                                     =
\
-                r->u16[i] =3D result;                                   =
  \
-                break;                                                  =
\
-            case 1:                                                     =
\
-                r->u8[i] =3D result;                                    =
  \
-                break;                                                  =
\
-            }                                                           =
\
-            all &=3D result;                                            =
  \
-            none |=3D result;                                           =
  \
-        }                                                               =
\
-        if (record) {                                                   =
\
-            env->crf[6] =3D ((all !=3D 0) << 3) | ((none =3D=3D 0) << 1)=
;       \
-        }                                                               =
\
-    }
-#define VCMP(suffix, compare, element)          \
-    VCMP_DO(suffix, compare, element, 0)        \
-    VCMP_DO(suffix##_dot, compare, element, 1)
-VCMP(equb, =3D=3D, u8)
-VCMP(equh, =3D=3D, u16)
-VCMP(equw, =3D=3D, u32)
-VCMP(equd, =3D=3D, u64)
-VCMP(gtub, >, u8)
-VCMP(gtuh, >, u16)
-VCMP(gtuw, >, u32)
-VCMP(gtud, >, u64)
-VCMP(gtsb, >, s8)
-VCMP(gtsh, >, s16)
-VCMP(gtsw, >, s32)
-VCMP(gtsd, >, s64)
-#undef VCMP_DO
-#undef VCMP
-
 #define VCMPNE_DO(suffix, element, etype, cmpzero, record)              =
\
 void helper_vcmpne##suffix(CPUPPCState *env, ppc_avr_t *r,              =
\
                             ppc_avr_t *a, ppc_avr_t *b)                 =
\
@@ -751,9 +700,6 @@ void helper_vcmpne##suffix(CPUPPCState *env, ppc_avr_=
t *r,              \
 VCMPNE(zb, u8, uint8_t, 1)
 VCMPNE(zh, u16, uint16_t, 1)
 VCMPNE(zw, u32, uint32_t, 1)
-VCMPNE(b, u8, uint8_t, 0)
-VCMPNE(h, u16, uint16_t, 0)
-VCMPNE(w, u32, uint32_t, 0)
 #undef VCMPNE_DO
 #undef VCMPNE
=20
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index afe56a19d591..7593b93eabb8 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -985,41 +985,74 @@ static void glue(gen_, name0##_##name1)(DisasContex=
t *ctx)             \
     }                                                                  \
 }
=20
-GEN_VXRFORM(vcmpequb, 3, 0)
-GEN_VXRFORM(vcmpequh, 3, 1)
-GEN_VXRFORM(vcmpequw, 3, 2)
-GEN_VXRFORM(vcmpequd, 3, 3)
 GEN_VXRFORM(vcmpnezb, 3, 4)
 GEN_VXRFORM(vcmpnezh, 3, 5)
 GEN_VXRFORM(vcmpnezw, 3, 6)
-GEN_VXRFORM(vcmpgtsb, 3, 12)
-GEN_VXRFORM(vcmpgtsh, 3, 13)
-GEN_VXRFORM(vcmpgtsw, 3, 14)
-GEN_VXRFORM(vcmpgtsd, 3, 15)
-GEN_VXRFORM(vcmpgtub, 3, 8)
-GEN_VXRFORM(vcmpgtuh, 3, 9)
-GEN_VXRFORM(vcmpgtuw, 3, 10)
-GEN_VXRFORM(vcmpgtud, 3, 11)
+
+static void do_vcmp_rc(int vrt)
+{
+    TCGv_i64 tmp, set, clr;
+
+    tmp =3D tcg_temp_new_i64();
+    set =3D tcg_temp_new_i64();
+    clr =3D tcg_temp_new_i64();
+
+    get_avr64(tmp, vrt, true);
+    tcg_gen_mov_i64(set, tmp);
+    get_avr64(tmp, vrt, false);
+    tcg_gen_or_i64(clr, set, tmp);
+    tcg_gen_and_i64(set, set, tmp);
+
+    tcg_gen_setcondi_i64(TCG_COND_EQ, clr, clr, 0);
+    tcg_gen_shli_i64(clr, clr, 1);
+
+    tcg_gen_setcondi_i64(TCG_COND_EQ, set, set, -1);
+    tcg_gen_shli_i64(set, set, 3);
+
+    tcg_gen_or_i64(tmp, set, clr);
+    tcg_gen_extrl_i64_i32(cpu_crf[6], tmp);
+
+    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(set);
+    tcg_temp_free_i64(clr);
+}
+
+static bool do_vcmp(DisasContext *ctx, arg_VC *a, TCGCond cond, int vece=
)
+{
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_cmp(cond, vece, avr_full_offset(a->vrt),
+                     avr_full_offset(a->vra), avr_full_offset(a->vrb), 1=
6, 16);
+
+    if (a->rc) {
+        do_vcmp_rc(a->vrt);
+    }
+
+    return true;
+}
+
+TRANS_FLAGS(ALTIVEC, VCMPEQUB, do_vcmp, TCG_COND_EQ, MO_8)
+TRANS_FLAGS(ALTIVEC, VCMPEQUH, do_vcmp, TCG_COND_EQ, MO_16)
+TRANS_FLAGS(ALTIVEC, VCMPEQUW, do_vcmp, TCG_COND_EQ, MO_32)
+TRANS_FLAGS2(ALTIVEC_207, VCMPEQUD, do_vcmp, TCG_COND_EQ, MO_64)
+
+TRANS_FLAGS(ALTIVEC, VCMPGTSB, do_vcmp, TCG_COND_GT, MO_8)
+TRANS_FLAGS(ALTIVEC, VCMPGTSH, do_vcmp, TCG_COND_GT, MO_16)
+TRANS_FLAGS(ALTIVEC, VCMPGTSW, do_vcmp, TCG_COND_GT, MO_32)
+TRANS_FLAGS2(ALTIVEC_207, VCMPGTSD, do_vcmp, TCG_COND_GT, MO_64)
+TRANS_FLAGS(ALTIVEC, VCMPGTUB, do_vcmp, TCG_COND_GTU, MO_8)
+TRANS_FLAGS(ALTIVEC, VCMPGTUH, do_vcmp, TCG_COND_GTU, MO_16)
+TRANS_FLAGS(ALTIVEC, VCMPGTUW, do_vcmp, TCG_COND_GTU, MO_32)
+TRANS_FLAGS2(ALTIVEC_207, VCMPGTUD, do_vcmp, TCG_COND_GTU, MO_64)
+
+TRANS_FLAGS2(ISA300, VCMPNEB, do_vcmp, TCG_COND_NE, MO_8)
+TRANS_FLAGS2(ISA300, VCMPNEH, do_vcmp, TCG_COND_NE, MO_16)
+TRANS_FLAGS2(ISA300, VCMPNEW, do_vcmp, TCG_COND_NE, MO_32)
+
 GEN_VXRFORM(vcmpeqfp, 3, 3)
 GEN_VXRFORM(vcmpgefp, 3, 7)
 GEN_VXRFORM(vcmpgtfp, 3, 11)
 GEN_VXRFORM(vcmpbfp, 3, 15)
-GEN_VXRFORM(vcmpneb, 3, 0)
-GEN_VXRFORM(vcmpneh, 3, 1)
-GEN_VXRFORM(vcmpnew, 3, 2)
-
-GEN_VXRFORM_DUAL(vcmpequb, PPC_ALTIVEC, PPC_NONE, \
-                 vcmpneb, PPC_NONE, PPC2_ISA300)
-GEN_VXRFORM_DUAL(vcmpequh, PPC_ALTIVEC, PPC_NONE, \
-                 vcmpneh, PPC_NONE, PPC2_ISA300)
-GEN_VXRFORM_DUAL(vcmpequw, PPC_ALTIVEC, PPC_NONE, \
-                 vcmpnew, PPC_NONE, PPC2_ISA300)
-GEN_VXRFORM_DUAL(vcmpeqfp, PPC_ALTIVEC, PPC_NONE, \
-                 vcmpequd, PPC_NONE, PPC2_ALTIVEC_207)
-GEN_VXRFORM_DUAL(vcmpbfp, PPC_ALTIVEC, PPC_NONE, \
-                 vcmpgtsd, PPC_NONE, PPC2_ALTIVEC_207)
-GEN_VXRFORM_DUAL(vcmpgtfp, PPC_ALTIVEC, PPC_NONE, \
-                 vcmpgtud, PPC_NONE, PPC2_ALTIVEC_207)
=20
 static void gen_vsplti(DisasContext *ctx, int vece)
 {
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vm=
x-ops.c.inc
index 6787327f56ad..80d460c34ee2 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -187,19 +187,10 @@ GEN_HANDLER2_E(name, str, 0x4, opc2, opc3, 0x000000=
00, PPC_NONE, PPC2_ISA300),
 GEN_VXRFORM_300(vcmpnezb, 3, 4)
 GEN_VXRFORM_300(vcmpnezh, 3, 5)
 GEN_VXRFORM_300(vcmpnezw, 3, 6)
-GEN_VXRFORM(vcmpgtsb, 3, 12)
-GEN_VXRFORM(vcmpgtsh, 3, 13)
-GEN_VXRFORM(vcmpgtsw, 3, 14)
-GEN_VXRFORM(vcmpgtub, 3, 8)
-GEN_VXRFORM(vcmpgtuh, 3, 9)
-GEN_VXRFORM(vcmpgtuw, 3, 10)
-GEN_VXRFORM_DUAL(vcmpeqfp, vcmpequd, 3, 3, PPC_ALTIVEC, PPC_NONE)
+GEN_VXRFORM(vcmpeqfp, 3, 3)
 GEN_VXRFORM(vcmpgefp, 3, 7)
-GEN_VXRFORM_DUAL(vcmpgtfp, vcmpgtud, 3, 11, PPC_ALTIVEC, PPC_NONE)
-GEN_VXRFORM_DUAL(vcmpbfp, vcmpgtsd, 3, 15, PPC_ALTIVEC, PPC_NONE)
-GEN_VXRFORM_DUAL(vcmpequb, vcmpneb, 3, 0, PPC_ALTIVEC, PPC_NONE)
-GEN_VXRFORM_DUAL(vcmpequh, vcmpneh, 3, 1, PPC_ALTIVEC, PPC_NONE)
-GEN_VXRFORM_DUAL(vcmpequw, vcmpnew, 3, 2, PPC_ALTIVEC, PPC_NONE)
+GEN_VXRFORM(vcmpgtfp, 3, 11)
+GEN_VXRFORM(vcmpbfp, 3, 15)
=20
 #define GEN_VXFORM_DUAL_INV(name0, name1, opc2, opc3, inval0, inval1, ty=
pe) \
 GEN_OPCODE_DUAL(name0##_##name1, 0x04, opc2, opc3, inval0, inval1, type,=
 \
--=20
2.34.1


