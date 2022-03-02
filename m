Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAB34CA473
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:09:57 +0100 (CET)
Received: from localhost ([::1]:58754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNno-000585-8c
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:09:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrD-0001NQ-0F; Wed, 02 Mar 2022 06:09:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrA-0001rt-FY; Wed, 02 Mar 2022 06:09:22 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222A56ct032253; 
 Wed, 2 Mar 2022 11:08:42 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej4h3kqu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:42 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2cvO021754;
 Wed, 2 Mar 2022 11:08:39 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3efbu9efju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:39 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8bun39518524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:37 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03B6211C050;
 Wed,  2 Mar 2022 11:08:37 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC1BF11C054;
 Wed,  2 Mar 2022 11:08:36 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:36 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id EFF03220294;
 Wed,  2 Mar 2022 12:08:35 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 43/87] target/ppc: implement xs[n]maddqp[o]/xs[n]msubqp[o]
Date: Wed,  2 Mar 2022 12:07:19 +0100
Message-Id: <20220302110803.849505-44-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sFftPojZA9bpiEE-WR4ZPvEHPPUgND1U
X-Proofpoint-GUID: sFftPojZA9bpiEE-WR4ZPvEHPPUgND1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1034 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=635 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implement the following PowerISA v3.0 instuctions:
xsmaddqp[o]: VSX Scalar Multiply-Add Quad-Precision [using round to Odd]
xsmsubqp[o]: VSX Scalar Multiply-Subtract Quad-Precision [using round
             to Odd]
xsnmaddqp[o]: VSX Scalar Negative Multiply-Add Quad-Precision [using
              round to Odd]
xsnmsubqp[o]: VSX Scalar Negative Multiply-Subtract Quad-Precision
              [using round to Odd]

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-38-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 |  9 +++++++
 target/ppc/insn32.decode            |  4 +++
 target/ppc/fpu_helper.c             | 42 +++++++++++++++++++++++++++++
 target/ppc/translate/vsx-impl.c.inc | 25 +++++++++++++++++
 4 files changed, 80 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index e376ad19b3d1..378a348c8a83 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -423,6 +423,15 @@ DEF_HELPER_5(XSMSUBSP, void, env, vsr, vsr, vsr, vsr=
)
 DEF_HELPER_5(XSNMADDSP, void, env, vsr, vsr, vsr, vsr)
 DEF_HELPER_5(XSNMSUBSP, void, env, vsr, vsr, vsr, vsr)
=20
+DEF_HELPER_5(XSMADDQP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSMADDQPO, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSMSUBQP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSMSUBQPO, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSNMADDQP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSNMADDQPO, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSNMSUBQP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSNMSUBQPO, void, env, vsr, vsr, vsr, vsr)
+
 DEF_HELPER_4(xvadddp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xvsubdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xvmuldp, void, env, vsr, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index ed24b39e5a89..c28cc13325fe 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -611,21 +611,25 @@ XSMADDADP       111100 ..... ..... ..... 00100001 .=
 . . @XX3
 XSMADDMDP       111100 ..... ..... ..... 00101001 . . . @XX3
 XSMADDASP       111100 ..... ..... ..... 00000001 . . . @XX3
 XSMADDMSP       111100 ..... ..... ..... 00001001 . . . @XX3
+XSMADDQP        111111 ..... ..... ..... 0110000100 .   @X_rc
=20
 XSMSUBADP       111100 ..... ..... ..... 00110001 . . . @XX3
 XSMSUBMDP       111100 ..... ..... ..... 00111001 . . . @XX3
 XSMSUBASP       111100 ..... ..... ..... 00010001 . . . @XX3
 XSMSUBMSP       111100 ..... ..... ..... 00011001 . . . @XX3
+XSMSUBQP        111111 ..... ..... ..... 0110100100 .   @X_rc
=20
 XSNMADDASP      111100 ..... ..... ..... 10000001 . . . @XX3
 XSNMADDMSP      111100 ..... ..... ..... 10001001 . . . @XX3
 XSNMADDADP      111100 ..... ..... ..... 10100001 . . . @XX3
 XSNMADDMDP      111100 ..... ..... ..... 10101001 . . . @XX3
+XSNMADDQP       111111 ..... ..... ..... 0111000100 .   @X_rc
=20
 XSNMSUBASP      111100 ..... ..... ..... 10010001 . . . @XX3
 XSNMSUBMSP      111100 ..... ..... ..... 10011001 . . . @XX3
 XSNMSUBADP      111100 ..... ..... ..... 10110001 . . . @XX3
 XSNMSUBMDP      111100 ..... ..... ..... 10111001 . . . @XX3
+XSNMSUBQP       111111 ..... ..... ..... 0111100100 .   @X_rc
=20
 ## VSX splat instruction
=20
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index c8797d805323..98e9576608f6 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2222,6 +2222,48 @@ VSX_MADD(xvmsubsp, 4, float32, VsrW(i), MSUB_FLGS,=
 0, 0)
 VSX_MADD(xvnmaddsp, 4, float32, VsrW(i), NMADD_FLGS, 0, 0)
 VSX_MADD(xvnmsubsp, 4, float32, VsrW(i), NMSUB_FLGS, 0, 0)
=20
+/*
+ * VSX_MADDQ - VSX floating point quad-precision muliply/add
+ *   op    - instruction mnemonic
+ *   maddflgs - flags for the float*muladd routine that control the
+ *           various forms (madd, msub, nmadd, nmsub)
+ *   ro    - round to odd
+ */
+#define VSX_MADDQ(op, maddflgs, ro)                                     =
       \
+void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *s1, ppc_vsr=
_t *s2,\
+                 ppc_vsr_t *s3)                                         =
       \
