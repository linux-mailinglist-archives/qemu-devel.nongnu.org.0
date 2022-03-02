Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3614CA43B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:52:35 +0100 (CET)
Received: from localhost ([::1]:54010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNX0-0006kV-4b
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:52:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr2-00012E-00; Wed, 02 Mar 2022 06:09:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqy-0001oU-PO; Wed, 02 Mar 2022 06:09:11 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228Lfel012727; 
 Wed, 2 Mar 2022 11:08:41 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej50ku6bv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:41 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B3QkS030533;
 Wed, 2 Mar 2022 11:08:38 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3efbu9523p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:38 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8a5a57213254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5706F4C046;
 Wed,  2 Mar 2022 11:08:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A4B24C044;
 Wed,  2 Mar 2022 11:08:36 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:35 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 507F92201C1;
 Wed,  2 Mar 2022 12:08:35 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 42/87] target/ppc: move xs[n]madd[am][ds]p/xs[n]msub[am][ds]p
 to decodetree
Date: Wed,  2 Mar 2022 12:07:18 +0100
Message-Id: <20220302110803.849505-43-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HGealgqo20E8aYS-Luhcr_tRk1UN8vD7
X-Proofpoint-ORIG-GUID: HGealgqo20E8aYS-Luhcr_tRk1UN8vD7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1034
 phishscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=608 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-37-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 | 16 ++++-----
 target/ppc/insn32.decode            | 22 ++++++++++++
 target/ppc/fpu_helper.c             | 23 ++++++------
 target/ppc/translate/vsx-impl.c.inc | 56 ++++++++++++++++++++++++-----
 target/ppc/translate/vsx-ops.c.inc  | 16 ---------
 5 files changed, 90 insertions(+), 43 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 008cd6405d0f..e376ad19b3d1 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -355,10 +355,10 @@ DEF_HELPER_3(xssqrtdp, void, env, vsr, vsr)
 DEF_HELPER_3(xsrsqrtedp, void, env, vsr, vsr)
 DEF_HELPER_4(xstdivdp, void, env, i32, vsr, vsr)
 DEF_HELPER_3(xstsqrtdp, void, env, i32, vsr)
-DEF_HELPER_5(xsmadddp, void, env, vsr, vsr, vsr, vsr)
-DEF_HELPER_5(xsmsubdp, void, env, vsr, vsr, vsr, vsr)
-DEF_HELPER_5(xsnmadddp, void, env, vsr, vsr, vsr, vsr)
-DEF_HELPER_5(xsnmsubdp, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSMADDDP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSMSUBDP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSNMADDDP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSNMSUBDP, void, env, vsr, vsr, vsr, vsr)
 DEF_HELPER_4(xscmpeqdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xscmpgtdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xscmpgedp, void, env, vsr, vsr, vsr)
@@ -418,10 +418,10 @@ DEF_HELPER_3(xsresp, void, env, vsr, vsr)
 DEF_HELPER_2(xsrsp, i64, env, i64)
 DEF_HELPER_3(xssqrtsp, void, env, vsr, vsr)
 DEF_HELPER_3(xsrsqrtesp, void, env, vsr, vsr)
