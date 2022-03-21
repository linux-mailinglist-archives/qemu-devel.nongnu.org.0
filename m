Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793174E20ED
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 08:06:20 +0100 (CET)
Received: from localhost ([::1]:57980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWC7O-0007Fw-QV
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 03:06:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWBnM-0002p2-1S; Mon, 21 Mar 2022 02:45:39 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWBnA-0006sW-U3; Mon, 21 Mar 2022 02:45:28 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22L46F10009328; 
 Mon, 21 Mar 2022 06:45:06 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3exb60fffu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 06:45:06 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22L6gTK8014701;
 Mon, 21 Mar 2022 06:45:04 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3ew6t9arj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 06:45:04 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22L6j1UB37290294
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 06:45:01 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3E7BA405B;
 Mon, 21 Mar 2022 06:45:01 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78E3EA4054;
 Mon, 21 Mar 2022 06:45:01 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 21 Mar 2022 06:45:01 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.82.112])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id CAED2220187;
 Mon, 21 Mar 2022 07:45:00 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 2/3] target/ppc: Replicate double->int32 result for some vector
 insns
Date: Mon, 21 Mar 2022 07:44:57 +0100
Message-Id: <20220321064458.1517999-3-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220321064458.1517999-1-clg@kaod.org>
References: <20220321064458.1517999-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ihTbh2RpHuze9myEzfhGnxQhvVjAOiNh
X-Proofpoint-GUID: ihTbh2RpHuze9myEzfhGnxQhvVjAOiNh
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_02,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=713 spamscore=0
 impostorscore=0 clxscore=1034 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203210042
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Power ISA v3.1 formalizes the previously undefined result in
words 1 and 3 to be a copy of the result in words 0 and 2.

This affects: xscvdpsxws, xscvdpuxws, xvcvdpsxws, xvcvdpuxws.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/852
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[ clg: checkpatch fixes ]
Message-Id: <20220315053934.377519-1-richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 45 +++++++++++++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index bd12db960af3..564f2ec35374 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2891,22 +2891,55 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, p=
pc_vsr_t *xb)             \
=20
 VSX_CVT_FP_TO_INT(xscvdpsxds, 1, float64, int64, VsrD(0), VsrD(0), \
                   0x8000000000000000ULL)
-VSX_CVT_FP_TO_INT(xscvdpsxws, 1, float64, int32, VsrD(0), VsrW(1), \
-                  0x80000000U)
 VSX_CVT_FP_TO_INT(xscvdpuxds, 1, float64, uint64, VsrD(0), VsrD(0), 0ULL)
-VSX_CVT_FP_TO_INT(xscvdpuxws, 1, float64, uint32, VsrD(0), VsrW(1), 0U)
 VSX_CVT_FP_TO_INT(xvcvdpsxds, 2, float64, int64, VsrD(i), VsrD(i), \
                   0x8000000000000000ULL)
-VSX_CVT_FP_TO_INT(xvcvdpsxws, 2, float64, int32, VsrD(i), VsrW(2 * i), \
-                  0x80000000U)
 VSX_CVT_FP_TO_INT(xvcvdpuxds, 2, float64, uint64, VsrD(i), VsrD(i), 0ULL)
-VSX_CVT_FP_TO_INT(xvcvdpuxws, 2, float64, uint32, VsrD(i), VsrW(2 * i), 0U)
 VSX_CVT_FP_TO_INT(xvcvspsxds, 2, float32, int64, VsrW(2 * i), VsrD(i), \
                   0x8000000000000000ULL)
 VSX_CVT_FP_TO_INT(xvcvspsxws, 4, float32, int32, VsrW(i), VsrW(i), 0x80000=
000U)
 VSX_CVT_FP_TO_INT(xvcvspuxds, 2, float32, uint64, VsrW(2 * i), VsrD(i), 0U=
LL)
 VSX_CVT_FP_TO_INT(xvcvspuxws, 4, float32, uint32, VsrW(i), VsrW(i), 0U)
=20
+/*
+ * Likewise, except that the result is duplicated into both subwords.
+ * Power ISA v3.1 has Programming Notes for these insns:
+ *     Previous versions of the architecture allowed the contents of
+ *     word 0 of the result register to be undefined. However, all
+ *     processors that support this instruction write the result into
+ *     words 0 and 1 (and words 2 and 3) of the result register, as
+ *     is required by this version of the architecture.
+ */
+#define VSX_CVT_FP_TO_INT2(op, nels, stp, ttp, rnan)                      =
   \
+void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)          =
   \
+{                                                                         =
   \
+    int all_flags =3D env->fp_status.float_exception_flags, flags;        =
     \
+    ppc_vsr_t t =3D { };                                                  =
     \
+    int i;                                                                =
   \
+                                                                          =
   \
+    for (i =3D 0; i < nels; i++) {                                        =
     \
+        env->fp_status.float_exception_flags =3D 0;                       =
     \
+        t.VsrW(2 * i) =3D stp##_to_##ttp##_round_to_zero(xb->VsrD(i),     =
     \
+                                                       &env->fp_status);  =
   \
+        flags =3D env->fp_status.float_exception_flags;                   =
     \
+        if (unlikely(flags & float_flag_invalid)) {                       =
   \
+            t.VsrW(2 * i) =3D float_invalid_cvt(env, flags, t.VsrW(2 * i),=
     \
+                                              rnan, 0, GETPC());          =
   \
+        }                                                                 =
   \
+        t.VsrW(2 * i + 1) =3D t.VsrW(2 * i);                              =
     \
+        all_flags |=3D flags;                                             =
     \
+    }                                                                     =
   \
+                                                                          =
   \
+    *xt =3D t;                                                            =
     \
+    env->fp_status.float_exception_flags =3D all_flags;                   =
     \
+    do_float_check_status(env, GETPC());                                  =
   \
+}
+
+VSX_CVT_FP_TO_INT2(xscvdpsxws, 1, float64, int32, 0x80000000U)
+VSX_CVT_FP_TO_INT2(xscvdpuxws, 1, float64, uint32, 0U)
+VSX_CVT_FP_TO_INT2(xvcvdpsxws, 2, float64, int32, 0x80000000U)
+VSX_CVT_FP_TO_INT2(xvcvdpuxws, 2, float64, uint32, 0U)
+
 /*
  * VSX_CVT_FP_TO_INT_VECTOR - VSX floating point to integer conversion
  *   op    - instruction mnemonic
--=20
2.34.1


