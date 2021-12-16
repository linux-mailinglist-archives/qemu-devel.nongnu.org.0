Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6275477DE6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 21:53:37 +0100 (CET)
Received: from localhost ([::1]:51392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxxku-0003CY-Dj
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 15:53:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKw-0001GA-30; Thu, 16 Dec 2021 15:26:46 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKt-0007KE-GT; Thu, 16 Dec 2021 15:26:45 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGIk0BO017626; 
 Thu, 16 Dec 2021 20:26:38 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cynfwpbx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:38 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKBiaZ016023;
 Thu, 16 Dec 2021 20:26:35 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3cy7qwatbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:35 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKQXZh39911720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:33 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60CFC5204F;
 Thu, 16 Dec 2021 20:26:33 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 2812A52051;
 Thu, 16 Dec 2021 20:26:33 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 86054220238;
 Thu, 16 Dec 2021 21:26:32 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 023/101] softfloat: Add flags specific to Inf / Inf and 0 / 0
Date: Thu, 16 Dec 2021 21:24:56 +0100
Message-Id: <20211216202614.414266-24-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rsc_PMq91VWYvRmvWK1HPHg_0XlOHtoe
X-Proofpoint-ORIG-GUID: rsc_PMq91VWYvRmvWK1HPHg_0XlOHtoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=718 malwarescore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112160109
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

PowerPC has these flags, and it's easier to compute them here
than after the fact.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-5-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/fpu/softfloat-types.h |  2 ++
 fpu/softfloat-parts.c.inc     | 16 +++++++++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.=
h
index 56b4cf783544..5a9671e564c6 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -154,6 +154,8 @@ enum {
     float_flag_output_denormal =3D 0x0040,
     float_flag_invalid_isi     =3D 0x0080,  /* inf - inf */
     float_flag_invalid_imz     =3D 0x0100,  /* inf * 0 */
+    float_flag_invalid_idi     =3D 0x0200,  /* inf / inf */
+    float_flag_invalid_zdz     =3D 0x0400,  /* 0 / 0 */
 };
=20
 /*
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 3ed793347b18..b8563cd2df8d 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -590,11 +590,13 @@ static FloatPartsN *partsN(div)(FloatPartsN *a, Flo=
atPartsN *b,
     }
=20
     /* 0/0 or Inf/Inf =3D> NaN */
-    if (unlikely(ab_mask =3D=3D float_cmask_zero) ||
-        unlikely(ab_mask =3D=3D float_cmask_inf)) {
-        float_raise(float_flag_invalid, s);
-        parts_default_nan(a, s);
-        return a;
+    if (unlikely(ab_mask =3D=3D float_cmask_zero)) {
+        float_raise(float_flag_invalid | float_flag_invalid_zdz, s);
+        goto d_nan;
+    }
+    if (unlikely(ab_mask =3D=3D float_cmask_inf)) {
+        float_raise(float_flag_invalid | float_flag_invalid_idi, s);
+        goto d_nan;
     }
=20
     /* All the NaN cases */
@@ -625,6 +627,10 @@ static FloatPartsN *partsN(div)(FloatPartsN *a, Floa=
tPartsN *b,
     float_raise(float_flag_divbyzero, s);
     a->cls =3D float_class_inf;
     return a;
+
+ d_nan:
+    parts_default_nan(a, s);
+    return a;
 }
=20
 /*
--=20
2.31.1


