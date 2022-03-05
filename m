Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484D34CE471
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 12:16:02 +0100 (CET)
Received: from localhost ([::1]:59086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQSOH-0006du-DQ
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 06:16:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9Y-0001ha-Qu; Sat, 05 Mar 2022 06:00:48 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:65354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9W-00032V-Vh; Sat, 05 Mar 2022 06:00:48 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2256fvOb006287; 
 Sat, 5 Mar 2022 11:00:25 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3em2tkjkvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:24 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 225Aro7h024164;
 Sat, 5 Mar 2022 11:00:22 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3ekyg8rqbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:22 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 225B0Jwb54657526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 5 Mar 2022 11:00:19 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E4FA52057;
 Sat,  5 Mar 2022 11:00:19 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 5D41052052;
 Sat,  5 Mar 2022 11:00:19 +0000 (GMT)
Received: from yukon.home (unknown [9.171.13.194])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A0C2C2203EC;
 Sat,  5 Mar 2022 12:00:18 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 03/13] target/ppc: change xs[n]madd[am]sp to use
 float64r32_muladd
Date: Sat,  5 Mar 2022 12:00:00 +0100
Message-Id: <20220305110010.1283654-4-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220305110010.1283654-1-clg@kaod.org>
References: <20220305110010.1283654-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XloJ_rvqYz-k3tK5n0e5htHtHckqgFAX
X-Proofpoint-ORIG-GUID: XloJ_rvqYz-k3tK5n0e5htHtHckqgFAX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-05_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1034 mlxscore=0 impostorscore=0 phishscore=0
 mlxlogscore=409 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203050057
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

Change VSX Scalar Multiply-Add/Subtract Type-A/M Single Precision
helpers to use float64r32_muladd. This method should correctly handle
all rounding modes, so the workaround for float_round_nearest_even can
be dropped.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220304165417.1981159-3-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 58 ++++++++++++++---------------------------
 1 file changed, 20 insertions(+), 38 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 8f970288f50e..2cad05c9cf7e 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2156,9 +2156,8 @@ VSX_TSQRT(xvtsqrtsp, 4, float32, VsrW(i), -126, 23)
  *   maddflgs - flags for the float*muladd routine that control the
  *           various forms (madd, msub, nmadd, nmsub)
  *   sfprf - set FPRF
- *   r2sp  - round intermediate double precision result to single precis=
ion
  */
-#define VSX_MADD(op, nels, tp, fld, maddflgs, sfprf, r2sp)              =
      \
+#define VSX_MADD(op, nels, tp, fld, maddflgs, sfprf)                    =
      \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                       =
      \
                  ppc_vsr_t *s1, ppc_vsr_t *s2, ppc_vsr_t *s3)           =
      \
 {                                                                       =
      \
@@ -2170,20 +2169,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, =
                            \
     for (i =3D 0; i < nels; i++) {                                      =
        \
         float_status tstat =3D env->fp_status;                          =
        \
         set_float_exception_flags(0, &tstat);                           =
      \
-        if (r2sp && (tstat.float_rounding_mode =3D=3D float_round_neares=
t_even)) {\
-            /*                                                          =
      \
-             * Avoid double rounding errors by rounding the intermediate=
      \
-             * result to odd.                                           =
      \
-             */                                                         =
      \
-            set_float_rounding_mode(float_round_to_zero, &tstat);       =
      \
-            t.fld =3D tp##_muladd(s1->fld, s3->fld, s2->fld,            =
        \
-                                maddflgs, &tstat);                      =
      \
-            t.fld |=3D (get_float_exception_flags(&tstat) &             =
        \
-                      float_flag_inexact) !=3D 0;                       =
        \
-        } else {                                                        =
      \
-            t.fld =3D tp##_muladd(s1->fld, s3->fld, s2->fld,            =
        \
-                                maddflgs, &tstat);                      =
      \
-        }                                                               =
      \
+        t.fld =3D tp##_muladd(s1->fld, s3->fld, s2->fld, maddflgs, &tsta=
t);     \
         env->fp_status.float_exception_flags |=3D tstat.float_exception_=
flags;  \
                                                                         =
      \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) =
{     \
@@ -2191,10 +2177,6 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, =
                            \
                                   sfprf, GETPC());                      =
      \
         }                                                               =
      \
                                                                         =
      \
