Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA124CA425
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:49:42 +0100 (CET)
Received: from localhost ([::1]:46100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNUD-0001Ji-52
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:49:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqx-0000pZ-Fh; Wed, 02 Mar 2022 06:09:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqu-0001nc-AD; Wed, 02 Mar 2022 06:09:07 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AIGdq003435; 
 Wed, 2 Mar 2022 11:08:37 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6q9gwrd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:36 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2cxF011479;
 Wed, 2 Mar 2022 11:08:34 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjpg5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 222AvbFH30212418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 10:57:37 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5012CAE05D;
 Wed,  2 Mar 2022 11:08:32 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17C0BAE058;
 Wed,  2 Mar 2022 11:08:32 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:32 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5F4D22201C1;
 Wed,  2 Mar 2022 12:08:31 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 36/87] target/ppc: move xxperm/xxpermr to decodetree
Date: Wed,  2 Mar 2022 12:07:12 +0100
Message-Id: <20220302110803.849505-37-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cBfW-hSrIti-yuk833Xk4DwIiAQAHIBB
X-Proofpoint-GUID: cBfW-hSrIti-yuk833Xk4DwIiAQAHIBB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=698
 priorityscore=1501 phishscore=0 clxscore=1034 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-31-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 |  2 --
 target/ppc/insn32.decode            |  5 ++++
 target/ppc/fpu_helper.c             | 21 ---------------
 target/ppc/translate/vsx-impl.c.inc | 42 +++++++++++++++++++++++++++--
 target/ppc/translate/vsx-ops.c.inc  |  2 --
 5 files changed, 45 insertions(+), 27 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 430e75b31f25..233800213658 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -494,8 +494,6 @@ DEF_HELPER_3(xvrspic, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspim, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspip, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspiz, void, env, vsr, vsr)
-DEF_HELPER_4(xxperm, void, env, vsr, vsr, vsr)
-DEF_HELPER_4(xxpermr, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xxextractuw, void, env, vsr, vsr, i32)
 DEF_HELPER_4(xxinsertw, void, env, vsr, vsr, i32)
 DEF_HELPER_3(xvxsigsp, void, env, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 66cb9184cdab..3de4a32e3866 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -604,6 +604,11 @@ STXVPX          011111 ..... ..... ..... 0111001101 =
-   @X_TSXP
 XXSPLTIB        111100 ..... 00 ........ 0101101000 .   @X_imm8
 XXSPLTW         111100 ..... ---.. ..... 010100100 . .  @XX2
=20
+## VSX Permute Instructions
+
+XXPERM          111100 ..... ..... ..... 00011010 ...   @XX3
+XXPERMR         111100 ..... ..... ..... 00111010 ...   @XX3
+
 XXSEL           111100 ..... ..... ..... ..... 11 ....  @XX4
=20
 ## VSX Vector Load Special Value Instruction
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index bd76bee7f1e7..0fd285defc7c 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -3055,27 +3055,6 @@ uint64_t helper_xsrsp(CPUPPCState *env, uint64_t x=
b)
     return xt;
 }
=20
-#define VSX_XXPERM(op, indexed)                                       \
-void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                     \
-                 ppc_vsr_t *xa, ppc_vsr_t *pcv)                       \
-{                                                                     \
-    ppc_vsr_t t =3D *xt;                                                =
\
-    int i, idx;                                                       \
-                                                                      \
-    for (i =3D 0; i < 16; i++) {                                        =
\
-        idx =3D pcv->VsrB(i) & 0x1F;                                    =
\
-        if (indexed) {                                                \
-            idx =3D 31 - idx;                                           =
\
-        }                                                             \
-        t.VsrB(i) =3D (idx <=3D 15) ? xa->VsrB(idx)                     =
  \
-                                : xt->VsrB(idx - 16);                 \
-    }                                                                 \
-    *xt =3D t;                                                          =
\
-}
-
-VSX_XXPERM(xxperm, 0)
-VSX_XXPERM(xxpermr, 1)
-
 void helper_xvxsigsp(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)
 {
     ppc_vsr_t t =3D { };
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index 48e4a2e26645..7ce90f18a502 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1200,8 +1200,46 @@ GEN_VSX_HELPER_X2(xvrspip, 0x12, 0x0A, 0, PPC2_VSX=
)
 GEN_VSX_HELPER_X2(xvrspiz, 0x12, 0x09, 0, PPC2_VSX)
 GEN_VSX_HELPER_2(xvtstdcsp, 0x14, 0x1A, 0, PPC2_VSX)
 GEN_VSX_HELPER_2(xvtstdcdp, 0x14, 0x1E, 0, PPC2_VSX)
-GEN_VSX_HELPER_X3(xxperm, 0x08, 0x03, 0, PPC2_ISA300)
-GEN_VSX_HELPER_X3(xxpermr, 0x08, 0x07, 0, PPC2_ISA300)
+
+static bool trans_XXPERM(DisasContext *ctx, arg_XX3 *a)
+{
+    TCGv_ptr xt, xa, xb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VSX(ctx);
+
+    xt =3D gen_vsr_ptr(a->xt);
+    xa =3D gen_vsr_ptr(a->xa);
+    xb =3D gen_vsr_ptr(a->xb);
+
+    gen_helper_VPERM(xt, xa, xt, xb);
+
+    tcg_temp_free_ptr(xt);
+    tcg_temp_free_ptr(xa);
+    tcg_temp_free_ptr(xb);
+
+    return true;
+}
+
+static bool trans_XXPERMR(DisasContext *ctx, arg_XX3 *a)
+{
+    TCGv_ptr xt, xa, xb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VSX(ctx);
+
+    xt =3D gen_vsr_ptr(a->xt);
+    xa =3D gen_vsr_ptr(a->xa);
+    xb =3D gen_vsr_ptr(a->xb);
+
+    gen_helper_VPERMR(xt, xa, xt, xb);
+
+    tcg_temp_free_ptr(xt);
+    tcg_temp_free_ptr(xa);
+    tcg_temp_free_ptr(xb);
+
+    return true;
+}
=20
 #define GEN_VSX_HELPER_VSX_MADD(name, op1, aop, mop, inval, type)       =
      \
 static void gen_##name(DisasContext *ctx)                               =
      \
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vs=
x-ops.c.inc
index b0dbb38c80f6..86ed1a996a53 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -341,8 +341,6 @@ VSX_LOGICAL(xxlnand, 0x8, 0x16, PPC2_VSX207),
 VSX_LOGICAL(xxlorc, 0x8, 0x15, PPC2_VSX207),
 GEN_XX3FORM(xxmrghw, 0x08, 0x02, PPC2_VSX),
 GEN_XX3FORM(xxmrglw, 0x08, 0x06, PPC2_VSX),
-GEN_XX3FORM(xxperm, 0x08, 0x03, PPC2_ISA300),
-GEN_XX3FORM(xxpermr, 0x08, 0x07, PPC2_ISA300),
 GEN_XX3FORM_DM(xxsldwi, 0x08, 0x00),
 GEN_XX2FORM_EXT(xxextractuw, 0x0A, 0x0A, PPC2_ISA300),
 GEN_XX2FORM_EXT(xxinsertw, 0x0A, 0x0B, PPC2_ISA300),
--=20
2.34.1


