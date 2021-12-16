Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D966477FEE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 23:13:43 +0100 (CET)
Received: from localhost ([::1]:47954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxz0Q-0006t7-6D
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 17:13:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLg-00038Z-Ea; Thu, 16 Dec 2021 15:27:32 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLa-0007Q6-JR; Thu, 16 Dec 2021 15:27:32 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGK0LCP017012; 
 Thu, 16 Dec 2021 20:26:56 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyqbjarvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:56 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKCgMd024625;
 Thu, 16 Dec 2021 20:26:53 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3cy7k9j4dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:53 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BGKInU437683492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:18:49 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 303B94C046;
 Thu, 16 Dec 2021 20:26:51 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA92B4C04A;
 Thu, 16 Dec 2021 20:26:50 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:50 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4B1BD2201A0;
 Thu, 16 Dec 2021 21:26:50 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 052/101] target/ppc: Update fres to new flags and float64r32
Date: Thu, 16 Dec 2021 21:25:25 +0100
Message-Id: <20211216202614.414266-53-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yKvvOC8hwAb-TszQOHv3_nRbhSXEg_4p
X-Proofpoint-ORIG-GUID: yKvvOC8hwAb-TszQOHv3_nRbhSXEg_4p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=579 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1034 classifier=spam adjust=0 reason=mlx
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

There is no double-rounding bug here, because the result is
merely an estimate to within 1 part in 256, but perform the
operation with float64r32_div for consistency.

Use float_flag_invalid_snan instead of recomputing the
snan-ness of the operand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-34-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 83c8f2556cc7..c955b20739ac 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -861,20 +861,20 @@ float64 helper_fre(CPUPPCState *env, float64 arg)
 /* fres - fres. */
 uint64_t helper_fres(CPUPPCState *env, uint64_t arg)
 {
-    CPU_DoubleU farg;
-    float32 f32;
-
-    farg.ll =3D arg;
+    /* "Estimate" the reciprocal with actual division.  */
+    float64 ret =3D float64r32_div(float64_one, arg, &env->fp_status);
+    int flags =3D get_float_exception_flags(&env->fp_status);
=20
-    if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
-        /* sNaN reciprocal */
+    if (unlikely(flags & float_flag_invalid_snan)) {
         float_invalid_op_vxsnan(env, GETPC());
     }
-    farg.d =3D float64_div(float64_one, farg.d, &env->fp_status);
-    f32 =3D float64_to_float32(farg.d, &env->fp_status);
-    farg.d =3D float32_to_float64(f32, &env->fp_status);
+    if (unlikely(flags & float_flag_divbyzero)) {
+        float_zero_divide_excp(env, GETPC());
+        /* For FPSCR.ZE =3D=3D 0, the result is 1/2.  */
+        ret =3D float64_set_sign(float64_half, float64_is_neg(arg));
+    }
=20
-    return farg.ll;
+    return ret;
 }
=20
 /* frsqrte  - frsqrte. */
--=20
2.31.1


