Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2C650D59D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:15:25 +0200 (CEST)
Received: from localhost ([::1]:36980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikVo-0003WZ-NR
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikRo-0000jX-3K
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:11:16 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikRl-0002kR-UZ
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:11:15 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ6-0001ea-Mi; Sun, 24 Apr 2022 23:02:16 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 10/42] i386: Rewrite vector shift helper
Date: Sun, 24 Apr 2022 23:01:32 +0100
Message-Id: <20220424220204.2493824-11-paul@nowt.org>
X-Mailer: git-send-email 2.36.0
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Paul Brook <paul@nowt.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rewrite the vector shift helpers in preperation for AVX support (3 operand
form and 256 bit vectors).

For now keep the existing two operand interface.

No functional changes to existing helpers.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h | 250 ++++++++++++++++++++++--------------------
 1 file changed, 133 insertions(+), 117 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 23daab6b50..9297c96d04 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -63,199 +63,215 @@
 #define MOVE(d, r) memcpy(&(d).B(0), &(r).B(0), SIZE)
 #endif
 
-void glue(helper_psrlw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
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
+#endif
+
+void glue(helper_psrlw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
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
+void glue(helper_psllw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
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
+void glue(helper_psraw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
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
+void glue(helper_psrld, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
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
+void glue(helper_pslld, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
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
+void glue(helper_psrad, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
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
+void glue(helper_psrlq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
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
+void glue(helper_psllq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
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
+void glue(helper_psrldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
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
+void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 {
+    Reg *s = d;
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
 
-- 
2.36.0