-DEF_HELPER_5(xsmaddsp, void, env, vsr, vsr, vsr, vsr)
-DEF_HELPER_5(xsmsubsp, void, env, vsr, vsr, vsr, vsr)
-DEF_HELPER_5(xsnmaddsp, void, env, vsr, vsr, vsr, vsr)
-DEF_HELPER_5(xsnmsubsp, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSMADDSP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSMSUBSP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSNMADDSP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSNMSUBSP, void, env, vsr, vsr, vsr, vsr)
=20
 DEF_HELPER_4(xvadddp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xvsubdp, void, env, vsr, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 22b245607b0f..ed24b39e5a89 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -605,6 +605,28 @@ STXVX           011111 ..... ..... ..... 0110001100 =
.   @X_TSX
 LXVPX           011111 ..... ..... ..... 0101001101 -   @X_TSXP
 STXVPX          011111 ..... ..... ..... 0111001101 -   @X_TSXP
=20
+## VSX Scalar Multiply-Add Instructions
+
+XSMADDADP       111100 ..... ..... ..... 00100001 . . . @XX3
+XSMADDMDP       111100 ..... ..... ..... 00101001 . . . @XX3
+XSMADDASP       111100 ..... ..... ..... 00000001 . . . @XX3
+XSMADDMSP       111100 ..... ..... ..... 00001001 . . . @XX3
+
+XSMSUBADP       111100 ..... ..... ..... 00110001 . . . @XX3
+XSMSUBMDP       111100 ..... ..... ..... 00111001 . . . @XX3
+XSMSUBASP       111100 ..... ..... ..... 00010001 . . . @XX3
+XSMSUBMSP       111100 ..... ..... ..... 00011001 . . . @XX3
+
+XSNMADDASP      111100 ..... ..... ..... 10000001 . . . @XX3
+XSNMADDMSP      111100 ..... ..... ..... 10001001 . . . @XX3
+XSNMADDADP      111100 ..... ..... ..... 10100001 . . . @XX3
+XSNMADDMDP      111100 ..... ..... ..... 10101001 . . . @XX3
+
+XSNMSUBASP      111100 ..... ..... ..... 10010001 . . . @XX3
+XSNMSUBMSP      111100 ..... ..... ..... 10011001 . . . @XX3
+XSNMSUBADP      111100 ..... ..... ..... 10110001 . . . @XX3
+XSNMSUBMDP      111100 ..... ..... ..... 10111001 . . . @XX3
+
 ## VSX splat instruction
=20
 XXSPLTIB        111100 ..... 00 ........ 0101101000 .   @X_imm8
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 0fd285defc7c..c8797d805323 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2156,10 +2156,11 @@ VSX_TSQRT(xvtsqrtsp, 4, float32, VsrW(i), -126, 2=
3)
  *   maddflgs - flags for the float*muladd routine that control the
  *           various forms (madd, msub, nmadd, nmsub)
  *   sfprf - set FPRF
+ *   r2sp  - round intermediate double precision result to single precis=
ion
  */
 #define VSX_MADD(op, nels, tp, fld, maddflgs, sfprf, r2sp)              =
      \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                       =
      \
-                 ppc_vsr_t *xa, ppc_vsr_t *b, ppc_vsr_t *c)             =
      \
+                 ppc_vsr_t *s1, ppc_vsr_t *s2, ppc_vsr_t *s3)           =
      \
 {                                                                       =
      \
     ppc_vsr_t t =3D *xt;                                                =
        \
     int i;                                                              =
      \
@@ -2175,12 +2176,12 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,=
                             \
              * result to odd.                                           =
      \
              */                                                         =
      \
             set_float_rounding_mode(float_round_to_zero, &tstat);       =
      \
-            t.fld =3D tp##_muladd(xa->fld, b->fld, c->fld,              =
        \
+            t.fld =3D tp##_muladd(s1->fld, s3->fld, s2->fld,            =
        \
                                 maddflgs, &tstat);                      =
      \
             t.fld |=3D (get_float_exception_flags(&tstat) &             =
        \
                       float_flag_inexact) !=3D 0;                       =
        \
         } else {                                                        =
      \
-            t.fld =3D tp##_muladd(xa->fld, b->fld, c->fld,              =
        \
+            t.fld =3D tp##_muladd(s1->fld, s3->fld, s2->fld,            =
        \
                                 maddflgs, &tstat);                      =
      \
         }                                                               =
      \
         env->fp_status.float_exception_flags |=3D tstat.float_exception_=
flags;  \
@@ -2202,14 +2203,14 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,=
                             \
     do_float_check_status(env, GETPC());                                =
      \
 }
