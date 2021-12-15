Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B933476006
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:58:12 +0100 (CET)
Received: from localhost ([::1]:35638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYXb-0003VJ-Bh
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:58:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhx-0004O7-Me; Wed, 15 Dec 2021 12:04:49 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53924
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhv-0004c0-TO; Wed, 15 Dec 2021 12:04:49 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfb5S020535; 
 Wed, 15 Dec 2021 17:04:19 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cyhyk42qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:19 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3w6p024495;
 Wed, 15 Dec 2021 17:04:17 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3cy78h78sx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:17 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4EQr41812362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:15 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB0E44C04A;
 Wed, 15 Dec 2021 17:04:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0C054C058;
 Wed, 15 Dec 2021 17:04:14 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:14 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E9182220247;
 Wed, 15 Dec 2021 18:04:13 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 029/102] target/ppc: Update float_invalid_op_div for new flags
Date: Wed, 15 Dec 2021 18:02:44 +0100
Message-Id: <20211215170357.321643-17-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k-_kEXwFHpS3p9hIi8uiQiAWOM7AOQPw
X-Proofpoint-ORIG-GUID: k-_kEXwFHpS3p9hIi8uiQiAWOM7AOQPw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 bulkscore=0
 mlxlogscore=741 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Now that vxidi, vxzdz, and vxsnan are computed directly by
softfloat, we don't need to recompute it via classes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-11-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 38 ++++++++++++++------------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index f02bb3a4afd8..9bcd7abd165f 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -557,17 +557,14 @@ float64 helper_fmul(CPUPPCState *env, float64 arg1,=
 float64 arg2)
     return ret;
 }
=20
-static void float_invalid_op_div(CPUPPCState *env, bool set_fprc,
-                                 uintptr_t retaddr, int classes)
+static void float_invalid_op_div(CPUPPCState *env, int flags,
+                                 bool set_fprc, uintptr_t retaddr)
 {
-    classes &=3D ~is_neg;
-    if (classes =3D=3D is_inf) {
-        /* Division of infinity by infinity */
+    if (flags & float_flag_invalid_idi) {
         float_invalid_op_vxidi(env, set_fprc, retaddr);
-    } else if (classes =3D=3D is_zero) {
-        /* Division of zero by zero */
+    } else if (flags & float_flag_invalid_zdz) {
         float_invalid_op_vxzdz(env, set_fprc, retaddr);
-    } else if (classes & is_snan) {
+    } else if (flags & float_flag_invalid_snan) {
         float_invalid_op_vxsnan(env, retaddr);
     }
 }
@@ -576,17 +573,13 @@ static void float_invalid_op_div(CPUPPCState *env, =
bool set_fprc,
 float64 helper_fdiv(CPUPPCState *env, float64 arg1, float64 arg2)
 {
     float64 ret =3D float64_div(arg1, arg2, &env->fp_status);
-    int status =3D get_float_exception_flags(&env->fp_status);
+    int flags =3D get_float_exception_flags(&env->fp_status);
=20
-    if (unlikely(status)) {
-        if (status & float_flag_invalid) {
-            float_invalid_op_div(env, 1, GETPC(),
-                                 float64_classify(arg1) |
-                                 float64_classify(arg2));
-        }
-        if (status & float_flag_divbyzero) {
-            float_zero_divide_excp(env, GETPC());
-        }
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_div(env, flags, 1, GETPC());
+    }
+    if (unlikely(flags & float_flag_divbyzero)) {
+        float_zero_divide_excp(env, GETPC());
     }
=20
     return ret;
@@ -1803,9 +1796,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,  =
                           \
         env->fp_status.float_exception_flags |=3D tstat.float_exception_=
flags;  \
                                                                         =
      \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) =
{     \
-            float_invalid_op_div(env, sfprf, GETPC(),                   =
      \
-                                 tp##_classify(xa->fld) |               =
      \
-                                 tp##_classify(xb->fld));               =
      \
+            float_invalid_op_div(env, tstat.float_exception_flags,      =
      \
+                                 sfprf, GETPC());                       =
      \
         }                                                               =
      \
         if (unlikely(tstat.float_exception_flags & float_flag_divbyzero)=
) {   \
             float_zero_divide_excp(env, GETPC());                       =
      \
@@ -1846,9 +1838,7 @@ void helper_xsdivqp(CPUPPCState *env, uint32_t opco=
de,
     env->fp_status.float_exception_flags |=3D tstat.float_exception_flag=
s;
=20
     if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {
-        float_invalid_op_div(env, 1, GETPC(),
-                             float128_classify(xa->f128) |
-                             float128_classify(xb->f128));
+        float_invalid_op_div(env, tstat.float_exception_flags, 1, GETPC(=
));
     }
     if (unlikely(tstat.float_exception_flags & float_flag_divbyzero)) {
         float_zero_divide_excp(env, GETPC());
--=20
2.31.1


