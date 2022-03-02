Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889904CA410
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:45:02 +0100 (CET)
Received: from localhost ([::1]:36650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNPg-0003Es-RI
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:45:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr1-00012D-SV; Wed, 02 Mar 2022 06:09:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqy-0001oP-Gy; Wed, 02 Mar 2022 06:09:11 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2229IhOd025446; 
 Wed, 2 Mar 2022 11:08:40 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej5uc22ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:39 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2bbX022339;
 Wed, 2 Mar 2022 11:08:37 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3efbu9d1vx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:37 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8Z6a50397608
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:35 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05A7AA407E;
 Wed,  2 Mar 2022 11:08:35 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD3A8A4070;
 Wed,  2 Mar 2022 11:08:34 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:34 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id F3A6F2201C1;
 Wed,  2 Mar 2022 12:08:33 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 40/87] target/ppc: Implement xxeval
Date: Wed,  2 Mar 2022 12:07:16 +0100
Message-Id: <20220302110803.849505-41-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ecFwVQ9o100S283z1raZcfgDRfi4oAZt
X-Proofpoint-GUID: ecFwVQ9o100S283z1raZcfgDRfi4oAZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=751 malwarescore=0 bulkscore=0
 spamscore=0 clxscore=1034 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203020047
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

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225210936.1749575-35-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 |   1 +
 target/ppc/insn64.decode            |   8 +
 target/ppc/int_helper.c             |  42 ++++++
 target/ppc/translate/vsx-impl.c.inc | 220 ++++++++++++++++++++++++++++
 4 files changed, 271 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 7eda74211e66..13034bca58c7 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -498,6 +498,7 @@ DEF_HELPER_4(xxextractuw, void, env, vsr, vsr, i32)
 DEF_HELPER_FLAGS_5(XXPERMX, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, t=
l)
 DEF_HELPER_4(xxinsertw, void, env, vsr, vsr, i32)
 DEF_HELPER_3(xvxsigsp, void, env, vsr, vsr)
+DEF_HELPER_FLAGS_5(XXEVAL, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i3=
2)
 DEF_HELPER_5(XXBLENDVB, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XXBLENDVH, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XXBLENDVW, void, vsr, vsr, vsr, vsr, i32)
diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 0963e064b189..fdb859f62dd8 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -54,6 +54,11 @@
                 ...... ..... ..... ..... ..... .. .... \
                 &8RR_XX4 xt=3D%8rr_xx_xt xa=3D%8rr_xx_xa xb=3D%8rr_xx_xb=
 xc=3D%8rr_xx_xc
=20
+&8RR_XX4_imm    xt xa xb xc imm
+@8RR_XX4_imm    ........ ........ ........ imm:8 \
+                ...... ..... ..... ..... ..... .. .... \
+                &8RR_XX4_imm xt=3D%8rr_xx_xt xa=3D%8rr_xx_xa xb=3D%8rr_x=
x_xb xc=3D%8rr_xx_xc
+
 &8RR_XX4_uim3   xt xa xb xc uim3
 @8RR_XX4_uim3   ...... .. .... .. ............... uim3:3 \
                 ...... ..... ..... ..... ..... .. ....   \
@@ -184,6 +189,9 @@ PLXVP           000001 00 0--.-- .................. \
 PSTXVP          000001 00 0--.-- .................. \
                 111110 ..... ..... ................     @8LS_D_TSXP
=20
+XXEVAL          000001 01 0000 -- ---------- ........ \
+                100010 ..... ..... ..... ..... 01 ....  @8RR_XX4_imm
+
 XXSPLTIDP       000001 01 0000 -- -- ................ \
                 100000 ..... 0010 . ................    @8RR_D
 XXSPLTIW        000001 01 0000 -- -- ................ \
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index d9bfdc290fbf..ca59cd3d79ec 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -28,6 +28,7 @@
 #include "fpu/softfloat.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
