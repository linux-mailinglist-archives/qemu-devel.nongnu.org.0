Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E007E1DB4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 16:08:37 +0200 (CEST)
Received: from localhost ([::1]:37002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNHJU-00074d-Gn
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 10:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51799)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1iNHBK-0002ZM-5r
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:00:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1iNHBH-0004pX-Nl
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:00:09 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:46696 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefan.brankovic@rt-rk.com>)
 id 1iNHBH-0004nG-22
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:00:07 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id D378A1A2261;
 Wed, 23 Oct 2019 16:00:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw870-lin.domain.local (rtrkw870-lin.domain.local
 [10.10.14.77])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 78BD11A224B;
 Wed, 23 Oct 2019 16:00:02 +0200 (CEST)
From: Stefan Brankovic <stefan.brankovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 2/3] target/ppc: Optimize emulation of vpkpx instruction
Date: Wed, 23 Oct 2019 15:59:55 +0200
Message-Id: <1571839196-1739-3-git-send-email-stefan.brankovic@rt-rk.com>
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

Optimize altivec instruction vpkpx (Vector Pack Pixel).
Rearranges 8 pixels coded in 6-5-5 pattern (4 from each source register)
into a contigous array of bits in the destination register.

In each iteration of outer loop, the instruction is to be done with
the 6-5-5 pack for 2 pixels of each doubleword element of each
source register. The first thing to be done in outer loop is
choosing which doubleword element of which register is to be used
in the current iteration and it is to be placed in 'avr' variable. The
next step is to perform 6-5-5 pack of pixels on 'avr' variable in inner
'for' loop(2 iterations, 1 for each pixel) and save result in 'tmp'
variable. At the end of the outer 'for' loop, the result is merged in the
variable called 'result' and saved in the appropriate doubleword element
of vD if the whole doubleword is finished(every second iteration). The
outer loop has 4 iterations.

Signed-off-by: Stefan Brankovic <stefan.brankovic@rt-rk.com>
---
 target/ppc/helper.h                 |  1 -
 target/ppc/int_helper.c             | 21 ---------
 target/ppc/translate/vmx-impl.inc.c | 93 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 92 insertions(+), 23 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 281e54f..b489b38 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -258,7 +258,6 @@ DEF_HELPER_4(vpkudus, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkuhum, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkuwum, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkudum, void, env, avr, avr, avr)
-DEF_HELPER_3(vpkpx, void, avr, avr, avr)
 DEF_HELPER_5(vmhaddshs, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmhraddshs, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsumuhm, void, env, avr, avr, avr, avr)
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index cd00f5e..f910c11 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1262,27 +1262,6 @@ void helper_vpmsumd(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
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
index 8f68e41..787008d 100644
--- a/target/ppc/translate/vmx-impl.inc.c
+++ b/target/ppc/translate/vmx-impl.inc.c
@@ -579,6 +579,97 @@ static void trans_lvsr(DisasContext *ctx)
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
+             * Get high doubleword of vA to perform 6-5-5 pack of pixels
+             * 1 and 2.
+             */
+            get_avr64(avr, VA, true);
+            tcg_gen_movi_i64(result, 0x0ULL);
+            break;
+        case 1:
+            /*
+             * Get low doubleword of vA to perform 6-5-5 pack of pixels
+             * 3 and 4.
+             */
+            get_avr64(avr, VA, false);
+            break;
+        case 2:
+            /*
+             * Get high doubleword of vB to perform 6-5-5 pack of pixels
+             * 5 and 6.
+             */
+            get_avr64(avr, VB, true);
+            tcg_gen_movi_i64(result, 0x0ULL);
+            break;
+        case 3:
+            /*
+             * Get low doubleword of vB to perform 6-5-5 pack of pixels
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
+    }
+    set_avr64(VT, result1, true);
+    set_avr64(VT, result, false);
+
+    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(shifted);
+    tcg_temp_free_i64(avr);
+    tcg_temp_free_i64(result);
+    tcg_temp_free_i64(result1);
+}
+
+/*
  * vsl VRT,VRA,VRB - Vector Shift Left
  *
  * Shifting left 128 bit value of vA by value specified in bits 125-127 of vB.
@@ -1059,7 +1150,7 @@ GEN_VXFORM_ENV(vpksdus, 7, 21);
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


