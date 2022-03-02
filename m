Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EBC4CA42D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:51:17 +0100 (CET)
Received: from localhost ([::1]:50630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNVk-0004PC-IJ
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:51:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr7-0001C2-UN; Wed, 02 Mar 2022 06:09:18 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr6-0001pw-3v; Wed, 02 Mar 2022 06:09:17 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AINWH003569; 
 Wed, 2 Mar 2022 11:08:48 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6q9gx0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:48 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2dDn014266;
 Wed, 2 Mar 2022 11:08:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3efbu8w0hp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8hOD52887958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 625524C046;
 Wed,  2 Mar 2022 11:08:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 173524C044;
 Wed,  2 Mar 2022 11:08:43 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:43 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4CE722201C1;
 Wed,  2 Mar 2022 12:08:42 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 52/87] target/ppc: Implement xvcvbf16spn and xvcvspbf16
 instructions
Date: Wed,  2 Mar 2022 12:07:28 +0100
Message-Id: <20220302110803.849505-53-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ig0xQ12JH8Qt5sPJrusuQjjvwjFZWDDZ
X-Proofpoint-GUID: Ig0xQ12JH8Qt5sPJrusuQjjvwjFZWDDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=465
 priorityscore=1501 phishscore=0 clxscore=1034 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>

Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225210936.1749575-47-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 |  1 +
 target/ppc/insn32.decode            | 11 +++++++---
 target/ppc/fpu_helper.c             | 18 +++++++++++++++++
 target/ppc/translate/vsx-impl.c.inc | 31 ++++++++++++++++++++++++++++-
 4 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 0ca28555f2d9..57da11c77ec9 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -492,6 +492,7 @@ DEF_HELPER_FLAGS_4(xvcmpnesp, TCG_CALL_NO_RWG, i32, e=
nv, vsr, vsr, vsr)
 DEF_HELPER_3(xvcvspdp, void, env, vsr, vsr)
 DEF_HELPER_3(xvcvsphp, void, env, vsr, vsr)
 DEF_HELPER_3(xvcvhpsp, void, env, vsr, vsr)
+DEF_HELPER_3(XVCVSPBF16, void, env, vsr, vsr)
 DEF_HELPER_3(xvcvspsxds, void, env, vsr, vsr)
 DEF_HELPER_3(xvcvspsxws, void, env, vsr, vsr)
 DEF_HELPER_3(xvcvspuxds, void, env, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 126cadadb8b0..fede42f5ce33 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -152,8 +152,11 @@
 %xx_xb          1:1 11:5
 %xx_xa          2:1 16:5
 %xx_xc          3:1 6:5
-&XX2            xt xb uim:uint8_t
-@XX2            ...... ..... ... uim:2 ..... ......... ..       &XX2 xt=3D=
%xx_xt xb=3D%xx_xb
+&XX2            xt xb
+@XX2            ...... ..... ..... ..... ......... ..           &XX2 xt=3D=
%xx_xt xb=3D%xx_xb
+
+&XX2_uim2       xt xb uim:uint8_t
+@XX2_uim2       ...... ..... ... uim:2 ..... ......... ..       &XX2_uim=
2 xt=3D%xx_xt xb=3D%xx_xb
=20
 &XX2_bf_xb      bf xb
 @XX2_bf_xb      ...... bf:3 .. ..... ..... ......... . .        &XX2_bf_=
xb xb=3D%xx_xb
@@ -637,7 +640,7 @@ XSNMSUBQP       111111 ..... ..... ..... 0111100100 .=
   @X_rc
 ## VSX splat instruction
=20
 XXSPLTIB        111100 ..... 00 ........ 0101101000 .   @X_imm8
-XXSPLTW         111100 ..... ---.. ..... 010100100 . .  @XX2
+XXSPLTW         111100 ..... ---.. ..... 010100100 . .  @XX2_uim2
=20
 ## VSX Permute Instructions
=20
@@ -677,6 +680,8 @@ XSCMPGTQP       111111 ..... ..... ..... 0011100100 -=
   @X
 ## VSX Binary Floating-Point Convert Instructions
=20
 XSCVQPDP        111111 ..... 10100 ..... 1101000100 .   @X_tb_rc
+XVCVBF16SPN     111100 ..... 10000 ..... 111011011 ..   @XX2
+XVCVSPBF16      111100 ..... 10001 ..... 111011011 ..   @XX2
=20
 ## VSX Vector Test Least-Significant Bit by Byte Instruction
=20
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 714400731611..8f970288f50e 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2785,6 +2785,24 @@ VSX_CVT_FP_TO_FP_HP(xscvhpdp, 1, float16, float64,=
 VsrH(3), VsrD(0), 1)
 VSX_CVT_FP_TO_FP_HP(xvcvsphp, 4, float32, float16, VsrW(i), VsrH(2 * i  =
+ 1), 0)
 VSX_CVT_FP_TO_FP_HP(xvcvhpsp, 4, float16, float32, VsrH(2 * i + 1), VsrW=
(i), 0)
=20
+void helper_XVCVSPBF16(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)
+{
+    ppc_vsr_t t =3D { };
+    int i, status;
+
+    for (i =3D 0; i < 4; i++) {
+        t.VsrH(2 * i + 1) =3D float32_to_bfloat16(xb->VsrW(i), &env->fp_=
status);
+    }
+
+    status =3D get_float_exception_flags(&env->fp_status);
+    if (unlikely(status & float_flag_invalid_snan)) {
+        float_invalid_op_vxsnan(env, GETPC());
+    }
+
+    *xt =3D t;
+    do_float_check_status(env, GETPC());
+}
+
 void helper_XSCVQPDP(CPUPPCState *env, uint32_t ro, ppc_vsr_t *xt,
                      ppc_vsr_t *xb)
 {
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index 3b0c8bf3ca07..0344c47eed14 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1590,7 +1590,7 @@ static bool trans_XXSEL(DisasContext *ctx, arg_XX4 =
*a)
     return true;
 }
=20
-static bool trans_XXSPLTW(DisasContext *ctx, arg_XX2 *a)
+static bool trans_XXSPLTW(DisasContext *ctx, arg_XX2_uim2 *a)
 {
     int tofs, bofs;
=20
@@ -2648,6 +2648,35 @@ TRANS(XSCMPGTQP, do_xscmpqp, gen_helper_XSCMPGTQP)
 TRANS(XSMAXCQP, do_xscmpqp, gen_helper_XSMAXCQP)
 TRANS(XSMINCQP, do_xscmpqp, gen_helper_XSMINCQP)
=20
+static bool trans_XVCVSPBF16(DisasContext *ctx, arg_XX2 *a)
+{
+    TCGv_ptr xt, xb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    xt =3D gen_vsr_ptr(a->xt);
+    xb =3D gen_vsr_ptr(a->xb);
+
+    gen_helper_XVCVSPBF16(cpu_env, xt, xb);
+
+    tcg_temp_free_ptr(xt);
+    tcg_temp_free_ptr(xb);
+
+    return true;
+}
+
+static bool trans_XVCVBF16SPN(DisasContext *ctx, arg_XX2 *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    tcg_gen_gvec_shli(MO_32, vsr_full_offset(a->xt), vsr_full_offset(a->=
xb),
+                      16, 16, 16);
+
+    return true;
+}
+
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
 #undef GEN_XX2IFORM
--=20
2.34.1


