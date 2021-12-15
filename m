Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A60A47608F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:19:22 +0100 (CET)
Received: from localhost ([::1]:34758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYs5-0008Hj-3L
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:19:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiC-0004hY-JI; Wed, 15 Dec 2021 12:05:04 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXi9-0004hD-Ry; Wed, 15 Dec 2021 12:05:04 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfctJ019589; 
 Wed, 15 Dec 2021 17:04:33 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyh6nw3s9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:32 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3KQ8024952;
 Wed, 15 Dec 2021 17:04:31 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3cy7qvydd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4ROS27656584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9AEB54204F;
 Wed, 15 Dec 2021 17:04:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6151A42041;
 Wed, 15 Dec 2021 17:04:27 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:27 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id ABF05220295;
 Wed, 15 Dec 2021 18:04:26 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 048/102] target/ppc: Add helper for fsqrts
Date: Wed, 15 Dec 2021 18:03:03 +0100
Message-Id: <20211215170357.321643-36-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LsQIcGc_J6GcRBSAIr5Ieg6QRRwfYgXi
X-Proofpoint-GUID: LsQIcGc_J6GcRBSAIr5Ieg6QRRwfYgXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=846 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1034 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150098
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


