Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C05350D5B1
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:22:40 +0200 (CEST)
Received: from localhost ([::1]:55468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikcp-0007cs-O7
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikSu-0001iq-7h
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:31 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikSr-0002rD-3A
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:23 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ7-0001ea-D1; Sun, 24 Apr 2022 23:02:17 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 13/42] i386: Destructive vector helpers for AVX
Date: Sun, 24 Apr 2022 23:01:35 +0100
Message-Id: <20220424220204.2493824-14-paul@nowt.org>
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

These helpers need to take special care to avoid overwriting source values
before the wole result has been calculated.  Currently they use a dummy
Reg typed variable to store the result then assign the whole register.
This will cause 128 bit operations to corrupt the upper half of the register,
so replace it with explicit temporaries and element assignments.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h | 707 ++++++++++++++++++++++++++----------------
 1 file changed, 437 insertions(+), 270 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index d0424140d9..c645d2ddbf 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -680,71 +680,85 @@ void glue(helper_movq_mm_T0, SUFFIX)(Reg *d, uint64_t val)
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
-    MOVE(*d, r);
+    SHUFFLE4(W, s, s, 0);
 }
 #else
 void helper_shufps(Reg *d, Reg *s, int order)
 {
-    Reg r;
+    Reg *v = d;
+    uint32_t r0, r1, r2, r3;
 
-    r.L(0) = d->L(order & 3);
-    r.L(1) = d->L((order >> 2) & 3);
-    r.L(2) = s->L((order >> 4) & 3);
-    r.L(3) = s->L((order >> 6) & 3);
-    MOVE(*d, r);
+    SHUFFLE4(L, v, s, 0);
+#if SHIFT == 2
+    SHUFFLE4(L, v, s, 4);
+#endif
 }
 
 void helper_shufpd(Reg *d, Reg *s, int order)
 {
-    Reg r;
+    Reg *v = d;
+    uint64_t r0, r1;
 
-    r.Q(0) = d->Q(order & 1);
-    r.Q(1) = s->Q((order >> 1) & 1);
-    MOVE(*d, r);
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
-    MOVE(*d, r);
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
-    MOVE(*d, r);
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
-    MOVE(*d, r);
+    d->Q(0) = s->Q(0);
+    SHUFFLE4(W, s, s, 4);
+#if SHIFT == 2
+    d->Q(2) = s->Q(2);
+    SHUFFLE4(W, s, s, 12);
+#endif
 }
 #endif
 
@@ -1320,156 +1334,190 @@ uint32_t glue(helper_pmovmskb, SUFFIX)(CPUX86State *env, Reg *s)
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
-#endif
-    MOVE(*d, r);
-}
-
-void glue(helper_packuswb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    Reg r;
-
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
+#if SHIFT == 0
+#define PACK_WIDTH 4
+#else
+#define PACK_WIDTH 8
 #endif
-    MOVE(*d, r);
-}
 
 void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    Reg r;
