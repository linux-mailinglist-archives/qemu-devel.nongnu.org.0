Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7544CA3D6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:35:02 +0100 (CET)
Received: from localhost ([::1]:36636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNG1-0000yS-4v
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:35:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqo-0000jU-Ab; Wed, 02 Mar 2022 06:09:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31868
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqk-0001l6-Kr; Wed, 02 Mar 2022 06:08:57 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228mwwm014427; 
 Wed, 2 Mar 2022 11:08:18 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej5d9jk11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:18 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2gZ3011735;
 Wed, 2 Mar 2022 11:08:16 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjpg4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:16 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8EL650200892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:14 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D8AC4203F;
 Wed,  2 Mar 2022 11:08:14 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE36642042;
 Wed,  2 Mar 2022 11:08:13 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:13 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 082BC220294;
 Wed,  2 Mar 2022 12:08:12 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 09/87] target/ppc: Moved vector multiply high and low to
 decodetree
Date: Wed,  2 Mar 2022 12:06:45 +0100
Message-Id: <20220302110803.849505-10-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N2EIO_VI8xk1CuGHfh36kxXbVtdOVNTH
X-Proofpoint-ORIG-GUID: N2EIO_VI8xk1CuGHfh36kxXbVtdOVNTH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 impostorscore=0 clxscore=1034 spamscore=0 adultscore=0
 mlxlogscore=791 suspectscore=0 lowpriorityscore=0 phishscore=0
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
 "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>

