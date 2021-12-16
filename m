Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E5E477D93
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 21:28:58 +0100 (CET)
Received: from localhost ([::1]:47508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxxN3-00045w-Vg
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 15:28:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKf-0000rW-3Y; Thu, 16 Dec 2021 15:26:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2164
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKd-0007Ab-4F; Thu, 16 Dec 2021 15:26:28 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGIoMP0007549; 
 Thu, 16 Dec 2021 20:26:24 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d08sn5bep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:24 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKCvhs004379;
 Thu, 16 Dec 2021 20:26:22 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3cy7vvsyke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:22 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKQKe142992078
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E724A4C04E;
 Thu, 16 Dec 2021 20:26:19 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4CFA4C040;
 Thu, 16 Dec 2021 20:26:19 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:19 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id EA14A220238;
 Thu, 16 Dec 2021 21:26:18 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 003/101] target/ppc: Fixed call to deferred exception
Date: Thu, 16 Dec 2021 21:24:36 +0100
Message-Id: <20211216202614.414266-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kmlO__Okrqo7mmInYg1tuB7N3oP__Abj
X-Proofpoint-GUID: kmlO__Okrqo7mmInYg1tuB7N3oP__Abj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 suspectscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

mtfsf, mtfsfi and mtfsb1 instructions call helper_float_check_status
after updating the value of FPSCR, but helper_float_check_status
checks fp_status and fp_status isn't updated based on FPSCR and
since the value of fp_status is reset earlier in the instruction,
it's always 0.

Because of this helper_float_check_status would change the FI bit to 0
as this bit checks if the last operation was inexact and
float_flag_inexact is always 0.

These instructions also don't throw exceptions correctly since
helper_float_check_status throw exceptions based on fp_status.

This commit created a new helper, helper_fpscr_check_status that checks
FPSCR value instead of fp_status and checks for a larger variety of
exceptions than do_float_check_status.

Since fp_status isn't used, gen_reset_fpstatus() was removed.

The hardware used to compare QEMU's behavior to was a Power9.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.b=
r>
Message-Id: <20211201163808.440385-2-lucas.araujo@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                |  1 +
 target/ppc/fpu_helper.c            | 48 ++++++++++++++++++++++++++++++
 target/ppc/translate/fp-impl.c.inc |  9 ++----
 3 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 627811cefc98..632a81c6766f 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -63,6 +63,7 @@ DEF_HELPER_FLAGS_1(cntlzw32, TCG_CALL_NO_RWG_SE, i32, i=
32)
 DEF_HELPER_FLAGS_2(brinc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
=20
 DEF_HELPER_1(float_check_status, void, env)
+DEF_HELPER_1(fpscr_check_status, void, env)
 DEF_HELPER_1(reset_fpstatus, void, env)
 DEF_HELPER_2(compute_fprf_float64, void, env, i64)
 DEF_HELPER_3(store_fpscr, void, env, i64, i32)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index c4896cecc80c..bb72715827c3 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -414,6 +414,54 @@ void helper_store_fpscr(CPUPPCState *env, uint64_t v=
al, uint32_t nibbles)
     ppc_store_fpscr(env, val);
 }
