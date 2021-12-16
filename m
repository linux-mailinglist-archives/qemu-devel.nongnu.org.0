Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BA7477E11
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 22:02:51 +0100 (CET)
Received: from localhost ([::1]:43384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxxtq-00007O-3M
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 16:02:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLH-0002Ko-V7; Thu, 16 Dec 2021 15:27:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43206
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLG-0007LR-D9; Thu, 16 Dec 2021 15:27:07 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKBeFh005071; 
 Thu, 16 Dec 2021 20:26:43 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cye12hs7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:43 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKBlI1016039;
 Thu, 16 Dec 2021 20:26:41 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3cy7qwatbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:41 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKQccC29753708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:38 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7682AE045;
 Thu, 16 Dec 2021 20:26:38 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E63BAE053;
 Thu, 16 Dec 2021 20:26:38 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:38 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D3D60220238;
 Thu, 16 Dec 2021 21:26:37 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 031/101] target/ppc: Update float_invalid_cvt for new flags
Date: Thu, 16 Dec 2021 21:25:04 +0100
Message-Id: <20211216202614.414266-32-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IspjlXeliXW3jjUfMFMum2qNi50lLXe7
X-Proofpoint-ORIG-GUID: IspjlXeliXW3jjUfMFMum2qNi50lLXe7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1034
 adultscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 mlxlogscore=704 classifier=spam adjust=0 reason=mlx scancount=1
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

Now that vxsnan is computed directly by softfloat,
we don't need to recompute it via classes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-13-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index f453b0475116..be460cc74451 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -585,11 +585,11 @@ float64 helper_fdiv(CPUPPCState *env, float64 arg1,=
 float64 arg2)
     return ret;
 }
=20
-static void float_invalid_cvt(CPUPPCState *env, bool set_fprc,
-                              uintptr_t retaddr, int class1)
+static void float_invalid_cvt(CPUPPCState *env, int flags,
+                              bool set_fprc, uintptr_t retaddr)
 {
     float_invalid_op_vxcvi(env, set_fprc, retaddr);
-    if (class1 & is_snan) {
+    if (flags & float_flag_invalid_snan) {
         float_invalid_op_vxsnan(env, retaddr);
     }
 }
@@ -598,10 +598,10 @@ static void float_invalid_cvt(CPUPPCState *env, boo=
l set_fprc,
 uint64_t helper_##op(CPUPPCState *env, float64 arg)                    \
 {                                                                      \
     uint64_t ret =3D float64_to_##cvt(arg, &env->fp_status);            =
 \
-    int status =3D get_float_exception_flags(&env->fp_status);          =
 \
+    int flags =3D get_float_exception_flags(&env->fp_status);           =
 \
                                                                        \
-    if (unlikely(status & float_flag_invalid)) {                       \
-        float_invalid_cvt(env, 1, GETPC(), float64_classify(arg));     \
+    if (unlikely(flags & float_flag_invalid)) {                        \
+        float_invalid_cvt(env, flags, 1, GETPC());                     \
         ret =3D nanval;                                                 =
 \
     }                                                                  \
     return ret;                                                        \
@@ -2794,7 +2794,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, p=
pc_vsr_t *xb)             \
         t.tfld =3D stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_sta=
tus);  \
         flags =3D env->fp_status.float_exception_flags;                 =
       \
         if (unlikely(flags & float_flag_invalid)) {                     =
     \
-            float_invalid_cvt(env, 0, GETPC(), stp##_classify(xb->sfld))=
;    \
+            float_invalid_cvt(env, flags, 0, GETPC());                  =
     \
             t.tfld =3D rnan;                                            =
       \
         }                                                               =
     \
         all_flags |=3D flags;                                           =
       \
@@ -2837,10 +2837,12 @@ void helper_##op(CPUPPCState *env, uint32_t opcod=
e,                          \
                  ppc_vsr_t *xt, ppc_vsr_t *xb)                          =
     \
 {                                                                       =
     \
     ppc_vsr_t t =3D { };                                                =
       \
+    int flags;                                                          =
     \
                                                                         =
     \
     t.tfld =3D stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_status)=
;      \
-    if (env->fp_status.float_exception_flags & float_flag_invalid) {    =
     \
-        float_invalid_cvt(env, 0, GETPC(), stp##_classify(xb->sfld));   =
     \
+    flags =3D get_float_exception_flags(&env->fp_status);               =
       \
+    if (flags & float_flag_invalid) {                                   =
     \
+        float_invalid_cvt(env, flags, 0, GETPC());                      =
     \
         t.tfld =3D rnan;                                                =
       \
     }                                                                   =
     \
                                                                         =
     \
--=20
2.31.1


