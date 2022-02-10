Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DB54B120A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 16:49:25 +0100 (CET)
Received: from localhost ([::1]:58874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIBhE-0007qr-J9
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 10:49:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI95F-0002Hv-V0; Thu, 10 Feb 2022 08:02:04 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI94y-0004NV-Qq; Thu, 10 Feb 2022 08:02:01 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ABTcgA010327; 
 Thu, 10 Feb 2022 13:00:48 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e4crymys6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:47 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21ACvUMo001309;
 Thu, 10 Feb 2022 13:00:44 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3e1gv9x0u0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:44 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21AD0gJV46465330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 13:00:42 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 185BE5207C;
 Thu, 10 Feb 2022 13:00:42 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id C255D52078;
 Thu, 10 Feb 2022 13:00:41 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.74.250])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1094022016C;
 Thu, 10 Feb 2022 14:00:41 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 40/42] target/ppc: Change VSX instructions behavior to fill
 with zeros
Date: Thu, 10 Feb 2022 14:00:06 +0100
Message-Id: <20220210130008.2599950-41-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210130008.2599950-1-clg@kaod.org>
References: <20220210130008.2599950-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: V0iy6aB3UwUIumIZ-oGqnSxBfXCBAHkm
X-Proofpoint-ORIG-GUID: V0iy6aB3UwUIumIZ-oGqnSxBfXCBAHkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 clxscore=1034 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 mlxlogscore=857 malwarescore=0 mlxscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202100071
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>

ISA v3.1 changed some VSX instructions behavior by changing what the
other words/doubleword in the result should contain when the result is
only one word/doubleword. e.g. xsmaxdp operates on doubleword 0 and
saves the result also in doubleword 0.
Before, the second doubleword result was undefined according to the
ISA, but now it's stated that it should be zeroed.

