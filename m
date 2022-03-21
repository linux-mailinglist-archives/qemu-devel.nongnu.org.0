Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAEE4E20B8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 07:53:54 +0100 (CET)
Received: from localhost ([::1]:43994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWBvN-0005px-D2
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 02:53:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWBnH-0002pz-B6; Mon, 21 Mar 2022 02:45:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWBnF-0006si-G8; Mon, 21 Mar 2022 02:45:30 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22L6fpVC012439; 
 Mon, 21 Mar 2022 06:45:07 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3exmaq01ew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 06:45:06 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22L6gdRr021858;
 Mon, 21 Mar 2022 06:45:04 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3ew6t8u5h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 06:45:04 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22L6j2FM36897196
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 06:45:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D11411C050;
 Mon, 21 Mar 2022 06:45:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1481011C04C;
 Mon, 21 Mar 2022 06:45:02 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 21 Mar 2022 06:45:02 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.82.112])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 67961220383;
 Mon, 21 Mar 2022 07:45:01 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 3/3] target/ppc: Replicate Double->Single-Precision result
Date: Mon, 21 Mar 2022 07:44:58 +0100
Message-Id: <20220321064458.1517999-4-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220321064458.1517999-1-clg@kaod.org>
References: <20220321064458.1517999-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _4YOC6IGmyKpt9AQA1MlLTMLKHtdZqRS
X-Proofpoint-GUID: _4YOC6IGmyKpt9AQA1MlLTMLKHtdZqRS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_02,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1034
 mlxlogscore=795 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203210042
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
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>

Power ISA v3.1 formalizes the previously undefined result in
words 1 and 3 to be a copy of the result in words 0 and 2.

This affects: xvcvsxdsp, xvcvuxdsp, xvcvdpsp.

And the previously undefined result in word 1 to be a copy of
the result in word 0.

This affects: xscvdpsp.

Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Message-Id: <20220316200427.3410437-1-lucas.coutinho@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 48 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 564f2ec35374..7e8be99cc0c8 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2691,11 +2691,35 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,=
 ppc_vsr_t *xb)   \
     do_float_check_status(env, GETPC());                           \
 }
=20
-VSX_CVT_FP_TO_FP(xscvdpsp, 1, float64, float32, VsrD(0), VsrW(0), 1)
 VSX_CVT_FP_TO_FP(xscvspdp, 1, float32, float64, VsrW(0), VsrD(0), 1)
-VSX_CVT_FP_TO_FP(xvcvdpsp, 2, float64, float32, VsrD(i), VsrW(2 * i), 0)
 VSX_CVT_FP_TO_FP(xvcvspdp, 2, float32, float64, VsrW(2 * i), VsrD(i), 0)
=20
+#define VSX_CVT_FP_TO_FP2(op, nels, stp, ttp, sfprf)                  \
+void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)      \
+{                                                                     \
+    ppc_vsr_t t =3D { };                                                =
\
+    int i;                                                            \
+                                                                      \
+    for (i =3D 0; i < nels; i++) {                                      =
\
+        t.VsrW(2 * i) =3D stp##_to_##ttp(xb->VsrD(i), &env->fp_status); =
\
+        if (unlikely(stp##_is_signaling_nan(xb->VsrD(i),              \
+                                            &env->fp_status))) {      \
+            float_invalid_op_vxsnan(env, GETPC());                    \
+            t.VsrW(2 * i) =3D ttp##_snan_to_qnan(t.VsrW(2 * i));        =
\
+        }                                                             \
+        if (sfprf) {                                                  \
+            helper_compute_fprf_##ttp(env, t.VsrW(2 * i));            \
+        }                                                             \
+        t.VsrW(2 * i + 1) =3D t.VsrW(2 * i);                            =
\
+    }                                                                 \
+                                                                      \
+    *xt =3D t;                                                          =
\
+    do_float_check_status(env, GETPC());                              \
+}
+
+VSX_CVT_FP_TO_FP2(xvcvdpsp, 2, float64, float32, 0)
+VSX_CVT_FP_TO_FP2(xscvdpsp, 1, float64, float32, 1)
+
 /*
  * VSX_CVT_FP_TO_FP_VECTOR - VSX floating point/floating point conversio=
n
  *   op    - instruction mnemonic
@@ -3013,11 +3037,27 @@ VSX_CVT_INT_TO_FP(xvcvsxddp, 2, int64, float64, V=
srD(i), VsrD(i), 0, 0)
 VSX_CVT_INT_TO_FP(xvcvuxddp, 2, uint64, float64, VsrD(i), VsrD(i), 0, 0)
 VSX_CVT_INT_TO_FP(xvcvsxwdp, 2, int32, float64, VsrW(2 * i), VsrD(i), 0,=
 0)
 VSX_CVT_INT_TO_FP(xvcvuxwdp, 2, uint64, float64, VsrW(2 * i), VsrD(i), 0=
, 0)
-VSX_CVT_INT_TO_FP(xvcvsxdsp, 2, int64, float32, VsrD(i), VsrW(2 * i), 0,=
 0)
-VSX_CVT_INT_TO_FP(xvcvuxdsp, 2, uint64, float32, VsrD(i), VsrW(2 * i), 0=
, 0)
 VSX_CVT_INT_TO_FP(xvcvsxwsp, 4, int32, float32, VsrW(i), VsrW(i), 0, 0)
 VSX_CVT_INT_TO_FP(xvcvuxwsp, 4, uint32, float32, VsrW(i), VsrW(i), 0, 0)
=20
+#define VSX_CVT_INT_TO_FP2(op, stp, ttp)                                =
\
+void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        =
\
+{                                                                       =
\
+    ppc_vsr_t t =3D { };                                                =
  \
+    int i;                                                              =
\
+                                                                        =
\
+    for (i =3D 0; i < 2; i++) {                                         =
  \
+        t.VsrW(2 * i) =3D stp##_to_##ttp(xb->VsrD(i), &env->fp_status); =
  \
+        t.VsrW(2 * i + 1) =3D t.VsrW(2 * i);                            =
  \
+    }                                                                   =
\
+                                                                        =
\
+    *xt =3D t;                                                          =
  \
+    do_float_check_status(env, GETPC());                                =
\
+}
+
+VSX_CVT_INT_TO_FP2(xvcvsxdsp, int64, float32)
+VSX_CVT_INT_TO_FP2(xvcvuxdsp, uint64, float32)
+
 /*
  * VSX_CVT_INT_TO_FP_VECTOR - VSX integer to floating point conversion
  *   op    - instruction mnemonic
--=20
2.34.1


