Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C816A690CD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 16:24:52 +0200 (CEST)
Received: from localhost ([::1]:39310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn1uN-0001kN-7E
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 10:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32856)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1hn1tg-0008Mq-Uk
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:24:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1hn1tf-0002Xa-GH
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:24:08 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:34309 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefan.brankovic@rt-rk.com>)
 id 1hn1tf-0001jW-4b
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:24:07 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 3CF051A20B2;
 Mon, 15 Jul 2019 16:23:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw870-lin.domain.local (rtrkw870-lin.domain.local
 [10.10.13.132])
 by mail.rt-rk.com (Postfix) with ESMTPSA id F17F21A2098;
 Mon, 15 Jul 2019 16:23:01 +0200 (CEST)
From: Stefan Brankovic <stefan.brankovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 16:22:49 +0200
Message-Id: <1563200574-11098-4-git-send-email-stefan.brankovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563200574-11098-1-git-send-email-stefan.brankovic@rt-rk.com>
References: <1563200574-11098-1-git-send-email-stefan.brankovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v5 3/8] target/ppc: Optimize emulation of vpkpx
 instruction
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
Cc: stefan.brankovic@rt-rk.com, richard.henderson@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimize altivec instruction vpkpx (Vector Pack Pixel).
Rearranges 8 pixels coded in 6-5-5 pattern (4 from each source register)
into contigous array of bits in the destination register.

In each iteration of outer loop, the instruction is to be done with
the 6-5-5 pack for 2 pixels of each doubleword element of each
source register. The first thing to be done in outer loop is
choosing which doubleword element of which register is to be used
in current iteration and it is to be placed in avr variable. The
next step is to perform 6-5-5 pack of pixels on avr variable in inner
for loop(2 iterations, 1 for each pixel) and save result in tmp variable.
In the end of outer for loop, the result is merged in variable called
result and saved in appropriate doubleword element of vD if the whole
doubleword is finished(every second iteration). The outer loop has 4
iterations.

Signed-off-by: Stefan Brankovic <stefan.brankovic@rt-rk.com>
---
 target/ppc/helper.h                 |  1 -
 target/ppc/int_helper.c             | 21 --------
 target/ppc/translate/vmx-impl.inc.c | 99 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 98 insertions(+), 23 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 33dad6a..7a3d68d 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -254,7 +254,6 @@ DEF_HELPER_4(vpkudus, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkuhum, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkuwum, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkudum, void, env, avr, avr, avr)
