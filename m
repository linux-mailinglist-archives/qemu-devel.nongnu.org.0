Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168164CA4E2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:34:31 +0100 (CET)
Received: from localhost ([::1]:56664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOBa-0002uD-2q
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:34:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrK-0001TE-4E; Wed, 02 Mar 2022 06:09:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrF-0001tw-CZ; Wed, 02 Mar 2022 06:09:29 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228LgTW012753; 
 Wed, 2 Mar 2022 11:08:50 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej50ku6kj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:50 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2grN028181;
 Wed, 2 Mar 2022 11:08:47 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3efbu9d2wx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:47 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8joo51183902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:45 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CD93A4080;
 Wed,  2 Mar 2022 11:08:45 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6D68A407C;
 Wed,  2 Mar 2022 11:08:44 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:44 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 192072201C1;
 Wed,  2 Mar 2022 12:08:44 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 54/87] target/ppc: implement plxssp/pstxssp
Date: Wed,  2 Mar 2022 12:07:30 +0100
Message-Id: <20220302110803.849505-55-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SRCi5nE3yYG78aJ9QvY0cN6Tb7zTWyqr
X-Proofpoint-ORIG-GUID: SRCi5nE3yYG78aJ9QvY0cN6Tb7zTWyqr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1034
 phishscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
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
 Leandro Lupori <leandro.lupori@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leandro Lupori <leandro.lupori@eldorado.org.br>

Implement instructions plxssp/pstxssp and port lxssp/stxssp to
decode tree.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-49-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  2 +
 target/ppc/insn64.decode            |  6 ++
 target/ppc/translate.c              | 29 +++------
 target/ppc/translate/vsx-impl.c.inc | 93 +++++++++++++++--------------
 4 files changed, 62 insertions(+), 68 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 37b64705030a..1641a3189417 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -604,6 +604,8 @@ VCLRRB          000100 ..... ..... ..... 00111001101 =
   @VX
=20
 LXSD            111001 ..... ..... .............. 10    @DS
 STXSD           111101 ..... ..... .............. 10    @DS
+LXSSP           111001 ..... ..... .............. 11    @DS
+STXSSP          111101 ..... ..... .............. 11    @DS
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
 STXV            111101 ..... ..... ............ . 101   @DQ_TSX
 LXVP            000110 ..... ..... ............ 0000    @DQ_TSXP
diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index b7426f5b2481..691e8fe6c0bb 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -190,6 +190,12 @@ PLXSD           000001 00 0--.-- .................. =
\
 PSTXSD          000001 00 0--.-- .................. \
                 101110 ..... ..... ................     @8LS_D
=20
+PLXSSP          000001 00 0--.-- .................. \
+                101011 ..... ..... ................     @8LS_D
+
+PSTXSSP         000001 00 0--.-- .................. \
+                101111 ..... ..... ................     @8LS_D
+
 PLXV            000001 00 0--.-- .................. \
                 11001 ...... ..... ................     @8LS_D_TSX
 PSTXV           000001 00 0--.-- .................. \
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 1ef2eeeead90..408ae26173de 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6668,39 +6668,24 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_=
D *d, arg_PLS_D *a)
=20
 #include "translate/branch-impl.c.inc"
