Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1C8BCC19
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 18:06:51 +0200 (CEST)
Received: from localhost ([::1]:47706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCnL0-0007xH-7h
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 12:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51149)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1iCmuO-0008FD-0B
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 11:39:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1iCmuM-0006C5-BZ
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 11:39:19 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:35698
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1iCmuM-0005dK-2L; Tue, 24 Sep 2019 11:39:18 -0400
Received: from host86-138-245-63.range86-138.btcentralplus.com
 ([86.138.245.63] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1iCmrU-0007WZ-V5; Tue, 24 Sep 2019 16:36:22 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, pc@us.ibm.com,
 david@gibson.dropbear.id.au
Date: Tue, 24 Sep 2019 16:35:51 +0100
Message-Id: <20190924153556.27575-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924153556.27575-1-mark.cave-ayland@ilande.co.uk>
References: <20190924153556.27575-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.138.245.63
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/7] target/ppc: introduce set_dfp{64,128}() helper functions
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
the DFP numbers directly, introduce set_dfp{64,128}() helper functions to ease
the switch to the correct representation.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 target/ppc/dfp_helper.c | 90 ++++++++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 42 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 354a4aa877..cb98780d20 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -47,6 +47,17 @@ static void get_dfp128(uint64_t *dst, uint64_t *dfp)
     dst[1] = dfp[LO_IDX];
 }
 
+static void set_dfp64(uint64_t *dfp, uint64_t *src)
+{
+    dfp[0] = src[0];
+}
+
+static void set_dfp128(uint64_t *dfp, uint64_t *src)
+{
+    dfp[0] = src[HI_IDX];
+    dfp[1] = src[LO_IDX];
+}
+
 struct PPC_DFP {
     CPUPPCState *env;
     uint64_t t64[2], a64[2], b64[2];
@@ -413,10 +424,9 @@ void helper_##op(CPUPPCState *env, uint64_t *t, uint64_t *a, uint64_t *b)      \
     decimal##size##FromNumber((decimal##size *)dfp.t64, &dfp.t, &dfp.context); \
     postprocs(&dfp);                                                           \
     if (size == 64) {                                                          \
-        t[0] = dfp.t64[0];                                                     \
+        set_dfp64(t, dfp.t64);                                                 \
     } else if (size == 128) {                                                  \
-        t[0] = dfp.t64[HI_IDX];                                                \
-        t[1] = dfp.t64[LO_IDX];                                                \
+        set_dfp128(t, dfp.t64);                                                \
     }                                                                          \
 }
 
@@ -735,10 +745,9 @@ void helper_##op(CPUPPCState *env, uint64_t *t, uint64_t *b,            \
     QUA_PPs(&dfp);                                                      \
                                                                         \
     if (size == 64) {                                                   \
-        t[0] = dfp.t64[0];                                              \
+        set_dfp64(t, dfp.t64);                                          \
     } else if (size == 128) {                                           \
-        t[0] = dfp.t64[HI_IDX];                                         \
-        t[1] = dfp.t64[LO_IDX];                                         \
+        set_dfp128(t, dfp.t64);                                         \
     }                                                                   \
 }
 
@@ -759,10 +768,9 @@ void helper_##op(CPUPPCState *env, uint64_t *t, uint64_t *a,            \
     QUA_PPs(&dfp);                                                      \
                                                                         \
     if (size == 64) {                                                   \
-        t[0] = dfp.t64[0];                                              \
+        set_dfp64(t, dfp.t64);                                          \
     } else if (size == 128) {                                           \
-        t[0] = dfp.t64[HI_IDX];                                         \
-        t[1] = dfp.t64[LO_IDX];                                         \
+        set_dfp128(t, dfp.t64);                                         \
     }                                                                   \
 }
 
@@ -843,10 +851,9 @@ void helper_##op(CPUPPCState *env, uint64_t *t, uint64_t *a,            \
     QUA_PPs(&dfp);                                                      \
                                                                         \
     if (size == 64) {                                                   \
-        t[0] = dfp.t64[0];                                              \
+        set_dfp64(t, dfp.t64);                                          \
     } else if (size == 128) {                                           \
-        t[0] = dfp.t64[HI_IDX];                                         \
-        t[1] = dfp.t64[LO_IDX];                                         \
+        set_dfp128(t, dfp.t64);                                         \
     }                                                                   \
 }
 
