Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE96604663
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:09:22 +0200 (CEST)
Received: from localhost ([::1]:38982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol8oy-0007CW-VL
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ol8YW-0005LK-4n; Wed, 19 Oct 2022 08:52:20 -0400
Received: from [200.168.210.66] (port=3639 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ol8YU-00025u-6m; Wed, 19 Oct 2022 08:52:19 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 19 Oct 2022 09:50:43 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 38839800278;
 Wed, 19 Oct 2022 09:50:43 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v3 04/12] target/ppc: Move VNEG[WD] to decodtree and use gvec
Date: Wed, 19 Oct 2022 09:50:32 -0300
Message-Id: <20221019125040.48028-5-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019125040.48028-1-lucas.araujo@eldorado.org.br>
References: <20221019125040.48028-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 19 Oct 2022 12:50:43.0562 (UTC)
 FILETIME=[668114A0:01D8E3B9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Moved the instructions VNEGW and VNEGD to decodetree and used gvec to
decode it.

vnegw:
rept    loop    master             patch
8       12500   0,01053200         0,00548400 (-47.9%)
25      4000    0,01030500         0,00390000 (-62.2%)
100     1000    0,01096300         0,00395400 (-63.9%)
500     200     0,01472000         0,00712300 (-51.6%)
2500    40      0,03809000         0,02147700 (-43.6%)
8000    12      0,09957100         0,06202100 (-37.7%)

vnegd:
rept    loop    master             patch
8       12500   0,00594600         0,00543800 (-8.5%)
25      4000    0,00575200         0,00396400 (-31.1%)
100     1000    0,00676100         0,00394800 (-41.6%)
500     200     0,01149300         0,00709400 (-38.3%)
2500    40      0,03441500         0,02169600 (-37.0%)
8000    12      0,09516900         0,06337000 (-33.4%)

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper.h                 |  2 --
 target/ppc/insn32.decode            |  3 +++
 target/ppc/int_helper.c             | 12 ------------
 target/ppc/translate/vmx-impl.c.inc | 15 +++++++++++++--
 target/ppc/translate/vmx-ops.c.inc  |  2 --
 5 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f7047ed2aa..b2e910b089 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -229,8 +229,6 @@ DEF_HELPER_FLAGS_2(VSTRIBL, TCG_CALL_NO_RWG, i32, avr, avr)
 DEF_HELPER_FLAGS_2(VSTRIBR, TCG_CALL_NO_RWG, i32, avr, avr)
 DEF_HELPER_FLAGS_2(VSTRIHL, TCG_CALL_NO_RWG, i32, avr, avr)
 DEF_HELPER_FLAGS_2(VSTRIHR, TCG_CALL_NO_RWG, i32, avr, avr)
-DEF_HELPER_FLAGS_2(vnegw, TCG_CALL_NO_RWG, void, avr, avr)
-DEF_HELPER_FLAGS_2(vnegd, TCG_CALL_NO_RWG, void, avr, avr)
 DEF_HELPER_FLAGS_2(vupkhpx, TCG_CALL_NO_RWG, void, avr, avr)
 DEF_HELPER_FLAGS_2(vupklpx, TCG_CALL_NO_RWG, void, avr, avr)
 DEF_HELPER_FLAGS_2(vupkhsb, TCG_CALL_NO_RWG, void, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index aebc7b73c8..2658dd3395 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -629,6 +629,9 @@ VEXTSH2D        000100 ..... 11001 ..... 11000000010    @VX_tb
 VEXTSW2D        000100 ..... 11010 ..... 11000000010    @VX_tb
 VEXTSD2Q        000100 ..... 11011 ..... 11000000010    @VX_tb
 
+VNEGD           000100 ..... 00111 ..... 11000000010    @VX_tb
+VNEGW           000100 ..... 00110 ..... 11000000010    @VX_tb
+
 ## Vector Mask Manipulation Instructions
 
 MTVSRBM         000100 ..... 10000 ..... 11001000010    @VX_tb
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index f8dd12e8ae..c7fd0d1faa 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1928,18 +1928,6 @@ XXBLEND(W, 32)
 XXBLEND(D, 64)
 #undef XXBLEND
 
-#define VNEG(name, element)                                         \
-void helper_##name(ppc_avr_t *r, ppc_avr_t *b)                      \
-{                                                                   \
-    int i;                                                          \
-    for (i = 0; i < ARRAY_SIZE(r->element); i++) {                  \
-        r->element[i] = -b->element[i];                             \
-    }                                                               \
-}
-VNEG(vnegw, s32)
-VNEG(vnegd, s64)
-#undef VNEG
-
 void helper_vsro(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
     int sh = (b->VsrB(0xf) >> 3) & 0xf;
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index f52485a5f1..b9a9e83ab3 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2625,8 +2625,19 @@ GEN_VXFORM_NOA(vclzb, 1, 28)
 GEN_VXFORM_NOA(vclzh, 1, 29)
 GEN_VXFORM_TRANS(vclzw, 1, 30)
 GEN_VXFORM_TRANS(vclzd, 1, 31)
-GEN_VXFORM_NOA_2(vnegw, 1, 24, 6)
-GEN_VXFORM_NOA_2(vnegd, 1, 24, 7)
+
+static bool do_vneg(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_neg(vece, avr_full_offset(a->vrt), avr_full_offset(a->vrb),
+                     16, 16);
+    return true;
+}
+
+TRANS(VNEGW, do_vneg, MO_32)
+TRANS(VNEGD, do_vneg, MO_64)
 
 static void gen_vexts_i64(TCGv_i64 t, TCGv_i64 b, int64_t s)
 {
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index ded0234123..27908533dd 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -181,8 +181,6 @@ GEN_VXFORM_300_EXT(vextractd, 6, 11, 0x100000),
 GEN_VXFORM(vspltisb, 6, 12),
 GEN_VXFORM(vspltish, 6, 13),
 GEN_VXFORM(vspltisw, 6, 14),
-GEN_VXFORM_300_EO(vnegw, 0x01, 0x18, 0x06),
-GEN_VXFORM_300_EO(vnegd, 0x01, 0x18, 0x07),
 GEN_VXFORM_300_EO(vctzb, 0x01, 0x18, 0x1C),
 GEN_VXFORM_300_EO(vctzh, 0x01, 0x18, 0x1D),
 GEN_VXFORM_300_EO(vctzw, 0x01, 0x18, 0x1E),
-- 
2.37.3


