Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C259A477EA5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 22:19:23 +0100 (CET)
Received: from localhost ([::1]:43478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxy9q-0002m3-Ql
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 16:19:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLV-0002Uo-7A; Thu, 16 Dec 2021 15:27:21 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34920
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLK-0007MP-6Q; Thu, 16 Dec 2021 15:27:13 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGIoMP6007549; 
 Thu, 16 Dec 2021 20:26:46 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d08sn5bm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:46 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKDCZB004772;
 Thu, 16 Dec 2021 20:26:45 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3cy7jravw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:44 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKQglE29557020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6551EA405C;
 Thu, 16 Dec 2021 20:26:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B300A4054;
 Thu, 16 Dec 2021 20:26:42 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:42 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 82C95220238;
 Thu, 16 Dec 2021 21:26:41 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 037/101] target/ppc: Update fmadd for new flags
Date: Thu, 16 Dec 2021 21:25:10 +0100
Message-Id: <20211216202614.414266-38-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: m3fofHmlQH2Hk38kP3-N6G1vSkp0PwrJ
X-Proofpoint-GUID: m3fofHmlQH2Hk38kP3-N6G1vSkp0PwrJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 suspectscore=0
 phishscore=0 mlxlogscore=403 spamscore=0 priorityscore=1501
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Now that vximz, vxisi, and vxsnan are computed directly by
softfloat, we don't need to recompute it.  This replaces the
separate float{32,64}_maddsub_update_excp functions with a
single float_invalid_op_madd function.

Fix VSX_MADD by passing sfprf to float_invalid_op_madd,
whereas the previous *_maddsub_update_excp assumed it true.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-19-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 46 ++++++++++-------------------------------
 1 file changed, 11 insertions(+), 35 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 7716bb15b1d2..f5d6bb4eba76 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -683,38 +683,15 @@ uint64_t helper_frim(CPUPPCState *env, uint64_t arg=
)
     return do_fri(env, arg, float_round_down);
 }
=20
-#define FPU_MADDSUB_UPDATE(NAME, TP)                                    =
\
-static void NAME(CPUPPCState *env, TP arg1, TP arg2, TP arg3,           =
\
-                 unsigned int madd_flags, uintptr_t retaddr)            =
\
-{                                                                       =
\
-    if (TP##_is_signaling_nan(arg1, &env->fp_status) ||                 =
\
-        TP##_is_signaling_nan(arg2, &env->fp_status) ||                 =
\
-        TP##_is_signaling_nan(arg3, &env->fp_status)) {                 =
\
-        /* sNaN operation */                                            =
\
-        float_invalid_op_vxsnan(env, retaddr);                          =
\
-    }                                                                   =
\
-    if ((TP##_is_infinity(arg1) && TP##_is_zero(arg2)) ||               =
\
-        (TP##_is_zero(arg1) && TP##_is_infinity(arg2))) {               =
\
-        /* Multiplication of zero by infinity */                        =
\
-        float_invalid_op_vximz(env, 1, retaddr);                        =
\
-    }                                                                   =
\
-    if ((TP##_is_infinity(arg1) || TP##_is_infinity(arg2)) &&           =
\
-        TP##_is_infinity(arg3)) {                                       =
\
-        uint8_t aSign, bSign, cSign;                                    =
\
-                                                                        =
\
-        aSign =3D TP##_is_neg(arg1);                                    =
  \
-        bSign =3D TP##_is_neg(arg2);                                    =
  \
-        cSign =3D TP##_is_neg(arg3);                                    =
  \
-        if (madd_flags & float_muladd_negate_c) {                       =
\
-            cSign ^=3D 1;                                               =
  \
-        }                                                               =
\
-        if (aSign ^ bSign ^ cSign) {                                    =
\
-            float_invalid_op_vxisi(env, 1, retaddr);                    =
\
-        }                                                               =
\
-    }                                                                   =
\
+static void float_invalid_op_madd(CPUPPCState *env, int flags,
+                                  bool set_fpcc, uintptr_t retaddr)
+{
+    if (flags & float_flag_invalid_imz) {
+        float_invalid_op_vximz(env, set_fpcc, retaddr);
+    } else {
+        float_invalid_op_addsub(env, flags, set_fpcc, retaddr);
+    }
 }
-FPU_MADDSUB_UPDATE(float32_maddsub_update_excp, float32)
-FPU_MADDSUB_UPDATE(float64_maddsub_update_excp, float64)
=20
 #define FPU_FMADD(op, madd_flags)                                       =
\
 uint64_t helper_##op(CPUPPCState *env, uint64_t arg1,                   =
\
@@ -726,8 +703,7 @@ uint64_t helper_##op(CPUPPCState *env, uint64_t arg1,=
                   \
     flags =3D get_float_exception_flags(&env->fp_status);               =
  \
     if (flags) {                                                        =
\
         if (flags & float_flag_invalid) {                               =
\
-            float64_maddsub_update_excp(env, arg1, arg2, arg3,          =
\
-                                        madd_flags, GETPC());           =
\
+            float_invalid_op_madd(env, flags, 1, GETPC());              =
\
         }                                                               =
\
         do_float_check_status(env, GETPC());                            =
\
     }                                                                   =
\
@@ -2131,8 +2107,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,  =
                           \
         env->fp_status.float_exception_flags |=3D tstat.float_exception_=
flags;  \
                                                                         =
      \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) =
{     \
-            tp##_maddsub_update_excp(env, xa->fld, b->fld,              =
      \
-                                     c->fld, maddflgs, GETPC());        =
      \
+            float_invalid_op_madd(env, tstat.float_exception_flags,     =
      \
+                                  sfprf, GETPC());                      =
      \
         }                                                               =
      \
                                                                         =
      \
         if (r2sp) {                                                     =
      \
--=20
2.31.1