=20
-VSX_MADD(xsmadddp, 1, float64, VsrD(0), MADD_FLGS, 1, 0)
-VSX_MADD(xsmsubdp, 1, float64, VsrD(0), MSUB_FLGS, 1, 0)
-VSX_MADD(xsnmadddp, 1, float64, VsrD(0), NMADD_FLGS, 1, 0)
-VSX_MADD(xsnmsubdp, 1, float64, VsrD(0), NMSUB_FLGS, 1, 0)
-VSX_MADD(xsmaddsp, 1, float64, VsrD(0), MADD_FLGS, 1, 1)
-VSX_MADD(xsmsubsp, 1, float64, VsrD(0), MSUB_FLGS, 1, 1)
-VSX_MADD(xsnmaddsp, 1, float64, VsrD(0), NMADD_FLGS, 1, 1)
-VSX_MADD(xsnmsubsp, 1, float64, VsrD(0), NMSUB_FLGS, 1, 1)
+VSX_MADD(XSMADDDP, 1, float64, VsrD(0), MADD_FLGS, 1, 0)
+VSX_MADD(XSMSUBDP, 1, float64, VsrD(0), MSUB_FLGS, 1, 0)
+VSX_MADD(XSNMADDDP, 1, float64, VsrD(0), NMADD_FLGS, 1, 0)
+VSX_MADD(XSNMSUBDP, 1, float64, VsrD(0), NMSUB_FLGS, 1, 0)
+VSX_MADD(XSMADDSP, 1, float64, VsrD(0), MADD_FLGS, 1, 1)
+VSX_MADD(XSMSUBSP, 1, float64, VsrD(0), MSUB_FLGS, 1, 1)
+VSX_MADD(XSNMADDSP, 1, float64, VsrD(0), NMADD_FLGS, 1, 1)
+VSX_MADD(XSNMSUBSP, 1, float64, VsrD(0), NMSUB_FLGS, 1, 1)
=20
 VSX_MADD(xvmadddp, 2, float64, VsrD(i), MADD_FLGS, 0, 0)
 VSX_MADD(xvmsubdp, 2, float64, VsrD(i), MSUB_FLGS, 0, 0)
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index 6528e1ae31e0..c6313b8f56e3 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1299,6 +1299,54 @@ XXGENPCV(XXGENPCVWM)
 XXGENPCV(XXGENPCVDM)
 #undef XXGENPCV
