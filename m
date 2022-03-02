Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BE04CA449
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:55:58 +0100 (CET)
Received: from localhost ([::1]:33514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNaH-0003fz-Di
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:55:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr0-0000zj-DN; Wed, 02 Mar 2022 06:09:10 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqy-0001oK-BQ; Wed, 02 Mar 2022 06:09:10 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2229rsek009596; 
 Wed, 2 Mar 2022 11:08:41 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej425mb33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:41 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2cwv027801;
 Wed, 2 Mar 2022 11:08:39 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3efbu9d2wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:39 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8Z9I56492334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:35 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A041852077;
 Wed,  2 Mar 2022 11:08:35 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 56BE652076;
 Wed,  2 Mar 2022 11:08:35 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A1CEB220294;
 Wed,  2 Mar 2022 12:08:34 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 41/87] target/ppc: Implement xxgenpcv[bhwd]m instruction
Date: Wed,  2 Mar 2022 12:07:17 +0100
Message-Id: <20220302110803.849505-42-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RwIzOyFLgpzprAjuJpKlma65tP80txvn
X-Proofpoint-ORIG-GUID: RwIzOyFLgpzprAjuJpKlma65tP80txvn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1034
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 phishscore=0 mlxlogscore=847 bulkscore=0 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225210936.1749575-36-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 | 16 +++++
 target/ppc/insn32.decode            | 10 ++++
 target/ppc/int_helper.c             | 91 +++++++++++++++++++++++++++++
 target/ppc/translate/vsx-impl.c.inc | 43 ++++++++++++++
 4 files changed, 160 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 13034bca58c7..008cd6405d0f 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -494,6 +494,22 @@ DEF_HELPER_3(xvrspic, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspim, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspip, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspiz, void, env, vsr, vsr)
+DEF_HELPER_FLAGS_2(XXGENPCVBM_be_exp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVBM_be_comp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVBM_le_exp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVBM_le_comp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVHM_be_exp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVHM_be_comp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVHM_le_exp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVHM_le_comp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVWM_be_exp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVWM_be_comp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVWM_le_exp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVWM_le_comp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVDM_be_exp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVDM_be_comp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVDM_le_exp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVDM_le_comp, TCG_CALL_NO_RWG, void, vsr, avr)
 DEF_HELPER_4(xxextractuw, void, env, vsr, vsr, i32)
 DEF_HELPER_FLAGS_5(XXPERMX, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, t=
l)
 DEF_HELPER_4(xxinsertw, void, env, vsr, vsr, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index b8dbac553e33..22b245607b0f 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -119,6 +119,9 @@
 @X_bfl          ...... bf:3 - l:1 ra:5 rb:5 ..........- &X_bfl
=20
 %x_xt           0:1 21:5
+&X_imm5         xt imm:uint8_t vrb
+@X_imm5         ...... ..... imm:5 vrb:5 .......... .           &X_imm5 =
xt=3D%x_xt
+
 &X_imm8         xt imm:uint8_t
 @X_imm8         ...... ..... .. imm:8 .......... .              &X_imm8 =
xt=3D%x_xt
=20
@@ -615,6 +618,13 @@ XXPERMDI        111100 ..... ..... ..... 0 .. 01010 =
... @XX3_dm
=20
 XXSEL           111100 ..... ..... ..... ..... 11 ....  @XX4
=20
+## VSX Vector Generate PCV
+
+XXGENPCVBM      111100 ..... ..... ..... 1110010100 .   @X_imm5
+XXGENPCVHM      111100 ..... ..... ..... 1110010101 .   @X_imm5
+XXGENPCVWM      111100 ..... ..... ..... 1110110100 .   @X_imm5
+XXGENPCVDM      111100 ..... ..... ..... 1110110101 .   @X_imm5
+
 ## VSX Vector Load Special Value Instruction
=20
 LXVKQ           111100 ..... 11111 ..... 0101101000 .   @X_uim5
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index ca59cd3d79ec..b2b17bb1ca5e 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1072,6 +1072,97 @@ void helper_VPERMR(ppc_avr_t *r, ppc_avr_t *a, ppc=
_avr_t *b, ppc_avr_t *c)
     *r =3D result;
 }
