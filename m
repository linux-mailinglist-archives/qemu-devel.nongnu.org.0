Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF6D4CA414
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:45:16 +0100 (CET)
Received: from localhost ([::1]:37474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNPv-0003oD-PH
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:45:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqx-0000pY-FV; Wed, 02 Mar 2022 06:09:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqs-0001nV-Uu; Wed, 02 Mar 2022 06:09:07 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2229raQa026202; 
 Wed, 2 Mar 2022 11:08:30 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6bpse3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:29 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B3DQU017800;
 Wed, 2 Mar 2022 11:08:27 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3egbj19js0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:27 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 222B8PER42991890
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:25 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32A8AA4073;
 Wed,  2 Mar 2022 11:08:25 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3E64A406F;
 Wed,  2 Mar 2022 11:08:24 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:24 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 35D8D220294;
 Wed,  2 Mar 2022 12:08:24 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 25/87] target/ppc: move vs[lr][a][bhwd] to decodetree
Date: Wed,  2 Mar 2022 12:07:01 +0100
Message-Id: <20220302110803.849505-26-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0o9yTgsA-q7piNGCaC0ugoK4247onSWD
X-Proofpoint-ORIG-GUID: 0o9yTgsA-q7piNGCaC0ugoK4247onSWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=890
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-20-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            | 17 ++++++++++++
 target/ppc/translate/vmx-impl.c.inc | 41 +++++++++++++++++++----------
 target/ppc/translate/vmx-ops.c.inc  | 13 +--------
 3 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 02df4a98e665..88baebe35e4c 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -467,6 +467,23 @@ VINSWVRX        000100 ..... ..... ..... 00110001111=
    @VX
 VSLDBI          000100 ..... ..... ..... 00 ... 010110  @VN
 VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
=20
+## Vector Integer Shift Instruction
+
+VSLB            000100 ..... ..... ..... 00100000100    @VX
+VSLH            000100 ..... ..... ..... 00101000100    @VX
+VSLW            000100 ..... ..... ..... 00110000100    @VX
+VSLD            000100 ..... ..... ..... 10111000100    @VX
+
+VSRB            000100 ..... ..... ..... 01000000100    @VX
+VSRH            000100 ..... ..... ..... 01001000100    @VX
+VSRW            000100 ..... ..... ..... 01010000100    @VX
+VSRD            000100 ..... ..... ..... 11011000100    @VX
+
+VSRAB           000100 ..... ..... ..... 01100000100    @VX
+VSRAH           000100 ..... ..... ..... 01101000100    @VX
+VSRAW           000100 ..... ..... ..... 01110000100    @VX
+VSRAD           000100 ..... ..... ..... 01111000100    @VX
+
 ## Vector Integer Arithmetic Instructions
=20
 VEXTSB2W        000100 ..... 10000 ..... 11000000010    @VX_tb
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index 52774cdd4dfb..1b05b0b3a35e 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -799,21 +799,7 @@ static void trans_vclzd(DisasContext *ctx)
 }
=20
 GEN_VXFORM_V(vmuluwm, MO_32, tcg_gen_gvec_mul, 4, 2);
-GEN_VXFORM_V(vslb, MO_8, tcg_gen_gvec_shlv, 2, 4);
-GEN_VXFORM_V(vslh, MO_16, tcg_gen_gvec_shlv, 2, 5);
-GEN_VXFORM_V(vslw, MO_32, tcg_gen_gvec_shlv, 2, 6);
 GEN_VXFORM(vrlwnm, 2, 6);
-GEN_VXFORM_DUAL(vslw, PPC_ALTIVEC, PPC_NONE, \
-                vrlwnm, PPC_NONE, PPC2_ISA300)
-GEN_VXFORM_V(vsld, MO_64, tcg_gen_gvec_shlv, 2, 23);
-GEN_VXFORM_V(vsrb, MO_8, tcg_gen_gvec_shrv, 2, 8);
-GEN_VXFORM_V(vsrh, MO_16, tcg_gen_gvec_shrv, 2, 9);
-GEN_VXFORM_V(vsrw, MO_32, tcg_gen_gvec_shrv, 2, 10);
-GEN_VXFORM_V(vsrd, MO_64, tcg_gen_gvec_shrv, 2, 27);
-GEN_VXFORM_V(vsrab, MO_8, tcg_gen_gvec_sarv, 2, 12);
-GEN_VXFORM_V(vsrah, MO_16, tcg_gen_gvec_sarv, 2, 13);
-GEN_VXFORM_V(vsraw, MO_32, tcg_gen_gvec_sarv, 2, 14);
-GEN_VXFORM_V(vsrad, MO_64, tcg_gen_gvec_sarv, 2, 15);
 GEN_VXFORM(vsrv, 2, 28);
 GEN_VXFORM(vslv, 2, 29);
 GEN_VXFORM(vslo, 6, 16);