+#include "tcg/tcg-gvec-desc.h"
=20
 #include "helper_regs.h"
 /***********************************************************************=
******/
@@ -1572,6 +1573,47 @@ void helper_xxinsertw(CPUPPCState *env, ppc_vsr_t =
*xt,
     *xt =3D t;
 }
=20
+void helper_XXEVAL(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *=
c,
+                   uint32_t desc)
+{
+    /*
+     * Instead of processing imm bit-by-bit, we'll skip the computation =
of
+     * conjunctions whose corresponding bit is unset.
+     */
+    int bit, imm =3D simd_data(desc);
+    Int128 conj, disj =3D int128_zero();
+
+    /* Iterate over set bits from the least to the most significant bit =
*/
+    while (imm) {
+        /*
+         * Get the next bit to be processed with ctz64. Invert the resul=
t of
+         * ctz64 to match the indexing used by PowerISA.
+         */
+        bit =3D 7 - ctzl(imm);
+        if (bit & 0x4) {
+            conj =3D a->s128;
+        } else {
+            conj =3D int128_not(a->s128);
+        }
+        if (bit & 0x2) {
+            conj =3D int128_and(conj, b->s128);
+        } else {
+            conj =3D int128_and(conj, int128_not(b->s128));
+        }
+        if (bit & 0x1) {
+            conj =3D int128_and(conj, c->s128);
+        } else {
+            conj =3D int128_and(conj, int128_not(c->s128));
+        }
+        disj =3D int128_or(disj, conj);
+
+        /* Unset the least significant bit that is set */
+        imm &=3D imm - 1;
+    }
+
+    t->s128 =3D disj;
+}
+
 #define XXBLEND(name, sz) \
 void glue(helper_XXBLENDV, name)(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *=
b,  \
                                  ppc_avr_t *c, uint32_t desc)           =
    \
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index 92851b8926d8..b5e07cf3df32 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2167,6 +2167,226 @@ TRANS64_FLAGS2(ISA310, PLXV, do_lstxv_PLS_D, fals=
e, false)
 TRANS64_FLAGS2(ISA310, PSTXVP, do_lstxv_PLS_D, true, true)
 TRANS64_FLAGS2(ISA310, PLXVP, do_lstxv_PLS_D, false, true)
