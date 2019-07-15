Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBCC690F2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 16:26:13 +0200 (CEST)
Received: from localhost ([::1]:39362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn1vg-00009S-Q7
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 10:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32920)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1hn1ti-0008TK-Qd
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:24:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1hn1tg-0002ZC-Rf
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:24:10 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:36912 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefan.brankovic@rt-rk.com>)
 id 1hn1tg-0002YI-Fc
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:24:08 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 7A1591A2098;
 Mon, 15 Jul 2019 16:23:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw870-lin.domain.local (rtrkw870-lin.domain.local
 [10.10.13.132])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 280EB1A20A8;
 Mon, 15 Jul 2019 16:23:02 +0200 (CEST)
From: Stefan Brankovic <stefan.brankovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 16:22:53 +0200
Message-Id: <1563200574-11098-8-git-send-email-stefan.brankovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563200574-11098-1-git-send-email-stefan.brankovic@rt-rk.com>
References: <1563200574-11098-1-git-send-email-stefan.brankovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v5 7/8] target/ppc: Optimize emulation of vclzh
 and vclzb instructions
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

Optimize Altivec instruction vclzh (Vector Count Leading Zeros Halfword).
This instruction counts the number of leading zeros of each halfword element
in source register and places result in the appropriate halfword element of
destination register.

In each iteration of outer for loop count operation is performed on one
doubleword element of source register vB. In the first iteration, higher
doubleword element of vB is placed in variable avr, and then counting
for every halfword element is performed by  using tcg_gen_clzi_i64.
Since it counts leading zeros on 64 bit lenght, ith byte element has to
be moved to the highest 16 bits of tmp, or-ed with mask(in order to get all
ones in lowest 48 bits), then perform tcg_gen_clzi_i64 and move it's result
in appropriate halfword element of result. This is done in inner for loop.
After the operation is finished, the result is saved in the appropriate
doubleword element of destination register vD. The same sequence of orders
is to be applied again for the  lower doubleword element of vB.

Optimize Altivec instruction vclzb (Vector Count Leading Zeros Byte).
This instruction counts the number of leading zeros of each byte element
in source register and places result in the appropriate byte element of
destination register.

In each iteration of the outer for loop, counting operation is done on one
doubleword element of source register vB. In the first iteration, the
higher doubleword element of vB is placed in variable avr, and then counting
for every byte element is performed using tcg_gen_clzi_i64. Since it counts
leading zeros on 64 bit lenght, ith byte element has to be moved to the highest
8 bits of variable  tmp, or-ed with mask(in order to get all ones in the lowest
56 bits), then perform tcg_gen_clzi_i64 and move it's result in the appropriate
byte element of result. This is done in inner for loop. After the operation is
finished, the result is saved in the  appropriate doubleword element of destination
register vD. The same sequence of orders is to be applied again for the lower
doubleword element of vB.

Signed-off-by: Stefan Brankovic <stefan.brankovic@rt-rk.com>
---
 target/ppc/helper.h                 |   2 -
 target/ppc/int_helper.c             |   9 ---
 target/ppc/translate/vmx-impl.inc.c | 136 +++++++++++++++++++++++++++++++++++-
 3 files changed, 134 insertions(+), 13 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 595241c..17b4b06 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -303,8 +303,6 @@ DEF_HELPER_4(vcfsx, void, env, avr, avr, i32)
 DEF_HELPER_4(vctuxs, void, env, avr, avr, i32)
 DEF_HELPER_4(vctsxs, void, env, avr, avr, i32)
 
-DEF_HELPER_2(vclzb, void, avr, avr)
-DEF_HELPER_2(vclzh, void, avr, avr)
 DEF_HELPER_2(vctzb, void, avr, avr)
 DEF_HELPER_2(vctzh, void, avr, avr)
 DEF_HELPER_2(vctzw, void, avr, avr)
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 82cb12e..264b5e7 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1800,15 +1800,6 @@ VUPK(lsw, s64, s32, UPKLO)
         }                                                               \
     }
 
-#define clzb(v) ((v) ? clz32((uint32_t)(v) << 24) : 8)
-#define clzh(v) ((v) ? clz32((uint32_t)(v) << 16) : 16)
-
-VGENERIC_DO(clzb, u8)
-VGENERIC_DO(clzh, u16)
-
-#undef clzb
-#undef clzh
-
 #define ctzb(v) ((v) ? ctz32(v) : 8)
 #define ctzh(v) ((v) ? ctz32(v) : 16)
 #define ctzw(v) ctz32((v))
