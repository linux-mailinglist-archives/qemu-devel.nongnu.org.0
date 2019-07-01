Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEF737177
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 12:19:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57779 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYpUd-0003lw-Gb
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 06:19:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan.brankovic@rt-rk.com>) id 1hYpRy-0002b4-6v
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 06:16:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan.brankovic@rt-rk.com>) id 1hYpRw-0001zf-Bx
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 06:16:50 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:41538 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefan.brankovic@rt-rk.com>)
	id 1hYpRv-0001ts-W0
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 06:16:48 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 093331A2006;
	Thu,  6 Jun 2019 12:15:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw870-lin.domain.local (rtrkw870-lin.domain.local
	[10.10.13.132])
	by mail.rt-rk.com (Postfix) with ESMTPSA id DA8051A1DE5;
	Thu,  6 Jun 2019 12:15:36 +0200 (CEST)
From: Stefan Brankovic <stefan.brankovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 12:15:29 +0200
Message-Id: <1559816130-17113-8-git-send-email-stefan.brankovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559816130-17113-1-git-send-email-stefan.brankovic@rt-rk.com>
References: <1559816130-17113-1-git-send-email-stefan.brankovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 7/8] target/ppc: Optimize emulation of vclzh
 and vclzb instructions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimize Altivec instruction vclzh (Vector Count Leading Zeros Halfword).
This instruction counts the number of leading zeros of each halfword element
in source register and places result in the appropriate halfword element of
destination register.

In each iteration of outer for loop we perform count operation on one
doubleword elements of source register vB. In first iteration we place
higher doubleword element of vB in variable avr, then we perform count
for every halfword element using tcg_gen_clzi_i64. Since it counts
leading zeros on 64 bit lenght, we have to move ith byte element to
highest 16 bits of tmp, or it with mask(so we get all ones in lowest
48 bits), then perform tcg_gen_clzi_i64 and move it's result in
appropriate halfword element of result. We do this in inner for loop.
After operation is finished we save result in appropriate doubleword
element of destination register vD. We repeat this once again for
lower doubleword element of vB.

Optimize Altivec instruction vclzb (Vector Count Leading Zeros Byte).
This instruction counts the number of leading zeros of each byte element
in source register and places result in the appropriate byte element of
destination register.

In each iteration of outer for loop we perform count operation on one
doubleword elements of source register vB. In first iteration we place
higher doubleword element of vB in variable avr, then we perform count
for every byte element using tcg_gen_clzi_i64. Since it counts leading
zeros on 64 bit lenght, we have to move ith byte element to highest 8
bits of variable  tmp, or it with mask(so we get all ones in lowest 56
bits), then perform tcg_gen_clzi_i64 and move it's result in appropriate
byte element of result. We do this in inner for loop. After operation is
finished we save result in appropriate doubleword element of destination
register vD. We repeat this once again for lower doubleword element of
vB.

Signed-off-by: Stefan Brankovic <stefan.brankovic@rt-rk.com>
---
 target/ppc/translate/vmx-impl.inc.c | 122 +++++++++++++++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate/vmx-impl.inc.c b/target/ppc/translate/vmx-impl.inc.c
index 7689739..8535a31 100644
--- a/target/ppc/translate/vmx-impl.inc.c
+++ b/target/ppc/translate/vmx-impl.inc.c
@@ -878,6 +878,124 @@ static void trans_vgbbd(DisasContext *ctx)
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
+            set_avr64(VT, result, true);
+        } else {
+            /* Place result in low doubleword element of vD. */
+            set_avr64(VT, result, false);
+        }
+    }
+
+    tcg_temp_free_i64(avr);
+    tcg_temp_free_i64(result);
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
+            set_avr64(VT, result, true);
+        } else {
+            /* Place result in low doubleword element of vD. */
+            set_avr64(VT, result, false);
+        }
+    }
+
+    tcg_temp_free_i64(avr);
+    tcg_temp_free_i64(result);
+    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(mask);
+}
+
+/*
  * vclzw VRT,VRB - Vector Count Leading Zeros Word
  *
  * Counting the number of leading zero bits of each word element in source
@@ -1466,8 +1584,8 @@ GEN_VAFORM_PAIRED(vmsumshm, vmsumshs, 20)
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


