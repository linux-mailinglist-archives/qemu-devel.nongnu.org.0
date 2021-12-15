Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C12475FA1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:45:56 +0100 (CET)
Received: from localhost ([::1]:53690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYLj-0002mp-VR
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:45:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhX-0003G6-2y; Wed, 15 Dec 2021 12:04:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhU-0004YV-C5; Wed, 15 Dec 2021 12:04:22 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfbgK012955; 
 Wed, 15 Dec 2021 17:04:17 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyjgfk6a9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:17 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3TX7013442;
 Wed, 15 Dec 2021 17:04:15 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3cy7sjf2tk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:15 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4CDq42402150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:12 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FAE0A4040;
 Wed, 15 Dec 2021 17:04:12 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 145D3A405B;
 Wed, 15 Dec 2021 17:04:12 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:12 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5F6FE220247;
 Wed, 15 Dec 2021 18:04:11 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 025/102] softfloat: Add flag specific to convert non-nan to int
Date: Wed, 15 Dec 2021 18:02:40 +0100
Message-Id: <20211215170357.321643-13-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JoOi75M4yshziQlUtnfEZgrHdpSf0lr0
X-Proofpoint-ORIG-GUID: JoOi75M4yshziQlUtnfEZgrHdpSf0lr0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1034 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=804
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Message-Id: <20211119160502.17432-7-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/fpu/softfloat-types.h |  1 +
 fpu/softfloat-parts.c.inc     | 14 +++++++-------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.=
h
index 33224b5f227d..9ca50e930b8d 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -157,6 +157,7 @@ enum {
     float_flag_invalid_idi     =3D 0x0200,  /* inf / inf */
     float_flag_invalid_zdz     =3D 0x0400,  /* 0 / 0 */
     float_flag_invalid_sqrt    =3D 0x0800,  /* sqrt(-x) */
+    float_flag_invalid_cvti    =3D 0x1000,  /* non-nan to integer */
 };
=20
 /*
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index cc8c2c3aee1a..ce580347dda6 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1055,7 +1055,7 @@ static int64_t partsN(float_to_sint)(FloatPartsN *p=
, FloatRoundMode rmode,
         break;
=20
     case float_class_inf:
-        flags =3D float_flag_invalid;
+        flags =3D float_flag_invalid | float_flag_invalid_cvti;
         r =3D p->sign ? min : max;
         break;
=20
@@ -1077,11 +1077,11 @@ static int64_t partsN(float_to_sint)(FloatPartsN =
*p, FloatRoundMode rmode,
             if (r <=3D -(uint64_t)min) {
                 r =3D -r;
             } else {
-                flags =3D float_flag_invalid;
+                flags =3D float_flag_invalid | float_flag_invalid_cvti;
                 r =3D min;
             }
         } else if (r > max) {
-            flags =3D float_flag_invalid;
+            flags =3D float_flag_invalid | float_flag_invalid_cvti;
             r =3D max;
         }
         break;
@@ -1120,7 +1120,7 @@ static uint64_t partsN(float_to_uint)(FloatPartsN *=
p, FloatRoundMode rmode,
         break;
=20
     case float_class_inf:
-        flags =3D float_flag_invalid;
+        flags =3D float_flag_invalid | float_flag_invalid_cvti;
         r =3D p->sign ? 0 : max;
         break;
=20
@@ -1138,15 +1138,15 @@ static uint64_t partsN(float_to_uint)(FloatPartsN=
 *p, FloatRoundMode rmode,
         }
=20
         if (p->sign) {
-            flags =3D float_flag_invalid;
+            flags =3D float_flag_invalid | float_flag_invalid_cvti;
             r =3D 0;
         } else if (p->exp > DECOMPOSED_BINARY_POINT) {
-            flags =3D float_flag_invalid;
+            flags =3D float_flag_invalid | float_flag_invalid_cvti;
             r =3D max;
         } else {
             r =3D p->frac_hi >> (DECOMPOSED_BINARY_POINT - p->exp);
             if (r > max) {
-                flags =3D float_flag_invalid;
+                flags =3D float_flag_invalid | float_flag_invalid_cvti;
                 r =3D max;
             }
         }
--=20
2.31.1


