Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BB2505DB1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 19:48:33 +0200 (CEST)
Received: from localhost ([::1]:43826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngVUG-0002t3-IW
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 13:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1ngVLm-0004xa-TM
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 13:39:48 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:41356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1ngVLg-0006bQ-EF
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 13:39:45 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1ngVLb-000364-LS; Mon, 18 Apr 2022 18:39:36 +0100
From: Paul Brook <paul@nowt.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] TCG support for AVX
Date: Mon, 18 Apr 2022 18:39:02 +0100
Message-Id: <20220418173904.3746036-3-paul@nowt.org>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220418173904.3746036-1-paul@nowt.org>
References: <20220418173904.3746036-1-paul@nowt.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41c8:51:832:fcff:ff:fe00:46dd;
 envelope-from=paul@nowt.org; helo=nowt.default.pbrook.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Paul Brook <paul@nowt.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add TCG translation of guest AVX/AVX2 instructions
This comprises:

* VEX encodings of most (all?) "legacy" SSE operations.
  These typically add an extra source operand, and clear the unused half
  of the destination register (SSE encodings leave this unchanged)
  Previously we were incorrectly translating VEX encoded instructions
  as if they were legacy SSE encodings.
* 256-bit variants of many instructions. AVX adds floating point
  operations. AVX2 adds integer operations.
* A few new instructions (VBROADCAST, VGATHER, VZERO)

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/cpu.c            |    8 +-
 target/i386/helper.h         |    2 +
 target/i386/ops_sse.h        | 2606 ++++++++++++++++++++++++----------
 target/i386/ops_sse_header.h |  364 +++--
 target/i386/tcg/fpu_helper.c |    3 +
 target/i386/tcg/translate.c  | 1902 +++++++++++++++++++------
 6 files changed, 3597 insertions(+), 1288 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index cb6b5467d0..494f01959d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -625,12 +625,12 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_EXT_SSE41 | CPUID_EXT_SSE42 | CPUID_EXT_POPCNT | \
           CPUID_EXT_XSAVE | /* CPUID_EXT_OSXSAVE is dynamic */   \
           CPUID_EXT_MOVBE | CPUID_EXT_AES | CPUID_EXT_HYPERVISOR | \
-          CPUID_EXT_RDRAND)
+          CPUID_EXT_RDRAND | CPUID_EXT_AVX)
           /* missing:
           CPUID_EXT_DTES64, CPUID_EXT_DSCPL, CPUID_EXT_VMX, CPUID_EXT_SMX,
           CPUID_EXT_EST, CPUID_EXT_TM2, CPUID_EXT_CID, CPUID_EXT_FMA,
           CPUID_EXT_XTPR, CPUID_EXT_PDCM, CPUID_EXT_PCID, CPUID_EXT_DCA,
-          CPUID_EXT_X2APIC, CPUID_EXT_TSC_DEADLINE_TIMER, CPUID_EXT_AVX,
+          CPUID_EXT_X2APIC, CPUID_EXT_TSC_DEADLINE_TIMER,
           CPUID_EXT_F16C */
 
 #ifdef TARGET_X86_64
@@ -653,9 +653,9 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_ADX | \
           CPUID_7_0_EBX_PCOMMIT | CPUID_7_0_EBX_CLFLUSHOPT |            \
           CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_MPX | CPUID_7_0_EBX_FSGSBASE | \
-          CPUID_7_0_EBX_ERMS)
+          CPUID_7_0_EBX_ERMS | CPUID_7_0_EBX_AVX2)
           /* missing:
-          CPUID_7_0_EBX_HLE, CPUID_7_0_EBX_AVX2,
+          CPUID_7_0_EBX_HLE
           CPUID_7_0_EBX_INVPCID, CPUID_7_0_EBX_RTM,
           CPUID_7_0_EBX_RDSEED */
 #define TCG_7_0_ECX_FEATURES (CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_PKU | \
diff --git a/target/i386/helper.h b/target/i386/helper.h
index ac3b4d1ee3..3da5df98b9 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -218,6 +218,8 @@ DEF_HELPER_3(movq, void, env, ptr, ptr)
 #include "ops_sse_header.h"
 #define SHIFT 1
 #include "ops_sse_header.h"
+#define SHIFT 2
+#include "ops_sse_header.h"
 
 DEF_HELPER_3(rclb, tl, env, tl, tl)
 DEF_HELPER_3(rclw, tl, env, tl, tl)
diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 6f1fc174b3..9cd7b2875e 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -23,6 +23,7 @@
 #if SHIFT == 0
 #define Reg MMXReg
 #define XMM_ONLY(...)
+#define YMM_ONLY(...)
 #define B(n) MMX_B(n)
 #define W(n) MMX_W(n)
 #define L(n) MMX_L(n)
@@ -35,260 +36,355 @@
 #define W(n) ZMM_W(n)
 #define L(n) ZMM_L(n)
 #define Q(n) ZMM_Q(n)
+#if SHIFT == 1
 #define SUFFIX _xmm
+#define YMM_ONLY(...)
+#else
+#define SUFFIX _ymm
+#define YMM_ONLY(...) __VA_ARGS__
+#endif
+#endif
+
+#if SHIFT == 0
+#define SHIFT_HELPER_BODY(n, elem, F) do {      \
+    d->elem(0) = F(s->elem(0), shift);          \
+    if ((n) > 1) {                              \
+        d->elem(1) = F(s->elem(1), shift);      \
+    }                                           \
+    if ((n) > 2) {                              \
+        d->elem(2) = F(s->elem(2), shift);      \
+        d->elem(3) = F(s->elem(3), shift);      \
+    }                                           \
+    if ((n) > 4) {                              \
+        d->elem(4) = F(s->elem(4), shift);      \
+        d->elem(5) = F(s->elem(5), shift);      \
+        d->elem(6) = F(s->elem(6), shift);      \
+        d->elem(7) = F(s->elem(7), shift);      \
+    }                                           \
+    if ((n) > 8) {                              \
+        d->elem(8) = F(s->elem(8), shift);      \
+        d->elem(9) = F(s->elem(9), shift);      \
+        d->elem(10) = F(s->elem(10), shift);    \
+        d->elem(11) = F(s->elem(11), shift);    \
+        d->elem(12) = F(s->elem(12), shift);    \
+        d->elem(13) = F(s->elem(13), shift);    \
+        d->elem(14) = F(s->elem(14), shift);    \
+        d->elem(15) = F(s->elem(15), shift);    \
+    }                                           \
+    } while (0)
+
+#define FPSRL(x, c) ((x) >> shift)
+#define FPSRAW(x, c) ((int16_t)(x) >> shift)
+#define FPSRAL(x, c) ((int32_t)(x) >> shift)
+#define FPSLL(x, c) ((x) << shift)
 #endif
 
