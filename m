Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D224CA379
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:21:20 +0100 (CET)
Received: from localhost ([::1]:37282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPN2m-0006Wn-16
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:21:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqS-0000VG-HN; Wed, 02 Mar 2022 06:08:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqP-0001kU-VI; Wed, 02 Mar 2022 06:08:36 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22295dt5002398; 
 Wed, 2 Mar 2022 11:08:20 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej38v5dpv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:19 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2dDk014266;
 Wed, 2 Mar 2022 11:08:17 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3efbu8w0g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:17 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8Frm57606460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:15 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17C174C04E;
 Wed,  2 Mar 2022 11:08:15 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B850A4C046;
 Wed,  2 Mar 2022 11:08:14 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:14 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DB9EC2201C1;
 Wed,  2 Mar 2022 12:08:13 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 10/87] target/ppc: vmulh* instructions without helpers
Date: Wed,  2 Mar 2022 12:06:46 +0100
Message-Id: <20220302110803.849505-11-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GNWY0d_E_YqLCSJDFzOrc6_G5ysla_gH
X-Proofpoint-GUID: GNWY0d_E_YqLCSJDFzOrc6_G5ysla_gH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1034 impostorscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 mlxlogscore=783 mlxscore=0
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
 "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>

Changed vmulhuw, vmulhud, vmulhsw, vmulhsd to not
use helpers.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.b=
r>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225210936.1749575-5-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 |  4 --
 target/ppc/int_helper.c             | 35 -----------
 target/ppc/translate/vmx-impl.c.inc | 91 +++++++++++++++++++++++++++--
 3 files changed, 87 insertions(+), 43 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 43c7a0263c6c..0fdf2e8a75a4 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -204,10 +204,6 @@ DEF_HELPER_FLAGS_3(VMULOSW, TCG_CALL_NO_RWG, void, a=
vr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUB, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUH, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUW, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(VMULHSW, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(VMULHUW, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(VMULHSD, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(VMULHUD, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_3(vslo, void, avr, avr, avr)
 DEF_HELPER_3(vsro, void, avr, avr, avr)
 DEF_HELPER_3(vsrv, void, avr, avr, avr)
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 873f957bf4ea..46ef3ffb3f62 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1097,41 +1097,6 @@ VMUL(UW, u32, VsrW, VsrD, uint64_t)
 #undef VMUL_DO_ODD
 #undef VMUL
=20
-void helper_VMULHSW(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-{
-    int i;
-
-    for (i =3D 0; i < 4; i++) {
-        r->s32[i] =3D (int32_t)(((int64_t)a->s32[i] * (int64_t)b->s32[i]=
) >> 32);
-    }
-}
-
-void helper_VMULHUW(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-{
-    int i;
-
-    for (i =3D 0; i < 4; i++) {
-        r->u32[i] =3D (uint32_t)(((uint64_t)a->u32[i] *
-                               (uint64_t)b->u32[i]) >> 32);
-    }
-}
-
-void helper_VMULHSD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-{
-    uint64_t discard;
-
-    muls64(&discard, &r->u64[0], a->s64[0], b->s64[0]);
-    muls64(&discard, &r->u64[1], a->s64[1], b->s64[1]);
-}
-
-void helper_VMULHUD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-{
-    uint64_t discard;
-
-    mulu64(&discard, &r->u64[0], a->u64[0], b->u64[0]);
-    mulu64(&discard, &r->u64[1], a->u64[1], b->u64[1]);
-}
-
 void helper_vperm(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_=
t *b,
                   ppc_avr_t *c)
 {
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index d493de3629e5..97a075efd1ef 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2151,10 +2151,93 @@ TRANS_FLAGS2(ISA310, VMULOSD, do_vx_vmuleo, false=
, tcg_gen_muls2_i64)
 TRANS_FLAGS2(ISA310, VMULEUD, do_vx_vmuleo, true , tcg_gen_mulu2_i64)
 TRANS_FLAGS2(ISA310, VMULOUD, do_vx_vmuleo, false, tcg_gen_mulu2_i64)
=20
-TRANS_FLAGS2(ISA310, VMULHSW, do_vx_helper, gen_helper_VMULHSW)
-TRANS_FLAGS2(ISA310, VMULHSD, do_vx_helper, gen_helper_VMULHSD)
-TRANS_FLAGS2(ISA310, VMULHUW, do_vx_helper, gen_helper_VMULHUW)
-TRANS_FLAGS2(ISA310, VMULHUD, do_vx_helper, gen_helper_VMULHUD)
+static void do_vx_vmulhw_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, bool si=
gn)
+{
+    TCGv_i64 hh, lh, temp;
+
+    uint64_t c;
+    hh =3D tcg_temp_new_i64();
+    lh =3D tcg_temp_new_i64();
+    temp =3D tcg_temp_new_i64();
+
+    c =3D 0xFFFFFFFF;
+
+    if (sign) {
+        tcg_gen_ext32s_i64(lh, a);
+        tcg_gen_ext32s_i64(temp, b);
+    } else {
+        tcg_gen_andi_i64(lh, a, c);
+        tcg_gen_andi_i64(temp, b, c);
+    }
+    tcg_gen_mul_i64(lh, lh, temp);
+
+    if (sign) {
+        tcg_gen_sari_i64(hh, a, 32);
+        tcg_gen_sari_i64(temp, b, 32);
+    } else {
+        tcg_gen_shri_i64(hh, a, 32);
+        tcg_gen_shri_i64(temp, b, 32);
+    }
+    tcg_gen_mul_i64(hh, hh, temp);
+
+    tcg_gen_shri_i64(lh, lh, 32);
+    tcg_gen_andi_i64(hh, hh, c << 32);
+    tcg_gen_or_i64(t, hh, lh);
+
+    tcg_temp_free_i64(hh);
+    tcg_temp_free_i64(lh);
+    tcg_temp_free_i64(temp);
+}
+
+static void do_vx_vmulhd_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, bool si=
gn)
+{
+    TCGv_i64 tlow;
+
+    tlow  =3D tcg_temp_new_i64();
+    if (sign) {
+        tcg_gen_muls2_i64(tlow, t, a, b);
+    } else {
+        tcg_gen_mulu2_i64(tlow, t, a, b);
+    }
+
+    tcg_temp_free_i64(tlow);
+}
+
+static bool do_vx_mulh(DisasContext *ctx, arg_VX *a, bool sign,
+                       void (*func)(TCGv_i64, TCGv_i64, TCGv_i64, bool))
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    TCGv_i64 vra, vrb, vrt;
+    int i;
+
+    vra =3D tcg_temp_new_i64();
+    vrb =3D tcg_temp_new_i64();
+    vrt =3D tcg_temp_new_i64();
+
+    for (i =3D 0; i < 2; i++) {
+        get_avr64(vra, a->vra, i);
+        get_avr64(vrb, a->vrb, i);
+        get_avr64(vrt, a->vrt, i);
+
+        func(vrt, vra, vrb, sign);
+
+        set_avr64(a->vrt, vrt, i);
+    }
+
+    tcg_temp_free_i64(vra);
+    tcg_temp_free_i64(vrb);
+    tcg_temp_free_i64(vrt);
+
+    return true;
+
+}
+
+TRANS(VMULHSW, do_vx_mulh, true , do_vx_vmulhw_i64)
+TRANS(VMULHSD, do_vx_mulh, true , do_vx_vmulhd_i64)
+TRANS(VMULHUW, do_vx_mulh, false, do_vx_vmulhw_i64)
+TRANS(VMULHUD, do_vx_mulh, false, do_vx_vmulhd_i64)
=20
 #undef GEN_VR_LDX
 #undef GEN_VR_STX
--=20
2.34.1


