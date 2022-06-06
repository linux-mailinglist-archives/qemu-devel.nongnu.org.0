Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD41353E56E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:25:30 +0200 (CEST)
Received: from localhost ([::1]:38334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEbg-0003tR-U1
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nyEEo-0002kq-U9; Mon, 06 Jun 2022 11:01:50 -0400
Received: from [187.72.171.209] (port=55330 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nyEEn-0004pP-11; Mon, 06 Jun 2022 11:01:50 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 6 Jun 2022 12:01:35 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 5E73F801301;
 Mon,  6 Jun 2022 12:01:35 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 1/7] target/ppc: use int128.h methods in vpmsumd
Date: Mon,  6 Jun 2022 12:00:31 -0300
Message-Id: <20220606150037.338931-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606150037.338931-1-matheus.ferst@eldorado.org.br>
References: <20220606150037.338931-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Jun 2022 15:01:35.0621 (UTC)
 FILETIME=[50EDF350:01D879B6]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also drop VECTOR_FOR_INORDER_I usage since there is no need to access
the elements in any particular order, and move the instruction to
decodetree.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                 |  2 +-
 target/ppc/insn32.decode            |  4 +++
 target/ppc/int_helper.c             | 46 ++++++-----------------------
 target/ppc/translate/vmx-impl.c.inc |  3 +-
 target/ppc/translate/vmx-ops.c.inc  |  1 -
 5 files changed, 16 insertions(+), 40 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index d627cfe6ed..39ad114c97 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -318,7 +318,7 @@ DEF_HELPER_FLAGS_3(vbpermq, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vpmsumb, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vpmsumh, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vpmsumw, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(vpmsumd, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VPMSUMD, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_2(vextublx, TCG_CALL_NO_RWG, tl, tl, avr)
 DEF_HELPER_FLAGS_2(vextuhlx, TCG_CALL_NO_RWG, tl, tl, avr)
 DEF_HELPER_FLAGS_2(vextuwlx, TCG_CALL_NO_RWG, tl, tl, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 6ea48d5163..0772729c6e 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -426,6 +426,10 @@ DSCLIQ          111111 ..... ..... ...... 001000010 .   @Z22_tap_sh_rc
 DSCRI           111011 ..... ..... ...... 001100010 .   @Z22_ta_sh_rc
 DSCRIQ          111111 ..... ..... ...... 001100010 .   @Z22_tap_sh_rc
 
+## Vector Exclusive-OR-based Instructions
+
+VPMSUMD         000100 ..... ..... ..... 10011001000    @VX
+
 ## Vector Integer Instructions
 
 VCMPEQUB        000100 ..... ..... ..... . 0000000110   @VC
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 16357c0900..67aaa8edf5 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1484,52 +1484,24 @@ PMSUM(vpmsumb, u8, u16, uint16_t)
 PMSUM(vpmsumh, u16, u32, uint32_t)
 PMSUM(vpmsumw, u32, u64, uint64_t)
 
-void helper_vpmsumd(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VPMSUMD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-
-#ifdef CONFIG_INT128
     int i, j;
-    __uint128_t prod[2];
+    Int128 tmp, prod[2] = {int128_zero(), int128_zero()};
 
-    VECTOR_FOR_INORDER_I(i, u64) {
-        prod[i] = 0;
-        for (j = 0; j < 64; j++) {
-            if (a->u64[i] & (1ull << j)) {
-                prod[i] ^= (((__uint128_t)b->u64[i]) << j);
+    for (j = 0; j < 64; j++) {
+        for (i = 0; i < ARRAY_SIZE(r->u64); i++) {
+            if (a->VsrD(i) & (1ull << j)) {
+                tmp = int128_make64(b->VsrD(i));
+                tmp = int128_lshift(tmp, j);
+                prod[i] = int128_xor(prod[i], tmp);
             }
         }
     }
 
-    r->u128 = prod[0] ^ prod[1];
-
-#else
-    int i, j;
-    ppc_avr_t prod[2];
-
-    VECTOR_FOR_INORDER_I(i, u64) {
-        prod[i].VsrD(1) = prod[i].VsrD(0) = 0;
-        for (j = 0; j < 64; j++) {
-            if (a->u64[i] & (1ull << j)) {
-                ppc_avr_t bshift;
-                if (j == 0) {
-                    bshift.VsrD(0) = 0;
-                    bshift.VsrD(1) = b->u64[i];
-                } else {
-                    bshift.VsrD(0) = b->u64[i] >> (64 - j);
-                    bshift.VsrD(1) = b->u64[i] << j;
-                }
-                prod[i].VsrD(1) ^= bshift.VsrD(1);
-                prod[i].VsrD(0) ^= bshift.VsrD(0);
-            }
-        }
-    }
-
-    r->VsrD(1) = prod[0].VsrD(1) ^ prod[1].VsrD(1);
-    r->VsrD(0) = prod[0].VsrD(0) ^ prod[1].VsrD(0);
-#endif
+    r->s128 = int128_xor(prod[0], prod[1]);
 }
 
-
 #if HOST_BIG_ENDIAN
 #define PKBIG 1
 #else
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 0b563bed37..4c2a36405b 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2717,7 +2717,6 @@ GEN_VXFORM_TRANS(vgbbd, 6, 20);
 GEN_VXFORM(vpmsumb, 4, 16)
 GEN_VXFORM(vpmsumh, 4, 17)
 GEN_VXFORM(vpmsumw, 4, 18)
-GEN_VXFORM(vpmsumd, 4, 19)
 
 #define GEN_BCD(op)                                 \
 static void gen_##op(DisasContext *ctx)             \
@@ -3101,6 +3100,8 @@ static bool do_vx_helper(DisasContext *ctx, arg_VX *a,
     return true;
 }
 
+TRANS_FLAGS2(ALTIVEC_207, VPMSUMD, do_vx_helper, gen_helper_VPMSUMD)
+
 static bool do_vx_vmuleo(DisasContext *ctx, arg_VX *a, bool even,
                          void (*gen_mul)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64))
 {
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index d7cc57868e..26c1d957ee 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -237,7 +237,6 @@ GEN_VXFORM_207(vgbbd, 6, 20),
 GEN_VXFORM_207(vpmsumb, 4, 16),
 GEN_VXFORM_207(vpmsumh, 4, 17),
 GEN_VXFORM_207(vpmsumw, 4, 18),
-GEN_VXFORM_207(vpmsumd, 4, 19),
 
 GEN_VXFORM_207(vsbox, 4, 23),
 
-- 
2.25.1


