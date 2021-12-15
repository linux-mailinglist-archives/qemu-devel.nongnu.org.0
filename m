Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DF6475E91
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:25:04 +0100 (CET)
Received: from localhost ([::1]:45910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxY1X-00015h-Ip
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:25:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhc-0003UH-2o; Wed, 15 Dec 2021 12:04:28 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:9004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXha-0004ay-D6; Wed, 15 Dec 2021 12:04:27 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGkn1W033112; 
 Wed, 15 Dec 2021 17:04:16 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyjdw34sc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:15 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH2cVj010794;
 Wed, 15 Dec 2021 17:04:13 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3cy7vvf1m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4A8u41746688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:10 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6458511C058;
 Wed, 15 Dec 2021 17:04:10 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BBD911C04C;
 Wed, 15 Dec 2021 17:04:10 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:10 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 7144B220295;
 Wed, 15 Dec 2021 18:04:09 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 022/102] softfloat: Add flag specific to Inf * 0
Date: Wed, 15 Dec 2021 18:02:37 +0100
Message-Id: <20211215170357.321643-10-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NjTt4WLr_tCq1tbcoxPE_qIaKTCBPa7-
X-Proofpoint-ORIG-GUID: NjTt4WLr_tCq1tbcoxPE_qIaKTCBPa7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1034 mlxscore=0 priorityscore=1501 mlxlogscore=895 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150098
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

PowerPC has this flag, and it's easier to compute it here
than after the fact.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-4-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/fpu/softfloat-types.h  |  1 +
 fpu/softfloat-parts.c.inc      |  4 ++--
 fpu/softfloat-specialize.c.inc | 12 ++++++------
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.=
h
index eaa12e1e0033..56b4cf783544 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -153,6 +153,7 @@ enum {
     float_flag_input_denormal  =3D 0x0020,
     float_flag_output_denormal =3D 0x0040,
     float_flag_invalid_isi     =3D 0x0080,  /* inf - inf */
+    float_flag_invalid_imz     =3D 0x0100,  /* inf * 0 */
 };
=20
 /*
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index eb2b475ca466..3ed793347b18 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -423,7 +423,7 @@ static FloatPartsN *partsN(mul)(FloatPartsN *a, Float=
PartsN *b,
=20
     /* Inf * Zero =3D=3D NaN */
     if (unlikely(ab_mask =3D=3D float_cmask_infzero)) {
-        float_raise(float_flag_invalid, s);
+        float_raise(float_flag_invalid | float_flag_invalid_imz, s);
         parts_default_nan(a, s);
         return a;
     }
@@ -489,6 +489,7 @@ static FloatPartsN *partsN(muladd)(FloatPartsN *a, Fl=
oatPartsN *b,
=20
     if (unlikely(ab_mask !=3D float_cmask_normal)) {
         if (unlikely(ab_mask =3D=3D float_cmask_infzero)) {
+            float_raise(float_flag_invalid | float_flag_invalid_imz, s);
             goto d_nan;
         }
=20
@@ -567,7 +568,6 @@ static FloatPartsN *partsN(muladd)(FloatPartsN *a, Fl=
oatPartsN *b,
     goto finish_sign;
=20
  d_nan:
-    float_raise(float_flag_invalid, s);
     parts_default_nan(a, s);
     return a;
 }
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.=
inc
index f2ad0f335e63..943e3301d209 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -506,7 +506,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass=
 b_cls, FloatClass c_cls,
      * the default NaN
      */
     if (infzero && is_qnan(c_cls)) {
-        float_raise(float_flag_invalid, status);
+        float_raise(float_flag_invalid | float_flag_invalid_imz, status)=
;
         return 3;
     }
=20
@@ -533,7 +533,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass=
 b_cls, FloatClass c_cls,
          * case sets InvalidOp and returns the default NaN
          */
         if (infzero) {
-            float_raise(float_flag_invalid, status);
+            float_raise(float_flag_invalid | float_flag_invalid_imz, sta=
tus);
             return 3;
         }
         /* Prefer sNaN over qNaN, in the a, b, c order. */
@@ -556,7 +556,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass=
 b_cls, FloatClass c_cls,
          * case sets InvalidOp and returns the input value 'c'
          */
         if (infzero) {
-            float_raise(float_flag_invalid, status);
+            float_raise(float_flag_invalid | float_flag_invalid_imz, sta=
tus);
             return 2;
         }
         /* Prefer sNaN over qNaN, in the c, a, b order. */
@@ -580,7 +580,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass=
 b_cls, FloatClass c_cls,
      * a default NaN
      */
     if (infzero) {
-        float_raise(float_flag_invalid, status);
+        float_raise(float_flag_invalid | float_flag_invalid_imz, status)=
;
         return 2;
     }
=20
@@ -597,7 +597,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass=
 b_cls, FloatClass c_cls,
 #elif defined(TARGET_RISCV)
     /* For RISC-V, InvalidOp is set when multiplicands are Inf and zero =
*/
     if (infzero) {
-        float_raise(float_flag_invalid, status);
+        float_raise(float_flag_invalid | float_flag_invalid_imz, status)=
;
     }
     return 3; /* default NaN */
 #elif defined(TARGET_XTENSA)
@@ -606,7 +606,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass=
 b_cls, FloatClass c_cls,
      * an input NaN if we have one (ie c).
      */
     if (infzero) {
-        float_raise(float_flag_invalid, status);
+        float_raise(float_flag_invalid | float_flag_invalid_imz, status)=
;
         return 2;
     }
     if (status->use_first_nan) {
--=20
2.31.1