=20
+#define XXGENPCV(NAME, SZ) \
+void glue(helper_, glue(NAME, _be_exp))(ppc_vsr_t *t, ppc_vsr_t *b) \
+{                                                                   \
+    ppc_vsr_t tmp;                                                  \
+                                                                    \
+    /* Initialize tmp with the result of an all-zeros mask */       \
+    tmp.VsrD(0) =3D 0x1011121314151617;                               \
+    tmp.VsrD(1) =3D 0x18191A1B1C1D1E1F;                               \
+                                                                    \
+    /* Iterate over the most significant byte of each element */    \
+    for (int i =3D 0, j =3D 0; i < ARRAY_SIZE(b->u8); i +=3D SZ) {      =
  \
+        if (b->VsrB(i) & 0x80) {                                    \
+            /* Update each byte of the element */                   \
+            for (int k =3D 0; k < SZ; k++) {                          \
+                tmp.VsrB(i + k) =3D j + k;                            \
+            }                                                       \
+            j +=3D SZ;                                                \
+        }                                                           \
+    }                                                               \
+                                                                    \
+    *t =3D tmp;                                                       \
+}                                                                   \
+                                                                    \
+void glue(helper_, glue(NAME, _be_comp))(ppc_vsr_t *t, ppc_vsr_t *b)\
+{                                                                   \
+    ppc_vsr_t tmp =3D { .u64 =3D { 0, 0 } };                            =
\
+                                                                    \
+    /* Iterate over the most significant byte of each element */    \
+    for (int i =3D 0, j =3D 0; i < ARRAY_SIZE(b->u8); i +=3D SZ) {      =
  \
+        if (b->VsrB(i) & 0x80) {                                    \
+            /* Update each byte of the element */                   \
+            for (int k =3D 0; k < SZ; k++) {                          \
+                tmp.VsrB(j + k) =3D i + k;                            \
+            }                                                       \
+            j +=3D SZ;                                                \
+        }                                                           \
+    }                                                               \
+                                                                    \
+    *t =3D tmp;                                                       \
+}                                                                   \
+                                                                    \
+void glue(helper_, glue(NAME, _le_exp))(ppc_vsr_t *t, ppc_vsr_t *b) \
+{                                                                   \
+    ppc_vsr_t tmp;                                                  \
+                                                                    \
+    /* Initialize tmp with the result of an all-zeros mask */       \
+    tmp.VsrD(0) =3D 0x1F1E1D1C1B1A1918;                               \
+    tmp.VsrD(1) =3D 0x1716151413121110;                               \
+                                                                    \
+    /* Iterate over the most significant byte of each element */    \
+    for (int i =3D 0, j =3D 0; i < ARRAY_SIZE(b->u8); i +=3D SZ) {      =
  \
+        /* Reverse indexing of "i" */                               \
+        const int idx =3D ARRAY_SIZE(b->u8) - i - SZ;                 \
+        if (b->VsrB(idx) & 0x80) {                                  \
+            /* Update each byte of the element */                   \
+            for (int k =3D 0, rk =3D SZ - 1; k < SZ; k++, rk--) {       =
\
+                tmp.VsrB(idx + rk) =3D j + k;                         \
+            }                                                       \
+            j +=3D SZ;                                                \
+        }                                                           \
+    }                                                               \
+                                                                    \
+    *t =3D tmp;                                                       \
+}                                                                   \
+                                                                    \
+void glue(helper_, glue(NAME, _le_comp))(ppc_vsr_t *t, ppc_vsr_t *b)\
+{                                                                   \
+    ppc_vsr_t tmp =3D { .u64 =3D { 0, 0 } };                            =
\
+                                                                    \
+    /* Iterate over the most significant byte of each element */    \
+    for (int i =3D 0, j =3D 0; i < ARRAY_SIZE(b->u8); i +=3D SZ) {      =
  \
+        if (b->VsrB(ARRAY_SIZE(b->u8) - i - SZ) & 0x80) {           \
+            /* Update each byte of the element */                   \
+            for (int k =3D 0, rk =3D SZ - 1; k < SZ; k++, rk--) {       =
\
+                /* Reverse indexing of "j" */                       \
+                const int idx =3D ARRAY_SIZE(b->u8) - j - SZ;         \
+                tmp.VsrB(idx + rk) =3D i + k;                         \
+            }                                                       \
+            j +=3D SZ;                                                \
+        }                                                           \
+    }                                                               \
+                                                                    \
+    *t =3D tmp;                                                       \
+}
+
+XXGENPCV(XXGENPCVBM, 1)
+XXGENPCV(XXGENPCVHM, 2)
+XXGENPCV(XXGENPCVWM, 4)
+XXGENPCV(XXGENPCVDM, 8)
+#undef XXGENPCV
+
 #if defined(HOST_WORDS_BIGENDIAN)
 #define VBPERMQ_INDEX(avr, i) ((avr)->u8[(i)])
 #define VBPERMD_INDEX(i) (i)
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index b5e07cf3df32..6528e1ae31e0 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1256,6 +1256,49 @@ static bool trans_XXPERMX(DisasContext *ctx, arg_8=
RR_XX4_uim3 *a)
     return true;
 }
=20
+#define XXGENPCV(NAME) \
+static bool trans_##NAME(DisasContext *ctx, arg_X_imm5 *a)  \
+{                                                           \
+    TCGv_ptr xt, vrb;                                       \
+                                                            \
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);                      \
+    REQUIRE_VSX(ctx);                                       \
+                                                            \
+    if (a->imm & ~0x3) {                                    \
+        gen_invalid(ctx);                                   \
+        return true;                                        \
+    }                                                       \
+                                                            \
+    xt =3D gen_vsr_ptr(a->xt);                                \
+    vrb =3D gen_avr_ptr(a->vrb);                              \
+                                                            \
+    switch (a->imm) {                                       \
+    case 0b00000: /* Big-Endian expansion */                \
+        glue(gen_helper_, glue(NAME, _be_exp))(xt, vrb);    \
+        break;                                              \
+    case 0b00001: /* Big-Endian compression */              \
+        glue(gen_helper_, glue(NAME, _be_comp))(xt, vrb);   \
+        break;                                              \
+    case 0b00010: /* Little-Endian expansion */             \
+        glue(gen_helper_, glue(NAME, _le_exp))(xt, vrb);    \
+        break;                                              \
+    case 0b00011: /* Little-Endian compression */           \
+        glue(gen_helper_, glue(NAME, _le_comp))(xt, vrb);   \
+        break;                                              \
+    }                                                       \
+                                                            \
+    tcg_temp_free_ptr(xt);                                  \
+    tcg_temp_free_ptr(vrb);                                 \
+                                                            \
+    return true;                                            \
+}
+
+XXGENPCV(XXGENPCVBM)
+XXGENPCV(XXGENPCVHM)
+XXGENPCV(XXGENPCVWM)
+XXGENPCV(XXGENPCVDM)
+#undef XXGENPCV
+
 #define GEN_VSX_HELPER_VSX_MADD(name, op1, aop, mop, inval, type)       =
      \
 static void gen_##name(DisasContext *ctx)                               =
      \
 {                                                                       =
      \
--=20
2.34.1


