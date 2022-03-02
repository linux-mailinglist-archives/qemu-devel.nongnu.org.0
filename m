Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACB94CA462
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:04:14 +0100 (CET)
Received: from localhost ([::1]:50164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNiH-0007ZI-Qi
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:04:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrB-0001M8-Hx; Wed, 02 Mar 2022 06:09:22 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6284
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr9-0001rg-Fh; Wed, 02 Mar 2022 06:09:21 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222ANW5E020803; 
 Wed, 2 Mar 2022 11:08:48 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej6sr0u1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:48 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2eXr021777;
 Wed, 2 Mar 2022 11:08:46 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3efbu9efk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:46 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 222Avnh142729966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 10:57:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7076EA407D;
 Wed,  2 Mar 2022 11:08:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 251F4A4081;
 Wed,  2 Mar 2022 11:08:44 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:44 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 0B1A9220294;
 Wed,  2 Mar 2022 12:08:42 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 53/87] target/ppc: implement plxsd/pstxsd
Date: Wed,  2 Mar 2022 12:07:29 +0100
Message-Id: <20220302110803.849505-54-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YmWJ3y4I_WNX3fBH3-zaT4ljciRd1MIN
X-Proofpoint-GUID: YmWJ3y4I_WNX3fBH3-zaT4ljciRd1MIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1034 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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
 Leandro Lupori <leandro.lupori@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leandro Lupori <leandro.lupori@eldorado.org.br>

Implement instructions plxsd/pstxsd and port lxsd/stxsd to decode
tree.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-48-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  2 ++
 target/ppc/insn64.decode            | 10 ++++++
 target/ppc/translate.c              | 14 ++------
 target/ppc/translate/vsx-impl.c.inc | 55 +++++++++++++++++++++++++++--
 4 files changed, 67 insertions(+), 14 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index fede42f5ce33..37b64705030a 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -602,6 +602,8 @@ VCLRRB          000100 ..... ..... ..... 00111001101 =
   @VX
=20
 # VSX Load/Store Instructions
=20
+LXSD            111001 ..... ..... .............. 10    @DS
+STXSD           111101 ..... ..... .............. 10    @DS
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
 STXV            111101 ..... ..... ............ . 101   @DQ_TSX
 LXVP            000110 ..... ..... ............ 0000    @DQ_TSXP
diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index fdb859f62dd8..b7426f5b2481 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -32,6 +32,10 @@
                 ...... ..... ra:5 ................       \
                 &PLS_D si=3D%pls_si rt=3D%rt_tsxp
=20
+@8LS_D          ...... .. . .. r:1 .. .................. \
+                ...... rt:5 ra:5 ................        \
+                &PLS_D si=3D%pls_si
+
 # Format 8RR:D
 %8rr_si         32:s16 0:16
 %8rr_xt         16:1 21:5
@@ -180,6 +184,12 @@ PSTFD           000001 10 0--.-- .................. =
\
=20
 ### VSX instructions
=20
+PLXSD           000001 00 0--.-- .................. \
+                101010 ..... ..... ................     @8LS_D
+
+PSTXSD          000001 00 0--.-- .................. \
+                101110 ..... ..... ................     @8LS_D
+
 PLXV            000001 00 0--.-- .................. \
                 11001 ...... ..... ................     @8LS_D_TSX
 PSTXV           000001 00 0--.-- .................. \
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b46a11386eee..1ef2eeeead90 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6668,7 +6668,7 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_D =
*d, arg_PLS_D *a)
=20
 #include "translate/branch-impl.c.inc"