Moved instructions vmulld, vmulhuw, vmulhsw, vmulhud and vmulhsd to
decodetree

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.b=
r>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-4-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 |  8 ++++----
 target/ppc/insn32.decode            |  6 ++++++
 target/ppc/int_helper.c             |  8 ++++----
 target/ppc/translate/vmx-impl.c.inc | 21 ++++++++++++++++-----
 target/ppc/translate/vmx-ops.c.inc  |  5 -----
 5 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index c399fab1a830..43c7a0263c6c 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -204,10 +204,10 @@ DEF_HELPER_FLAGS_3(VMULOSW, TCG_CALL_NO_RWG, void, =
avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUB, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUH, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUW, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_3(vmulhsw, void, avr, avr, avr)
-DEF_HELPER_3(vmulhuw, void, avr, avr, avr)
-DEF_HELPER_3(vmulhsd, void, avr, avr, avr)
-DEF_HELPER_3(vmulhud, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMULHSW, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMULHUW, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMULHSD, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMULHUD, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_3(vslo, void, avr, avr, avr)
 DEF_HELPER_3(vsro, void, avr, avr, avr)
 DEF_HELPER_3(vsrv, void, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 092ea796184c..d817e44c7104 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -462,6 +462,12 @@ VMULOSD         000100 ..... ..... ..... 00111001000=
    @VX
 VMULEUD         000100 ..... ..... ..... 01011001000    @VX
 VMULOUD         000100 ..... ..... ..... 00011001000    @VX
=20
+VMULHSW         000100 ..... ..... ..... 01110001001    @VX
+VMULHUW         000100 ..... ..... ..... 01010001001    @VX
+VMULHSD         000100 ..... ..... ..... 01111001001    @VX
+VMULHUD         000100 ..... ..... ..... 01011001001    @VX
+VMULLD          000100 ..... ..... ..... 00111001001    @VX
+
 # VSX Load/Store Instructions
=20
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index c9f34ce3ca4e..873f957bf4ea 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1097,7 +1097,7 @@ VMUL(UW, u32, VsrW, VsrD, uint64_t)
 #undef VMUL_DO_ODD
 #undef VMUL
=20
-void helper_vmulhsw(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VMULHSW(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
     int i;
=20
@@ -1106,7 +1106,7 @@ void helper_vmulhsw(ppc_avr_t *r, ppc_avr_t *a, ppc=
_avr_t *b)
     }
 }
=20
-void helper_vmulhuw(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VMULHUW(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
     int i;
=20
@@ -1116,7 +1116,7 @@ void helper_vmulhuw(ppc_avr_t *r, ppc_avr_t *a, ppc=
_avr_t *b)
     }
 }
=20
-void helper_vmulhsd(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VMULHSD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
     uint64_t discard;
=20
@@ -1124,7 +1124,7 @@ void helper_vmulhsd(ppc_avr_t *r, ppc_avr_t *a, ppc=
_avr_t *b)
     muls64(&discard, &r->u64[1], a->s64[1], b->s64[1]);
 }
=20
-void helper_vmulhud(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VMULHUD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
     uint64_t discard;
=20
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index a34a080e8324..d493de3629e5 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -799,11 +799,6 @@ static void trans_vclzd(DisasContext *ctx)
 }
=20
 GEN_VXFORM_V(vmuluwm, MO_32, tcg_gen_gvec_mul, 4, 2);
-GEN_VXFORM_V(vmulld, MO_64, tcg_gen_gvec_mul, 4, 7);
-GEN_VXFORM(vmulhuw, 4, 10);
-GEN_VXFORM(vmulhud, 4, 11);
-GEN_VXFORM(vmulhsw, 4, 14);
-GEN_VXFORM(vmulhsd, 4, 15);
 GEN_VXFORM_V(vslb, MO_8, tcg_gen_gvec_shlv, 2, 4);
 GEN_VXFORM_V(vslh, MO_16, tcg_gen_gvec_shlv, 2, 5);
 GEN_VXFORM_V(vslw, MO_32, tcg_gen_gvec_shlv, 2, 6);
@@ -2128,6 +2123,17 @@ static bool do_vx_vmuleo(DisasContext *ctx, arg_VX=
 *a, bool even,
     return true;
 }
=20
+static bool trans_VMULLD(DisasContext *ctx, arg_VX *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_mul(MO_64, avr_full_offset(a->vrt), avr_full_offset(a->=
vra),
+                     avr_full_offset(a->vrb), 16, 16);
+
+    return true;
+}
+
 TRANS_FLAGS2(ALTIVEC_207, VMULESB, do_vx_helper, gen_helper_VMULESB)
 TRANS_FLAGS2(ALTIVEC_207, VMULOSB, do_vx_helper, gen_helper_VMULOSB)
 TRANS_FLAGS2(ALTIVEC_207, VMULEUB, do_vx_helper, gen_helper_VMULEUB)
@@ -2145,6 +2151,11 @@ TRANS_FLAGS2(ISA310, VMULOSD, do_vx_vmuleo, false,=
 tcg_gen_muls2_i64)
 TRANS_FLAGS2(ISA310, VMULEUD, do_vx_vmuleo, true , tcg_gen_mulu2_i64)
 TRANS_FLAGS2(ISA310, VMULOUD, do_vx_vmuleo, false, tcg_gen_mulu2_i64)
=20
+TRANS_FLAGS2(ISA310, VMULHSW, do_vx_helper, gen_helper_VMULHSW)
+TRANS_FLAGS2(ISA310, VMULHSD, do_vx_helper, gen_helper_VMULHSD)
+TRANS_FLAGS2(ISA310, VMULHUW, do_vx_helper, gen_helper_VMULHUW)
+TRANS_FLAGS2(ISA310, VMULHUD, do_vx_helper, gen_helper_VMULHUD)
+
 #undef GEN_VR_LDX
 #undef GEN_VR_STX
 #undef GEN_VR_LVE
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vm=
x-ops.c.inc
index f310b2fbde95..914e68e5b0be 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -102,11 +102,6 @@ GEN_VXFORM_300(vextubrx, 6, 28),
 GEN_VXFORM_300(vextuhrx, 6, 29),
 GEN_VXFORM_DUAL(vmrgew, vextuwrx, 6, 30, PPC_NONE, PPC2_ALTIVEC_207),
 GEN_VXFORM_207(vmuluwm, 4, 2),
-GEN_VXFORM_310(vmulld, 4, 7),
-GEN_VXFORM_310(vmulhuw, 4, 10),
-GEN_VXFORM_310(vmulhud, 4, 11),
-GEN_VXFORM_310(vmulhsw, 4, 14),
-GEN_VXFORM_310(vmulhsd, 4, 15),
 GEN_VXFORM(vslb, 2, 4),
 GEN_VXFORM(vslh, 2, 5),
 GEN_VXFORM_DUAL(vslw, vrlwnm, 2, 6, PPC_ALTIVEC, PPC_NONE),
--=20
2.34.1


