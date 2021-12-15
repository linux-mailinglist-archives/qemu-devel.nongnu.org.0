Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BF2475F8F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:43:39 +0100 (CET)
Received: from localhost ([::1]:45222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYJW-0005Pt-ME
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:43:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiA-0004dJ-52; Wed, 15 Dec 2021 12:05:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43258
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXi7-0004gZ-Jj; Wed, 15 Dec 2021 12:05:01 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfaFk020487; 
 Wed, 15 Dec 2021 17:04:31 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cyhyk42vr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:31 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH430p028853;
 Wed, 15 Dec 2021 17:04:29 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3cy7k375w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:29 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4R2U40632732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:27 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00B774C040;
 Wed, 15 Dec 2021 17:04:27 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAEE14C046;
 Wed, 15 Dec 2021 17:04:26 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:26 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 124BF220247;
 Wed, 15 Dec 2021 18:04:25 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 047/102] target/ppc: Add helpers for fmadds et al
Date: Wed, 15 Dec 2021 18:03:02 +0100
Message-Id: <20211215170357.321643-35-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fQRZqeDYXqiS45QDRfrBRrGMH-_laBwV
X-Proofpoint-ORIG-GUID: fQRZqeDYXqiS45QDRfrBRrGMH-_laBwV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 bulkscore=0
 mlxlogscore=844 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
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

Use float64r32_muladd.  Fixes a double-rounding issue with performing
the compuation in float64 and then rounding afterward.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-29-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                |  4 ++++
 target/ppc/fpu_helper.c            | 17 ++++++++++++++++-
 target/ppc/translate/fp-impl.c.inc | 13 +++++--------
 3 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 632a81c6766f..8a9f2ee7ed4f 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -101,6 +101,10 @@ DEF_HELPER_4(fmadd, i64, env, i64, i64, i64)
 DEF_HELPER_4(fmsub, i64, env, i64, i64, i64)
 DEF_HELPER_4(fnmadd, i64, env, i64, i64, i64)
 DEF_HELPER_4(fnmsub, i64, env, i64, i64, i64)
+DEF_HELPER_4(fmadds, i64, env, i64, i64, i64)
+DEF_HELPER_4(fmsubs, i64, env, i64, i64, i64)
+DEF_HELPER_4(fnmadds, i64, env, i64, i64, i64)
+DEF_HELPER_4(fnmsubs, i64, env, i64, i64, i64)
 DEF_HELPER_2(fsqrt, f64, env, f64)
 DEF_HELPER_2(fre, i64, env, i64)
 DEF_HELPER_2(fres, i64, env, i64)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index aef81a818f63..12dd889fb5f8 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -705,10 +705,25 @@ static float64 do_fmadd(CPUPPCState *env, float64 a=
, float64 b,
     return ret;
 }
=20
+static uint64_t do_fmadds(CPUPPCState *env, float64 a, float64 b,
+                          float64 c, int madd_flags, uintptr_t retaddr)
+{
+    float64 ret =3D float64r32_muladd(a, b, c, madd_flags, &env->fp_stat=
us);
+    int flags =3D get_float_exception_flags(&env->fp_status);
+
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_madd(env, flags, 1, retaddr);
+    }
+    return ret;
+}
+
 #define FPU_FMADD(op, madd_flags)                                    \
     uint64_t helper_##op(CPUPPCState *env, uint64_t arg1,            \
                          uint64_t arg2, uint64_t arg3)               \
-    { return do_fmadd(env, arg1, arg2, arg3, madd_flags, GETPC()); }
+    { return do_fmadd(env, arg1, arg2, arg3, madd_flags, GETPC()); } \
+    uint64_t helper_##op##s(CPUPPCState *env, uint64_t arg1,         \
+                         uint64_t arg2, uint64_t arg3)               \
+    { return do_fmadds(env, arg1, arg2, arg3, madd_flags, GETPC()); }
=20
 #define MADD_FLGS 0
 #define MSUB_FLGS float_muladd_negate_c
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp=
-impl.c.inc
index 0767e45d87d8..2e3162d3e7c0 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -31,7 +31,7 @@ static void gen_set_cr1_from_fpscr(DisasContext *ctx)
 #endif
=20
 /***                       Floating-Point arithmetic                    =
   ***/
-#define _GEN_FLOAT_ACB(name, op, op1, op2, isfloat, set_fprf, type)     =
      \
+#define _GEN_FLOAT_ACB(name, op1, op2, set_fprf, type)                  =
      \
 static void gen_f##name(DisasContext *ctx)                              =
      \
 {                                                                       =
      \
     TCGv_i64 t0;                                                        =
      \
@@ -50,10 +50,7 @@ static void gen_f##name(DisasContext *ctx)            =
                        \
     get_fpr(t0, rA(ctx->opcode));                                       =
      \
     get_fpr(t1, rC(ctx->opcode));                                       =
      \
     get_fpr(t2, rB(ctx->opcode));                                       =
      \
-    gen_helper_f##op(t3, cpu_env, t0, t1, t2);                          =
      \
-    if (isfloat) {                                                      =
      \
-        gen_helper_frsp(t3, cpu_env, t3);                               =
      \
-    }                                                                   =
      \
+    gen_helper_f##name(t3, cpu_env, t0, t1, t2);                        =
      \
     set_fpr(rD(ctx->opcode), t3);                                       =
      \
     if (set_fprf) {                                                     =
      \
         gen_compute_fprf_float64(t3);                                   =
      \
@@ -68,8 +65,8 @@ static void gen_f##name(DisasContext *ctx)             =
                       \
 }
=20
 #define GEN_FLOAT_ACB(name, op2, set_fprf, type)                        =
      \
-_GEN_FLOAT_ACB(name, name, 0x3F, op2, 0, set_fprf, type);               =
      \
-_GEN_FLOAT_ACB(name##s, name, 0x3B, op2, 1, set_fprf, type);
+_GEN_FLOAT_ACB(name, 0x3F, op2, set_fprf, type);                        =
      \
+_GEN_FLOAT_ACB(name##s, 0x3B, op2, set_fprf, type);
=20
 #define _GEN_FLOAT_AB(name, op, op1, op2, inval, isfloat, set_fprf, type=
)     \
 static void gen_f##name(DisasContext *ctx)                              =
      \
@@ -233,7 +230,7 @@ static void gen_frsqrtes(DisasContext *ctx)
 }
=20
 /* fsel */
-_GEN_FLOAT_ACB(sel, sel, 0x3F, 0x17, 0, 0, PPC_FLOAT_FSEL);
+_GEN_FLOAT_ACB(sel, 0x3F, 0x17, 0, PPC_FLOAT_FSEL);
 /* fsub - fsubs */
 GEN_FLOAT_AB(sub, 0x14, 0x000007C0, 1, PPC_FLOAT);
 /* Optional: */
--=20
2.31.1