@@ -821,6 +807,33 @@ GEN_VXFORM(vsro, 6, 17);
 GEN_VXFORM(vaddcuw, 0, 6);
 GEN_VXFORM(vsubcuw, 0, 22);
=20
+static bool do_vector_gvec3_VX(DisasContext *ctx, arg_VX *a, int vece,
+                               void (*gen_gvec)(unsigned, uint32_t, uint=
32_t,
+                                                uint32_t, uint32_t, uint=
32_t))
+{
+    REQUIRE_VECTOR(ctx);
+
+    gen_gvec(vece, avr_full_offset(a->vrt), avr_full_offset(a->vra),
+             avr_full_offset(a->vrb), 16, 16);
+
+    return true;
+}
+
+TRANS_FLAGS(ALTIVEC, VSLB, do_vector_gvec3_VX, MO_8, tcg_gen_gvec_shlv);
+TRANS_FLAGS(ALTIVEC, VSLH, do_vector_gvec3_VX, MO_16, tcg_gen_gvec_shlv)=
;
+TRANS_FLAGS(ALTIVEC, VSLW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_shlv)=
;
+TRANS_FLAGS2(ALTIVEC_207, VSLD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec_=
shlv);
+
+TRANS_FLAGS(ALTIVEC, VSRB, do_vector_gvec3_VX, MO_8, tcg_gen_gvec_shrv);
+TRANS_FLAGS(ALTIVEC, VSRH, do_vector_gvec3_VX, MO_16, tcg_gen_gvec_shrv)=
;
+TRANS_FLAGS(ALTIVEC, VSRW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_shrv)=
;
+TRANS_FLAGS2(ALTIVEC_207, VSRD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec_=
shrv);
+
+TRANS_FLAGS(ALTIVEC, VSRAB, do_vector_gvec3_VX, MO_8, tcg_gen_gvec_sarv)=
;
+TRANS_FLAGS(ALTIVEC, VSRAH, do_vector_gvec3_VX, MO_16, tcg_gen_gvec_sarv=
);
+TRANS_FLAGS(ALTIVEC, VSRAW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_sarv=
);
+TRANS_FLAGS2(ALTIVEC_207, VSRAD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec=
_sarv);
+
 #define GEN_VXFORM_SAT(NAME, VECE, NORM, SAT, OPC2, OPC3)               =
\
 static void glue(glue(gen_, NAME), _vec)(unsigned vece, TCGv_vec t,     =
\
                                          TCGv_vec sat, TCGv_vec a,      =
\
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vm=
x-ops.c.inc
index cb4c5bb953c1..878bce92c6a4 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -102,18 +102,7 @@ GEN_VXFORM_300(vextubrx, 6, 28),
 GEN_VXFORM_300(vextuhrx, 6, 29),
 GEN_VXFORM_DUAL(vmrgew, vextuwrx, 6, 30, PPC_NONE, PPC2_ALTIVEC_207),
 GEN_VXFORM_207(vmuluwm, 4, 2),
-GEN_VXFORM(vslb, 2, 4),
-GEN_VXFORM(vslh, 2, 5),
-GEN_VXFORM_DUAL(vslw, vrlwnm, 2, 6, PPC_ALTIVEC, PPC_NONE),
-GEN_VXFORM_207(vsld, 2, 23),
-GEN_VXFORM(vsrb, 2, 8),
-GEN_VXFORM(vsrh, 2, 9),
-GEN_VXFORM(vsrw, 2, 10),
-GEN_VXFORM_207(vsrd, 2, 27),
-GEN_VXFORM(vsrab, 2, 12),
-GEN_VXFORM(vsrah, 2, 13),
-GEN_VXFORM(vsraw, 2, 14),
-GEN_VXFORM_207(vsrad, 2, 15),
+GEN_VXFORM_300(vrlwnm, 2, 6),
 GEN_VXFORM_300(vsrv, 2, 28),
 GEN_VXFORM_300(vslv, 2, 29),
 GEN_VXFORM(vslo, 6, 16),
--=20
2.34.1


