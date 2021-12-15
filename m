Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6B647600A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:00:07 +0100 (CET)
Received: from localhost ([::1]:39392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYZR-0006Dz-JP
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:00:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXi4-0004XC-GM; Wed, 15 Dec 2021 12:04:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6154
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXi2-0004eB-82; Wed, 15 Dec 2021 12:04:56 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfdCX010137; 
 Wed, 15 Dec 2021 17:04:25 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cye11hthk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:24 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH42a0028826;
 Wed, 15 Dec 2021 17:04:23 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3cy7k375v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:23 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4K6o43123174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3978AE05A;
 Wed, 15 Dec 2021 17:04:20 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93DE3AE045;
 Wed, 15 Dec 2021 17:04:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:20 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DFCCB220295;
 Wed, 15 Dec 2021 18:04:19 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 038/102] target/ppc: Split out do_fmadd
Date: Wed, 15 Dec 2021 18:02:53 +0100
Message-Id: <20211215170357.321643-26-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4raYJI_4Tv4km9rvhQ48CoHvdKyzGn2J
X-Proofpoint-ORIG-GUID: 4raYJI_4Tv4km9rvhQ48CoHvdKyzGn2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1034
 adultscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 mlxlogscore=707 classifier=spam adjust=0 reason=mlx scancount=1
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

Create a common function for all of the madd helpers.
Let the compiler tail call or inline as it chooses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-20-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index f5d6bb4eba76..d7e0362e808e 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -693,23 +693,26 @@ static void float_invalid_op_madd(CPUPPCState *env,=
 int flags,
     }
 }
=20
-#define FPU_FMADD(op, madd_flags)                                       =
\
-uint64_t helper_##op(CPUPPCState *env, uint64_t arg1,                   =
\
-                     uint64_t arg2, uint64_t arg3)                      =
\
-{                                                                       =
\
-    uint32_t flags;                                                     =
\
-    float64 ret =3D float64_muladd(arg1, arg2, arg3, madd_flags,        =
  \
-                                 &env->fp_status);                      =
\
-    flags =3D get_float_exception_flags(&env->fp_status);               =
  \
-    if (flags) {                                                        =
\
-        if (flags & float_flag_invalid) {                               =
\
-            float_invalid_op_madd(env, flags, 1, GETPC());              =
\
-        }                                                               =
\
-        do_float_check_status(env, GETPC());                            =
\
-    }                                                                   =
\
-    return ret;                                                         =
\
+static float64 do_fmadd(CPUPPCState *env, float64 a, float64 b,
+                         float64 c, int madd_flags, uintptr_t retaddr)
+{
+    float64 ret =3D float64_muladd(a, b, c, madd_flags, &env->fp_status)=
;
+    int flags =3D get_float_exception_flags(&env->fp_status);
+
+    if (flags) {
+        if (flags & float_flag_invalid) {
+            float_invalid_op_madd(env, flags, 1, retaddr);
+        }
+        do_float_check_status(env, retaddr);
+    }
+    return ret;
 }
=20
+#define FPU_FMADD(op, madd_flags)                                    \
+    uint64_t helper_##op(CPUPPCState *env, uint64_t arg1,            \
+                         uint64_t arg2, uint64_t arg3)               \
+    { return do_fmadd(env, arg1, arg2, arg3, madd_flags, GETPC()); }
+
 #define MADD_FLGS 0
 #define MSUB_FLGS float_muladd_negate_c
 #define NMADD_FLGS float_muladd_negate_result
--=20
2.31.1


