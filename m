Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DD4476072
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:15:31 +0100 (CET)
Received: from localhost ([::1]:53528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYoM-0001ty-Nh
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:15:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiB-0004dM-Dq; Wed, 15 Dec 2021 12:05:03 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXi9-0004h1-8o; Wed, 15 Dec 2021 12:05:03 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfavQ010484; 
 Wed, 15 Dec 2021 17:04:36 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cye72snvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:35 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3DoT004159;
 Wed, 15 Dec 2021 17:04:33 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3cy77p797m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:33 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BFH4UVm43909438
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:31 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA8BAA4040;
 Wed, 15 Dec 2021 17:04:30 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A06FAA4053;
 Wed, 15 Dec 2021 17:04:30 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:30 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DBF30220247;
 Wed, 15 Dec 2021 18:04:29 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 053/102] target/ppc: Use helper_todouble/tosingle in
 helper_xststdcsp
Date: Wed, 15 Dec 2021 18:03:08 +0100
Message-Id: <20211215170357.321643-41-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mBU4nctfDzu8lOaB3WcYyFxRUtGw0slR
X-Proofpoint-ORIG-GUID: mBU4nctfDzu8lOaB3WcYyFxRUtGw0slR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 bulkscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxlogscore=425
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
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

When computing the predicate "is this value currently formatted
for single precision", we do not want to round the value according
to the current rounding mode, nor perform a floating-point equality.
We want to see if the N bits that make up single-precision are the
only ones set within the register, and then a bitwise equality.

Fixes a bug in which a single-precision NaN is considered !SP,
because float64_eq(nan, nan) is always false.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-35-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index c955b20739ac..1e9a16154036 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -3163,26 +3163,25 @@ void helper_xststdcsp(CPUPPCState *env, uint32_t =
opcode, ppc_vsr_t *xb)
 {
     uint32_t dcmx, sign, exp;
     uint32_t cc, match =3D 0, not_sp =3D 0;
+    float64 arg =3D xb->VsrD(0);
+    float64 arg_sp;
=20
     dcmx =3D DCMX(opcode);
-    exp =3D (xb->VsrD(0) >> 52) & 0x7FF;
+    exp =3D (arg >> 52) & 0x7FF;
+    sign =3D float64_is_neg(arg);
=20
-    sign =3D float64_is_neg(xb->VsrD(0));
-    if (float64_is_any_nan(xb->VsrD(0))) {
+    if (float64_is_any_nan(arg)) {
         match =3D extract32(dcmx, 6, 1);
-    } else if (float64_is_infinity(xb->VsrD(0))) {
+    } else if (float64_is_infinity(arg)) {
         match =3D extract32(dcmx, 4 + !sign, 1);
-    } else if (float64_is_zero(xb->VsrD(0))) {
+    } else if (float64_is_zero(arg)) {
         match =3D extract32(dcmx, 2 + !sign, 1);
-    } else if (float64_is_zero_or_denormal(xb->VsrD(0)) ||
-               (exp > 0 && exp < 0x381)) {
+    } else if (float64_is_zero_or_denormal(arg) || (exp > 0 && exp < 0x3=
81)) {
         match =3D extract32(dcmx, 0 + !sign, 1);
     }
=20
-    not_sp =3D !float64_eq(xb->VsrD(0),
-                         float32_to_float64(
-                             float64_to_float32(xb->VsrD(0), &env->fp_st=
atus),
-                             &env->fp_status), &env->fp_status);
+    arg_sp =3D helper_todouble(helper_tosingle(arg));
+    not_sp =3D arg !=3D arg_sp;
=20
     cc =3D sign << CRF_LT_BIT | match << CRF_EQ_BIT | not_sp << CRF_SO_B=
IT;
     env->fpscr &=3D ~FP_FPCC;
--=20
2.31.1


