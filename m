Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1C6475F86
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:40:34 +0100 (CET)
Received: from localhost ([::1]:36732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYGW-00082Z-Re
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:40:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhh-0003hk-W4; Wed, 15 Dec 2021 12:04:34 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhg-0004dQ-0j; Wed, 15 Dec 2021 12:04:33 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGj2XP016609; 
 Wed, 15 Dec 2021 17:04:14 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cx9rb70um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:14 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH465m000965;
 Wed, 15 Dec 2021 17:04:12 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3cy7k975q8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:11 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BFGu94r43712946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 16:56:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 221484C040;
 Wed, 15 Dec 2021 17:04:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D51254C046;
 Wed, 15 Dec 2021 17:04:08 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:08 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1523B220295;
 Wed, 15 Dec 2021 18:04:08 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 020/102] softfloat: Extend float_exception_flags to 16 bits
Date: Wed, 15 Dec 2021 18:02:35 +0100
Message-Id: <20211215170357.321643-8-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GK4iO9RFsY-Pli-k5mmih0XIWcRGUPvT
X-Proofpoint-GUID: GK4iO9RFsY-Pli-k5mmih0XIWcRGUPvT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1034
 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=592 mlxscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We will shortly have more than 8 bits of exceptions.
Repack the existing flags into low bits and reformat to hex.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20211119160502.17432-2-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/fpu/softfloat-types.h | 16 ++++++++--------
 include/fpu/softfloat.h       |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.=
h
index 5bcbd041f74f..65a43aff5970 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -145,13 +145,13 @@ typedef enum __attribute__((__packed__)) {
  */
=20
 enum {
-    float_flag_invalid   =3D  1,
-    float_flag_divbyzero =3D  4,
-    float_flag_overflow  =3D  8,
-    float_flag_underflow =3D 16,
-    float_flag_inexact   =3D 32,
-    float_flag_input_denormal =3D 64,
-    float_flag_output_denormal =3D 128
+    float_flag_invalid         =3D 0x0001,
+    float_flag_divbyzero       =3D 0x0002,
+    float_flag_overflow        =3D 0x0004,
+    float_flag_underflow       =3D 0x0008,
+    float_flag_inexact         =3D 0x0010,
+    float_flag_input_denormal  =3D 0x0020,
+    float_flag_output_denormal =3D 0x0040,
 };
=20
 /*
@@ -171,8 +171,8 @@ typedef enum __attribute__((__packed__)) {
  */
=20
 typedef struct float_status {
+    uint16_t float_exception_flags;
     FloatRoundMode float_rounding_mode;
-    uint8_t     float_exception_flags;
     FloatX80RoundPrec floatx80_rounding_precision;
     bool tininess_before_rounding;
     /* should denormalised results go to zero and set the inexact flag? =
*/
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index a249991e6127..0d3b40780762 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -100,7 +100,7 @@ typedef enum {
 | Routine to raise any or all of the software IEC/IEEE floating-point
 | exception flags.
 *-----------------------------------------------------------------------=
-----*/
-static inline void float_raise(uint8_t flags, float_status *status)
+static inline void float_raise(uint16_t flags, float_status *status)
 {
     status->float_exception_flags |=3D flags;
 }
--=20
2.31.1


