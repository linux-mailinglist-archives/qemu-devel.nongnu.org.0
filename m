Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE97476068
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:14:25 +0100 (CET)
Received: from localhost ([::1]:48024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYnI-0006fM-53
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:14:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiE-0004ly-H5; Wed, 15 Dec 2021 12:05:06 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43958
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiB-0004ha-0t; Wed, 15 Dec 2021 12:05:05 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfa3F020508; 
 Wed, 15 Dec 2021 17:04:33 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cyhyk42we-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:32 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3M8b024988;
 Wed, 15 Dec 2021 17:04:30 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3cy7qvydde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:30 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4SaN31719932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:28 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4391711C04A;
 Wed, 15 Dec 2021 17:04:28 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AF8D11C05E;
 Wed, 15 Dec 2021 17:04:28 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:27 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 524F8220247;
 Wed, 15 Dec 2021 18:04:27 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 049/102] target/ppc: Add helpers for fadds, fsubs, fdivs
Date: Wed, 15 Dec 2021 18:03:04 +0100
Message-Id: <20211215170357.321643-37-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VUdAqkIddlBtmHCmL-0_3kKvsmcLN1wG
X-Proofpoint-ORIG-GUID: VUdAqkIddlBtmHCmL-0_3kKvsmcLN1wG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 bulkscore=0
 mlxlogscore=887 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Use float64r32_{add,sub,div}.  Fixes a double-rounding issue with
performing the compuation in float64 and then rounding afterward.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-31-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                |  3 +++
 target/ppc/fpu_helper.c            | 40 ++++++++++++++++++++++++++++++
 target/ppc/translate/fp-impl.c.inc | 11 +++-----
 3 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 9d7c9a919a98..2b80c2f22835 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -94,9 +94,12 @@ DEF_HELPER_2(frip, i64, env, i64)
 DEF_HELPER_2(frim, i64, env, i64)
=20
 DEF_HELPER_3(fadd, f64, env, f64, f64)
+DEF_HELPER_3(fadds, f64, env, f64, f64)
 DEF_HELPER_3(fsub, f64, env, f64, f64)
+DEF_HELPER_3(fsubs, f64, env, f64, f64)
 DEF_HELPER_3(fmul, f64, env, f64, f64)
 DEF_HELPER_3(fdiv, f64, env, f64, f64)
+DEF_HELPER_3(fdivs, f64, env, f64, f64)
 DEF_HELPER_4(fmadd, i64, env, i64, i64, i64)
 DEF_HELPER_4(fmsub, i64, env, i64, i64, i64)
 DEF_HELPER_4(fnmadd, i64, env, i64, i64, i64)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 07e1695b07b7..c36cf05d8098 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -521,6 +521,18 @@ float64 helper_fadd(CPUPPCState *env, float64 arg1, =
float64 arg2)
     return ret;
 }
=20
+/* fadds - fadds. */
+float64 helper_fadds(CPUPPCState *env, float64 arg1, float64 arg2)
+{
+    float64 ret =3D float64r32_add(arg1, arg2, &env->fp_status);
+    int flags =3D get_float_exception_flags(&env->fp_status);
+
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_addsub(env, flags, 1, GETPC());
+    }
+    return ret;
+}
+
 /* fsub - fsub. */
 float64 helper_fsub(CPUPPCState *env, float64 arg1, float64 arg2)
 {
@@ -534,6 +546,18 @@ float64 helper_fsub(CPUPPCState *env, float64 arg1, =
float64 arg2)
     return ret;
 }
=20
+/* fsubs - fsubs. */
+float64 helper_fsubs(CPUPPCState *env, float64 arg1, float64 arg2)
+{
+    float64 ret =3D float64r32_sub(arg1, arg2, &env->fp_status);
+    int flags =3D get_float_exception_flags(&env->fp_status);
+
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_addsub(env, flags, 1, GETPC());
+    }
+    return ret;
+}
+
 static void float_invalid_op_mul(CPUPPCState *env, int flags,
                                  bool set_fprc, uintptr_t retaddr)
 {
@@ -585,6 +609,22 @@ float64 helper_fdiv(CPUPPCState *env, float64 arg1, =
float64 arg2)
     return ret;
 }
=20
+/* fdivs - fdivs. */
+float64 helper_fdivs(CPUPPCState *env, float64 arg1, float64 arg2)
+{
+    float64 ret =3D float64r32_div(arg1, arg2, &env->fp_status);
+    int flags =3D get_float_exception_flags(&env->fp_status);
+
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_div(env, flags, 1, GETPC());
+    }
+    if (unlikely(flags & float_flag_divbyzero)) {
+        float_zero_divide_excp(env, GETPC());
+    }
+
+    return ret;
+}
+
 static uint64_t float_invalid_cvt(CPUPPCState *env, int flags,
                                   uint64_t ret, uint64_t ret_nan,
                                   bool set_fprc, uintptr_t retaddr)
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp=
-impl.c.inc
index baa31d3431c7..b84097544f62 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -68,7 +68,7 @@ static void gen_f##name(DisasContext *ctx)             =
                       \
 _GEN_FLOAT_ACB(name, 0x3F, op2, set_fprf, type);                        =
      \
 _GEN_FLOAT_ACB(name##s, 0x3B, op2, set_fprf, type);
=20
-#define _GEN_FLOAT_AB(name, op, op1, op2, inval, isfloat, set_fprf, type=
)     \
+#define _GEN_FLOAT_AB(name, op1, op2, inval, set_fprf, type)            =
      \
 static void gen_f##name(DisasContext *ctx)                              =
      \
 {                                                                       =
      \
     TCGv_i64 t0;                                                        =
      \
@@ -84,10 +84,7 @@ static void gen_f##name(DisasContext *ctx)            =
                        \
     gen_reset_fpstatus();                                               =
      \
     get_fpr(t0, rA(ctx->opcode));                                       =
      \
     get_fpr(t1, rB(ctx->opcode));                                       =
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
@@ -100,8 +97,8 @@ static void gen_f##name(DisasContext *ctx)            =
                        \
     tcg_temp_free_i64(t2);                                              =
      \
 }
 #define GEN_FLOAT_AB(name, op2, inval, set_fprf, type)                  =
      \
-_GEN_FLOAT_AB(name, name, 0x3F, op2, inval, 0, set_fprf, type);         =
      \
-_GEN_FLOAT_AB(name##s, name, 0x3B, op2, inval, 1, set_fprf, type);
+_GEN_FLOAT_AB(name, 0x3F, op2, inval, set_fprf, type);                  =
      \
+_GEN_FLOAT_AB(name##s, 0x3B, op2, inval, set_fprf, type);
=20
 #define _GEN_FLOAT_AC(name, op, op1, op2, inval, isfloat, set_fprf, type=
)     \
 static void gen_f##name(DisasContext *ctx)                              =
      \
--=20
2.31.1


