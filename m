Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A172E1DA8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 16:05:06 +0200 (CEST)
Received: from localhost ([::1]:36898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNHG5-0004Fu-7g
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 10:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51797)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1iNHBJ-0002ZK-Ps
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:00:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1iNHBH-0004pS-NN
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:00:09 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:46661 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefan.brankovic@rt-rk.com>)
 id 1iNHBH-0004n1-23
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:00:07 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id D53791A227D;
 Wed, 23 Oct 2019 16:00:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw870-lin.domain.local (rtrkw870-lin.domain.local
 [10.10.14.77])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 81C8E1A21DA;
 Wed, 23 Oct 2019 16:00:02 +0200 (CEST)
From: Stefan Brankovic <stefan.brankovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 3/3] target/ppc: Optimize emulation of vupkhpx and vupklpx
 instructions
Date: Wed, 23 Oct 2019 15:59:56 +0200
Message-Id: <1571839196-1739-4-git-send-email-stefan.brankovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571839196-1739-1-git-send-email-stefan.brankovic@rt-rk.com>
References: <1571839196-1739-1-git-send-email-stefan.brankovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: aleksandar.markovic@rt-rk.com, stefan.brankovic@rt-rk.com,
 richard.henderson@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimize altivec instructions vupkhpx and vupklpx (Vector Unpack High/Low
Pixel). Unpacks 4 pixels coded in 1-5-5-5 pattern from source register
into a contigous array of bits in the destination register.

'trans_vupkpx' function implements emulation of both vupkhpx and vupklpx
instructions, while its argument 'high' determines which instruction is
processed. Instructions are implemented in two 'for' loops. Outer 'for'
loop repeats unpacking two times, since both doubleword elements of the
destination register are formed the same way. It also stores result of
every iteration in a temporary variable 'result', that is later transferred
to the destination register. Inner 'for' loop does unpacking of pixels in
two iterations. Each iteration takes 16 bits from source register and
unpacks them into 32 bits of the destination register.

Signed-off-by: Stefan Brankovic <stefan.brankovic@rt-rk.com>
---
 target/ppc/helper.h                 |  2 -
 target/ppc/int_helper.c             | 20 ---------
 target/ppc/translate/vmx-impl.inc.c | 82 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 80 insertions(+), 24 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index b489b38..fd06b56 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -233,8 +233,6 @@ DEF_HELPER_2(vextsh2d, void, avr, avr)
 DEF_HELPER_2(vextsw2d, void, avr, avr)
 DEF_HELPER_2(vnegw, void, avr, avr)
 DEF_HELPER_2(vnegd, void, avr, avr)
