Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058C5475F7B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:39:33 +0100 (CET)
Received: from localhost ([::1]:33396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYFY-0005iq-4C
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:39:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXi5-0004XD-Lm; Wed, 15 Dec 2021 12:04:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXi4-0004f3-2d; Wed, 15 Dec 2021 12:04:57 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfbxv019453; 
 Wed, 15 Dec 2021 17:04:33 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyh6nw3sd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:33 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH43FK028848;
 Wed, 15 Dec 2021 17:04:31 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3cy7k375wa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:31 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4TtY40108446
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:29 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E29DE42045;
 Wed, 15 Dec 2021 17:04:28 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A97A14203F;
 Wed, 15 Dec 2021 17:04:28 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:28 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id F1D1F220295;
 Wed, 15 Dec 2021 18:04:27 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 050/102] target/ppc: Add helper for fmuls
Date: Wed, 15 Dec 2021 18:03:05 +0100
Message-Id: <20211215170357.321643-38-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gXJc_ps92zB5nbsrqYP5JH4Zx6vCyQCJ
X-Proofpoint-GUID: gXJc_ps92zB5nbsrqYP5JH4Zx6vCyQCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=864 bulkscore=0
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

Use float64r32_mul.  Fixes a double-rounding issue with performing
the compuation in float64 and then rounding afterward.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-32-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                |  1 +
 target/ppc/fpu_helper.c            | 12 ++++++++++++
 target/ppc/translate/fp-impl.c.inc | 11 ++++-------
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 2b80c2f22835..f70a3aefcbf4 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -98,6 +98,7 @@ DEF_HELPER_3(fadds, f64, env, f64, f64)
 DEF_HELPER_3(fsub, f64, env, f64, f64)
 DEF_HELPER_3(fsubs, f64, env, f64, f64)
 DEF_HELPER_3(fmul, f64, env, f64, f64)
+DEF_HELPER_3(fmuls, f64, env, f64, f64)
 DEF_HELPER_3(fdiv, f64, env, f64, f64)
 DEF_HELPER_3(fdivs, f64, env, f64, f64)
 DEF_HELPER_4(fmadd, i64, env, i64, i64, i64)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index c36cf05d8098..4acc557c088a 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -581,6 +581,18 @@ float64 helper_fmul(CPUPPCState *env, float64 arg1, =
float64 arg2)
     return ret;
 }
=20
+/* fmuls - fmuls. */
+float64 helper_fmuls(CPUPPCState *env, float64 arg1, float64 arg2)
+{
+    float64 ret =3D float64r32_mul(arg1, arg2, &env->fp_status);
+    int flags =3D get_float_exception_flags(&env->fp_status);
+
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_mul(env, flags, 1, GETPC());
+    }
+    return ret;
+}
+
 static void float_invalid_op_div(CPUPPCState *env, int flags,
                                  bool set_fprc, uintptr_t retaddr)
 {
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp=
-impl.c.inc
index b84097544f62..bf56e35cb686 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -100,7 +100,7 @@ static void gen_f##name(DisasContext *ctx)           =
                         \
 _GEN_FLOAT_AB(name, 0x3F, op2, inval, set_fprf, type);                  =
      \
 _GEN_FLOAT_AB(name##s, 0x3B, op2, inval, set_fprf, type);
=20
-#define _GEN_FLOAT_AC(name, op, op1, op2, inval, isfloat, set_fprf, type=
)     \
+#define _GEN_FLOAT_AC(name, op1, op2, inval, set_fprf, type)            =
      \
 static void gen_f##name(DisasContext *ctx)                              =
      \
 {                                                                       =
      \
     TCGv_i64 t0;                                                        =
      \
@@ -116,10 +116,7 @@ static void gen_f##name(DisasContext *ctx)          =
                          \
     gen_reset_fpstatus();                                               =
      \
     get_fpr(t0, rA(ctx->opcode));                                       =
      \
     get_fpr(t1, rC(ctx->opcode));                                       =
      \
-    gen_helper_f##op(t2, cpu_env, t0, t1);                              =
      \
-    if (isfloat) {                                                      =
      \
-        gen_helper_frsp(t2, cpu_env, t2);                               =
      \
-    }                                                                   =
      \
+    gen_helper_f##name(t2, cpu_env, t0, t1);                            =
      \
     set_fpr(rD(ctx->opcode), t2);                                       =
      \
     if (set_fprf) {                                                     =
      \
         gen_compute_fprf_float64(t2);                                   =
      \
@@ -132,8 +129,8 @@ static void gen_f##name(DisasContext *ctx)           =
                         \
     tcg_temp_free_i64(t2);                                              =
      \
 }
 #define GEN_FLOAT_AC(name, op2, inval, set_fprf, type)                  =
      \
-_GEN_FLOAT_AC(name, name, 0x3F, op2, inval, 0, set_fprf, type);         =
      \
-_GEN_FLOAT_AC(name##s, name, 0x3B, op2, inval, 1, set_fprf, type);
+_GEN_FLOAT_AC(name, 0x3F, op2, inval, set_fprf, type);                  =
      \
+_GEN_FLOAT_AC(name##s, 0x3B, op2, inval, set_fprf, type);
=20
 #define GEN_FLOAT_B(name, op2, op3, set_fprf, type)                     =
      \
 static void gen_f##name(DisasContext *ctx)                              =
      \
--=20
2.31.1


