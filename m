Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6023477EEE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 22:39:40 +0100 (CET)
Received: from localhost ([::1]:32896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxyTT-00008Z-SL
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 16:39:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLX-0002dQ-1j; Thu, 16 Dec 2021 15:27:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLP-0007Nw-FN; Thu, 16 Dec 2021 15:27:22 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGIkYgV015680; 
 Thu, 16 Dec 2021 20:26:44 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyfdpyyt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:44 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKCWHq010861;
 Thu, 16 Dec 2021 20:26:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3cy78hj77j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKQdN742991984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 513EE4C046;
 Thu, 16 Dec 2021 20:26:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17B254C044;
 Thu, 16 Dec 2021 20:26:39 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:39 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6CDFD2201A0;
 Thu, 16 Dec 2021 21:26:38 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 032/101] target/ppc: Fix VXCVI return value
Date: Thu, 16 Dec 2021 21:25:05 +0100
Message-Id: <20211216202614.414266-33-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zRwvlo5QrHGGbF5TDcsjnHsZYTzXXgt5
X-Proofpoint-ORIG-GUID: zRwvlo5QrHGGbF5TDcsjnHsZYTzXXgt5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 lowpriorityscore=0 mlxlogscore=797 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

We were returning nanval for any instance of invalid being set,
but that is an incorrect for VXCVI.  This failure can be seen
in the float_convs tests.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211119160502.17432-14-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index be460cc74451..d471a0a1b89b 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -585,13 +585,20 @@ float64 helper_fdiv(CPUPPCState *env, float64 arg1,=
 float64 arg2)
     return ret;
 }
=20
-static void float_invalid_cvt(CPUPPCState *env, int flags,
-                              bool set_fprc, uintptr_t retaddr)
-{
-    float_invalid_op_vxcvi(env, set_fprc, retaddr);
+static uint64_t float_invalid_cvt(CPUPPCState *env, int flags,
+                                  uint64_t ret, uint64_t ret_nan,
+                                  bool set_fprc, uintptr_t retaddr)
+{
+    /*
+     * VXCVI is different from most in that it sets two exception bits,
+     * VXCVI and VXSNAN for an SNaN input.
+     */
     if (flags & float_flag_invalid_snan) {
-        float_invalid_op_vxsnan(env, retaddr);
+        env->fpscr |=3D FP_VXSNAN;
     }
+    float_invalid_op_vxcvi(env, set_fprc, retaddr);
+
+    return flags & float_flag_invalid_cvti ? ret : ret_nan;
 }
=20
 #define FPU_FCTI(op, cvt, nanval)                                      \
@@ -599,10 +606,8 @@ uint64_t helper_##op(CPUPPCState *env, float64 arg) =
                   \
 {                                                                      \
     uint64_t ret =3D float64_to_##cvt(arg, &env->fp_status);            =
 \
     int flags =3D get_float_exception_flags(&env->fp_status);           =
 \
-                                                                       \
     if (unlikely(flags & float_flag_invalid)) {                        \
-        float_invalid_cvt(env, flags, 1, GETPC());                     \
-        ret =3D nanval;                                                 =
 \
+        ret =3D float_invalid_cvt(env, flags, ret, nanval, 1, GETPC()); =
 \
     }                                                                  \
     return ret;                                                        \
 }
@@ -2794,8 +2799,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, p=
pc_vsr_t *xb)             \
         t.tfld =3D stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_sta=
tus);  \
         flags =3D env->fp_status.float_exception_flags;                 =
       \
         if (unlikely(flags & float_flag_invalid)) {                     =
     \
-            float_invalid_cvt(env, flags, 0, GETPC());                  =
     \
-            t.tfld =3D rnan;                                            =
       \
+            t.tfld =3D float_invalid_cvt(env, flags, t.tfld, rnan, 0, GE=
TPC());\
         }                                                               =
     \
         all_flags |=3D flags;                                           =
       \
     }                                                                   =
     \
@@ -2842,8 +2846,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,=
                          \
     t.tfld =3D stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_status)=
;      \
     flags =3D get_float_exception_flags(&env->fp_status);               =
       \
     if (flags & float_flag_invalid) {                                   =
     \
-        float_invalid_cvt(env, flags, 0, GETPC());                      =
     \
-        t.tfld =3D rnan;                                                =
       \
+        t.tfld =3D float_invalid_cvt(env, flags, t.tfld, rnan, 0, GETPC(=
));    \
     }                                                                   =
     \
                                                                         =
     \
     *xt =3D t;                                                          =
       \
--=20
2.31.1