=20
+static bool do_xsmadd(DisasContext *ctx, int tgt, int src1, int src2, in=
t src3,
+        void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_=
ptr))
+{
+    TCGv_ptr t, s1, s2, s3;
+
+    t =3D gen_vsr_ptr(tgt);
+    s1 =3D gen_vsr_ptr(src1);
+    s2 =3D gen_vsr_ptr(src2);
+    s3 =3D gen_vsr_ptr(src3);
+
+    gen_helper(cpu_env, t, s1, s2, s3);
+
+    tcg_temp_free_ptr(t);
+    tcg_temp_free_ptr(s1);
+    tcg_temp_free_ptr(s2);
+    tcg_temp_free_ptr(s3);
+
+    return true;
+}
+
+static bool do_xsmadd_XX3(DisasContext *ctx, arg_XX3 *a, bool type_a,
+        void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_=
ptr))
+{
+    REQUIRE_VSX(ctx);
+
+    if (type_a) {
+        return do_xsmadd(ctx, a->xt, a->xa, a->xt, a->xb, gen_helper);
+    }
+    return do_xsmadd(ctx, a->xt, a->xa, a->xb, a->xt, gen_helper);
+}
+
+TRANS_FLAGS2(VSX, XSMADDADP, do_xsmadd_XX3, true, gen_helper_XSMADDDP)
+TRANS_FLAGS2(VSX, XSMADDMDP, do_xsmadd_XX3, false, gen_helper_XSMADDDP)
+TRANS_FLAGS2(VSX, XSMSUBADP, do_xsmadd_XX3, true, gen_helper_XSMSUBDP)
+TRANS_FLAGS2(VSX, XSMSUBMDP, do_xsmadd_XX3, false, gen_helper_XSMSUBDP)
+TRANS_FLAGS2(VSX, XSNMADDADP, do_xsmadd_XX3, true, gen_helper_XSNMADDDP)
+TRANS_FLAGS2(VSX, XSNMADDMDP, do_xsmadd_XX3, false, gen_helper_XSNMADDDP=
)
+TRANS_FLAGS2(VSX, XSNMSUBADP, do_xsmadd_XX3, true, gen_helper_XSNMSUBDP)
+TRANS_FLAGS2(VSX, XSNMSUBMDP, do_xsmadd_XX3, false, gen_helper_XSNMSUBDP=
)
+TRANS_FLAGS2(VSX207, XSMADDASP, do_xsmadd_XX3, true, gen_helper_XSMADDSP=
)
+TRANS_FLAGS2(VSX207, XSMADDMSP, do_xsmadd_XX3, false, gen_helper_XSMADDS=
P)
+TRANS_FLAGS2(VSX207, XSMSUBASP, do_xsmadd_XX3, true, gen_helper_XSMSUBSP=
)
+TRANS_FLAGS2(VSX207, XSMSUBMSP, do_xsmadd_XX3, false, gen_helper_XSMSUBS=
P)
+TRANS_FLAGS2(VSX207, XSNMADDASP, do_xsmadd_XX3, true, gen_helper_XSNMADD=
SP)
+TRANS_FLAGS2(VSX207, XSNMADDMSP, do_xsmadd_XX3, false, gen_helper_XSNMAD=
DSP)
+TRANS_FLAGS2(VSX207, XSNMSUBASP, do_xsmadd_XX3, true, gen_helper_XSNMSUB=
SP)
+TRANS_FLAGS2(VSX207, XSNMSUBMSP, do_xsmadd_XX3, false, gen_helper_XSNMSU=
BSP)
+
 #define GEN_VSX_HELPER_VSX_MADD(name, op1, aop, mop, inval, type)       =
      \
 static void gen_##name(DisasContext *ctx)                               =
      \
 {                                                                       =
      \
@@ -1329,14 +1377,6 @@ static void gen_##name(DisasContext *ctx)         =
                            \
     tcg_temp_free_ptr(c);                                               =
      \
 }
=20
-GEN_VSX_HELPER_VSX_MADD(xsmadddp, 0x04, 0x04, 0x05, 0, PPC2_VSX)
-GEN_VSX_HELPER_VSX_MADD(xsmsubdp, 0x04, 0x06, 0x07, 0, PPC2_VSX)
-GEN_VSX_HELPER_VSX_MADD(xsnmadddp, 0x04, 0x14, 0x15, 0, PPC2_VSX)
-GEN_VSX_HELPER_VSX_MADD(xsnmsubdp, 0x04, 0x16, 0x17, 0, PPC2_VSX)
-GEN_VSX_HELPER_VSX_MADD(xsmaddsp, 0x04, 0x00, 0x01, 0, PPC2_VSX207)
-GEN_VSX_HELPER_VSX_MADD(xsmsubsp, 0x04, 0x02, 0x03, 0, PPC2_VSX207)
-GEN_VSX_HELPER_VSX_MADD(xsnmaddsp, 0x04, 0x10, 0x11, 0, PPC2_VSX207)
-GEN_VSX_HELPER_VSX_MADD(xsnmsubsp, 0x04, 0x12, 0x13, 0, PPC2_VSX207)
 GEN_VSX_HELPER_VSX_MADD(xvmadddp, 0x04, 0x0C, 0x0D, 0, PPC2_VSX)
 GEN_VSX_HELPER_VSX_MADD(xvmsubdp, 0x04, 0x0E, 0x0F, 0, PPC2_VSX)
 GEN_VSX_HELPER_VSX_MADD(xvnmadddp, 0x04, 0x1C, 0x1D, 0, PPC2_VSX)
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vs=
x-ops.c.inc
index 0a6b2b31ac84..9cfec53df0be 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -186,14 +186,6 @@ GEN_XX2FORM(xssqrtdp,  0x16, 0x04, PPC2_VSX),
 GEN_XX2FORM(xsrsqrtedp,  0x14, 0x04, PPC2_VSX),
 GEN_XX3FORM(xstdivdp,  0x14, 0x07, PPC2_VSX),
 GEN_XX2FORM(xstsqrtdp,  0x14, 0x06, PPC2_VSX),