=20
+static void gen_xxeval_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, TCGv_i64 =
c,
+                           int64_t imm)
+{
+    /*
+     * Instead of processing imm bit-by-bit, we'll skip the computation =
of
+     * conjunctions whose corresponding bit is unset.
+     */
+    int bit;
+    TCGv_i64 conj, disj;
+
+    conj =3D tcg_temp_new_i64();
+    disj =3D tcg_const_i64(0);
+
+    /* Iterate over set bits from the least to the most significant bit =
*/
+    while (imm) {
+        /*
+         * Get the next bit to be processed with ctz64. Invert the resul=
t of
+         * ctz64 to match the indexing used by PowerISA.
+         */
+        bit =3D 7 - ctz64(imm);
+        if (bit & 0x4) {
+            tcg_gen_mov_i64(conj, a);
+        } else {
+            tcg_gen_not_i64(conj, a);
+        }
+        if (bit & 0x2) {
+            tcg_gen_and_i64(conj, conj, b);
+        } else {
+            tcg_gen_andc_i64(conj, conj, b);
+        }
+        if (bit & 0x1) {
+            tcg_gen_and_i64(conj, conj, c);
+        } else {
+            tcg_gen_andc_i64(conj, conj, c);
+        }
+        tcg_gen_or_i64(disj, disj, conj);
+
+        /* Unset the least significant bit that is set */
+        imm &=3D imm - 1;
+    }
+
+    tcg_gen_mov_i64(t, disj);
+
+    tcg_temp_free_i64(conj);
+    tcg_temp_free_i64(disj);
+}
+
+static void gen_xxeval_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_v=
ec b,
+                           TCGv_vec c, int64_t imm)
+{
+    /*
+     * Instead of processing imm bit-by-bit, we'll skip the computation =
of
+     * conjunctions whose corresponding bit is unset.
+     */
+    int bit;
+    TCGv_vec disj, conj;
+
+    disj =3D tcg_const_zeros_vec_matching(t);
+    conj =3D tcg_temp_new_vec_matching(t);
+
+    /* Iterate over set bits from the least to the most significant bit =
*/
+    while (imm) {
+        /*
+         * Get the next bit to be processed with ctz64. Invert the resul=
t of
+         * ctz64 to match the indexing used by PowerISA.
+         */
+        bit =3D 7 - ctz64(imm);
+        if (bit & 0x4) {
+            tcg_gen_mov_vec(conj, a);
+        } else {
+            tcg_gen_not_vec(vece, conj, a);
+        }
+        if (bit & 0x2) {
+            tcg_gen_and_vec(vece, conj, conj, b);
+        } else {
+            tcg_gen_andc_vec(vece, conj, conj, b);
+        }
+        if (bit & 0x1) {
+            tcg_gen_and_vec(vece, conj, conj, c);
+        } else {
+            tcg_gen_andc_vec(vece, conj, conj, c);
+        }
+        tcg_gen_or_vec(vece, disj, disj, conj);
+
+        /* Unset the least significant bit that is set */
+        imm &=3D imm - 1;
+    }
+
+    tcg_gen_mov_vec(t, disj);
+
+    tcg_temp_free_vec(disj);
+    tcg_temp_free_vec(conj);
+}
+
+static bool trans_XXEVAL(DisasContext *ctx, arg_8RR_XX4_imm *a)
+{
+    static const TCGOpcode vecop_list[] =3D {
+        INDEX_op_andc_vec, 0
+    };
+    static const GVecGen4i op =3D {
+        .fniv =3D gen_xxeval_vec,
+        .fno =3D gen_helper_XXEVAL,
+        .fni8 =3D gen_xxeval_i64,
+        .opt_opc =3D vecop_list,
+        .vece =3D MO_64
+    };
+    int xt =3D vsr_full_offset(a->xt), xa =3D vsr_full_offset(a->xa),
+        xb =3D vsr_full_offset(a->xb), xc =3D vsr_full_offset(a->xc);
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    /* Equivalent functions that can be implemented with a single gen_gv=
ec */
+    switch (a->imm) {
+    case 0b00000000: /* true */
+        set_cpu_vsr(a->xt, tcg_constant_i64(0), true);
+        set_cpu_vsr(a->xt, tcg_constant_i64(0), false);
+        break;
+    case 0b00000011: /* and(B,A) */
+        tcg_gen_gvec_and(MO_64, xt, xb, xa, 16, 16);
+        break;
+    case 0b00000101: /* and(C,A) */
+        tcg_gen_gvec_and(MO_64, xt, xc, xa, 16, 16);
+        break;
+    case 0b00001111: /* A */
+        tcg_gen_gvec_mov(MO_64, xt, xa, 16, 16);
+        break;
+    case 0b00010001: /* and(C,B) */
+        tcg_gen_gvec_and(MO_64, xt, xc, xb, 16, 16);
+        break;
+    case 0b00011011: /* C?B:A */
+        tcg_gen_gvec_bitsel(MO_64, xt, xc, xb, xa, 16, 16);
+        break;
+    case 0b00011101: /* B?C:A */
+        tcg_gen_gvec_bitsel(MO_64, xt, xb, xc, xa, 16, 16);
+        break;
+    case 0b00100111: /* C?A:B */
+        tcg_gen_gvec_bitsel(MO_64, xt, xc, xa, xb, 16, 16);
+        break;
+    case 0b00110011: /* B */
+        tcg_gen_gvec_mov(MO_64, xt, xb, 16, 16);
+        break;
+    case 0b00110101: /* A?C:B */
+        tcg_gen_gvec_bitsel(MO_64, xt, xa, xc, xb, 16, 16);
+        break;
+    case 0b00111100: /* xor(B,A) */
+        tcg_gen_gvec_xor(MO_64, xt, xb, xa, 16, 16);
+        break;
+    case 0b00111111: /* or(B,A) */
+        tcg_gen_gvec_or(MO_64, xt, xb, xa, 16, 16);
+        break;
+    case 0b01000111: /* B?A:C */
+        tcg_gen_gvec_bitsel(MO_64, xt, xb, xa, xc, 16, 16);
+        break;
+    case 0b01010011: /* A?B:C */
+        tcg_gen_gvec_bitsel(MO_64, xt, xa, xb, xc, 16, 16);
+        break;
+    case 0b01010101: /* C */
+        tcg_gen_gvec_mov(MO_64, xt, xc, 16, 16);
+        break;
+    case 0b01011010: /* xor(C,A) */
+        tcg_gen_gvec_xor(MO_64, xt, xc, xa, 16, 16);
+        break;
+    case 0b01011111: /* or(C,A) */
+        tcg_gen_gvec_or(MO_64, xt, xc, xa, 16, 16);
+        break;
+    case 0b01100110: /* xor(C,B) */
+        tcg_gen_gvec_xor(MO_64, xt, xc, xb, 16, 16);
+        break;
+    case 0b01110111: /* or(C,B) */
+        tcg_gen_gvec_or(MO_64, xt, xc, xb, 16, 16);
+        break;
+    case 0b10001000: /* nor(C,B) */
+        tcg_gen_gvec_nor(MO_64, xt, xc, xb, 16, 16);
+        break;
+    case 0b10011001: /* eqv(C,B) */
+        tcg_gen_gvec_eqv(MO_64, xt, xc, xb, 16, 16);
+        break;
+    case 0b10100000: /* nor(C,A) */
+        tcg_gen_gvec_nor(MO_64, xt, xc, xa, 16, 16);
+        break;
+    case 0b10100101: /* eqv(C,A) */
+        tcg_gen_gvec_eqv(MO_64, xt, xc, xa, 16, 16);
+        break;
+    case 0b10101010: /* not(C) */
+        tcg_gen_gvec_not(MO_64, xt, xc, 16, 16);
+        break;
+    case 0b11000000: /* nor(B,A) */
+        tcg_gen_gvec_nor(MO_64, xt,  xb, xa, 16, 16);
+        break;
+    case 0b11000011: /* eqv(B,A) */
+        tcg_gen_gvec_eqv(MO_64, xt,  xb, xa, 16, 16);
+        break;
+    case 0b11001100: /* not(B) */
+        tcg_gen_gvec_not(MO_64, xt, xb, 16, 16);
+        break;
+    case 0b11101110: /* nand(C,B) */
+        tcg_gen_gvec_nand(MO_64, xt, xc, xb, 16, 16);
+        break;
+    case 0b11110000: /* not(A) */
+        tcg_gen_gvec_not(MO_64, xt, xa, 16, 16);
+        break;
+    case 0b11111010: /* nand(C,A) */
+        tcg_gen_gvec_nand(MO_64, xt, xc, xa, 16, 16);
+        break;
+    case 0b11111100: /* nand(B,A) */
+        tcg_gen_gvec_nand(MO_64, xt, xb, xa, 16, 16);
+        break;
+    case 0b11111111: /* true */
+        set_cpu_vsr(a->xt, tcg_constant_i64(-1), true);
+        set_cpu_vsr(a->xt, tcg_constant_i64(-1), false);
+        break;
+    default:
+        /* Fallback to compute all conjunctions/disjunctions */
+        tcg_gen_gvec_4i(xt, xa, xb, xc, 16, 16, a->imm, &op);
+    }
+
+    return true;
+}
+
 static void gen_xxblendv_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv=
_vec b,
                              TCGv_vec c)
 {
--=20
2.34.1


