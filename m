Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BF3475FF1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:55:42 +0100 (CET)
Received: from localhost ([::1]:58820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYVB-0008TC-B2
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:55:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhz-0004RC-Pr; Wed, 15 Dec 2021 12:04:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10014
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhx-0004cj-GO; Wed, 15 Dec 2021 12:04:50 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfaP6009682; 
 Wed, 15 Dec 2021 17:04:26 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cye11htj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:26 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH2jYS024835;
 Wed, 15 Dec 2021 17:04:24 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3cy78e7kue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:24 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4MMU40108438
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:22 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A4E9A405B;
 Wed, 15 Dec 2021 17:04:22 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3862A405D;
 Wed, 15 Dec 2021 17:04:21 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:21 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 37169220295;
 Wed, 15 Dec 2021 18:04:21 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 040/102] target/ppc: Split out do_frsp
Date: Wed, 15 Dec 2021 18:02:55 +0100
Message-Id: <20211215170357.321643-28-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 99MItXk0O4Z0hBLHmkXxIE5_7kZ_NLtx
X-Proofpoint-ORIG-GUID: 99MItXk0O4Z0hBLHmkXxIE5_7kZ_NLtx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1034
 adultscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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


