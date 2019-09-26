Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64872BF9FD
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 21:22:43 +0200 (CEST)
Received: from localhost ([::1]:43366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDZLe-0000zQ-09
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 15:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47703)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1iDYz0-0000ir-GN
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:59:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1iDYyz-0007xy-0U
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:59:18 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:40380
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1iDYyy-0007IJ-R2; Thu, 26 Sep 2019 14:59:16 -0400
Received: from host86-138-245-63.range86-138.btcentralplus.com
 ([86.138.245.63] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1iDYyH-0001em-Cy; Thu, 26 Sep 2019 19:58:33 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, pc@us.ibm.com,
 david@gibson.dropbear.id.au
Date: Thu, 26 Sep 2019 19:57:58 +0100
Message-Id: <20190926185801.11176-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926185801.11176-1-mark.cave-ayland@ilande.co.uk>
References: <20190926185801.11176-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.138.245.63
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 4/7] target/ppc: introduce dfp_finalize_decimal{64,
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

Most of the DFP helper functions call decimal{64,128}FromNumber() just before
returning in order to convert the decNumber stored in dfp.t64 back to a
Decimal{64,128} to write back to the FP registers.

Introduce new dfp_finalize_decimal{64,128}() helper functions which both enable
the parameter list to be reduced considerably, and also help minimise the
changes required in the next patch.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/dfp_helper.c | 42 ++++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index df9026ea5e..52b123b16a 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -191,6 +191,16 @@ static void dfp_prepare_decimal128(struct PPC_DFP *dfp, ppc_fprp_t *a,
     }
 }
 
