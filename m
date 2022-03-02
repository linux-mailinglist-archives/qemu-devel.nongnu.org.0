Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE594CA2E7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:12:07 +0100 (CET)
Received: from localhost ([::1]:38042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPMtq-0004xU-6H
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:12:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqL-0008Tc-2f; Wed, 02 Mar 2022 06:08:29 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqI-0001hy-BJ; Wed, 02 Mar 2022 06:08:28 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AIKDQ022644; 
 Wed, 2 Mar 2022 11:08:18 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6qa0x9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:18 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2gtp022356;
 Wed, 2 Mar 2022 11:08:15 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3efbu9efhe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:15 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8D6Z53019014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:13 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70BE9AE058;
 Wed,  2 Mar 2022 11:08:13 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14F6AAE051;
 Wed,  2 Mar 2022 11:08:13 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:13 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 3BBDF2201C1;
 Wed,  2 Mar 2022 12:08:12 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 08/87] target/ppc: moved vector even and odd multiplication to
 decodetree
Date: Wed,  2 Mar 2022 12:06:44 +0100
Message-Id: <20220302110803.849505-9-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7Wi3Nr965fZned5XSLK8-0M4xMKz7bVM
X-Proofpoint-ORIG-GUID: 7Wi3Nr965fZned5XSLK8-0M4xMKz7bVM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1034
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
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
 "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>

Moved the instructions vmulesb, vmulosb, vmuleub, vmuloub,
vmulesh, vmulosh, vmuleuh, vmulouh, vmulesw, vmulosw,
muleuw and vmulouw from legacy to decodetree. Implemented
the instructions vmulesd, vmulosd, vmuleud, vmuloud.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.b=
r>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-3-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 | 24 ++++-----
 target/ppc/insn32.decode            | 22 +++++++++
 target/ppc/int_helper.c             | 20 ++++----
 target/ppc/translate/vmx-impl.c.inc | 77 ++++++++++++++++++++++-------
 target/ppc/translate/vmx-ops.c.inc  | 15 ++----
 tcg/ppc/tcg-target.c.inc            |  6 +++
 6 files changed, 112 insertions(+), 52 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index ae7d503fcf2f..c399fab1a830 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -192,18 +192,18 @@ DEF_HELPER_3(vmrglw, void, avr, avr, avr)
 DEF_HELPER_3(vmrghb, void, avr, avr, avr)
 DEF_HELPER_3(vmrghh, void, avr, avr, avr)
 DEF_HELPER_3(vmrghw, void, avr, avr, avr)
