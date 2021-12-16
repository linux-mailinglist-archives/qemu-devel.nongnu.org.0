Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0D8477F92
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 22:51:43 +0100 (CET)
Received: from localhost ([::1]:58920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxyf8-0000vl-6J
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 16:51:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLY-0002jC-91; Thu, 16 Dec 2021 15:27:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLS-0007Oh-FG; Thu, 16 Dec 2021 15:27:23 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGIKBIZ026974; 
 Thu, 16 Dec 2021 20:26:54 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cy2tr1h5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:53 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKCWRG010868;
 Thu, 16 Dec 2021 20:26:51 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3cy78hj781-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:51 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BGKIk1t44564898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:18:46 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2FFAAE045;
 Thu, 16 Dec 2021 20:26:48 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9AE6CAE057;
 Thu, 16 Dec 2021 20:26:48 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:48 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id F25EE2201A0;
 Thu, 16 Dec 2021 21:26:47 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 048/101] target/ppc: Add helper for fsqrts
Date: Thu, 16 Dec 2021 21:25:21 +0100
Message-Id: <20211216202614.414266-49-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FjTfYSNO95clhsgy89SLqMxDfXfJxoQU
X-Proofpoint-ORIG-GUID: FjTfYSNO95clhsgy89SLqMxDfXfJxoQU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1034 mlxlogscore=819 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
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

Use float64r32_sqrt.  Fixes a double-rounding issue with performing
the compuation in float64 and then rounding afterward.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-30-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                |  1 +
 target/ppc/fpu_helper.c            | 12 ++++++++++++
 target/ppc/translate/fp-impl.c.inc |  3 +--
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 8a9f2ee7ed4f..9d7c9a919a98 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -106,6 +106,7 @@ DEF_HELPER_4(fmsubs, i64, env, i64, i64, i64)
 DEF_HELPER_4(fnmadds, i64, env, i64, i64, i64)
 DEF_HELPER_4(fnmsubs, i64, env, i64, i64, i64)
 DEF_HELPER_2(fsqrt, f64, env, f64)
+DEF_HELPER_2(fsqrts, f64, env, f64)
 DEF_HELPER_2(fre, i64, env, i64)
 DEF_HELPER_2(fres, i64, env, i64)
 DEF_HELPER_2(frsqrte, i64, env, i64)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 12dd889fb5f8..07e1695b07b7 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -775,6 +775,18 @@ float64 helper_fsqrt(CPUPPCState *env, float64 arg)
     return ret;
 }
=20
+/* fsqrts - fsqrts. */
+float64 helper_fsqrts(CPUPPCState *env, float64 arg)
+{
+    float64 ret =3D float64r32_sqrt(arg, &env->fp_status);
+    int flags =3D get_float_exception_flags(&env->fp_status);
+
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_sqrt(env, flags, 1, GETPC());
+    }
+    return ret;
+}
+
 /* fre - fre. */
 float64 helper_fre(CPUPPCState *env, float64 arg)
 {
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp=
-impl.c.inc
index 2e3162d3e7c0..baa31d3431c7 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -270,8 +270,7 @@ static void gen_fsqrts(DisasContext *ctx)
     t1 =3D tcg_temp_new_i64();
     gen_reset_fpstatus();
     get_fpr(t0, rB(ctx->opcode));
-    gen_helper_fsqrt(t1, cpu_env, t0);
-    gen_helper_frsp(t1, cpu_env, t1);
+    gen_helper_fsqrts(t1, cpu_env, t0);
     set_fpr(rD(ctx->opcode), t1);
     gen_compute_fprf_float64(t1);
     if (unlikely(Rc(ctx->opcode) !=3D 0)) {
--=20
2.31.1


