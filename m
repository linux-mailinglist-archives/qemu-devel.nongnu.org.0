Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA094CA454
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:00:00 +0100 (CET)
Received: from localhost ([::1]:42808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNeB-000200-9I
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:59:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr1-00012C-Ro; Wed, 02 Mar 2022 06:09:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqz-0001om-RC; Wed, 02 Mar 2022 06:09:11 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AIHEN003446; 
 Wed, 2 Mar 2022 11:08:36 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6q9gwqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:36 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2mPO022555;
 Wed, 2 Mar 2022 11:08:34 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3efbu9efjj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:34 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8VwX52494738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:31 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD57B11C05B;
 Wed,  2 Mar 2022 11:08:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B85711C069;
 Wed,  2 Mar 2022 11:08:31 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:31 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B0BBF220294;
 Wed,  2 Mar 2022 12:08:30 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 35/87] target/ppc: Move xxsel to decodetree
Date: Wed,  2 Mar 2022 12:07:11 +0100
Message-Id: <20220302110803.849505-36-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wKkWaYl_kfllLiK1nHdufw-GThgkkWVZ
X-Proofpoint-GUID: wKkWaYl_kfllLiK1nHdufw-GThgkkWVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=894
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
Message-Id: <20220225210936.1749575-30-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  6 ++++
 target/ppc/insn64.decode            | 24 ++++++++--------
 target/ppc/translate/vsx-impl.c.inc | 20 ++++++--------
 target/ppc/translate/vsx-ops.c.inc  | 43 -----------------------------
 4 files changed, 26 insertions(+), 67 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 0a3ada2b663a..66cb9184cdab 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -148,12 +148,16 @@
 %xx_xt          0:1 21:5
 %xx_xb          1:1 11:5
 %xx_xa          2:1 16:5
+%xx_xc          3:1 6:5
 &XX2            xt xb uim:uint8_t
 @XX2            ...... ..... ... uim:2 ..... ......... ..       &XX2 xt=3D=
%xx_xt xb=3D%xx_xb
=20
 &XX3            xt xa xb
 @XX3            ...... ..... ..... ..... ........ ...           &XX3 xt=3D=
%xx_xt xa=3D%xx_xa xb=3D%xx_xb
=20
+&XX4            xt xa xb xc
+@XX4            ...... ..... ..... ..... ..... .. ....          &XX4 xt=3D=
%xx_xt xa=3D%xx_xa xb=3D%xx_xb xc=3D%xx_xc
+
 &Z22_bf_fra     bf fra dm
 @Z22_bf_fra     ...... bf:3 .. fra:5 dm:6 ......... .           &Z22_bf_=
fra
=20
@@ -600,6 +604,8 @@ STXVPX          011111 ..... ..... ..... 0111001101 -=
   @X_TSXP
 XXSPLTIB        111100 ..... 00 ........ 0101101000 .   @X_imm8
 XXSPLTW         111100 ..... ---.. ..... 010100100 . .  @XX2
=20
+XXSEL           111100 ..... ..... ..... ..... 11 ....  @XX4
+
 ## VSX Vector Load Special Value Instruction
=20
 LXVKQ           111100 ..... 11111 ..... 0101101000 .   @X_uim5
diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 39e610913dfd..9e4f531fb98b 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -44,15 +44,15 @@
                 ...... ..... ....  . ................ \
                 &8RR_D si=3D%8rr_si xt=3D%8rr_xt
=20
-# Format XX4
-&XX4            xt xa xb xc
-%xx4_xt         0:1 21:5
-%xx4_xa         2:1 16:5
-%xx4_xb         1:1 11:5
-%xx4_xc         3:1  6:5
-@XX4            ........ ........ ........ ........ \
+# Format 8RR:XX4
+%8rr_xx_xt      0:1 21:5
+%8rr_xx_xa      2:1 16:5
+%8rr_xx_xb      1:1 11:5
+%8rr_xx_xc      3:1  6:5
+&8RR_XX4        xt xa xb xc
+@8RR_XX4        ........ ........ ........ ........ \
                 ...... ..... ..... ..... ..... .. .... \
-                &XX4 xt=3D%xx4_xt xa=3D%xx4_xa xb=3D%xx4_xb xc=3D%xx4_xc
+                &8RR_XX4 xt=3D%8rr_xx_xt xa=3D%8rr_xx_xa xb=3D%8rr_xx_xb=
 xc=3D%8rr_xx_xc
=20
 ### Fixed-Point Load Instructions
=20
@@ -187,10 +187,10 @@ XXSPLTI32DX     000001 01 0000 -- -- ..............=
.. \
                 100000 ..... 000 .. ................    @8RR_D_IX
=20
 XXBLENDVD       000001 01 0000 -- ------------------ \
-                100001 ..... ..... ..... ..... 11 ....  @XX4
+                100001 ..... ..... ..... ..... 11 ....  @8RR_XX4
 XXBLENDVW       000001 01 0000 -- ------------------ \
-                100001 ..... ..... ..... ..... 10 ....  @XX4
+                100001 ..... ..... ..... ..... 10 ....  @8RR_XX4
 XXBLENDVH       000001 01 0000 -- ------------------ \
-                100001 ..... ..... ..... ..... 01 ....  @XX4
+                100001 ..... ..... ..... ..... 01 ....  @8RR_XX4
 XXBLENDVB       000001 01 0000 -- ------------------ \
