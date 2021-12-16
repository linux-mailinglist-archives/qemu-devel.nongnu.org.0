Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AEB477FC2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 23:03:23 +0100 (CET)
Received: from localhost ([::1]:56588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxyqQ-0001mK-OB
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 17:03:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLb-0002sy-Nu; Thu, 16 Dec 2021 15:27:27 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:9378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLV-0007PP-90; Thu, 16 Dec 2021 15:27:27 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGK3LqQ025642; 
 Thu, 16 Dec 2021 20:26:51 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyn1k71r5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:50 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKCWrW010867;
 Thu, 16 Dec 2021 20:26:48 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3cy78hj77v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:48 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BGKQkop35652038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECB37A4054;
 Thu, 16 Dec 2021 20:26:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B30A7A405B;
 Thu, 16 Dec 2021 20:26:45 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:45 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 14AE1220238;
 Thu, 16 Dec 2021 21:26:45 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 043/101] target/ppc: Update sqrt for new flags
Date: Thu, 16 Dec 2021 21:25:16 +0100
Message-Id: <20211216202614.414266-44-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2-F5fYUcglKj6csWNu7pSZgbA7Api5gC
X-Proofpoint-GUID: 2-F5fYUcglKj6csWNu7pSZgbA7Api5gC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=950
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1034 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0
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