+static void dfp_finalize_decimal64(struct PPC_DFP *dfp)
+{
+    decimal64FromNumber((decimal64 *)&dfp->t64, &dfp->t, &dfp->context);
+}
+
+static void dfp_finalize_decimal128(struct PPC_DFP *dfp)
+{
+    decimal128FromNumber((decimal128 *)&dfp->t64, &dfp->t, &dfp->context);
+}
+
 static void dfp_set_FPSCR_flag(struct PPC_DFP *dfp, uint64_t flag,
                 uint64_t enabled)
 {
@@ -422,7 +432,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,               \
     struct PPC_DFP dfp;                                                        \
     dfp_prepare_decimal##size(&dfp, a, b, env);                                \
     dnop(&dfp.t, &dfp.a, &dfp.b, &dfp.context);                                \
-    decimal##size##FromNumber((decimal##size *)dfp.t64, &dfp.t, &dfp.context); \
+    dfp_finalize_decimal##size(&dfp);                                          \
     postprocs(&dfp);                                                           \
     if (size == 64) {                                                          \
         set_dfp64(t, dfp.t64);                                                 \
@@ -491,7 +501,7 @@ uint32_t helper_##op(CPUPPCState *env, ppc_fprp_t *a, ppc_fprp_t *b)           \
     struct PPC_DFP dfp;                                                        \
     dfp_prepare_decimal##size(&dfp, a, b, env);                                \
     dnop(&dfp.t, &dfp.a, &dfp.b, &dfp.context);                                \
-    decimal##size##FromNumber((decimal##size *)dfp.t64, &dfp.t, &dfp.context); \
+    dfp_finalize_decimal##size(&dfp);                                          \
     postprocs(&dfp);                                                           \
     return dfp.crbf;                                                           \
 }
@@ -741,8 +751,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,        \
     dfp.a.exponent = (int32_t)((int8_t)(te << 3) >> 3);                 \
                                                                         \
     dfp_quantize(rmc, &dfp);                                            \
-    decimal##size##FromNumber((decimal##size *)dfp.t64, &dfp.t,         \
-                              &dfp.context);                            \
+    dfp_finalize_decimal##size(&dfp);                                   \
     QUA_PPs(&dfp);                                                      \
                                                                         \
     if (size == 64) {                                                   \
@@ -764,8 +773,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,        \
     dfp_prepare_decimal##size(&dfp, a, b, env);                         \
                                                                         \
     dfp_quantize(rmc, &dfp);                                            \
-    decimal##size##FromNumber((decimal##size *)dfp.t64, &dfp.t,         \
-                              &dfp.context);                            \
+    dfp_finalize_decimal##size(&dfp);                                   \
     QUA_PPs(&dfp);                                                      \
                                                                         \
     if (size == 64) {                                                   \
@@ -847,8 +855,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,        \
     ref_sig = a64 & 0x3f;                                               \
                                                                         \
     _dfp_reround(rmc, ref_sig, xmax, &dfp);                             \
-    decimal##size##FromNumber((decimal##size *)dfp.t64, &dfp.t,         \
-                              &dfp.context);                            \
+    dfp_finalize_decimal##size(&dfp);                                   \
     QUA_PPs(&dfp);                                                      \
                                                                         \
     if (size == 64) {                                                   \
@@ -871,7 +878,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,               \
                                                                                \
     dfp_set_round_mode_from_immediate(r, rmc, &dfp);                           \
     decNumberToIntegralExact(&dfp.t, &dfp.b, &dfp.context);                    \
-    decimal##size##FromNumber((decimal##size *)dfp.t64, &dfp.t, &dfp.context); \
+    dfp_finalize_decimal##size(&dfp);                                          \
     postprocs(&dfp);                                                           \
                                                                                \
     if (size == 64) {                                                          \
@@ -911,7 +918,7 @@ void helper_dctdp(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
 
     dfp_prepare_decimal64(&dfp, 0, 0, env);
     decimal32ToNumber((decimal32 *)&b_short, &dfp.t);
-    decimal64FromNumber((decimal64 *)&dfp.t64, &dfp.t, &dfp.context);
+    dfp_finalize_decimal64(&dfp);
     set_dfp64(t, dfp.t64);
     dfp_set_FPRF_from_FRT(&dfp);
 }
@@ -927,7 +934,7 @@ void helper_dctqpq(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
     dfp_check_for_VXSNAN_and_convert_to_QNaN(&dfp);
     dfp_set_FPRF_from_FRT(&dfp);
 
-    decimal128FromNumber((decimal128 *)&dfp.t64, &dfp.t, &dfp.context);
+    dfp_finalize_decimal128(&dfp);
     set_dfp128(t, dfp.t64);
 }
 
@@ -963,7 +970,7 @@ void helper_drdpq(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
     dfp_check_for_XX(&dfp);
 
     dfp.t64[0] = dfp.t64[1] = 0;
-    decimal64FromNumber((decimal64 *)dfp.t64, &dfp.t, &dfp.context);
+    dfp_finalize_decimal64(&dfp);
     set_dfp128(t, dfp.t64);
 }
 
@@ -975,7 +982,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)               \
     dfp_prepare_decimal##size(&dfp, 0, b, env);                                \
     get_dfp64(&b64, b);                                                        \
     decNumberFromInt64(&dfp.t, (int64_t)b64);                                  \
-    decimal##size##FromNumber((decimal##size *)dfp.t64, &dfp.t, &dfp.context); \
+    dfp_finalize_decimal##size(&dfp);                                          \
     CFFIX_PPs(&dfp);                                                           \
                                                                                \
     if (size == 64) {                                                          \
@@ -1155,8 +1162,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,             \
     if (s && sgn)  {                                                         \
         dfp.t.bits |= DECNEG;                                                \
     }                                                                        \
-    decimal##size##FromNumber((decimal##size *)dfp.t64, &dfp.t,              \
-                              &dfp.context);                                 \
+    dfp_finalize_decimal##size(&dfp);                                        \
     dfp_set_FPRF_from_FRT(&dfp);                                             \
     if ((size) == 64) {                                                      \
         set_dfp64(t, dfp.t64);                                               \
@@ -1259,8 +1265,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,          \
             dfp.t.bits &= ~DECSPECIAL;                                    \
         }                                                                 \
         dfp.t.exponent = exp - bias;                                      \
-        decimal##size##FromNumber((decimal##size *)dfp.t64, &dfp.t,       \
-                                  &dfp.context);                          \
+        dfp_finalize_decimal##size(&dfp);                                 \
     }                                                                     \
     if (size == 64) {                                                     \
         set_dfp64(t, dfp.t64);                                            \
@@ -1340,8 +1345,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,    \
             dfp.t.digits = max_digits - 1;                          \
         }                                                           \
                                                                     \
-        decimal##size##FromNumber((decimal##size *)dfp.t64, &dfp.t, \
-                                  &dfp.context);                    \
+        dfp_finalize_decimal##size(&dfp);                           \
     } else {                                                        \
         if ((size) == 64) {                                         \
             dfp.t64[0] = dfp.a64[0] & 0xFFFC000000000000ULL;        \
-- 
2.20.1


