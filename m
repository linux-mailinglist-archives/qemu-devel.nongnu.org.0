Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5DB477F7C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 22:44:47 +0100 (CET)
Received: from localhost ([::1]:41682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxyYQ-00066e-6i
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 16:44:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLX-0002gF-Mq; Thu, 16 Dec 2021 15:27:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLT-0007Oo-6z; Thu, 16 Dec 2021 15:27:23 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGJ0oYX038734; 
 Thu, 16 Dec 2021 20:26:49 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cymkwfkn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:48 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKDD40019537;
 Thu, 16 Dec 2021 20:26:46 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3cy78ek0qp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:46 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKQiWe31785256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:44 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AA7211C04A;
 Thu, 16 Dec 2021 20:26:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E683311C04C;
 Thu, 16 Dec 2021 20:26:43 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:43 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4B98F2201A0;
 Thu, 16 Dec 2021 21:26:43 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 040/101] target/ppc: Split out do_frsp
Date: Thu, 16 Dec 2021 21:25:13 +0100
Message-Id: <20211216202614.414266-41-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LymIyhzhIFfadm8GyMHzkyAJ7m1798EB
X-Proofpoint-ORIG-GUID: LymIyhzhIFfadm8GyMHzkyAJ7m1798EB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1034 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Calling helper_frsp directly from other helpers generates
the incorrect retaddr.  Split out a helper that takes the
retaddr as a parameter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-22-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index dd9d40f74b9b..77ab6f9e6426 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -721,7 +721,7 @@ FPU_FMADD(fmsub, MSUB_FLGS)
 FPU_FMADD(fnmsub, NMSUB_FLGS)
=20
 /* frsp - frsp. */
-uint64_t helper_frsp(CPUPPCState *env, uint64_t arg)
+static uint64_t do_frsp(CPUPPCState *env, uint64_t arg, uintptr_t retadd=
r)
 {
     CPU_DoubleU farg;
     float32 f32;
@@ -729,7 +729,7 @@ uint64_t helper_frsp(CPUPPCState *env, uint64_t arg)
     farg.ll =3D arg;
=20
     if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
-        float_invalid_op_vxsnan(env, GETPC());
+        float_invalid_op_vxsnan(env, retaddr);
     }
     f32 =3D float64_to_float32(farg.d, &env->fp_status);
     farg.d =3D float32_to_float64(f32, &env->fp_status);
@@ -737,6 +737,11 @@ uint64_t helper_frsp(CPUPPCState *env, uint64_t arg)
     return farg.ll;
 }
=20
+uint64_t helper_frsp(CPUPPCState *env, uint64_t arg)
+{
+    return do_frsp(env, arg, GETPC());
+}
+
 /* fsqrt - fsqrt. */
 float64 helper_fsqrt(CPUPPCState *env, float64 arg)
 {
@@ -1626,7 +1631,7 @@ void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,=
                          \
         }                                                               =
     \
                                                                         =
     \
         if (r2sp) {                                                     =
     \
-            t.fld =3D helper_frsp(env, t.fld);                          =
       \
+            t.fld =3D do_frsp(env, t.fld, GETPC());                     =
       \
         }                                                               =
     \
                                                                         =
     \
         if (sfprf) {                                                    =
     \
@@ -1702,7 +1707,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,  =
                          \
         }                                                               =
     \
                                                                         =
     \
         if (r2sp) {                                                     =
     \
-            t.fld =3D helper_frsp(env, t.fld);                          =
       \
+            t.fld =3D do_frsp(env, t.fld, GETPC());                     =
       \
         }                                                               =
     \
                                                                         =
     \
         if (sfprf) {                                                    =
     \
@@ -1776,7 +1781,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,  =
                           \
         }                                                               =
      \
                                                                         =
      \
         if (r2sp) {                                                     =
      \
-            t.fld =3D helper_frsp(env, t.fld);                          =
        \
+            t.fld =3D do_frsp(env, t.fld, GETPC());                     =
        \
         }                                                               =
      \
                                                                         =
      \
         if (sfprf) {                                                    =
      \
@@ -1844,7 +1849,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, p=
pc_vsr_t *xb)              \
         t.fld =3D tp##_div(tp##_one, xb->fld, &env->fp_status);         =
        \
                                                                         =
      \
         if (r2sp) {                                                     =
      \
-            t.fld =3D helper_frsp(env, t.fld);                          =
        \
+            t.fld =3D do_frsp(env, t.fld, GETPC());                     =
        \
         }                                                               =
      \
                                                                         =
      \
         if (sfprf) {                                                    =
      \
@@ -1892,7 +1897,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, p=
pc_vsr_t *xb)             \
         }                                                               =
     \
                                                                         =
     \
         if (r2sp) {                                                     =
     \
-            t.fld =3D helper_frsp(env, t.fld);                          =
       \
+            t.fld =3D do_frsp(env, t.fld, GETPC());                     =
       \
         }                                                               =
     \
                                                                         =
     \
         if (sfprf) {                                                    =
     \
@@ -1941,7 +1946,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, p=
pc_vsr_t *xb)             \
         }                                                               =
     \
                                                                         =
     \
         if (r2sp) {                                                     =
     \
-            t.fld =3D helper_frsp(env, t.fld);                          =
       \
+            t.fld =3D do_frsp(env, t.fld, GETPC());                     =
       \
         }                                                               =
     \
                                                                         =
     \
         if (sfprf) {                                                    =
     \
@@ -2112,7 +2117,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,  =
                           \
         }                                                               =
      \
                                                                         =
      \
         if (r2sp) {                                                     =
      \
-            t.fld =3D helper_frsp(env, t.fld);                          =
        \
+            t.fld =3D do_frsp(env, t.fld, GETPC());                     =
        \
         }                                                               =
      \
                                                                         =
      \
         if (sfprf) {                                                    =
      \
@@ -2851,7 +2856,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, p=
pc_vsr_t *xb)        \
     for (i =3D 0; i < nels; i++) {                                      =
  \
         t.tfld =3D stp##_to_##ttp(xb->sfld, &env->fp_status);           =
  \
         if (r2sp) {                                                     =
\
-            t.tfld =3D helper_frsp(env, t.tfld);                        =
  \
+            t.tfld =3D do_frsp(env, t.tfld, GETPC());                   =
  \
         }                                                               =
\
         if (sfprf) {                                                    =
\
             helper_compute_fprf_float64(env, t.tfld);                   =
\
@@ -2976,7 +2981,7 @@ uint64_t helper_xsrsp(CPUPPCState *env, uint64_t xb=
)
 {
     helper_reset_fpstatus(env);
=20
-    uint64_t xt =3D helper_frsp(env, xb);
+    uint64_t xt =3D do_frsp(env, xb, GETPC());
=20
     helper_compute_fprf_float64(env, xt);
     do_float_check_status(env, GETPC());
--=20
2.31.1