+    Reg *v = d;
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
-    MOVE(*d, r);
 }
 
 #define UNPCK_OP(base_name, base)                                       \
                                                                         \
     void glue(helper_punpck ## base_name ## bw, SUFFIX)(CPUX86State *env,\
-                                                        Reg *d, Reg *s) \
+                                                Reg *d, Reg *s) \
     {                                                                   \
-        Reg r;                                                          \
+        Reg *v = d;                                                     \
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
-        MOVE(*d, r);                                                    \
     }                                                                   \
                                                                         \
     void glue(helper_punpck ## base_name ## wd, SUFFIX)(CPUX86State *env,\
-                                                        Reg *d, Reg *s) \
+                                                Reg *d, Reg *s) \
     {                                                                   \
-        Reg r;                                                          \
+        Reg *v = d;                                                     \
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
-            MOVE(*d, r);                                                \
     }                                                                   \
                                                                         \
     void glue(helper_punpck ## base_name ## dq, SUFFIX)(CPUX86State *env,\
-                                                        Reg *d, Reg *s) \
+                                                Reg *d, Reg *s) \
     {                                                                   \
-        Reg r;                                                          \
+        Reg *v = d;                                                     \
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
-            MOVE(*d, r);                                                \
     }                                                                   \
                                                                         \
     XMM_ONLY(                                                           \
-             void glue(helper_punpck ## base_name ## qdq, SUFFIX)(CPUX86State \
-                                                                  *env, \
-                                                                  Reg *d, \
-                                                                  Reg *s) \
+             void glue(helper_punpck ## base_name ## qdq, SUFFIX)(      \
+                        CPUX86State *env, Reg *d, Reg *s)       \
              {                                                          \
-                 Reg r;                                                 \
+                 Reg *v = d;                                            \
+                 uint64_t r[2];                                         \
                                                                         \
-                 r.Q(0) = d->Q(base);                                   \
-                 r.Q(1) = s->Q(base);                                   \
-                 MOVE(*d, r);                                           \
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
@@ -1622,113 +1670,172 @@ void helper_pswapd(CPUX86State *env, MMXReg *d, MMXReg *s)
 /* SSSE3 op helpers */
 void glue(helper_pshufb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
+    Reg *v = d;
     int i;
-    Reg r;
+#if SHIFT == 0
+    uint8_t r[8];
 
-    for (i = 0; i < (8 << SHIFT); i++) {
-        r.B(i) = (s->B(i) & 0x80) ? 0 : (d->B(s->B(i) & ((8 << SHIFT) - 1)));
+    for (i = 0; i < 8; i++) {
+        r[i] = (s->B(i) & 0x80) ? 0 : (v->B(s->B(i) & 7));
+    }
+    for (i = 0; i < 8; i++) {
+        d->B(i) = r[i];
     }
+#else
+    uint8_t r[16];
 
-    MOVE(*d, r);
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
-
-    Reg r;
-
-    r.W(0) = (int16_t)d->W(0) + (int16_t)d->W(1);
-    r.W(1) = (int16_t)d->W(2) + (int16_t)d->W(3);
-    XMM_ONLY(r.W(2) = (int16_t)d->W(4) + (int16_t)d->W(5));
-    XMM_ONLY(r.W(3) = (int16_t)d->W(6) + (int16_t)d->W(7));
-    r.W((2 << SHIFT) + 0) = (int16_t)s->W(0) + (int16_t)s->W(1);
-    r.W((2 << SHIFT) + 1) = (int16_t)s->W(2) + (int16_t)s->W(3);
-    XMM_ONLY(r.W(6) = (int16_t)s->W(4) + (int16_t)s->W(5));
-    XMM_ONLY(r.W(7) = (int16_t)s->W(6) + (int16_t)s->W(7));
+#if SHIFT == 0
 
-    MOVE(*d, r);
+#define SSE_HELPER_HW(name, F)  \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+{                               \
+    Reg *v = d;                 \
+    uint16_t r[4];              \
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
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+{                               \
+    Reg *v = d;                 \
+    uint32_t r0, r1;            \
+    r0 = F(v->L(0), v->L(1));   \
+    r1 = F(s->L(0), s->L(1));   \
+    d->W(0) = r0;               \
+    d->W(1) = r1;               \
 }
 
-void glue(helper_phaddd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-{
-    Reg r;
-
-    r.L(0) = (int32_t)d->L(0) + (int32_t)d->L(1);
-    XMM_ONLY(r.L(1) = (int32_t)d->L(2) + (int32_t)d->L(3));
-    r.L((1 << SHIFT) + 0) = (int32_t)s->L(0) + (int32_t)s->L(1);
-    XMM_ONLY(r.L(3) = (int32_t)s->L(2) + (int32_t)s->L(3));
+#else
 
-    MOVE(*d, r);
+#define SSE_HELPER_HW(name, F)  \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+{                                   \
+    Reg *v = d;                     \
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
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+{                               \
+    Reg *v = d;                 \
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
+#endif
 
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
+SSE_HELPER_HW(phaddw, FADD)
+SSE_HELPER_HW(phsubw, FSUB)
+SSE_HELPER_HW(phaddsw, FADDSW)
+SSE_HELPER_HW(phsubsw, FSUBSW)
+SSE_HELPER_HL(phaddd, FADD)
+SSE_HELPER_HL(phsubd, FSUB)
 
-    MOVE(*d, r);
-}
+#undef SSE_HELPER_HW
+#undef SSE_HELPER_HL
 
 void glue(helper_pmaddubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
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
+    Reg *v = d;
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
 #endif
-}
-
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
 }
 
 #define FABSB(x) (x > INT8_MAX  ? -(int8_t)x : x)
@@ -1751,32 +1858,49 @@ SSE_HELPER_L(helper_psignd, FSIGNL)
 void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   int32_t shift)
 {
-    Reg r;
-
+    Reg *v = d;
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
-    MOVE(*d, r);
 }
 
 #define XMM0 (env->xmm_regs[0])
@@ -1918,17 +2042,43 @@ SSE_HELPER_Q(helper_pcmpeqq, FCMPEQQ)
 
 void glue(helper_packusdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
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
-    MOVE(*d, r);
+    Reg *v = d;
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
@@ -2184,20 +2334,37 @@ void glue(helper_dppd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
 void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   uint32_t offset)
 {
+    Reg *v = d;
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
 
-    MOVE(*d, r);
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
-- 
2.36.0