+{                                                                       =
       \
+    ppc_vsr_t t =3D *xt;                                                =
         \
+                                                                        =
       \
+    helper_reset_fpstatus(env);                                         =
       \
+                                                                        =
       \
+    float_status tstat =3D env->fp_status;                              =
         \
+    set_float_exception_flags(0, &tstat);                               =
       \
+    if (ro) {                                                           =
       \
+        tstat.float_rounding_mode =3D float_round_to_odd;               =
         \
+    }                                                                   =
       \
+    t.f128 =3D float128_muladd(s1->f128, s3->f128, s2->f128, maddflgs, &=
tstat);  \
+    env->fp_status.float_exception_flags |=3D tstat.float_exception_flag=
s;       \
+                                                                        =
       \
+    if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {   =
       \
+        float_invalid_op_madd(env, tstat.float_exception_flags,         =
       \
+                              false, GETPC());                          =
       \
+    }                                                                   =
       \
+                                                                        =
       \
+    helper_compute_fprf_float128(env, t.f128);                          =
       \
+    *xt =3D t;                                                          =
         \
+    do_float_check_status(env, GETPC());                                =
       \
+}
+
+VSX_MADDQ(XSMADDQP, MADD_FLGS, 0)
+VSX_MADDQ(XSMADDQPO, MADD_FLGS, 1)
+VSX_MADDQ(XSMSUBQP, MSUB_FLGS, 0)
+VSX_MADDQ(XSMSUBQPO, MSUB_FLGS, 1)
+VSX_MADDQ(XSNMADDQP, NMADD_FLGS, 0)
+VSX_MADDQ(XSNMADDQPO, NMADD_FLGS, 1)
+VSX_MADDQ(XSNMSUBQP, NMSUB_FLGS, 0)
+VSX_MADDQ(XSNMSUBQPO, NMSUB_FLGS, 0)
+
 /*
  * VSX_SCALAR_CMP_DP - VSX scalar floating point compare double precisio=
n
  *   op    - instruction mnemonic
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index c6313b8f56e3..292a14f5aa98 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1347,6 +1347,31 @@ TRANS_FLAGS2(VSX207, XSNMADDMSP, do_xsmadd_XX3, fa=
lse, gen_helper_XSNMADDSP)
 TRANS_FLAGS2(VSX207, XSNMSUBASP, do_xsmadd_XX3, true, gen_helper_XSNMSUB=
SP)
 TRANS_FLAGS2(VSX207, XSNMSUBMSP, do_xsmadd_XX3, false, gen_helper_XSNMSU=
BSP)
=20
+static bool do_xsmadd_X(DisasContext *ctx, arg_X_rc *a,
+        void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_=
ptr),
+        void (*gen_helper_ro)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TC=
Gv_ptr))
+{
+    int vrt, vra, vrb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VSX(ctx);
+
+    vrt =3D a->rt + 32;
+    vra =3D a->ra + 32;
+    vrb =3D a->rb + 32;
+
+    if (a->rc) {
+        return do_xsmadd(ctx, vrt, vra, vrt, vrb, gen_helper_ro);
+    }
+
+    return do_xsmadd(ctx, vrt, vra, vrt, vrb, gen_helper);
+}
+
+TRANS(XSMADDQP, do_xsmadd_X, gen_helper_XSMADDQP, gen_helper_XSMADDQPO)
+TRANS(XSMSUBQP, do_xsmadd_X, gen_helper_XSMSUBQP, gen_helper_XSMSUBQPO)
+TRANS(XSNMADDQP, do_xsmadd_X, gen_helper_XSNMADDQP, gen_helper_XSNMADDQP=
O)
+TRANS(XSNMSUBQP, do_xsmadd_X, gen_helper_XSNMSUBQP, gen_helper_XSNMSUBQP=
O)
+
 #define GEN_VSX_HELPER_VSX_MADD(name, op1, aop, mop, inval, type)       =
      \
 static void gen_##name(DisasContext *ctx)                               =
      \
 {                                                                       =
      \
--=20
2.34.1


