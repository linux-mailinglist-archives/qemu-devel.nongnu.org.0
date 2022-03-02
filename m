Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5574CA41F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:49:07 +0100 (CET)
Received: from localhost ([::1]:44624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNTe-0000Ju-4Q
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:49:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr0-0000yO-4F; Wed, 02 Mar 2022 06:09:10 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62066
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqy-0001oG-C3; Wed, 02 Mar 2022 06:09:09 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AmT2X030366; 
 Wed, 2 Mar 2022 11:08:37 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej75ercht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:37 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2bkn022345;
 Wed, 2 Mar 2022 11:08:35 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3efbu9d1vv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:35 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8XA638142328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:33 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06271A407D;
 Wed,  2 Mar 2022 11:08:33 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7021A407C;
 Wed,  2 Mar 2022 11:08:32 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:32 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 0A9D5220294;
 Wed,  2 Mar 2022 12:08:31 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 37/87] target/ppc: Move xxpermdi to decodetree
Date: Wed,  2 Mar 2022 12:07:13 +0100
Message-Id: <20220302110803.849505-38-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: g8eU7_aN-jpSLo9LhzU7Gv8UZJ4nHNoM
X-Proofpoint-GUID: g8eU7_aN-jpSLo9LhzU7Gv8UZJ4nHNoM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=783
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Message-Id: <20220225210936.1749575-32-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  4 ++
 target/ppc/translate/vsx-impl.c.inc | 71 +++++++++++++----------------
 target/ppc/translate/vsx-ops.c.inc  |  2 -
 3 files changed, 36 insertions(+), 41 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 3de4a32e3866..b8dbac553e33 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -155,6 +155,9 @@
 &XX3            xt xa xb
 @XX3            ...... ..... ..... ..... ........ ...           &XX3 xt=3D=
%xx_xt xa=3D%xx_xa xb=3D%xx_xb
=20
+&XX3_dm         xt xa xb dm
+@XX3_dm         ...... ..... ..... ..... . dm:2 ..... ...       &XX3_dm =
xt=3D%xx_xt xa=3D%xx_xa xb=3D%xx_xb
+
 &XX4            xt xa xb xc
 @XX4            ...... ..... ..... ..... ..... .. ....          &XX4 xt=3D=
%xx_xt xa=3D%xx_xa xb=3D%xx_xb xc=3D%xx_xc
=20
@@ -608,6 +611,7 @@ XXSPLTW         111100 ..... ---.. ..... 010100100 . =
.  @XX2
=20
 XXPERM          111100 ..... ..... ..... 00011010 ...   @XX3
 XXPERMR         111100 ..... ..... ..... 00111010 ...   @XX3
+XXPERMDI        111100 ..... ..... ..... 0 .. 01010 ... @XX3_dm
=20
 XXSEL           111100 ..... ..... ..... ..... 11 ....  @XX4
=20
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index 7ce90f18a502..cdefa1359065 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -665,45 +665,6 @@ static void gen_mtvsrws(DisasContext *ctx)
=20
 #endif
=20
-static void gen_xxpermdi(DisasContext *ctx)
-{
-    TCGv_i64 xh, xl;
-
-    if (unlikely(!ctx->vsx_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_VSXU);
-        return;
-    }
-
-    xh =3D tcg_temp_new_i64();
-    xl =3D tcg_temp_new_i64();
-
-    if (unlikely((xT(ctx->opcode) =3D=3D xA(ctx->opcode)) ||
-                 (xT(ctx->opcode) =3D=3D xB(ctx->opcode)))) {
-        get_cpu_vsr(xh, xA(ctx->opcode), (DM(ctx->opcode) & 2) =3D=3D 0)=
;
-        get_cpu_vsr(xl, xB(ctx->opcode), (DM(ctx->opcode) & 1) =3D=3D 0)=
;
-
-        set_cpu_vsr(xT(ctx->opcode), xh, true);
-        set_cpu_vsr(xT(ctx->opcode), xl, false);
-    } else {
-        if ((DM(ctx->opcode) & 2) =3D=3D 0) {
-            get_cpu_vsr(xh, xA(ctx->opcode), true);
-            set_cpu_vsr(xT(ctx->opcode), xh, true);
-        } else {
-            get_cpu_vsr(xh, xA(ctx->opcode), false);
-            set_cpu_vsr(xT(ctx->opcode), xh, true);
-        }
-        if ((DM(ctx->opcode) & 1) =3D=3D 0) {
-            get_cpu_vsr(xl, xB(ctx->opcode), true);
-            set_cpu_vsr(xT(ctx->opcode), xl, false);
-        } else {
-            get_cpu_vsr(xl, xB(ctx->opcode), false);
-            set_cpu_vsr(xT(ctx->opcode), xl, false);
-        }
-    }
-    tcg_temp_free_i64(xh);
-    tcg_temp_free_i64(xl);
-}
-
 #define OP_ABS 1
 #define OP_NABS 2
 #define OP_NEG 3
@@ -1241,6 +1202,38 @@ static bool trans_XXPERMR(DisasContext *ctx, arg_X=
X3 *a)
     return true;
 }
=20
+static bool trans_XXPERMDI(DisasContext *ctx, arg_XX3_dm *a)
+{
+    TCGv_i64 t0, t1;
+
+    REQUIRE_INSNS_FLAGS2(ctx, VSX);
+    REQUIRE_VSX(ctx);
+
+    t0 =3D tcg_temp_new_i64();
+
+    if (unlikely(a->xt =3D=3D a->xa || a->xt =3D=3D a->xb)) {
+        t1 =3D tcg_temp_new_i64();
+
+        get_cpu_vsr(t0, a->xa, (a->dm & 2) =3D=3D 0);
+        get_cpu_vsr(t1, a->xb, (a->dm & 1) =3D=3D 0);
+
+        set_cpu_vsr(a->xt, t0, true);
+        set_cpu_vsr(a->xt, t1, false);
+
+        tcg_temp_free_i64(t1);
+    } else {
+        get_cpu_vsr(t0, a->xa, (a->dm & 2) =3D=3D 0);
+        set_cpu_vsr(a->xt, t0, true);
+
+        get_cpu_vsr(t0, a->xb, (a->dm & 1) =3D=3D 0);
+        set_cpu_vsr(a->xt, t0, false);
+    }
+
+    tcg_temp_free_i64(t0);
+
+    return true;
+}
+
 #define GEN_VSX_HELPER_VSX_MADD(name, op1, aop, mop, inval, type)       =
      \
 static void gen_##name(DisasContext *ctx)                               =
      \
 {                                                                       =
      \
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vs=
x-ops.c.inc
index 86ed1a996a53..0a6b2b31ac84 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -344,5 +344,3 @@ GEN_XX3FORM(xxmrglw, 0x08, 0x06, PPC2_VSX),
 GEN_XX3FORM_DM(xxsldwi, 0x08, 0x00),
 GEN_XX2FORM_EXT(xxextractuw, 0x0A, 0x0A, PPC2_ISA300),
 GEN_XX2FORM_EXT(xxinsertw, 0x0A, 0x0B, PPC2_ISA300),
-
-GEN_XX3FORM_DM(xxpermdi, 0x08, 0x01),
--=20
2.34.1


