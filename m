Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A084CA44A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:56:19 +0100 (CET)
Received: from localhost ([::1]:34220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNaa-0004Bz-Ot
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:56:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrA-0001KK-5E; Wed, 02 Mar 2022 06:09:20 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr6-0001qH-G2; Wed, 02 Mar 2022 06:09:19 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228khxv030964; 
 Wed, 2 Mar 2022 11:08:46 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej5ccar1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:46 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2a90027215;
 Wed, 2 Mar 2022 11:08:44 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3efbu9d1sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:44 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8gv351118560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:42 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F16E24C040;
 Wed,  2 Mar 2022 11:08:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE1714C04A;
 Wed,  2 Mar 2022 11:08:41 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:41 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 00C352201C1;
 Wed,  2 Mar 2022 12:08:40 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 50/87] target/ppc: Refactor VSX_MAX_MINC helper
Date: Wed,  2 Mar 2022 12:07:26 +0100
Message-Id: <20220302110803.849505-51-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FzYRwSPOY_Ek8DrpJbgUBoPOz1H7UVqw
X-Proofpoint-GUID: FzYRwSPOY_Ek8DrpJbgUBoPOz1H7UVqw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1034 bulkscore=0
 mlxlogscore=635 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
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
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>

Refactor xs{max,min}cdp VSX_MAX_MINC helper to prepare for
xs{max,min}cqp implementation.

Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-45-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c | 41 +++++++++++++++++------------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 4bfa1c428311..0aaf529ac8d0 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2533,40 +2533,33 @@ VSX_MAX_MIN(xsmindp, minnum, 1, float64, VsrD(0))
 VSX_MAX_MIN(xvmindp, minnum, 2, float64, VsrD(i))
 VSX_MAX_MIN(xvminsp, minnum, 4, float32, VsrW(i))
=20
-#define VSX_MAX_MINC(name, max)                                         =
      \
+#define VSX_MAX_MINC(name, max, tp, fld)                                =
      \
 void helper_##name(CPUPPCState *env,                                    =
      \
                    ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)         =
      \
 {                                                                       =
      \
     ppc_vsr_t t =3D { };                                                =
        \
-    bool vxsnan_flag =3D false, vex_flag =3D false;                     =
          \
+    bool first;                                                         =
      \
                                                                         =
      \
-    if (unlikely(float64_is_any_nan(xa->VsrD(0)) ||                     =
      \
-                 float64_is_any_nan(xb->VsrD(0)))) {                    =
      \
-        if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||   =
      \
-            float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {   =
      \
-            vxsnan_flag =3D true;                                       =
        \
-        }                                                               =
      \
-        t.VsrD(0) =3D xb->VsrD(0);                                      =
        \
-    } else if ((max &&                                                  =
      \
-               !float64_lt(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) |=
|     \
-               (!max &&                                                 =
      \
-               float64_lt(xa->VsrD(0), xb->VsrD(0), &env->fp_status))) {=
      \
-        t.VsrD(0) =3D xa->VsrD(0);                                      =
        \
+    if (max) {                                                          =
      \
+        first =3D tp##_le_quiet(xb->fld, xa->fld, &env->fp_status);     =
        \
     } else {                                                            =
      \
-        t.VsrD(0) =3D xb->VsrD(0);                                      =
        \
+        first =3D tp##_lt_quiet(xa->fld, xb->fld, &env->fp_status);     =
        \
     }                                                                   =
      \
                                                                         =
      \
-    vex_flag =3D fpscr_ve & vxsnan_flag;                                =
        \
-    if (vxsnan_flag) {                                                  =
      \
-        float_invalid_op_vxsnan(env, GETPC());                          =
      \
-    }                                                                   =
      \
-    if (!vex_flag) {                                                    =
      \
-        *xt =3D t;                                                      =
        \
+    if (first) {                                                        =
      \
+        t.fld =3D xa->fld;                                              =
        \
+    } else {                                                            =
      \
+        t.fld =3D xb->fld;                                              =
        \
+        if (env->fp_status.float_exception_flags & float_flag_invalid_sn=
an) { \
+            float_invalid_op_vxsnan(env, GETPC());                      =
      \
+        }                                                               =
      \
     }                                                                   =
      \
-}                                                                       =
      \
+                                                                        =
      \
+    *xt =3D t;                                                          =
        \
+}
=20
-VSX_MAX_MINC(XSMAXCDP, 1);
-VSX_MAX_MINC(XSMINCDP, 0);
+VSX_MAX_MINC(XSMAXCDP, true, float64, VsrD(0));
+VSX_MAX_MINC(XSMINCDP, false, float64, VsrD(0));
=20
 #define VSX_MAX_MINJ(name, max)                                         =
      \
 void helper_##name(CPUPPCState *env,                                    =
      \
--=20
2.34.1


