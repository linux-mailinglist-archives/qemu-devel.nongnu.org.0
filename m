Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0D9476041
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:08:43 +0100 (CET)
Received: from localhost ([::1]:34754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYhm-000606-Sn
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:08:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXi8-0004aq-Na; Wed, 15 Dec 2021 12:05:00 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51788
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXi5-0004fN-LX; Wed, 15 Dec 2021 12:05:00 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfcdw012534; 
 Wed, 15 Dec 2021 17:04:28 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cygmvx0qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:28 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3DpL004155;
 Wed, 15 Dec 2021 17:04:26 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3cy77p796v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:26 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4Osu32112922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:24 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B67E11C04A;
 Wed, 15 Dec 2021 17:04:24 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 228F511C058;
 Wed, 15 Dec 2021 17:04:24 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:24 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6D741220247;
 Wed, 15 Dec 2021 18:04:23 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 043/102] target/ppc: Update sqrt for new flags
Date: Wed, 15 Dec 2021 18:02:58 +0100
Message-Id: <20211215170357.321643-31-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CNA6YncjFhzZapNnhYrNtnAOQ4xPlQHY
X-Proofpoint-ORIG-GUID: CNA6YncjFhzZapNnhYrNtnAOQ4xPlQHY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1034 lowpriorityscore=0 malwarescore=0
 mlxlogscore=961 mlxscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Now that vxsqrt and vxsnan are computed directly by softfloat,
we don't need to recompute it.  Split out float_invalid_op_sqrt
to be used in several places.  This fixes VSX_SQRT, which did
not order its tests correctly to eliminate NaN with sign set.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-25-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 72 ++++++++++++++---------------------------
 1 file changed, 25 insertions(+), 47 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 870a861e36a2..08f7c8837e17 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -737,22 +737,24 @@ uint64_t helper_frsp(CPUPPCState *env, uint64_t arg=
)
     return do_frsp(env, arg, GETPC());
 }
=20
+static void float_invalid_op_sqrt(CPUPPCState *env, int flags,
+                                  bool set_fpcc, uintptr_t retaddr)
+{
+    if (unlikely(flags & float_flag_invalid_sqrt)) {
+        float_invalid_op_vxsqrt(env, set_fpcc, retaddr);
+    } else if (unlikely(flags & float_flag_invalid_snan)) {
+        float_invalid_op_vxsnan(env, retaddr);
+    }
+}
+
 /* fsqrt - fsqrt. */
 float64 helper_fsqrt(CPUPPCState *env, float64 arg)
 {
     float64 ret =3D float64_sqrt(arg, &env->fp_status);
-    int status =3D get_float_exception_flags(&env->fp_status);
+    int flags =3D get_float_exception_flags(&env->fp_status);
=20
-    if (unlikely(status & float_flag_invalid)) {
-        if (unlikely(float64_is_any_nan(arg))) {
-            if (unlikely(float64_is_signaling_nan(arg, &env->fp_status))=
) {
-                /* sNaN square root */
-                float_invalid_op_vxsnan(env, GETPC());
-            }
-        } else {
-            /* Square root of a negative nonzero number */
-            float_invalid_op_vxsqrt(env, 1, GETPC());
-        }
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_sqrt(env, flags, 1, GETPC());
     }
=20
     return ret;
@@ -807,22 +809,14 @@ float64 helper_frsqrte(CPUPPCState *env, float64 ar=
g)
     /* "Estimate" the reciprocal with actual division.  */
     float64 rets =3D float64_sqrt(arg, &env->fp_status);
     float64 retd =3D float64_div(float64_one, rets, &env->fp_status);
-    int status =3D get_float_exception_flags(&env->fp_status);
+    int flags =3D get_float_exception_flags(&env->fp_status);
=20
-    if (unlikely(status)) {
-        if (status & float_flag_invalid) {
-            if (float64_is_signaling_nan(arg, &env->fp_status)) {
-                /* sNaN reciprocal */
-                float_invalid_op_vxsnan(env, GETPC());
-            } else {
-                /* Square root of a negative nonzero number */
-                float_invalid_op_vxsqrt(env, 1, GETPC());
-            }
-        }
-        if (status & float_flag_divbyzero) {
-            /* Reciprocal of (square root of) zero.  */
-            float_zero_divide_excp(env, GETPC());
-        }
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_sqrt(env, flags, 1, GETPC());
+    }
+    if (unlikely(flags & float_flag_divbyzero)) {
+        /* Reciprocal of (square root of) zero.  */
+        float_zero_divide_excp(env, GETPC());
     }
=20
     return retd;
@@ -1884,11 +1878,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, =
ppc_vsr_t *xb)             \
         env->fp_status.float_exception_flags |=3D tstat.float_exception_=
flags; \
                                                                         =
     \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) =
{    \
-            if (tp##_is_neg(xb->fld) && !tp##_is_zero(xb->fld)) {       =
     \
-                float_invalid_op_vxsqrt(env, sfprf, GETPC());           =
     \
-            } else if (tp##_is_signaling_nan(xb->fld, &tstat)) {        =
     \
-                float_invalid_op_vxsnan(env, GETPC());                  =
     \
-            }                                                           =
     \
+            float_invalid_op_sqrt(env, tstat.float_exception_flags,     =
     \
+                                  sfprf, GETPC());                      =
     \
         }                                                               =
     \
                                                                         =
     \
         if (r2sp) {                                                     =
     \
@@ -1931,15 +1922,10 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,=
 ppc_vsr_t *xb)             \
         t.fld =3D tp##_sqrt(xb->fld, &tstat);                           =
       \
         t.fld =3D tp##_div(tp##_one, t.fld, &tstat);                    =
       \
         env->fp_status.float_exception_flags |=3D tstat.float_exception_=
flags; \
-                                                                        =
     \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) =
{    \
-            if (tp##_is_neg(xb->fld) && !tp##_is_zero(xb->fld)) {       =
     \
-                float_invalid_op_vxsqrt(env, sfprf, GETPC());           =
     \
-            } else if (tp##_is_signaling_nan(xb->fld, &tstat)) {        =
     \
-                float_invalid_op_vxsnan(env, GETPC());                  =
     \
-            }                                                           =
     \
+            float_invalid_op_sqrt(env, tstat.float_exception_flags,     =
     \
+                                  sfprf, GETPC());                      =
     \
         }                                                               =
     \
-                                                                        =
     \
         if (r2sp) {                                                     =
     \
             t.fld =3D do_frsp(env, t.fld, GETPC());                     =
       \
         }                                                               =
     \
@@ -3240,15 +3226,7 @@ void helper_xssqrtqp(CPUPPCState *env, uint32_t op=
code,
     env->fp_status.float_exception_flags |=3D tstat.float_exception_flag=
s;
=20
     if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {
-        if (float128_is_signaling_nan(xb->f128, &tstat)) {
-            float_invalid_op_vxsnan(env, GETPC());
-            t.f128 =3D float128_snan_to_qnan(xb->f128);
-        } else if (float128_is_quiet_nan(xb->f128, &tstat)) {
-            t.f128 =3D xb->f128;
-        } else if (float128_is_neg(xb->f128) && !float128_is_zero(xb->f1=
28)) {
-            float_invalid_op_vxsqrt(env, 1, GETPC());
-            t.f128 =3D float128_default_nan(&env->fp_status);
-        }
+        float_invalid_op_sqrt(env, tstat.float_exception_flags, 1, GETPC=
());
     }
=20
     helper_compute_fprf_float128(env, t.f128);
--=20
2.31.1


