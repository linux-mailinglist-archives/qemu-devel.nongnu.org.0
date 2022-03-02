Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 407A54CA405
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:43:32 +0100 (CET)
Received: from localhost ([::1]:34788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNOF-00021c-9V
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:43:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqy-0000sU-D3; Wed, 02 Mar 2022 06:09:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55482
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqw-0001o4-Kf; Wed, 02 Mar 2022 06:09:08 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228mh1D014300; 
 Wed, 2 Mar 2022 11:08:35 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej5d9jkfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:35 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2b7k011446;
 Wed, 2 Mar 2022 11:08:33 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjpg5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:33 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8Vge53150090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:31 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E29411C05C;
 Wed,  2 Mar 2022 11:08:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C03F911C054;
 Wed,  2 Mar 2022 11:08:30 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:30 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 124282201C1;
 Wed,  2 Mar 2022 12:08:30 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 34/87] target/ppc: Move vsel and vperm/vpermr to decodetree
Date: Wed,  2 Mar 2022 12:07:10 +0100
Message-Id: <20220302110803.849505-35-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _ZaGwQhjgnfyBAFfB3mQfBNXzCLgco9Q
X-Proofpoint-ORIG-GUID: _ZaGwQhjgnfyBAFfB3mQfBNXzCLgco9Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 impostorscore=0 clxscore=1034 spamscore=0 adultscore=0
 mlxlogscore=698 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Message-Id: <20220225210936.1749575-29-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 |  5 +--
 target/ppc/insn32.decode            |  5 +++
 target/ppc/int_helper.c             | 13 +-----
 target/ppc/translate/vmx-impl.c.inc | 69 ++++++++++++++++++++++-------
 target/ppc/translate/vmx-ops.c.inc  |  2 -
 5 files changed, 62 insertions(+), 32 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 4fa81093ca3b..430e75b31f25 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -225,9 +225,8 @@ DEF_HELPER_2(vupklsh, void, avr, avr)
 DEF_HELPER_2(vupklsw, void, avr, avr)
 DEF_HELPER_5(vmsumubm, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsummbm, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vsel, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vperm, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vpermr, void, env, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VPERM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VPERMR, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_4(vpkshss, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkshus, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkswss, void, env, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index abc2007129d9..0a3ada2b663a 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -467,6 +467,11 @@ VINSWVRX        000100 ..... ..... ..... 00110001111=
    @VX
 VSLDBI          000100 ..... ..... ..... 00 ... 010110  @VN
 VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
=20
+VPERM           000100 ..... ..... ..... ..... 101011   @VA
+VPERMR          000100 ..... ..... ..... ..... 111011   @VA
+
+VSEL            000100 ..... ..... ..... ..... 101010   @VA
+
 ## Vector Integer Shift Instruction
=20
 VSLB            000100 ..... ..... ..... 00100000100    @VX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index f52242ca812e..6c63c7b2278c 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1015,8 +1015,7 @@ VMUL(UW, u32, VsrW, VsrD, uint64_t)
 #undef VMUL_DO_ODD
 #undef VMUL
=20
-void helper_vperm(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_=
t *b,
-                  ppc_avr_t *c)
+void helper_VPERM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c=
)
 {
     ppc_avr_t result;
     int i;
@@ -1034,8 +1033,7 @@ void helper_vperm(CPUPPCState *env, ppc_avr_t *r, p=
pc_avr_t *a, ppc_avr_t *b,
     *r =3D result;
 }
=20
-void helper_vpermr(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr=
_t *b,
-                  ppc_avr_t *c)
+void helper_VPERMR(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *=
c)
 {
     ppc_avr_t result;
     int i;
@@ -1303,13 +1301,6 @@ VRLMI(VRLWMI, 32, u32, 1);
 VRLMI(VRLDNM, 64, u64, 0);
 VRLMI(VRLWNM, 32, u32, 0);
=20
-void helper_vsel(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t=
 *b,
-                 ppc_avr_t *c)
-{
-    r->u64[0] =3D (a->u64[0] & ~c->u64[0]) | (b->u64[0] & c->u64[0]);
-    r->u64[1] =3D (a->u64[1] & ~c->u64[1]) | (b->u64[1] & c->u64[1]);
-}
-
 void helper_vexptefp(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *b)
 {
     int i;
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index 352250fad087..f91bee839d94 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2559,28 +2559,65 @@ static void gen_vmladduhm(DisasContext *ctx)
     tcg_temp_free_ptr(rd);
 }
=20
-static void gen_vpermr(DisasContext *ctx)
+static bool trans_VPERM(DisasContext *ctx, arg_VA *a)
 {
-    TCGv_ptr ra, rb, rc, rd;
-    if (unlikely(!ctx->altivec_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_VPU);
-        return;
-    }
-    ra =3D gen_avr_ptr(rA(ctx->opcode));
-    rb =3D gen_avr_ptr(rB(ctx->opcode));
-    rc =3D gen_avr_ptr(rC(ctx->opcode));
-    rd =3D gen_avr_ptr(rD(ctx->opcode));
-    gen_helper_vpermr(cpu_env, rd, ra, rb, rc);
-    tcg_temp_free_ptr(ra);
-    tcg_temp_free_ptr(rb);
-    tcg_temp_free_ptr(rc);
-    tcg_temp_free_ptr(rd);
+    TCGv_ptr vrt, vra, vrb, vrc;
+
+    REQUIRE_INSNS_FLAGS(ctx, ALTIVEC);
+    REQUIRE_VECTOR(ctx);
+
+    vrt =3D gen_avr_ptr(a->vrt);
+    vra =3D gen_avr_ptr(a->vra);
+    vrb =3D gen_avr_ptr(a->vrb);
+    vrc =3D gen_avr_ptr(a->rc);
+
+    gen_helper_VPERM(vrt, vra, vrb, vrc);
+
+    tcg_temp_free_ptr(vrt);
+    tcg_temp_free_ptr(vra);
+    tcg_temp_free_ptr(vrb);
+    tcg_temp_free_ptr(vrc);
+
+    return true;
+}
+
+static bool trans_VPERMR(DisasContext *ctx, arg_VA *a)
+{
+    TCGv_ptr vrt, vra, vrb, vrc;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VECTOR(ctx);
+
+    vrt =3D gen_avr_ptr(a->vrt);
+    vra =3D gen_avr_ptr(a->vra);
+    vrb =3D gen_avr_ptr(a->vrb);
+    vrc =3D gen_avr_ptr(a->rc);
+
+    gen_helper_VPERMR(vrt, vra, vrb, vrc);
+
+    tcg_temp_free_ptr(vrt);
+    tcg_temp_free_ptr(vra);
+    tcg_temp_free_ptr(vrb);
+    tcg_temp_free_ptr(vrc);
+
+    return true;
+}
+
+static bool trans_VSEL(DisasContext *ctx, arg_VA *a)
+{
+    REQUIRE_INSNS_FLAGS(ctx, ALTIVEC);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_bitsel(MO_64, avr_full_offset(a->vrt), avr_full_offset(=
a->rc),
+                        avr_full_offset(a->vrb), avr_full_offset(a->vra)=
,
+                        16, 16);
+
+    return true;
 }
=20
 GEN_VAFORM_PAIRED(vmsumubm, vmsummbm, 18)
 GEN_VAFORM_PAIRED(vmsumuhm, vmsumuhs, 19)
 GEN_VAFORM_PAIRED(vmsumshm, vmsumshs, 20)
-GEN_VAFORM_PAIRED(vsel, vperm, 21)
 GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23)
=20
 GEN_VXFORM_NOA(vclzb, 1, 28)
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vm=
x-ops.c.inc
index 3a8a9cc564a2..d960648d5231 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -194,7 +194,6 @@ GEN_VXFORM_300_EO(vctzw, 0x01, 0x18, 0x1E),
 GEN_VXFORM_300_EO(vctzd, 0x01, 0x18, 0x1F),
 GEN_VXFORM_300_EO(vclzlsbb, 0x01, 0x18, 0x0),
 GEN_VXFORM_300_EO(vctzlsbb, 0x01, 0x18, 0x1),
-GEN_VXFORM_300(vpermr, 0x1D, 0xFF),
=20
 #define GEN_VXFORM_NOA(name, opc2, opc3)                                =
\
     GEN_HANDLER(name, 0x04, opc2, opc3, 0x001f0000, PPC_ALTIVEC)
@@ -229,7 +228,6 @@ GEN_VAFORM_PAIRED(vmhaddshs, vmhraddshs, 16),
 GEN_VAFORM_PAIRED(vmsumubm, vmsummbm, 18),
 GEN_VAFORM_PAIRED(vmsumuhm, vmsumuhs, 19),
 GEN_VAFORM_PAIRED(vmsumshm, vmsumshs, 20),
-GEN_VAFORM_PAIRED(vsel, vperm, 21),
 GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23),
=20
 GEN_VXFORM_DUAL(vclzb, vpopcntb, 1, 28, PPC_NONE, PPC2_ALTIVEC_207),
--=20
2.34.1