-DEF_HELPER_3(vmulesb, void, avr, avr, avr)
-DEF_HELPER_3(vmulesh, void, avr, avr, avr)
-DEF_HELPER_3(vmulesw, void, avr, avr, avr)
-DEF_HELPER_3(vmuleub, void, avr, avr, avr)
-DEF_HELPER_3(vmuleuh, void, avr, avr, avr)
-DEF_HELPER_3(vmuleuw, void, avr, avr, avr)
-DEF_HELPER_3(vmulosb, void, avr, avr, avr)
-DEF_HELPER_3(vmulosh, void, avr, avr, avr)
-DEF_HELPER_3(vmulosw, void, avr, avr, avr)
-DEF_HELPER_3(vmuloub, void, avr, avr, avr)
-DEF_HELPER_3(vmulouh, void, avr, avr, avr)
-DEF_HELPER_3(vmulouw, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMULESB, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMULESH, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMULESW, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMULEUB, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMULEUH, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMULEUW, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMULOSB, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMULOSH, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMULOSW, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMULOUB, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMULOUH, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMULOUW, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_3(vmulhsw, void, avr, avr, avr)
 DEF_HELPER_3(vmulhuw, void, avr, avr, avr)
 DEF_HELPER_3(vmulhsd, void, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 2a9c91a4235e..092ea796184c 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -440,6 +440,28 @@ VEXTRACTWM      000100 ..... 01010 ..... 11001000010=
    @VX_tb
 VEXTRACTDM      000100 ..... 01011 ..... 11001000010    @VX_tb
 VEXTRACTQM      000100 ..... 01100 ..... 11001000010    @VX_tb
=20
+## Vector Multiply Instruction
+
+VMULESB         000100 ..... ..... ..... 01100001000    @VX
+VMULOSB         000100 ..... ..... ..... 00100001000    @VX
+VMULEUB         000100 ..... ..... ..... 01000001000    @VX
+VMULOUB         000100 ..... ..... ..... 00000001000    @VX
+
+VMULESH         000100 ..... ..... ..... 01101001000    @VX
+VMULOSH         000100 ..... ..... ..... 00101001000    @VX
+VMULEUH         000100 ..... ..... ..... 01001001000    @VX
+VMULOUH         000100 ..... ..... ..... 00001001000    @VX
+
+VMULESW         000100 ..... ..... ..... 01110001000    @VX
+VMULOSW         000100 ..... ..... ..... 00110001000    @VX
+VMULEUW         000100 ..... ..... ..... 01010001000    @VX
+VMULOUW         000100 ..... ..... ..... 00010001000    @VX
+
+VMULESD         000100 ..... ..... ..... 01111001000    @VX
+VMULOSD         000100 ..... ..... ..... 00111001000    @VX
+VMULEUD         000100 ..... ..... ..... 01011001000    @VX
+VMULOUD         000100 ..... ..... ..... 00011001000    @VX
+
 # VSX Load/Store Instructions
=20
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index d1b12788b215..c9f34ce3ca4e 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1063,7 +1063,7 @@ void helper_vmsumuhs(CPUPPCState *env, ppc_avr_t *r=
, ppc_avr_t *a,
 }
=20
 #define VMUL_DO_EVN(name, mul_element, mul_access, prod_access, cast)   =
\
-    void helper_v##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)       =
\
+    void helper_V##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)       =
\
     {                                                                   =
\
         int i;                                                          =
\
                                                                         =
\
@@ -1074,7 +1074,7 @@ void helper_vmsumuhs(CPUPPCState *env, ppc_avr_t *r=
, ppc_avr_t *a,
     }
=20
 #define VMUL_DO_ODD(name, mul_element, mul_access, prod_access, cast)   =
\
-    void helper_v##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)       =
\
+    void helper_V##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)       =
\
     {                                                                   =
\
         int i;                                                          =
\
                                                                         =
\
@@ -1085,14 +1085,14 @@ void helper_vmsumuhs(CPUPPCState *env, ppc_avr_t =
*r, ppc_avr_t *a,
     }
=20
 #define VMUL(suffix, mul_element, mul_access, prod_access, cast)       \
-    VMUL_DO_EVN(mule##suffix, mul_element, mul_access, prod_access, cast=
)  \
-    VMUL_DO_ODD(mulo##suffix, mul_element, mul_access, prod_access, cast=
)
-VMUL(sb, s8, VsrSB, VsrSH, int16_t)
-VMUL(sh, s16, VsrSH, VsrSW, int32_t)
-VMUL(sw, s32, VsrSW, VsrSD, int64_t)
-VMUL(ub, u8, VsrB, VsrH, uint16_t)
-VMUL(uh, u16, VsrH, VsrW, uint32_t)
-VMUL(uw, u32, VsrW, VsrD, uint64_t)
+    VMUL_DO_EVN(MULE##suffix, mul_element, mul_access, prod_access, cast=
)  \
+    VMUL_DO_ODD(MULO##suffix, mul_element, mul_access, prod_access, cast=
)
+VMUL(SB, s8, VsrSB, VsrSH, int16_t)
+VMUL(SH, s16, VsrSH, VsrSW, int32_t)
+VMUL(SW, s32, VsrSW, VsrSD, int64_t)
+VMUL(UB, u8, VsrB, VsrH, uint16_t)
+VMUL(UH, u16, VsrH, VsrW, uint32_t)
+VMUL(UW, u32, VsrW, VsrD, uint64_t)
 #undef VMUL_DO_EVN
 #undef VMUL_DO_ODD
 #undef VMUL
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index d5e02fd7f22e..a34a080e8324 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -798,29 +798,11 @@ static void trans_vclzd(DisasContext *ctx)
     tcg_temp_free_i64(avr);
 }
=20
-GEN_VXFORM(vmuloub, 4, 0);
-GEN_VXFORM(vmulouh, 4, 1);
-GEN_VXFORM(vmulouw, 4, 2);
 GEN_VXFORM_V(vmuluwm, MO_32, tcg_gen_gvec_mul, 4, 2);
-GEN_VXFORM_DUAL(vmulouw, PPC_ALTIVEC, PPC_NONE,
-                vmuluwm, PPC_NONE, PPC2_ALTIVEC_207)
-GEN_VXFORM(vmulosb, 4, 4);
-GEN_VXFORM(vmulosh, 4, 5);
-GEN_VXFORM(vmulosw, 4, 6);
 GEN_VXFORM_V(vmulld, MO_64, tcg_gen_gvec_mul, 4, 7);
-GEN_VXFORM(vmuleub, 4, 8);
-GEN_VXFORM(vmuleuh, 4, 9);
-GEN_VXFORM(vmuleuw, 4, 10);
 GEN_VXFORM(vmulhuw, 4, 10);
 GEN_VXFORM(vmulhud, 4, 11);
-GEN_VXFORM_DUAL(vmuleuw, PPC_ALTIVEC, PPC_NONE,
-                vmulhuw, PPC_NONE, PPC2_ISA310);
-GEN_VXFORM(vmulesb, 4, 12);
-GEN_VXFORM(vmulesh, 4, 13);
-GEN_VXFORM(vmulesw, 4, 14);
 GEN_VXFORM(vmulhsw, 4, 14);
-GEN_VXFORM_DUAL(vmulesw, PPC_ALTIVEC, PPC_NONE,
-                vmulhsw, PPC_NONE, PPC2_ISA310);
 GEN_VXFORM(vmulhsd, 4, 15);
 GEN_VXFORM_V(vslb, MO_8, tcg_gen_gvec_shlv, 2, 4);
 GEN_VXFORM_V(vslh, MO_16, tcg_gen_gvec_shlv, 2, 5);
@@ -2104,6 +2086,65 @@ static bool trans_VPEXTD(DisasContext *ctx, arg_VX=
 *a)
     return true;
 }
=20
+static bool do_vx_helper(DisasContext *ctx, arg_VX *a,
+                         void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr=
))
+{
+    TCGv_ptr ra, rb, rd;
+    REQUIRE_VECTOR(ctx);
+
+    ra =3D gen_avr_ptr(a->vra);
+    rb =3D gen_avr_ptr(a->vrb);
+    rd =3D gen_avr_ptr(a->vrt);
+    gen_helper(rd, ra, rb);
+    tcg_temp_free_ptr(ra);
+    tcg_temp_free_ptr(rb);
+    tcg_temp_free_ptr(rd);
+
+    return true;
+}
+
+static bool do_vx_vmuleo(DisasContext *ctx, arg_VX *a, bool even,
+                         void (*gen_mul)(TCGv_i64, TCGv_i64, TCGv_i64, T=
CGv_i64))
+{
+    TCGv_i64 vra, vrb, vrt0, vrt1;
+    REQUIRE_VECTOR(ctx);
+
+    vra =3D tcg_temp_new_i64();
+    vrb =3D tcg_temp_new_i64();
+    vrt0 =3D tcg_temp_new_i64();
+    vrt1 =3D tcg_temp_new_i64();
+
+    get_avr64(vra, a->vra, even);
+    get_avr64(vrb, a->vrb, even);
+    gen_mul(vrt0, vrt1, vra, vrb);
+    set_avr64(a->vrt, vrt0, false);
+    set_avr64(a->vrt, vrt1, true);
+
+    tcg_temp_free_i64(vra);
+    tcg_temp_free_i64(vrb);
+    tcg_temp_free_i64(vrt0);
+    tcg_temp_free_i64(vrt1);
+
+    return true;
+}
+
+TRANS_FLAGS2(ALTIVEC_207, VMULESB, do_vx_helper, gen_helper_VMULESB)
+TRANS_FLAGS2(ALTIVEC_207, VMULOSB, do_vx_helper, gen_helper_VMULOSB)
+TRANS_FLAGS2(ALTIVEC_207, VMULEUB, do_vx_helper, gen_helper_VMULEUB)
+TRANS_FLAGS2(ALTIVEC_207, VMULOUB, do_vx_helper, gen_helper_VMULOUB)
+TRANS_FLAGS2(ALTIVEC_207, VMULESH, do_vx_helper, gen_helper_VMULESH)
+TRANS_FLAGS2(ALTIVEC_207, VMULOSH, do_vx_helper, gen_helper_VMULOSH)
+TRANS_FLAGS2(ALTIVEC_207, VMULEUH, do_vx_helper, gen_helper_VMULEUH)
+TRANS_FLAGS2(ALTIVEC_207, VMULOUH, do_vx_helper, gen_helper_VMULOUH)
+TRANS_FLAGS2(ALTIVEC_207, VMULESW, do_vx_helper, gen_helper_VMULESW)
+TRANS_FLAGS2(ALTIVEC_207, VMULOSW, do_vx_helper, gen_helper_VMULOSW)
+TRANS_FLAGS2(ALTIVEC_207, VMULEUW, do_vx_helper, gen_helper_VMULEUW)
+TRANS_FLAGS2(ALTIVEC_207, VMULOUW, do_vx_helper, gen_helper_VMULOUW)
+TRANS_FLAGS2(ISA310, VMULESD, do_vx_vmuleo, true , tcg_gen_muls2_i64)
+TRANS_FLAGS2(ISA310, VMULOSD, do_vx_vmuleo, false, tcg_gen_muls2_i64)
+TRANS_FLAGS2(ISA310, VMULEUD, do_vx_vmuleo, true , tcg_gen_mulu2_i64)
+TRANS_FLAGS2(ISA310, VMULOUD, do_vx_vmuleo, false, tcg_gen_mulu2_i64)
+
 #undef GEN_VR_LDX
 #undef GEN_VR_STX
 #undef GEN_VR_LVE
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vm=
x-ops.c.inc
index 25ee715b4326..f310b2fbde95 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -101,20 +101,11 @@ GEN_VXFORM_DUAL(vmrgow, vextuwlx, 6, 26, PPC_NONE, =
PPC2_ALTIVEC_207),
 GEN_VXFORM_300(vextubrx, 6, 28),
 GEN_VXFORM_300(vextuhrx, 6, 29),
 GEN_VXFORM_DUAL(vmrgew, vextuwrx, 6, 30, PPC_NONE, PPC2_ALTIVEC_207),
-GEN_VXFORM(vmuloub, 4, 0),
-GEN_VXFORM(vmulouh, 4, 1),
-GEN_VXFORM_DUAL(vmulouw, vmuluwm, 4, 2, PPC_ALTIVEC, PPC_NONE),
-GEN_VXFORM(vmulosb, 4, 4),
-GEN_VXFORM(vmulosh, 4, 5),
-GEN_VXFORM_207(vmulosw, 4, 6),
+GEN_VXFORM_207(vmuluwm, 4, 2),
 GEN_VXFORM_310(vmulld, 4, 7),
-GEN_VXFORM(vmuleub, 4, 8),
-GEN_VXFORM(vmuleuh, 4, 9),
-GEN_VXFORM_DUAL(vmuleuw, vmulhuw, 4, 10, PPC_ALTIVEC, PPC_NONE),
+GEN_VXFORM_310(vmulhuw, 4, 10),
 GEN_VXFORM_310(vmulhud, 4, 11),
-GEN_VXFORM(vmulesb, 4, 12),
-GEN_VXFORM(vmulesh, 4, 13),
-GEN_VXFORM_DUAL(vmulesw, vmulhsw, 4, 14, PPC_ALTIVEC, PPC_NONE),
+GEN_VXFORM_310(vmulhsw, 4, 14),
 GEN_VXFORM_310(vmulhsd, 4, 15),
 GEN_VXFORM(vslb, 2, 4),
 GEN_VXFORM(vslh, 2, 5),
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index dea24f23c4db..69d22e08cbf2 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -3987,3 +3987,9 @@ void tcg_register_jit(const void *buf, size_t buf_s=
ize)
     tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame=
));
 }
 #endif /* __ELF__ */
+#undef VMULEUB
+#undef VMULEUH
+#undef VMULEUW
+#undef VMULOUB
+#undef VMULOUH
+#undef VMULOUW
--=20
2.34.1