Even tough the result was undefined before, hardware implementing these
instructions already filled these fields with 0s. Changing every ISA
version in QEMU to this behavior makes the results match what happens
in hardware.

Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220204181944.65063-1-victor.colombo@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c             | 26 +++++++++++++-------------
 target/ppc/translate/vsx-impl.c.inc |  4 +++-
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index e5c29b53b8b5..bd76bee7f1e7 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -1696,7 +1696,7 @@ uint32_t helper_efdcmpeq(CPUPPCState *env, uint64_t=
 op1, uint64_t op2)
 void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,                     =
     \
                    ppc_vsr_t *xa, ppc_vsr_t *xb)                        =
     \
 {                                                                       =
     \
-    ppc_vsr_t t =3D *xt;                                                =
       \
+    ppc_vsr_t t =3D { };                                                =
       \
     int i;                                                              =
     \
                                                                         =
     \
     helper_reset_fpstatus(env);                                         =
     \
@@ -1772,7 +1772,7 @@ void helper_xsaddqp(CPUPPCState *env, uint32_t opco=
de,
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                       =
     \
                  ppc_vsr_t *xa, ppc_vsr_t *xb)                          =
     \
 {                                                                       =
     \
-    ppc_vsr_t t =3D *xt;                                                =
       \
+    ppc_vsr_t t =3D { };                                                =
       \
     int i;                                                              =
     \
                                                                         =
     \
     helper_reset_fpstatus(env);                                         =
     \
@@ -1843,7 +1843,7 @@ void helper_xsmulqp(CPUPPCState *env, uint32_t opco=
de,
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                       =
      \
                  ppc_vsr_t *xa, ppc_vsr_t *xb)                          =
      \
 {                                                                       =
      \
-    ppc_vsr_t t =3D *xt;                                                =
        \
+    ppc_vsr_t t =3D { };                                                =
        \
     int i;                                                              =
      \
                                                                         =
      \
     helper_reset_fpstatus(env);                                         =
      \
@@ -1919,7 +1919,7 @@ void helper_xsdivqp(CPUPPCState *env, uint32_t opco=
de,
 #define VSX_RE(op, nels, tp, fld, sfprf, r2sp)                          =
      \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        =
      \
 {                                                                       =
      \
-    ppc_vsr_t t =3D *xt;                                                =
        \
+    ppc_vsr_t t =3D { };                                                =
        \
     int i;                                                              =
      \
                                                                         =
      \
     helper_reset_fpstatus(env);                                         =
      \
@@ -1959,7 +1959,7 @@ VSX_RE(xvresp, 4, float32, VsrW(i), 0, 0)
 #define VSX_SQRT(op, nels, tp, fld, sfprf, r2sp)                        =
     \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        =
     \
 {                                                                       =
     \
-    ppc_vsr_t t =3D *xt;                                                =
       \
+    ppc_vsr_t t =3D { };                                                =
       \
     int i;                                                              =
     \
                                                                         =
     \
     helper_reset_fpstatus(env);                                         =
     \
@@ -2004,7 +2004,7 @@ VSX_SQRT(xvsqrtsp, 4, float32, VsrW(i), 0, 0)
 #define VSX_RSQRTE(op, nels, tp, fld, sfprf, r2sp)                      =
     \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        =
     \
 {                                                                       =
     \
-    ppc_vsr_t t =3D *xt;                                                =
       \
+    ppc_vsr_t t =3D { };                                                =
       \
     int i;                                                              =
     \
                                                                         =
     \
     helper_reset_fpstatus(env);                                         =
     \
@@ -2472,7 +2472,7 @@ void helper_xscmpuqp(CPUPPCState *env, uint32_t opc=
ode, ppc_vsr_t *xa,
 void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,                     =
      \
                    ppc_vsr_t *xa, ppc_vsr_t *xb)                        =
      \
 {                                                                       =
      \
-    ppc_vsr_t t =3D *xt;                                                =
        \
+    ppc_vsr_t t =3D { };                                                =
        \
     int i;                                                              =
      \
                                                                         =
      \
     for (i =3D 0; i < nels; i++) {                                      =
        \
@@ -2498,7 +2498,7 @@ VSX_MAX_MIN(xvminsp, minnum, 4, float32, VsrW(i))
 void helper_##name(CPUPPCState *env,                                    =
      \
                    ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)         =
      \
 {                                                                       =
      \
-    ppc_vsr_t t =3D *xt;                                                =
        \
+    ppc_vsr_t t =3D { };                                                =
        \
     bool vxsnan_flag =3D false, vex_flag =3D false;                     =
          \
                                                                         =
      \
     if (unlikely(float64_is_any_nan(xa->VsrD(0)) ||                     =
      \
@@ -2533,7 +2533,7 @@ VSX_MAX_MINC(xsmincdp, 0);
 void helper_##name(CPUPPCState *env,                                    =
      \
                    ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)         =
      \
 {                                                                       =
      \
-    ppc_vsr_t t =3D *xt;                                                =
        \
+    ppc_vsr_t t =3D { };                                                =
        \
     bool vxsnan_flag =3D false, vex_flag =3D false;                     =
          \
                                                                         =
      \
     if (unlikely(float64_is_any_nan(xa->VsrD(0)))) {                    =
      \
@@ -2654,7 +2654,7 @@ VSX_CMP(xvcmpnesp, 4, float32, VsrW(i), eq, 0, 0)
 #define VSX_CVT_FP_TO_FP(op, nels, stp, ttp, sfld, tfld, sfprf)    \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
 {                                                                  \
-    ppc_vsr_t t =3D *xt;                                             \
+    ppc_vsr_t t =3D { };                                             \
     int i;                                                         \
                                                                    \
     for (i =3D 0; i < nels; i++) {                                   \
@@ -2833,7 +2833,7 @@ uint64_t helper_xscvspdpn(CPUPPCState *env, uint64_=
t xb)
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        =
     \
 {                                                                       =
     \
     int all_flags =3D env->fp_status.float_exception_flags, flags;      =
       \
-    ppc_vsr_t t =3D *xt;                                                =
       \
+    ppc_vsr_t t =3D { };                                                =
       \
     int i;                                                              =
     \
                                                                         =
     \
     for (i =3D 0; i < nels; i++) {                                      =
       \
@@ -2917,7 +2917,7 @@ VSX_CVT_FP_TO_INT_VECTOR(xscvqpuwz, float128, uint3=
2, f128, VsrD(0), 0x0ULL)
 #define VSX_CVT_INT_TO_FP(op, nels, stp, ttp, sfld, tfld, sfprf, r2sp)  =
\
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        =
\
 {                                                                       =
\
-    ppc_vsr_t t =3D *xt;                                                =
  \
+    ppc_vsr_t t =3D { };                                                =
  \
     int i;                                                              =
\
                                                                         =
\
     for (i =3D 0; i < nels; i++) {                                      =
  \
@@ -2990,7 +2990,7 @@ VSX_CVT_INT_TO_FP_VECTOR(xscvudqp, uint64, float128=
, VsrD(0), f128)
 #define VSX_ROUND(op, nels, tp, fld, rmode, sfprf)                     \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)       \
 {                                                                      \
-    ppc_vsr_t t =3D *xt;                                                =
 \
+    ppc_vsr_t t =3D { };                                                =
 \
     int i;                                                             \
     FloatRoundMode curr_rounding_mode;                                 \
                                                                        \
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index c636e3816431..128968b5e7a8 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -747,6 +747,7 @@ static void glue(gen_, name)(DisasContext *ctx)      =
             \
             }                                                     \
         }                                                         \
         set_cpu_vsr(xT(ctx->opcode), xb, true);                   \
+        set_cpu_vsr(xT(ctx->opcode), tcg_constant_i64(0), false); \
         tcg_temp_free_i64(xb);                                    \
         tcg_temp_free_i64(sgm);                                   \
     }
@@ -1073,6 +1074,7 @@ static void gen_##name(DisasContext *ctx)          =
           \
     get_cpu_vsr(t0, xB(ctx->opcode), true);                   \
     gen_helper_##name(t1, cpu_env, t0);                       \
     set_cpu_vsr(xT(ctx->opcode), t1, true);                   \
+    set_cpu_vsr(xT(ctx->opcode), tcg_constant_i64(0), false); \
     tcg_temp_free_i64(t0);                                    \
     tcg_temp_free_i64(t1);                                    \
 }
@@ -1700,7 +1702,7 @@ static void gen_xsiexpdp(DisasContext *ctx)
     tcg_gen_shli_i64(t0, t0, 52);
     tcg_gen_or_i64(xth, xth, t0);
     set_cpu_vsr(xT(ctx->opcode), xth, true);
-    /* dword[1] is undefined */
+    set_cpu_vsr(xT(ctx->opcode), tcg_constant_i64(0), false);
     tcg_temp_free_i64(t0);
     tcg_temp_free_i64(xth);
 }
--=20
2.34.1