@@ -867,10 +874,9 @@ void helper_##op(CPUPPCState *env, uint64_t *t, uint64_t *b,                   \
     postprocs(&dfp);                                                           \
                                                                                \
     if (size == 64) {                                                          \
-        t[0] = dfp.t64[0];                                                     \
+        set_dfp64(t, dfp.t64);                                                 \
     } else if (size == 128) {                                                  \
-        t[0] = dfp.t64[HI_IDX];                                                \
-        t[1] = dfp.t64[LO_IDX];                                                \
+        set_dfp128(t, dfp.t64);                                                \
     }                                                                          \
 }
 
@@ -904,7 +910,8 @@ void helper_dctdp(CPUPPCState *env, uint64_t *t, uint64_t *b)
 
     dfp_prepare_decimal64(&dfp, 0, 0, env);
     decimal32ToNumber((decimal32 *)&b_short, &dfp.t);
-    decimal64FromNumber((decimal64 *)t, &dfp.t, &dfp.context);
+    decimal64FromNumber((decimal64 *)&dfp.t64, &dfp.t, &dfp.context);
+    set_dfp64(t, dfp.t64);
     dfp_set_FPRF_from_FRT(&dfp);
 }
 
@@ -920,14 +927,14 @@ void helper_dctqpq(CPUPPCState *env, uint64_t *t, uint64_t *b)
     dfp_set_FPRF_from_FRT(&dfp);
 
     decimal128FromNumber((decimal128 *)&dfp.t64, &dfp.t, &dfp.context);
-    t[0] = dfp.t64[HI_IDX];
-    t[1] = dfp.t64[LO_IDX];
+    set_dfp128(t, dfp.t64);
 }
 
 void helper_drsp(CPUPPCState *env, uint64_t *t, uint64_t *b)
 {
     struct PPC_DFP dfp;
     uint32_t t_short = 0;
+    uint64_t t64;
     dfp_prepare_decimal64(&dfp, 0, b, env);
     decimal32FromNumber((decimal32 *)&t_short, &dfp.b, &dfp.context);
     decimal32ToNumber((decimal32 *)&t_short, &dfp.t);
@@ -937,7 +944,8 @@ void helper_drsp(CPUPPCState *env, uint64_t *t, uint64_t *b)
     dfp_check_for_UX(&dfp);
     dfp_check_for_XX(&dfp);
 
-    *t = t_short;
+    t64 = (uint64_t)t_short;
+    set_dfp64(t, &t64);
 }
 
 void helper_drdpq(CPUPPCState *env, uint64_t *t, uint64_t *b)
@@ -953,9 +961,9 @@ void helper_drdpq(CPUPPCState *env, uint64_t *t, uint64_t *b)
     dfp_check_for_UX(&dfp);
     dfp_check_for_XX(&dfp);
 
+    dfp.t64[0] = dfp.t64[1] = 0;
     decimal64FromNumber((decimal64 *)dfp.t64, &dfp.t, &dfp.context);
-    t[0] = dfp.t64[0];
-    t[1] = 0;
+    set_dfp128(t, dfp.t64);
 }
 
 #define DFP_HELPER_CFFIX(op, size)                                             \
@@ -970,10 +978,9 @@ void helper_##op(CPUPPCState *env, uint64_t *t, uint64_t *b)                   \
     CFFIX_PPs(&dfp);                                                           \
                                                                                \
     if (size == 64) {                                                          \
-        t[0] = dfp.t64[0];                                                     \
+        set_dfp64(t, dfp.t64);                                                 \
     } else if (size == 128) {                                                  \
-        t[0] = dfp.t64[HI_IDX];                                                \
-        t[1] = dfp.t64[LO_IDX];                                                \
+        set_dfp128(t, dfp.t64);                                                \
     }                                                                          \
 }
 
@@ -1016,7 +1023,7 @@ void helper_##op(CPUPPCState *env, uint64_t *t, uint64_t *b)                  \
         }                                                                     \
     }                                                                         \
                                                                               \