-void glue(helper_psrlw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_psrlw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
     int shift;
-
-    if (s->Q(0) > 15) {
+    if (c->Q(0) > 15) {
         d->Q(0) = 0;
-#if SHIFT == 1
-        d->Q(1) = 0;
-#endif
+        XMM_ONLY(d->Q(1) = 0;)
+        YMM_ONLY(
+                d->Q(2) = 0;
+                d->Q(3) = 0;
+                )
     } else {
-        shift = s->B(0);
-        d->W(0) >>= shift;
-        d->W(1) >>= shift;
-        d->W(2) >>= shift;
-        d->W(3) >>= shift;
-#if SHIFT == 1
-        d->W(4) >>= shift;
-        d->W(5) >>= shift;
-        d->W(6) >>= shift;
-        d->W(7) >>= shift;
-#endif
+        shift = c->B(0);
+        SHIFT_HELPER_BODY(4 << SHIFT, W, FPSRL);
     }
 }
 
-void glue(helper_psraw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_psllw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
     int shift;
-
-    if (s->Q(0) > 15) {
-        shift = 15;
+    if (c->Q(0) > 15) {
+        d->Q(0) = 0;
+        XMM_ONLY(d->Q(1) = 0;)
+        YMM_ONLY(
+                d->Q(2) = 0;
+                d->Q(3) = 0;
+                )
     } else {
-        shift = s->B(0);
+        shift = c->B(0);
+        SHIFT_HELPER_BODY(4 << SHIFT, W, FPSLL);
     }
-    d->W(0) = (int16_t)d->W(0) >> shift;
-    d->W(1) = (int16_t)d->W(1) >> shift;
-    d->W(2) = (int16_t)d->W(2) >> shift;
-    d->W(3) = (int16_t)d->W(3) >> shift;
-#if SHIFT == 1
-    d->W(4) = (int16_t)d->W(4) >> shift;
-    d->W(5) = (int16_t)d->W(5) >> shift;
-    d->W(6) = (int16_t)d->W(6) >> shift;
-    d->W(7) = (int16_t)d->W(7) >> shift;
-#endif
 }
 
-void glue(helper_psllw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_psraw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
     int shift;
-
-    if (s->Q(0) > 15) {
-        d->Q(0) = 0;
-#if SHIFT == 1
-        d->Q(1) = 0;
-#endif
+    if (c->Q(0) > 15) {
+        shift = 15;
     } else {
-        shift = s->B(0);
-        d->W(0) <<= shift;
-        d->W(1) <<= shift;
-        d->W(2) <<= shift;
-        d->W(3) <<= shift;
-#if SHIFT == 1
-        d->W(4) <<= shift;
-        d->W(5) <<= shift;
-        d->W(6) <<= shift;
-        d->W(7) <<= shift;
-#endif
+        shift = c->B(0);
     }
+    SHIFT_HELPER_BODY(4 << SHIFT, W, FPSRAW);
 }
 
-void glue(helper_psrld, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_psrld, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
     int shift;
-
-    if (s->Q(0) > 31) {
+    if (c->Q(0) > 31) {
         d->Q(0) = 0;
-#if SHIFT == 1
-        d->Q(1) = 0;
-#endif
+        XMM_ONLY(d->Q(1) = 0;)
+        YMM_ONLY(
+                d->Q(2) = 0;
+                d->Q(3) = 0;
+                )
     } else {
-        shift = s->B(0);
-        d->L(0) >>= shift;
-        d->L(1) >>= shift;
-#if SHIFT == 1
-        d->L(2) >>= shift;
-        d->L(3) >>= shift;
-#endif
+        shift = c->B(0);
+        SHIFT_HELPER_BODY(2 << SHIFT, L, FPSRL);
     }
 }
 
-void glue(helper_psrad, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pslld, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
     int shift;
-
-    if (s->Q(0) > 31) {
-        shift = 31;
+    if (c->Q(0) > 31) {
+        d->Q(0) = 0;
+        XMM_ONLY(d->Q(1) = 0;)
+        YMM_ONLY(
+                d->Q(2) = 0;
+                d->Q(3) = 0;
+                )
     } else {
-        shift = s->B(0);
+        shift = c->B(0);
+        SHIFT_HELPER_BODY(2 << SHIFT, L, FPSLL);
     }
-    d->L(0) = (int32_t)d->L(0) >> shift;
-    d->L(1) = (int32_t)d->L(1) >> shift;
-#if SHIFT == 1
-    d->L(2) = (int32_t)d->L(2) >> shift;
-    d->L(3) = (int32_t)d->L(3) >> shift;
-#endif
 }
 
-void glue(helper_pslld, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_psrad, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
     int shift;
-
-    if (s->Q(0) > 31) {
-        d->Q(0) = 0;
-#if SHIFT == 1
-        d->Q(1) = 0;
-#endif
+    if (c->Q(0) > 31) {
+        shift = 31;
     } else {
-        shift = s->B(0);
-        d->L(0) <<= shift;
-        d->L(1) <<= shift;
-#if SHIFT == 1
-        d->L(2) <<= shift;
-        d->L(3) <<= shift;
-#endif
+        shift = c->B(0);
     }
+    SHIFT_HELPER_BODY(2 << SHIFT, L, FPSRAL);
 }
 
-void glue(helper_psrlq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_psrlq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
     int shift;
-
-    if (s->Q(0) > 63) {
+    if (c->Q(0) > 63) {
         d->Q(0) = 0;
-#if SHIFT == 1
-        d->Q(1) = 0;
-#endif
+        XMM_ONLY(d->Q(1) = 0;)
+        YMM_ONLY(
+                d->Q(2) = 0;
+                d->Q(3) = 0;
+                )
     } else {
-        shift = s->B(0);
-        d->Q(0) >>= shift;
-#if SHIFT == 1
-        d->Q(1) >>= shift;
-#endif
+        shift = c->B(0);
+        SHIFT_HELPER_BODY(1 << SHIFT, Q, FPSRL);
     }
 }
 
-void glue(helper_psllq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_psllq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
     int shift;
-
-    if (s->Q(0) > 63) {
+    if (c->Q(0) > 63) {
         d->Q(0) = 0;
-#if SHIFT == 1
-        d->Q(1) = 0;
-#endif
+        XMM_ONLY(d->Q(1) = 0;)
+        YMM_ONLY(
+                d->Q(2) = 0;
+                d->Q(3) = 0;
+                )
     } else {
-        shift = s->B(0);
-        d->Q(0) <<= shift;
-#if SHIFT == 1
-        d->Q(1) <<= shift;
-#endif
+        shift = c->B(0);
+        SHIFT_HELPER_BODY(1 << SHIFT, Q, FPSLL);
     }
 }
 
-#if SHIFT == 1
-void glue(helper_psrldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+#if SHIFT >= 1
+void glue(helper_psrldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
     int shift, i;
 
-    shift = s->L(0);
+    shift = c->L(0);
     if (shift > 16) {
         shift = 16;
     }
     for (i = 0; i < 16 - shift; i++) {
-        d->B(i) = d->B(i + shift);
+        d->B(i) = s->B(i + shift);
     }
     for (i = 16 - shift; i < 16; i++) {
         d->B(i) = 0;
     }
+#if SHIFT == 2
+    for (i = 0; i < 16 - shift; i++) {
+        d->B(i + 16) = s->B(i + 16 + shift);
+    }
+    for (i = 16 - shift; i < 16; i++) {
+        d->B(i + 16) = 0;
+    }
+#endif
 }
 
-void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
     int shift, i;
 
-    shift = s->L(0);
+    shift = c->L(0);
     if (shift > 16) {
         shift = 16;
     }
     for (i = 15; i >= shift; i--) {
-        d->B(i) = d->B(i - shift);
+        d->B(i) = s->B(i - shift);
     }
     for (i = 0; i < shift; i++) {
         d->B(i) = 0;
     }
+#if SHIFT == 2
+    for (i = 15; i >= shift; i--) {
+        d->B(i + 16) = s->B(i + 16 - shift);
+    }
+    for (i = 0; i < shift; i++) {
+        d->B(i + 16) = 0;
+    }
+#endif
 }
 #endif
 
-#define SSE_HELPER_B(name, F)                                   \
+#define SSE_HELPER_1(name, elem, num, F)                                   \
     void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
     {                                                           \
-        d->B(0) = F(d->B(0), s->B(0));                          \
-        d->B(1) = F(d->B(1), s->B(1));                          \
-        d->B(2) = F(d->B(2), s->B(2));                          \
-        d->B(3) = F(d->B(3), s->B(3));                          \
-        d->B(4) = F(d->B(4), s->B(4));                          \
-        d->B(5) = F(d->B(5), s->B(5));                          \
-        d->B(6) = F(d->B(6), s->B(6));                          \
-        d->B(7) = F(d->B(7), s->B(7));                          \
+        d->elem(0) = F(s->elem(0));                             \
+        d->elem(1) = F(s->elem(1));                             \
+        if ((num << SHIFT) > 2) {                               \
+            d->elem(2) = F(s->elem(2));                         \
+            d->elem(3) = F(s->elem(3));                         \
+        }                                                       \
+        if ((num << SHIFT) > 4) {                               \
+            d->elem(4) = F(s->elem(4));                         \
+            d->elem(5) = F(s->elem(5));                         \
+            d->elem(6) = F(s->elem(6));                         \
+            d->elem(7) = F(s->elem(7));                         \
+        }                                                       \
+        if ((num << SHIFT) > 8) {                               \
+            d->elem(8) = F(s->elem(8));                         \
+            d->elem(9) = F(s->elem(9));                         \
+            d->elem(10) = F(s->elem(10));                       \
+            d->elem(11) = F(s->elem(11));                       \
+            d->elem(12) = F(s->elem(12));                       \
+            d->elem(13) = F(s->elem(13));                       \
+            d->elem(14) = F(s->elem(14));                       \
+            d->elem(15) = F(s->elem(15));                       \
+        }                                                       \
+        if ((num << SHIFT) > 16) {                              \
+            d->elem(16) = F(s->elem(16));                       \
+            d->elem(17) = F(s->elem(17));                       \
+            d->elem(18) = F(s->elem(18));                       \
+            d->elem(19) = F(s->elem(19));                       \
+            d->elem(20) = F(s->elem(20));                       \
+            d->elem(21) = F(s->elem(21));                       \
+            d->elem(22) = F(s->elem(22));                       \
+            d->elem(23) = F(s->elem(23));                       \
+            d->elem(24) = F(s->elem(24));                       \
+            d->elem(25) = F(s->elem(25));                       \
+            d->elem(26) = F(s->elem(26));                       \
+            d->elem(27) = F(s->elem(27));                       \
+            d->elem(28) = F(s->elem(28));                       \
+            d->elem(29) = F(s->elem(29));                       \
+            d->elem(30) = F(s->elem(30));                       \
+            d->elem(31) = F(s->elem(31));                       \
+        }                                                       \
+    }
+
+#define SSE_HELPER_B(name, F)                                   \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
+    {                                                           \
+        d->B(0) = F(v->B(0), s->B(0));                          \
+        d->B(1) = F(v->B(1), s->B(1));                          \
+        d->B(2) = F(v->B(2), s->B(2));                          \
+        d->B(3) = F(v->B(3), s->B(3));                          \
+        d->B(4) = F(v->B(4), s->B(4));                          \
+        d->B(5) = F(v->B(5), s->B(5));                          \
+        d->B(6) = F(v->B(6), s->B(6));                          \
+        d->B(7) = F(v->B(7), s->B(7));                          \
         XMM_ONLY(                                               \
-                 d->B(8) = F(d->B(8), s->B(8));                 \
-                 d->B(9) = F(d->B(9), s->B(9));                 \
-                 d->B(10) = F(d->B(10), s->B(10));              \
-                 d->B(11) = F(d->B(11), s->B(11));              \
-                 d->B(12) = F(d->B(12), s->B(12));              \
-                 d->B(13) = F(d->B(13), s->B(13));              \
-                 d->B(14) = F(d->B(14), s->B(14));              \
-                 d->B(15) = F(d->B(15), s->B(15));              \
+                 d->B(8) = F(v->B(8), s->B(8));                 \
+                 d->B(9) = F(v->B(9), s->B(9));                 \
+                 d->B(10) = F(v->B(10), s->B(10));              \
+                 d->B(11) = F(v->B(11), s->B(11));              \
+                 d->B(12) = F(v->B(12), s->B(12));              \
+                 d->B(13) = F(v->B(13), s->B(13));              \
+                 d->B(14) = F(v->B(14), s->B(14));              \
+                 d->B(15) = F(v->B(15), s->B(15));              \
+                                                        )       \
+        YMM_ONLY(                                               \
+                 d->B(16) = F(v->B(16), s->B(16));              \
+                 d->B(17) = F(v->B(17), s->B(17));              \
+                 d->B(18) = F(v->B(18), s->B(18));              \
+                 d->B(19) = F(v->B(19), s->B(19));              \
+                 d->B(20) = F(v->B(20), s->B(20));              \
+                 d->B(21) = F(v->B(21), s->B(21));              \
+                 d->B(22) = F(v->B(22), s->B(22));              \
+                 d->B(23) = F(v->B(23), s->B(23));              \
+                 d->B(24) = F(v->B(24), s->B(24));              \
+                 d->B(25) = F(v->B(25), s->B(25));              \
+                 d->B(26) = F(v->B(26), s->B(26));              \
+                 d->B(27) = F(v->B(27), s->B(27));              \
+                 d->B(28) = F(v->B(28), s->B(28));              \
+                 d->B(29) = F(v->B(29), s->B(29));              \
+                 d->B(30) = F(v->B(30), s->B(30));              \
+                 d->B(31) = F(v->B(31), s->B(31));              \
                                                         )       \
             }
 
 #define SSE_HELPER_W(name, F)                                   \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
     {                                                           \
-        d->W(0) = F(d->W(0), s->W(0));                          \
-        d->W(1) = F(d->W(1), s->W(1));                          \
-        d->W(2) = F(d->W(2), s->W(2));                          \
-        d->W(3) = F(d->W(3), s->W(3));                          \
+        d->W(0) = F(v->W(0), s->W(0));                          \
+        d->W(1) = F(v->W(1), s->W(1));                          \
+        d->W(2) = F(v->W(2), s->W(2));                          \
+        d->W(3) = F(v->W(3), s->W(3));                          \
         XMM_ONLY(                                               \
-                 d->W(4) = F(d->W(4), s->W(4));                 \
-                 d->W(5) = F(d->W(5), s->W(5));                 \
-                 d->W(6) = F(d->W(6), s->W(6));                 \
-                 d->W(7) = F(d->W(7), s->W(7));                 \
+                 d->W(4) = F(v->W(4), s->W(4));                 \
+                 d->W(5) = F(v->W(5), s->W(5));                 \
+                 d->W(6) = F(v->W(6), s->W(6));                 \
+                 d->W(7) = F(v->W(7), s->W(7));                 \
+                                                        )       \
+        YMM_ONLY(                                               \
+                 d->W(8) = F(v->W(8), s->W(8));                 \
+                 d->W(9) = F(v->W(9), s->W(9));                 \
+                 d->W(10) = F(v->W(10), s->W(10));              \
+                 d->W(11) = F(v->W(11), s->W(11));              \
+                 d->W(12) = F(v->W(12), s->W(12));              \
+                 d->W(13) = F(v->W(13), s->W(13));              \
+                 d->W(14) = F(v->W(14), s->W(14));              \
+                 d->W(15) = F(v->W(15), s->W(15));              \
                                                         )       \
             }
 
 #define SSE_HELPER_L(name, F)                                   \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
     {                                                           \
-        d->L(0) = F(d->L(0), s->L(0));                          \
-        d->L(1) = F(d->L(1), s->L(1));                          \
+        d->L(0) = F(v->L(0), s->L(0));                          \
+        d->L(1) = F(v->L(1), s->L(1));                          \
         XMM_ONLY(                                               \
-                 d->L(2) = F(d->L(2), s->L(2));                 \
-                 d->L(3) = F(d->L(3), s->L(3));                 \
+                 d->L(2) = F(v->L(2), s->L(2));                 \
+                 d->L(3) = F(v->L(3), s->L(3));                 \
+                                                        )       \
+        YMM_ONLY(                                               \
+                 d->L(4) = F(v->L(4), s->L(4));                 \
+                 d->L(5) = F(v->L(5), s->L(5));                 \
+                 d->L(6) = F(v->L(6), s->L(6));                 \
+                 d->L(7) = F(v->L(7), s->L(7));                 \
                                                         )       \
             }
 
 #define SSE_HELPER_Q(name, F)                                   \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
     {                                                           \
-        d->Q(0) = F(d->Q(0), s->Q(0));                          \
+        d->Q(0) = F(v->Q(0), s->Q(0));                          \
         XMM_ONLY(                                               \
-                 d->Q(1) = F(d->Q(1), s->Q(1));                 \
+                 d->Q(1) = F(v->Q(1), s->Q(1));                 \
+                                                        )       \
+        YMM_ONLY(                                               \
+                 d->Q(2) = F(v->Q(2), s->Q(2));                 \
+                 d->Q(3) = F(v->Q(3), s->Q(3));                 \
                                                         )       \
             }
 
@@ -411,30 +507,41 @@ SSE_HELPER_W(helper_pcmpeqw, FCMPEQ)
 SSE_HELPER_L(helper_pcmpeql, FCMPEQ)
 
 SSE_HELPER_W(helper_pmullw, FMULLW)
-#if SHIFT == 0
-SSE_HELPER_W(helper_pmulhrw, FMULHRW)
-#endif
 SSE_HELPER_W(helper_pmulhuw, FMULHUW)
 SSE_HELPER_W(helper_pmulhw, FMULHW)
 
+#if SHIFT == 0
+void glue(helper_pmulhrw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    d->W(0) = FMULHRW(d->W(0), s->W(0));
+    d->W(1) = FMULHRW(d->W(1), s->W(1));
+    d->W(2) = FMULHRW(d->W(2), s->W(2));
+    d->W(3) = FMULHRW(d->W(3), s->W(3));
+}
+#endif
+
 SSE_HELPER_B(helper_pavgb, FAVG)
 SSE_HELPER_W(helper_pavgw, FAVG)
 
-void glue(helper_pmuludq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pmuludq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    d->Q(0) = (uint64_t)s->L(0) * (uint64_t)d->L(0);
-#if SHIFT == 1
-    d->Q(1) = (uint64_t)s->L(2) * (uint64_t)d->L(2);
+    d->Q(0) = (uint64_t)s->L(0) * (uint64_t)v->L(0);
+#if SHIFT >= 1
+    d->Q(1) = (uint64_t)s->L(2) * (uint64_t)v->L(2);
+#if SHIFT == 2
+    d->Q(2) = (uint64_t)s->L(4) * (uint64_t)v->L(4);
+    d->Q(3) = (uint64_t)s->L(6) * (uint64_t)v->L(6);
+#endif
 #endif
 }
 
-void glue(helper_pmaddwd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pmaddwd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
     int i;
 
     for (i = 0; i < (2 << SHIFT); i++) {
-        d->L(i) = (int16_t)s->W(2 * i) * (int16_t)d->W(2 * i) +
-            (int16_t)s->W(2 * i + 1) * (int16_t)d->W(2 * i + 1);
+        d->L(i) = (int16_t)s->W(2 * i) * (int16_t)v->W(2 * i) +
+            (int16_t)s->W(2 * i + 1) * (int16_t)v->W(2 * i + 1);
     }
 }
 
@@ -448,34 +555,57 @@ static inline int abs1(int a)
     }
 }
 #endif
-void glue(helper_psadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_psadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
     unsigned int val;
 
     val = 0;
-    val += abs1(d->B(0) - s->B(0));
-    val += abs1(d->B(1) - s->B(1));
-    val += abs1(d->B(2) - s->B(2));
-    val += abs1(d->B(3) - s->B(3));
-    val += abs1(d->B(4) - s->B(4));
-    val += abs1(d->B(5) - s->B(5));
-    val += abs1(d->B(6) - s->B(6));
-    val += abs1(d->B(7) - s->B(7));
+    val += abs1(v->B(0) - s->B(0));
+    val += abs1(v->B(1) - s->B(1));
+    val += abs1(v->B(2) - s->B(2));
+    val += abs1(v->B(3) - s->B(3));
+    val += abs1(v->B(4) - s->B(4));
+    val += abs1(v->B(5) - s->B(5));
+    val += abs1(v->B(6) - s->B(6));
+    val += abs1(v->B(7) - s->B(7));
     d->Q(0) = val;
-#if SHIFT == 1
+#if SHIFT >= 1
     val = 0;
-    val += abs1(d->B(8) - s->B(8));
-    val += abs1(d->B(9) - s->B(9));
-    val += abs1(d->B(10) - s->B(10));
-    val += abs1(d->B(11) - s->B(11));
-    val += abs1(d->B(12) - s->B(12));
-    val += abs1(d->B(13) - s->B(13));
-    val += abs1(d->B(14) - s->B(14));
-    val += abs1(d->B(15) - s->B(15));
+    val += abs1(v->B(8) - s->B(8));
+    val += abs1(v->B(9) - s->B(9));
+    val += abs1(v->B(10) - s->B(10));
+    val += abs1(v->B(11) - s->B(11));
+    val += abs1(v->B(12) - s->B(12));
+    val += abs1(v->B(13) - s->B(13));
+    val += abs1(v->B(14) - s->B(14));
+    val += abs1(v->B(15) - s->B(15));
     d->Q(1) = val;
+#if SHIFT == 2
+    val = 0;
+    val += abs1(v->B(16) - s->B(16));
+    val += abs1(v->B(17) - s->B(17));
+    val += abs1(v->B(18) - s->B(18));
+    val += abs1(v->B(19) - s->B(19));
+    val += abs1(v->B(20) - s->B(20));
+    val += abs1(v->B(21) - s->B(21));
+    val += abs1(v->B(22) - s->B(22));
+    val += abs1(v->B(23) - s->B(23));
+    d->Q(2) = val;
+    val = 0;
+    val += abs1(v->B(24) - s->B(24));
+    val += abs1(v->B(25) - s->B(25));
+    val += abs1(v->B(26) - s->B(26));
+    val += abs1(v->B(27) - s->B(27));
+    val += abs1(v->B(28) - s->B(28));
+    val += abs1(v->B(29) - s->B(29));
+    val += abs1(v->B(30) - s->B(30));
+    val += abs1(v->B(31) - s->B(31));
+    d->Q(3) = val;
+#endif
 #endif
 }
 
+#if SHIFT < 2
 void glue(helper_maskmov, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   target_ulong a0)
 {
@@ -487,13 +617,18 @@ void glue(helper_maskmov, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
         }
     }
 }
+#endif
 
 void glue(helper_movl_mm_T0, SUFFIX)(Reg *d, uint32_t val)
 {
     d->L(0) = val;
     d->L(1) = 0;
-#if SHIFT == 1
+#if SHIFT >= 1
     d->Q(1) = 0;
+#if SHIFT == 2
+    d->Q(2) = 0;
+    d->Q(3) = 0;
+#endif
 #endif
 }
 
@@ -501,114 +636,152 @@ void glue(helper_movl_mm_T0, SUFFIX)(Reg *d, uint32_t val)
 void glue(helper_movq_mm_T0, SUFFIX)(Reg *d, uint64_t val)
 {
     d->Q(0) = val;
-#if SHIFT == 1
+#if SHIFT >= 1
     d->Q(1) = 0;
+#if SHIFT == 2
+    d->Q(2) = 0;
+    d->Q(3) = 0;
+#endif
 #endif
 }
 #endif
 
+#define SHUFFLE4(F, a, b, offset) do {      \
+    r0 = a->F((order & 3) + offset);        \
+    r1 = a->F(((order >> 2) & 3) + offset); \
+    r2 = b->F(((order >> 4) & 3) + offset); \
+    r3 = b->F(((order >> 6) & 3) + offset); \
+    d->F(offset) = r0;                      \
+    d->F(offset + 1) = r1;                  \
+    d->F(offset + 2) = r2;                  \
+    d->F(offset + 3) = r3;                  \
+    } while (0)
+
 #if SHIFT == 0
 void glue(helper_pshufw, SUFFIX)(Reg *d, Reg *s, int order)
 {
-    Reg r;
+    uint16_t r0, r1, r2, r3;
 
-    r.W(0) = s->W(order & 3);
-    r.W(1) = s->W((order >> 2) & 3);
-    r.W(2) = s->W((order >> 4) & 3);
-    r.W(3) = s->W((order >> 6) & 3);
-    *d = r;
+    SHUFFLE4(W, s, s, 0);
 }
 #else
-void helper_shufps(Reg *d, Reg *s, int order)
+void glue(helper_shufps, SUFFIX)(Reg *d, Reg *v, Reg *s, int order)
 {
-    Reg r;
+    uint32_t r0, r1, r2, r3;
 
-    r.L(0) = d->L(order & 3);
-    r.L(1) = d->L((order >> 2) & 3);
-    r.L(2) = s->L((order >> 4) & 3);
-    r.L(3) = s->L((order >> 6) & 3);
-    *d = r;
+    SHUFFLE4(L, v, s, 0);
+#if SHIFT == 2
+    SHUFFLE4(L, v, s, 4);
+#endif
 }
 
-void helper_shufpd(Reg *d, Reg *s, int order)
+void glue(helper_shufpd, SUFFIX)(Reg *d, Reg *v, Reg *s, int order)
 {
-    Reg r;
+    uint64_t r0, r1;
 
-    r.Q(0) = d->Q(order & 1);
-    r.Q(1) = s->Q((order >> 1) & 1);
-    *d = r;
+    r0 = v->Q(order & 1);
+    r1 = s->Q((order >> 1) & 1);
+    d->Q(0) = r0;
+    d->Q(1) = r1;
+#if SHIFT == 2
+    r0 = v->Q(((order >> 2) & 1) + 2);
+    r1 = s->Q(((order >> 3) & 1) + 2);
+    d->Q(2) = r0;
+    d->Q(3) = r1;
+#endif
 }
 
 void glue(helper_pshufd, SUFFIX)(Reg *d, Reg *s, int order)
 {
-    Reg r;
+    uint32_t r0, r1, r2, r3;
 
-    r.L(0) = s->L(order & 3);
-    r.L(1) = s->L((order >> 2) & 3);
-    r.L(2) = s->L((order >> 4) & 3);
-    r.L(3) = s->L((order >> 6) & 3);
-    *d = r;
+    SHUFFLE4(L, s, s, 0);
+#if SHIFT ==  2
+    SHUFFLE4(L, s, s, 4);
+#endif
 }
 
 void glue(helper_pshuflw, SUFFIX)(Reg *d, Reg *s, int order)
 {
-    Reg r;
+    uint16_t r0, r1, r2, r3;
 
-    r.W(0) = s->W(order & 3);
-    r.W(1) = s->W((order >> 2) & 3);
-    r.W(2) = s->W((order >> 4) & 3);
-    r.W(3) = s->W((order >> 6) & 3);
-    r.Q(1) = s->Q(1);
-    *d = r;
+    SHUFFLE4(W, s, s, 0);
+    d->Q(1) = s->Q(1);
+#if SHIFT == 2
+    SHUFFLE4(W, s, s, 8);
+    d->Q(3) = s->Q(3);
+#endif
 }
 
 void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
 {
-    Reg r;
+    uint16_t r0, r1, r2, r3;
 
-    r.Q(0) = s->Q(0);
-    r.W(4) = s->W(4 + (order & 3));
-    r.W(5) = s->W(4 + ((order >> 2) & 3));
-    r.W(6) = s->W(4 + ((order >> 4) & 3));
-    r.W(7) = s->W(4 + ((order >> 6) & 3));
-    *d = r;
+    d->Q(0) = s->Q(0);
+    SHUFFLE4(W, s, s, 4);
+#if SHIFT == 2
+    d->Q(2) = s->Q(2);
+    SHUFFLE4(W, s, s, 12);
+#endif
 }
 #endif
 
-#if SHIFT == 1
+#if SHIFT >= 1
 /* FPU ops */
 /* XXX: not accurate */
 
-#define SSE_HELPER_S(name, F)                                           \
-    void helper_ ## name ## ps(CPUX86State *env, Reg *d, Reg *s)        \
+#define SSE_HELPER_P(name, F)                                           \
+    void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env,          \
+            Reg *d, Reg *v, Reg *s)                                     \
     {                                                                   \
-        d->ZMM_S(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
-        d->ZMM_S(1) = F(32, d->ZMM_S(1), s->ZMM_S(1));                  \
-        d->ZMM_S(2) = F(32, d->ZMM_S(2), s->ZMM_S(2));                  \
-        d->ZMM_S(3) = F(32, d->ZMM_S(3), s->ZMM_S(3));                  \
+        d->ZMM_S(0) = F(32, v->ZMM_S(0), s->ZMM_S(0));                  \
+        d->ZMM_S(1) = F(32, v->ZMM_S(1), s->ZMM_S(1));                  \
+        d->ZMM_S(2) = F(32, v->ZMM_S(2), s->ZMM_S(2));                  \
+        d->ZMM_S(3) = F(32, v->ZMM_S(3), s->ZMM_S(3));                  \
+        YMM_ONLY(                                                       \
+        d->ZMM_S(4) = F(32, v->ZMM_S(4), s->ZMM_S(4));                  \
+        d->ZMM_S(5) = F(32, v->ZMM_S(5), s->ZMM_S(5));                  \
+        d->ZMM_S(6) = F(32, v->ZMM_S(6), s->ZMM_S(6));                  \
+        d->ZMM_S(7) = F(32, v->ZMM_S(7), s->ZMM_S(7));                  \
+        )                                                               \
     }                                                                   \
                                                                         \
-    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *s)        \
+    void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env,          \
+            Reg *d, Reg *v, Reg *s)                                     \
     {                                                                   \
-        d->ZMM_S(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
-    }                                                                   \
+        d->ZMM_D(0) = F(64, v->ZMM_D(0), s->ZMM_D(0));                  \
+        d->ZMM_D(1) = F(64, v->ZMM_D(1), s->ZMM_D(1));                  \
+        YMM_ONLY(                                                       \
+        d->ZMM_D(2) = F(64, v->ZMM_D(2), s->ZMM_D(2));                  \
+        d->ZMM_D(3) = F(64, v->ZMM_D(3), s->ZMM_D(3));                  \
+        )                                                               \
+    }
+
+#if SHIFT == 1
+
+#define SSE_HELPER_S(name, F)                                           \
+    SSE_HELPER_P(name, F)                                               \
                                                                         \
-    void helper_ ## name ## pd(CPUX86State *env, Reg *d, Reg *s)        \
+    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *v, Reg *s)\
     {                                                                   \
-        d->ZMM_D(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
-        d->ZMM_D(1) = F(64, d->ZMM_D(1), s->ZMM_D(1));                  \
+        d->ZMM_S(0) = F(32, v->ZMM_S(0), s->ZMM_S(0));                  \
     }                                                                   \
                                                                         \
-    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *s)        \
+    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *v, Reg *s)\
     {                                                                   \
-        d->ZMM_D(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
+        d->ZMM_D(0) = F(64, v->ZMM_D(0), s->ZMM_D(0));                  \
     }
 
+#else
+
+#define SSE_HELPER_S(name, F) SSE_HELPER_P(name, F)
+
+#endif
+
 #define FPU_ADD(size, a, b) float ## size ## _add(a, b, &env->sse_status)
 #define FPU_SUB(size, a, b) float ## size ## _sub(a, b, &env->sse_status)
 #define FPU_MUL(size, a, b) float ## size ## _mul(a, b, &env->sse_status)
 #define FPU_DIV(size, a, b) float ## size ## _div(a, b, &env->sse_status)
-#define FPU_SQRT(size, a, b) float ## size ## _sqrt(b, &env->sse_status)
 
 /* Note that the choice of comparison op here is important to get the
  * special cases right: for min and max Intel specifies that (-0,0),
@@ -625,27 +798,76 @@ SSE_HELPER_S(mul, FPU_MUL)
 SSE_HELPER_S(div, FPU_DIV)
 SSE_HELPER_S(min, FPU_MIN)
 SSE_HELPER_S(max, FPU_MAX)
-SSE_HELPER_S(sqrt, FPU_SQRT)
 
+void glue(helper_sqrtps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    d->ZMM_S(0) = float32_sqrt(s->ZMM_S(0), &env->sse_status);
+    d->ZMM_S(1) = float32_sqrt(s->ZMM_S(1), &env->sse_status);
+    d->ZMM_S(2) = float32_sqrt(s->ZMM_S(2), &env->sse_status);
+    d->ZMM_S(3) = float32_sqrt(s->ZMM_S(3), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_S(4) = float32_sqrt(s->ZMM_S(4), &env->sse_status);
+    d->ZMM_S(5) = float32_sqrt(s->ZMM_S(5), &env->sse_status);
+    d->ZMM_S(6) = float32_sqrt(s->ZMM_S(6), &env->sse_status);
+    d->ZMM_S(7) = float32_sqrt(s->ZMM_S(7), &env->sse_status);
+#endif
+}
+
+void glue(helper_sqrtpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    d->ZMM_D(0) = float64_sqrt(s->ZMM_D(0), &env->sse_status);
+    d->ZMM_D(1) = float64_sqrt(s->ZMM_D(1), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_D(2) = float64_sqrt(s->ZMM_D(2), &env->sse_status);
+    d->ZMM_D(3) = float64_sqrt(s->ZMM_D(3), &env->sse_status);
+#endif
+}
+
+#if SHIFT == 1
+void helper_sqrtss(CPUX86State *env, Reg *d, Reg *s)
+{
+    d->ZMM_S(0) = float32_sqrt(s->ZMM_S(0), &env->sse_status);
+}
+
+void helper_sqrtsd(CPUX86State *env, Reg *d, Reg *s)
+{
+    d->ZMM_D(0) = float64_sqrt(s->ZMM_D(0), &env->sse_status);
+}
+#endif
 
 /* float to float conversions */
-void helper_cvtps2pd(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_cvtps2pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     float32 s0, s1;
 
     s0 = s->ZMM_S(0);
     s1 = s->ZMM_S(1);
+#if SHIFT == 2
+    float32 s2, s3;
+    s2 = s->ZMM_S(2);
+    s3 = s->ZMM_S(3);
+    d->ZMM_D(2) = float32_to_float64(s2, &env->sse_status);
+    d->ZMM_D(3) = float32_to_float64(s3, &env->sse_status);
+#endif
     d->ZMM_D(0) = float32_to_float64(s0, &env->sse_status);
     d->ZMM_D(1) = float32_to_float64(s1, &env->sse_status);
 }
 
-void helper_cvtpd2ps(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_cvtpd2ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     d->ZMM_S(0) = float64_to_float32(s->ZMM_D(0), &env->sse_status);
     d->ZMM_S(1) = float64_to_float32(s->ZMM_D(1), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_S(2) = float64_to_float32(s->ZMM_D(2), &env->sse_status);
+    d->ZMM_S(3) = float64_to_float32(s->ZMM_D(3), &env->sse_status);
+    d->Q(2) = 0;
+    d->Q(3) = 0;
+#else
     d->Q(1) = 0;
+#endif
 }
 
+#if SHIFT == 1
 void helper_cvtss2sd(CPUX86State *env, Reg *d, Reg *s)
 {
     d->ZMM_D(0) = float32_to_float64(s->ZMM_S(0), &env->sse_status);
@@ -655,26 +877,41 @@ void helper_cvtsd2ss(CPUX86State *env, Reg *d, Reg *s)
 {
     d->ZMM_S(0) = float64_to_float32(s->ZMM_D(0), &env->sse_status);
 }
+#endif
 
 /* integer to float */
-void helper_cvtdq2ps(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_cvtdq2ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     d->ZMM_S(0) = int32_to_float32(s->ZMM_L(0), &env->sse_status);
     d->ZMM_S(1) = int32_to_float32(s->ZMM_L(1), &env->sse_status);
     d->ZMM_S(2) = int32_to_float32(s->ZMM_L(2), &env->sse_status);
     d->ZMM_S(3) = int32_to_float32(s->ZMM_L(3), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_S(4) = int32_to_float32(s->ZMM_L(4), &env->sse_status);
+    d->ZMM_S(5) = int32_to_float32(s->ZMM_L(5), &env->sse_status);
+    d->ZMM_S(6) = int32_to_float32(s->ZMM_L(6), &env->sse_status);
+    d->ZMM_S(7) = int32_to_float32(s->ZMM_L(7), &env->sse_status);
+#endif
 }
 
-void helper_cvtdq2pd(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_cvtdq2pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int32_t l0, l1;
 
     l0 = (int32_t)s->ZMM_L(0);
     l1 = (int32_t)s->ZMM_L(1);
+#if SHIFT == 2
+    int32_t l2, l3;
+    l2 = (int32_t)s->ZMM_L(2);
+    l3 = (int32_t)s->ZMM_L(3);
+    d->ZMM_D(2) = int32_to_float64(l2, &env->sse_status);
+    d->ZMM_D(3) = int32_to_float64(l3, &env->sse_status);
+#endif
     d->ZMM_D(0) = int32_to_float64(l0, &env->sse_status);
     d->ZMM_D(1) = int32_to_float64(l1, &env->sse_status);
 }
 
+#if SHIFT == 1
 void helper_cvtpi2ps(CPUX86State *env, ZMMReg *d, MMXReg *s)
 {
     d->ZMM_S(0) = int32_to_float32(s->MMX_L(0), &env->sse_status);
@@ -709,8 +946,11 @@ void helper_cvtsq2sd(CPUX86State *env, ZMMReg *d, uint64_t val)
 }
 #endif
 
+#endif
+
 /* float to integer */
 
+#if SHIFT == 1
 /*
  * x86 mandates that we return the indefinite integer value for the result
  * of any float-to-integer conversion that raises the 'invalid' exception.
@@ -741,22 +981,37 @@ WRAP_FLOATCONV(int64_t, float32_to_int64, float32, INT64_MIN)
 WRAP_FLOATCONV(int64_t, float32_to_int64_round_to_zero, float32, INT64_MIN)
 WRAP_FLOATCONV(int64_t, float64_to_int64, float64, INT64_MIN)
 WRAP_FLOATCONV(int64_t, float64_to_int64_round_to_zero, float64, INT64_MIN)
+#endif
 
-void helper_cvtps2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_cvtps2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     d->ZMM_L(0) = x86_float32_to_int32(s->ZMM_S(0), &env->sse_status);
     d->ZMM_L(1) = x86_float32_to_int32(s->ZMM_S(1), &env->sse_status);
     d->ZMM_L(2) = x86_float32_to_int32(s->ZMM_S(2), &env->sse_status);
     d->ZMM_L(3) = x86_float32_to_int32(s->ZMM_S(3), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_L(4) = x86_float32_to_int32(s->ZMM_S(4), &env->sse_status);
+    d->ZMM_L(5) = x86_float32_to_int32(s->ZMM_S(5), &env->sse_status);
+    d->ZMM_L(6) = x86_float32_to_int32(s->ZMM_S(6), &env->sse_status);
+    d->ZMM_L(7) = x86_float32_to_int32(s->ZMM_S(7), &env->sse_status);
+#endif
 }
 
-void helper_cvtpd2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_cvtpd2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     d->ZMM_L(0) = x86_float64_to_int32(s->ZMM_D(0), &env->sse_status);
     d->ZMM_L(1) = x86_float64_to_int32(s->ZMM_D(1), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_L(2) = x86_float64_to_int32(s->ZMM_D(2), &env->sse_status);
+    d->ZMM_L(3) = x86_float64_to_int32(s->ZMM_D(3), &env->sse_status);
+    d->Q(2) = 0;
+    d->Q(3) = 0;
+#else
     d->ZMM_Q(1) = 0;
+#endif
 }
 
+#if SHIFT == 1
 void helper_cvtps2pi(CPUX86State *env, MMXReg *d, ZMMReg *s)
 {
     d->MMX_L(0) = x86_float32_to_int32(s->ZMM_S(0), &env->sse_status);
@@ -790,33 +1045,64 @@ int64_t helper_cvtsd2sq(CPUX86State *env, ZMMReg *s)
     return x86_float64_to_int64(s->ZMM_D(0), &env->sse_status);
 }
 #endif
+#endif
 
 /* float to integer truncated */
-void helper_cvttps2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
-{
-    d->ZMM_L(0) = x86_float32_to_int32_round_to_zero(s->ZMM_S(0), &env->sse_status);
-    d->ZMM_L(1) = x86_float32_to_int32_round_to_zero(s->ZMM_S(1), &env->sse_status);
-    d->ZMM_L(2) = x86_float32_to_int32_round_to_zero(s->ZMM_S(2), &env->sse_status);
-    d->ZMM_L(3) = x86_float32_to_int32_round_to_zero(s->ZMM_S(3), &env->sse_status);
+void glue(helper_cvttps2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+{
+    d->ZMM_L(0) = x86_float32_to_int32_round_to_zero(s->ZMM_S(0),
+                                                     &env->sse_status);
+    d->ZMM_L(1) = x86_float32_to_int32_round_to_zero(s->ZMM_S(1),
+                                                     &env->sse_status);
+    d->ZMM_L(2) = x86_float32_to_int32_round_to_zero(s->ZMM_S(2),
+                                                     &env->sse_status);
+    d->ZMM_L(3) = x86_float32_to_int32_round_to_zero(s->ZMM_S(3),
+                                                     &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_L(4) = x86_float32_to_int32_round_to_zero(s->ZMM_S(4),
+                                                     &env->sse_status);
+    d->ZMM_L(5) = x86_float32_to_int32_round_to_zero(s->ZMM_S(5),
+                                                     &env->sse_status);
+    d->ZMM_L(6) = x86_float32_to_int32_round_to_zero(s->ZMM_S(6),
+                                                     &env->sse_status);
+    d->ZMM_L(7) = x86_float32_to_int32_round_to_zero(s->ZMM_S(7),
+                                                     &env->sse_status);
+#endif
 }
 
-void helper_cvttpd2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_cvttpd2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
-    d->ZMM_L(0) = x86_float64_to_int32_round_to_zero(s->ZMM_D(0), &env->sse_status);
-    d->ZMM_L(1) = x86_float64_to_int32_round_to_zero(s->ZMM_D(1), &env->sse_status);
+    d->ZMM_L(0) = x86_float64_to_int32_round_to_zero(s->ZMM_D(0),
+                                                     &env->sse_status);
+    d->ZMM_L(1) = x86_float64_to_int32_round_to_zero(s->ZMM_D(1),
+                                                     &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_L(2) = x86_float64_to_int32_round_to_zero(s->ZMM_D(2),
+                                                     &env->sse_status);
+    d->ZMM_L(3) = x86_float64_to_int32_round_to_zero(s->ZMM_D(3),
+                                                     &env->sse_status);
+    d->ZMM_Q(2) = 0;
+    d->ZMM_Q(3) = 0;
+#else
     d->ZMM_Q(1) = 0;
+#endif
 }
 
+#if SHIFT == 1
 void helper_cvttps2pi(CPUX86State *env, MMXReg *d, ZMMReg *s)
 {
-    d->MMX_L(0) = x86_float32_to_int32_round_to_zero(s->ZMM_S(0), &env->sse_status);
-    d->MMX_L(1) = x86_float32_to_int32_round_to_zero(s->ZMM_S(1), &env->sse_status);
+    d->MMX_L(0) = x86_float32_to_int32_round_to_zero(s->ZMM_S(0),
+                                                     &env->sse_status);
+    d->MMX_L(1) = x86_float32_to_int32_round_to_zero(s->ZMM_S(1),
+                                                     &env->sse_status);
 }
 
 void helper_cvttpd2pi(CPUX86State *env, MMXReg *d, ZMMReg *s)
 {
-    d->MMX_L(0) = x86_float64_to_int32_round_to_zero(s->ZMM_D(0), &env->sse_status);
-    d->MMX_L(1) = x86_float64_to_int32_round_to_zero(s->ZMM_D(1), &env->sse_status);
+    d->MMX_L(0) = x86_float64_to_int32_round_to_zero(s->ZMM_D(0),
+                                                     &env->sse_status);
+    d->MMX_L(1) = x86_float64_to_int32_round_to_zero(s->ZMM_D(1),
+                                                     &env->sse_status);
 }
 
 int32_t helper_cvttss2si(CPUX86State *env, ZMMReg *s)
@@ -840,8 +1126,9 @@ int64_t helper_cvttsd2sq(CPUX86State *env, ZMMReg *s)
     return x86_float64_to_int64_round_to_zero(s->ZMM_D(0), &env->sse_status);
 }
 #endif
+#endif
 
-void helper_rsqrtps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_rsqrtps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
     d->ZMM_S(0) = float32_div(float32_one,
@@ -856,9 +1143,24 @@ void helper_rsqrtps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     d->ZMM_S(3) = float32_div(float32_one,
                               float32_sqrt(s->ZMM_S(3), &env->sse_status),
                               &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_S(4) = float32_div(float32_one,
+                              float32_sqrt(s->ZMM_S(4), &env->sse_status),
+                              &env->sse_status);
+    d->ZMM_S(5) = float32_div(float32_one,
+                              float32_sqrt(s->ZMM_S(5), &env->sse_status),
+                              &env->sse_status);
+    d->ZMM_S(6) = float32_div(float32_one,
+                              float32_sqrt(s->ZMM_S(6), &env->sse_status),
+                              &env->sse_status);
+    d->ZMM_S(7) = float32_div(float32_one,
+                              float32_sqrt(s->ZMM_S(7), &env->sse_status),
+                              &env->sse_status);
+#endif
     set_float_exception_flags(old_flags, &env->sse_status);
 }
 
+#if SHIFT == 1
 void helper_rsqrtss(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
@@ -867,24 +1169,34 @@ void helper_rsqrtss(CPUX86State *env, ZMMReg *d, ZMMReg *s)
                               &env->sse_status);
     set_float_exception_flags(old_flags, &env->sse_status);
 }
+#endif
 
-void helper_rcpps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_rcpps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
     d->ZMM_S(0) = float32_div(float32_one, s->ZMM_S(0), &env->sse_status);
     d->ZMM_S(1) = float32_div(float32_one, s->ZMM_S(1), &env->sse_status);
     d->ZMM_S(2) = float32_div(float32_one, s->ZMM_S(2), &env->sse_status);
     d->ZMM_S(3) = float32_div(float32_one, s->ZMM_S(3), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_S(4) = float32_div(float32_one, s->ZMM_S(4), &env->sse_status);
+    d->ZMM_S(5) = float32_div(float32_one, s->ZMM_S(5), &env->sse_status);
+    d->ZMM_S(6) = float32_div(float32_one, s->ZMM_S(6), &env->sse_status);
+    d->ZMM_S(7) = float32_div(float32_one, s->ZMM_S(7), &env->sse_status);
+#endif
     set_float_exception_flags(old_flags, &env->sse_status);
 }
 
+#if SHIFT == 1
 void helper_rcpss(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
     d->ZMM_S(0) = float32_div(float32_one, s->ZMM_S(0), &env->sse_status);
     set_float_exception_flags(old_flags, &env->sse_status);
 }
+#endif
 
+#if SHIFT == 1
 static inline uint64_t helper_extrq(uint64_t src, int shift, int len)
 {
     uint64_t mask;
@@ -928,113 +1240,213 @@ void helper_insertq_i(CPUX86State *env, ZMMReg *d, int index, int length)
 {
     d->ZMM_Q(0) = helper_insertq(d->ZMM_Q(0), index, length);
 }
+#endif
 
-void helper_haddps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
-{
-    ZMMReg r;
-
-    r.ZMM_S(0) = float32_add(d->ZMM_S(0), d->ZMM_S(1), &env->sse_status);
-    r.ZMM_S(1) = float32_add(d->ZMM_S(2), d->ZMM_S(3), &env->sse_status);
-    r.ZMM_S(2) = float32_add(s->ZMM_S(0), s->ZMM_S(1), &env->sse_status);
-    r.ZMM_S(3) = float32_add(s->ZMM_S(2), s->ZMM_S(3), &env->sse_status);
-    *d = r;
+void glue(helper_haddps, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
+{
+    float32 r0, r1, r2, r3;
+
+    r0 = float32_add(v->ZMM_S(0), v->ZMM_S(1), &env->sse_status);
+    r1 = float32_add(v->ZMM_S(2), v->ZMM_S(3), &env->sse_status);
+    r2 = float32_add(s->ZMM_S(0), s->ZMM_S(1), &env->sse_status);
+    r3 = float32_add(s->ZMM_S(2), s->ZMM_S(3), &env->sse_status);
+    d->ZMM_S(0) = r0;
+    d->ZMM_S(1) = r1;
+    d->ZMM_S(2) = r2;
+    d->ZMM_S(3) = r3;
+#if SHIFT == 2
+    r0 = float32_add(v->ZMM_S(4), v->ZMM_S(5), &env->sse_status);
+    r1 = float32_add(v->ZMM_S(6), v->ZMM_S(7), &env->sse_status);
+    r2 = float32_add(s->ZMM_S(4), s->ZMM_S(5), &env->sse_status);
+    r3 = float32_add(s->ZMM_S(6), s->ZMM_S(7), &env->sse_status);
+    d->ZMM_S(4) = r0;
+    d->ZMM_S(5) = r1;
+    d->ZMM_S(6) = r2;
+    d->ZMM_S(7) = r3;
+#endif
 }
 
-void helper_haddpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_haddpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    ZMMReg r;
+    float64 r0, r1;
 
-    r.ZMM_D(0) = float64_add(d->ZMM_D(0), d->ZMM_D(1), &env->sse_status);
-    r.ZMM_D(1) = float64_add(s->ZMM_D(0), s->ZMM_D(1), &env->sse_status);
-    *d = r;
+    r0 = float64_add(v->ZMM_D(0), v->ZMM_D(1), &env->sse_status);
+    r1 = float64_add(s->ZMM_D(0), s->ZMM_D(1), &env->sse_status);
+    d->ZMM_D(0) = r0;
+    d->ZMM_D(1) = r1;
+#if SHIFT == 2
+    r0 = float64_add(v->ZMM_D(2), v->ZMM_D(3), &env->sse_status);
+    r1 = float64_add(s->ZMM_D(2), s->ZMM_D(3), &env->sse_status);
+    d->ZMM_D(2) = r0;
+    d->ZMM_D(3) = r1;
+#endif
 }
 
-void helper_hsubps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
-{
-    ZMMReg r;
-
-    r.ZMM_S(0) = float32_sub(d->ZMM_S(0), d->ZMM_S(1), &env->sse_status);
-    r.ZMM_S(1) = float32_sub(d->ZMM_S(2), d->ZMM_S(3), &env->sse_status);
-    r.ZMM_S(2) = float32_sub(s->ZMM_S(0), s->ZMM_S(1), &env->sse_status);
-    r.ZMM_S(3) = float32_sub(s->ZMM_S(2), s->ZMM_S(3), &env->sse_status);
-    *d = r;
+void glue(helper_hsubps, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
+{
+    float32 r0, r1, r2, r3;
+
+    r0 = float32_sub(v->ZMM_S(0), v->ZMM_S(1), &env->sse_status);
+    r1 = float32_sub(v->ZMM_S(2), v->ZMM_S(3), &env->sse_status);
+    r2 = float32_sub(s->ZMM_S(0), s->ZMM_S(1), &env->sse_status);
+    r3 = float32_sub(s->ZMM_S(2), s->ZMM_S(3), &env->sse_status);
+    d->ZMM_S(0) = r0;
+    d->ZMM_S(1) = r1;
+    d->ZMM_S(2) = r2;
+    d->ZMM_S(3) = r3;
+#if SHIFT == 2
+    r0 = float32_sub(v->ZMM_S(4), v->ZMM_S(5), &env->sse_status);
+    r1 = float32_sub(v->ZMM_S(6), v->ZMM_S(7), &env->sse_status);
+    r2 = float32_sub(s->ZMM_S(4), s->ZMM_S(5), &env->sse_status);
+    r3 = float32_sub(s->ZMM_S(6), s->ZMM_S(7), &env->sse_status);
+    d->ZMM_S(4) = r0;
+    d->ZMM_S(5) = r1;
+    d->ZMM_S(6) = r2;
+    d->ZMM_S(7) = r3;
+#endif
 }
 
-void helper_hsubpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_hsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    ZMMReg r;
+    float64 r0, r1;
 
-    r.ZMM_D(0) = float64_sub(d->ZMM_D(0), d->ZMM_D(1), &env->sse_status);
-    r.ZMM_D(1) = float64_sub(s->ZMM_D(0), s->ZMM_D(1), &env->sse_status);
-    *d = r;
+    r0 = float64_sub(v->ZMM_D(0), v->ZMM_D(1), &env->sse_status);
+    r1 = float64_sub(s->ZMM_D(0), s->ZMM_D(1), &env->sse_status);
+    d->ZMM_D(0) = r0;
+    d->ZMM_D(1) = r1;
+#if SHIFT == 2
+    r0 = float64_sub(v->ZMM_D(2), v->ZMM_D(3), &env->sse_status);
+    r1 = float64_sub(s->ZMM_D(2), s->ZMM_D(3), &env->sse_status);
+    d->ZMM_D(2) = r0;
+    d->ZMM_D(3) = r1;
+#endif
 }
 
-void helper_addsubps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_addsubps, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    d->ZMM_S(0) = float32_sub(d->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
-    d->ZMM_S(1) = float32_add(d->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
-    d->ZMM_S(2) = float32_sub(d->ZMM_S(2), s->ZMM_S(2), &env->sse_status);
-    d->ZMM_S(3) = float32_add(d->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
+    d->ZMM_S(0) = float32_sub(v->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
+    d->ZMM_S(1) = float32_add(v->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
+    d->ZMM_S(2) = float32_sub(v->ZMM_S(2), s->ZMM_S(2), &env->sse_status);
+    d->ZMM_S(3) = float32_add(v->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_S(4) = float32_sub(v->ZMM_S(4), s->ZMM_S(4), &env->sse_status);
+    d->ZMM_S(5) = float32_add(v->ZMM_S(5), s->ZMM_S(5), &env->sse_status);
+    d->ZMM_S(6) = float32_sub(v->ZMM_S(6), s->ZMM_S(6), &env->sse_status);
+    d->ZMM_S(7) = float32_add(v->ZMM_S(7), s->ZMM_S(7), &env->sse_status);
+#endif
 }
 
-void helper_addsubpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    d->ZMM_D(0) = float64_sub(d->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
-    d->ZMM_D(1) = float64_add(d->ZMM_D(1), s->ZMM_D(1), &env->sse_status);
+    d->ZMM_D(0) = float64_sub(v->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
+    d->ZMM_D(1) = float64_add(v->ZMM_D(1), s->ZMM_D(1), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_D(2) = float64_sub(v->ZMM_D(2), s->ZMM_D(2), &env->sse_status);
+    d->ZMM_D(3) = float64_add(v->ZMM_D(3), s->ZMM_D(3), &env->sse_status);
+#endif
 }
 
-/* XXX: unordered */
-#define SSE_HELPER_CMP(name, F)                                         \
-    void helper_ ## name ## ps(CPUX86State *env, Reg *d, Reg *s)        \
-    {                                                                   \
-        d->ZMM_L(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
-        d->ZMM_L(1) = F(32, d->ZMM_S(1), s->ZMM_S(1));                  \
-        d->ZMM_L(2) = F(32, d->ZMM_S(2), s->ZMM_S(2));                  \
-        d->ZMM_L(3) = F(32, d->ZMM_S(3), s->ZMM_S(3));                  \
-    }                                                                   \
-                                                                        \
-    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *s)        \
-    {                                                                   \
-        d->ZMM_L(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
-    }                                                                   \
-                                                                        \
-    void helper_ ## name ## pd(CPUX86State *env, Reg *d, Reg *s)        \
+#define SSE_HELPER_CMP_P(name, F, C)                                    \
+    void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env,          \
+                                             Reg *d, Reg *v, Reg *s)    \
     {                                                                   \
-        d->ZMM_Q(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
-        d->ZMM_Q(1) = F(64, d->ZMM_D(1), s->ZMM_D(1));                  \
+        d->ZMM_L(0) = F(32, C, v->ZMM_S(0), s->ZMM_S(0));               \
+        d->ZMM_L(1) = F(32, C, v->ZMM_S(1), s->ZMM_S(1));               \
+        d->ZMM_L(2) = F(32, C, v->ZMM_S(2), s->ZMM_S(2));               \
+        d->ZMM_L(3) = F(32, C, v->ZMM_S(3), s->ZMM_S(3));               \
+        YMM_ONLY(                                                       \
+        d->ZMM_L(4) = F(32, C, v->ZMM_S(4), s->ZMM_S(4));               \
+        d->ZMM_L(5) = F(32, C, v->ZMM_S(5), s->ZMM_S(5));               \
+        d->ZMM_L(6) = F(32, C, v->ZMM_S(6), s->ZMM_S(6));               \
+        d->ZMM_L(7) = F(32, C, v->ZMM_S(7), s->ZMM_S(7));               \
+        )                                                               \
     }                                                                   \
                                                                         \
-    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *s)        \
+    void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env,          \
+                                             Reg *d, Reg *v, Reg *s)    \
     {                                                                   \
-        d->ZMM_Q(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
-    }
-
-#define FPU_CMPEQ(size, a, b)                                           \
-    (float ## size ## _eq_quiet(a, b, &env->sse_status) ? -1 : 0)
-#define FPU_CMPLT(size, a, b)                                           \
-    (float ## size ## _lt(a, b, &env->sse_status) ? -1 : 0)
-#define FPU_CMPLE(size, a, b)                                           \
-    (float ## size ## _le(a, b, &env->sse_status) ? -1 : 0)
-#define FPU_CMPUNORD(size, a, b)                                        \
-    (float ## size ## _unordered_quiet(a, b, &env->sse_status) ? -1 : 0)
-#define FPU_CMPNEQ(size, a, b)                                          \
-    (float ## size ## _eq_quiet(a, b, &env->sse_status) ? 0 : -1)
-#define FPU_CMPNLT(size, a, b)                                          \
-    (float ## size ## _lt(a, b, &env->sse_status) ? 0 : -1)
-#define FPU_CMPNLE(size, a, b)                                          \
-    (float ## size ## _le(a, b, &env->sse_status) ? 0 : -1)
-#define FPU_CMPORD(size, a, b)                                          \
-    (float ## size ## _unordered_quiet(a, b, &env->sse_status) ? 0 : -1)
-
-SSE_HELPER_CMP(cmpeq, FPU_CMPEQ)
-SSE_HELPER_CMP(cmplt, FPU_CMPLT)
-SSE_HELPER_CMP(cmple, FPU_CMPLE)
-SSE_HELPER_CMP(cmpunord, FPU_CMPUNORD)
-SSE_HELPER_CMP(cmpneq, FPU_CMPNEQ)
-SSE_HELPER_CMP(cmpnlt, FPU_CMPNLT)
-SSE_HELPER_CMP(cmpnle, FPU_CMPNLE)
-SSE_HELPER_CMP(cmpord, FPU_CMPORD)
+        d->ZMM_Q(0) = F(64, C, v->ZMM_D(0), s->ZMM_D(0));               \
+        d->ZMM_Q(1) = F(64, C, v->ZMM_D(1), s->ZMM_D(1));               \
+        YMM_ONLY(                                                       \
+        d->ZMM_Q(2) = F(64, C, v->ZMM_D(2), s->ZMM_D(2));               \
+        d->ZMM_Q(3) = F(64, C, v->ZMM_D(3), s->ZMM_D(3));               \
+        )                                                               \
+    }
+
+#if SHIFT == 1
+#define SSE_HELPER_CMP(name, F, C)                                          \
+    SSE_HELPER_CMP_P(name, F, C)                                            \
+    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *v, Reg *s)    \
+    {                                                                       \
+        d->ZMM_L(0) = F(32, C, v->ZMM_S(0), s->ZMM_S(0));                   \
+    }                                                                       \
+                                                                            \
+    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *v, Reg *s)    \
+    {                                                                       \
+        d->ZMM_Q(0) = F(64, C, v->ZMM_D(0), s->ZMM_D(0));                   \
+    }
+
+static inline bool FPU_EQU(FloatRelation x)
+{
+    return (x == float_relation_equal || x == float_relation_unordered);
+}
+static inline bool FPU_GE(FloatRelation x)
+{
+    return (x == float_relation_equal || x == float_relation_greater);
+}
+#define FPU_EQ(x) (x == float_relation_equal)
+#define FPU_LT(x) (x == float_relation_less)
+#define FPU_LE(x) (x <= float_relation_equal)
+#define FPU_GT(x) (x == float_relation_greater)
+#define FPU_UNORD(x) (x == float_relation_unordered)
+#define FPU_FALSE(x) 0
+
+#define FPU_CMPQ(size, COND, a, b) \
+    (COND(float ## size ## _compare_quiet(a, b, &env->sse_status)) ? -1 : 0)
+#define FPU_CMPS(size, COND, a, b) \
+    (COND(float ## size ## _compare(a, b, &env->sse_status)) ? -1 : 0)
+
+#else
+#define SSE_HELPER_CMP(name, F, C) SSE_HELPER_CMP_P(name, F, C)
+#endif
 
+SSE_HELPER_CMP(cmpeq, FPU_CMPQ, FPU_EQ)
+SSE_HELPER_CMP(cmplt, FPU_CMPS, FPU_LT)
+SSE_HELPER_CMP(cmple, FPU_CMPS, FPU_LE)
+SSE_HELPER_CMP(cmpunord, FPU_CMPQ,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneq, FPU_CMPQ, !FPU_EQ)
+SSE_HELPER_CMP(cmpnlt, FPU_CMPS, !FPU_LT)
+SSE_HELPER_CMP(cmpnle, FPU_CMPS, !FPU_LE)
+SSE_HELPER_CMP(cmpord, FPU_CMPQ, !FPU_UNORD)
+
+SSE_HELPER_CMP(cmpequ, FPU_CMPQ, FPU_EQU)
+SSE_HELPER_CMP(cmpnge, FPU_CMPS, !FPU_GE)
+SSE_HELPER_CMP(cmpngt, FPU_CMPS, !FPU_GT)
+SSE_HELPER_CMP(cmpfalse, FPU_CMPQ,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequ, FPU_CMPQ, !FPU_EQU)
+SSE_HELPER_CMP(cmpge, FPU_CMPS, FPU_GE)
+SSE_HELPER_CMP(cmpgt, FPU_CMPS, FPU_GT)
+SSE_HELPER_CMP(cmptrue, FPU_CMPQ,  !FPU_FALSE)
+
+SSE_HELPER_CMP(cmpeqs, FPU_CMPS, FPU_EQ)
+SSE_HELPER_CMP(cmpltq, FPU_CMPQ, FPU_LT)
+SSE_HELPER_CMP(cmpleq, FPU_CMPQ, FPU_LE)
+SSE_HELPER_CMP(cmpunords, FPU_CMPS,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneqq, FPU_CMPS, !FPU_EQ)
+SSE_HELPER_CMP(cmpnltq, FPU_CMPQ, !FPU_LT)
+SSE_HELPER_CMP(cmpnleq, FPU_CMPQ, !FPU_LE)
+SSE_HELPER_CMP(cmpords, FPU_CMPS, !FPU_UNORD)
+
+SSE_HELPER_CMP(cmpequs, FPU_CMPS, FPU_EQU)
+SSE_HELPER_CMP(cmpngeq, FPU_CMPQ, !FPU_GE)
+SSE_HELPER_CMP(cmpngtq, FPU_CMPQ, !FPU_GT)
+SSE_HELPER_CMP(cmpfalses, FPU_CMPS,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequs, FPU_CMPS, !FPU_EQU)
+SSE_HELPER_CMP(cmpgeq, FPU_CMPQ, FPU_GE)
+SSE_HELPER_CMP(cmpgtq, FPU_CMPQ, FPU_GT)
+SSE_HELPER_CMP(cmptrues, FPU_CMPS,  !FPU_FALSE)
+
+#if SHIFT == 1
 static const int comis_eflags[4] = {CC_C, CC_Z, 0, CC_Z | CC_P | CC_C};
 
 void helper_ucomiss(CPUX86State *env, Reg *d, Reg *s)
@@ -1080,25 +1492,38 @@ void helper_comisd(CPUX86State *env, Reg *d, Reg *s)
     ret = float64_compare(d0, d1, &env->sse_status);
     CC_SRC = comis_eflags[ret + 1];
 }
+#endif
 
-uint32_t helper_movmskps(CPUX86State *env, Reg *s)
+uint32_t glue(helper_movmskps, SUFFIX)(CPUX86State *env, Reg *s)
 {
-    int b0, b1, b2, b3;
+    uint32_t mask;
 
-    b0 = s->ZMM_L(0) >> 31;
-    b1 = s->ZMM_L(1) >> 31;
-    b2 = s->ZMM_L(2) >> 31;
-    b3 = s->ZMM_L(3) >> 31;
-    return b0 | (b1 << 1) | (b2 << 2) | (b3 << 3);
+    mask = 0;
+    mask |= (s->ZMM_L(0) >> (31 - 0)) & (1 << 0);
+    mask |= (s->ZMM_L(1) >> (31 - 1)) & (1 << 1);
+    mask |= (s->ZMM_L(2) >> (31 - 2)) & (1 << 2);
+    mask |= (s->ZMM_L(3) >> (31 - 3)) & (1 << 3);
+#if SHIFT == 2
+    mask |= (s->ZMM_L(4) >> (31 - 4)) & (1 << 4);
+    mask |= (s->ZMM_L(5) >> (31 - 5)) & (1 << 5);
+    mask |= (s->ZMM_L(6) >> (31 - 6)) & (1 << 6);
+    mask |= (s->ZMM_L(7) >> (31 - 7)) & (1 << 7);
+#endif
+    return mask;
 }
 
-uint32_t helper_movmskpd(CPUX86State *env, Reg *s)
+uint32_t glue(helper_movmskpd, SUFFIX)(CPUX86State *env, Reg *s)
 {
-    int b0, b1;
+    uint32_t mask;
 
-    b0 = s->ZMM_L(1) >> 31;
-    b1 = s->ZMM_L(3) >> 31;
-    return b0 | (b1 << 1);
+    mask = 0;
+    mask |= (s->ZMM_L(1) >> (31 - 0)) & (1 << 0);
+    mask |= (s->ZMM_L(3) >> (31 - 1)) & (1 << 1);
+#if SHIFT == 2
+    mask |= (s->ZMM_L(5) >> (31 - 2)) & (1 << 2);
+    mask |= (s->ZMM_L(7) >> (31 - 3)) & (1 << 3);
+#endif
+    return mask;
 }
 
 #endif
@@ -1116,7 +1541,7 @@ uint32_t glue(helper_pmovmskb, SUFFIX)(CPUX86State *env, Reg *s)
     val |= (s->B(5) >> 2) & 0x20;
     val |= (s->B(6) >> 1) & 0x40;
     val |= (s->B(7)) & 0x80;
-#if SHIFT == 1
+#if SHIFT >= 1
     val |= (s->B(8) << 1) & 0x0100;
     val |= (s->B(9) << 2) & 0x0200;
     val |= (s->B(10) << 3) & 0x0400;
@@ -1125,160 +1550,243 @@ uint32_t glue(helper_pmovmskb, SUFFIX)(CPUX86State *env, Reg *s)
     val |= (s->B(13) << 6) & 0x2000;
     val |= (s->B(14) << 7) & 0x4000;
     val |= (s->B(15) << 8) & 0x8000;
+#if SHIFT == 2
+    val |= ((uint32_t)s->B(16) << 9) & 0x00010000;
+    val |= ((uint32_t)s->B(17) << 10) & 0x00020000;
+    val |= ((uint32_t)s->B(18) << 11) & 0x00040000;
+    val |= ((uint32_t)s->B(19) << 12) & 0x00080000;
+    val |= ((uint32_t)s->B(20) << 13) & 0x00100000;
+    val |= ((uint32_t)s->B(21) << 14) & 0x00200000;
+    val |= ((uint32_t)s->B(22) << 15) & 0x00400000;
+    val |= ((uint32_t)s->B(23) << 16) & 0x00800000;
+    val |= ((uint32_t)s->B(24) << 17) & 0x01000000;
+    val |= ((uint32_t)s->B(25) << 18) & 0x02000000;
+    val |= ((uint32_t)s->B(26) << 19) & 0x04000000;
+    val |= ((uint32_t)s->B(27) << 20) & 0x08000000;
+    val |= ((uint32_t)s->B(28) << 21) & 0x10000000;
+    val |= ((uint32_t)s->B(29) << 22) & 0x20000000;
+    val |= ((uint32_t)s->B(30) << 23) & 0x40000000;
+    val |= ((uint32_t)s->B(31) << 24) & 0x80000000;
+#endif
 #endif
     return val;
 }
 
-void glue(helper_packsswb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    Reg r;
-
-    r.B(0) = satsb((int16_t)d->W(0));
-    r.B(1) = satsb((int16_t)d->W(1));
-    r.B(2) = satsb((int16_t)d->W(2));
-    r.B(3) = satsb((int16_t)d->W(3));
-#if SHIFT == 1
-    r.B(4) = satsb((int16_t)d->W(4));
-    r.B(5) = satsb((int16_t)d->W(5));
-    r.B(6) = satsb((int16_t)d->W(6));
-    r.B(7) = satsb((int16_t)d->W(7));
-#endif
-    r.B((4 << SHIFT) + 0) = satsb((int16_t)s->W(0));
-    r.B((4 << SHIFT) + 1) = satsb((int16_t)s->W(1));
-    r.B((4 << SHIFT) + 2) = satsb((int16_t)s->W(2));
-    r.B((4 << SHIFT) + 3) = satsb((int16_t)s->W(3));
-#if SHIFT == 1
-    r.B(12) = satsb((int16_t)s->W(4));
-    r.B(13) = satsb((int16_t)s->W(5));
-    r.B(14) = satsb((int16_t)s->W(6));
-    r.B(15) = satsb((int16_t)s->W(7));
+#if SHIFT == 0
+#define PACK_WIDTH 4
+#else
+#define PACK_WIDTH 8
 #endif
-    *d = r;
-}
-
-void glue(helper_packuswb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    Reg r;
 
-    r.B(0) = satub((int16_t)d->W(0));
-    r.B(1) = satub((int16_t)d->W(1));
-    r.B(2) = satub((int16_t)d->W(2));
-    r.B(3) = satub((int16_t)d->W(3));
-#if SHIFT == 1
-    r.B(4) = satub((int16_t)d->W(4));
-    r.B(5) = satub((int16_t)d->W(5));
-    r.B(6) = satub((int16_t)d->W(6));
-    r.B(7) = satub((int16_t)d->W(7));
-#endif
-    r.B((4 << SHIFT) + 0) = satub((int16_t)s->W(0));
-    r.B((4 << SHIFT) + 1) = satub((int16_t)s->W(1));
-    r.B((4 << SHIFT) + 2) = satub((int16_t)s->W(2));
-    r.B((4 << SHIFT) + 3) = satub((int16_t)s->W(3));
-#if SHIFT == 1
-    r.B(12) = satub((int16_t)s->W(4));
-    r.B(13) = satub((int16_t)s->W(5));
-    r.B(14) = satub((int16_t)s->W(6));
-    r.B(15) = satub((int16_t)s->W(7));
-#endif
-    *d = r;
+#define PACK4(F, to, reg, from) do {        \
+    r[to + 0] = F((int16_t)reg->W(from + 0));   \
+    r[to + 1] = F((int16_t)reg->W(from + 1));   \
+    r[to + 2] = F((int16_t)reg->W(from + 2));   \
+    r[to + 3] = F((int16_t)reg->W(from + 3));   \
+    } while (0)
+
+#define PACK_HELPER_B(name, F) \
+void glue(helper_pack ## name, SUFFIX)(CPUX86State *env, \
+        Reg *d, Reg *v, Reg *s)                 \
+{                                               \
+    uint8_t r[PACK_WIDTH * 2];                  \
+    int i;                                      \
+    PACK4(F, 0, v, 0);                          \
+    PACK4(F, PACK_WIDTH, s, 0);                 \
+    XMM_ONLY(                                   \
+        PACK4(F, 4, v, 4);                      \
+        PACK4(F, 12, s, 4);                     \
+        )                                       \
+    for (i = 0; i < PACK_WIDTH * 2; i++) {      \
+        d->B(i) = r[i];                         \
+    }                                           \
+    YMM_ONLY(                                   \
+        PACK4(F, 0, v, 8);                      \
+        PACK4(F, 4, v, 12);                     \
+        PACK4(F, 8, s, 8);                      \
+        PACK4(F, 12, s, 12);                    \
+        for (i = 0; i < 16; i++) {              \
+            d->B(i + 16) = r[i];                \
+        }                                       \
+        )                                       \
 }
 
-void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+PACK_HELPER_B(sswb, satsb)
+PACK_HELPER_B(uswb, satub)
+
+void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg r;
+    uint16_t r[PACK_WIDTH];
+    int i;
 
-    r.W(0) = satsw(d->L(0));
-    r.W(1) = satsw(d->L(1));
-#if SHIFT == 1
-    r.W(2) = satsw(d->L(2));
-    r.W(3) = satsw(d->L(3));
+    r[0] = satsw(v->L(0));
+    r[1] = satsw(v->L(1));
+    r[PACK_WIDTH / 2 + 0] = satsw(s->L(0));
+    r[PACK_WIDTH / 2 + 1] = satsw(s->L(1));
+#if SHIFT >= 1
+    r[2] = satsw(v->L(2));
+    r[3] = satsw(v->L(3));
+    r[6] = satsw(s->L(2));
+    r[7] = satsw(s->L(3));
 #endif
-    r.W((2 << SHIFT) + 0) = satsw(s->L(0));
-    r.W((2 << SHIFT) + 1) = satsw(s->L(1));
-#if SHIFT == 1
-    r.W(6) = satsw(s->L(2));
-    r.W(7) = satsw(s->L(3));
+    for (i = 0; i < PACK_WIDTH; i++) {
+        d->W(i) = r[i];
+    }
+#if SHIFT == 2
+    r[0] = satsw(v->L(4));
+    r[1] = satsw(v->L(5));
+    r[2] = satsw(v->L(6));
+    r[3] = satsw(v->L(7));
+    r[4] = satsw(s->L(4));
+    r[5] = satsw(s->L(5));
+    r[6] = satsw(s->L(6));
+    r[7] = satsw(s->L(7));
+    for (i = 0; i < 8; i++) {
+        d->W(i + 8) = r[i];
+    }
 #endif
-    *d = r;
 }
 
 #define UNPCK_OP(base_name, base)                                       \
                                                                         \
     void glue(helper_punpck ## base_name ## bw, SUFFIX)(CPUX86State *env,\
-                                                        Reg *d, Reg *s) \
+                                                Reg *d, Reg *v, Reg *s) \
     {                                                                   \
-        Reg r;                                                          \
+        uint8_t r[PACK_WIDTH * 2];                                      \
+        int i;                                                          \
                                                                         \
-        r.B(0) = d->B((base << (SHIFT + 2)) + 0);                       \
-        r.B(1) = s->B((base << (SHIFT + 2)) + 0);                       \
-        r.B(2) = d->B((base << (SHIFT + 2)) + 1);                       \
-        r.B(3) = s->B((base << (SHIFT + 2)) + 1);                       \
-        r.B(4) = d->B((base << (SHIFT + 2)) + 2);                       \
-        r.B(5) = s->B((base << (SHIFT + 2)) + 2);                       \
-        r.B(6) = d->B((base << (SHIFT + 2)) + 3);                       \
-        r.B(7) = s->B((base << (SHIFT + 2)) + 3);                       \
+        r[0] = v->B((base * PACK_WIDTH) + 0);                           \
+        r[1] = s->B((base * PACK_WIDTH) + 0);                           \
+        r[2] = v->B((base * PACK_WIDTH) + 1);                           \
+        r[3] = s->B((base * PACK_WIDTH) + 1);                           \
+        r[4] = v->B((base * PACK_WIDTH) + 2);                           \
+        r[5] = s->B((base * PACK_WIDTH) + 2);                           \
+        r[6] = v->B((base * PACK_WIDTH) + 3);                           \
+        r[7] = s->B((base * PACK_WIDTH) + 3);                           \
         XMM_ONLY(                                                       \
-                 r.B(8) = d->B((base << (SHIFT + 2)) + 4);              \
-                 r.B(9) = s->B((base << (SHIFT + 2)) + 4);              \
-                 r.B(10) = d->B((base << (SHIFT + 2)) + 5);             \
-                 r.B(11) = s->B((base << (SHIFT + 2)) + 5);             \
-                 r.B(12) = d->B((base << (SHIFT + 2)) + 6);             \
-                 r.B(13) = s->B((base << (SHIFT + 2)) + 6);             \
-                 r.B(14) = d->B((base << (SHIFT + 2)) + 7);             \
-                 r.B(15) = s->B((base << (SHIFT + 2)) + 7);             \
+                 r[8] = v->B((base * PACK_WIDTH) + 4);                  \
+                 r[9] = s->B((base * PACK_WIDTH) + 4);                  \
+                 r[10] = v->B((base * PACK_WIDTH) + 5);                 \
+                 r[11] = s->B((base * PACK_WIDTH) + 5);                 \
+                 r[12] = v->B((base * PACK_WIDTH) + 6);                 \
+                 r[13] = s->B((base * PACK_WIDTH) + 6);                 \
+                 r[14] = v->B((base * PACK_WIDTH) + 7);                 \
+                 r[15] = s->B((base * PACK_WIDTH) + 7);                 \
+                                                                      ) \
+        for (i = 0; i < PACK_WIDTH * 2; i++) {                          \
+            d->B(i) = r[i];                                             \
+        }                                                               \
+        YMM_ONLY(                                                       \
+                r[0] = v->B((base * 8) + 16);                           \
+                r[1] = s->B((base * 8) + 16);                           \
+                r[2] = v->B((base * 8) + 17);                           \
+                r[3] = s->B((base * 8) + 17);                           \
+                r[4] = v->B((base * 8) + 18);                           \
+                r[5] = s->B((base * 8) + 18);                           \
+                r[6] = v->B((base * 8) + 19);                           \
+                r[7] = s->B((base * 8) + 19);                           \
+                r[8] = v->B((base * 8) + 20);                           \
+                r[9] = s->B((base * 8) + 20);                           \
+                r[10] = v->B((base * 8) + 21);                          \
+                r[11] = s->B((base * 8) + 21);                          \
+                r[12] = v->B((base * 8) + 22);                          \
+                r[13] = s->B((base * 8) + 22);                          \
+                r[14] = v->B((base * 8) + 23);                          \
+                r[15] = s->B((base * 8) + 23);                          \
+                for (i = 0; i < PACK_WIDTH * 2; i++) {                  \
+                    d->B(16 + i) = r[i];                                \
+                }                                                       \
                                                                       ) \
-            *d = r;                                                     \
     }                                                                   \
                                                                         \
     void glue(helper_punpck ## base_name ## wd, SUFFIX)(CPUX86State *env,\
-                                                        Reg *d, Reg *s) \
+                                                Reg *d, Reg *v, Reg *s) \
     {                                                                   \
-        Reg r;                                                          \
+        uint16_t r[PACK_WIDTH];                                         \
+        int i;                                                          \
                                                                         \
-        r.W(0) = d->W((base << (SHIFT + 1)) + 0);                       \
-        r.W(1) = s->W((base << (SHIFT + 1)) + 0);                       \
-        r.W(2) = d->W((base << (SHIFT + 1)) + 1);                       \
-        r.W(3) = s->W((base << (SHIFT + 1)) + 1);                       \
+        r[0] = v->W((base * (PACK_WIDTH / 2)) + 0);                     \
+        r[1] = s->W((base * (PACK_WIDTH / 2)) + 0);                     \
+        r[2] = v->W((base * (PACK_WIDTH / 2)) + 1);                     \
+        r[3] = s->W((base * (PACK_WIDTH / 2)) + 1);                     \
         XMM_ONLY(                                                       \
-                 r.W(4) = d->W((base << (SHIFT + 1)) + 2);              \
-                 r.W(5) = s->W((base << (SHIFT + 1)) + 2);              \
-                 r.W(6) = d->W((base << (SHIFT + 1)) + 3);              \
-                 r.W(7) = s->W((base << (SHIFT + 1)) + 3);              \
+                 r[4] = v->W((base * 4) + 2);                           \
+                 r[5] = s->W((base * 4) + 2);                           \
+                 r[6] = v->W((base * 4) + 3);                           \
+                 r[7] = s->W((base * 4) + 3);                           \
+                                                                      ) \
+        for (i = 0; i < PACK_WIDTH; i++) {                              \
+            d->W(i) = r[i];                                             \
+        }                                                               \
+        YMM_ONLY(                                                       \
+                r[0] = v->W((base * 4) + 8);                            \
+                r[1] = s->W((base * 4) + 8);                            \
+                r[2] = v->W((base * 4) + 9);                            \
+                r[3] = s->W((base * 4) + 9);                            \
+                r[4] = v->W((base * 4) + 10);                           \
+                r[5] = s->W((base * 4) + 10);                           \
+                r[6] = v->W((base * 4) + 11);                           \
+                r[7] = s->W((base * 4) + 11);                           \
+                for (i = 0; i < PACK_WIDTH; i++) {                      \
+                    d->W(i + 8) = r[i];                                 \
+                }                                                       \
                                                                       ) \
-            *d = r;                                                     \
     }                                                                   \
                                                                         \
     void glue(helper_punpck ## base_name ## dq, SUFFIX)(CPUX86State *env,\
-                                                        Reg *d, Reg *s) \
+                                                Reg *d, Reg *v, Reg *s) \
     {                                                                   \
-        Reg r;                                                          \
+        uint32_t r[4];                                                  \
                                                                         \
-        r.L(0) = d->L((base << SHIFT) + 0);                             \
-        r.L(1) = s->L((base << SHIFT) + 0);                             \
+        r[0] = v->L((base * (PACK_WIDTH / 4)) + 0);                     \
+        r[1] = s->L((base * (PACK_WIDTH / 4)) + 0);                     \
         XMM_ONLY(                                                       \
-                 r.L(2) = d->L((base << SHIFT) + 1);                    \
-                 r.L(3) = s->L((base << SHIFT) + 1);                    \
+                 r[2] = v->L((base * 2) + 1);                           \
+                 r[3] = s->L((base * 2) + 1);                           \
+                 d->L(2) = r[2];                                        \
+                 d->L(3) = r[3];                                        \
+                                                                      ) \
+        d->L(0) = r[0];                                                 \
+        d->L(1) = r[1];                                                 \
+        YMM_ONLY(                                                       \
+                 r[0] = v->L((base * 2) + 4);                           \
+                 r[1] = s->L((base * 2) + 4);                           \
+                 r[2] = v->L((base * 2) + 5);                           \
+                 r[3] = s->L((base * 2) + 5);                           \
+                 d->L(4) = r[0];                                        \
+                 d->L(5) = r[1];                                        \
+                 d->L(6) = r[2];                                        \
+                 d->L(7) = r[3];                                        \
                                                                       ) \
-            *d = r;                                                     \
     }                                                                   \
                                                                         \
     XMM_ONLY(                                                           \
-             void glue(helper_punpck ## base_name ## qdq, SUFFIX)(CPUX86State \
-                                                                  *env, \
-                                                                  Reg *d, \
-                                                                  Reg *s) \
+             void glue(helper_punpck ## base_name ## qdq, SUFFIX)(      \
+                        CPUX86State *env, Reg *d, Reg *v, Reg *s)       \
              {                                                          \
-                 Reg r;                                                 \
+                 uint64_t r[2];                                         \
                                                                         \
-                 r.Q(0) = d->Q(base);                                   \
-                 r.Q(1) = s->Q(base);                                   \
-                 *d = r;                                                \
+                 r[0] = v->Q(base);                                     \
+                 r[1] = s->Q(base);                                     \
+                 d->Q(0) = r[0];                                        \
+                 d->Q(1) = r[1];                                        \
+                 YMM_ONLY(                                              \
+                     r[0] = v->Q(base + 2);                             \
+                     r[1] = s->Q(base + 2);                             \
+                     d->Q(2) = r[0];                                    \
+                     d->Q(3) = r[1];                                    \
+                                                                      ) \
              }                                                          \
                                                                         )
 
 UNPCK_OP(l, 0)
 UNPCK_OP(h, 1)
 
+#undef PACK_WIDTH
+#undef PACK_HELPER_B
+#undef PACK4
+
+
 /* 3DNow! float ops */
 #if SHIFT == 0
 void helper_pi2fd(CPUX86State *env, MMXReg *d, MMXReg *s)
@@ -1429,123 +1937,176 @@ void helper_pswapd(CPUX86State *env, MMXReg *d, MMXReg *s)
 #endif
 
 /* SSSE3 op helpers */
-void glue(helper_pshufb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pshufb, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
     int i;
-    Reg r;
+#if SHIFT == 0
+    uint8_t r[8];
 
-    for (i = 0; i < (8 << SHIFT); i++) {
-        r.B(i) = (s->B(i) & 0x80) ? 0 : (d->B(s->B(i) & ((8 << SHIFT) - 1)));
+    for (i = 0; i < 8; i++) {
+        r[i] = (s->B(i) & 0x80) ? 0 : (v->B(s->B(i) & 7));
     }
+    for (i = 0; i < 8; i++) {
+        d->B(i) = r[i];
+    }
+#else
+    uint8_t r[16];
 
-    *d = r;
+    for (i = 0; i < 16; i++) {
+        r[i] = (s->B(i) & 0x80) ? 0 : (v->B(s->B(i) & 0xf));
+    }
+    for (i = 0; i < 16; i++) {
+        d->B(i) = r[i];
+    }
+#if SHIFT == 2
+    for (i = 0; i < 16; i++) {
+        r[i] = (s->B(i + 16) & 0x80) ? 0 : (v->B((s->B(i + 16) & 0xf) + 16));
+    }
+    for (i = 0; i < 16; i++) {
+        d->B(i + 16) = r[i];
+    }
+#endif
+#endif
 }
 
-void glue(helper_phaddw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
+#if SHIFT == 0
 
-    Reg r;
+#define SSE_HELPER_HW(name, F)  \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
+{                               \
+    uint16_t r[4];               \
+    r[0] = F(v->W(0), v->W(1)); \
+    r[1] = F(v->W(2), v->W(3)); \
+    r[2] = F(s->W(0), s->W(1)); \
+    r[3] = F(s->W(3), s->W(3)); \
+    d->W(0) = r[0];             \
+    d->W(1) = r[1];             \
+    d->W(2) = r[2];             \
+    d->W(3) = r[3];             \
+}
+
+#define SSE_HELPER_HL(name, F)  \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
+{                               \
+    uint32_t r0, r1;             \
+    r0 = F(v->L(0), v->L(1));   \
+    r1 = F(s->L(0), s->L(1));   \
+    d->W(0) = r0;               \
+    d->W(1) = r1;               \
+}
 
-    r.W(0) = (int16_t)d->W(0) + (int16_t)d->W(1);
-    r.W(1) = (int16_t)d->W(2) + (int16_t)d->W(3);
-    XMM_ONLY(r.W(2) = (int16_t)d->W(4) + (int16_t)d->W(5));
-    XMM_ONLY(r.W(3) = (int16_t)d->W(6) + (int16_t)d->W(7));
-    r.W((2 << SHIFT) + 0) = (int16_t)s->W(0) + (int16_t)s->W(1);
-    r.W((2 << SHIFT) + 1) = (int16_t)s->W(2) + (int16_t)s->W(3);
-    XMM_ONLY(r.W(6) = (int16_t)s->W(4) + (int16_t)s->W(5));
-    XMM_ONLY(r.W(7) = (int16_t)s->W(6) + (int16_t)s->W(7));
+#else
 
-    *d = r;
+#define SSE_HELPER_HW(name, F)  \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
+{                                   \
+    int32_t r[8];                   \
+    r[0] = F(v->W(0), v->W(1));     \
+    r[1] = F(v->W(2), v->W(3));     \
+    r[2] = F(v->W(4), v->W(5));     \
+    r[3] = F(v->W(6), v->W(7));     \
+    r[4] = F(s->W(0), s->W(1));     \
+    r[5] = F(s->W(2), s->W(3));     \
+    r[6] = F(s->W(4), s->W(5));     \
+    r[7] = F(s->W(6), s->W(7));     \
+    d->W(0) = r[0];                 \
+    d->W(1) = r[1];                 \
+    d->W(2) = r[2];                 \
+    d->W(3) = r[3];                 \
+    d->W(4) = r[4];                 \
+    d->W(5) = r[5];                 \
+    d->W(6) = r[6];                 \
+    d->W(7) = r[7];                 \
+    YMM_ONLY(                       \
+    r[0] = F(v->W(8), v->W(9));     \
+    r[1] = F(v->W(10), v->W(11));   \
+    r[2] = F(v->W(12), v->W(13));   \
+    r[3] = F(v->W(14), v->W(15));   \
+    r[4] = F(s->W(8), s->W(9));     \
+    r[5] = F(s->W(10), s->W(11));   \
+    r[6] = F(s->W(12), s->W(13));   \
+    r[7] = F(s->W(14), s->W(15));   \
+    d->W(8) = r[0];                 \
+    d->W(9) = r[1];                 \
+    d->W(10) = r[2];                \
+    d->W(11) = r[3];                \
+    d->W(12) = r[4];                \
+    d->W(13) = r[5];                \
+    d->W(14) = r[6];                \
+    d->W(15) = r[7];                \
+    )                               \
+}
+
+#define SSE_HELPER_HL(name, F)  \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
+{                               \
+    int32_t r0, r1, r2, r3;     \
+    r0 = F(v->L(0), v->L(1));   \
+    r1 = F(v->L(2), v->L(3));   \
+    r2 = F(s->L(0), s->L(1));   \
+    r3 = F(s->L(2), s->L(3));   \
+    d->L(0) = r0;               \
+    d->L(1) = r1;               \
+    d->L(2) = r2;               \
+    d->L(3) = r3;               \
+    YMM_ONLY(                   \
+    r0 = F(v->L(4), v->L(5));   \
+    r1 = F(v->L(6), v->L(7));   \
+    r2 = F(s->L(4), s->L(5));   \
+    r3 = F(s->L(6), s->L(7));   \
+    d->L(4) = r0;               \
+    d->L(5) = r1;               \
+    d->L(6) = r2;               \
+    d->L(7) = r3;               \
+    )                           \
 }
-
-void glue(helper_phaddd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    Reg r;
-
-    r.L(0) = (int32_t)d->L(0) + (int32_t)d->L(1);
-    XMM_ONLY(r.L(1) = (int32_t)d->L(2) + (int32_t)d->L(3));
-    r.L((1 << SHIFT) + 0) = (int32_t)s->L(0) + (int32_t)s->L(1);
-    XMM_ONLY(r.L(3) = (int32_t)s->L(2) + (int32_t)s->L(3));
-
-    *d = r;
-}
-
-void glue(helper_phaddsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    Reg r;
-
-    r.W(0) = satsw((int16_t)d->W(0) + (int16_t)d->W(1));
-    r.W(1) = satsw((int16_t)d->W(2) + (int16_t)d->W(3));
-    XMM_ONLY(r.W(2) = satsw((int16_t)d->W(4) + (int16_t)d->W(5)));
-    XMM_ONLY(r.W(3) = satsw((int16_t)d->W(6) + (int16_t)d->W(7)));
-    r.W((2 << SHIFT) + 0) = satsw((int16_t)s->W(0) + (int16_t)s->W(1));
-    r.W((2 << SHIFT) + 1) = satsw((int16_t)s->W(2) + (int16_t)s->W(3));
-    XMM_ONLY(r.W(6) = satsw((int16_t)s->W(4) + (int16_t)s->W(5)));
-    XMM_ONLY(r.W(7) = satsw((int16_t)s->W(6) + (int16_t)s->W(7)));
-
-    *d = r;
-}
-
-void glue(helper_pmaddubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    d->W(0) = satsw((int8_t)s->B(0) * (uint8_t)d->B(0) +
-                    (int8_t)s->B(1) * (uint8_t)d->B(1));
-    d->W(1) = satsw((int8_t)s->B(2) * (uint8_t)d->B(2) +
-                    (int8_t)s->B(3) * (uint8_t)d->B(3));
-    d->W(2) = satsw((int8_t)s->B(4) * (uint8_t)d->B(4) +
-                    (int8_t)s->B(5) * (uint8_t)d->B(5));
-    d->W(3) = satsw((int8_t)s->B(6) * (uint8_t)d->B(6) +
-                    (int8_t)s->B(7) * (uint8_t)d->B(7));
-#if SHIFT == 1
-    d->W(4) = satsw((int8_t)s->B(8) * (uint8_t)d->B(8) +
-                    (int8_t)s->B(9) * (uint8_t)d->B(9));
-    d->W(5) = satsw((int8_t)s->B(10) * (uint8_t)d->B(10) +
-                    (int8_t)s->B(11) * (uint8_t)d->B(11));
-    d->W(6) = satsw((int8_t)s->B(12) * (uint8_t)d->B(12) +
-                    (int8_t)s->B(13) * (uint8_t)d->B(13));
-    d->W(7) = satsw((int8_t)s->B(14) * (uint8_t)d->B(14) +
-                    (int8_t)s->B(15) * (uint8_t)d->B(15));
 #endif
-}
 
-void glue(helper_phsubw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    d->W(0) = (int16_t)d->W(0) - (int16_t)d->W(1);
-    d->W(1) = (int16_t)d->W(2) - (int16_t)d->W(3);
-    XMM_ONLY(d->W(2) = (int16_t)d->W(4) - (int16_t)d->W(5));
-    XMM_ONLY(d->W(3) = (int16_t)d->W(6) - (int16_t)d->W(7));
-    d->W((2 << SHIFT) + 0) = (int16_t)s->W(0) - (int16_t)s->W(1);
-    d->W((2 << SHIFT) + 1) = (int16_t)s->W(2) - (int16_t)s->W(3);
-    XMM_ONLY(d->W(6) = (int16_t)s->W(4) - (int16_t)s->W(5));
-    XMM_ONLY(d->W(7) = (int16_t)s->W(6) - (int16_t)s->W(7));
-}
-
-void glue(helper_phsubd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    d->L(0) = (int32_t)d->L(0) - (int32_t)d->L(1);
-    XMM_ONLY(d->L(1) = (int32_t)d->L(2) - (int32_t)d->L(3));
-    d->L((1 << SHIFT) + 0) = (int32_t)s->L(0) - (int32_t)s->L(1);
-    XMM_ONLY(d->L(3) = (int32_t)s->L(2) - (int32_t)s->L(3));
-}
-
-void glue(helper_phsubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    d->W(0) = satsw((int16_t)d->W(0) - (int16_t)d->W(1));
-    d->W(1) = satsw((int16_t)d->W(2) - (int16_t)d->W(3));
-    XMM_ONLY(d->W(2) = satsw((int16_t)d->W(4) - (int16_t)d->W(5)));
-    XMM_ONLY(d->W(3) = satsw((int16_t)d->W(6) - (int16_t)d->W(7)));
-    d->W((2 << SHIFT) + 0) = satsw((int16_t)s->W(0) - (int16_t)s->W(1));
-    d->W((2 << SHIFT) + 1) = satsw((int16_t)s->W(2) - (int16_t)s->W(3));
-    XMM_ONLY(d->W(6) = satsw((int16_t)s->W(4) - (int16_t)s->W(5)));
-    XMM_ONLY(d->W(7) = satsw((int16_t)s->W(6) - (int16_t)s->W(7)));
+SSE_HELPER_HW(phaddw, FADD)
+SSE_HELPER_HW(phsubw, FSUB)
+SSE_HELPER_HW(phaddsw, FADDSW)
+SSE_HELPER_HW(phsubsw, FSUBSW)
+SSE_HELPER_HL(phaddd, FADD)
+SSE_HELPER_HL(phsubd, FSUB)
+
+#undef SSE_HELPER_HW
+#undef SSE_HELPER_HL
+
+void glue(helper_pmaddubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
+{
+    d->W(0) = satsw((int8_t)s->B(0) * (uint8_t)v->B(0) +
+                    (int8_t)s->B(1) * (uint8_t)v->B(1));
+    d->W(1) = satsw((int8_t)s->B(2) * (uint8_t)v->B(2) +
+                    (int8_t)s->B(3) * (uint8_t)v->B(3));
+    d->W(2) = satsw((int8_t)s->B(4) * (uint8_t)v->B(4) +
+                    (int8_t)s->B(5) * (uint8_t)v->B(5));
+    d->W(3) = satsw((int8_t)s->B(6) * (uint8_t)v->B(6) +
+                    (int8_t)s->B(7) * (uint8_t)v->B(7));
+#if SHIFT >= 1
+    d->W(4) = satsw((int8_t)s->B(8) * (uint8_t)v->B(8) +
+                    (int8_t)s->B(9) * (uint8_t)v->B(9));
+    d->W(5) = satsw((int8_t)s->B(10) * (uint8_t)v->B(10) +
+                    (int8_t)s->B(11) * (uint8_t)v->B(11));
+    d->W(6) = satsw((int8_t)s->B(12) * (uint8_t)v->B(12) +
+                    (int8_t)s->B(13) * (uint8_t)v->B(13));
+    d->W(7) = satsw((int8_t)s->B(14) * (uint8_t)v->B(14) +
+                    (int8_t)s->B(15) * (uint8_t)v->B(15));
+#if SHIFT == 2
+    int i;
+    for (i = 8; i < 16; i++) {
+        d->W(i) = satsw((int8_t)s->B(i * 2) * (uint8_t)v->B(i * 2) +
+                        (int8_t)s->B(i * 2 + 1) * (uint8_t)v->B(i * 2 + 1));
+    }
+#endif
+#endif
 }
 
-#define FABSB(_, x) (x > INT8_MAX  ? -(int8_t)x : x)
-#define FABSW(_, x) (x > INT16_MAX ? -(int16_t)x : x)
-#define FABSL(_, x) (x > INT32_MAX ? -(int32_t)x : x)
-SSE_HELPER_B(helper_pabsb, FABSB)
-SSE_HELPER_W(helper_pabsw, FABSW)
-SSE_HELPER_L(helper_pabsd, FABSL)
+#define FABSB(x) (x > INT8_MAX  ? -(int8_t)x : x)
+#define FABSW(x) (x > INT16_MAX ? -(int16_t)x : x)
+#define FABSL(x) (x > INT32_MAX ? -(int32_t)x : x)
+SSE_HELPER_1(helper_pabsb, B, 8, FABSB)
+SSE_HELPER_1(helper_pabsw, W, 4, FABSW)
+SSE_HELPER_1(helper_pabsd, L, 2, FABSL)
 
 #define FMULHRSW(d, s) (((int16_t) d * (int16_t)s + 0x4000) >> 15)
 SSE_HELPER_W(helper_pmulhrsw, FMULHRSW)
@@ -1557,104 +2118,119 @@ SSE_HELPER_B(helper_psignb, FSIGNB)
 SSE_HELPER_W(helper_psignw, FSIGNW)
 SSE_HELPER_L(helper_psignd, FSIGNL)
 
-void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
                                   int32_t shift)
 {
-    Reg r;
-
     /* XXX could be checked during translation */
-    if (shift >= (16 << SHIFT)) {
-        r.Q(0) = 0;
-        XMM_ONLY(r.Q(1) = 0);
+    if (shift >= (SHIFT ? 32 : 16)) {
+        d->Q(0) = 0;
+        XMM_ONLY(d->Q(1) = 0);
+#if SHIFT == 2
+        d->Q(2) = 0;
+        d->Q(3) = 0;
+#endif
     } else {
         shift <<= 3;
 #define SHR(v, i) (i < 64 && i > -64 ? i > 0 ? v >> (i) : (v << -(i)) : 0)
 #if SHIFT == 0
-        r.Q(0) = SHR(s->Q(0), shift - 0) |
-            SHR(d->Q(0), shift -  64);
+        d->Q(0) = SHR(s->Q(0), shift - 0) |
+            SHR(v->Q(0), shift -  64);
 #else
-        r.Q(0) = SHR(s->Q(0), shift - 0) |
-            SHR(s->Q(1), shift -  64) |
-            SHR(d->Q(0), shift - 128) |
-            SHR(d->Q(1), shift - 192);
-        r.Q(1) = SHR(s->Q(0), shift + 64) |
-            SHR(s->Q(1), shift -   0) |
-            SHR(d->Q(0), shift -  64) |
-            SHR(d->Q(1), shift - 128);
+        uint64_t r0, r1;
+
+        r0 = SHR(s->Q(0), shift - 0) |
+             SHR(s->Q(1), shift -  64) |
+             SHR(v->Q(0), shift - 128) |
+             SHR(v->Q(1), shift - 192);
+        r1 = SHR(s->Q(0), shift + 64) |
+             SHR(s->Q(1), shift -   0) |
+             SHR(v->Q(0), shift -  64) |
+             SHR(v->Q(1), shift - 128);
+        d->Q(0) = r0;
+        d->Q(1) = r1;
+#if SHIFT == 2
+        r0 = SHR(s->Q(2), shift - 0) |
+             SHR(s->Q(3), shift -  64) |
+             SHR(v->Q(2), shift - 128) |
+             SHR(v->Q(3), shift - 192);
+        r1 = SHR(s->Q(2), shift + 64) |
+             SHR(s->Q(3), shift -   0) |
+             SHR(v->Q(2), shift -  64) |
+             SHR(v->Q(3), shift - 128);
+        d->Q(2) = r0;
+        d->Q(3) = r1;
+#endif
 #endif
 #undef SHR
     }
-
-    *d = r;
 }
 
-#define XMM0 (env->xmm_regs[0])
+#if SHIFT >= 1
+
+#define BLEND_V128(elem, num, F, b) do {                                    \
+    d->elem(b + 0) = F(v->elem(b + 0), s->elem(b + 0), m->elem(b + 0));     \
+    d->elem(b + 1) = F(v->elem(b + 1), s->elem(b + 1), m->elem(b + 1));     \
+    if (num > 2) {                                                          \
+        d->elem(b + 2) = F(v->elem(b + 2), s->elem(b + 2), m->elem(b + 2)); \
+        d->elem(b + 3) = F(v->elem(b + 3), s->elem(b + 3), m->elem(b + 3)); \
+    }                                                                       \
+    if (num > 4) {                                                          \
+        d->elem(b + 4) = F(v->elem(b + 4), s->elem(b + 4), m->elem(b + 4)); \
+        d->elem(b + 5) = F(v->elem(b + 5), s->elem(b + 5), m->elem(b + 5)); \
+        d->elem(b + 6) = F(v->elem(b + 6), s->elem(b + 6), m->elem(b + 6)); \
+        d->elem(b + 7) = F(v->elem(b + 7), s->elem(b + 7), m->elem(b + 7)); \
+    }                                                                       \
+    if (num > 8) {                                                          \
+        d->elem(b + 8) = F(v->elem(b + 8), s->elem(b + 8), m->elem(b + 8)); \
+        d->elem(b + 9) = F(v->elem(b + 9), s->elem(b + 9), m->elem(b + 9)); \
+        d->elem(b + 10) = F(v->elem(b + 10), s->elem(b + 10), m->elem(b + 10));\
+        d->elem(b + 11) = F(v->elem(b + 11), s->elem(b + 11), m->elem(b + 11));\
+        d->elem(b + 12) = F(v->elem(b + 12), s->elem(b + 12), m->elem(b + 12));\
+        d->elem(b + 13) = F(v->elem(b + 13), s->elem(b + 13), m->elem(b + 13));\
+        d->elem(b + 14) = F(v->elem(b + 14), s->elem(b + 14), m->elem(b + 14));\
+        d->elem(b + 15) = F(v->elem(b + 15), s->elem(b + 15), m->elem(b + 15));\
+    }                                                                   \
+    } while (0)
 
-#if SHIFT == 1
 #define SSE_HELPER_V(name, elem, num, F)                                \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)           \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,   \
+                            Reg *m)                                     \
     {                                                                   \
-        d->elem(0) = F(d->elem(0), s->elem(0), XMM0.elem(0));           \
-        d->elem(1) = F(d->elem(1), s->elem(1), XMM0.elem(1));           \
-        if (num > 2) {                                                  \
-            d->elem(2) = F(d->elem(2), s->elem(2), XMM0.elem(2));       \
-            d->elem(3) = F(d->elem(3), s->elem(3), XMM0.elem(3));       \
-            if (num > 4) {                                              \
-                d->elem(4) = F(d->elem(4), s->elem(4), XMM0.elem(4));   \
-                d->elem(5) = F(d->elem(5), s->elem(5), XMM0.elem(5));   \
-                d->elem(6) = F(d->elem(6), s->elem(6), XMM0.elem(6));   \
-                d->elem(7) = F(d->elem(7), s->elem(7), XMM0.elem(7));   \
-                if (num > 8) {                                          \
-                    d->elem(8) = F(d->elem(8), s->elem(8), XMM0.elem(8)); \
-                    d->elem(9) = F(d->elem(9), s->elem(9), XMM0.elem(9)); \
-                    d->elem(10) = F(d->elem(10), s->elem(10), XMM0.elem(10)); \
-                    d->elem(11) = F(d->elem(11), s->elem(11), XMM0.elem(11)); \
-                    d->elem(12) = F(d->elem(12), s->elem(12), XMM0.elem(12)); \
-                    d->elem(13) = F(d->elem(13), s->elem(13), XMM0.elem(13)); \
-                    d->elem(14) = F(d->elem(14), s->elem(14), XMM0.elem(14)); \
-                    d->elem(15) = F(d->elem(15), s->elem(15), XMM0.elem(15)); \
-                }                                                       \
-            }                                                           \
-        }                                                               \
-    }
+        BLEND_V128(elem, num, F, 0);                                    \
+        YMM_ONLY(BLEND_V128(elem, num, F, num);)                        \
+    }
+
+#define BLEND_I128(elem, num, F, b) do {                                    \
+    d->elem(b + 0) = F(v->elem(b + 0), s->elem(b + 0), ((imm >> 0) & 1));   \
+    d->elem(b + 1) = F(v->elem(b + 1), s->elem(b + 1), ((imm >> 1) & 1));   \
+    if (num > 2) {                                                          \
+        d->elem(b + 2) = F(v->elem(b + 2), s->elem(b + 2), ((imm >> 2) & 1)); \
+        d->elem(b + 3) = F(v->elem(b + 3), s->elem(b + 3), ((imm >> 3) & 1)); \
+    }                                                                       \
+    if (num > 4) {                                                          \
+        d->elem(b + 4) = F(v->elem(b + 4), s->elem(b + 4), ((imm >> 4) & 1)); \
+        d->elem(b + 5) = F(v->elem(b + 5), s->elem(b + 5), ((imm >> 5) & 1)); \
+        d->elem(b + 6) = F(v->elem(b + 6), s->elem(b + 6), ((imm >> 6) & 1)); \
+        d->elem(b + 7) = F(v->elem(b + 7), s->elem(b + 7), ((imm >> 7) & 1)); \
+    }                                                                       \
+    } while (0)
 
 #define SSE_HELPER_I(name, elem, num, F)                                \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t imm) \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,   \
+                            uint32_t imm)                               \
     {                                                                   \
-        d->elem(0) = F(d->elem(0), s->elem(0), ((imm >> 0) & 1));       \
-        d->elem(1) = F(d->elem(1), s->elem(1), ((imm >> 1) & 1));       \
-        if (num > 2) {                                                  \
-            d->elem(2) = F(d->elem(2), s->elem(2), ((imm >> 2) & 1));   \
-            d->elem(3) = F(d->elem(3), s->elem(3), ((imm >> 3) & 1));   \
-            if (num > 4) {                                              \
-                d->elem(4) = F(d->elem(4), s->elem(4), ((imm >> 4) & 1)); \
-                d->elem(5) = F(d->elem(5), s->elem(5), ((imm >> 5) & 1)); \
-                d->elem(6) = F(d->elem(6), s->elem(6), ((imm >> 6) & 1)); \
-                d->elem(7) = F(d->elem(7), s->elem(7), ((imm >> 7) & 1)); \
-                if (num > 8) {                                          \
-                    d->elem(8) = F(d->elem(8), s->elem(8), ((imm >> 8) & 1)); \
-                    d->elem(9) = F(d->elem(9), s->elem(9), ((imm >> 9) & 1)); \
-                    d->elem(10) = F(d->elem(10), s->elem(10),           \
-                                    ((imm >> 10) & 1));                 \
-                    d->elem(11) = F(d->elem(11), s->elem(11),           \
-                                    ((imm >> 11) & 1));                 \
-                    d->elem(12) = F(d->elem(12), s->elem(12),           \
-                                    ((imm >> 12) & 1));                 \
-                    d->elem(13) = F(d->elem(13), s->elem(13),           \
-                                    ((imm >> 13) & 1));                 \
-                    d->elem(14) = F(d->elem(14), s->elem(14),           \
-                                    ((imm >> 14) & 1));                 \
-                    d->elem(15) = F(d->elem(15), s->elem(15),           \
-                                    ((imm >> 15) & 1));                 \
-                }                                                       \
-            }                                                           \
-        }                                                               \
+        BLEND_I128(elem, num, F, 0);                                    \
+        YMM_ONLY(                                                       \
+        if (num < 8)                                                    \
+            imm >>= num;                                                \
+        BLEND_I128(elem, num, F, num);                                  \
+        )                                                               \
     }
 
 /* SSE4.1 op helpers */
-#define FBLENDVB(d, s, m) ((m & 0x80) ? s : d)
-#define FBLENDVPS(d, s, m) ((m & 0x80000000) ? s : d)
-#define FBLENDVPD(d, s, m) ((m & 0x8000000000000000LL) ? s : d)
+#define FBLENDVB(v, s, m) ((m & 0x80) ? s : v)
+#define FBLENDVPS(v, s, m) ((m & 0x80000000) ? s : v)
+#define FBLENDVPD(v, s, m) ((m & 0x8000000000000000LL) ? s : v)
 SSE_HELPER_V(helper_pblendvb, B, 16, FBLENDVB)
 SSE_HELPER_V(helper_blendvps, L, 4, FBLENDVPS)
 SSE_HELPER_V(helper_blendvpd, Q, 2, FBLENDVPD)
@@ -1664,14 +2240,28 @@ void glue(helper_ptest, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     uint64_t zf = (s->Q(0) &  d->Q(0)) | (s->Q(1) &  d->Q(1));
     uint64_t cf = (s->Q(0) & ~d->Q(0)) | (s->Q(1) & ~d->Q(1));
 
+#if SHIFT == 2
+    zf |= (s->Q(2) &  d->Q(2)) | (s->Q(3) &  d->Q(3));
+    cf |= (s->Q(2) & ~d->Q(2)) | (s->Q(3) & ~d->Q(3));
+#endif
     CC_SRC = (zf ? 0 : CC_Z) | (cf ? 0 : CC_C);
 }
 
 #define SSE_HELPER_F(name, elem, num, F)        \
     void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)     \
     {                                           \
-        if (num > 2) {                          \
-            if (num > 4) {                      \
+        if (num * SHIFT > 2) {                  \
+            if (num * SHIFT > 8) {              \
+                d->elem(15) = F(15);            \
+                d->elem(14) = F(14);            \
+                d->elem(13) = F(13);            \
+                d->elem(12) = F(12);            \
+                d->elem(11) = F(11);            \
+                d->elem(10) = F(10);            \
+                d->elem(9) = F(9);              \
+                d->elem(8) = F(8);              \
+            }                                   \
+            if (num * SHIFT > 4) {              \
                 d->elem(7) = F(7);              \
                 d->elem(6) = F(6);              \
                 d->elem(5) = F(5);              \
@@ -1697,28 +2287,57 @@ SSE_HELPER_F(helper_pmovzxwd, L, 4, s->W)
 SSE_HELPER_F(helper_pmovzxwq, Q, 2, s->W)
 SSE_HELPER_F(helper_pmovzxdq, Q, 2, s->L)
 
-void glue(helper_pmuldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pmuldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    d->Q(0) = (int64_t)(int32_t) d->L(0) * (int32_t) s->L(0);
-    d->Q(1) = (int64_t)(int32_t) d->L(2) * (int32_t) s->L(2);
+    d->Q(0) = (int64_t)(int32_t) v->L(0) * (int32_t) s->L(0);
+    d->Q(1) = (int64_t)(int32_t) v->L(2) * (int32_t) s->L(2);
+#if SHIFT == 2
+    d->Q(2) = (int64_t)(int32_t) v->L(4) * (int32_t) s->L(4);
+    d->Q(3) = (int64_t)(int32_t) v->L(6) * (int32_t) s->L(6);
+#endif
 }
 
 #define FCMPEQQ(d, s) (d == s ? -1 : 0)
 SSE_HELPER_Q(helper_pcmpeqq, FCMPEQQ)
 
-void glue(helper_packusdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    Reg r;
-
-    r.W(0) = satuw((int32_t) d->L(0));
-    r.W(1) = satuw((int32_t) d->L(1));
-    r.W(2) = satuw((int32_t) d->L(2));
-    r.W(3) = satuw((int32_t) d->L(3));
-    r.W(4) = satuw((int32_t) s->L(0));
-    r.W(5) = satuw((int32_t) s->L(1));
-    r.W(6) = satuw((int32_t) s->L(2));
-    r.W(7) = satuw((int32_t) s->L(3));
-    *d = r;
+void glue(helper_packusdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
+{
+    uint16_t r[8];
+
+    r[0] = satuw((int32_t) v->L(0));
+    r[1] = satuw((int32_t) v->L(1));
+    r[2] = satuw((int32_t) v->L(2));
+    r[3] = satuw((int32_t) v->L(3));
+    r[4] = satuw((int32_t) s->L(0));
+    r[5] = satuw((int32_t) s->L(1));
+    r[6] = satuw((int32_t) s->L(2));
+    r[7] = satuw((int32_t) s->L(3));
+    d->W(0) = r[0];
+    d->W(1) = r[1];
+    d->W(2) = r[2];
+    d->W(3) = r[3];
+    d->W(4) = r[4];
+    d->W(5) = r[5];
+    d->W(6) = r[6];
+    d->W(7) = r[7];
+#if SHIFT == 2
+    r[0] = satuw((int32_t) v->L(4));
+    r[1] = satuw((int32_t) v->L(5));
+    r[2] = satuw((int32_t) v->L(6));
+    r[3] = satuw((int32_t) v->L(7));
+    r[4] = satuw((int32_t) s->L(4));
+    r[5] = satuw((int32_t) s->L(5));
+    r[6] = satuw((int32_t) s->L(6));
+    r[7] = satuw((int32_t) s->L(7));
+    d->W(8) = r[0];
+    d->W(9) = r[1];
+    d->W(10) = r[2];
+    d->W(11) = r[3];
+    d->W(12) = r[4];
+    d->W(13) = r[5];
+    d->W(14) = r[6];
+    d->W(15) = r[7];
+#endif
 }
 
 #define FMINSB(d, s) MIN((int8_t)d, (int8_t)s)
@@ -1737,6 +2356,7 @@ SSE_HELPER_L(helper_pmaxud, MAX)
 #define FMULLD(d, s) ((int32_t)d * (int32_t)s)
 SSE_HELPER_L(helper_pmulld, FMULLD)
 
+#if SHIFT == 1
 void glue(helper_phminposuw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int idx = 0;
@@ -1768,6 +2388,7 @@ void glue(helper_phminposuw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     d->L(1) = 0;
     d->Q(1) = 0;
 }
+#endif
 
 void glue(helper_roundps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   uint32_t mode)
@@ -1797,6 +2418,12 @@ void glue(helper_roundps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     d->ZMM_S(1) = float32_round_to_int(s->ZMM_S(1), &env->sse_status);
     d->ZMM_S(2) = float32_round_to_int(s->ZMM_S(2), &env->sse_status);
     d->ZMM_S(3) = float32_round_to_int(s->ZMM_S(3), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_S(4) = float32_round_to_int(s->ZMM_S(4), &env->sse_status);
+    d->ZMM_S(5) = float32_round_to_int(s->ZMM_S(5), &env->sse_status);
+    d->ZMM_S(6) = float32_round_to_int(s->ZMM_S(6), &env->sse_status);
+    d->ZMM_S(7) = float32_round_to_int(s->ZMM_S(7), &env->sse_status);
+#endif
 
     if (mode & (1 << 3) && !(old_flags & float_flag_inexact)) {
         set_float_exception_flags(get_float_exception_flags(&env->sse_status) &
@@ -1832,6 +2459,10 @@ void glue(helper_roundpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 
     d->ZMM_D(0) = float64_round_to_int(s->ZMM_D(0), &env->sse_status);
     d->ZMM_D(1) = float64_round_to_int(s->ZMM_D(1), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_D(2) = float64_round_to_int(s->ZMM_D(2), &env->sse_status);
+    d->ZMM_D(3) = float64_round_to_int(s->ZMM_D(3), &env->sse_status);
+#endif
 
     if (mode & (1 << 3) && !(old_flags & float_flag_inexact)) {
         set_float_exception_flags(get_float_exception_flags(&env->sse_status) &
@@ -1841,7 +2472,8 @@ void glue(helper_roundpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     env->sse_status.float_rounding_mode = prev_rounding_mode;
 }
 
-void glue(helper_roundss, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+#if SHIFT == 1
+void helper_roundss_xmm(CPUX86State *env, Reg *d, Reg *s,
                                   uint32_t mode)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
@@ -1875,7 +2507,7 @@ void glue(helper_roundss, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     env->sse_status.float_rounding_mode = prev_rounding_mode;
 }
 
-void glue(helper_roundsd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+void helper_roundsd_xmm(CPUX86State *env, Reg *d, Reg *s,
                                   uint32_t mode)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
@@ -1908,99 +2540,158 @@ void glue(helper_roundsd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     }
     env->sse_status.float_rounding_mode = prev_rounding_mode;
 }
+#endif
 
-#define FBLENDP(d, s, m) (m ? s : d)
+#define FBLENDP(v, s, m) (m ? s : v)
 SSE_HELPER_I(helper_blendps, L, 4, FBLENDP)
 SSE_HELPER_I(helper_blendpd, Q, 2, FBLENDP)
 SSE_HELPER_I(helper_pblendw, W, 8, FBLENDP)
 
-void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
+void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
+                               uint32_t mask)
 {
-    float32 iresult = float32_zero;
+    float32 prod, iresult, iresult2;
 
+    /*
+     * We must evaluate (A+B)+(C+D), not ((A+B)+C)+D
+     * to correctly round the intermediate results
+     */
     if (mask & (1 << 4)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(0), s->ZMM_S(0),
-                                          &env->sse_status),
-                              &env->sse_status);
+        iresult = float32_mul(v->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
+    } else {
+        iresult = float32_zero;
     }
     if (mask & (1 << 5)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(1), s->ZMM_S(1),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod = float32_mul(v->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
+    } else {
+        prod = float32_zero;
     }
+    iresult = float32_add(iresult, prod, &env->sse_status);
     if (mask & (1 << 6)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(2), s->ZMM_S(2),
-                                          &env->sse_status),
-                              &env->sse_status);
+        iresult2 = float32_mul(v->ZMM_S(2), s->ZMM_S(2), &env->sse_status);
+    } else {
+        iresult2 = float32_zero;
     }
     if (mask & (1 << 7)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(3), s->ZMM_S(3),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod = float32_mul(v->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
+    } else {
+        prod = float32_zero;
     }
+    iresult2 = float32_add(iresult2, prod, &env->sse_status);
+    iresult = float32_add(iresult, iresult2, &env->sse_status);
+
     d->ZMM_S(0) = (mask & (1 << 0)) ? iresult : float32_zero;
     d->ZMM_S(1) = (mask & (1 << 1)) ? iresult : float32_zero;
     d->ZMM_S(2) = (mask & (1 << 2)) ? iresult : float32_zero;
     d->ZMM_S(3) = (mask & (1 << 3)) ? iresult : float32_zero;
+#if SHIFT == 2
+    if (mask & (1 << 4)) {
+        iresult = float32_mul(v->ZMM_S(4), s->ZMM_S(4), &env->sse_status);
+    } else {
+        iresult = float32_zero;
+    }
+    if (mask & (1 << 5)) {
+        prod = float32_mul(v->ZMM_S(5), s->ZMM_S(5), &env->sse_status);
+    } else {
+        prod = float32_zero;
+    }
+    iresult = float32_add(iresult, prod, &env->sse_status);
+    if (mask & (1 << 6)) {
+        iresult2 = float32_mul(v->ZMM_S(6), s->ZMM_S(6), &env->sse_status);
+    } else {
+        iresult2 = float32_zero;
+    }
+    if (mask & (1 << 7)) {
+        prod = float32_mul(v->ZMM_S(7), s->ZMM_S(7), &env->sse_status);
+    } else {
+        prod = float32_zero;
+    }
+    iresult2 = float32_add(iresult2, prod, &env->sse_status);
+    iresult = float32_add(iresult, iresult2, &env->sse_status);
+
+    d->ZMM_S(4) = (mask & (1 << 0)) ? iresult : float32_zero;
+    d->ZMM_S(5) = (mask & (1 << 1)) ? iresult : float32_zero;
+    d->ZMM_S(6) = (mask & (1 << 2)) ? iresult : float32_zero;
+    d->ZMM_S(7) = (mask & (1 << 3)) ? iresult : float32_zero;
+#endif
 }
 
-void glue(helper_dppd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
+#if SHIFT == 1
+/* Oddly, there is no ymm version of dppd */
+void glue(helper_dppd, SUFFIX)(CPUX86State *env,
+                               Reg *d, Reg *v, Reg *s, uint32_t mask)
 {
-    float64 iresult = float64_zero;
+    float64 iresult;
 
     if (mask & (1 << 4)) {
-        iresult = float64_add(iresult,
-                              float64_mul(d->ZMM_D(0), s->ZMM_D(0),
-                                          &env->sse_status),
-                              &env->sse_status);
+        iresult = float64_mul(v->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
+    } else {
+        iresult = float64_zero;
     }
+
     if (mask & (1 << 5)) {
         iresult = float64_add(iresult,
-                              float64_mul(d->ZMM_D(1), s->ZMM_D(1),
+                              float64_mul(v->ZMM_D(1), s->ZMM_D(1),
                                           &env->sse_status),
                               &env->sse_status);
     }
     d->ZMM_D(0) = (mask & (1 << 0)) ? iresult : float64_zero;
     d->ZMM_D(1) = (mask & (1 << 1)) ? iresult : float64_zero;
 }
+#endif
 
-void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
                                   uint32_t offset)
 {
     int s0 = (offset & 3) << 2;
     int d0 = (offset & 4) << 0;
     int i;
-    Reg r;
+    uint16_t r[8];
 
     for (i = 0; i < 8; i++, d0++) {
-        r.W(i) = 0;
-        r.W(i) += abs1(d->B(d0 + 0) - s->B(s0 + 0));
-        r.W(i) += abs1(d->B(d0 + 1) - s->B(s0 + 1));
-        r.W(i) += abs1(d->B(d0 + 2) - s->B(s0 + 2));
-        r.W(i) += abs1(d->B(d0 + 3) - s->B(s0 + 3));
+        r[i] = 0;
+        r[i] += abs1(v->B(d0 + 0) - s->B(s0 + 0));
+        r[i] += abs1(v->B(d0 + 1) - s->B(s0 + 1));
+        r[i] += abs1(v->B(d0 + 2) - s->B(s0 + 2));
+        r[i] += abs1(v->B(d0 + 3) - s->B(s0 + 3));
     }
+    for (i = 0; i < 8; i++) {
+        d->W(i) = r[i];
+    }
+#if SHIFT == 2
+    s0 = ((offset & 0x18) >> 1) + 16;
+    d0 = ((offset & 0x20) >> 3) + 16;
 
-    *d = r;
+    for (i = 0; i < 8; i++, d0++) {
+        r[i] = 0;
+        r[i] += abs1(v->B(d0 + 0) - s->B(s0 + 0));
+        r[i] += abs1(v->B(d0 + 1) - s->B(s0 + 1));
+        r[i] += abs1(v->B(d0 + 2) - s->B(s0 + 2));
+        r[i] += abs1(v->B(d0 + 3) - s->B(s0 + 3));
+    }
+    for (i = 0; i < 8; i++) {
+        d->W(i + 8) = r[i];
+    }
+#endif
 }
 
 /* SSE4.2 op helpers */
 #define FCMPGTQ(d, s) ((int64_t)d > (int64_t)s ? -1 : 0)
 SSE_HELPER_Q(helper_pcmpgtq, FCMPGTQ)
 
+#if SHIFT == 1
 static inline int pcmp_elen(CPUX86State *env, int reg, uint32_t ctrl)
 {
-    int val;
+    int64_t val;
 
     /* Presence of REX.W is indicated by a bit higher than 7 set */
     if (ctrl >> 8) {
-        val = abs1((int64_t)env->regs[reg]);
+        val = env->regs[reg];
     } else {
-        val = abs1((int32_t)env->regs[reg]);
+        val = (int32_t)env->regs[reg];
     }
+    if (val < 0)
+        val = 16;
 
     if (ctrl & 1) {
         if (val > 8) {
@@ -2213,14 +2904,16 @@ target_ulong helper_crc32(uint32_t crc1, target_ulong msg, uint32_t len)
     return crc;
 }
 
-void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
-                                    uint32_t ctrl)
+#endif
+
+#if SHIFT == 1
+static void clmulq(uint64_t *dest_l, uint64_t *dest_h,
+                          uint64_t a, uint64_t b)
 {
-    uint64_t ah, al, b, resh, resl;
+    uint64_t al, ah, resh, resl;
 
     ah = 0;
-    al = d->Q((ctrl & 1) != 0);
-    b = s->Q((ctrl & 16) != 0);
+    al = a;
     resh = resl = 0;
 
     while (b) {
@@ -2233,71 +2926,115 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
         b >>= 1;
     }
 
-    d->Q(0) = resl;
-    d->Q(1) = resh;
+    *dest_l = resl;
+    *dest_h = resh;
 }
+#endif
 
-void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
+                                    uint32_t ctrl)
+{
+    uint64_t a, b;
+
+    a = v->Q((ctrl & 1) != 0);
+    b = s->Q((ctrl & 16) != 0);
+    clmulq(&d->Q(0), &d->Q(1), a, b);
+#if SHIFT == 2
+    a = v->Q(((ctrl & 1) != 0) + 2);
+    b = s->Q(((ctrl & 16) != 0) + 2);
+    clmulq(&d->Q(2), &d->Q(3), a, b);
+#endif
+}
+
+void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
     int i;
-    Reg st = *d;
+    Reg st = *v;
     Reg rk = *s;
 
     for (i = 0 ; i < 4 ; i++) {
-        d->L(i) = rk.L(i) ^ bswap32(AES_Td0[st.B(AES_ishifts[4*i+0])] ^
-                                    AES_Td1[st.B(AES_ishifts[4*i+1])] ^
-                                    AES_Td2[st.B(AES_ishifts[4*i+2])] ^
-                                    AES_Td3[st.B(AES_ishifts[4*i+3])]);
+        d->L(i) = rk.L(i) ^ bswap32(AES_Td0[st.B(AES_ishifts[4 * i + 0])] ^
+                                    AES_Td1[st.B(AES_ishifts[4 * i + 1])] ^
+                                    AES_Td2[st.B(AES_ishifts[4 * i + 2])] ^
+                                    AES_Td3[st.B(AES_ishifts[4 * i + 3])]);
     }
+#if SHIFT == 2
+    for (i = 0 ; i < 4 ; i++) {
+        d->L(i + 4) = rk.L(i + 4) ^ bswap32(
+                AES_Td0[st.B(AES_ishifts[4 * i + 0] + 16)] ^
+                AES_Td1[st.B(AES_ishifts[4 * i + 1] + 16)] ^
+                AES_Td2[st.B(AES_ishifts[4 * i + 2] + 16)] ^
+                AES_Td3[st.B(AES_ishifts[4 * i + 3] + 16)]);
+    }
+#endif
 }
 
-void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
     int i;
-    Reg st = *d;
+    Reg st = *v;
     Reg rk = *s;
 
     for (i = 0; i < 16; i++) {
         d->B(i) = rk.B(i) ^ (AES_isbox[st.B(AES_ishifts[i])]);
     }
+#if SHIFT == 2
+    for (i = 0; i < 16; i++) {
+        d->B(i + 16) = rk.B(i + 16) ^ (AES_isbox[st.B(AES_ishifts[i] + 16)]);
+    }
+#endif
 }
 
-void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
     int i;
-    Reg st = *d;
+    Reg st = *v;
     Reg rk = *s;
 
     for (i = 0 ; i < 4 ; i++) {
-        d->L(i) = rk.L(i) ^ bswap32(AES_Te0[st.B(AES_shifts[4*i+0])] ^
-                                    AES_Te1[st.B(AES_shifts[4*i+1])] ^
-                                    AES_Te2[st.B(AES_shifts[4*i+2])] ^
-                                    AES_Te3[st.B(AES_shifts[4*i+3])]);
+        d->L(i) = rk.L(i) ^ bswap32(AES_Te0[st.B(AES_shifts[4 * i + 0])] ^
+                                    AES_Te1[st.B(AES_shifts[4 * i + 1])] ^
+                                    AES_Te2[st.B(AES_shifts[4 * i + 2])] ^
+                                    AES_Te3[st.B(AES_shifts[4 * i + 3])]);
+    }
+#if SHIFT == 2
+    for (i = 0 ; i < 4 ; i++) {
+        d->L(i + 4) = rk.L(i + 4) ^ bswap32(
+                AES_Te0[st.B(AES_shifts[4 * i + 0] + 16)] ^
+                AES_Te1[st.B(AES_shifts[4 * i + 1] + 16)] ^
+                AES_Te2[st.B(AES_shifts[4 * i + 2] + 16)] ^
+                AES_Te3[st.B(AES_shifts[4 * i + 3] + 16)]);
     }
+#endif
 }
 
-void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
     int i;
-    Reg st = *d;
+    Reg st = *v;
     Reg rk = *s;
 
     for (i = 0; i < 16; i++) {
         d->B(i) = rk.B(i) ^ (AES_sbox[st.B(AES_shifts[i])]);
     }
-
+#if SHIFT == 2
+    for (i = 0; i < 16; i++) {
+        d->B(i + 16) = rk.B(i + 16) ^ (AES_sbox[st.B(AES_shifts[i] + 16)]);
+    }
+#endif
 }
 
+#if SHIFT == 1
 void glue(helper_aesimc, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int i;
     Reg tmp = *s;
 
     for (i = 0 ; i < 4 ; i++) {
-        d->L(i) = bswap32(AES_imc[tmp.B(4*i+0)][0] ^
-                          AES_imc[tmp.B(4*i+1)][1] ^
-                          AES_imc[tmp.B(4*i+2)][2] ^
-                          AES_imc[tmp.B(4*i+3)][3]);
+        d->L(i) = bswap32(AES_imc[tmp.B(4 * i + 0)][0] ^
+                          AES_imc[tmp.B(4 * i + 1)][1] ^
+                          AES_imc[tmp.B(4 * i + 2)][2] ^
+                          AES_imc[tmp.B(4 * i + 3)][3]);
     }
 }
 
@@ -2315,9 +3052,430 @@ void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     d->L(3) = (d->L(2) << 24 | d->L(2) >> 8) ^ ctrl;
 }
 #endif
+#endif
+
+#if SHIFT >= 1
+void glue(helper_vbroadcastb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    uint8_t val = s->B(0);
+    int i;
+
+    for (i = 0; i < 16 * SHIFT; i++) {
+        d->B(i) = val;
+    }
+}
+
+void glue(helper_vbroadcastw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    uint16_t val = s->W(0);
+    int i;
+
+    for (i = 0; i < 8 * SHIFT; i++) {
+        d->W(i) = val;
+    }
+}
+
+void glue(helper_vbroadcastl, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    uint32_t val = s->L(0);
+    int i;
+
+    for (i = 0; i < 8 * SHIFT; i++) {
+        d->L(i) = val;
+    }
+}
+
+void glue(helper_vbroadcastq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    uint64_t val = s->Q(0);
+    d->Q(0) = val;
+    d->Q(1) = val;
+#if SHIFT == 2
+    d->Q(2) = val;
+    d->Q(3) = val;
+#endif
+}
+
+void glue(helper_vpermilpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
+{
+    uint64_t r0, r1;
+
+    r0 = v->Q((s->Q(0) >> 1) & 1);
+    r1 = v->Q((s->Q(1) >> 1) & 1);
+    d->Q(0) = r0;
+    d->Q(1) = r1;
+#if SHIFT == 2
+    r0 = v->Q(((s->Q(2) >> 1) & 1) + 2);
+    r1 = v->Q(((s->Q(3) >> 1) & 1) + 2);
+    d->Q(2) = r0;
+    d->Q(3) = r1;
+#endif
+}
+
+void glue(helper_vpermilps, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
+{
+    uint32_t r0, r1, r2, r3;
+
+    r0 = v->L(s->L(0) & 3);
+    r1 = v->L(s->L(1) & 3);
+    r2 = v->L(s->L(2) & 3);
+    r3 = v->L(s->L(3) & 3);
+    d->L(0) = r0;
+    d->L(1) = r1;
+    d->L(2) = r2;
+    d->L(3) = r3;
+#if SHIFT == 2
+    r0 = v->L((s->L(4) & 3) + 4);
+    r1 = v->L((s->L(5) & 3) + 4);
+    r2 = v->L((s->L(6) & 3) + 4);
+    r3 = v->L((s->L(7) & 3) + 4);
+    d->L(4) = r0;
+    d->L(5) = r1;
+    d->L(6) = r2;
+    d->L(7) = r3;
+#endif
+}
+
+void glue(helper_vpermilpd_imm, SUFFIX)(CPUX86State *env,
+                                        Reg *d, Reg *s, uint32_t order)
+{
+    uint64_t r0, r1;
+
+    r0 = s->Q((order >> 0) & 1);
+    r1 = s->Q((order >> 1) & 1);
+    d->Q(0) = r0;
+    d->Q(1) = r1;
+#if SHIFT == 2
+    r0 = s->Q(((order >> 2) & 1) + 2);
+    r1 = s->Q(((order >> 3) & 1) + 2);
+    d->Q(2) = r0;
+    d->Q(3) = r1;
+#endif
+}
+
+void glue(helper_vpermilps_imm, SUFFIX)(CPUX86State *env,
+                                        Reg *d, Reg *s, uint32_t order)
+{
+    uint32_t r0, r1, r2, r3;
+
+    r0 = s->L((order >> 0) & 3);
+    r1 = s->L((order >> 2) & 3);
+    r2 = s->L((order >> 4) & 3);
+    r3 = s->L((order >> 6) & 3);
+    d->L(0) = r0;
+    d->L(1) = r1;
+    d->L(2) = r2;
+    d->L(3) = r3;
+#if SHIFT == 2
+    r0 = s->L(((order >> 0) & 3) + 4);
+    r1 = s->L(((order >> 2) & 3) + 4);
+    r2 = s->L(((order >> 4) & 3) + 4);
+    r3 = s->L(((order >> 6) & 3) + 4);
+    d->L(4) = r0;
+    d->L(5) = r1;
+    d->L(6) = r2;
+    d->L(7) = r3;
+#endif
+}
+
+#if SHIFT == 1
+#define FPSRLVD(x, c) (c < 32 ? ((x) >> c) : 0)
+#define FPSRLVQ(x, c) (c < 64 ? ((x) >> c) : 0)
+#define FPSRAVD(x, c) ((int32_t)(x) >> (c < 64 ? c : 31))
+#define FPSRAVQ(x, c) ((int64_t)(x) >> (c < 64 ? c : 63))
+#define FPSLLVD(x, c) (c < 32 ? ((x) << c) : 0)
+#define FPSLLVQ(x, c) (c < 64 ? ((x) << c) : 0)
+#endif
+
+SSE_HELPER_L(helper_vpsrlvd, FPSRLVD)
+SSE_HELPER_L(helper_vpsravd, FPSRAVD)
+SSE_HELPER_L(helper_vpsllvd, FPSLLVD)
+
+SSE_HELPER_Q(helper_vpsrlvq, FPSRLVQ)
+SSE_HELPER_Q(helper_vpsravq, FPSRAVQ)
+SSE_HELPER_Q(helper_vpsllvq, FPSLLVQ)
+
+void glue(helper_vtestps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    uint32_t zf = (s->L(0) &  d->L(0)) | (s->L(1) &  d->L(1));
+    uint32_t cf = (s->L(0) & ~d->L(0)) | (s->L(1) & ~d->L(1));
+
+    zf |= (s->L(2) &  d->L(2)) | (s->L(3) &  d->L(3));
+    cf |= (s->L(2) & ~d->L(2)) | (s->L(3) & ~d->L(3));
+#if SHIFT == 2
+    zf |= (s->L(4) &  d->L(4)) | (s->L(5) &  d->L(5));
+    cf |= (s->L(4) & ~d->L(4)) | (s->L(5) & ~d->L(5));
+    zf |= (s->L(6) &  d->L(6)) | (s->L(7) &  d->L(7));
+    cf |= (s->L(6) & ~d->L(6)) | (s->L(7) & ~d->L(7));
+#endif
+    CC_SRC = ((zf >> 31) ? 0 : CC_Z) | ((cf >> 31) ? 0 : CC_C);
+}
+
+void glue(helper_vtestpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    uint64_t zf = (s->Q(0) &  d->Q(0)) | (s->Q(1) &  d->Q(1));
+    uint64_t cf = (s->Q(0) & ~d->Q(0)) | (s->Q(1) & ~d->Q(1));
+
+#if SHIFT == 2
+    zf |= (s->Q(2) &  d->Q(2)) | (s->Q(3) &  d->Q(3));
+    cf |= (s->Q(2) & ~d->Q(2)) | (s->Q(3) & ~d->Q(3));
+#endif
+    CC_SRC = ((zf >> 63) ? 0 : CC_Z) | ((cf >> 63) ? 0 : CC_C);
+}
+
+void glue(helper_vpmaskmovd_st, SUFFIX)(CPUX86State *env,
+                                        Reg *s, Reg *v, target_ulong a0)
+{
+    int i;
+
+    for (i = 0; i < (2 << SHIFT); i++) {
+        if (v->L(i) >> 31) {
+            cpu_stl_data_ra(env, a0 + i * 4, s->L(i), GETPC());
+        }
+    }
+}
+
+void glue(helper_vpmaskmovq_st, SUFFIX)(CPUX86State *env,
+                                        Reg *s, Reg *v, target_ulong a0)
+{
+    int i;
+
+    for (i = 0; i < (1 << SHIFT); i++) {
+        if (v->Q(i) >> 63) {
+            cpu_stq_data_ra(env, a0 + i * 8, s->Q(i), GETPC());
+        }
+    }
+}
+
+void glue(helper_vpmaskmovd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
+{
+    d->L(0) = (v->L(0) >> 31) ? s->L(0) : 0;
+    d->L(1) = (v->L(1) >> 31) ? s->L(1) : 0;
+    d->L(2) = (v->L(2) >> 31) ? s->L(2) : 0;
+    d->L(3) = (v->L(3) >> 31) ? s->L(3) : 0;
+#if SHIFT == 2
+    d->L(4) = (v->L(4) >> 31) ? s->L(4) : 0;
+    d->L(5) = (v->L(5) >> 31) ? s->L(5) : 0;
+    d->L(6) = (v->L(6) >> 31) ? s->L(6) : 0;
+    d->L(7) = (v->L(7) >> 31) ? s->L(7) : 0;
+#endif
+}
+
+void glue(helper_vpmaskmovq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
+{
+    d->Q(0) = (v->Q(0) >> 63) ? s->Q(0) : 0;
+    d->Q(1) = (v->Q(1) >> 63) ? s->Q(1) : 0;
+#if SHIFT == 2
+    d->Q(2) = (v->Q(2) >> 63) ? s->Q(2) : 0;
+    d->Q(3) = (v->Q(3) >> 63) ? s->Q(3) : 0;
+#endif
+}
+
+#define VGATHER_HELPER(scale)                                       \
+void glue(helper_vpgatherdd ## scale, SUFFIX)(CPUX86State *env,     \
+        Reg *d, Reg *v, Reg *s, target_ulong a0)                    \
+{                                                                   \
+    int i;                                                          \
+    for (i = 0; i < (2 << SHIFT); i++) {                            \
+        if (v->L(i) >> 31) {                                        \
+            target_ulong addr = a0                                  \
+                + ((target_ulong)(int32_t)s->L(i) << scale);        \
+            d->L(i) = cpu_ldl_data_ra(env, addr, GETPC());          \
+        }                                                           \
+        v->L(i) = 0;                                                \
+    }                                                               \
+}                                                                   \
+void glue(helper_vpgatherdq ## scale, SUFFIX)(CPUX86State *env,     \
+        Reg *d, Reg *v, Reg *s, target_ulong a0)                    \
+{                                                                   \
+    int i;                                                          \
+    for (i = 0; i < (1 << SHIFT); i++) {                            \
+        if (v->Q(i) >> 63) {                                        \
+            target_ulong addr = a0                                  \
+                + ((target_ulong)(int32_t)s->L(i) << scale);        \
+            d->Q(i) = cpu_ldq_data_ra(env, addr, GETPC());          \
+        }                                                           \
+        v->Q(i) = 0;                                                \
+    }                                                               \
+}                                                                   \
+void glue(helper_vpgatherqd ## scale, SUFFIX)(CPUX86State *env,     \
+        Reg *d, Reg *v, Reg *s, target_ulong a0)                    \
+{                                                                   \
+    int i;                                                          \
+    for (i = 0; i < (1 << SHIFT); i++) {                            \
+        if (v->L(i) >> 31) {                                        \
+            target_ulong addr = a0                                  \
+                + ((target_ulong)(int64_t)s->Q(i) << scale);        \
+            d->L(i) = cpu_ldl_data_ra(env, addr, GETPC());          \
+        }                                                           \
+        v->L(i) = 0;                                                \
+    }                                                               \
+    d->Q(SHIFT) = 0;                                                    \
+    v->Q(SHIFT) = 0;                                                    \
+    YMM_ONLY(                                                       \
+    d->Q(3) = 0;                                                    \
+    v->Q(3) = 0;                                                    \
+    )                                                               \
+}                                                                   \
+void glue(helper_vpgatherqq ## scale, SUFFIX)(CPUX86State *env,     \
+        Reg *d, Reg *v, Reg *s, target_ulong a0)                    \
+{                                                                   \
+    int i;                                                          \
+    for (i = 0; i < (1 << SHIFT); i++) {                            \
+        if (v->Q(i) >> 63) {                                        \
+            target_ulong addr = a0                                  \
+                + ((target_ulong)(int64_t)s->Q(i) << scale);        \
+            d->Q(i) = cpu_ldq_data_ra(env, addr, GETPC());          \
+        }                                                           \
+        v->Q(i) = 0;                                                \
+    }                                                               \
+}
+
+VGATHER_HELPER(0)
+VGATHER_HELPER(1)
+VGATHER_HELPER(2)
+VGATHER_HELPER(3)
+
+#if SHIFT == 2
+void glue(helper_vbroadcastdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    d->Q(0) = s->Q(0);
+    d->Q(1) = s->Q(1);
+    d->Q(2) = s->Q(0);
+    d->Q(3) = s->Q(1);
+}
+
+void helper_vzeroall(CPUX86State *env)
+{
+    int i;
+
+    for (i = 0; i < 8; i++) {
+        env->xmm_regs[i].ZMM_Q(0) = 0;
+        env->xmm_regs[i].ZMM_Q(1) = 0;
+        env->xmm_regs[i].ZMM_Q(2) = 0;
+        env->xmm_regs[i].ZMM_Q(3) = 0;
+    }
+}
+
+void helper_vzeroupper(CPUX86State *env)
+{
+    int i;
+
+    for (i = 0; i < 8; i++) {
+        env->xmm_regs[i].ZMM_Q(2) = 0;
+        env->xmm_regs[i].ZMM_Q(3) = 0;
+    }
+}
+
+#ifdef TARGET_X86_64
+void helper_vzeroall_hi8(CPUX86State *env)
+{
+    int i;
+
+    for (i = 8; i < 16; i++) {
+        env->xmm_regs[i].ZMM_Q(0) = 0;
+        env->xmm_regs[i].ZMM_Q(1) = 0;
+        env->xmm_regs[i].ZMM_Q(2) = 0;
+        env->xmm_regs[i].ZMM_Q(3) = 0;
+    }
+}
+
+void helper_vzeroupper_hi8(CPUX86State *env)
+{
+    int i;
+
+    for (i = 8; i < 16; i++) {
+        env->xmm_regs[i].ZMM_Q(2) = 0;
+        env->xmm_regs[i].ZMM_Q(3) = 0;
+    }
+}
+#endif
+
+void helper_vpermdq_ymm(CPUX86State *env,
+                        Reg *d, Reg *v, Reg *s, uint32_t order)
+{
+    uint64_t r0, r1, r2, r3;
+
+    switch (order & 3) {
+    case 0:
+        r0 = v->Q(0);
+        r1 = v->Q(1);
+        break;
+    case 1:
+        r0 = v->Q(2);
+        r1 = v->Q(3);
+        break;
+    case 2:
+        r0 = s->Q(0);
+        r1 = s->Q(1);
+        break;
+    case 3:
+        r0 = s->Q(2);
+        r1 = s->Q(3);
+        break;
+    }
+    switch ((order >> 4) & 3) {
+    case 0:
+        r2 = v->Q(0);
+        r3 = v->Q(1);
+        break;
+    case 1:
+        r2 = v->Q(2);
+        r3 = v->Q(3);
+        break;
+    case 2:
+        r2 = s->Q(0);
+        r3 = s->Q(1);
+        break;
+    case 3:
+        r2 = s->Q(2);
+        r3 = s->Q(3);
+        break;
+    }
+    d->Q(0) = r0;
+    d->Q(1) = r1;
+    d->Q(2) = r2;
+    d->Q(3) = r3;
+}
+
+void helper_vpermq_ymm(CPUX86State *env, Reg *d, Reg *s, uint32_t order)
+{
+    uint64_t r0, r1, r2, r3;
+    r0 = s->Q(order & 3);
+    r1 = s->Q((order >> 2) & 3);
+    r2 = s->Q((order >> 4) & 3);
+    r3 = s->Q((order >> 6) & 3);
+    d->Q(0) = r0;
+    d->Q(1) = r1;
+    d->Q(2) = r2;
+    d->Q(3) = r3;
+}
+
+void helper_vpermd_ymm(CPUX86State *env, Reg *d, Reg *v, Reg *s)
+{
+    uint32_t r[8];
+    int i;
+
+    for (i = 0; i < 8; i++) {
+        r[i] = s->L(v->L(i) & 7);
+    }
+    for (i = 0; i < 8; i++) {
+        d->L(i) = r[i];
+    }
+}
+
+#endif
+#endif
+
+#undef SHIFT_HELPER_W
+#undef SHIFT_HELPER_L
+#undef SHIFT_HELPER_Q
+#undef SSE_HELPER_S
+#undef SSE_HELPER_CMP
 
 #undef SHIFT
 #undef XMM_ONLY
+#undef YMM_ONLY
 #undef Reg
 #undef B
 #undef W
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index cef28f2aae..83efb8ab41 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -21,7 +21,11 @@
 #define SUFFIX _mmx
 #else
 #define Reg ZMMReg
+#if SHIFT == 1
 #define SUFFIX _xmm
+#else
+#define SUFFIX _ymm
+#endif
 #endif
 
 #define dh_alias_Reg ptr
@@ -34,31 +38,31 @@
 #define dh_typecode_ZMMReg dh_typecode_ptr
 #define dh_typecode_MMXReg dh_typecode_ptr
 
-DEF_HELPER_3(glue(psrlw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psraw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psllw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psrld, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psrad, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pslld, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psrlq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psllq, SUFFIX), void, env, Reg, Reg)
-
-#if SHIFT == 1
-DEF_HELPER_3(glue(psrldq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pslldq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(psrlw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psraw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psllw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psrld, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psrad, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pslld, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psrlq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psllq, SUFFIX), void, env, Reg, Reg, Reg)
+
+#if SHIFT >= 1
+DEF_HELPER_4(glue(psrldq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pslldq, SUFFIX), void, env, Reg, Reg, Reg)
 #endif
 
 #define SSE_HELPER_B(name, F)\
-    DEF_HELPER_3(glue(name, SUFFIX), void, env, Reg, Reg)
+    DEF_HELPER_4(glue(name, SUFFIX), void, env, Reg, Reg, Reg)
 
 #define SSE_HELPER_W(name, F)\
-    DEF_HELPER_3(glue(name, SUFFIX), void, env, Reg, Reg)
+    DEF_HELPER_4(glue(name, SUFFIX), void, env, Reg, Reg, Reg)
 
 #define SSE_HELPER_L(name, F)\
-    DEF_HELPER_3(glue(name, SUFFIX), void, env, Reg, Reg)
+    DEF_HELPER_4(glue(name, SUFFIX), void, env, Reg, Reg, Reg)
 
 #define SSE_HELPER_Q(name, F)\
-    DEF_HELPER_3(glue(name, SUFFIX), void, env, Reg, Reg)
+    DEF_HELPER_4(glue(name, SUFFIX), void, env, Reg, Reg, Reg)
 
 SSE_HELPER_B(paddb, FADD)
 SSE_HELPER_W(paddw, FADD)
@@ -101,7 +105,7 @@ SSE_HELPER_L(pcmpeql, FCMPEQ)
 
 SSE_HELPER_W(pmullw, FMULLW)
 #if SHIFT == 0
-SSE_HELPER_W(pmulhrw, FMULHRW)
+DEF_HELPER_3(glue(pmulhrw, SUFFIX), void, env, Reg, Reg)
 #endif
 SSE_HELPER_W(pmulhuw, FMULHUW)
 SSE_HELPER_W(pmulhw, FMULHW)
@@ -109,11 +113,13 @@ SSE_HELPER_W(pmulhw, FMULHW)
 SSE_HELPER_B(pavgb, FAVG)
 SSE_HELPER_W(pavgw, FAVG)
 
-DEF_HELPER_3(glue(pmuludq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaddwd, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(pmuludq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmaddwd, SUFFIX), void, env, Reg, Reg, Reg)
 
-DEF_HELPER_3(glue(psadbw, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(psadbw, SUFFIX), void, env, Reg, Reg, Reg)
+#if SHIFT < 2
 DEF_HELPER_4(glue(maskmov, SUFFIX), void, env, Reg, Reg, tl)
+#endif
 DEF_HELPER_2(glue(movl_mm_T0, SUFFIX), void, Reg, i32)
 #ifdef TARGET_X86_64
 DEF_HELPER_2(glue(movq_mm_T0, SUFFIX), void, Reg, i64)
@@ -122,38 +128,63 @@ DEF_HELPER_2(glue(movq_mm_T0, SUFFIX), void, Reg, i64)
 #if SHIFT == 0
 DEF_HELPER_3(glue(pshufw, SUFFIX), void, Reg, Reg, int)
 #else
-DEF_HELPER_3(shufps, void, Reg, Reg, int)
-DEF_HELPER_3(shufpd, void, Reg, Reg, int)
 DEF_HELPER_3(glue(pshufd, SUFFIX), void, Reg, Reg, int)
 DEF_HELPER_3(glue(pshuflw, SUFFIX), void, Reg, Reg, int)
 DEF_HELPER_3(glue(pshufhw, SUFFIX), void, Reg, Reg, int)
 #endif
 
-#if SHIFT == 1
+#if SHIFT >= 1
 /* FPU ops */
 /* XXX: not accurate */
 
-#define SSE_HELPER_S(name, F)                            \
-    DEF_HELPER_3(name ## ps, void, env, Reg, Reg)        \
-    DEF_HELPER_3(name ## ss, void, env, Reg, Reg)        \
-    DEF_HELPER_3(name ## pd, void, env, Reg, Reg)        \
-    DEF_HELPER_3(name ## sd, void, env, Reg, Reg)
+#define SSE_HELPER_P4(name, ...)                         \
+    DEF_HELPER_4(glue(name ## ps, SUFFIX), __VA_ARGS__) \
+    DEF_HELPER_4(glue(name ## pd, SUFFIX), __VA_ARGS__)
+
+#define SSE_HELPER_P3(name, ...)                         \
+    DEF_HELPER_3(glue(name ## ps, SUFFIX), __VA_ARGS__) \
+    DEF_HELPER_3(glue(name ## pd, SUFFIX), __VA_ARGS__)
+
+#if SHIFT == 1
+#define SSE_HELPER_S4(name, ...)             \
+    SSE_HELPER_P4(name, __VA_ARGS__)         \
+    DEF_HELPER_4(name ## ss, __VA_ARGS__)   \
+    DEF_HELPER_4(name ## sd, __VA_ARGS__)
+#define SSE_HELPER_S3(name, ...)             \
+    SSE_HELPER_P3(name, __VA_ARGS__)         \
+    DEF_HELPER_3(name ## ss, __VA_ARGS__)   \
+    DEF_HELPER_3(name ## sd, __VA_ARGS__)
+#else
+#define SSE_HELPER_S4(name, ...) SSE_HELPER_P4(name, __VA_ARGS__)
+#define SSE_HELPER_S3(name, ...) SSE_HELPER_P3(name, __VA_ARGS__)
+#endif
+
+DEF_HELPER_4(glue(shufps, SUFFIX), void, Reg, Reg, Reg, int)
+DEF_HELPER_4(glue(shufpd, SUFFIX), void, Reg, Reg, Reg, int)
+
+SSE_HELPER_S4(add, void, env, Reg, Reg, Reg)
+SSE_HELPER_S4(sub, void, env, Reg, Reg, Reg)
+SSE_HELPER_S4(mul, void, env, Reg, Reg, Reg)
+SSE_HELPER_S4(div, void, env, Reg, Reg, Reg)
+SSE_HELPER_S4(min, void, env, Reg, Reg, Reg)
+SSE_HELPER_S4(max, void, env, Reg, Reg, Reg)
+
+SSE_HELPER_S3(sqrt, void, env, Reg, Reg)
 
-SSE_HELPER_S(add, FPU_ADD)
-SSE_HELPER_S(sub, FPU_SUB)
-SSE_HELPER_S(mul, FPU_MUL)
-SSE_HELPER_S(div, FPU_DIV)
-SSE_HELPER_S(min, FPU_MIN)
-SSE_HELPER_S(max, FPU_MAX)
-SSE_HELPER_S(sqrt, FPU_SQRT)
+DEF_HELPER_3(glue(cvtps2pd, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(cvtpd2ps, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(cvtdq2ps, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(cvtdq2pd, SUFFIX), void, env, Reg, Reg)
 
+DEF_HELPER_3(glue(cvtps2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(cvtpd2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
 
-DEF_HELPER_3(cvtps2pd, void, env, Reg, Reg)
-DEF_HELPER_3(cvtpd2ps, void, env, Reg, Reg)
+DEF_HELPER_3(glue(cvttps2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(cvttpd2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
+
+#if SHIFT == 1
 DEF_HELPER_3(cvtss2sd, void, env, Reg, Reg)
 DEF_HELPER_3(cvtsd2ss, void, env, Reg, Reg)
-DEF_HELPER_3(cvtdq2ps, void, env, Reg, Reg)
-DEF_HELPER_3(cvtdq2pd, void, env, Reg, Reg)
 DEF_HELPER_3(cvtpi2ps, void, env, ZMMReg, MMXReg)
 DEF_HELPER_3(cvtpi2pd, void, env, ZMMReg, MMXReg)
 DEF_HELPER_3(cvtsi2ss, void, env, ZMMReg, i32)
@@ -164,8 +195,6 @@ DEF_HELPER_3(cvtsq2ss, void, env, ZMMReg, i64)
 DEF_HELPER_3(cvtsq2sd, void, env, ZMMReg, i64)
 #endif
 
-DEF_HELPER_3(cvtps2dq, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(cvtpd2dq, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(cvtps2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_3(cvtpd2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_2(cvtss2si, s32, env, ZMMReg)
@@ -175,8 +204,6 @@ DEF_HELPER_2(cvtss2sq, s64, env, ZMMReg)
 DEF_HELPER_2(cvtsd2sq, s64, env, ZMMReg)
 #endif
 
-DEF_HELPER_3(cvttps2dq, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(cvttpd2dq, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(cvttps2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_3(cvttpd2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_2(cvttss2si, s32, env, ZMMReg)
@@ -185,60 +212,88 @@ DEF_HELPER_2(cvttsd2si, s32, env, ZMMReg)
 DEF_HELPER_2(cvttss2sq, s64, env, ZMMReg)
 DEF_HELPER_2(cvttsd2sq, s64, env, ZMMReg)
 #endif
+#endif
 
-DEF_HELPER_3(rsqrtps, void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(rsqrtps, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(rcpps, SUFFIX), void, env, ZMMReg, ZMMReg)
+
+#if SHIFT == 1
 DEF_HELPER_3(rsqrtss, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(rcpps, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(rcpss, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(extrq_r, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_4(extrq_i, void, env, ZMMReg, int, int)
 DEF_HELPER_3(insertq_r, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_4(insertq_i, void, env, ZMMReg, int, int)
-DEF_HELPER_3(haddps, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(haddpd, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(hsubps, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(hsubpd, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(addsubps, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(addsubpd, void, env, ZMMReg, ZMMReg)
-
-#define SSE_HELPER_CMP(name, F)                           \
-    DEF_HELPER_3(name ## ps, void, env, Reg, Reg)         \
-    DEF_HELPER_3(name ## ss, void, env, Reg, Reg)         \
-    DEF_HELPER_3(name ## pd, void, env, Reg, Reg)         \
-    DEF_HELPER_3(name ## sd, void, env, Reg, Reg)
-
-SSE_HELPER_CMP(cmpeq, FPU_CMPEQ)
-SSE_HELPER_CMP(cmplt, FPU_CMPLT)
-SSE_HELPER_CMP(cmple, FPU_CMPLE)
-SSE_HELPER_CMP(cmpunord, FPU_CMPUNORD)
-SSE_HELPER_CMP(cmpneq, FPU_CMPNEQ)
-SSE_HELPER_CMP(cmpnlt, FPU_CMPNLT)
-SSE_HELPER_CMP(cmpnle, FPU_CMPNLE)
-SSE_HELPER_CMP(cmpord, FPU_CMPORD)
+#endif
+
+SSE_HELPER_P4(hadd, void, env, Reg, Reg, Reg)
+SSE_HELPER_P4(hsub, void, env, Reg, Reg, Reg)
+SSE_HELPER_P4(addsub, void, env, Reg, Reg, Reg)
+
+#define SSE_HELPER_CMP(name, F, C) SSE_HELPER_S4(name, void, env, Reg, Reg, Reg)
+
+SSE_HELPER_CMP(cmpeq, FPU_CMPQ, FPU_EQ)
+SSE_HELPER_CMP(cmplt, FPU_CMPS, FPU_LT)
+SSE_HELPER_CMP(cmple, FPU_CMPS, FPU_LE)
+SSE_HELPER_CMP(cmpunord, FPU_CMPQ,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneq, FPU_CMPQ, !FPU_EQ)
+SSE_HELPER_CMP(cmpnlt, FPU_CMPS, !FPU_LT)
+SSE_HELPER_CMP(cmpnle, FPU_CMPS, !FPU_LE)
+SSE_HELPER_CMP(cmpord, FPU_CMPQ, !FPU_UNORD)
+
+SSE_HELPER_CMP(cmpequ, FPU_CMPQ, FPU_EQU)
+SSE_HELPER_CMP(cmpnge, FPU_CMPS, !FPU_GE)
+SSE_HELPER_CMP(cmpngt, FPU_CMPS, !FPU_GT)
+SSE_HELPER_CMP(cmpfalse, FPU_CMPQ,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequ, FPU_CMPQ, FPU_EQU)
+SSE_HELPER_CMP(cmpge, FPU_CMPS, FPU_GE)
+SSE_HELPER_CMP(cmpgt, FPU_CMPS, FPU_GT)
+SSE_HELPER_CMP(cmptrue, FPU_CMPQ,  !FPU_FALSE)
+
+SSE_HELPER_CMP(cmpeqs, FPU_CMPS, FPU_EQ)
+SSE_HELPER_CMP(cmpltq, FPU_CMPQ, FPU_LT)
+SSE_HELPER_CMP(cmpleq, FPU_CMPQ, FPU_LE)
+SSE_HELPER_CMP(cmpunords, FPU_CMPS,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneqq, FPU_CMPS, !FPU_EQ)
+SSE_HELPER_CMP(cmpnltq, FPU_CMPQ, !FPU_LT)
+SSE_HELPER_CMP(cmpnleq, FPU_CMPQ, !FPU_LE)
+SSE_HELPER_CMP(cmpords, FPU_CMPS, !FPU_UNORD)
+
+SSE_HELPER_CMP(cmpequs, FPU_CMPS, FPU_EQU)
+SSE_HELPER_CMP(cmpngeq, FPU_CMPQ, !FPU_GE)
+SSE_HELPER_CMP(cmpngtq, FPU_CMPQ, !FPU_GT)
+SSE_HELPER_CMP(cmpfalses, FPU_CMPS,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequs, FPU_CMPS, FPU_EQU)
+SSE_HELPER_CMP(cmpgeq, FPU_CMPQ, FPU_GE)
+SSE_HELPER_CMP(cmpgtq, FPU_CMPQ, FPU_GT)
+SSE_HELPER_CMP(cmptrues, FPU_CMPS,  !FPU_FALSE)
 
+#if SHIFT == 1
 DEF_HELPER_3(ucomiss, void, env, Reg, Reg)
 DEF_HELPER_3(comiss, void, env, Reg, Reg)
 DEF_HELPER_3(ucomisd, void, env, Reg, Reg)
 DEF_HELPER_3(comisd, void, env, Reg, Reg)
-DEF_HELPER_2(movmskps, i32, env, Reg)
-DEF_HELPER_2(movmskpd, i32, env, Reg)
+#endif
+
+DEF_HELPER_2(glue(movmskps, SUFFIX), i32, env, Reg)
+DEF_HELPER_2(glue(movmskpd, SUFFIX), i32, env, Reg)
 #endif
 
 DEF_HELPER_2(glue(pmovmskb, SUFFIX), i32, env, Reg)
-DEF_HELPER_3(glue(packsswb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(packuswb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(packssdw, SUFFIX), void, env, Reg, Reg)
-#define UNPCK_OP(base_name, base)                                       \
-    DEF_HELPER_3(glue(punpck ## base_name ## bw, SUFFIX), void, env, Reg, Reg) \
-    DEF_HELPER_3(glue(punpck ## base_name ## wd, SUFFIX), void, env, Reg, Reg) \
-    DEF_HELPER_3(glue(punpck ## base_name ## dq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(packsswb, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(packuswb, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(packssdw, SUFFIX), void, env, Reg, Reg, Reg)
+#define UNPCK_OP(name, base)                                       \
+    DEF_HELPER_4(glue(punpck ## name ## bw, SUFFIX), void, env, Reg, Reg, Reg) \
+    DEF_HELPER_4(glue(punpck ## name ## wd, SUFFIX), void, env, Reg, Reg, Reg) \
+    DEF_HELPER_4(glue(punpck ## name ## dq, SUFFIX), void, env, Reg, Reg, Reg)
 
 UNPCK_OP(l, 0)
 UNPCK_OP(h, 1)
 
-#if SHIFT == 1
-DEF_HELPER_3(glue(punpcklqdq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(punpckhqdq, SUFFIX), void, env, Reg, Reg)
+#if SHIFT >= 1
+DEF_HELPER_4(glue(punpcklqdq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(punpckhqdq, SUFFIX), void, env, Reg, Reg, Reg)
 #endif
 
 /* 3DNow! float ops */
@@ -265,28 +320,28 @@ DEF_HELPER_3(pswapd, void, env, MMXReg, MMXReg)
 #endif
 
 /* SSSE3 op helpers */
-DEF_HELPER_3(glue(phaddw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(phaddd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(phaddsw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(phsubw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(phsubd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(phsubsw, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(phaddw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(phaddd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(phaddsw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(phsubw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(phsubd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(phsubsw, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_3(glue(pabsb, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pabsw, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pabsd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaddubsw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmulhrsw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pshufb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psignb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psignw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psignd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_4(glue(palignr, SUFFIX), void, env, Reg, Reg, s32)
+DEF_HELPER_4(glue(pmaddubsw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmulhrsw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pshufb, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psignb, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psignw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psignd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_5(glue(palignr, SUFFIX), void, env, Reg, Reg, Reg, s32)
 
 /* SSE4.1 op helpers */
-#if SHIFT == 1
-DEF_HELPER_3(glue(pblendvb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(blendvps, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(blendvpd, SUFFIX), void, env, Reg, Reg)
+#if SHIFT >= 1
+DEF_HELPER_5(glue(pblendvb, SUFFIX), void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(glue(blendvps, SUFFIX), void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(glue(blendvpd, SUFFIX), void, env, Reg, Reg, Reg, Reg)
 DEF_HELPER_3(glue(ptest, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovsxbw, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovsxbd, SUFFIX), void, env, Reg, Reg)
@@ -300,34 +355,42 @@ DEF_HELPER_3(glue(pmovzxbq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovzxwd, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovzxwq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovzxdq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmuldq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pcmpeqq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(packusdw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pminsb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pminsd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pminuw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pminud, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaxsb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaxsd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaxuw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaxud, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmulld, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(pmuldq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pcmpeqq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(packusdw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pminsb, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pminsd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pminuw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pminud, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmaxsb, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmaxsd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmaxuw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmaxud, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmulld, SUFFIX), void, env, Reg, Reg, Reg)
+#if SHIFT == 1
 DEF_HELPER_3(glue(phminposuw, SUFFIX), void, env, Reg, Reg)
+#endif
 DEF_HELPER_4(glue(roundps, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(roundpd, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_4(glue(roundss, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_4(glue(roundsd, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_4(glue(blendps, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_4(glue(blendpd, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_4(glue(pblendw, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_4(glue(dpps, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_4(glue(dppd, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_4(glue(mpsadbw, SUFFIX), void, env, Reg, Reg, i32)
+#if SHIFT == 1
+DEF_HELPER_4(roundss_xmm, void, env, Reg, Reg, i32)
+DEF_HELPER_4(roundsd_xmm, void, env, Reg, Reg, i32)
+#endif
+DEF_HELPER_5(glue(blendps, SUFFIX), void, env, Reg, Reg, Reg, i32)
+DEF_HELPER_5(glue(blendpd, SUFFIX), void, env, Reg, Reg, Reg, i32)
+DEF_HELPER_5(glue(pblendw, SUFFIX), void, env, Reg, Reg, Reg, i32)
+DEF_HELPER_5(glue(dpps, SUFFIX), void, env, Reg, Reg, Reg, i32)
+#if SHIFT == 1
+DEF_HELPER_5(glue(dppd, SUFFIX), void, env, Reg, Reg, Reg, i32)
+#endif
+DEF_HELPER_5(glue(mpsadbw, SUFFIX), void, env, Reg, Reg, Reg, i32)
 #endif
 
 /* SSE4.2 op helpers */
+#if SHIFT >= 1
+DEF_HELPER_4(glue(pcmpgtq, SUFFIX), void, env, Reg, Reg, Reg)
+#endif
 #if SHIFT == 1
-DEF_HELPER_3(glue(pcmpgtq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_4(glue(pcmpestri, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(pcmpestrm, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(pcmpistri, SUFFIX), void, env, Reg, Reg, i32)
@@ -336,14 +399,68 @@ DEF_HELPER_3(crc32, tl, i32, tl, i32)
 #endif
 
 /* AES-NI op helpers */
+#if SHIFT >= 1
+DEF_HELPER_4(glue(aesdec, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(aesdeclast, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(aesenc, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(aesenclast, SUFFIX), void, env, Reg, Reg, Reg)
 #if SHIFT == 1
-DEF_HELPER_3(glue(aesdec, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(aesdeclast, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(aesenc, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(aesenclast, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(aesimc, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_4(glue(aeskeygenassist, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_4(glue(pclmulqdq, SUFFIX), void, env, Reg, Reg, i32)
+#endif
+DEF_HELPER_5(glue(pclmulqdq, SUFFIX), void, env, Reg, Reg, Reg, i32)
+#endif
+
+/* AVX helpers */
+#if SHIFT >= 1
+DEF_HELPER_3(glue(vbroadcastb, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(vbroadcastw, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(vbroadcastl, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(vbroadcastq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(vpermilpd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpermilps, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpermilpd_imm, SUFFIX), void, env, Reg, Reg, i32)
+DEF_HELPER_4(glue(vpermilps_imm, SUFFIX), void, env, Reg, Reg, i32)
+DEF_HELPER_4(glue(vpsrlvd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpsravd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpsllvd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpsrlvq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpsravq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpsllvq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_3(glue(vtestps, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(vtestpd, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(vpmaskmovd_st, SUFFIX), void, env, Reg, Reg, tl)
+DEF_HELPER_4(glue(vpmaskmovq_st, SUFFIX), void, env, Reg, Reg, tl)
+DEF_HELPER_4(glue(vpmaskmovd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_5(glue(vpgatherdd0, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherdq0, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherqd0, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherqq0, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherdd1, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherdq1, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherqd1, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherqq1, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherdd2, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherdq2, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherqd2, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherqq2, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherdd3, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherdq3, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherqd3, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherqq3, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_4(glue(vpmaskmovq, SUFFIX), void, env, Reg, Reg, Reg)
+#if SHIFT == 2
+DEF_HELPER_3(glue(vbroadcastdq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_1(vzeroall, void, env)
+DEF_HELPER_1(vzeroupper, void, env)
+#ifdef TARGET_X86_64
+DEF_HELPER_1(vzeroall_hi8, void, env)
+DEF_HELPER_1(vzeroupper_hi8, void, env)
+#endif
+DEF_HELPER_5(vpermdq_ymm, void, env, Reg, Reg, Reg, i32)
+DEF_HELPER_4(vpermq_ymm, void, env, Reg, Reg, i32)
+DEF_HELPER_4(vpermd_ymm, void, env, Reg, Reg, Reg)
+#endif
 #endif
 
 #undef SHIFT
@@ -354,6 +471,9 @@ DEF_HELPER_4(glue(pclmulqdq, SUFFIX), void, env, Reg, Reg, i32)
 #undef SSE_HELPER_W
 #undef SSE_HELPER_L
 #undef SSE_HELPER_Q
-#undef SSE_HELPER_S
+#undef SSE_HELPER_S3
+#undef SSE_HELPER_S4
+#undef SSE_HELPER_P3
+#undef SSE_HELPER_P4
 #undef SSE_HELPER_CMP
 #undef UNPCK_OP
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index b391b69635..74cf86c986 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -3053,3 +3053,6 @@ void helper_movq(CPUX86State *env, void *d, void *s)
 
 #define SHIFT 1
 #include "ops_sse.h"
+
+#define SHIFT 2
+#include "ops_sse.h"
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index c393913fe0..f1c7ab4455 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -125,6 +125,7 @@ typedef struct DisasContext {
     TCGv tmp4;
     TCGv_ptr ptr0;
     TCGv_ptr ptr1;
+    TCGv_ptr ptr2;
     TCGv_i32 tmp2_i32;
     TCGv_i32 tmp3_i32;
     TCGv_i64 tmp1_i64;
@@ -2739,6 +2740,29 @@ static inline void gen_ldo_env_A0(DisasContext *s, int offset)
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(1)));
 }
 
+static inline void gen_ldo_env_A0_ymmh(DisasContext *s, int offset)
+{
+    int mem_index = s->mem_index;
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, mem_index, MO_LEUQ);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_addi_tl(s->tmp0, s->A0, 8);
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(3)));
+}
+
+/* Load 256-bit ymm register value */
+static inline void gen_ldy_env_A0(DisasContext *s, int offset)
+{
+    int mem_index = s->mem_index;
+    gen_ldo_env_A0(s, offset);
+    tcg_gen_addi_tl(s->tmp0, s->A0, 16);
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_addi_tl(s->tmp0, s->A0, 24);
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(3)));
+}
+
 static inline void gen_sto_env_A0(DisasContext *s, int offset)
 {
     int mem_index = s->mem_index;
@@ -2749,6 +2773,29 @@ static inline void gen_sto_env_A0(DisasContext *s, int offset)
     tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
 }
 
+static inline void gen_sto_env_A0_ymmh(DisasContext *s, int offset)
+{
+    int mem_index = s->mem_index;
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, mem_index, MO_LEUQ);
+    tcg_gen_addi_tl(s->tmp0, s->A0, 8);
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(3)));
+    tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+}
+
+/* Store 256-bit ymm register value */
+static inline void gen_sty_env_A0(DisasContext *s, int offset)
+{
+    int mem_index = s->mem_index;
+    gen_sto_env_A0(s, offset);
+    tcg_gen_addi_tl(s->tmp0, s->A0, 16);
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+    tcg_gen_addi_tl(s->tmp0, s->A0, 24);
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(3)));
+    tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+}
+
 static inline void gen_op_movo(DisasContext *s, int d_offset, int s_offset)
 {
     tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(0)));
@@ -2757,6 +2804,32 @@ static inline void gen_op_movo(DisasContext *s, int d_offset, int s_offset)
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(1)));
 }
 
+static inline void gen_op_movo_ymmh(DisasContext *s, int d_offset, int s_offset)
+{
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(3)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(3)));
+}
+
+static inline void gen_op_movo_ymm_l2h(DisasContext *s,
+                                       int d_offset, int s_offset)
+{
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(0)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(1)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(3)));
+}
+
+static inline void gen_op_movo_ymm_h2l(DisasContext *s,
+                                       int d_offset, int s_offset)
+{
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(0)));
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(3)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(1)));
+}
+
 static inline void gen_op_movq(DisasContext *s, int d_offset, int s_offset)
 {
     tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset);
@@ -2775,170 +2848,270 @@ static inline void gen_op_movq_env_0(DisasContext *s, int d_offset)
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset);
 }
 
+#define XMM_OFFSET(reg) offsetof(CPUX86State, xmm_regs[reg])
+
+/*
+ * Clear the top half of the ymm register after a VEX.128 instruction
+ * This could be optimized by tracking this in env->hflags
+ */
+static void gen_clear_ymmh(DisasContext *s, int reg)
+{
+    if (s->prefix & PREFIX_VEX) {
+        gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(2)));
+        gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(3)));
+    }
+}
+
+typedef void (*SSEFunc_0_pp)(TCGv_ptr reg_a, TCGv_ptr reg_b);
 typedef void (*SSEFunc_i_ep)(TCGv_i32 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_l_ep)(TCGv_i64 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_0_epi)(TCGv_ptr env, TCGv_ptr reg, TCGv_i32 val);
 typedef void (*SSEFunc_0_epl)(TCGv_ptr env, TCGv_ptr reg, TCGv_i64 val);
 typedef void (*SSEFunc_0_epp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b);
+typedef void (*SSEFunc_0_eppp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                               TCGv_ptr reg_c);
+typedef void (*SSEFunc_0_epppp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                                TCGv_ptr reg_c, TCGv_ptr reg_d);
 typedef void (*SSEFunc_0_eppi)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
                                TCGv_i32 val);
+typedef void (*SSEFunc_0_epppi)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                                TCGv_ptr reg_c, TCGv_i32 val);
 typedef void (*SSEFunc_0_ppi)(TCGv_ptr reg_a, TCGv_ptr reg_b, TCGv_i32 val);
+typedef void (*SSEFunc_0_pppi)(TCGv_ptr reg_a, TCGv_ptr reg_b, TCGv_ptr reg_c,
+                               TCGv_i32 val);
 typedef void (*SSEFunc_0_eppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
                                TCGv val);
+typedef void (*SSEFunc_0_epppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                                TCGv_ptr reg_c, TCGv val);
+
+#define SSE_OPF_V0        (1 << 0) /* vex.v must be 1111b (only 2 operands) */
+#define SSE_OPF_CMP       (1 << 1) /* does not write for first operand */
+#define SSE_OPF_BLENDV    (1 << 2) /* blendv* instruction */
+#define SSE_OPF_SPECIAL   (1 << 3) /* magic */
+#define SSE_OPF_3DNOW     (1 << 4) /* 3DNow! instruction */
+#define SSE_OPF_MMX       (1 << 5) /* MMX/integer/AVX2 instruction */
+#define SSE_OPF_SCALAR    (1 << 6) /* Has SSE scalar variants */
+#define SSE_OPF_AVX2      (1 << 7) /* AVX2 instruction */
+#define SSE_OPF_SHUF      (1 << 9) /* pshufx/shufpx */
+
+#define OP(op, flags, a, b, c, d, e, f, g, h)       \
+    {flags, {{.op = a}, {.op = b}, {.op = c}, {.op = d},    \
+             {.op = e}, {.op = f}, {.op = g}, {.op = h} } }
+
+#define MMX_OP(x) OP(op2, SSE_OPF_MMX, \
+        gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm, NULL, NULL, \
+        NULL, gen_helper_ ## x ## _ymm, NULL, NULL)
+
+#define SSE_FOP(name) OP(op2, SSE_OPF_SCALAR, \
+        gen_helper_##name##ps_xmm, gen_helper_##name##pd_xmm, \
+        gen_helper_##name##ss, gen_helper_##name##sd, \
+        gen_helper_##name##ps_ymm, gen_helper_##name##pd_ymm, NULL, NULL)
+#define SSE_OP(sname, dname, op, flags) OP(op, flags, \
+        gen_helper_##sname##_xmm, gen_helper_##dname##_xmm, NULL, NULL, \
+        gen_helper_##sname##_ymm, gen_helper_##dname##_ymm, NULL, NULL)
+
+struct SSEOpHelper_table1 {
+    int flags;
+    union {
+        SSEFunc_0_epp op1;
+        SSEFunc_0_ppi op1i;
+        SSEFunc_0_eppt op1t;
+        SSEFunc_0_eppp op2;
+        SSEFunc_0_pppi op2i;
+    } fn[8];
+};
 
-#define SSE_SPECIAL ((void *)1)
-#define SSE_DUMMY ((void *)2)
-
-#define MMX_OP2(x) { gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm }
-#define SSE_FOP(x) { gen_helper_ ## x ## ps, gen_helper_ ## x ## pd, \
-                     gen_helper_ ## x ## ss, gen_helper_ ## x ## sd, }
+#define SSE_3DNOW { SSE_OPF_3DNOW }
+#define SSE_SPECIAL { SSE_OPF_SPECIAL }
 
-static const SSEFunc_0_epp sse_op_table1[256][4] = {
+static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     /* 3DNow! extensions */
-    [0x0e] = { SSE_DUMMY }, /* femms */
-    [0x0f] = { SSE_DUMMY }, /* pf... */
+    [0x0e] = SSE_SPECIAL, /* femms */
+    [0x0f] = SSE_3DNOW, /* pf... (sse_op_table5) */
     /* pure SSE operations */
-    [0x10] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movups, movupd, movss, movsd */
-    [0x11] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movups, movupd, movss, movsd */
-    [0x12] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movlps, movlpd, movsldup, movddup */
-    [0x13] = { SSE_SPECIAL, SSE_SPECIAL },  /* movlps, movlpd */
-    [0x14] = { gen_helper_punpckldq_xmm, gen_helper_punpcklqdq_xmm },
-    [0x15] = { gen_helper_punpckhdq_xmm, gen_helper_punpckhqdq_xmm },
-    [0x16] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL },  /* movhps, movhpd, movshdup */
-    [0x17] = { SSE_SPECIAL, SSE_SPECIAL },  /* movhps, movhpd */
-
-    [0x28] = { SSE_SPECIAL, SSE_SPECIAL },  /* movaps, movapd */
-    [0x29] = { SSE_SPECIAL, SSE_SPECIAL },  /* movaps, movapd */
-    [0x2a] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* cvtpi2ps, cvtpi2pd, cvtsi2ss, cvtsi2sd */
-    [0x2b] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movntps, movntpd, movntss, movntsd */
-    [0x2c] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* cvttps2pi, cvttpd2pi, cvttsd2si, cvttss2si */
-    [0x2d] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* cvtps2pi, cvtpd2pi, cvtsd2si, cvtss2si */
-    [0x2e] = { gen_helper_ucomiss, gen_helper_ucomisd },
-    [0x2f] = { gen_helper_comiss, gen_helper_comisd },
-    [0x50] = { SSE_SPECIAL, SSE_SPECIAL }, /* movmskps, movmskpd */
-    [0x51] = SSE_FOP(sqrt),
-    [0x52] = { gen_helper_rsqrtps, NULL, gen_helper_rsqrtss, NULL },
-    [0x53] = { gen_helper_rcpps, NULL, gen_helper_rcpss, NULL },
-    [0x54] = { gen_helper_pand_xmm, gen_helper_pand_xmm }, /* andps, andpd */
-    [0x55] = { gen_helper_pandn_xmm, gen_helper_pandn_xmm }, /* andnps, andnpd */
-    [0x56] = { gen_helper_por_xmm, gen_helper_por_xmm }, /* orps, orpd */
-    [0x57] = { gen_helper_pxor_xmm, gen_helper_pxor_xmm }, /* xorps, xorpd */
+    [0x10] = SSE_SPECIAL, /* movups, movupd, movss, movsd */
+    [0x11] = SSE_SPECIAL, /* movups, movupd, movss, movsd */
+    [0x12] = SSE_SPECIAL, /* movlps, movlpd, movsldup, movddup */
+    [0x13] = SSE_SPECIAL, /* movlps, movlpd */
+    [0x14] = SSE_OP(punpckldq, punpcklqdq, op2, 0), /* unpcklps, unpcklpd */
+    [0x15] = SSE_OP(punpckhdq, punpckhqdq, op2, 0), /* unpckhps, unpckhpd */
+    [0x16] = SSE_SPECIAL, /* movhps, movhpd, movshdup */
+    [0x17] = SSE_SPECIAL, /* movhps, movhpd */
+
+    [0x28] = SSE_SPECIAL, /* movaps, movapd */
+    [0x29] = SSE_SPECIAL, /* movaps, movapd */
+    [0x2a] = SSE_SPECIAL, /* cvtpi2ps, cvtpi2pd, cvtsi2ss, cvtsi2sd */
+    [0x2b] = SSE_SPECIAL, /* movntps, movntpd, movntss, movntsd */
+    [0x2c] = SSE_SPECIAL, /* cvttps2pi, cvttpd2pi, cvttsd2si, cvttss2si */
+    [0x2d] = SSE_SPECIAL, /* cvtps2pi, cvtpd2pi, cvtsd2si, cvtss2si */
+    [0x2e] = OP(op1, SSE_OPF_CMP | SSE_OPF_SCALAR | SSE_OPF_V0,
+            gen_helper_ucomiss, gen_helper_ucomisd, NULL, NULL,
+            NULL, NULL, NULL, NULL),
+    [0x2f] = OP(op1, SSE_OPF_CMP | SSE_OPF_SCALAR | SSE_OPF_V0,
+            gen_helper_comiss, gen_helper_comisd, NULL, NULL,
+            NULL, NULL, NULL, NULL),
+    [0x50] = SSE_SPECIAL, /* movmskps, movmskpd */
+    [0x51] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
+                gen_helper_sqrtps_xmm, gen_helper_sqrtpd_xmm,
+                gen_helper_sqrtss, gen_helper_sqrtsd,
+                gen_helper_sqrtps_ymm, gen_helper_sqrtpd_ymm, NULL, NULL),
+    [0x52] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
+                gen_helper_rsqrtps_xmm, NULL, gen_helper_rsqrtss, NULL,
+                gen_helper_rsqrtps_ymm, NULL, NULL, NULL),
+    [0x53] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
+                gen_helper_rcpps_xmm, NULL, gen_helper_rcpss, NULL,
+                gen_helper_rcpps_ymm, NULL, NULL, NULL),
+    [0x54] = SSE_OP(pand, pand, op2, 0), /* andps, andpd */
+    [0x55] = SSE_OP(pandn, pandn, op2, 0), /* andnps, andnpd */
+    [0x56] = SSE_OP(por, por, op2, 0), /* orps, orpd */
+    [0x57] = SSE_OP(pxor, pxor, op2, 0), /* xorps, xorpd */
     [0x58] = SSE_FOP(add),
     [0x59] = SSE_FOP(mul),
-    [0x5a] = { gen_helper_cvtps2pd, gen_helper_cvtpd2ps,
-               gen_helper_cvtss2sd, gen_helper_cvtsd2ss },
-    [0x5b] = { gen_helper_cvtdq2ps, gen_helper_cvtps2dq, gen_helper_cvttps2dq },
+    [0x5a] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
+                gen_helper_cvtps2pd_xmm, gen_helper_cvtpd2ps_xmm,
+                gen_helper_cvtss2sd, gen_helper_cvtsd2ss,
+                gen_helper_cvtps2pd_ymm, gen_helper_cvtpd2ps_ymm, NULL, NULL),
+    [0x5b] = OP(op1, SSE_OPF_V0,
+                gen_helper_cvtdq2ps_xmm, gen_helper_cvtps2dq_xmm,
+                gen_helper_cvttps2dq_xmm, NULL,
+                gen_helper_cvtdq2ps_ymm, gen_helper_cvtps2dq_ymm,
+                gen_helper_cvttps2dq_ymm, NULL),
     [0x5c] = SSE_FOP(sub),
     [0x5d] = SSE_FOP(min),
     [0x5e] = SSE_FOP(div),
     [0x5f] = SSE_FOP(max),
 
-    [0xc2] = SSE_FOP(cmpeq),
-    [0xc6] = { (SSEFunc_0_epp)gen_helper_shufps,
-               (SSEFunc_0_epp)gen_helper_shufpd }, /* XXX: casts */
+    [0xc2] = SSE_FOP(cmpeq), /* sse_op_table4 */
+    [0xc6] = SSE_OP(shufps, shufpd, op2i, SSE_OPF_SHUF),
 
     /* SSSE3, SSE4, MOVBE, CRC32, BMI1, BMI2, ADX.  */
-    [0x38] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL },
-    [0x3a] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL },
+    [0x38] = SSE_SPECIAL,
+    [0x3a] = SSE_SPECIAL,
 
     /* MMX ops and their SSE extensions */
-    [0x60] = MMX_OP2(punpcklbw),
-    [0x61] = MMX_OP2(punpcklwd),
-    [0x62] = MMX_OP2(punpckldq),
-    [0x63] = MMX_OP2(packsswb),
-    [0x64] = MMX_OP2(pcmpgtb),
-    [0x65] = MMX_OP2(pcmpgtw),
-    [0x66] = MMX_OP2(pcmpgtl),
-    [0x67] = MMX_OP2(packuswb),
-    [0x68] = MMX_OP2(punpckhbw),
-    [0x69] = MMX_OP2(punpckhwd),
-    [0x6a] = MMX_OP2(punpckhdq),
-    [0x6b] = MMX_OP2(packssdw),
-    [0x6c] = { NULL, gen_helper_punpcklqdq_xmm },
-    [0x6d] = { NULL, gen_helper_punpckhqdq_xmm },
-    [0x6e] = { SSE_SPECIAL, SSE_SPECIAL }, /* movd mm, ea */
-    [0x6f] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movq, movdqa, , movqdu */
-    [0x70] = { (SSEFunc_0_epp)gen_helper_pshufw_mmx,
-               (SSEFunc_0_epp)gen_helper_pshufd_xmm,
-               (SSEFunc_0_epp)gen_helper_pshufhw_xmm,
-               (SSEFunc_0_epp)gen_helper_pshuflw_xmm }, /* XXX: casts */
-    [0x71] = { SSE_SPECIAL, SSE_SPECIAL }, /* shiftw */
-    [0x72] = { SSE_SPECIAL, SSE_SPECIAL }, /* shiftd */
-    [0x73] = { SSE_SPECIAL, SSE_SPECIAL }, /* shiftq */
-    [0x74] = MMX_OP2(pcmpeqb),
-    [0x75] = MMX_OP2(pcmpeqw),
-    [0x76] = MMX_OP2(pcmpeql),
-    [0x77] = { SSE_DUMMY }, /* emms */
-    [0x78] = { NULL, SSE_SPECIAL, NULL, SSE_SPECIAL }, /* extrq_i, insertq_i */
-    [0x79] = { NULL, gen_helper_extrq_r, NULL, gen_helper_insertq_r },
-    [0x7c] = { NULL, gen_helper_haddpd, NULL, gen_helper_haddps },
-    [0x7d] = { NULL, gen_helper_hsubpd, NULL, gen_helper_hsubps },
-    [0x7e] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movd, movd, , movq */
-    [0x7f] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movq, movdqa, movdqu */
-    [0xc4] = { SSE_SPECIAL, SSE_SPECIAL }, /* pinsrw */
-    [0xc5] = { SSE_SPECIAL, SSE_SPECIAL }, /* pextrw */
-    [0xd0] = { NULL, gen_helper_addsubpd, NULL, gen_helper_addsubps },
-    [0xd1] = MMX_OP2(psrlw),
-    [0xd2] = MMX_OP2(psrld),
-    [0xd3] = MMX_OP2(psrlq),
-    [0xd4] = MMX_OP2(paddq),
-    [0xd5] = MMX_OP2(pmullw),
-    [0xd6] = { NULL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL },
-    [0xd7] = { SSE_SPECIAL, SSE_SPECIAL }, /* pmovmskb */
-    [0xd8] = MMX_OP2(psubusb),
-    [0xd9] = MMX_OP2(psubusw),
-    [0xda] = MMX_OP2(pminub),
-    [0xdb] = MMX_OP2(pand),
-    [0xdc] = MMX_OP2(paddusb),
-    [0xdd] = MMX_OP2(paddusw),
-    [0xde] = MMX_OP2(pmaxub),
-    [0xdf] = MMX_OP2(pandn),
-    [0xe0] = MMX_OP2(pavgb),
-    [0xe1] = MMX_OP2(psraw),
-    [0xe2] = MMX_OP2(psrad),
-    [0xe3] = MMX_OP2(pavgw),
-    [0xe4] = MMX_OP2(pmulhuw),
-    [0xe5] = MMX_OP2(pmulhw),
-    [0xe6] = { NULL, gen_helper_cvttpd2dq, gen_helper_cvtdq2pd, gen_helper_cvtpd2dq },
-    [0xe7] = { SSE_SPECIAL , SSE_SPECIAL },  /* movntq, movntq */
-    [0xe8] = MMX_OP2(psubsb),
-    [0xe9] = MMX_OP2(psubsw),
-    [0xea] = MMX_OP2(pminsw),
-    [0xeb] = MMX_OP2(por),
-    [0xec] = MMX_OP2(paddsb),
-    [0xed] = MMX_OP2(paddsw),
-    [0xee] = MMX_OP2(pmaxsw),
-    [0xef] = MMX_OP2(pxor),
-    [0xf0] = { NULL, NULL, NULL, SSE_SPECIAL }, /* lddqu */
-    [0xf1] = MMX_OP2(psllw),
-    [0xf2] = MMX_OP2(pslld),
-    [0xf3] = MMX_OP2(psllq),
-    [0xf4] = MMX_OP2(pmuludq),
-    [0xf5] = MMX_OP2(pmaddwd),
-    [0xf6] = MMX_OP2(psadbw),
-    [0xf7] = { (SSEFunc_0_epp)gen_helper_maskmov_mmx,
-               (SSEFunc_0_epp)gen_helper_maskmov_xmm }, /* XXX: casts */
-    [0xf8] = MMX_OP2(psubb),
-    [0xf9] = MMX_OP2(psubw),
-    [0xfa] = MMX_OP2(psubl),
-    [0xfb] = MMX_OP2(psubq),
-    [0xfc] = MMX_OP2(paddb),
-    [0xfd] = MMX_OP2(paddw),
-    [0xfe] = MMX_OP2(paddl),
+    [0x60] = MMX_OP(punpcklbw),
+    [0x61] = MMX_OP(punpcklwd),
+    [0x62] = MMX_OP(punpckldq),
+    [0x63] = MMX_OP(packsswb),
+    [0x64] = MMX_OP(pcmpgtb),
+    [0x65] = MMX_OP(pcmpgtw),
+    [0x66] = MMX_OP(pcmpgtl),
+    [0x67] = MMX_OP(packuswb),
+    [0x68] = MMX_OP(punpckhbw),
+    [0x69] = MMX_OP(punpckhwd),
+    [0x6a] = MMX_OP(punpckhdq),
+    [0x6b] = MMX_OP(packssdw),
+    [0x6c] = OP(op2, SSE_OPF_MMX,
+                NULL, gen_helper_punpcklqdq_xmm, NULL, NULL,
+                NULL, gen_helper_punpcklqdq_ymm, NULL, NULL),
+    [0x6d] = OP(op2, SSE_OPF_MMX,
+                NULL, gen_helper_punpckhqdq_xmm, NULL, NULL,
+                NULL, gen_helper_punpckhqdq_ymm, NULL, NULL),
+    [0x6e] = SSE_SPECIAL, /* movd mm, ea */
+    [0x6f] = SSE_SPECIAL, /* movq, movdqa, , movqdu */
+    [0x70] = OP(op1i, SSE_OPF_SHUF | SSE_OPF_MMX | SSE_OPF_V0,
+            gen_helper_pshufw_mmx, gen_helper_pshufd_xmm,
+            gen_helper_pshufhw_xmm, gen_helper_pshuflw_xmm,
+            NULL, gen_helper_pshufd_ymm,
+            gen_helper_pshufhw_ymm, gen_helper_pshuflw_ymm),
+    [0x71] = SSE_SPECIAL, /* shiftw */
+    [0x72] = SSE_SPECIAL, /* shiftd */
+    [0x73] = SSE_SPECIAL, /* shiftq */
+    [0x74] = MMX_OP(pcmpeqb),
+    [0x75] = MMX_OP(pcmpeqw),
+    [0x76] = MMX_OP(pcmpeql),
+    [0x77] = SSE_SPECIAL, /* emms */
+    [0x78] = SSE_SPECIAL, /* extrq_i, insertq_i (sse4a) */
+    [0x79] = OP(op1, SSE_OPF_V0,
+            NULL, gen_helper_extrq_r, NULL, gen_helper_insertq_r,
+            NULL, NULL, NULL, NULL),
+    [0x7c] = OP(op2, 0,
+                NULL, gen_helper_haddpd_xmm, NULL, gen_helper_haddps_xmm,
+                NULL, gen_helper_haddpd_ymm, NULL, gen_helper_haddps_ymm),
+    [0x7d] = OP(op2, 0,
+                NULL, gen_helper_hsubpd_xmm, NULL, gen_helper_hsubps_xmm,
+                NULL, gen_helper_hsubpd_ymm, NULL, gen_helper_hsubps_ymm),
+    [0x7e] = SSE_SPECIAL, /* movd, movd, , movq */
+    [0x7f] = SSE_SPECIAL, /* movq, movdqa, movdqu */
+    [0xc4] = SSE_SPECIAL, /* pinsrw */
+    [0xc5] = SSE_SPECIAL, /* pextrw */
+    [0xd0] = OP(op2, 0,
+                NULL, gen_helper_addsubpd_xmm, NULL, gen_helper_addsubps_xmm,
+                NULL, gen_helper_addsubpd_ymm, NULL, gen_helper_addsubps_ymm),
+    [0xd1] = MMX_OP(psrlw),
+    [0xd2] = MMX_OP(psrld),
+    [0xd3] = MMX_OP(psrlq),
+    [0xd4] = MMX_OP(paddq),
+    [0xd5] = MMX_OP(pmullw),
+    [0xd6] = SSE_SPECIAL,
+    [0xd7] = SSE_SPECIAL, /* pmovmskb */
+    [0xd8] = MMX_OP(psubusb),
+    [0xd9] = MMX_OP(psubusw),
+    [0xda] = MMX_OP(pminub),
+    [0xdb] = MMX_OP(pand),
+    [0xdc] = MMX_OP(paddusb),
+    [0xdd] = MMX_OP(paddusw),
+    [0xde] = MMX_OP(pmaxub),
+    [0xdf] = MMX_OP(pandn),
+    [0xe0] = MMX_OP(pavgb),
+    [0xe1] = MMX_OP(psraw),
+    [0xe2] = MMX_OP(psrad),
+    [0xe3] = MMX_OP(pavgw),
+    [0xe4] = MMX_OP(pmulhuw),
+    [0xe5] = MMX_OP(pmulhw),
+    [0xe6] = OP(op1, SSE_OPF_V0,
+            NULL, gen_helper_cvttpd2dq_xmm,
+            gen_helper_cvtdq2pd_xmm, gen_helper_cvtpd2dq_xmm,
+            NULL, gen_helper_cvttpd2dq_ymm,
+            gen_helper_cvtdq2pd_ymm, gen_helper_cvtpd2dq_ymm),
+    [0xe7] = SSE_SPECIAL,  /* movntq, movntq */
+    [0xe8] = MMX_OP(psubsb),
+    [0xe9] = MMX_OP(psubsw),
+    [0xea] = MMX_OP(pminsw),
+    [0xeb] = MMX_OP(por),
+    [0xec] = MMX_OP(paddsb),
+    [0xed] = MMX_OP(paddsw),
+    [0xee] = MMX_OP(pmaxsw),
+    [0xef] = MMX_OP(pxor),
+    [0xf0] = SSE_SPECIAL, /* lddqu */
+    [0xf1] = MMX_OP(psllw),
+    [0xf2] = MMX_OP(pslld),
+    [0xf3] = MMX_OP(psllq),
+    [0xf4] = MMX_OP(pmuludq),
+    [0xf5] = MMX_OP(pmaddwd),
+    [0xf6] = MMX_OP(psadbw),
+    [0xf7] = OP(op1t, SSE_OPF_MMX | SSE_OPF_V0,
+                gen_helper_maskmov_mmx, gen_helper_maskmov_xmm, NULL, NULL,
+                NULL, NULL, NULL, NULL),
+    [0xf8] = MMX_OP(psubb),
+    [0xf9] = MMX_OP(psubw),
+    [0xfa] = MMX_OP(psubl),
+    [0xfb] = MMX_OP(psubq),
+    [0xfc] = MMX_OP(paddb),
+    [0xfd] = MMX_OP(paddw),
+    [0xfe] = MMX_OP(paddl),
 };
-
-static const SSEFunc_0_epp sse_op_table2[3 * 8][2] = {
-    [0 + 2] = MMX_OP2(psrlw),
-    [0 + 4] = MMX_OP2(psraw),
-    [0 + 6] = MMX_OP2(psllw),
-    [8 + 2] = MMX_OP2(psrld),
-    [8 + 4] = MMX_OP2(psrad),
-    [8 + 6] = MMX_OP2(pslld),
-    [16 + 2] = MMX_OP2(psrlq),
-    [16 + 3] = { NULL, gen_helper_psrldq_xmm },
-    [16 + 6] = MMX_OP2(psllq),
-    [16 + 7] = { NULL, gen_helper_pslldq_xmm },
+#undef MMX_OP
+#undef OP
+#undef SSE_FOP
+#undef SSE_OP
+#undef SSE_SPECIAL
+
+#define MMX_OP(x) { gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm, \
+                    gen_helper_ ## x ## _ymm}
+static const SSEFunc_0_eppp sse_op_table2[3 * 8][3] = {
+    [0 + 2] = MMX_OP(psrlw),
+    [0 + 4] = MMX_OP(psraw),
+    [0 + 6] = MMX_OP(psllw),
+    [8 + 2] = MMX_OP(psrld),
+    [8 + 4] = MMX_OP(psrad),
+    [8 + 6] = MMX_OP(pslld),
+    [16 + 2] = MMX_OP(psrlq),
+    [16 + 3] = { NULL, gen_helper_psrldq_xmm, gen_helper_psrldq_ymm},
+    [16 + 6] = MMX_OP(psllq),
+    [16 + 7] = { NULL, gen_helper_pslldq_xmm, gen_helper_pslldq_ymm},
 };
+#undef MMX_OP
 
 static const SSEFunc_0_epi sse_op_table3ai[] = {
     gen_helper_cvtsi2ss,
@@ -2968,16 +3141,53 @@ static const SSEFunc_l_ep sse_op_table3bq[] = {
 };
 #endif
 
-static const SSEFunc_0_epp sse_op_table4[8][4] = {
-    SSE_FOP(cmpeq),
-    SSE_FOP(cmplt),
-    SSE_FOP(cmple),
-    SSE_FOP(cmpunord),
-    SSE_FOP(cmpneq),
-    SSE_FOP(cmpnlt),
-    SSE_FOP(cmpnle),
-    SSE_FOP(cmpord),
+#define SSE_CMP(x) { \
+    gen_helper_ ## x ## ps ## _xmm, gen_helper_ ## x ## pd ## _xmm, \
+    gen_helper_ ## x ## ss, gen_helper_ ## x ## sd, \
+    gen_helper_ ## x ## ps ## _ymm, gen_helper_ ## x ## pd ## _ymm}
+static const SSEFunc_0_eppp sse_op_table4[32][6] = {
+    SSE_CMP(cmpeq),
+    SSE_CMP(cmplt),
+    SSE_CMP(cmple),
+    SSE_CMP(cmpunord),
+    SSE_CMP(cmpneq),
+    SSE_CMP(cmpnlt),
+    SSE_CMP(cmpnle),
+    SSE_CMP(cmpord),
+
+    SSE_CMP(cmpequ),
+    SSE_CMP(cmpnge),
+    SSE_CMP(cmpngt),
+    SSE_CMP(cmpfalse),
+    SSE_CMP(cmpnequ),
+    SSE_CMP(cmpge),
+    SSE_CMP(cmpgt),
+    SSE_CMP(cmptrue),
+
+    SSE_CMP(cmpeqs),
+    SSE_CMP(cmpltq),
+    SSE_CMP(cmpleq),
+    SSE_CMP(cmpunords),
+    SSE_CMP(cmpneqq),
+    SSE_CMP(cmpnltq),
+    SSE_CMP(cmpnleq),
+    SSE_CMP(cmpords),
+
+    SSE_CMP(cmpequs),
+    SSE_CMP(cmpngeq),
+    SSE_CMP(cmpngtq),
+    SSE_CMP(cmpfalses),
+    SSE_CMP(cmpnequs),
+    SSE_CMP(cmpgeq),
+    SSE_CMP(cmpgtq),
+    SSE_CMP(cmptrues),
 };
+#undef SSE_CMP
+
+static void gen_helper_pavgusb(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b)
+{
+    gen_helper_pavgb_mmx(env, reg_a, reg_a, reg_b);
+}
 
 static const SSEFunc_0_epp sse_op_table5[256] = {
     [0x0c] = gen_helper_pi2fw,
@@ -3003,117 +3213,291 @@ static const SSEFunc_0_epp sse_op_table5[256] = {
     [0xb6] = gen_helper_movq, /* pfrcpit2 */
     [0xb7] = gen_helper_pmulhrw_mmx,
     [0xbb] = gen_helper_pswapd,
-    [0xbf] = gen_helper_pavgb_mmx /* pavgusb */
+    [0xbf] = gen_helper_pavgusb,
 };
 
-struct SSEOpHelper_epp {
-    SSEFunc_0_epp op[2];
+struct SSEOpHelper_table6 {
+    union {
+        SSEFunc_0_epp op1;
+        SSEFunc_0_eppp op2;
+        SSEFunc_0_epppp op3;
+    } fn[3]; /* [0] = mmx, [1] = xmm, fn[2] = ymm */
     uint32_t ext_mask;
+    int flags;
 };
 
-struct SSEOpHelper_eppi {
-    SSEFunc_0_eppi op[2];
+struct SSEOpHelper_table7 {
+    union {
+        SSEFunc_0_eppi op1;
+        SSEFunc_0_epppi op2;
+        SSEFunc_0_epppp op3;
+    } fn[3];
     uint32_t ext_mask;
+    int flags;
+};
+
+#define gen_helper_special_xmm NULL
+#define gen_helper_special_ymm NULL
+
+#define OP(name, op, flags, ext, mmx_name) \
+    {{{.op = mmx_name}, {.op = gen_helper_ ## name ## _xmm}, \
+      {.op = gen_helper_ ## name ## _ymm} }, CPUID_EXT_ ## ext, flags}
+#define BINARY_OP_MMX(name, ext) \
+    OP(name, op2, SSE_OPF_MMX, ext, gen_helper_ ## name ## _mmx)
+#define BINARY_OP(name, ext, flags) \
+    OP(name, op2, flags, ext, NULL)
+#define UNARY_OP_MMX(name, ext) \
+    OP(name, op1, SSE_OPF_V0 | SSE_OPF_MMX, ext, gen_helper_ ## name ## _mmx)
+#define UNARY_OP(name, ext, flags) \
+    OP(name, op1, SSE_OPF_V0 | flags, ext, NULL)
+#define BLENDV_OP(name, ext, flags) OP(name, op3, SSE_OPF_BLENDV, ext, NULL)
+#define CMP_OP(name, ext) OP(name, op1, SSE_OPF_CMP | SSE_OPF_V0, ext, NULL)
+#define SPECIAL_OP(ext) OP(special, op1, SSE_OPF_SPECIAL, ext, NULL)
+
+/* prefix [66] 0f 38 */
+static const struct SSEOpHelper_table6 sse_op_table6[256] = {
+    [0x00] = BINARY_OP_MMX(pshufb, SSSE3),
+    [0x01] = BINARY_OP_MMX(phaddw, SSSE3),
+    [0x02] = BINARY_OP_MMX(phaddd, SSSE3),
+    [0x03] = BINARY_OP_MMX(phaddsw, SSSE3),
+    [0x04] = BINARY_OP_MMX(pmaddubsw, SSSE3),
+    [0x05] = BINARY_OP_MMX(phsubw, SSSE3),
+    [0x06] = BINARY_OP_MMX(phsubd, SSSE3),
+    [0x07] = BINARY_OP_MMX(phsubsw, SSSE3),
+    [0x08] = BINARY_OP_MMX(psignb, SSSE3),
+    [0x09] = BINARY_OP_MMX(psignw, SSSE3),
+    [0x0a] = BINARY_OP_MMX(psignd, SSSE3),
+    [0x0b] = BINARY_OP_MMX(pmulhrsw, SSSE3),
+    [0x0c] = BINARY_OP(vpermilps, AVX, 0),
+    [0x0d] = BINARY_OP(vpermilpd, AVX, 0),
+    [0x0e] = CMP_OP(vtestps, AVX),
+    [0x0f] = CMP_OP(vtestpd, AVX),
+    [0x10] = BLENDV_OP(pblendvb, SSE41, SSE_OPF_MMX),
+    [0x14] = BLENDV_OP(blendvps, SSE41, 0),
+    [0x15] = BLENDV_OP(blendvpd, SSE41, 0),
+#define gen_helper_vpermd_xmm NULL
+    [0x16] = BINARY_OP(vpermd, AVX, SSE_OPF_AVX2), /* vpermps */
+    [0x17] = CMP_OP(ptest, SSE41),
+    /* TODO:Some vbroadcast variants require AVX2 */
+    [0x18] = UNARY_OP(vbroadcastl, AVX, SSE_OPF_SCALAR), /* vbroadcastss */
+    [0x19] = UNARY_OP(vbroadcastq, AVX, SSE_OPF_SCALAR), /* vbroadcastsd */
+#define gen_helper_vbroadcastdq_xmm NULL
+    [0x1a] = UNARY_OP(vbroadcastdq, AVX, SSE_OPF_SCALAR), /* vbroadcastf128 */
+    [0x1c] = UNARY_OP_MMX(pabsb, SSSE3),
+    [0x1d] = UNARY_OP_MMX(pabsw, SSSE3),
+    [0x1e] = UNARY_OP_MMX(pabsd, SSSE3),
+    [0x20] = UNARY_OP(pmovsxbw, SSE41, SSE_OPF_MMX),
+    [0x21] = UNARY_OP(pmovsxbd, SSE41, SSE_OPF_MMX),
+    [0x22] = UNARY_OP(pmovsxbq, SSE41, SSE_OPF_MMX),
+    [0x23] = UNARY_OP(pmovsxwd, SSE41, SSE_OPF_MMX),
+    [0x24] = UNARY_OP(pmovsxwq, SSE41, SSE_OPF_MMX),
+    [0x25] = UNARY_OP(pmovsxdq, SSE41, SSE_OPF_MMX),
+    [0x28] = BINARY_OP(pmuldq, SSE41, SSE_OPF_MMX),
+    [0x29] = BINARY_OP(pcmpeqq, SSE41, SSE_OPF_MMX),
+    [0x2a] = SPECIAL_OP(SSE41), /* movntqda */
+    [0x2b] = BINARY_OP(packusdw, SSE41, SSE_OPF_MMX),
+    [0x2c] = BINARY_OP(vpmaskmovd, AVX, 0), /* vmaskmovps */
+    [0x2d] = BINARY_OP(vpmaskmovq, AVX, 0), /* vmaskmovpd */
+    [0x2e] = SPECIAL_OP(AVX), /* vmaskmovps */
+    [0x2f] = SPECIAL_OP(AVX), /* vmaskmovpd */
+    [0x30] = UNARY_OP(pmovzxbw, SSE41, SSE_OPF_MMX),
+    [0x31] = UNARY_OP(pmovzxbd, SSE41, SSE_OPF_MMX),
+    [0x32] = UNARY_OP(pmovzxbq, SSE41, SSE_OPF_MMX),
+    [0x33] = UNARY_OP(pmovzxwd, SSE41, SSE_OPF_MMX),
+    [0x34] = UNARY_OP(pmovzxwq, SSE41, SSE_OPF_MMX),
+    [0x35] = UNARY_OP(pmovzxdq, SSE41, SSE_OPF_MMX),
+    [0x36] = BINARY_OP(vpermd, AVX, SSE_OPF_AVX2), /* vpermd */
+    [0x37] = BINARY_OP(pcmpgtq, SSE41, SSE_OPF_MMX),
+    [0x38] = BINARY_OP(pminsb, SSE41, SSE_OPF_MMX),
+    [0x39] = BINARY_OP(pminsd, SSE41, SSE_OPF_MMX),
+    [0x3a] = BINARY_OP(pminuw, SSE41, SSE_OPF_MMX),
+    [0x3b] = BINARY_OP(pminud, SSE41, SSE_OPF_MMX),
+    [0x3c] = BINARY_OP(pmaxsb, SSE41, SSE_OPF_MMX),
+    [0x3d] = BINARY_OP(pmaxsd, SSE41, SSE_OPF_MMX),
+    [0x3e] = BINARY_OP(pmaxuw, SSE41, SSE_OPF_MMX),
+    [0x3f] = BINARY_OP(pmaxud, SSE41, SSE_OPF_MMX),
+    [0x40] = BINARY_OP(pmulld, SSE41, SSE_OPF_MMX),
+#define gen_helper_phminposuw_ymm NULL
+    [0x41] = UNARY_OP(phminposuw, SSE41, 0),
+    [0x45] = BINARY_OP(vpsrlvd, AVX, SSE_OPF_AVX2),
+    [0x46] = BINARY_OP(vpsravd, AVX, SSE_OPF_AVX2),
+    [0x47] = BINARY_OP(vpsllvd, AVX, SSE_OPF_AVX2),
+    /* vpbroadcastd */
+    [0x58] = UNARY_OP(vbroadcastl, AVX, SSE_OPF_SCALAR | SSE_OPF_MMX),
+    /* vpbroadcastq */
+    [0x59] = UNARY_OP(vbroadcastq, AVX, SSE_OPF_SCALAR | SSE_OPF_MMX),
+    /* vbroadcasti128 */
+    [0x5a] = UNARY_OP(vbroadcastdq, AVX, SSE_OPF_SCALAR | SSE_OPF_MMX),
+    /* vpbroadcastb */
+    [0x78] = UNARY_OP(vbroadcastb, AVX, SSE_OPF_SCALAR | SSE_OPF_MMX),
+    /* vpbroadcastw */
+    [0x79] = UNARY_OP(vbroadcastw, AVX, SSE_OPF_SCALAR | SSE_OPF_MMX),
+    /* vpmaskmovd, vpmaskmovq */
+    [0x8c] = BINARY_OP(vpmaskmovd, AVX, SSE_OPF_AVX2),
+    [0x8e] = SPECIAL_OP(AVX), /* vpmaskmovd, vpmaskmovq */
+    [0x90] = SPECIAL_OP(AVX), /* vpgatherdd, vpgatherdq */
+    [0x91] = SPECIAL_OP(AVX), /* vpgatherqd, vpgatherqq */
+    [0x92] = SPECIAL_OP(AVX), /* vgatherdpd, vgatherdps */
+    [0x93] = SPECIAL_OP(AVX), /* vgatherqpd, vgatherqps */
+#define gen_helper_aesimc_ymm NULL
+    [0xdb] = UNARY_OP(aesimc, AES, 0),
+    [0xdc] = BINARY_OP(aesenc, AES, 0),
+    [0xdd] = BINARY_OP(aesenclast, AES, 0),
+    [0xde] = BINARY_OP(aesdec, AES, 0),
+    [0xdf] = BINARY_OP(aesdeclast, AES, 0),
+};
+
+/* prefix [66] 0f 3a */
+static const struct SSEOpHelper_table7 sse_op_table7[256] = {
+#define gen_helper_vpermq_xmm NULL
+    [0x00] = UNARY_OP(vpermq, AVX, SSE_OPF_AVX2),
+    [0x01] = UNARY_OP(vpermq, AVX, SSE_OPF_AVX2), /* vpermpd */
+    [0x02] = BINARY_OP(blendps, AVX, SSE_OPF_AVX2), /* vpblendd */
+    [0x04] = UNARY_OP(vpermilps_imm, AVX, 0),
+    [0x05] = UNARY_OP(vpermilpd_imm, AVX, 0),
+#define gen_helper_vpermdq_xmm NULL
+    [0x06] = BINARY_OP(vpermdq, AVX, 0), /* vperm2f128 */
+    [0x08] = UNARY_OP(roundps, SSE41, 0),
+    [0x09] = UNARY_OP(roundpd, SSE41, 0),
+#define gen_helper_roundss_ymm NULL
+    [0x0a] = UNARY_OP(roundss, SSE41, SSE_OPF_SCALAR),
+#define gen_helper_roundsd_ymm NULL
+    [0x0b] = UNARY_OP(roundsd, SSE41, SSE_OPF_SCALAR),
+    [0x0c] = BINARY_OP(blendps, SSE41, 0),
+    [0x0d] = BINARY_OP(blendpd, SSE41, 0),
+    [0x0e] = BINARY_OP(pblendw, SSE41, SSE_OPF_MMX),
+    [0x0f] = BINARY_OP_MMX(palignr, SSSE3),
+    [0x14] = SPECIAL_OP(SSE41), /* pextrb */
+    [0x15] = SPECIAL_OP(SSE41), /* pextrw */
+    [0x16] = SPECIAL_OP(SSE41), /* pextrd/pextrq */
+    [0x17] = SPECIAL_OP(SSE41), /* extractps */
+    [0x18] = SPECIAL_OP(AVX), /* vinsertf128 */
+    [0x19] = SPECIAL_OP(AVX), /* vextractf128 */
+    [0x20] = SPECIAL_OP(SSE41), /* pinsrb */
+    [0x21] = SPECIAL_OP(SSE41), /* insertps */
+    [0x22] = SPECIAL_OP(SSE41), /* pinsrd/pinsrq */
+    [0x38] = SPECIAL_OP(AVX), /* vinserti128 */
+    [0x39] = SPECIAL_OP(AVX), /* vextracti128 */
+    [0x40] = BINARY_OP(dpps, SSE41, 0),
+#define gen_helper_dppd_ymm NULL
+    [0x41] = BINARY_OP(dppd, SSE41, 0),
+    [0x42] = BINARY_OP(mpsadbw, SSE41, SSE_OPF_MMX),
+    [0x44] = BINARY_OP(pclmulqdq, PCLMULQDQ, 0),
+    [0x46] = BINARY_OP(vpermdq, AVX, SSE_OPF_AVX2), /* vperm2i128 */
+    [0x4a] = BLENDV_OP(blendvps, SSE41, 0),
+    [0x4b] = BLENDV_OP(blendvpd, SSE41, 0),
+    [0x4c] = BLENDV_OP(pblendvb, SSE41, SSE_OPF_MMX),
+#define gen_helper_pcmpestrm_ymm NULL
+    [0x60] = CMP_OP(pcmpestrm, SSE42),
+#define gen_helper_pcmpestri_ymm NULL
+    [0x61] = CMP_OP(pcmpestri, SSE42),
+#define gen_helper_pcmpistrm_ymm NULL
+    [0x62] = CMP_OP(pcmpistrm, SSE42),
+#define gen_helper_pcmpistri_ymm NULL
+    [0x63] = CMP_OP(pcmpistri, SSE42),
+#define gen_helper_aeskeygenassist_ymm NULL
+    [0xdf] = UNARY_OP(aeskeygenassist, AES, 0),
 };
 
-#define SSSE3_OP(x) { MMX_OP2(x), CPUID_EXT_SSSE3 }
-#define SSE41_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, CPUID_EXT_SSE41 }
-#define SSE42_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, CPUID_EXT_SSE42 }
-#define SSE41_SPECIAL { { NULL, SSE_SPECIAL }, CPUID_EXT_SSE41 }
-#define PCLMULQDQ_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, \
-        CPUID_EXT_PCLMULQDQ }
-#define AESNI_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, CPUID_EXT_AES }
-
-static const struct SSEOpHelper_epp sse_op_table6[256] = {
-    [0x00] = SSSE3_OP(pshufb),
-    [0x01] = SSSE3_OP(phaddw),
-    [0x02] = SSSE3_OP(phaddd),
-    [0x03] = SSSE3_OP(phaddsw),
-    [0x04] = SSSE3_OP(pmaddubsw),
-    [0x05] = SSSE3_OP(phsubw),
-    [0x06] = SSSE3_OP(phsubd),
-    [0x07] = SSSE3_OP(phsubsw),
-    [0x08] = SSSE3_OP(psignb),
-    [0x09] = SSSE3_OP(psignw),
-    [0x0a] = SSSE3_OP(psignd),
-    [0x0b] = SSSE3_OP(pmulhrsw),
-    [0x10] = SSE41_OP(pblendvb),
-    [0x14] = SSE41_OP(blendvps),
-    [0x15] = SSE41_OP(blendvpd),
-    [0x17] = SSE41_OP(ptest),
-    [0x1c] = SSSE3_OP(pabsb),
-    [0x1d] = SSSE3_OP(pabsw),
-    [0x1e] = SSSE3_OP(pabsd),
-    [0x20] = SSE41_OP(pmovsxbw),
-    [0x21] = SSE41_OP(pmovsxbd),
-    [0x22] = SSE41_OP(pmovsxbq),
-    [0x23] = SSE41_OP(pmovsxwd),
-    [0x24] = SSE41_OP(pmovsxwq),
-    [0x25] = SSE41_OP(pmovsxdq),
-    [0x28] = SSE41_OP(pmuldq),
-    [0x29] = SSE41_OP(pcmpeqq),
-    [0x2a] = SSE41_SPECIAL, /* movntqda */
-    [0x2b] = SSE41_OP(packusdw),
-    [0x30] = SSE41_OP(pmovzxbw),
-    [0x31] = SSE41_OP(pmovzxbd),
-    [0x32] = SSE41_OP(pmovzxbq),
-    [0x33] = SSE41_OP(pmovzxwd),
-    [0x34] = SSE41_OP(pmovzxwq),
-    [0x35] = SSE41_OP(pmovzxdq),
-    [0x37] = SSE42_OP(pcmpgtq),
-    [0x38] = SSE41_OP(pminsb),
-    [0x39] = SSE41_OP(pminsd),
-    [0x3a] = SSE41_OP(pminuw),
-    [0x3b] = SSE41_OP(pminud),
-    [0x3c] = SSE41_OP(pmaxsb),
-    [0x3d] = SSE41_OP(pmaxsd),
-    [0x3e] = SSE41_OP(pmaxuw),
-    [0x3f] = SSE41_OP(pmaxud),
-    [0x40] = SSE41_OP(pmulld),
-    [0x41] = SSE41_OP(phminposuw),
-    [0xdb] = AESNI_OP(aesimc),
-    [0xdc] = AESNI_OP(aesenc),
-    [0xdd] = AESNI_OP(aesenclast),
-    [0xde] = AESNI_OP(aesdec),
-    [0xdf] = AESNI_OP(aesdeclast),
+#define SSE_OP(name) \
+    {gen_helper_ ## name ##_xmm, gen_helper_ ## name ##_ymm}
+static const SSEFunc_0_eppp sse_op_table8[3][2] = {
+    SSE_OP(vpsrlvq),
+    SSE_OP(vpsravq),
+    SSE_OP(vpsllvq),
 };
 
-static const struct SSEOpHelper_eppi sse_op_table7[256] = {
-    [0x08] = SSE41_OP(roundps),
-    [0x09] = SSE41_OP(roundpd),
-    [0x0a] = SSE41_OP(roundss),
-    [0x0b] = SSE41_OP(roundsd),
-    [0x0c] = SSE41_OP(blendps),
-    [0x0d] = SSE41_OP(blendpd),
-    [0x0e] = SSE41_OP(pblendw),
-    [0x0f] = SSSE3_OP(palignr),
-    [0x14] = SSE41_SPECIAL, /* pextrb */
-    [0x15] = SSE41_SPECIAL, /* pextrw */
-    [0x16] = SSE41_SPECIAL, /* pextrd/pextrq */
-    [0x17] = SSE41_SPECIAL, /* extractps */
-    [0x20] = SSE41_SPECIAL, /* pinsrb */
-    [0x21] = SSE41_SPECIAL, /* insertps */
-    [0x22] = SSE41_SPECIAL, /* pinsrd/pinsrq */
-    [0x40] = SSE41_OP(dpps),
-    [0x41] = SSE41_OP(dppd),
-    [0x42] = SSE41_OP(mpsadbw),
-    [0x44] = PCLMULQDQ_OP(pclmulqdq),
-    [0x60] = SSE42_OP(pcmpestrm),
-    [0x61] = SSE42_OP(pcmpestri),
-    [0x62] = SSE42_OP(pcmpistrm),
-    [0x63] = SSE42_OP(pcmpistri),
-    [0xdf] = AESNI_OP(aeskeygenassist),
+static const SSEFunc_0_eppt sse_op_table9[2][2] = {
+    SSE_OP(vpmaskmovd_st),
+    SSE_OP(vpmaskmovq_st),
 };
 
+static const SSEFunc_0_epppt sse_op_table10[16][2] = {
+    SSE_OP(vpgatherdd0),
+    SSE_OP(vpgatherdq0),
+    SSE_OP(vpgatherqd0),
+    SSE_OP(vpgatherqq0),
+    SSE_OP(vpgatherdd1),
+    SSE_OP(vpgatherdq1),
+    SSE_OP(vpgatherqd1),
+    SSE_OP(vpgatherqq1),
+    SSE_OP(vpgatherdd2),
+    SSE_OP(vpgatherdq2),
+    SSE_OP(vpgatherqd2),
+    SSE_OP(vpgatherqq2),
+    SSE_OP(vpgatherdd3),
+    SSE_OP(vpgatherdq3),
+    SSE_OP(vpgatherqd3),
+    SSE_OP(vpgatherqq3),
+};
+#undef SSE_OP
+
+#undef OP
+#undef BINARY_OP_MMX
+#undef BINARY_OP
+#undef UNARY_OP_MMX
+#undef UNARY_OP
+#undef BLENDV_OP
+#undef SPECIAL_OP
+
+/* VEX prefix not allowed */
+#define CHECK_NO_VEX(s) do { \
+    if (s->prefix & PREFIX_VEX) \
+        goto illegal_op; \
+    } while (0)
+
+/*
+ * VEX encodings require AVX
+ * Allow legacy SSE encodings even if AVX not enabled
+ */
+#define CHECK_AVX(s) do { \
+    if ((s->prefix & PREFIX_VEX) \
+        && !(env->hflags & HF_AVX_EN_MASK)) \
+        goto illegal_op; \
+    } while (0)
+
+/* If a VEX prefix is used then it must have V=1111b */
+#define CHECK_AVX_V0(s) do { \
+    CHECK_AVX(s); \
+    if ((s->prefix & PREFIX_VEX) && (s->vex_v != 0)) \
+        goto illegal_op; \
+    } while (0)
+
+/* If a VEX prefix is used then it must have L=0 */
+#define CHECK_AVX_128(s) do { \
+    CHECK_AVX(s); \
+    if ((s->prefix & PREFIX_VEX) && (s->vex_l != 0)) \
+        goto illegal_op; \
+    } while (0)
+
+/* If a VEX prefix is used then it must have V=1111b and L=0 */
+#define CHECK_AVX_V0_128(s) do { \
+    CHECK_AVX(s); \
+    if ((s->prefix & PREFIX_VEX) && (s->vex_v != 0 || s->vex_l != 0)) \
+        goto illegal_op; \
+    } while (0)
+
+/* 256-bit (ymm) variants require AVX2 */
+#define CHECK_AVX2_256(s) do { \
+    if (s->vex_l && !(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_AVX2)) \
+        goto illegal_op; \
+    } while (0)
+
+/* Requires AVX2 and VEX encoding */
+#define CHECK_AVX2(s) do { \
+    if ((s->prefix & PREFIX_VEX) == 0 \
+            || !(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_AVX2)) \
+        goto illegal_op; \
+    } while (0)
+
 static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     target_ulong pc_start)
 {
-    int b1, op1_offset, op2_offset, is_xmm, val;
-    int modrm, mod, rm, reg;
-    SSEFunc_0_epp sse_fn_epp;
-    SSEFunc_0_eppi sse_fn_eppi;
-    SSEFunc_0_ppi sse_fn_ppi;
-    SSEFunc_0_eppt sse_fn_eppt;
+    int b1, op1_offset, op2_offset, v_offset, is_xmm, val, scalar_op;
+    int modrm, mod, rm, reg, reg_v;
+    struct SSEOpHelper_table1 sse_op;
+    struct SSEOpHelper_table6 op6;
+    struct SSEOpHelper_table7 op7;
     MemOp ot;
 
     b &= 0xff;
@@ -3125,10 +3509,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         b1 = 3;
     else
         b1 = 0;
-    sse_fn_epp = sse_op_table1[b][b1];
-    if (!sse_fn_epp) {
-        goto unknown_op;
-    }
+    sse_op = sse_op_table1[b];
     if ((b <= 0x5f && b >= 0x10) || b == 0xc6 || b == 0xc2) {
         is_xmm = 1;
     } else {
@@ -3139,20 +3520,28 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             is_xmm = 1;
         }
     }
+    if (sse_op.flags & SSE_OPF_3DNOW) {
+        if (!(s->cpuid_ext2_features & CPUID_EXT2_3DNOW)) {
+            goto illegal_op;
+        }
+    }
     /* simple MMX/SSE operation */
     if (s->flags & HF_TS_MASK) {
         gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
         return;
     }
-    if (s->flags & HF_EM_MASK) {
-    illegal_op:
-        gen_illegal_opcode(s);
-        return;
-    }
-    if (is_xmm
-        && !(s->flags & HF_OSFXSR_MASK)
-        && (b != 0x38 && b != 0x3a)) {
-        goto unknown_op;
+    /* VEX encoded instuctions ignore EM bit. See also CHECK_AVX */
+    if (!(s->prefix & PREFIX_VEX)) {
+        if (s->flags & HF_EM_MASK) {
+        illegal_op:
+            gen_illegal_opcode(s);
+            return;
+        }
+        if (is_xmm
+            && !(s->flags & HF_OSFXSR_MASK)
+            && (b != 0x38 && b != 0x3a)) {
+            goto unknown_op;
+        }
     }
     if (b == 0x0e) {
         if (!(s->cpuid_ext2_features & CPUID_EXT2_3DNOW)) {
@@ -3164,9 +3553,29 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         return;
     }
     if (b == 0x77) {
-        /* emms */
-        gen_helper_emms(cpu_env);
-        return;
+        if (s->prefix & PREFIX_VEX) {
+            CHECK_AVX(s);
+            if (s->vex_l) {
+                gen_helper_vzeroall(cpu_env);
+#ifdef TARGET_X86_64
+                if (CODE64(s)) {
+                    gen_helper_vzeroall_hi8(cpu_env);
+                }
+#endif
+            } else {
+                gen_helper_vzeroupper(cpu_env);
+#ifdef TARGET_X86_64
+                if (CODE64(s)) {
+                    gen_helper_vzeroupper_hi8(cpu_env);
+                }
+#endif
+            }
+            return;
+        } else {
+            /* emms */
+            gen_helper_emms(cpu_env);
+            return;
+        }
     }
     /* prepare MMX state (XXX: optimize by storing fptt and fptags in
        the static cpu state) */
@@ -3179,11 +3588,17 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
     if (is_xmm) {
         reg |= REX_R(s);
     }
+    if (s->prefix & PREFIX_VEX) {
+        reg_v = s->vex_v;
+    } else {
+        reg_v = reg;
+    }
     mod = (modrm >> 6) & 3;
-    if (sse_fn_epp == SSE_SPECIAL) {
+    if (sse_op.flags & SSE_OPF_SPECIAL) {
         b |= (b1 << 8);
         switch(b) {
         case 0x0e7: /* movntq */
+            CHECK_NO_VEX(s);
             if (mod == 3) {
                 goto illegal_op;
             }
@@ -3193,19 +3608,31 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x1e7: /* movntdq */
         case 0x02b: /* movntps */
         case 0x12b: /* movntps */
+            CHECK_AVX_V0(s);
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
-            gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+            if (s->vex_l) {
+                gen_sty_env_A0(s, XMM_OFFSET(reg));
+            } else {
+                gen_sto_env_A0(s, XMM_OFFSET(reg));
+            }
             break;
         case 0x3f0: /* lddqu */
+            CHECK_AVX_V0(s);
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
-            gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+            if (s->vex_l) {
+                gen_ldy_env_A0(s, XMM_OFFSET(reg));
+            } else {
+                gen_ldo_env_A0(s, XMM_OFFSET(reg));
+                gen_clear_ymmh(s, reg);
+            }
             break;
         case 0x22b: /* movntss */
         case 0x32b: /* movntsd */
+            CHECK_AVX_V0_128(s);
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
@@ -3219,6 +3646,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x6e: /* movd mm, ea */
+            CHECK_NO_VEX(s);
 #ifdef TARGET_X86_64
             if (s->dflag == MO_64) {
                 gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 0);
@@ -3235,23 +3663,24 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x16e: /* movd xmm, ea */
+            CHECK_AVX_V0_128(s);
 #ifdef TARGET_X86_64
             if (s->dflag == MO_64) {
                 gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 0);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State,xmm_regs[reg]));
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, XMM_OFFSET(reg));
                 gen_helper_movq_mm_T0_xmm(s->ptr0, s->T0);
             } else
 #endif
             {
                 gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 0);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State,xmm_regs[reg]));
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, XMM_OFFSET(reg));
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_movl_mm_T0_xmm(s->ptr0, s->tmp2_i32);
             }
+            gen_clear_ymmh(s, reg);
             break;
         case 0x6f: /* movq mm, ea */
+            CHECK_NO_VEX(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_ldq_env_A0(s, offsetof(CPUX86State, fpregs[reg].mmx));
@@ -3269,17 +3698,28 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x128: /* movapd */
         case 0x16f: /* movdqa xmm, ea */
         case 0x26f: /* movdqu xmm, ea */
+            CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                if (s->vex_l) {
+                    gen_ldy_env_A0(s, XMM_OFFSET(reg));
+                } else {
+                    gen_ldo_env_A0(s, XMM_OFFSET(reg));
+                }
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                gen_op_movo(s, offsetof(CPUX86State, xmm_regs[reg]),
-                            offsetof(CPUX86State,xmm_regs[rm]));
+                gen_op_movo(s, XMM_OFFSET(reg), XMM_OFFSET(rm));
+                if (s->vex_l) {
+                    gen_op_movo_ymmh(s, XMM_OFFSET(reg), XMM_OFFSET(rm));
+                }
+            }
+            if (!s->vex_l) {
+                gen_clear_ymmh(s, reg);
             }
             break;
         case 0x210: /* movss xmm, ea */
             if (mod != 3) {
+                CHECK_AVX_V0_128(s);
                 gen_lea_modrm(env, s, modrm);
                 gen_op_ld_v(s, MO_32, s->T0, s->A0);
                 tcg_gen_st32_tl(s->T0, cpu_env,
@@ -3292,13 +3732,21 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 tcg_gen_st32_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)));
             } else {
+                CHECK_AVX_128(s);
                 rm = (modrm & 7) | REX_B(s);
-                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(0)));
+                tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
+                               offsetof(CPUX86State, xmm_regs[rm].ZMM_L(0)));
+                if (reg != reg_v) {
+                    gen_op_movo(s, XMM_OFFSET(reg), XMM_OFFSET(reg_v));
+                }
+                tcg_gen_st_i32(s->tmp2_i32, cpu_env,
+                               offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)));
             }
+            gen_clear_ymmh(s, reg);
             break;
         case 0x310: /* movsd xmm, ea */
             if (mod != 3) {
+                CHECK_AVX_V0_128(s);
                 gen_lea_modrm(env, s, modrm);
                 gen_ldq_env_A0(s, offsetof(CPUX86State,
                                            xmm_regs[reg].ZMM_Q(0)));
@@ -3308,13 +3756,21 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 tcg_gen_st32_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)));
             } else {
+                CHECK_AVX_128(s);
                 rm = (modrm & 7) | REX_B(s);
+                if (reg != reg_v) {
+                    gen_op_movq(s,
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
+                            offsetof(CPUX86State, xmm_regs[reg_v].ZMM_Q(1)));
+                }
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
+                            offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)));
             }
+            gen_clear_ymmh(s, reg);
             break;
         case 0x012: /* movlps */
         case 0x112: /* movlpd */
+            CHECK_AVX_128(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_ldq_env_A0(s, offsetof(CPUX86State,
@@ -3323,40 +3779,84 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 /* movhlps */
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(1)));
+                            offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(1)));
+            }
+            if (reg != reg_v) {
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
+                            offsetof(CPUX86State, xmm_regs[reg_v].ZMM_Q(1)));
             }
+            gen_clear_ymmh(s, reg);
             break;
         case 0x212: /* movsldup */
+            CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                if (s->vex_l) {
+                    gen_ldy_env_A0(s, XMM_OFFSET(reg));
+                } else {
+                    gen_ldo_env_A0(s, XMM_OFFSET(reg));
+                }
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(0)));
+                            offsetof(CPUX86State, xmm_regs[rm].ZMM_L(0)));
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(2)));
+                            offsetof(CPUX86State, xmm_regs[rm].ZMM_L(2)));
+                if (s->vex_l) {
+                    gen_op_movl(s,
+                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(4)),
+                                offsetof(CPUX86State, xmm_regs[rm].ZMM_L(4)));
+                    gen_op_movl(s,
+                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(6)),
+                                offsetof(CPUX86State, xmm_regs[rm].ZMM_L(6)));
+                }
             }
             gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
-                        offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
+                        offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)));
             gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)),
-                        offsetof(CPUX86State,xmm_regs[reg].ZMM_L(2)));
+                        offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)));
+            if (s->vex_l) {
+                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(5)),
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_L(4)));
+                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(7)),
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_L(6)));
+            } else {
+                gen_clear_ymmh(s, reg);
+            }
             break;
         case 0x312: /* movddup */
+            CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_ldq_env_A0(s, offsetof(CPUX86State,
                                            xmm_regs[reg].ZMM_Q(0)));
+                if (s->vex_l) {
+                    tcg_gen_addi_tl(s->A0, s->A0, 16);
+                    gen_ldq_env_A0(s, offsetof(CPUX86State,
+                                               xmm_regs[reg].ZMM_Q(2)));
+                }
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
+                            offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)));
+                if (s->vex_l) {
+                    gen_op_movq(s,
+                                offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(2)),
+                                offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(2)));
+                }
             }
             gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
-                        offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
+                        offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)));
+            if (s->vex_l) {
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(3)),
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(2)));
+            } else {
+                gen_clear_ymmh(s, reg);
+            }
             break;
         case 0x016: /* movhps */
         case 0x116: /* movhpd */
+            CHECK_AVX_128(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_ldq_env_A0(s, offsetof(CPUX86State,
@@ -3365,27 +3865,54 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 /* movlhps */
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
+                            offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)));
+            }
+            if (reg != reg_v) {
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
+                            offsetof(CPUX86State, xmm_regs[reg_v].ZMM_Q(0)));
             }
+            gen_clear_ymmh(s, reg);
             break;
         case 0x216: /* movshdup */
+            CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                if (s->vex_l) {
+                    gen_ldy_env_A0(s, XMM_OFFSET(reg));
+                } else {
+                    gen_ldo_env_A0(s, XMM_OFFSET(reg));
+                }
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(1)));
+                            offsetof(CPUX86State, xmm_regs[rm].ZMM_L(1)));
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(3)));
+                            offsetof(CPUX86State, xmm_regs[rm].ZMM_L(3)));
+                if (s->vex_l) {
+                    gen_op_movl(s,
+                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(5)),
+                                offsetof(CPUX86State, xmm_regs[rm].ZMM_L(5)));
+                    gen_op_movl(s,
+                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(7)),
+                                offsetof(CPUX86State, xmm_regs[rm].ZMM_L(7)));
+                }
             }
             gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
-                        offsetof(CPUX86State,xmm_regs[reg].ZMM_L(1)));
+                        offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)));
             gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)),
-                        offsetof(CPUX86State,xmm_regs[reg].ZMM_L(3)));
+                        offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)));
+            if (s->vex_l) {
+                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(4)),
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_L(5)));
+                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(6)),
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_L(7)));
+            } else {
+                gen_clear_ymmh(s, reg);
+            }
             break;
         case 0x178:
         case 0x378:
+            CHECK_NO_VEX(s);
             {
                 int bit_index, field_length;
 
@@ -3393,8 +3920,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     goto illegal_op;
                 field_length = x86_ldub_code(env, s) & 0x3F;
                 bit_index = x86_ldub_code(env, s) & 0x3F;
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                    offsetof(CPUX86State,xmm_regs[reg]));
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, XMM_OFFSET(reg));
                 if (b1 == 1)
                     gen_helper_extrq_i(cpu_env, s->ptr0,
                                        tcg_const_i32(bit_index),
@@ -3406,6 +3932,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x7e: /* movd ea, mm */
+            CHECK_NO_VEX(s);
 #ifdef TARGET_X86_64
             if (s->dflag == MO_64) {
                 tcg_gen_ld_i64(s->T0, cpu_env,
@@ -3420,20 +3947,22 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x17e: /* movd ea, xmm */
+            CHECK_AVX_V0_128(s);
 #ifdef TARGET_X86_64
             if (s->dflag == MO_64) {
                 tcg_gen_ld_i64(s->T0, cpu_env,
-                               offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
+                               offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)));
                 gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 1);
             } else
 #endif
             {
                 tcg_gen_ld32u_tl(s->T0, cpu_env,
-                                 offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
+                                 offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)));
                 gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 1);
             }
             break;
         case 0x27e: /* movq xmm, ea */
+            CHECK_AVX_V0_128(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_ldq_env_A0(s, offsetof(CPUX86State,
@@ -3441,11 +3970,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
+                            offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)));
             }
             gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)));
+            gen_clear_ymmh(s, reg);
             break;
         case 0x7f: /* movq ea, mm */
+            CHECK_NO_VEX(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_stq_env_A0(s, offsetof(CPUX86State, fpregs[reg].mmx));
@@ -3461,40 +3992,64 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x129: /* movapd */
         case 0x17f: /* movdqa ea, xmm */
         case 0x27f: /* movdqu ea, xmm */
+            CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                if (s->vex_l) {
+                    gen_sty_env_A0(s, XMM_OFFSET(reg));
+                } else {
+                    gen_sto_env_A0(s, XMM_OFFSET(reg));
+                }
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                gen_op_movo(s, offsetof(CPUX86State, xmm_regs[rm]),
-                            offsetof(CPUX86State,xmm_regs[reg]));
+                gen_op_movo(s, XMM_OFFSET(rm), XMM_OFFSET(reg));
+                if (s->vex_l) {
+                    gen_op_movo_ymmh(s, XMM_OFFSET(rm), XMM_OFFSET(reg));
+                } else {
+                    gen_clear_ymmh(s, rm);
+                }
             }
             break;
         case 0x211: /* movss ea, xmm */
             if (mod != 3) {
+                CHECK_AVX_V0_128(s);
                 gen_lea_modrm(env, s, modrm);
                 tcg_gen_ld32u_tl(s->T0, cpu_env,
                                  offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)));
                 gen_op_st_v(s, MO_32, s->T0, s->A0);
             } else {
+                CHECK_AVX_128(s);
                 rm = (modrm & 7) | REX_B(s);
+                if (rm != reg_v) {
+                    gen_op_movo(s, XMM_OFFSET(rm), XMM_OFFSET(reg_v));
+                }
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_L(0)),
-                            offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)));
+                gen_clear_ymmh(s, rm);
             }
             break;
         case 0x311: /* movsd ea, xmm */
             if (mod != 3) {
+                CHECK_AVX_V0_128(s);
                 gen_lea_modrm(env, s, modrm);
                 gen_stq_env_A0(s, offsetof(CPUX86State,
                                            xmm_regs[reg].ZMM_Q(0)));
             } else {
+                CHECK_AVX_128(s);
                 rm = (modrm & 7) | REX_B(s);
+                if (rm != reg_v) {
+                    gen_op_movq(s,
+                            offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(1)),
+                            offsetof(CPUX86State, xmm_regs[reg_v].ZMM_Q(1)));
+                }
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)));
+                gen_clear_ymmh(s, rm);
             }
             break;
         case 0x013: /* movlps */
         case 0x113: /* movlpd */
+            CHECK_AVX_V0_128(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_stq_env_A0(s, offsetof(CPUX86State,
@@ -3505,6 +4060,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x017: /* movhps */
         case 0x117: /* movhpd */
+            CHECK_AVX_V0_128(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_stq_env_A0(s, offsetof(CPUX86State,
@@ -3521,65 +4077,91 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x173:
             val = x86_ldub_code(env, s);
             if (is_xmm) {
+                CHECK_AVX(s);
+                CHECK_AVX2_256(s);
                 tcg_gen_movi_tl(s->T0, val);
                 tcg_gen_st32_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State, xmm_t0.ZMM_L(0)));
                 tcg_gen_movi_tl(s->T0, 0);
                 tcg_gen_st32_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State, xmm_t0.ZMM_L(1)));
-                op1_offset = offsetof(CPUX86State,xmm_t0);
+                op1_offset = offsetof(CPUX86State, xmm_t0);
             } else {
+                CHECK_NO_VEX(s);
                 tcg_gen_movi_tl(s->T0, val);
                 tcg_gen_st32_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State, mmx_t0.MMX_L(0)));
                 tcg_gen_movi_tl(s->T0, 0);
                 tcg_gen_st32_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State, mmx_t0.MMX_L(1)));
-                op1_offset = offsetof(CPUX86State,mmx_t0);
+                op1_offset = offsetof(CPUX86State, mmx_t0);
             }
             assert(b1 < 2);
-            sse_fn_epp = sse_op_table2[((b - 1) & 3) * 8 +
+            if (s->vex_l) {
+                b1 = 2;
+            }
+            SSEFunc_0_eppp fn = sse_op_table2[((b - 1) & 3) * 8 +
                                        (((modrm >> 3)) & 7)][b1];
-            if (!sse_fn_epp) {
+            if (!fn) {
                 goto unknown_op;
             }
             if (is_xmm) {
                 rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+                op2_offset = XMM_OFFSET(rm);
+                if (s->prefix & PREFIX_VEX) {
+                    v_offset = XMM_OFFSET(reg_v);
+                } else {
+                    v_offset = op2_offset;
+                }
             } else {
                 rm = (modrm & 7);
                 op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
+                v_offset = op2_offset;
+            }
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, v_offset);
+            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+            tcg_gen_addi_ptr(s->ptr2, cpu_env, op1_offset);
+            fn(cpu_env, s->ptr0, s->ptr1, s->ptr2);
+            if (!s->vex_l) {
+                gen_clear_ymmh(s, reg_v);
             }
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op2_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op1_offset);
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
             break;
         case 0x050: /* movmskps */
+            CHECK_AVX_V0(s);
             rm = (modrm & 7) | REX_B(s);
             tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                             offsetof(CPUX86State,xmm_regs[rm]));
-            gen_helper_movmskps(s->tmp2_i32, cpu_env, s->ptr0);
+                             offsetof(CPUX86State, xmm_regs[rm]));
+            if (s->vex_l) {
+                gen_helper_movmskps_ymm(s->tmp2_i32, cpu_env, s->ptr0);
+            } else {
+                gen_helper_movmskps_xmm(s->tmp2_i32, cpu_env, s->ptr0);
+            }
             tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
             break;
         case 0x150: /* movmskpd */
+            CHECK_AVX_V0(s);
             rm = (modrm & 7) | REX_B(s);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                             offsetof(CPUX86State,xmm_regs[rm]));
-            gen_helper_movmskpd(s->tmp2_i32, cpu_env, s->ptr0);
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, XMM_OFFSET(rm));
+            if (s->vex_l) {
+                gen_helper_movmskpd_ymm(s->tmp2_i32, cpu_env, s->ptr0);
+            } else {
+                gen_helper_movmskpd_xmm(s->tmp2_i32, cpu_env, s->ptr0);
+            }
             tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
             break;
         case 0x02a: /* cvtpi2ps */
         case 0x12a: /* cvtpi2pd */
-            gen_helper_enter_mmx(cpu_env);
+            CHECK_NO_VEX(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 op2_offset = offsetof(CPUX86State,mmx_t0);
                 gen_ldq_env_A0(s, op2_offset);
             } else {
+                gen_helper_enter_mmx(cpu_env);
                 rm = (modrm & 7);
                 op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
             }
-            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+            op1_offset = XMM_OFFSET(reg);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
             switch(b >> 8) {
@@ -3594,9 +4176,14 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x22a: /* cvtsi2ss */
         case 0x32a: /* cvtsi2sd */
+            CHECK_AVX(s);
             ot = mo_64_32(s->dflag);
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+            op1_offset = XMM_OFFSET(reg);
+            v_offset = XMM_OFFSET(reg_v);
+            if (op1_offset != v_offset) {
+                gen_op_movo(s, op1_offset, v_offset);
+            }
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             if (ot == MO_32) {
                 SSEFunc_0_epi sse_fn_epi = sse_op_table3ai[(b >> 8) & 1];
@@ -3610,19 +4197,21 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 goto illegal_op;
 #endif
             }
+            gen_clear_ymmh(s, reg);
             break;
         case 0x02c: /* cvttps2pi */
         case 0x12c: /* cvttpd2pi */
         case 0x02d: /* cvtps2pi */
         case 0x12d: /* cvtpd2pi */
+            CHECK_NO_VEX(s);
             gen_helper_enter_mmx(cpu_env);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                op2_offset = offsetof(CPUX86State,xmm_t0);
+                op2_offset = offsetof(CPUX86State, xmm_t0);
                 gen_ldo_env_A0(s, op2_offset);
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+                op2_offset = XMM_OFFSET(rm);
             }
             op1_offset = offsetof(CPUX86State,fpregs[reg & 7].mmx);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
@@ -3646,6 +4235,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x32c: /* cvttsd2si */
         case 0x22d: /* cvtss2si */
         case 0x32d: /* cvtsd2si */
+            CHECK_AVX_V0(s);
             ot = mo_64_32(s->dflag);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
@@ -3656,10 +4246,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     tcg_gen_st32_tl(s->T0, cpu_env,
                                     offsetof(CPUX86State, xmm_t0.ZMM_L(0)));
                 }
-                op2_offset = offsetof(CPUX86State,xmm_t0);
+                op2_offset = offsetof(CPUX86State, xmm_t0);
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+                op2_offset = XMM_OFFSET(rm);
             }
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op2_offset);
             if (ot == MO_32) {
@@ -3680,21 +4270,28 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0xc4: /* pinsrw */
         case 0x1c4:
+            CHECK_AVX_128(s);
             s->rip_offset = 1;
             gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
             val = x86_ldub_code(env, s);
+            if (reg != reg_v) {
+                gen_op_movo(s, XMM_OFFSET(reg), XMM_OFFSET(reg_v));
+            }
             if (b1) {
                 val &= 7;
                 tcg_gen_st16_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State,xmm_regs[reg].ZMM_W(val)));
+                        offsetof(CPUX86State, xmm_regs[reg].ZMM_W(val)));
             } else {
+                CHECK_NO_VEX(s);
                 val &= 3;
                 tcg_gen_st16_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State,fpregs[reg].mmx.MMX_W(val)));
+                        offsetof(CPUX86State, fpregs[reg].mmx.MMX_W(val)));
             }
+            gen_clear_ymmh(s, reg);
             break;
         case 0xc5: /* pextrw */
         case 0x1c5:
+            CHECK_AVX_V0_128(s);
             if (mod != 3)
                 goto illegal_op;
             ot = mo_64_32(s->dflag);
@@ -3703,17 +4300,18 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 val &= 7;
                 rm = (modrm & 7) | REX_B(s);
                 tcg_gen_ld16u_tl(s->T0, cpu_env,
-                                 offsetof(CPUX86State,xmm_regs[rm].ZMM_W(val)));
+                        offsetof(CPUX86State, xmm_regs[rm].ZMM_W(val)));
             } else {
                 val &= 3;
                 rm = (modrm & 7);
                 tcg_gen_ld16u_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State,fpregs[rm].mmx.MMX_W(val)));
+                        offsetof(CPUX86State, fpregs[rm].mmx.MMX_W(val)));
             }
             reg = ((modrm >> 3) & 7) | REX_R(s);
             gen_op_mov_reg_v(s, ot, reg, s->T0);
             break;
         case 0x1d6: /* movq ea, xmm */
+            CHECK_AVX_V0_128(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_stq_env_A0(s, offsetof(CPUX86State,
@@ -3721,12 +4319,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)));
                 gen_op_movq_env_0(s,
                                   offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(1)));
             }
             break;
         case 0x2d6: /* movq2dq */
+            CHECK_NO_VEX(s);
             gen_helper_enter_mmx(cpu_env);
             rm = (modrm & 7);
             gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
@@ -3734,21 +4333,27 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)));
             break;
         case 0x3d6: /* movdq2q */
+            CHECK_NO_VEX(s);
             gen_helper_enter_mmx(cpu_env);
             rm = (modrm & 7) | REX_B(s);
             gen_op_movq(s, offsetof(CPUX86State, fpregs[reg & 7].mmx),
-                        offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
+                        offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)));
             break;
         case 0xd7: /* pmovmskb */
         case 0x1d7:
             if (mod != 3)
                 goto illegal_op;
             if (b1) {
+                CHECK_AVX_V0(s);
                 rm = (modrm & 7) | REX_B(s);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State, xmm_regs[rm]));
-                gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, s->ptr0);
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, XMM_OFFSET(rm));
+                if (s->vex_l) {
+                    gen_helper_pmovmskb_ymm(s->tmp2_i32, cpu_env, s->ptr0);
+                } else {
+                    gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, s->ptr0);
+                }
             } else {
+                CHECK_NO_VEX(s);
                 rm = (modrm & 7);
                 tcg_gen_addi_ptr(s->ptr0, cpu_env,
                                  offsetof(CPUX86State, fpregs[rm].mmx));
@@ -3768,50 +4373,241 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             rm = modrm & 7;
             reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
+            if (s->prefix & PREFIX_VEX) {
+                reg_v = s->vex_v;
+            } else {
+                reg_v = reg;
+            }
 
             assert(b1 < 2);
-            sse_fn_epp = sse_op_table6[b].op[b1];
-            if (!sse_fn_epp) {
+            op6 = sse_op_table6[b];
+            if (op6.ext_mask == 0) {
                 goto unknown_op;
             }
-            if (!(s->cpuid_ext_features & sse_op_table6[b].ext_mask))
+            if (!(s->cpuid_ext_features & op6.ext_mask)) {
+                goto illegal_op;
+            }
+
+            if (op6.ext_mask == CPUID_EXT_AVX
+                    && (s->prefix & PREFIX_VEX) == 0) {
                 goto illegal_op;
+            }
+            if (op6.flags & SSE_OPF_AVX2) {
+                CHECK_AVX2(s);
+            }
 
             if (b1) {
-                op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+                if (op6.flags & SSE_OPF_V0) {
+                    CHECK_AVX_V0(s);
+                } else {
+                    CHECK_AVX(s);
+                }
+
+                op1_offset = XMM_OFFSET(reg);
+
+                if ((b & 0xfc) == 0x90) { /* vgather */
+                    int scale, index, base;
+                    target_long disp = 0;
+                    CHECK_AVX2(s);
+                    if (mod == 3 || rm != 4) {
+                        goto illegal_op;
+                    }
+
+                    /* Vector SIB */
+                    val = x86_ldub_code(env, s);
+                    scale = (val >> 6) & 3;
+                    index = ((val >> 3) & 7) | REX_X(s);
+                    base = (val & 7) | REX_B(s);
+                    switch (mod) {
+                    case 0:
+                        if (base == 5) {
+                            base = -1;
+                            disp = (int32_t)x86_ldl_code(env, s);
+                        }
+                        break;
+                    case 1:
+                        disp = (int8_t)x86_ldub_code(env, s);
+                        break;
+                    default:
+                    case 2:
+                        disp = (int32_t)x86_ldl_code(env, s);
+                        break;
+                    }
+
+                    /* destination, index and mask registers must not overlap */
+                    if (reg == index || reg == reg_v) {
+                        goto illegal_op;
+                    }
+
+                    tcg_gen_addi_tl(s->A0, cpu_regs[base], disp);
+                    gen_add_A0_ds_seg(s);
+                    op2_offset = XMM_OFFSET(index);
+                    v_offset = XMM_OFFSET(reg_v);
+                    tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                    tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+                    tcg_gen_addi_ptr(s->ptr2, cpu_env, v_offset);
+                    b1 = REX_W(s) | ((b & 1) << 1) | (scale << 2);
+                    sse_op_table10[b1][s->vex_l](cpu_env,
+                            s->ptr0, s->ptr2, s->ptr1, s->A0);
+                    if (!s->vex_l) {
+                        gen_clear_ymmh(s, reg);
+                        gen_clear_ymmh(s, reg_v);
+                    }
+                    return;
+                }
+
+                if (op6.flags & SSE_OPF_MMX) {
+                    CHECK_AVX2_256(s);
+                }
+                if (op6.flags & SSE_OPF_BLENDV) {
+                    /*
+                     * VEX encodings of the blendv opcodes are not valid
+                     * they use a different opcode with an 0f 3a prefix
+                     */
+                    CHECK_NO_VEX(s);
+                }
+
                 if (mod == 3) {
-                    op2_offset = offsetof(CPUX86State,xmm_regs[rm | REX_B(s)]);
+                    op2_offset = XMM_OFFSET(rm | REX_B(s));
                 } else {
-                    op2_offset = offsetof(CPUX86State,xmm_t0);
+                    int size;
+                    op2_offset = offsetof(CPUX86State, xmm_t0);
                     gen_lea_modrm(env, s, modrm);
                     switch (b) {
+                    case 0x78: /* vpbroadcastb */
+                        size = 8;
+                        break;
+                    case 0x79: /* vpbroadcastw */
+                        size = 16;
+                        break;
+                    case 0x18: /* vbroadcastss */
+                    case 0x58: /* vpbroadcastd */
+                        size = 32;
+                        break;
+                    case 0x19: /* vbroadcastsd */
+                    case 0x59: /* vpbroadcastq */
+                        size = 64;
+                        break;
+                    case 0x1a: /* vbroadcastf128 */
+                    case 0x5a: /* vbroadcasti128 */
+                        size = 128;
+                        break;
                     case 0x20: case 0x30: /* pmovsxbw, pmovzxbw */
                     case 0x23: case 0x33: /* pmovsxwd, pmovzxwd */
                     case 0x25: case 0x35: /* pmovsxdq, pmovzxdq */
-                        gen_ldq_env_A0(s, op2_offset +
-                                        offsetof(ZMMReg, ZMM_Q(0)));
+                        size = 64;
                         break;
                     case 0x21: case 0x31: /* pmovsxbd, pmovzxbd */
                     case 0x24: case 0x34: /* pmovsxwq, pmovzxwq */
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
-                        tcg_gen_st_i32(s->tmp2_i32, cpu_env, op2_offset +
-                                        offsetof(ZMMReg, ZMM_L(0)));
+                        size = 32;
                         break;
                     case 0x22: case 0x32: /* pmovsxbq, pmovzxbq */
+                        size = 16;
+                        break;
+                    case 0x2a:            /* movntqda */
+                        if (s->vex_l) {
+                            gen_ldy_env_A0(s, op1_offset);
+                        } else {
+                            gen_ldo_env_A0(s, op1_offset);
+                            gen_clear_ymmh(s, reg);
+                        }
+                        return;
+                    case 0x2e: /* maskmovpd */
+                        b1 = 0;
+                        goto vpmaskmov;
+                    case 0x2f: /* maskmovpd */
+                        b1 = 1;
+                        goto vpmaskmov;
+                    case 0x8e: /* vpmaskmovd, vpmaskmovq */
+                        CHECK_AVX2(s);
+                        b1 = REX_W(s);
+                    vpmaskmov:
+                        tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                        v_offset = XMM_OFFSET(reg_v);
+                        tcg_gen_addi_ptr(s->ptr2, cpu_env, v_offset);
+                        sse_op_table9[b1][s->vex_l](cpu_env,
+                                s->ptr0, s->ptr2, s->A0);
+                        return;
+                    default:
+                        size = 128;
+                    }
+                    if ((op6.flags & SSE_OPF_SCALAR) == 0 && s->vex_l) {
+                        size *= 2;
+                    }
+                    switch (size) {
+                    case 8:
+                        tcg_gen_qemu_ld_tl(s->tmp0, s->A0,
+                                           s->mem_index, MO_UB);
+                        tcg_gen_st16_tl(s->tmp0, cpu_env, op2_offset +
+                                        offsetof(ZMMReg, ZMM_B(0)));
+                        break;
+                    case 16:
                         tcg_gen_qemu_ld_tl(s->tmp0, s->A0,
                                            s->mem_index, MO_LEUW);
                         tcg_gen_st16_tl(s->tmp0, cpu_env, op2_offset +
                                         offsetof(ZMMReg, ZMM_W(0)));
                         break;
-                    case 0x2a:            /* movntqda */
-                        gen_ldo_env_A0(s, op1_offset);
-                        return;
-                    default:
+                    case 32:
+                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                            s->mem_index, MO_LEUL);
+                        tcg_gen_st_i32(s->tmp2_i32, cpu_env, op2_offset +
+                                        offsetof(ZMMReg, ZMM_L(0)));
+                        break;
+                    case 64:
+                        gen_ldq_env_A0(s, op2_offset +
+                                        offsetof(ZMMReg, ZMM_Q(0)));
+                        break;
+                    case 128:
                         gen_ldo_env_A0(s, op2_offset);
+                        break;
+                    case 256:
+                        gen_ldy_env_A0(s, op2_offset);
+                        break;
+                    }
+                }
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+                if (s->vex_l) {
+                    b1 = 2;
+                }
+                if (!op6.fn[b1].op1) {
+                    goto illegal_op;
+                }
+                if (op6.flags & SSE_OPF_V0) {
+                    op6.fn[b1].op1(cpu_env, s->ptr0, s->ptr1);
+                } else {
+                    v_offset = XMM_OFFSET(reg_v);
+                    tcg_gen_addi_ptr(s->ptr2, cpu_env, v_offset);
+                    if (op6.flags & SSE_OPF_BLENDV) {
+                        TCGv_ptr mask = tcg_temp_new_ptr();
+                        tcg_gen_addi_ptr(mask, cpu_env, XMM_OFFSET(0));
+                        op6.fn[b1].op3(cpu_env, s->ptr0, s->ptr2, s->ptr1,
+                                       mask);
+                        tcg_temp_free_ptr(mask);
+                    } else {
+                        SSEFunc_0_eppp fn = op6.fn[b1].op2;
+                        if (REX_W(s)) {
+                            if (b >= 0x45 && b <= 0x47) {
+                                fn = sse_op_table8[b - 0x45][b1 - 1];
+                            } else if (b == 0x8c) {
+                                if (s->vex_l) {
+                                    fn = gen_helper_vpmaskmovq_ymm;
+                                } else {
+                                    fn = gen_helper_vpmaskmovq_xmm;
+                                }
+                            }
+                        }
+                        fn(cpu_env, s->ptr0, s->ptr2, s->ptr1);
                     }
                 }
+                if ((op6.flags & SSE_OPF_CMP) == 0 && s->vex_l == 0) {
+                    gen_clear_ymmh(s, reg);
+                }
             } else {
+                CHECK_NO_VEX(s);
+                if ((op6.flags & SSE_OPF_MMX) == 0) {
+                    goto unknown_op;
+                }
                 op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
                 if (mod == 3) {
                     op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
@@ -3820,16 +4616,16 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     gen_lea_modrm(env, s, modrm);
                     gen_ldq_env_A0(s, op2_offset);
                 }
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+                if (op6.flags & SSE_OPF_V0) {
+                    op6.fn[0].op1(cpu_env, s->ptr0, s->ptr1);
+                } else {
+                    op6.fn[0].op2(cpu_env, s->ptr0, s->ptr0, s->ptr1);
+                }
             }
-            if (sse_fn_epp == SSE_SPECIAL) {
-                goto unknown_op;
-            }
-
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
 
-            if (b == 0x17) {
+            if (op6.flags & SSE_OPF_CMP) {
                 set_cc_op(s, CC_OP_EFLAGS);
             }
             break;
@@ -3846,6 +4642,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             case 0x3f0: /* crc32 Gd,Eb */
             case 0x3f1: /* crc32 Gd,Ey */
             do_crc32:
+                CHECK_NO_VEX(s);
                 if (!(s->cpuid_ext_features & CPUID_EXT_SSE42)) {
                     goto illegal_op;
                 }
@@ -3877,6 +4674,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 /* FALLTHRU */
             case 0x0f0: /* movbe Gy,My */
             case 0x0f1: /* movbe My,Gy */
+                CHECK_NO_VEX(s);
                 if (!(s->cpuid_ext_features & CPUID_EXT_MOVBE)) {
                     goto illegal_op;
                 }
@@ -4043,6 +4841,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
 
             case 0x1f6: /* adcx Gy, Ey */
             case 0x2f6: /* adox Gy, Ey */
+                CHECK_NO_VEX(s);
                 if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_ADX)) {
                     goto illegal_op;
                 } else {
@@ -4196,18 +4995,28 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             rm = modrm & 7;
             reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
+            if (s->prefix & PREFIX_VEX) {
+                reg_v = s->vex_v;
+            } else {
+                reg_v = reg;
+            }
 
             assert(b1 < 2);
-            sse_fn_eppi = sse_op_table7[b].op[b1];
-            if (!sse_fn_eppi) {
+            op7 = sse_op_table7[b];
+            if (op7.ext_mask == 0) {
                 goto unknown_op;
             }
-            if (!(s->cpuid_ext_features & sse_op_table7[b].ext_mask))
+            if (!(s->cpuid_ext_features & op7.ext_mask)) {
                 goto illegal_op;
+            }
 
             s->rip_offset = 1;
 
-            if (sse_fn_eppi == SSE_SPECIAL) {
+            if (op7.flags & SSE_OPF_SPECIAL) {
+                /* None of the "special" ops are valid on mmx registers */
+                if (b1 == 0) {
+                    goto illegal_op;
+                }
                 ot = mo_64_32(s->dflag);
                 rm = (modrm & 7) | REX_B(s);
                 if (mod != 3)
@@ -4216,6 +5025,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 val = x86_ldub_code(env, s);
                 switch (b) {
                 case 0x14: /* pextrb */
+                    CHECK_AVX_V0_128(s);
                     tcg_gen_ld8u_tl(s->T0, cpu_env, offsetof(CPUX86State,
                                             xmm_regs[reg].ZMM_B(val & 15)));
                     if (mod == 3) {
@@ -4226,6 +5036,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     }
                     break;
                 case 0x15: /* pextrw */
+                    CHECK_AVX_V0_128(s);
                     tcg_gen_ld16u_tl(s->T0, cpu_env, offsetof(CPUX86State,
                                             xmm_regs[reg].ZMM_W(val & 7)));
                     if (mod == 3) {
@@ -4236,6 +5047,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     }
                     break;
                 case 0x16:
+                    CHECK_AVX_V0_128(s);
                     if (ot == MO_32) { /* pextrd */
                         tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
                                         offsetof(CPUX86State,
@@ -4263,6 +5075,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     }
                     break;
                 case 0x17: /* extractps */
+                    CHECK_AVX_V0_128(s);
                     tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State,
                                             xmm_regs[reg].ZMM_L(val & 3)));
                     if (mod == 3) {
@@ -4273,6 +5086,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     }
                     break;
                 case 0x20: /* pinsrb */
+                    CHECK_AVX_128(s);
+                    if (reg != reg_v) {
+                        gen_op_movo(s, XMM_OFFSET(reg), XMM_OFFSET(reg_v));
+                    }
                     if (mod == 3) {
                         gen_op_mov_v_reg(s, MO_32, s->T0, rm);
                     } else {
@@ -4281,18 +5098,23 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     }
                     tcg_gen_st8_tl(s->T0, cpu_env, offsetof(CPUX86State,
                                             xmm_regs[reg].ZMM_B(val & 15)));
+                    gen_clear_ymmh(s, reg);
                     break;
                 case 0x21: /* insertps */
+                    CHECK_AVX_128(s);
                     if (mod == 3) {
                         tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
-                                        offsetof(CPUX86State,xmm_regs[rm]
+                                        offsetof(CPUX86State, xmm_regs[rm]
                                                 .ZMM_L((val >> 6) & 3)));
                     } else {
                         tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
                                             s->mem_index, MO_LEUL);
                     }
+                    if (reg != reg_v) {
+                        gen_op_movo(s, XMM_OFFSET(reg), XMM_OFFSET(reg_v));
+                    }
                     tcg_gen_st_i32(s->tmp2_i32, cpu_env,
-                                    offsetof(CPUX86State,xmm_regs[reg]
+                                    offsetof(CPUX86State, xmm_regs[reg]
                                             .ZMM_L((val >> 4) & 3)));
                     if ((val >> 0) & 1)
                         tcg_gen_st_i32(tcg_const_i32(0 /*float32_zero*/),
@@ -4310,8 +5132,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                         tcg_gen_st_i32(tcg_const_i32(0 /*float32_zero*/),
                                         cpu_env, offsetof(CPUX86State,
                                                 xmm_regs[reg].ZMM_L(3)));
+                    gen_clear_ymmh(s, reg);
                     break;
                 case 0x22:
+                    CHECK_AVX_128(s);
+                    if (reg != reg_v) {
+                        gen_op_movo(s, XMM_OFFSET(reg), XMM_OFFSET(reg_v));
+                    }
                     if (ot == MO_32) { /* pinsrd */
                         if (mod == 3) {
                             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[rm]);
@@ -4337,21 +5164,91 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                         goto illegal_op;
 #endif
                     }
+                    gen_clear_ymmh(s, reg);
+                    break;
+                case 0x38: /* vinserti128 */
+                    CHECK_AVX2_256(s);
+                    /* fall through */
+                case 0x18: /* vinsertf128 */
+                    CHECK_AVX(s);
+                    if ((s->prefix & PREFIX_VEX) == 0 || s->vex_l == 0) {
+                        goto illegal_op;
+                    }
+                    if (mod == 3) {
+                        if (val & 1) {
+                            gen_op_movo_ymm_l2h(s, XMM_OFFSET(reg),
+                                                XMM_OFFSET(rm));
+                        } else {
+                            gen_op_movo(s, XMM_OFFSET(reg), XMM_OFFSET(rm));
+                        }
+                    } else {
+                        if (val & 1) {
+                            gen_ldo_env_A0_ymmh(s, XMM_OFFSET(reg));
+                        } else {
+                            gen_ldo_env_A0(s, XMM_OFFSET(reg));
+                        }
+                    }
+                    if (reg != reg_v) {
+                        if (val & 1) {
+                            gen_op_movo(s, XMM_OFFSET(reg), XMM_OFFSET(reg_v));
+                        } else {
+                            gen_op_movo_ymmh(s, XMM_OFFSET(reg),
+                                             XMM_OFFSET(reg_v));
+                        }
+                    }
+                    break;
+                case 0x39: /* vextracti128 */
+                    CHECK_AVX2_256(s);
+                    /* fall through */
+                case 0x19: /* vextractf128 */
+                    CHECK_AVX_V0(s);
+                    if ((s->prefix & PREFIX_VEX) == 0 || s->vex_l == 0) {
+                        goto illegal_op;
+                    }
+                    if (mod == 3) {
+                        op1_offset = XMM_OFFSET(rm);
+                        if (val & 1) {
+                            gen_op_movo_ymm_h2l(s, XMM_OFFSET(rm),
+                                                XMM_OFFSET(reg));
+                        } else {
+                            gen_op_movo(s, XMM_OFFSET(rm), XMM_OFFSET(reg));
+                        }
+                        gen_clear_ymmh(s, rm);
+                    } else{
+                        if (val & 1) {
+                            gen_sto_env_A0_ymmh(s, XMM_OFFSET(reg));
+                        } else {
+                            gen_sto_env_A0(s, XMM_OFFSET(reg));
+                        }
+                    }
                     break;
+                default:
+                    goto unknown_op;
                 }
                 return;
             }
 
-            if (b1) {
-                op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
-                if (mod == 3) {
-                    op2_offset = offsetof(CPUX86State,xmm_regs[rm | REX_B(s)]);
-                } else {
-                    op2_offset = offsetof(CPUX86State,xmm_t0);
-                    gen_lea_modrm(env, s, modrm);
-                    gen_ldo_env_A0(s, op2_offset);
+            CHECK_AVX(s);
+            scalar_op = (s->prefix & PREFIX_VEX)
+                && (op7.flags & SSE_OPF_SCALAR)
+                && !(op7.flags & SSE_OPF_CMP);
+            if (is_xmm && (op7.flags & SSE_OPF_MMX)) {
+                CHECK_AVX2_256(s);
+            }
+            if (op7.flags & SSE_OPF_AVX2) {
+                CHECK_AVX2(s);
+            }
+            if ((op7.flags & SSE_OPF_V0) && !scalar_op) {
+                CHECK_AVX_V0(s);
+            }
+
+            if (b1 == 0) {
+                CHECK_NO_VEX(s);
+                /* MMX */
+                if ((op7.flags & SSE_OPF_MMX) == 0) {
+                    goto illegal_op;
                 }
-            } else {
+
                 op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
                 if (mod == 3) {
                     op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
@@ -4360,9 +5257,37 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     gen_lea_modrm(env, s, modrm);
                     gen_ldq_env_A0(s, op2_offset);
                 }
+                val = x86_ldub_code(env, s);
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+
+                /* We only actually have one MMX instuction (palignr) */
+                assert(b == 0x0f);
+
+                op7.fn[0].op2(cpu_env, s->ptr0, s->ptr0, s->ptr1,
+                              tcg_const_i32(val));
+                break;
+            }
+
+            /* SSE */
+            if (op7.flags & SSE_OPF_BLENDV && !(s->prefix & PREFIX_VEX)) {
+                /* Only VEX encodings are valid for these blendv opcodes */
+                goto illegal_op;
+            }
+            op1_offset = XMM_OFFSET(reg);
+            if (mod == 3) {
+                op2_offset = XMM_OFFSET(rm | REX_B(s));
+            } else {
+                op2_offset = offsetof(CPUX86State, xmm_t0);
+                gen_lea_modrm(env, s, modrm);
+                if (s->vex_l) {
+                    gen_ldy_env_A0(s, op2_offset);
+                } else {
+                    gen_ldo_env_A0(s, op2_offset);
+                }
             }
-            val = x86_ldub_code(env, s);
 
+            val = x86_ldub_code(env, s);
             if ((b & 0xfc) == 0x60) { /* pcmpXstrX */
                 set_cc_op(s, CC_OP_EFLAGS);
 
@@ -4370,11 +5295,49 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     /* The helper must use entire 64-bit gp registers */
                     val |= 1 << 8;
                 }
+                if ((b & 1) == 0) /* pcmpXsrtm */
+                    gen_clear_ymmh(s, 0);
             }
 
+            if (s->vex_l) {
+                b1 = 2;
+            }
+            v_offset = XMM_OFFSET(reg_v);
+            /*
+             * Populate the top part of the destination register for VEX
+             * encoded scalar operations
+             */
+            if (scalar_op && op1_offset != v_offset) {
+                if (b == 0x0a) { /* roundss */
+                    gen_op_movl(s,
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
+                            offsetof(CPUX86State, xmm_regs[reg_v].ZMM_L(1)));
+                }
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
+                            offsetof(CPUX86State, xmm_regs[reg_v].ZMM_Q(1)));
+            }
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            sse_fn_eppi(cpu_env, s->ptr0, s->ptr1, tcg_const_i32(val));
+            if (op7.flags & SSE_OPF_V0) {
+                op7.fn[b1].op1(cpu_env, s->ptr0, s->ptr1, tcg_const_i32(val));
+            } else {
+                tcg_gen_addi_ptr(s->ptr2, cpu_env, v_offset);
+                if (op7.flags & SSE_OPF_BLENDV) {
+                    TCGv_ptr mask = tcg_temp_new_ptr();
+                    tcg_gen_addi_ptr(mask, cpu_env, XMM_OFFSET(val >> 4));
+                    op7.fn[b1].op3(cpu_env, s->ptr0, s->ptr2, s->ptr1, mask);
+                    tcg_temp_free_ptr(mask);
+                } else {
+                    op7.fn[b1].op2(cpu_env, s->ptr0, s->ptr2, s->ptr1,
+                                   tcg_const_i32(val));
+                }
+            }
+            if ((op7.flags & SSE_OPF_CMP) == 0 && s->vex_l == 0) {
+                gen_clear_ymmh(s, reg);
+            }
+            if (op7.flags & SSE_OPF_CMP) {
+                set_cc_op(s, CC_OP_EFLAGS);
+            }
             break;
 
         case 0x33a:
@@ -4424,34 +5387,49 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         default:
             break;
         }
+        if (s->vex_l) {
+            b1 += 4;
+        }
+        if ((sse_op.flags & SSE_OPF_3DNOW) == 0 && !sse_op.fn[b1].op1) {
+            goto unknown_op;
+        }
         if (is_xmm) {
-            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+            scalar_op = (s->prefix & PREFIX_VEX)
+                && (sse_op.flags & SSE_OPF_SCALAR)
+                && !(sse_op.flags & SSE_OPF_CMP)
+                && (b1 == 2 || b1 == 3);
+            /* VEX encoded scalar ops always have 3 operands! */
+            if ((sse_op.flags & SSE_OPF_V0) && !scalar_op) {
+                CHECK_AVX_V0(s);
+            } else {
+                CHECK_AVX(s);
+            }
+            if (sse_op.flags & SSE_OPF_MMX) {
+                CHECK_AVX2_256(s);
+            }
+            op1_offset = XMM_OFFSET(reg);
             if (mod != 3) {
-                int sz = 4;
+                int sz = s->vex_l ? 5 : 4;
 
                 gen_lea_modrm(env, s, modrm);
-                op2_offset = offsetof(CPUX86State,xmm_t0);
-
-                switch (b) {
-                case 0x50 ... 0x5a:
-                case 0x5c ... 0x5f:
-                case 0xc2:
-                    /* Most sse scalar operations.  */
-                    if (b1 == 2) {
-                        sz = 2;
-                    } else if (b1 == 3) {
-                        sz = 3;
-                    }
-                    break;
+                op2_offset = offsetof(CPUX86State, xmm_t0);
 
-                case 0x2e:  /* ucomis[sd] */
-                case 0x2f:  /* comis[sd] */
-                    if (b1 == 0) {
-                        sz = 2;
+                if (sse_op.flags & SSE_OPF_SCALAR) {
+                    if (sse_op.flags & SSE_OPF_CMP) {
+                        /* ucomis[sd], comis[sd] */
+                        if (b1 == 0) {
+                            sz = 2;
+                        } else {
+                            sz = 3;
+                        }
                     } else {
-                        sz = 3;
+                        /* Most sse scalar operations.  */
+                        if (b1 == 2) {
+                            sz = 2;
+                        } else if (b1 == 3) {
+                            sz = 3;
+                        }
                     }
-                    break;
                 }
 
                 switch (sz) {
@@ -4459,22 +5437,29 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     /* 32 bit access */
                     gen_op_ld_v(s, MO_32, s->T0, s->A0);
                     tcg_gen_st32_tl(s->T0, cpu_env,
-                                    offsetof(CPUX86State,xmm_t0.ZMM_L(0)));
+                                    offsetof(CPUX86State, xmm_t0.ZMM_L(0)));
                     break;
                 case 3:
                     /* 64 bit access */
                     gen_ldq_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_D(0)));
                     break;
-                default:
+                case 4:
                     /* 128 bit access */
                     gen_ldo_env_A0(s, op2_offset);
                     break;
+                case 5:
+                    /* 256 bit access */
+                    gen_ldy_env_A0(s, op2_offset);
+                    break;
                 }
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+                op2_offset = XMM_OFFSET(rm);
             }
+            v_offset = XMM_OFFSET(reg_v);
         } else {
+            CHECK_NO_VEX(s);
+            scalar_op = 0;
             op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
@@ -4484,60 +5469,100 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 rm = (modrm & 7);
                 op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
             }
-        }
-        switch(b) {
-        case 0x0f: /* 3DNow! data insns */
-            val = x86_ldub_code(env, s);
-            sse_fn_epp = sse_op_table5[val];
-            if (!sse_fn_epp) {
-                goto unknown_op;
+            if (sse_op.flags & SSE_OPF_3DNOW) {
+                /* 3DNow! data insns */
+                val = x86_ldub_code(env, s);
+                SSEFunc_0_epp sse_fn_epp = sse_op_table5[val];
+                if (!sse_fn_epp) {
+                    goto unknown_op;
+                }
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+                sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
+                return;
             }
-            if (!(s->cpuid_ext2_features & CPUID_EXT2_3DNOW)) {
-                goto illegal_op;
+            v_offset = op1_offset;
+        }
+
+        /*
+         * Populate the top part of the destination register for VEX
+         * encoded scalar operations
+         */
+        if (scalar_op && op1_offset != v_offset) {
+            if (b == 0x5a) {
+                /*
+                 * Scalar conversions are tricky because the src and dest
+                 * may be different sizes
+                 */
+                if (op1_offset == op2_offset) {
+                    /*
+                     * The the second source operand overlaps the
+                     * destination, so we need to copy the value
+                     */
+                    op2_offset = offsetof(CPUX86State, xmm_t0);
+                    gen_op_movq(s, op2_offset, op1_offset);
+                }
+                gen_op_movo(s, op1_offset, v_offset);
+            } else {
+                if (b1 == 2) { /* ss */
+                    gen_op_movl(s,
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
+                            offsetof(CPUX86State, xmm_regs[reg_v].ZMM_L(1)));
+                }
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
+                            offsetof(CPUX86State, xmm_regs[reg_v].ZMM_Q(1)));
             }
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
-            break;
-        case 0x70: /* pshufx insn */
-        case 0xc6: /* pshufx insn */
-            val = x86_ldub_code(env, s);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            /* XXX: introduce a new table? */
-            sse_fn_ppi = (SSEFunc_0_ppi)sse_fn_epp;
-            sse_fn_ppi(s->ptr0, s->ptr1, tcg_const_i32(val));
-            break;
-        case 0xc2:
-            /* compare insns, bits 7:3 (7:5 for AVX) are ignored */
-            val = x86_ldub_code(env, s) & 7;
-            sse_fn_epp = sse_op_table4[val][b1];
+        }
 
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
-            break;
-        case 0xf7:
-            /* maskmov : we must prepare A0 */
-            if (mod != 3)
-                goto illegal_op;
-            tcg_gen_mov_tl(s->A0, cpu_regs[R_EDI]);
-            gen_extu(s->aflag, s->A0);
-            gen_add_A0_ds_seg(s);
+        tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+        tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+        if (sse_op.flags & SSE_OPF_V0) {
+            if (sse_op.flags & SSE_OPF_SHUF) {
+                val = x86_ldub_code(env, s);
+                sse_op.fn[b1].op1i(s->ptr0, s->ptr1, tcg_const_i32(val));
+            } else if (b == 0xf7) {
+                /* maskmov : we must prepare A0 */
+                if (mod != 3) {
+                    goto illegal_op;
+                }
+                tcg_gen_mov_tl(s->A0, cpu_regs[R_EDI]);
+                gen_extu(s->aflag, s->A0);
+                gen_add_A0_ds_seg(s);
+
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+                sse_op.fn[b1].op1t(cpu_env, s->ptr0, s->ptr1, s->A0);
+                /* Does not write to the fist operand */
+                return;
+            } else {
+                sse_op.fn[b1].op1(cpu_env, s->ptr0, s->ptr1);
+            }
+        } else {
+            tcg_gen_addi_ptr(s->ptr2, cpu_env, v_offset);
+            if (sse_op.flags & SSE_OPF_SHUF) {
+                val = x86_ldub_code(env, s);
+                sse_op.fn[b1].op2i(s->ptr0, s->ptr2, s->ptr1,
+                                   tcg_const_i32(val));
+            } else {
+                SSEFunc_0_eppp fn = sse_op.fn[b1].op2;
+                if (b == 0xc2) {
+                    /* compare insns */
+                    val = x86_ldub_code(env, s);
+                    if (s->prefix & PREFIX_VEX) {
+                        val &= 0x1f;
+                    } else {
+                        val &= 7;
+                    }
+                    fn = sse_op_table4[val][b1];
+                }
+                fn(cpu_env, s->ptr0, s->ptr2, s->ptr1);
+            }
+        }
 
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            /* XXX: introduce a new table? */
-            sse_fn_eppt = (SSEFunc_0_eppt)sse_fn_epp;
-            sse_fn_eppt(cpu_env, s->ptr0, s->ptr1, s->A0);
-            break;
-        default:
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
-            break;
+        if (s->vex_l == 0 && (sse_op.flags & SSE_OPF_CMP) == 0) {
+            gen_clear_ymmh(s, reg);
         }
-        if (b == 0x2e || b == 0x2f) {
+        if (sse_op.flags & SSE_OPF_CMP) {
             set_cc_op(s, CC_OP_EFLAGS);
         }
     }
@@ -8619,6 +9644,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->tmp4 = tcg_temp_new();
     dc->ptr0 = tcg_temp_new_ptr();
     dc->ptr1 = tcg_temp_new_ptr();
+    dc->ptr2 = tcg_temp_new_ptr();
     dc->cc_srcT = tcg_temp_local_new();
 }
 
-- 
2.35.2