-        if (r2sp) {                                                     =
      \
-            t.fld =3D do_frsp(env, t.fld, GETPC());                     =
        \
-        }                                                               =
      \
-                                                                        =
      \
         if (sfprf) {                                                    =
      \
             helper_compute_fprf_float64(env, t.fld);                    =
      \
         }                                                               =
      \
@@ -2203,24 +2185,24 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,=
                             \
     do_float_check_status(env, GETPC());                                =
      \
 }
=20
-VSX_MADD(XSMADDDP, 1, float64, VsrD(0), MADD_FLGS, 1, 0)
-VSX_MADD(XSMSUBDP, 1, float64, VsrD(0), MSUB_FLGS, 1, 0)
-VSX_MADD(XSNMADDDP, 1, float64, VsrD(0), NMADD_FLGS, 1, 0)
-VSX_MADD(XSNMSUBDP, 1, float64, VsrD(0), NMSUB_FLGS, 1, 0)
-VSX_MADD(XSMADDSP, 1, float64, VsrD(0), MADD_FLGS, 1, 1)
-VSX_MADD(XSMSUBSP, 1, float64, VsrD(0), MSUB_FLGS, 1, 1)
-VSX_MADD(XSNMADDSP, 1, float64, VsrD(0), NMADD_FLGS, 1, 1)
-VSX_MADD(XSNMSUBSP, 1, float64, VsrD(0), NMSUB_FLGS, 1, 1)
-
-VSX_MADD(xvmadddp, 2, float64, VsrD(i), MADD_FLGS, 0, 0)
-VSX_MADD(xvmsubdp, 2, float64, VsrD(i), MSUB_FLGS, 0, 0)
-VSX_MADD(xvnmadddp, 2, float64, VsrD(i), NMADD_FLGS, 0, 0)
-VSX_MADD(xvnmsubdp, 2, float64, VsrD(i), NMSUB_FLGS, 0, 0)
-
-VSX_MADD(xvmaddsp, 4, float32, VsrW(i), MADD_FLGS, 0, 0)
-VSX_MADD(xvmsubsp, 4, float32, VsrW(i), MSUB_FLGS, 0, 0)
-VSX_MADD(xvnmaddsp, 4, float32, VsrW(i), NMADD_FLGS, 0, 0)
-VSX_MADD(xvnmsubsp, 4, float32, VsrW(i), NMSUB_FLGS, 0, 0)
+VSX_MADD(XSMADDDP, 1, float64, VsrD(0), MADD_FLGS, 1)
+VSX_MADD(XSMSUBDP, 1, float64, VsrD(0), MSUB_FLGS, 1)
+VSX_MADD(XSNMADDDP, 1, float64, VsrD(0), NMADD_FLGS, 1)
+VSX_MADD(XSNMSUBDP, 1, float64, VsrD(0), NMSUB_FLGS, 1)
+VSX_MADD(XSMADDSP, 1, float64r32, VsrD(0), MADD_FLGS, 1)
+VSX_MADD(XSMSUBSP, 1, float64r32, VsrD(0), MSUB_FLGS, 1)
+VSX_MADD(XSNMADDSP, 1, float64r32, VsrD(0), NMADD_FLGS, 1)
+VSX_MADD(XSNMSUBSP, 1, float64r32, VsrD(0), NMSUB_FLGS, 1)
+
+VSX_MADD(xvmadddp, 2, float64, VsrD(i), MADD_FLGS, 0)
+VSX_MADD(xvmsubdp, 2, float64, VsrD(i), MSUB_FLGS, 0)
+VSX_MADD(xvnmadddp, 2, float64, VsrD(i), NMADD_FLGS, 0)
+VSX_MADD(xvnmsubdp, 2, float64, VsrD(i), NMSUB_FLGS, 0)
+
+VSX_MADD(xvmaddsp, 4, float32, VsrW(i), MADD_FLGS, 0)
+VSX_MADD(xvmsubsp, 4, float32, VsrW(i), MSUB_FLGS, 0)
+VSX_MADD(xvnmaddsp, 4, float32, VsrW(i), NMADD_FLGS, 0)
+VSX_MADD(xvnmsubsp, 4, float32, VsrW(i), NMSUB_FLGS, 0)
=20
 /*
  * VSX_MADDQ - VSX floating point quad-precision muliply/add
--=20
2.34.1


