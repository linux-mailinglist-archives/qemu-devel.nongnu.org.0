Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B5D4CA421
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:49:18 +0100 (CET)
Received: from localhost ([::1]:45312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNTp-0000mX-Ou
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:49:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr3-00012J-Ln; Wed, 02 Mar 2022 06:09:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr1-0001pD-PS; Wed, 02 Mar 2022 06:09:13 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2229rbO2026329; 
 Wed, 2 Mar 2022 11:08:44 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6bpsegs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:44 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2bNk021751;
 Wed, 2 Mar 2022 11:08:41 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3efbu9efjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:41 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8duw21823796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BDE4A4085;
 Wed,  2 Mar 2022 11:08:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD2DAA407E;
 Wed,  2 Mar 2022 11:08:38 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:38 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1F42A2201C1;
 Wed,  2 Mar 2022 12:08:38 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 46/87] target/ppc: Refactor VSX_SCALAR_CMP_DP
Date: Wed,  2 Mar 2022 12:07:22 +0100
Message-Id: <20220302110803.849505-47-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OgKC_RjIJdwwRnJ1iTTguPi6ETpGHP9a
X-Proofpoint-ORIG-GUID: OgKC_RjIJdwwRnJ1iTTguPi6ETpGHP9a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=734
 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
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
Cc: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>

Refactor VSX_SCALAR_CMP_DP, changing its name to VSX_SCALAR_CMP and
prepare the helper to be used for quadword comparisons.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225210936.1749575-41-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 64 +++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 35 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 9b034d1fe47c..bbd54b2d9c16 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2265,54 +2265,48 @@ VSX_MADDQ(XSNMSUBQP, NMSUB_FLGS, 0)
 VSX_MADDQ(XSNMSUBQPO, NMSUB_FLGS, 0)
=20
 /*
- * VSX_SCALAR_CMP_DP - VSX scalar floating point compare double precisio=
n
+ * VSX_SCALAR_CMP - VSX scalar floating point compare
  *   op    - instruction mnemonic
+ *   tp    - type
  *   cmp   - comparison operation
- *   exp   - expected result of comparison
+ *   fld   - vsr_t field
  *   svxvc - set VXVC bit
  */
-#define VSX_SCALAR_CMP_DP(op, cmp, exp, svxvc)                          =
      \
-void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                       =
      \
-                 ppc_vsr_t *xa, ppc_vsr_t *xb)                          =
      \
+#define VSX_SCALAR_CMP(op, tp, cmp, fld, svxvc)                         =
      \
+        void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,               =
      \
+                ppc_vsr_t *xa, ppc_vsr_t *xb)                           =
      \
 {                                                                       =
      \
-    ppc_vsr_t t =3D *xt;                                                =
        \
-    bool vxsnan_flag =3D false, vxvc_flag =3D false, vex_flag =3D false;=
            \
+    int flags;                                                          =
      \
+    bool r, vxvc;                                                       =
      \
                                                                         =
      \
-    if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||       =
      \
-        float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {       =
      \
-        vxsnan_flag =3D true;                                           =
        \
-        if (fpscr_ve =3D=3D 0 && svxvc) {                               =
          \
-            vxvc_flag =3D true;                                         =
        \
-        }                                                               =
      \
-    } else if (svxvc) {                                                 =
      \
-        vxvc_flag =3D float64_is_quiet_nan(xa->VsrD(0), &env->fp_status)=
 ||     \
-            float64_is_quiet_nan(xb->VsrD(0), &env->fp_status);         =
      \
-    }                                                                   =
      \
-    if (vxsnan_flag) {                                                  =
      \
-        float_invalid_op_vxsnan(env, GETPC());                          =
      \
-    }                                                                   =
      \
-    if (vxvc_flag) {                                                    =
      \
-        float_invalid_op_vxvc(env, 0, GETPC());                         =
      \
+    helper_reset_fpstatus(env);                                         =
      \
+                                                                        =
      \
+    if (svxvc) {                                                        =
      \
+        r =3D tp##_##cmp(xb->fld, xa->fld, &env->fp_status);            =
        \
+    } else {                                                            =
      \
+        r =3D tp##_##cmp##_quiet(xb->fld, xa->fld, &env->fp_status);    =
        \
     }                                                                   =
      \
-    vex_flag =3D fpscr_ve && (vxvc_flag || vxsnan_flag);                =
        \
                                                                         =
      \
-    if (!vex_flag) {                                                    =
      \
-        if (float64_##cmp(xb->VsrD(0), xa->VsrD(0),                     =
      \
-                          &env->fp_status) =3D=3D exp) {                =
          \
-            t.VsrD(0) =3D -1;                                           =
        \
-            t.VsrD(1) =3D 0;                                            =
        \
-        } else {                                                        =
      \
-            t.VsrD(0) =3D 0;                                            =
        \
-            t.VsrD(1) =3D 0;                                            =
        \
+    flags =3D get_float_exception_flags(&env->fp_status);               =
        \
+    if (unlikely(flags & float_flag_invalid)) {                         =
      \
+        vxvc =3D svxvc;                                                 =
        \
+        if (flags & float_flag_invalid_snan) {                          =
      \
+            float_invalid_op_vxsnan(env, GETPC());                      =
      \
+            vxvc &=3D fpscr_ve =3D=3D 0;                                =
            \
+        }                                                               =
      \
+        if (vxvc) {                                                     =
      \
+            float_invalid_op_vxvc(env, 0, GETPC());                     =
      \
         }                                                               =
      \
     }                                                                   =
      \
-    *xt =3D t;                                                          =
        \
+                                                                        =
      \
+    memset(xt, 0, sizeof(*xt));                                         =
      \
+    memset(&xt->fld, -r, sizeof(xt->fld));                              =
      \
     do_float_check_status(env, GETPC());                                =
      \
 }
=20
-VSX_SCALAR_CMP_DP(xscmpeqdp, eq, 1, 0)
-VSX_SCALAR_CMP_DP(xscmpgedp, le, 1, 1)
-VSX_SCALAR_CMP_DP(xscmpgtdp, lt, 1, 1)
+VSX_SCALAR_CMP(xscmpeqdp, float64, eq, VsrD(0), 0)
+VSX_SCALAR_CMP(xscmpgedp, float64, le, VsrD(0), 1)
+VSX_SCALAR_CMP(xscmpgtdp, float64, lt, VsrD(0), 1)
=20
 void helper_xscmpexpdp(CPUPPCState *env, uint32_t opcode,
                        ppc_vsr_t *xa, ppc_vsr_t *xb)
--=20
2.34.1