-    *t = dfp.t64[0];                                                          \
+    set_dfp64(t, dfp.t64);                                                    \
 }
 
 DFP_HELPER_CTFIX(dctfix, 64)
@@ -1078,10 +1085,9 @@ void helper_##op(CPUPPCState *env, uint64_t *t, uint64_t *b, uint32_t sp) \
     }                                                                     \
                                                                           \
     if (size == 64) {                                                     \
-        t[0] = dfp.t64[0];                                                \
+        set_dfp64(t, dfp.t64);                                            \
     } else if (size == 128) {                                             \
-        t[0] = dfp.t64[HI_IDX];                                           \
-        t[1] = dfp.t64[LO_IDX];                                           \
+        set_dfp128(t, dfp.t64);                                           \
     }                                                                     \
 }
 
@@ -1150,10 +1156,9 @@ void helper_##op(CPUPPCState *env, uint64_t *t, uint64_t *b, uint32_t s)     \
                               &dfp.context);                                 \
     dfp_set_FPRF_from_FRT(&dfp);                                             \
     if ((size) == 64) {                                                      \
-        t[0] = dfp.t64[0];                                                   \
+        set_dfp64(t, dfp.t64);                                               \
     } else if ((size) == 128) {                                              \
-        t[0] = dfp.t64[HI_IDX];                                              \
-        t[1] = dfp.t64[LO_IDX];                                              \
+        set_dfp128(t, dfp.t64);                                              \
     }                                                                        \
 }
 
@@ -1164,27 +1169,30 @@ DFP_HELPER_ENBCD(denbcdq, 128)
 void helper_##op(CPUPPCState *env, uint64_t *t, uint64_t *b)   \
 {                                                              \
     struct PPC_DFP dfp;                                        \
+    uint64_t t64;                                              \
                                                                \
     dfp_prepare_decimal##size(&dfp, 0, b, env);                \
                                                                \
     if (unlikely(decNumberIsSpecial(&dfp.b))) {                \
         if (decNumberIsInfinite(&dfp.b)) {                     \
-            *t = -1;                                           \
+            t64 = -1;                                          \
         } else if (decNumberIsSNaN(&dfp.b)) {                  \
-            *t = -3;                                           \
+            t64 = -3;                                          \
         } else if (decNumberIsQNaN(&dfp.b)) {                  \
-            *t = -2;                                           \
+            t64 = -2;                                          \
         } else {                                               \
             assert(0);                                         \
         }                                                      \
+        set_dfp64(t, &t64);                                    \
     } else {                                                   \
         if ((size) == 64) {                                    \
-            *t = dfp.b.exponent + 398;                         \
+            t64 = dfp.b.exponent + 398;                        \
         } else if ((size) == 128) {                            \
-            *t = dfp.b.exponent + 6176;                        \
+            t64 = dfp.b.exponent + 6176;                       \
         } else {                                               \
             assert(0);                                         \
         }                                                      \
+        set_dfp64(t, &t64);                                    \
     }                                                          \
 }
 
@@ -1251,10 +1259,9 @@ void helper_##op(CPUPPCState *env, uint64_t *t, uint64_t *a, uint64_t *b) \
                                   &dfp.context);                          \
     }                                                                     \
     if (size == 64) {                                                     \
-        t[0] = dfp.t64[0];                                                \
+        set_dfp64(t, dfp.t64);                                            \
     } else if (size == 128) {                                             \
-        t[0] = dfp.t64[HI_IDX];                                           \
-        t[1] = dfp.t64[LO_IDX];                                           \
+        set_dfp128(t, dfp.t64);                                           \
     }                                                                     \
 }
 
@@ -1344,10 +1351,9 @@ void helper_##op(CPUPPCState *env, uint64_t *t, uint64_t *a,        \
     }                                                               \
                                                                     \
     if ((size) == 64) {                                             \
-        t[0] = dfp.t64[0];                                          \
+        set_dfp64(t, dfp.t64);                                      \
     } else {                                                        \
-        t[0] = dfp.t64[HI_IDX];                                     \
-        t[1] = dfp.t64[LO_IDX];                                     \
+        set_dfp128(t, dfp.t64);                                     \
     }                                                               \
 }
 
-- 
2.20.1


