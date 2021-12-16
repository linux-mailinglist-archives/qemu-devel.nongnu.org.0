Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E651B477EC8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 22:28:08 +0100 (CET)
Received: from localhost ([::1]:32892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxyIK-0006NW-2Z
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 16:28:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLV-0002Ut-7v; Thu, 16 Dec 2021 15:27:21 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43682
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLK-0007Mj-I0; Thu, 16 Dec 2021 15:27:17 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGJKij4026839; 
 Thu, 16 Dec 2021 20:26:42 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cyr22gb65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:42 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKBqpv016331;
 Thu, 16 Dec 2021 20:26:40 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3cy7qwatbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:40 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKQcc540435974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:38 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30B1242041;
 Thu, 16 Dec 2021 20:26:38 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E575342042;
 Thu, 16 Dec 2021 20:26:37 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:37 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 9D4912201A0;
 Thu, 16 Dec 2021 21:26:36 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 030/101] target/ppc: Move float_check_status from FPU_FCTI to
 translate
Date: Thu, 16 Dec 2021 21:25:03 +0100
Message-Id: <20211216202614.414266-31-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xy5T_vBEsKIJyesMfJ1q0Rx7FmdLxyAs
X-Proofpoint-ORIG-GUID: xy5T_vBEsKIJyesMfJ1q0Rx7FmdLxyAs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1034 adultscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=956 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Fixes a bug in which e.g XE enabled causes inexact to be raised
before the writeback to the architectural register.

All of the users of GEN_FLOAT_B either set set_fprf, or are one
of the convert-to-integer instructions that require this behaviour.
Split out the two gen_helper_* calls in gen_compute_fprf_float64
and protect only the first with set_fprf.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-12-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c            | 9 +++------
 target/ppc/translate/fp-impl.c.inc | 3 ++-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 9bcd7abd165f..f453b0475116 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -600,12 +600,9 @@ uint64_t helper_##op(CPUPPCState *env, float64 arg) =
                   \
     uint64_t ret =3D float64_to_##cvt(arg, &env->fp_status);            =
 \
     int status =3D get_float_exception_flags(&env->fp_status);          =
 \
                                                                        \
-    if (unlikely(status)) {                                            \
-        if (status & float_flag_invalid) {                             \
-            float_invalid_cvt(env, 1, GETPC(), float64_classify(arg)); \
-            ret =3D nanval;                                             =
 \
-        }                                                              \
-        do_float_check_status(env, GETPC());                           \
+    if (unlikely(status & float_flag_invalid)) {                       \
+        float_invalid_cvt(env, 1, GETPC(), float64_classify(arg));     \
+        ret =3D nanval;                                                 =
 \
     }                                                                  \
     return ret;                                                        \
 }
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp=
-impl.c.inc
index 8afd6a087d1d..0767e45d87d8 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -157,8 +157,9 @@ static void gen_f##name(DisasContext *ctx)           =
                         \
     gen_helper_f##name(t1, cpu_env, t0);                                =
      \
     set_fpr(rD(ctx->opcode), t1);                                       =
      \
     if (set_fprf) {                                                     =
      \
-        gen_compute_fprf_float64(t1);                                   =
      \
+        gen_helper_compute_fprf_float64(cpu_env, t1);                   =
      \
     }                                                                   =
      \
+    gen_helper_float_check_status(cpu_env);                             =
      \
     if (unlikely(Rc(ctx->opcode) !=3D 0)) {                             =
        \
         gen_set_cr1_from_fpscr(ctx);                                    =
      \
     }                                                                   =
      \
--=20
2.31.1


