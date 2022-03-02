Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FDD4CA393
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:26:08 +0100 (CET)
Received: from localhost ([::1]:46814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPN7O-0004jJ-44
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:26:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqS-0000VM-U9; Wed, 02 Mar 2022 06:08:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqR-0001lB-3P; Wed, 02 Mar 2022 06:08:36 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228LuOt017326; 
 Wed, 2 Mar 2022 11:08:27 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej50ku5ya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:26 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2gZ4011735;
 Wed, 2 Mar 2022 11:08:24 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjpg4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:24 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8LJ950200912
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:22 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D42494203F;
 Wed,  2 Mar 2022 11:08:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9258542047;
 Wed,  2 Mar 2022 11:08:21 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:21 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D8D662201C1;
 Wed,  2 Mar 2022 12:08:20 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 20/87] target/ppc: implement vstri[bh][lr]
Date: Wed,  2 Mar 2022 12:06:56 +0100
Message-Id: <20220302110803.849505-21-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GCBY_rPwoyVpJWciAChPvmBxVQ2lGpWL
X-Proofpoint-ORIG-GUID: GCBY_rPwoyVpJWciAChPvmBxVQ2lGpWL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1034
 phishscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=646 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Message-Id: <20220225210936.1749575-15-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 |  4 ++++
 target/ppc/insn32.decode            | 10 ++++++++++
 target/ppc/int_helper.c             | 28 +++++++++++++++++++++++++++
 target/ppc/translate/vmx-impl.c.inc | 30 +++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index e5dd1c53f5ba..2c6146d55eb0 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -209,6 +209,10 @@ DEF_HELPER_4(VINSBLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSHLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSWLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSDLX, void, env, avr, i64, tl)
+DEF_HELPER_FLAGS_2(VSTRIBL, TCG_CALL_NO_RWG, i32, avr, avr)
+DEF_HELPER_FLAGS_2(VSTRIBR, TCG_CALL_NO_RWG, i32, avr, avr)
+DEF_HELPER_FLAGS_2(VSTRIHL, TCG_CALL_NO_RWG, i32, avr, avr)
+DEF_HELPER_FLAGS_2(VSTRIHR, TCG_CALL_NO_RWG, i32, avr, avr)
 DEF_HELPER_2(vnegw, void, avr, avr)
 DEF_HELPER_2(vnegd, void, avr, avr)
 DEF_HELPER_2(vupkhpx, void, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index f0cb6602e25a..d844d868291a 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -63,6 +63,9 @@
 &VX_bf          bf vra vrb
 @VX_bf          ...... bf:3 .. vra:5 vrb:5 ...........          &VX_bf
=20
+&VX_tb_rc       vrt vrb rc:bool
+@VX_tb_rc       ...... vrt:5 ..... vrb:5 rc:1 ..........        &VX_tb_r=
c
+
 &VX_uim4        vrt uim vrb
 @VX_uim4        ...... vrt:5 . uim:4 vrb:5 ...........  &VX_uim4
=20
@@ -519,6 +522,13 @@ VMULLD          000100 ..... ..... ..... 00111001001=
    @VX
 VMSUMCUD        000100 ..... ..... ..... ..... 010111   @VA
 VMSUMUDM        000100 ..... ..... ..... ..... 100011   @VA
=20
+## Vector String Instructions
+
+VSTRIBL         000100 ..... 00000 ..... . 0000001101   @VX_tb_rc
+VSTRIBR         000100 ..... 00001 ..... . 0000001101   @VX_tb_rc
+VSTRIHL         000100 ..... 00010 ..... . 0000001101   @VX_tb_rc
+VSTRIHR         000100 ..... 00011 ..... . 0000001101   @VX_tb_rc
+
 # VSX Load/Store Instructions
=20
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index f31dba946942..71b31fbd891d 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1502,6 +1502,34 @@ VEXTRACT(uw, u32)
 VEXTRACT(d, u64)
 #undef VEXTRACT
=20
+#define VSTRI(NAME, ELEM, NUM_ELEMS, LEFT) \
+uint32_t helper_##NAME(ppc_avr_t *t, ppc_avr_t *b) \
+{                                                   \
+    int i, idx, crf =3D 0;                            \
+                                                    \
+    for (i =3D 0; i < NUM_ELEMS; i++) {               \
+        idx =3D LEFT ? i : NUM_ELEMS - i - 1;         \
+        if (b->Vsr##ELEM(idx)) {                    \
+            t->Vsr##ELEM(idx) =3D b->Vsr##ELEM(idx);  \
+        } else {                                    \
+            crf =3D 0b0010;                           \
+            break;                                  \
+        }                                           \
+    }                                               \
+                                                    \
+    for (; i < NUM_ELEMS; i++) {                    \
+        idx =3D LEFT ? i : NUM_ELEMS - i - 1;         \
+        t->Vsr##ELEM(idx) =3D 0;                      \
+    }                                               \
+                                                    \
+    return crf;                                     \
+}
+VSTRI(VSTRIBL, B, 16, true)
+VSTRI(VSTRIBR, B, 16, false)
+VSTRI(VSTRIHL, H, 8, true)
+VSTRI(VSTRIHR, H, 8, false)
+#undef VSTRI
+
 void helper_xxextractuw(CPUPPCState *env, ppc_vsr_t *xt,
                         ppc_vsr_t *xb, uint32_t index)
 {
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index ba2106dc7c5e..6962929826ff 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1910,6 +1910,36 @@ static bool trans_MTVSRBMI(DisasContext *ctx, arg_=
DX_b *a)
     return true;
 }
=20
+static bool do_vstri(DisasContext *ctx, arg_VX_tb_rc *a,
+                     void (*gen_helper)(TCGv_i32, TCGv_ptr, TCGv_ptr))
+{
+    TCGv_ptr vrt, vrb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    vrt =3D gen_avr_ptr(a->vrt);
+    vrb =3D gen_avr_ptr(a->vrb);
+
+    if (a->rc) {
+        gen_helper(cpu_crf[6], vrt, vrb);
+    } else {
+        TCGv_i32 discard =3D tcg_temp_new_i32();
+        gen_helper(discard, vrt, vrb);
+        tcg_temp_free_i32(discard);
+    }
+
+    tcg_temp_free_ptr(vrt);
+    tcg_temp_free_ptr(vrb);
+
+    return true;
+}
+
+TRANS(VSTRIBL, do_vstri, gen_helper_VSTRIBL)
+TRANS(VSTRIBR, do_vstri, gen_helper_VSTRIBR)
+TRANS(VSTRIHL, do_vstri, gen_helper_VSTRIHL)
+TRANS(VSTRIHR, do_vstri, gen_helper_VSTRIHR)
+
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           =
\
 static void glue(gen_, name0##_##name1)(DisasContext *ctx)              =
\
     {                                                                   =
\
--=20
2.34.1


