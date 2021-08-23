Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD3A3F4D68
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 17:24:01 +0200 (CEST)
Received: from localhost ([::1]:53620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIBns-0006ZP-3X
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 11:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mIBkp-0003k6-ME; Mon, 23 Aug 2021 11:20:52 -0400
Received: from [201.28.113.2] (port=61880 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mIBkn-0002Ht-LY; Mon, 23 Aug 2021 11:20:51 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 23 Aug 2021 12:03:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id CD6CD8012E4;
 Mon, 23 Aug 2021 12:03:36 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH] target/ppc: fix setting of CR flags in bcdcfsq
Date: Mon, 23 Aug 2021 12:02:35 -0300
Message-Id: <20210823150235.35759-1-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 23 Aug 2021 15:03:37.0051 (UTC)
 FILETIME=[0CC072B0:01D79830]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Luis Pires <luis.pires@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the ISA, CR should be set based on the source value, and
not on the packed decimal result.
The way this was implemented would cause GT, LT and EQ to be set
incorrectly when the source value was too large and the 31 least
significant digits of the packed decimal result ended up being all zero.
This would happen for source values of +/-10^31, +/-10^32, etc.

The new implementation fixes this and also skips the result calculation
altogether in case of src overflow.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 target/ppc/int_helper.c | 61 ++++++++++++++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 13 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index efa833ef64..de56056429 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2498,10 +2498,26 @@ uint32_t helper_bcdctz(ppc_avr_t *r, ppc_avr_t *b, uint32_t ps)
     return cr;
 }
 
+/**
+ * Compare 2 128-bit unsigned integers, passed in as unsigned 64-bit pairs
+ *
+ * Returns:
+ * > 0 if ahi|alo > bhi|blo,
+ * 0 if ahi|alo == bhi|blo,
+ * < 0 if ahi|alo < bhi|blo
+ */
+static inline int ucmp128(uint64_t alo, uint64_t ahi,
+                          uint64_t blo, uint64_t bhi)
+{
+    return (ahi == bhi) ?
+        (alo > blo ? 1 : (alo == blo ? 0 : -1)) :
+        (ahi > bhi ? 1 : -1);
+}
+
 uint32_t helper_bcdcfsq(ppc_avr_t *r, ppc_avr_t *b, uint32_t ps)
 {
     int i;
-    int cr = 0;
+    int cr;
     uint64_t lo_value;
     uint64_t hi_value;
     ppc_avr_t ret = { .u64 = { 0, 0 } };
@@ -2510,28 +2526,47 @@ uint32_t helper_bcdcfsq(ppc_avr_t *r, ppc_avr_t *b, uint32_t ps)
         lo_value = -b->VsrSD(1);
         hi_value = ~b->VsrD(0) + !lo_value;
         bcd_put_digit(&ret, 0xD, 0);
+
+        cr = CRF_LT;
     } else {
         lo_value = b->VsrD(1);
         hi_value = b->VsrD(0);
         bcd_put_digit(&ret, bcd_preferred_sgn(0, ps), 0);
-    }
 
-    if (divu128(&lo_value, &hi_value, 1000000000000000ULL) ||
-            lo_value > 9999999999999999ULL) {
-        cr = CRF_SO;
+        if (hi_value == 0 && lo_value == 0) {
+            cr = CRF_EQ;
+        } else {
+            cr = CRF_GT;
+        }
     }
 
-    for (i = 1; i < 16; hi_value /= 10, i++) {
-        bcd_put_digit(&ret, hi_value % 10, i);
-    }
+    /*
+     * Check src limits: abs(src) <= 10^31 - 1
+     *
+     * 10^31 - 1 = 0x0000007e37be2022 c0914b267fffffff
+     */
+    if (ucmp128(lo_value, hi_value,
+                0xc0914b267fffffffULL, 0x7e37be2022ULL) > 0) {
+        cr |= CRF_SO;
 
-    for (; i < 32; lo_value /= 10, i++) {
-        bcd_put_digit(&ret, lo_value % 10, i);
-    }
+        /*
+         * According to the ISA, if src wouldn't fit in the destination
+         * register, the result is undefined.
+         * In that case, we leave r unchanged.
+         */
+    } else {
+        divu128(&lo_value, &hi_value, 1000000000000000ULL);
 
-    cr |= bcd_cmp_zero(&ret);
+        for (i = 1; i < 16; hi_value /= 10, i++) {
+            bcd_put_digit(&ret, hi_value % 10, i);
+        }
 
-    *r = ret;
+        for (; i < 32; lo_value /= 10, i++) {
+            bcd_put_digit(&ret, lo_value % 10, i);
+        }
+
+        *r = ret;
+    }
 
     return cr;
 }
-- 
2.25.1


