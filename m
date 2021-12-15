Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258AF475F67
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:34:44 +0100 (CET)
Received: from localhost ([::1]:47336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYAs-0004QM-7z
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:34:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhX-0003H4-Sy; Wed, 15 Dec 2021 12:04:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26262
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhU-0004Ym-PZ; Wed, 15 Dec 2021 12:04:23 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfa3t009637; 
 Wed, 15 Dec 2021 17:04:17 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cye11htfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:17 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH2kdb004386;
 Wed, 15 Dec 2021 17:04:16 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3cy7jqyfbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:15 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BFGuERO20775404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 16:56:14 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FB7911C05B;
 Wed, 15 Dec 2021 17:04:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5693A11C070;
 Wed, 15 Dec 2021 17:04:13 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:13 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A0BBD220247;
 Wed, 15 Dec 2021 18:04:12 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 027/102] target/ppc: Update float_invalid_op_addsub for new
 flags
Date: Wed, 15 Dec 2021 18:02:42 +0100
Message-Id: <20211215170357.321643-15-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MTzCbDHyONrFlpjJpmmKUNUxaWipjpcq
X-Proofpoint-ORIG-GUID: MTzCbDHyONrFlpjJpmmKUNUxaWipjpcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1034
 adultscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 mlxlogscore=796 classifier=spam adjust=0 reason=mlx scancount=1
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

Now that vxisi and vxsnan are computed directly by
softfloat, we don't need to recompute it via classes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-9-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 38 ++++++++++++++------------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index bb72715827c3..d8ad0250bccd 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -498,13 +498,12 @@ void helper_reset_fpstatus(CPUPPCState *env)
     set_float_exception_flags(0, &env->fp_status);
 }
=20
-static void float_invalid_op_addsub(CPUPPCState *env, bool set_fpcc,
-                                    uintptr_t retaddr, int classes)
+static void float_invalid_op_addsub(CPUPPCState *env, int flags,
+                                    bool set_fpcc, uintptr_t retaddr)
 {
-    if ((classes & ~is_neg) =3D=3D is_inf) {
-        /* Magnitude subtraction of infinities */
+    if (flags & float_flag_invalid_isi) {
         float_invalid_op_vxisi(env, set_fpcc, retaddr);
-    } else if (classes & is_snan) {
+    } else if (flags & float_flag_invalid_snan) {
         float_invalid_op_vxsnan(env, retaddr);
     }
 }
@@ -513,12 +512,10 @@ static void float_invalid_op_addsub(CPUPPCState *en=
v, bool set_fpcc,
 float64 helper_fadd(CPUPPCState *env, float64 arg1, float64 arg2)
 {
     float64 ret =3D float64_add(arg1, arg2, &env->fp_status);
-    int status =3D get_float_exception_flags(&env->fp_status);
+    int flags =3D get_float_exception_flags(&env->fp_status);
=20
-    if (unlikely(status & float_flag_invalid)) {
-        float_invalid_op_addsub(env, 1, GETPC(),
-                                float64_classify(arg1) |
-                                float64_classify(arg2));
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_addsub(env, flags, 1, GETPC());
     }
=20
     return ret;
@@ -528,12 +525,10 @@ float64 helper_fadd(CPUPPCState *env, float64 arg1,=
 float64 arg2)
 float64 helper_fsub(CPUPPCState *env, float64 arg1, float64 arg2)
 {
     float64 ret =3D float64_sub(arg1, arg2, &env->fp_status);
-    int status =3D get_float_exception_flags(&env->fp_status);
+    int flags =3D get_float_exception_flags(&env->fp_status);
=20
-    if (unlikely(status & float_flag_invalid)) {
-        float_invalid_op_addsub(env, 1, GETPC(),
-                                float64_classify(arg1) |
-                                float64_classify(arg2));
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_addsub(env, flags, 1, GETPC());
     }
=20
     return ret;
@@ -1664,9 +1659,8 @@ void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,=
                          \
         env->fp_status.float_exception_flags |=3D tstat.float_exception_=
flags; \
                                                                         =
     \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) =
{    \
-            float_invalid_op_addsub(env, sfprf, GETPC(),                =
     \
-                                    tp##_classify(xa->fld) |            =
     \
-                                    tp##_classify(xb->fld));            =
     \
+            float_invalid_op_addsub(env, tstat.float_exception_flags,   =
     \
+                                    sfprf, GETPC());                    =
     \
         }                                                               =
     \
                                                                         =
     \
         if (r2sp) {                                                     =
     \
@@ -1708,9 +1702,7 @@ void helper_xsaddqp(CPUPPCState *env, uint32_t opco=
de,
     env->fp_status.float_exception_flags |=3D tstat.float_exception_flag=
s;
=20
     if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {
-        float_invalid_op_addsub(env, 1, GETPC(),
-                                float128_classify(xa->f128) |
-                                float128_classify(xb->f128));
+        float_invalid_op_addsub(env, tstat.float_exception_flags, 1, GET=
PC());
     }
=20
     helper_compute_fprf_float128(env, t.f128);
@@ -3326,9 +3318,7 @@ void helper_xssubqp(CPUPPCState *env, uint32_t opco=
de,
     env->fp_status.float_exception_flags |=3D tstat.float_exception_flag=
s;
=20
     if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {
-        float_invalid_op_addsub(env, 1, GETPC(),
-                                float128_classify(xa->f128) |
-                                float128_classify(xb->f128));
+        float_invalid_op_addsub(env, tstat.float_exception_flags, 1, GET=
PC());
     }
=20
     helper_compute_fprf_float128(env, t.f128);
--=20
2.31.1