-                100001 ..... ..... ..... ..... 00 ....  @XX4
+                100001 ..... ..... ..... ..... 00 ....  @8RR_XX4
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index e8a4ba0cfa60..48e4a2e26645 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1422,19 +1422,15 @@ static void glue(gen_, name)(DisasContext *ctx)  =
           \
 VSX_XXMRG(xxmrghw, 1)
 VSX_XXMRG(xxmrglw, 0)
=20
-static void gen_xxsel(DisasContext *ctx)
+static bool trans_XXSEL(DisasContext *ctx, arg_XX4 *a)
 {
-    int rt =3D xT(ctx->opcode);
-    int ra =3D xA(ctx->opcode);
-    int rb =3D xB(ctx->opcode);
-    int rc =3D xC(ctx->opcode);
+    REQUIRE_INSNS_FLAGS2(ctx, VSX);
+    REQUIRE_VSX(ctx);
=20
-    if (unlikely(!ctx->vsx_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_VSXU);
-        return;
-    }
-    tcg_gen_gvec_bitsel(MO_64, vsr_full_offset(rt), vsr_full_offset(rc),
-                        vsr_full_offset(rb), vsr_full_offset(ra), 16, 16=
);
+    tcg_gen_gvec_bitsel(MO_64, vsr_full_offset(a->xt), vsr_full_offset(a=
->xc),
+                        vsr_full_offset(a->xb), vsr_full_offset(a->xa), =
16, 16);
+
+    return true;
 }
=20
 static bool trans_XXSPLTW(DisasContext *ctx, arg_XX2 *a)
@@ -2127,7 +2123,7 @@ static void gen_xxblendv_vec(unsigned vece, TCGv_ve=
c t, TCGv_vec a, TCGv_vec b,
     tcg_temp_free_vec(tmp);
 }
=20
-static bool do_xxblendv(DisasContext *ctx, arg_XX4 *a, unsigned vece)
+static bool do_xxblendv(DisasContext *ctx, arg_8RR_XX4 *a, unsigned vece=
)
 {
     static const TCGOpcode vecop_list[] =3D {
         INDEX_op_sari_vec, 0
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vs=
x-ops.c.inc
index c974324c4c82..b0dbb38c80f6 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -347,47 +347,4 @@ GEN_XX3FORM_DM(xxsldwi, 0x08, 0x00),
 GEN_XX2FORM_EXT(xxextractuw, 0x0A, 0x0A, PPC2_ISA300),
 GEN_XX2FORM_EXT(xxinsertw, 0x0A, 0x0B, PPC2_ISA300),
=20
-#define GEN_XXSEL_ROW(opc3) \
-GEN_HANDLER2_E(xxsel, "xxsel", 0x3C, 0x18, opc3, 0, PPC_NONE, PPC2_VSX),=
 \
-GEN_HANDLER2_E(xxsel, "xxsel", 0x3C, 0x19, opc3, 0, PPC_NONE, PPC2_VSX),=
 \
-GEN_HANDLER2_E(xxsel, "xxsel", 0x3C, 0x1A, opc3, 0, PPC_NONE, PPC2_VSX),=
 \
-GEN_HANDLER2_E(xxsel, "xxsel", 0x3C, 0x1B, opc3, 0, PPC_NONE, PPC2_VSX),=
 \
-GEN_HANDLER2_E(xxsel, "xxsel", 0x3C, 0x1C, opc3, 0, PPC_NONE, PPC2_VSX),=
 \
-GEN_HANDLER2_E(xxsel, "xxsel", 0x3C, 0x1D, opc3, 0, PPC_NONE, PPC2_VSX),=
 \
-GEN_HANDLER2_E(xxsel, "xxsel", 0x3C, 0x1E, opc3, 0, PPC_NONE, PPC2_VSX),=
 \
-GEN_HANDLER2_E(xxsel, "xxsel", 0x3C, 0x1F, opc3, 0, PPC_NONE, PPC2_VSX),=
 \
-
-GEN_XXSEL_ROW(0x00)
-GEN_XXSEL_ROW(0x01)
-GEN_XXSEL_ROW(0x02)
-GEN_XXSEL_ROW(0x03)
-GEN_XXSEL_ROW(0x04)
-GEN_XXSEL_ROW(0x05)
-GEN_XXSEL_ROW(0x06)
-GEN_XXSEL_ROW(0x07)
-GEN_XXSEL_ROW(0x08)
-GEN_XXSEL_ROW(0x09)
-GEN_XXSEL_ROW(0x0A)
-GEN_XXSEL_ROW(0x0B)
-GEN_XXSEL_ROW(0x0C)
-GEN_XXSEL_ROW(0x0D)
-GEN_XXSEL_ROW(0x0E)
-GEN_XXSEL_ROW(0x0F)
-GEN_XXSEL_ROW(0x10)
-GEN_XXSEL_ROW(0x11)
-GEN_XXSEL_ROW(0x12)
-GEN_XXSEL_ROW(0x13)
-GEN_XXSEL_ROW(0x14)
-GEN_XXSEL_ROW(0x15)
-GEN_XXSEL_ROW(0x16)
-GEN_XXSEL_ROW(0x17)
-GEN_XXSEL_ROW(0x18)
-GEN_XXSEL_ROW(0x19)
-GEN_XXSEL_ROW(0x1A)
-GEN_XXSEL_ROW(0x1B)
-GEN_XXSEL_ROW(0x1C)
-GEN_XXSEL_ROW(0x1D)
-GEN_XXSEL_ROW(0x1E)
-GEN_XXSEL_ROW(0x1F)
-
 GEN_XX3FORM_DM(xxpermdi, 0x08, 0x01),
--=20
2.34.1