=20
+void helper_fpscr_check_status(CPUPPCState *env)
+{
+    CPUState *cs =3D env_cpu(env);
+    target_ulong fpscr =3D env->fpscr;
+    int error =3D 0;
+
+    if ((fpscr & FP_OX) && (fpscr & FP_OE)) {
+        error =3D POWERPC_EXCP_FP_OX;
+    } else if ((fpscr & FP_UX) && (fpscr & FP_UE)) {
+        error =3D POWERPC_EXCP_FP_UX;
+    } else if ((fpscr & FP_XX) && (fpscr & FP_XE)) {
+        error =3D POWERPC_EXCP_FP_XX;
+    } else if ((fpscr & FP_ZX) && (fpscr & FP_ZE)) {
+        error =3D POWERPC_EXCP_FP_ZX;
+    } else if (fpscr & FP_VE) {
+        if (fpscr & FP_VXSOFT) {
+            error =3D POWERPC_EXCP_FP_VXSOFT;
+        } else if (fpscr & FP_VXSNAN) {
+            error =3D POWERPC_EXCP_FP_VXSNAN;
+        } else if (fpscr & FP_VXISI) {
+            error =3D POWERPC_EXCP_FP_VXISI;
+        } else if (fpscr & FP_VXIDI) {
+            error =3D POWERPC_EXCP_FP_VXIDI;
+        } else if (fpscr & FP_VXZDZ) {
+            error =3D POWERPC_EXCP_FP_VXZDZ;
+        } else if (fpscr & FP_VXIMZ) {
+            error =3D POWERPC_EXCP_FP_VXIMZ;
+        } else if (fpscr & FP_VXVC) {
+            error =3D POWERPC_EXCP_FP_VXVC;
+        } else if (fpscr & FP_VXSQRT) {
+            error =3D POWERPC_EXCP_FP_VXSQRT;
+        } else if (fpscr & FP_VXCVI) {
+            error =3D POWERPC_EXCP_FP_VXCVI;
+        } else {
+            return;
+        }
+    } else {
+        return;
+    }
+    cs->exception_index =3D POWERPC_EXCP_PROGRAM;
+    env->error_code =3D error | POWERPC_EXCP_FP;
+    /* Deferred floating-point exception after target FPSCR update */
+    if (fp_exceptions_enabled(env)) {
+        raise_exception_err_ra(env, cs->exception_index,
+                               env->error_code, GETPC());
+    }
+}
+
 static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
 {
     CPUState *cs =3D env_cpu(env);
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp=
-impl.c.inc
index c9e05201d9e7..8afd6a087d1d 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -769,7 +769,6 @@ static void gen_mtfsb1(DisasContext *ctx)
         return;
     }
     crb =3D 31 - crbD(ctx->opcode);
-    gen_reset_fpstatus();
     /* XXX: we pretend we can only do IEEE floating-point computations *=
/
     if (likely(crb !=3D FPSCR_FEX && crb !=3D FPSCR_VX && crb !=3D FPSCR=
_NI)) {
         TCGv_i32 t0;
@@ -782,7 +781,7 @@ static void gen_mtfsb1(DisasContext *ctx)
         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
     }
     /* We can raise a deferred exception */
-    gen_helper_float_check_status(cpu_env);
+    gen_helper_fpscr_check_status(cpu_env);
 }
=20
 /* mtfsf */
@@ -803,7 +802,6 @@ static void gen_mtfsf(DisasContext *ctx)
         gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
         return;
     }
-    gen_reset_fpstatus();
     if (l) {
         t0 =3D tcg_const_i32((ctx->insns_flags2 & PPC2_ISA205) ? 0xffff =
: 0xff);
     } else {
@@ -818,7 +816,7 @@ static void gen_mtfsf(DisasContext *ctx)
         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
     }
     /* We can raise a deferred exception */
-    gen_helper_float_check_status(cpu_env);
+    gen_helper_fpscr_check_status(cpu_env);
     tcg_temp_free_i64(t1);
 }
=20
@@ -840,7 +838,6 @@ static void gen_mtfsfi(DisasContext *ctx)
         return;
     }
     sh =3D (8 * w) + 7 - bf;
-    gen_reset_fpstatus();
     t0 =3D tcg_const_i64(((uint64_t)FPIMM(ctx->opcode)) << (4 * sh));
     t1 =3D tcg_const_i32(1 << sh);
     gen_helper_store_fpscr(cpu_env, t0, t1);
@@ -851,7 +848,7 @@ static void gen_mtfsfi(DisasContext *ctx)
         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
     }
     /* We can raise a deferred exception */
-    gen_helper_float_check_status(cpu_env);
+    gen_helper_fpscr_check_status(cpu_env);
 }
=20
 static void gen_qemu_ld32fs(DisasContext *ctx, TCGv_i64 dest, TCGv addr)
--=20
2.31.1