=20
-/* Handles lfdp, lxssp */
+/* Handles lfdp */
 static void gen_dform39(DisasContext *ctx)
 {
-    switch (ctx->opcode & 0x3) {
-    case 0: /* lfdp */
+    if ((ctx->opcode & 0x3) =3D=3D 0) {
         if (ctx->insns_flags2 & PPC2_ISA205) {
             return gen_lfdp(ctx);
         }
-        break;
-    case 3: /* lxssp */
-        if (ctx->insns_flags2 & PPC2_ISA300) {
-            return gen_lxssp(ctx);
-        }
-        break;
     }
     return gen_invalid(ctx);
 }
=20
-/* handles stfdp, lxv, stxssp lxvx */
+/* Handles stfdp */
 static void gen_dform3D(DisasContext *ctx)
 {
-    if ((ctx->opcode & 3) !=3D 1) { /* DS-FORM */
-        switch (ctx->opcode & 0x3) {
-        case 0: /* stfdp */
-            if (ctx->insns_flags2 & PPC2_ISA205) {
-                return gen_stfdp(ctx);
-            }
-            break;
-        case 3: /* stxssp */
-            if (ctx->insns_flags2 & PPC2_ISA300) {
-                return gen_stxssp(ctx);
-            }
-            break;
+    if ((ctx->opcode & 3) =3D=3D 0) { /* DS-FORM */
+        /* stfdp */
+        if (ctx->insns_flags2 & PPC2_ISA205) {
+            return gen_stfdp(ctx);
         }
     }
     return gen_invalid(ctx);
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index a6e9417f2d5f..a980a79b7880 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -288,29 +288,6 @@ VSX_VECTOR_LOAD_STORE_LENGTH(stxvl)
 VSX_VECTOR_LOAD_STORE_LENGTH(stxvll)
 #endif
=20
-#define VSX_LOAD_SCALAR_DS(name, operation)                       \
-static void gen_##name(DisasContext *ctx)                         \
-{                                                                 \
-    TCGv EA;                                                      \
-    TCGv_i64 xth;                                                 \
-                                                                  \
-    if (unlikely(!ctx->altivec_enabled)) {                        \
-        gen_exception(ctx, POWERPC_EXCP_VPU);                     \
-        return;                                                   \
-    }                                                             \
-    xth =3D tcg_temp_new_i64();                                     \
-    gen_set_access_type(ctx, ACCESS_INT);                         \
-    EA =3D tcg_temp_new();                                          \
-    gen_addr_imm_index(ctx, EA, 0x03);                            \
-    gen_qemu_##operation(ctx, xth, EA);                           \
-    set_cpu_vsr(rD(ctx->opcode) + 32, xth, true);                 \
-    /* NOTE: cpu_vsrl is undefined */                             \
-    tcg_temp_free(EA);                                            \
-    tcg_temp_free_i64(xth);                                       \
-}
-
-VSX_LOAD_SCALAR_DS(lxssp, ld32fs)
-
 #define VSX_STORE_SCALAR(name, operation)                     \
 static void gen_##name(DisasContext *ctx)                     \
 {                                                             \
@@ -460,29 +437,6 @@ static void gen_stxvb16x(DisasContext *ctx)
     tcg_temp_free_i64(xsl);
 }
=20
-#define VSX_STORE_SCALAR_DS(name, operation)                      \
-static void gen_##name(DisasContext *ctx)                         \
-{                                                                 \
-    TCGv EA;                                                      \
-    TCGv_i64 xth;                                                 \
-                                                                  \
-    if (unlikely(!ctx->altivec_enabled)) {                        \
-        gen_exception(ctx, POWERPC_EXCP_VPU);                     \
-        return;                                                   \
-    }                                                             \
-    xth =3D tcg_temp_new_i64();                                     \
-    get_cpu_vsr(xth, rD(ctx->opcode) + 32, true);                 \
-    gen_set_access_type(ctx, ACCESS_INT);                         \
-    EA =3D tcg_temp_new();                                          \
-    gen_addr_imm_index(ctx, EA, 0x03);                            \
-    gen_qemu_##operation(ctx, xth, EA);                           \
-    /* NOTE: cpu_vsrl is undefined */                             \
-    tcg_temp_free(EA);                                            \
-    tcg_temp_free_i64(xth);                                       \
-}
-
-VSX_STORE_SCALAR_DS(stxssp, st32fs)
-
 static void gen_mfvsrwz(DisasContext *ctx)
 {
     if (xS(ctx->opcode) < 32) {
@@ -2345,8 +2299,53 @@ static bool do_plstxsd_PLS_D(DisasContext *ctx, ar=
g_PLS_D *a, bool store)
     return do_lstxsd(ctx, d.rt, d.ra, tcg_constant_tl(d.si), store);
 }
=20
+static bool do_lstxssp(DisasContext *ctx, int rt, int ra, TCGv displ, bo=
ol store)
+{
+    TCGv ea;
+    TCGv_i64 xt;
+
+    REQUIRE_VECTOR(ctx);
+
+    xt =3D tcg_temp_new_i64();
+
+    gen_set_access_type(ctx, ACCESS_INT);
+    ea =3D do_ea_calc(ctx, ra, displ);
+
+    if (store) {
+        get_cpu_vsr(xt, rt + 32, true);
+        gen_qemu_st32fs(ctx, xt, ea);
+    } else {
+        gen_qemu_ld32fs(ctx, xt, ea);
+        set_cpu_vsr(rt + 32, xt, true);
+        set_cpu_vsr(rt + 32, tcg_constant_i64(0), false);
+    }
+
+    tcg_temp_free(ea);
+    tcg_temp_free_i64(xt);
+
+    return true;
+}
+
+static bool do_lstxssp_DS(DisasContext *ctx, arg_D *a, bool store)
+{
+    return do_lstxssp(ctx, a->rt, a->ra, tcg_constant_tl(a->si), store);
+}
+
+static bool do_plstxssp_PLS_D(DisasContext *ctx, arg_PLS_D *a, bool stor=
e)
+{
+    arg_D d;
+
+    if (!resolve_PLS_D(ctx, &d, a)) {
+        return true;
+    }
+
+    return do_lstxssp(ctx, d.rt, d.ra, tcg_constant_tl(d.si), store);
+}
+
 TRANS_FLAGS2(ISA300, LXSD, do_lstxsd_DS, false)
 TRANS_FLAGS2(ISA300, STXSD, do_lstxsd_DS, true)
+TRANS_FLAGS2(ISA300, LXSSP, do_lstxssp_DS, false)
+TRANS_FLAGS2(ISA300, STXSSP, do_lstxssp_DS, true)
 TRANS_FLAGS2(ISA300, STXV, do_lstxv_D, true, false)
 TRANS_FLAGS2(ISA300, LXV, do_lstxv_D, false, false)
 TRANS_FLAGS2(ISA310, STXVP, do_lstxv_D, true, true)
@@ -2357,6 +2356,8 @@ TRANS_FLAGS2(ISA310, STXVPX, do_lstxv_X, true, true=
)
 TRANS_FLAGS2(ISA310, LXVPX, do_lstxv_X, false, true)
 TRANS64_FLAGS2(ISA310, PLXSD, do_plstxsd_PLS_D, false)
 TRANS64_FLAGS2(ISA310, PSTXSD, do_plstxsd_PLS_D, true)
+TRANS64_FLAGS2(ISA310, PLXSSP, do_plstxssp_PLS_D, false)
+TRANS64_FLAGS2(ISA310, PSTXSSP, do_plstxssp_PLS_D, true)
 TRANS64_FLAGS2(ISA310, PSTXV, do_lstxv_PLS_D, true, false)
 TRANS64_FLAGS2(ISA310, PLXV, do_lstxv_PLS_D, false, false)
 TRANS64_FLAGS2(ISA310, PSTXVP, do_lstxv_PLS_D, true, true)
--=20
2.34.1