diff --git a/target/ppc/translate/vmx-impl.inc.c b/target/ppc/translate/vmx-impl.inc.c
index 456666a..e8a0fb6 100644
--- a/target/ppc/translate/vmx-impl.inc.c
+++ b/target/ppc/translate/vmx-impl.inc.c
@@ -840,6 +840,138 @@ static void trans_vgbbd(DisasContext *ctx)
 }
 
 /*
+ * vclzb VRT,VRB - Vector Count Leading Zeros Byte
+ *
+ * Counting the number of leading zero bits of each byte element in source
+ * register and placing result in appropriate byte element of destination
+ * register.
+ */
+static void trans_vclzb(DisasContext *ctx)
+{
+    int VT = rD(ctx->opcode);
+    int VB = rB(ctx->opcode);
+    TCGv_i64 avr = tcg_temp_new_i64();
+    TCGv_i64 result = tcg_temp_new_i64();
+    TCGv_i64 result1 = tcg_temp_new_i64();
+    TCGv_i64 result2 = tcg_temp_new_i64();
+    TCGv_i64 tmp = tcg_temp_new_i64();
+    TCGv_i64 mask = tcg_const_i64(0xffffffffffffffULL);
+    int i, j;
+
+    for (i = 0; i < 2; i++) {
+        if (i == 0) {
+            /* Get high doubleword of vB in avr. */
+            get_avr64(avr, VB, true);
+        } else {
+            /* Get low doubleword of vB in avr. */
+            get_avr64(avr, VB, false);
+        }
+        /*
+         * Perform count for every byte element using tcg_gen_clzi_i64.
+         * Since it counts leading zeros on 64 bit lenght, we have to move
+         * ith byte element to highest 8 bits of tmp, or it with mask(so we get
+         * all ones in lowest 56 bits), then perform tcg_gen_clzi_i64 and move
+         * it's result in appropriate byte element of result.
+         */
+        tcg_gen_shli_i64(tmp, avr, 56);
+        tcg_gen_or_i64(tmp, tmp, mask);
+        tcg_gen_clzi_i64(result, tmp, 64);
+        for (j = 1; j < 7; j++) {
+            tcg_gen_shli_i64(tmp, avr, (7 - j) * 8);
+            tcg_gen_or_i64(tmp, tmp, mask);
+            tcg_gen_clzi_i64(tmp, tmp, 64);
+            tcg_gen_deposit_i64(result, result, tmp, j * 8, 8);
+        }
+        tcg_gen_or_i64(tmp, avr, mask);
+        tcg_gen_clzi_i64(tmp, tmp, 64);
+        tcg_gen_deposit_i64(result, result, tmp, 56, 8);
+        if (i == 0) {
+            /* Place result in high doubleword element of vD. */
+            tcg_gen_mov_i64(result1, result);
+        } else {
+            /* Place result in low doubleword element of vD. */
+            tcg_gen_mov_i64(result2, result);
+        }
+    }
+
+    set_avr64(VT, result1, true);
+    set_avr64(VT, result2, false);
+
+    tcg_temp_free_i64(avr);
+    tcg_temp_free_i64(result);
+    tcg_temp_free_i64(result1);
+    tcg_temp_free_i64(result2);
+    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(mask);
+}
+
+/*
+ * vclzh VRT,VRB - Vector Count Leading Zeros Halfword
+ *
+ * Counting the number of leading zero bits of each halfword element in source
+ * register and placing result in appropriate halfword element of destination
+ * register.
+ */
+static void trans_vclzh(DisasContext *ctx)
+{
+    int VT = rD(ctx->opcode);
+    int VB = rB(ctx->opcode);
+    TCGv_i64 avr = tcg_temp_new_i64();
+    TCGv_i64 result = tcg_temp_new_i64();
+    TCGv_i64 result1 = tcg_temp_new_i64();
+    TCGv_i64 result2 = tcg_temp_new_i64();
+    TCGv_i64 tmp = tcg_temp_new_i64();
+    TCGv_i64 mask = tcg_const_i64(0xffffffffffffULL);
+    int i, j;
+
+    for (i = 0; i < 2; i++) {
+        if (i == 0) {
+            /* Get high doubleword element of vB in avr. */
+            get_avr64(avr, VB, true);
+        } else {
+            /* Get low doubleword element of vB in avr. */
+            get_avr64(avr, VB, false);
+        }
+        /*
+         * Perform count for every halfword element using tcg_gen_clzi_i64.
+         * Since it counts leading zeros on 64 bit lenght, we have to move
+         * ith byte element to highest 16 bits of tmp, or it with mask(so we get
+         * all ones in lowest 48 bits), then perform tcg_gen_clzi_i64 and move
+         * it's result in appropriate halfword element of result.
+         */
+        tcg_gen_shli_i64(tmp, avr, 48);
+        tcg_gen_or_i64(tmp, tmp, mask);
+        tcg_gen_clzi_i64(result, tmp, 64);
+        for (j = 1; j < 3; j++) {
+            tcg_gen_shli_i64(tmp, avr, (3 - j) * 16);
+            tcg_gen_or_i64(tmp, tmp, mask);
+            tcg_gen_clzi_i64(tmp, tmp, 64);
+            tcg_gen_deposit_i64(result, result, tmp, j * 16, 16);
+        }
+        tcg_gen_or_i64(tmp, avr, mask);
+        tcg_gen_clzi_i64(tmp, tmp, 64);
+        tcg_gen_deposit_i64(result, result, tmp, 48, 16);
+        if (i == 0) {
+            /* Place result in high doubleword element of vD. */
+            tcg_gen_mov_i64(result1, result);
+        } else {
+            /* Place result in low doubleword element of vD. */
+            tcg_gen_mov_i64(result2, result);
+        }
+    }
+
+    set_avr64(VT, result1, true);
+    set_avr64(VT, result2, false);
+
+    tcg_temp_free_i64(avr);
+    tcg_temp_free_i64(result);
+    tcg_temp_free_i64(result1);
+    tcg_temp_free_i64(result2);
+    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(mask);
+}
+
+/*
  * vclzw VRT,VRB - Vector Count Leading Zeros Word
  *
  * Counting the number of leading zero bits of each word element in source
@@ -1404,8 +1536,8 @@ GEN_VAFORM_PAIRED(vmsumshm, vmsumshs, 20)
 GEN_VAFORM_PAIRED(vsel, vperm, 21)
 GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23)
 
-GEN_VXFORM_NOA(vclzb, 1, 28)
-GEN_VXFORM_NOA(vclzh, 1, 29)
+GEN_VXFORM_TRANS(vclzb, 1, 28)
+GEN_VXFORM_TRANS(vclzh, 1, 29)
 GEN_VXFORM_TRANS(vclzw, 1, 30)
 GEN_VXFORM_TRANS(vclzd, 1, 31)
 GEN_VXFORM_NOA_2(vnegw, 1, 24, 6)
-- 
2.7.4


