Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672C1472C3B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 13:24:31 +0100 (CET)
Received: from localhost ([::1]:60618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwkNa-00010E-BI
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 07:24:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mwkD7-0001M3-5P; Mon, 13 Dec 2021 07:13:41 -0500
Received: from [201.28.113.2] (port=6696 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mwkD5-0000Q3-2v; Mon, 13 Dec 2021 07:13:40 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 13 Dec 2021 09:13:36 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 5F718800A5A;
 Mon, 13 Dec 2021 09:13:36 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH] target/ppc: do not silence snan in xscvspdpn
Date: Mon, 13 Dec 2021 09:13:20 -0300
Message-Id: <20211213121320.947362-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Dec 2021 12:13:36.0693 (UTC)
 FILETIME=[DB215650:01D7F01A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: peter.maydell@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 danielhb413@gmail.com, groug@kaod.org, clg@kaod.org, alex.bennee@linaro.org,
 aurelien@aurel32.net, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

The non-signalling versions of VSX scalar convert to shorter/longer
precision insns doesn't silence SNaNs in the hardware. We are currently
honoring this behavior in xscvdpspn, since helper_xscvdpspn handles the
conversion with extracts/deposits/etc. OTOH, xscvspdpn uses
float32_to_float64 that calls parts_float_to_float, which uses
parts_return_nan that finally calls parts_silence_nan if the input is an
SNaN.

To address this problem, this patch adds a new float_status flag
(return_snan) to avoid the call to parts_silence_nan in the
float_class_snan case of parts_return_nan.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
This behavior was observed in a Power9 and can be reproduced with the
following code:

int main(void)
{
    __uint128_t t, b = 0x7f80000200000000;

    asm("xscvspdpn %x0, %x1\n\t"
        : "=wa" (t)
        : "wa" (b << 64));
    printf("0x%016" PRIx64 "%016" PRIx64 "\n",
           (uint64_t)(t >> 64), (uint64_t)t);

    b = 0x7ff0000000000002;
    asm("xscvdpspn %x0, %x1\n\t"
        : "=wa" (t)
        : "wa" (b << 64));
    printf("0x%016" PRIx64 "%016" PRIx64 "\n",
           (uint64_t)(t >> 64), (uint64_t)t);

    return 0;
}

That results in:
$ ./xscv_non_signaling
xscvspdpn: 0x7ff00000400000000000000000000000
xscvdpspn: 0x7f8000007f8000000000000000000000
$ qemu-ppc64le ./xscv_non_signaling
xscvspdpn: 0x7ff80000400000000000000000000000
xscvdpspn: 0x7f8000007f8000000000000000000000

PowerISA is more descriptive of xscvdpspn wrt SNaN but doesn't say
anything about NaNs in xscvspdpn description. Should we match the
hardware behavior? If so, does it worth adding a new flag in
float_status for a single instruction? We could also handle that in
helper_xscvdpspn, e.g.:

float32 sp = xb >> 32;
float64 dp;

dp = float32_to_float64(xb >> 32, &tstat);
if (float32_classify(sp) == is_snan) {
    dp &= ~(1ULL << 51);
    dp |= (dp & 0x7ffffffffffffULL) == 0;
}

return dp;

but it feels kind hacky.
---
 fpu/softfloat-parts.c.inc      | 10 ++++++----
 fpu/softfloat-specialize.c.inc |  9 +++++++++
 include/fpu/softfloat-types.h  |  1 +
 target/ppc/fpu_helper.c        |  2 ++
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 41d4b17e41..ccc24f9153 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -20,10 +20,12 @@ static void partsN(return_nan)(FloatPartsN *a, float_status *s)
     switch (a->cls) {
     case float_class_snan:
         float_raise(float_flag_invalid, s);
-        if (s->default_nan_mode) {
-            parts_default_nan(a, s);
-        } else {
-            parts_silence_nan(a, s);
+        if (!return_snan(s)) {
+            if (s->default_nan_mode) {
+                parts_default_nan(a, s);
+            } else {
+                parts_silence_nan(a, s);
+            }
         }
         break;
     case float_class_qnan:
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index f2ad0f335e..70f686e0a3 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -92,6 +92,15 @@ static inline bool no_signaling_nans(float_status *status)
 #endif
 }
 
+static inline bool return_snan(float_status *status)
+{
+#if defined(TARGET_PPC)
+    return status->return_snan;
+#else
+    return false;
+#endif
+}
+
 /* Define how the architecture discriminates signaling NaNs.
  * This done with the most significant bit of the fraction.
  * In IEEE 754-1985 this was implementation defined, but in IEEE 754-2008
diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 5bcbd041f7..eb55298348 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -188,6 +188,7 @@ typedef struct float_status {
     bool snan_bit_is_one;
     bool use_first_nan;
     bool no_signaling_nans;
+    bool return_snan;
 } float_status;
 
 #endif /* SOFTFLOAT_TYPES_H */
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index c4896cecc8..9fc774fdb0 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2746,6 +2746,8 @@ uint64_t helper_xscvdpspn(CPUPPCState *env, uint64_t xb)
 uint64_t helper_xscvspdpn(CPUPPCState *env, uint64_t xb)
 {
     float_status tstat = env->fp_status;
+
+    tstat.return_snan = true;
     set_float_exception_flags(0, &tstat);
 
     return float32_to_float64(xb >> 32, &tstat);
-- 
2.25.1