-DEF_HELPER_2(vupkhpx, void, avr, avr)
-DEF_HELPER_2(vupklpx, void, avr, avr)
 DEF_HELPER_2(vupkhsb, void, avr, avr)
 DEF_HELPER_2(vupkhsh, void, avr, avr)
 DEF_HELPER_2(vupkhsw, void, avr, avr)
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index f910c11..9ee667d 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1737,26 +1737,6 @@ void helper_vsum4ubs(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 #define UPKHI 0
 #define UPKLO 1
 #endif
-#define VUPKPX(suffix, hi)                                              \
-    void helper_vupk##suffix(ppc_avr_t *r, ppc_avr_t *b)                \
-    {                                                                   \
-        int i;                                                          \
-        ppc_avr_t result;                                               \
-                                                                        \
-        for (i = 0; i < ARRAY_SIZE(r->u32); i++) {                      \
-            uint16_t e = b->u16[hi ? i : i + 4];                        \
-            uint8_t a = (e >> 15) ? 0xff : 0;                           \
-            uint8_t r = (e >> 10) & 0x1f;                               \
-            uint8_t g = (e >> 5) & 0x1f;                                \
-            uint8_t b = e & 0x1f;                                       \
-                                                                        \
-            result.u32[i] = (a << 24) | (r << 16) | (g << 8) | b;       \
-        }                                                               \
-        *r = result;                                                    \
-    }
-VUPKPX(lpx, UPKLO)
-VUPKPX(hpx, UPKHI)
-#undef VUPKPX
 
 #define VUPK(suffix, unpacked, packee, hi)                              \
     void helper_vupk##suffix(ppc_avr_t *r, ppc_avr_t *b)                \
diff --git a/target/ppc/translate/vmx-impl.inc.c b/target/ppc/translate/vmx-impl.inc.c
index 787008d..c246880 100644
--- a/target/ppc/translate/vmx-impl.inc.c
+++ b/target/ppc/translate/vmx-impl.inc.c
@@ -670,6 +670,84 @@ static void trans_vpkpx(DisasContext *ctx)
 }
 
 /*
+ * vupkhpx VRT,VRB - Vector Unpack High Pixel
+ * vupklpx VRT,VRB - Vector Unpack Low Pixel
+ *
+ * Unpacks 4 pixels coded in 1-5-5-5 pattern from high/low doubleword element
+ * of source register into contigous array of bits in the destination register.
+ * Argument 'high' determines if high or low doubleword element of source
+ * register is processed.
+ */
+static void trans_vupkpx(DisasContext *ctx, bool high)
+{
+    int VT = rD(ctx->opcode);
+    int VB = rB(ctx->opcode);
+    TCGv_i64 tmp = tcg_temp_new_i64();
+    TCGv_i64 avr = tcg_temp_new_i64();
+    TCGv_i64 result = tcg_temp_new_i64();
+    TCGv_i64 result1 = tcg_temp_new_i64();
+    int64_t mask1 = 0x1fULL;
+    int64_t mask2 = 0x1fULL << 8;
+    int64_t mask3 = 0x1fULL << 16;
+    int64_t mask4 = 0xffULL << 56;
+    int i, j;
+
+    if (high == true) {
+        /* vupkhpx */
+        get_avr64(avr, VB, true);
+    } else {
+        /* vupklpx */
+        get_avr64(avr, VB, false);
+    }
+
+    tcg_gen_movi_i64(result, 0x0ULL);
+    for (i = 0; i < 2; i++) {
+        for (j = 0; j < 2; j++) {
+            tcg_gen_shli_i64(tmp, avr, (j * 16));
+            tcg_gen_andi_i64(tmp, tmp, mask1 << (j * 32));
+            tcg_gen_or_i64(result, result, tmp);
+
+            tcg_gen_shli_i64(tmp, avr, 3 + (j * 16));
+            tcg_gen_andi_i64(tmp, tmp, mask2 << (j * 32));
+            tcg_gen_or_i64(result, result, tmp);
+
+            tcg_gen_shli_i64(tmp, avr, 6 + (j * 16));
+            tcg_gen_andi_i64(tmp, tmp, mask3 << (j * 32));
+            tcg_gen_or_i64(result, result, tmp);
+
+            tcg_gen_shri_i64(tmp, avr, (j * 16));
+            tcg_gen_ext16s_i64(tmp, tmp);
+            tcg_gen_andi_i64(tmp, tmp, mask4);
+            tcg_gen_shri_i64(tmp, tmp, (32 * (1 - j)));
+            tcg_gen_or_i64(result, result, tmp);
+        }
+        if (i == 0) {
+            tcg_gen_mov_i64(result1, result);
+            tcg_gen_movi_i64(result, 0x0ULL);
+            tcg_gen_shri_i64(avr, avr, 32);
+        }
+    }
+
+    set_avr64(VT, result1, false);
+    set_avr64(VT, result, true);
+
+    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(avr);
+    tcg_temp_free_i64(result);
+    tcg_temp_free_i64(result1);
+}
+
+static void trans_vupkhpx(DisasContext *ctx)
+{
+    trans_vupkpx(ctx, true);
+}
+
+static void trans_vupklpx(DisasContext *ctx)
+{
+    trans_vupkpx(ctx, false);
+}
+
+/*
  * vsl VRT,VRA,VRB - Vector Shift Left
  *
  * Shifting left 128 bit value of vA by value specified in bits 125-127 of vB.
@@ -1338,8 +1416,8 @@ GEN_VXFORM_NOA(vupkhsw, 7, 25);
 GEN_VXFORM_NOA(vupklsb, 7, 10);
 GEN_VXFORM_NOA(vupklsh, 7, 11);
 GEN_VXFORM_NOA(vupklsw, 7, 27);
-GEN_VXFORM_NOA(vupkhpx, 7, 13);
-GEN_VXFORM_NOA(vupklpx, 7, 15);
+GEN_VXFORM_TRANS(vupkhpx, 7, 13);
+GEN_VXFORM_TRANS(vupklpx, 7, 15);
 GEN_VXFORM_NOA_ENV(vrefp, 5, 4);
 GEN_VXFORM_NOA_ENV(vrsqrtefp, 5, 5);
 GEN_VXFORM_NOA_ENV(vexptefp, 5, 6);
-- 
2.7.4


