Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D30475F8B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:43:06 +0100 (CET)
Received: from localhost ([::1]:44102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYIz-0004fw-CI
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:43:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhW-0003Eb-2s; Wed, 15 Dec 2021 12:04:22 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20848
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhU-0004YX-AW; Wed, 15 Dec 2021 12:04:21 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfaeL009731; 
 Wed, 15 Dec 2021 17:04:17 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cye11htfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:17 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH2inv024823;
 Wed, 15 Dec 2021 17:04:15 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3cy78e7kt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:15 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4DV222937960
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:13 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB03342041;
 Wed, 15 Dec 2021 17:04:12 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFF8B42047;
 Wed, 15 Dec 2021 17:04:12 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:12 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 04AFE220295;
 Wed, 15 Dec 2021 18:04:11 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 026/102] softfloat: Add flag specific to signaling nans
Date: Wed, 15 Dec 2021 18:02:41 +0100
Message-Id: <20211215170357.321643-14-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: r7EWDV6_DseTjByJc5C4_7Ty7twWv5S9
X-Proofpoint-ORIG-GUID: r7EWDV6_DseTjByJc5C4_7Ty7twWv5S9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1034
 adultscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 mlxlogscore=952 classifier=spam adjust=0 reason=mlx scancount=1
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

PowerPC has this flag, and it's easier to compute it here
than after the fact.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-8-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/fpu/softfloat-types.h |  1 +
 fpu/softfloat.c               |  4 +++-
 fpu/softfloat-parts.c.inc     | 18 ++++++++++++------
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.=
h
index 9ca50e930b8d..8abd9ab4ec9c 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -158,6 +158,7 @@ enum {
     float_flag_invalid_zdz     =3D 0x0400,  /* 0 / 0 */
     float_flag_invalid_sqrt    =3D 0x0800,  /* sqrt(-x) */
     float_flag_invalid_cvti    =3D 0x1000,  /* non-nan to integer */
+    float_flag_invalid_snan    =3D 0x2000,  /* any operand was snan */
 };
=20
 /*
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 9a28720d82a5..834ed3a054f7 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2543,8 +2543,10 @@ floatx80 floatx80_mod(floatx80 a, floatx80 b, floa=
t_status *status)
 static void parts_float_to_ahp(FloatParts64 *a, float_status *s)
 {
     switch (a->cls) {
-    case float_class_qnan:
     case float_class_snan:
+        float_raise(float_flag_invalid_snan, s);
+        /* fall through */
+    case float_class_qnan:
         /*
          * There is no NaN in the destination format.  Raise Invalid
          * and return a zero with the sign of the input NaN.
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index ce580347dda6..db3e1f393dfb 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -19,7 +19,7 @@ static void partsN(return_nan)(FloatPartsN *a, float_st=
atus *s)
 {
     switch (a->cls) {
     case float_class_snan:
-        float_raise(float_flag_invalid, s);
+        float_raise(float_flag_invalid | float_flag_invalid_snan, s);
         if (s->default_nan_mode) {
             parts_default_nan(a, s);
         } else {
@@ -40,7 +40,7 @@ static FloatPartsN *partsN(pick_nan)(FloatPartsN *a, Fl=
oatPartsN *b,
                                      float_status *s)
 {
     if (is_snan(a->cls) || is_snan(b->cls)) {
-        float_raise(float_flag_invalid, s);
+        float_raise(float_flag_invalid | float_flag_invalid_snan, s);
     }
=20
     if (s->default_nan_mode) {
@@ -68,7 +68,7 @@ static FloatPartsN *partsN(pick_nan_muladd)(FloatPartsN=
 *a, FloatPartsN *b,
     int which;
=20
     if (unlikely(abc_mask & float_cmask_snan)) {
-        float_raise(float_flag_invalid, s);
+        float_raise(float_flag_invalid | float_flag_invalid_snan, s);
     }
=20
     which =3D pickNaNMulAdd(a->cls, b->cls, c->cls,
@@ -1049,8 +1049,10 @@ static int64_t partsN(float_to_sint)(FloatPartsN *=
p, FloatRoundMode rmode,
=20
     switch (p->cls) {
     case float_class_snan:
+        flags |=3D float_flag_invalid_snan;
+        /* fall through */
     case float_class_qnan:
-        flags =3D float_flag_invalid;
+        flags |=3D float_flag_invalid;
         r =3D max;
         break;
=20
@@ -1114,8 +1116,10 @@ static uint64_t partsN(float_to_uint)(FloatPartsN =
*p, FloatRoundMode rmode,
=20
     switch (p->cls) {
     case float_class_snan:
+        flags |=3D float_flag_invalid_snan;
+        /* fall through */
     case float_class_qnan:
-        flags =3D float_flag_invalid;
+        flags |=3D float_flag_invalid;
         r =3D max;
         break;
=20
@@ -1341,7 +1345,9 @@ static FloatRelation partsN(compare)(FloatPartsN *a=
, FloatPartsN *b,
     }
=20
     if (unlikely(ab_mask & float_cmask_anynan)) {
-        if (!is_quiet || (ab_mask & float_cmask_snan)) {
+        if (ab_mask & float_cmask_snan) {
+            float_raise(float_flag_invalid | float_flag_invalid_snan, s)=
;
+        } else if (!is_quiet) {
             float_raise(float_flag_invalid, s);
         }
         return float_relation_unordered;
--=20
2.31.1