=20
-/* Handles lfdp, lxsd, lxssp */
+/* Handles lfdp, lxssp */
 static void gen_dform39(DisasContext *ctx)
 {
     switch (ctx->opcode & 0x3) {
@@ -6677,11 +6677,6 @@ static void gen_dform39(DisasContext *ctx)
             return gen_lfdp(ctx);
         }
         break;
-    case 2: /* lxsd */
-        if (ctx->insns_flags2 & PPC2_ISA300) {
-            return gen_lxsd(ctx);
-        }
-        break;
     case 3: /* lxssp */
         if (ctx->insns_flags2 & PPC2_ISA300) {
             return gen_lxssp(ctx);
@@ -6691,7 +6686,7 @@ static void gen_dform39(DisasContext *ctx)
     return gen_invalid(ctx);
 }
=20
-/* handles stfdp, lxv, stxsd, stxssp lxvx */
+/* handles stfdp, lxv, stxssp lxvx */
 static void gen_dform3D(DisasContext *ctx)
 {
     if ((ctx->opcode & 3) !=3D 1) { /* DS-FORM */
@@ -6701,11 +6696,6 @@ static void gen_dform3D(DisasContext *ctx)
                 return gen_stfdp(ctx);
             }
             break;
-        case 2: /* stxsd */
-            if (ctx->insns_flags2 & PPC2_ISA300) {
-                return gen_stxsd(ctx);
-            }
-            break;
         case 3: /* stxssp */
             if (ctx->insns_flags2 & PPC2_ISA300) {
                 return gen_stxssp(ctx);
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index 0344c47eed14..a6e9417f2d5f 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -309,7 +309,6 @@ static void gen_##name(DisasContext *ctx)            =
             \
     tcg_temp_free_i64(xth);                                       \
 }
=20
-VSX_LOAD_SCALAR_DS(lxsd, ld64_i64)
 VSX_LOAD_SCALAR_DS(lxssp, ld32fs)
=20
 #define VSX_STORE_SCALAR(name, operation)                     \
@@ -482,7 +481,6 @@ static void gen_##name(DisasContext *ctx)            =
             \
     tcg_temp_free_i64(xth);                                       \
 }
=20
-VSX_STORE_SCALAR_DS(stxsd, st64_i64)
 VSX_STORE_SCALAR_DS(stxssp, st32fs)
=20
 static void gen_mfvsrwz(DisasContext *ctx)
@@ -2298,6 +2296,57 @@ static bool do_lstxv_X(DisasContext *ctx, arg_X *a=
, bool store, bool paired)
     return do_lstxv(ctx, a->ra, cpu_gpr[a->rb], a->rt, store, paired);
 }
=20
+static bool do_lstxsd(DisasContext *ctx, int rt, int ra, TCGv displ, boo=
l store)
+{
+    TCGv ea;
+    TCGv_i64 xt;
+    MemOp mop;
+
+    if (store) {
+        REQUIRE_VECTOR(ctx);
+    } else {
+        REQUIRE_VSX(ctx);
+    }
+
+    xt =3D tcg_temp_new_i64();
+    mop =3D DEF_MEMOP(MO_UQ);
+
+    gen_set_access_type(ctx, ACCESS_INT);
+    ea =3D do_ea_calc(ctx, ra, displ);
+
+    if (store) {
+        get_cpu_vsr(xt, rt + 32, true);
+        tcg_gen_qemu_st_i64(xt, ea, ctx->mem_idx, mop);
+    } else {
+        tcg_gen_qemu_ld_i64(xt, ea, ctx->mem_idx, mop);
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
+static bool do_lstxsd_DS(DisasContext *ctx, arg_D *a, bool store)
+{
+    return do_lstxsd(ctx, a->rt, a->ra, tcg_constant_tl(a->si), store);
+}
+
+static bool do_plstxsd_PLS_D(DisasContext *ctx, arg_PLS_D *a, bool store=
)
+{
+    arg_D d;
+
+    if (!resolve_PLS_D(ctx, &d, a)) {
+        return true;
+    }
+
+    return do_lstxsd(ctx, d.rt, d.ra, tcg_constant_tl(d.si), store);
+}
+
+TRANS_FLAGS2(ISA300, LXSD, do_lstxsd_DS, false)
+TRANS_FLAGS2(ISA300, STXSD, do_lstxsd_DS, true)
 TRANS_FLAGS2(ISA300, STXV, do_lstxv_D, true, false)
 TRANS_FLAGS2(ISA300, LXV, do_lstxv_D, false, false)
 TRANS_FLAGS2(ISA310, STXVP, do_lstxv_D, true, true)
@@ -2306,6 +2355,8 @@ TRANS_FLAGS2(ISA300, STXVX, do_lstxv_X, true, false=
)
 TRANS_FLAGS2(ISA300, LXVX, do_lstxv_X, false, false)
 TRANS_FLAGS2(ISA310, STXVPX, do_lstxv_X, true, true)
 TRANS_FLAGS2(ISA310, LXVPX, do_lstxv_X, false, true)
+TRANS64_FLAGS2(ISA310, PLXSD, do_plstxsd_PLS_D, false)
+TRANS64_FLAGS2(ISA310, PSTXSD, do_plstxsd_PLS_D, true)
 TRANS64_FLAGS2(ISA310, PSTXV, do_lstxv_PLS_D, true, false)
 TRANS64_FLAGS2(ISA310, PLXV, do_lstxv_PLS_D, false, false)
 TRANS64_FLAGS2(ISA310, PSTXVP, do_lstxv_PLS_D, true, true)
--=20
2.34.1