-DEF_HELPER_3(vpkpx, void, avr, avr, avr)
 DEF_HELPER_5(vmhaddshs, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmhraddshs, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsumuhm, void, env, avr, avr, avr, avr)
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index a23853e..f397380 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1536,27 +1536,6 @@ void helper_vpmsumd(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 #else
 #define PKBIG 0
 #endif
-void helper_vpkpx(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-{
-    int i, j;
-    ppc_avr_t result;
-#if defined(HOST_WORDS_BIGENDIAN)
-    const ppc_avr_t *x[2] = { a, b };
-#else
-    const ppc_avr_t *x[2] = { b, a };
-#endif
-
-    VECTOR_FOR_INORDER_I(i, u64) {
-        VECTOR_FOR_INORDER_I(j, u32) {
-            uint32_t e = x[i]->u32[j];
-
-            result.u16[4 * i + j] = (((e >> 9) & 0xfc00) |
-                                     ((e >> 6) & 0x3e0) |
-                                     ((e >> 3) & 0x1f));
-        }
-    }
-    *r = result;
-}
 
 #define VPK(suffix, from, to, cvt, dosat)                               \
     void helper_vpk##suffix(CPUPPCState *env, ppc_avr_t *r,             \
diff --git a/target/ppc/translate/vmx-impl.inc.c b/target/ppc/translate/vmx-impl.inc.c
index e06e65a..64e598f 100644
--- a/target/ppc/translate/vmx-impl.inc.c
+++ b/target/ppc/translate/vmx-impl.inc.c
@@ -571,6 +571,103 @@ static void trans_lvsr(DisasContext *ctx)
 }
 
 /*
+ * vpkpx VRT,VRA,VRB - Vector Pack Pixel
+ *
+ * Rearranges 8 pixels coded in 6-5-5 pattern (4 from each source register)
+ * into contigous array of bits in the destination register.
+ */
+static void trans_vpkpx(DisasContext *ctx)
+{
+    int VT = rD(ctx->opcode);
+    int VA = rA(ctx->opcode);
+    int VB = rB(ctx->opcode);
+    TCGv_i64 tmp = tcg_temp_new_i64();
+    TCGv_i64 shifted = tcg_temp_new_i64();
+    TCGv_i64 avr = tcg_temp_new_i64();
+    TCGv_i64 result = tcg_temp_new_i64();
+    TCGv_i64 result1 = tcg_temp_new_i64();
+    TCGv_i64 result2 = tcg_temp_new_i64();
+    int64_t mask1 = 0x1fULL;
+    int64_t mask2 = 0x1fULL << 5;
+    int64_t mask3 = 0x3fULL << 10;
+    int i, j;
+    /*
+     * In each iteration do the 6-5-5 pack for 2 pixels of each doubleword
+     * element of each source register.
+     */
+    for (i = 0; i < 4; i++) {
+        switch (i) {
+        case 0:
+            /*
+             * Get high doubleword of vA to perfrom 6-5-5 pack of pixels
+             * 1 and 2.
+             */
+            get_avr64(avr, VA, true);
+            tcg_gen_movi_i64(result, 0x0ULL);
+            break;
+        case 1:
+            /*
+             * Get low doubleword of vA to perfrom 6-5-5 pack of pixels
+             * 3 and 4.
+             */
+            get_avr64(avr, VA, false);
+            break;
+        case 2:
+            /*
+             * Get high doubleword of vB to perfrom 6-5-5 pack of pixels
+             * 5 and 6.
+             */
+            get_avr64(avr, VB, true);
+            tcg_gen_movi_i64(result, 0x0ULL);
+            break;
+        case 3:
+            /*
+             * Get low doubleword of vB to perfrom 6-5-5 pack of pixels
+             * 7 and 8.
+             */
+            get_avr64(avr, VB, false);
+            break;
+        }
+        /* Perform the packing for 2 pixels(each iteration for 1). */
+        tcg_gen_movi_i64(tmp, 0x0ULL);
+        for (j = 0; j < 2; j++) {
+            tcg_gen_shri_i64(shifted, avr, (j * 16 + 3));
+            tcg_gen_andi_i64(shifted, shifted, mask1 << (j * 16));
+            tcg_gen_or_i64(tmp, tmp, shifted);
+
+            tcg_gen_shri_i64(shifted, avr, (j * 16 + 6));
+            tcg_gen_andi_i64(shifted, shifted, mask2 << (j * 16));
+            tcg_gen_or_i64(tmp, tmp, shifted);
+
+            tcg_gen_shri_i64(shifted, avr, (j * 16 + 9));
+            tcg_gen_andi_i64(shifted, shifted, mask3 << (j * 16));
+            tcg_gen_or_i64(tmp, tmp, shifted);
+        }
+        if ((i == 0) || (i == 2)) {
+            tcg_gen_shli_i64(tmp, tmp, 32);
+        }
+        tcg_gen_or_i64(result, result, tmp);
+        if (i == 1) {
+            /* Place packed pixels 1:4 to high doubleword of vD. */
+            tcg_gen_mov_i64(result1, result);
+        }
+        if (i == 3) {
+            /* Place packed pixels 5:8 to low doubleword of vD. */
+            tcg_gen_mov_i64(result2, result);
+        }
+    }
+    set_avr64(VT, result1, true);
+    set_avr64(VT, result2, false);
+
+    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(shifted);
+    tcg_temp_free_i64(avr);
+    tcg_temp_free_i64(result);
+    tcg_temp_free_i64(result1);
+    tcg_temp_free_i64(result2);
+}
+
+/*
  * vsl VRT,VRA,VRB - Vector Shift Left
  *
  * Shifting left 128 bit value of vA by value specified in bits 125-127 of vB.
@@ -796,7 +893,7 @@ GEN_VXFORM_ENV(vpksdus, 7, 21);
 GEN_VXFORM_ENV(vpkshss, 7, 6);
 GEN_VXFORM_ENV(vpkswss, 7, 7);
 GEN_VXFORM_ENV(vpksdss, 7, 23);
-GEN_VXFORM(vpkpx, 7, 12);
+GEN_VXFORM_TRANS(vpkpx, 7, 12);
 GEN_VXFORM_ENV(vsum4ubs, 4, 24);
 GEN_VXFORM_ENV(vsum4sbs, 4, 28);
 GEN_VXFORM_ENV(vsum4shs, 4, 25);
-- 
2.7.4


