Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2C1477EE6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 22:36:21 +0100 (CET)
Received: from localhost ([::1]:51510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxyQF-00022W-Px
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 16:36:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLW-0002cu-U6; Thu, 16 Dec 2021 15:27:22 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLT-0007Or-9c; Thu, 16 Dec 2021 15:27:22 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGK2iBm038719; 
 Thu, 16 Dec 2021 20:26:54 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cymkwfkpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:54 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKBiSC016025;
 Thu, 16 Dec 2021 20:26:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3cy7qwatc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:52 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKQnQd44368334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:49 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DD254C046;
 Thu, 16 Dec 2021 20:26:49 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 344534C050;
 Thu, 16 Dec 2021 20:26:49 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:49 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 89694220238;
 Thu, 16 Dec 2021 21:26:48 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 049/101] target/ppc: Add helpers for fadds, fsubs, fdivs
Date: Thu, 16 Dec 2021 21:25:22 +0100
Message-Id: <20211216202614.414266-50-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gc9zn0q1YN-Tpqlhyyqu9MAu7chSSMwh
X-Proofpoint-ORIG-GUID: gc9zn0q1YN-Tpqlhyyqu9MAu7chSSMwh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1034 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 mlxlogscore=876 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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


