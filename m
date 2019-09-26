Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8867ABF9EA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 21:16:16 +0200 (CEST)
Received: from localhost ([::1]:43276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDZFO-00014C-Jd
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 15:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1iDYyz-0000gp-5R
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:59:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1iDYyx-0007x9-Jr
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:59:17 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:40360
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1iDYyx-0007AS-DQ; Thu, 26 Sep 2019 14:59:15 -0400
Received: from host86-138-245-63.range86-138.btcentralplus.com
 ([86.138.245.63] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1iDYyD-0001em-Us; Thu, 26 Sep 2019 19:58:30 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, pc@us.ibm.com,
 david@gibson.dropbear.id.au
Date: Thu, 26 Sep 2019 19:57:55 +0100
Message-Id: <20190926185801.11176-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926185801.11176-1-mark.cave-ayland@ilande.co.uk>
References: <20190926185801.11176-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.138.245.63
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 1/7] target/ppc: introduce get_dfp{64,
 128}() helper functions
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The existing functions (now incorrectly) assume that the MSB and LSB of DFP
numbers are stored as consecutive 64-bit words in memory. Instead of accessing
the DFP numbers directly, introduce get_dfp{64,128}() helper functions to ease
the switch to the correct representation.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/dfp_helper.c | 52 ++++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index f102177572..354a4aa877 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -36,6 +36,17 @@
 #define LO_IDX 0
 #endif
 
+static void get_dfp64(uint64_t *dst, uint64_t *dfp)
+{
+    dst[0] = dfp[0];
+}
+
+static void get_dfp128(uint64_t *dst, uint64_t *dfp)
+{
+    dst[0] = dfp[HI_IDX];
+    dst[1] = dfp[LO_IDX];
+}
+
 struct PPC_DFP {
     CPUPPCState *env;
     uint64_t t64[2], a64[2], b64[2];
@@ -129,7 +140,7 @@ static void dfp_prepare_decimal64(struct PPC_DFP *dfp, uint64_t *a,
     dfp->env = env;
 
     if (a) {
-        dfp->a64[0] = *a;
+        get_dfp64(dfp->a64, a);
         decimal64ToNumber((decimal64 *)dfp->a64, &dfp->a);
     } else {
         dfp->a64[0] = 0;
@@ -137,7 +148,7 @@ static void dfp_prepare_decimal64(struct PPC_DFP *dfp, uint64_t *a,
     }
 
     if (b) {
-        dfp->b64[0] = *b;
+        get_dfp64(dfp->b64, b);
         decimal64ToNumber((decimal64 *)dfp->b64, &dfp->b);
     } else {
         dfp->b64[0] = 0;
@@ -153,8 +164,7 @@ static void dfp_prepare_decimal128(struct PPC_DFP *dfp, uint64_t *a,
     dfp->env = env;
 
     if (a) {
-        dfp->a64[0] = a[HI_IDX];
-        dfp->a64[1] = a[LO_IDX];
+        get_dfp128(dfp->a64, a);
         decimal128ToNumber((decimal128 *)dfp->a64, &dfp->a);
     } else {
         dfp->a64[0] = dfp->a64[1] = 0;
@@ -162,8 +172,7 @@ static void dfp_prepare_decimal128(struct PPC_DFP *dfp, uint64_t *a,
     }
 
     if (b) {
-        dfp->b64[0] = b[HI_IDX];
-        dfp->b64[1] = b[LO_IDX];
+        get_dfp128(dfp->b64, b);
         decimal128ToNumber((decimal128 *)dfp->b64, &dfp->b);
     } else {
         dfp->b64[0] = dfp->b64[1] = 0;
@@ -617,10 +626,12 @@ uint32_t helper_##op(CPUPPCState *env, uint64_t *a, uint64_t *b)         \
 {                                                                        \
     struct PPC_DFP dfp;                                                  \
     unsigned k;                                                          \
+    uint64_t a64;                                                        \
                                                                          \
     dfp_prepare_decimal##size(&dfp, 0, b, env);                          \
                                                                          \
-    k = *a & 0x3F;                                                       \
+    get_dfp64(&a64, a);                                                  \
+    k = a64 & 0x3F;                                                      \
                                                                          \
     if (unlikely(decNumberIsSpecial(&dfp.b))) {                          \
         dfp.crbf = 1;                                                    \
@@ -817,11 +828,15 @@ void helper_##op(CPUPPCState *env, uint64_t *t, uint64_t *a,            \
                  uint64_t *b, uint32_t rmc)                             \
 {                                                                       \
     struct PPC_DFP dfp;                                                 \
-    int32_t ref_sig = *a & 0x3F;                                        \
+    uint64_t a64;                                                       \
+    int32_t ref_sig;                                                    \
     int32_t xmax = ((size) == 64) ? 369 : 6111;                         \
                                                                         \
     dfp_prepare_decimal##size(&dfp, 0, b, env);                         \
                                                                         \
+    get_dfp64(&a64, a);                                                 \
+    ref_sig = a64 & 0x3f;                                               \
+                                                                        \
     _dfp_reround(rmc, ref_sig, xmax, &dfp);                             \
     decimal##size##FromNumber((decimal##size *)dfp.t64, &dfp.t,         \
                               &dfp.context);                            \
@@ -881,7 +896,12 @@ DFP_HELPER_RINT(drintnq, RINTN_PPs, 128)
 void helper_dctdp(CPUPPCState *env, uint64_t *t, uint64_t *b)
 {
     struct PPC_DFP dfp;
-    uint32_t b_short = *b;
+    uint64_t b64;
+    uint32_t b_short;
+
+    get_dfp64(&b64, b);
+    b_short = (uint32_t)b64;
+
     dfp_prepare_decimal64(&dfp, 0, 0, env);
     decimal32ToNumber((decimal32 *)&b_short, &dfp.t);
     decimal64FromNumber((decimal64 *)t, &dfp.t, &dfp.context);
@@ -891,8 +911,10 @@ void helper_dctdp(CPUPPCState *env, uint64_t *t, uint64_t *b)
 void helper_dctqpq(CPUPPCState *env, uint64_t *t, uint64_t *b)
 {
     struct PPC_DFP dfp;
+    uint64_t b64;
     dfp_prepare_decimal128(&dfp, 0, 0, env);
-    decimal64ToNumber((decimal64 *)b, &dfp.t);
+    get_dfp64(&b64, b);
+    decimal64ToNumber((decimal64 *)&b64, &dfp.t);
 
     dfp_check_for_VXSNAN_and_convert_to_QNaN(&dfp);
     dfp_set_FPRF_from_FRT(&dfp);
@@ -940,8 +962,10 @@ void helper_drdpq(CPUPPCState *env, uint64_t *t, uint64_t *b)
 void helper_##op(CPUPPCState *env, uint64_t *t, uint64_t *b)                   \
 {                                                                              \
     struct PPC_DFP dfp;                                                        \
+    uint64_t b64;                                                              \
     dfp_prepare_decimal##size(&dfp, 0, b, env);                                \
-    decNumberFromInt64(&dfp.t, (int64_t)(*b));                                 \
+    get_dfp64(&b64, b);                                                        \
+    decNumberFromInt64(&dfp.t, (int64_t)b64);                                  \
     decimal##size##FromNumber((decimal##size *)dfp.t64, &dfp.t, &dfp.context); \
     CFFIX_PPs(&dfp);                                                           \
                                                                                \
@@ -1183,10 +1207,12 @@ static void dfp_set_raw_exp_128(uint64_t *t, uint64_t raw)
 void helper_##op(CPUPPCState *env, uint64_t *t, uint64_t *a, uint64_t *b) \
 {                                                                         \
     struct PPC_DFP dfp;                                                   \
-    uint64_t raw_qnan, raw_snan, raw_inf, max_exp;                        \
+    uint64_t raw_qnan, raw_snan, raw_inf, max_exp, a64;                   \
     int bias;                                                             \
-    int64_t exp = *((int64_t *)a);                                        \
+    int64_t exp;                                                          \
                                                                           \
+    get_dfp64(&a64, a);                                                   \
+    exp = (int64_t)a64;                                                   \
     dfp_prepare_decimal##size(&dfp, 0, b, env);                           \
                                                                           \
     if ((size) == 64) {                                                   \
-- 
2.20.1


