Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DCC4760BE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:29:09 +0100 (CET)
Received: from localhost ([::1]:39676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZ1Y-0005Jh-Tg
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:29:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiU-0005R0-TR; Wed, 15 Dec 2021 12:05:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiS-0004nv-GL; Wed, 15 Dec 2021 12:05:22 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGknrB033034; 
 Wed, 15 Dec 2021 17:04:54 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyjdw358v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:53 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3x9K024503;
 Wed, 15 Dec 2021 17:04:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3cy78h78yt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:51 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4mc631392028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFD5042042;
 Wed, 15 Dec 2021 17:04:48 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F04C4204C;
 Wed, 15 Dec 2021 17:04:48 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:48 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C83C5220295;
 Wed, 15 Dec 2021 18:04:47 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 078/102] target/ppc: move xscvqpdp to decodetree
Date: Wed, 15 Dec 2021 18:03:33 +0100
Message-Id: <20211215170357.321643-66-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KsJb_MQRCJNR_LmMxWe7vM4h8W_U1aVt
X-Proofpoint-ORIG-GUID: KsJb_MQRCJNR_LmMxWe7vM4h8W_U1aVt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1034 mlxscore=0 priorityscore=1501 mlxlogscore=749 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150098
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
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211213120958.24443-5-victor.colombo@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 |  2 +-
 target/ppc/insn32.decode            |  4 ++++
 target/ppc/fpu_helper.c             | 10 +++-------
 target/ppc/translate/vsx-impl.c.inc | 24 +++++++++++++-----------
 target/ppc/translate/vsx-ops.c.inc  |  1 -
 5 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index fb946dc97420..d166323b641c 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -411,7 +411,7 @@ DEF_HELPER_3(xscvdphp, void, env, vsr, vsr)
 DEF_HELPER_4(xscvdpqp, void, env, i32, vsr, vsr)
 DEF_HELPER_3(xscvdpsp, void, env, vsr, vsr)
 DEF_HELPER_2(xscvdpspn, i64, env, i64)
-DEF_HELPER_4(xscvqpdp, void, env, i32, vsr, vsr)
+DEF_HELPER_4(XSCVQPDP, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpsdz, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpswz, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpudz, void, env, i32, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 97b2476ce61b..8bdc059a4c79 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -466,3 +466,7 @@ XSMAXCDP        111100 ..... ..... ..... 10000000 ...=
   @XX3
 XSMINCDP        111100 ..... ..... ..... 10001000 ...   @XX3
 XSMAXJDP        111100 ..... ..... ..... 10010000 ...   @XX3
 XSMINJDP        111100 ..... ..... ..... 10011000 ...   @XX3
+
+## VSX Binary Floating-Point Convert Instructions
+
+XSCVQPDP        111111 ..... 10100 ..... 1101000100 .   @X_tb_rc
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index d144f21dc04f..700c79156b06 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2751,18 +2751,14 @@ VSX_CVT_FP_TO_FP_HP(xscvhpdp, 1, float16, float64=
, VsrH(3), VsrD(0), 1)
 VSX_CVT_FP_TO_FP_HP(xvcvsphp, 4, float32, float16, VsrW(i), VsrH(2 * i  =
+ 1), 0)
 VSX_CVT_FP_TO_FP_HP(xvcvhpsp, 4, float16, float32, VsrH(2 * i + 1), VsrW=
(i), 0)
=20
-/*
- * xscvqpdp isn't using VSX_CVT_FP_TO_FP() because xscvqpdpo will be
- * added to this later.
- */
-void helper_xscvqpdp(CPUPPCState *env, uint32_t opcode,
-                     ppc_vsr_t *xt, ppc_vsr_t *xb)
+void helper_XSCVQPDP(CPUPPCState *env, uint32_t ro, ppc_vsr_t *xt,
+                     ppc_vsr_t *xb)
 {
     ppc_vsr_t t =3D { };
     float_status tstat;
=20
     tstat =3D env->fp_status;
-    if (unlikely(Rc(opcode) !=3D 0)) {
+    if (ro !=3D 0) {
         tstat.float_rounding_mode =3D float_round_to_odd;
     }
=20
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index ab5cb21f13a1..c08185e857e9 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -904,22 +904,24 @@ VSX_CMP(xvcmpgesp, 0x0C, 0x0A, 0, PPC2_VSX)
 VSX_CMP(xvcmpgtsp, 0x0C, 0x09, 0, PPC2_VSX)
 VSX_CMP(xvcmpnesp, 0x0C, 0x0B, 0, PPC2_VSX)
=20
-static void gen_xscvqpdp(DisasContext *ctx)
+static bool trans_XSCVQPDP(DisasContext *ctx, arg_X_tb_rc *a)
 {
-    TCGv_i32 opc;
+    TCGv_i32 ro;
     TCGv_ptr xt, xb;
-    if (unlikely(!ctx->vsx_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_VSXU);
-        return;
-    }
-    opc =3D tcg_const_i32(ctx->opcode);
=20
-    xt =3D gen_vsr_ptr(rD(ctx->opcode) + 32);
-    xb =3D gen_vsr_ptr(rB(ctx->opcode) + 32);
-    gen_helper_xscvqpdp(cpu_env, opc, xt, xb);
-    tcg_temp_free_i32(opc);
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VSX(ctx);
+
+    ro =3D tcg_const_i32(a->rc);
+
+    xt =3D gen_avr_ptr(a->rt);
+    xb =3D gen_avr_ptr(a->rb);
+    gen_helper_XSCVQPDP(cpu_env, ro, xt, xb);
+    tcg_temp_free_i32(ro);
     tcg_temp_free_ptr(xt);
     tcg_temp_free_ptr(xb);
+
+    return true;
 }
=20
 #define GEN_VSX_HELPER_2(name, op1, op2, inval, type)                   =
      \
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vs=
x-ops.c.inc
index f980bc1bae47..c974324c4c82 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -133,7 +133,6 @@ GEN_VSX_XFORM_300_EO(xsnabsqp, 0x04, 0x19, 0x08, 0x00=
000001),
 GEN_VSX_XFORM_300_EO(xsnegqp, 0x04, 0x19, 0x10, 0x00000001),
 GEN_VSX_XFORM_300(xscpsgnqp, 0x04, 0x03, 0x00000001),
 GEN_VSX_XFORM_300_EO(xscvdpqp, 0x04, 0x1A, 0x16, 0x00000001),
-GEN_VSX_XFORM_300_EO(xscvqpdp, 0x04, 0x1A, 0x14, 0x0),
 GEN_VSX_XFORM_300_EO(xscvqpsdz, 0x04, 0x1A, 0x19, 0x00000001),
 GEN_VSX_XFORM_300_EO(xscvqpswz, 0x04, 0x1A, 0x09, 0x00000001),
 GEN_VSX_XFORM_300_EO(xscvqpudz, 0x04, 0x1A, 0x11, 0x00000001),
--=20
2.31.1