-GEN_XX3FORM_NAME(xsmadddp, "xsmaddadp", 0x04, 0x04, PPC2_VSX),
-GEN_XX3FORM_NAME(xsmadddp, "xsmaddmdp", 0x04, 0x05, PPC2_VSX),
-GEN_XX3FORM_NAME(xsmsubdp, "xsmsubadp", 0x04, 0x06, PPC2_VSX),
-GEN_XX3FORM_NAME(xsmsubdp, "xsmsubmdp", 0x04, 0x07, PPC2_VSX),
-GEN_XX3FORM_NAME(xsnmadddp, "xsnmaddadp", 0x04, 0x14, PPC2_VSX),
-GEN_XX3FORM_NAME(xsnmadddp, "xsnmaddmdp", 0x04, 0x15, PPC2_VSX),
-GEN_XX3FORM_NAME(xsnmsubdp, "xsnmsubadp", 0x04, 0x16, PPC2_VSX),
-GEN_XX3FORM_NAME(xsnmsubdp, "xsnmsubmdp", 0x04, 0x17, PPC2_VSX),
 GEN_XX3FORM(xscmpeqdp, 0x0C, 0x00, PPC2_ISA300),
 GEN_XX3FORM(xscmpgtdp, 0x0C, 0x01, PPC2_ISA300),
 GEN_XX3FORM(xscmpgedp, 0x0C, 0x02, PPC2_ISA300),
@@ -235,14 +227,6 @@ GEN_XX2FORM(xsresp,  0x14, 0x01, PPC2_VSX207),
 GEN_XX2FORM(xsrsp, 0x12, 0x11, PPC2_VSX207),
 GEN_XX2FORM(xssqrtsp,  0x16, 0x00, PPC2_VSX207),
 GEN_XX2FORM(xsrsqrtesp,  0x14, 0x00, PPC2_VSX207),
-GEN_XX3FORM_NAME(xsmaddsp, "xsmaddasp", 0x04, 0x00, PPC2_VSX207),
-GEN_XX3FORM_NAME(xsmaddsp, "xsmaddmsp", 0x04, 0x01, PPC2_VSX207),
-GEN_XX3FORM_NAME(xsmsubsp, "xsmsubasp", 0x04, 0x02, PPC2_VSX207),
-GEN_XX3FORM_NAME(xsmsubsp, "xsmsubmsp", 0x04, 0x03, PPC2_VSX207),
-GEN_XX3FORM_NAME(xsnmaddsp, "xsnmaddasp", 0x04, 0x10, PPC2_VSX207),
-GEN_XX3FORM_NAME(xsnmaddsp, "xsnmaddmsp", 0x04, 0x11, PPC2_VSX207),
-GEN_XX3FORM_NAME(xsnmsubsp, "xsnmsubasp", 0x04, 0x12, PPC2_VSX207),
-GEN_XX3FORM_NAME(xsnmsubsp, "xsnmsubmsp", 0x04, 0x13, PPC2_VSX207),
 GEN_XX2FORM(xscvsxdsp, 0x10, 0x13, PPC2_VSX207),
 GEN_XX2FORM(xscvuxdsp, 0x10, 0x12, PPC2_VSX207),
=20
--=20
2.34.1


