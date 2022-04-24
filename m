Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F7C50D5D5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:39:04 +0200 (CEST)
Received: from localhost ([::1]:47920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niksi-0007og-2v
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikTj-0002Fo-UT
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:13:20 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikTg-0002to-3k
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:13:13 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ7-0001ea-5f; Sun, 24 Apr 2022 23:02:17 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 12/42] i386: Misc integer AVX helper prep
Date: Sun, 24 Apr 2022 23:01:34 +0100
Message-Id: <20220424220204.2493824-13-paul@nowt.org>
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

More perparatory work for AVX support in various integer vector helpers

No functional changes to existing helpers.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h | 133 +++++++++++++++++++++++++++++++++---------
 1 file changed, 104 insertions(+), 29 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index bb9cbf9ead..d0424140d9 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -557,19 +557,25 @@ SSE_HELPER_W(helper_pavgw, FAVG)
 
 void glue(helper_pmuludq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->Q(0) = (uint64_t)s->L(0) * (uint64_t)d->L(0);
-#if SHIFT == 1
-    d->Q(1) = (uint64_t)s->L(2) * (uint64_t)d->L(2);
+    Reg *v = d;
+    d->Q(0) = (uint64_t)s->L(0) * (uint64_t)v->L(0);
+#if SHIFT >= 1
+    d->Q(1) = (uint64_t)s->L(2) * (uint64_t)v->L(2);
+#if SHIFT == 2
+    d->Q(2) = (uint64_t)s->L(4) * (uint64_t)v->L(4);
+    d->Q(3) = (uint64_t)s->L(6) * (uint64_t)v->L(6);
+#endif
 #endif
 }
 
 void glue(helper_pmaddwd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
+    Reg *v = d;
     int i;
 
     for (i = 0; i < (2 << SHIFT); i++) {
-        d->L(i) = (int16_t)s->W(2 * i) * (int16_t)d->W(2 * i) +
-            (int16_t)s->W(2 * i + 1) * (int16_t)d->W(2 * i + 1);
+        d->L(i) = (int16_t)s->W(2 * i) * (int16_t)v->W(2 * i) +
+            (int16_t)s->W(2 * i + 1) * (int16_t)v->W(2 * i + 1);
     }
 }
 
@@ -583,31 +589,55 @@ static inline int abs1(int a)
     }
 }
 #endif
+
 void glue(helper_psadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
+    Reg *v = d;
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
 
@@ -627,8 +657,12 @@ void glue(helper_movl_mm_T0, SUFFIX)(Reg *d, uint32_t val)
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
 
@@ -636,8 +670,12 @@ void glue(helper_movl_mm_T0, SUFFIX)(Reg *d, uint32_t val)
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
@@ -1251,7 +1289,7 @@ uint32_t glue(helper_pmovmskb, SUFFIX)(CPUX86State *env, Reg *s)
     val |= (s->B(5) >> 2) & 0x20;
     val |= (s->B(6) >> 1) & 0x40;
     val |= (s->B(7)) & 0x80;
-#if SHIFT == 1
+#if SHIFT >= 1
     val |= (s->B(8) << 1) & 0x0100;
     val |= (s->B(9) << 2) & 0x0200;
     val |= (s->B(10) << 3) & 0x0400;
@@ -1260,6 +1298,24 @@ uint32_t glue(helper_pmovmskb, SUFFIX)(CPUX86State *env, Reg *s)
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
@@ -1799,14 +1855,28 @@ void glue(helper_ptest, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
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
@@ -1834,8 +1904,13 @@ SSE_HELPER_F(helper_pmovzxdq, Q, 2, s->L)
 
 void glue(helper_pmuldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->Q(0) = (int64_t)(int32_t) d->L(0) * (int32_t) s->L(0);
-    d->Q(1) = (int64_t)(int32_t) d->L(2) * (int32_t) s->L(2);
+    Reg *v = d;
+    d->Q(0) = (int64_t)(int32_t) v->L(0) * (int32_t) s->L(0);
+    d->Q(1) = (int64_t)(int32_t) v->L(2) * (int32_t) s->L(2);
+#if SHIFT == 2
+    d->Q(2) = (int64_t)(int32_t) v->L(4) * (int32_t) s->L(4);
+    d->Q(3) = (int64_t)(int32_t) v->L(6) * (int32_t) s->L(6);
+#endif
 }
 
 #define FCMPEQQ(d, s) (d == s ? -1 : 0)
-- 
2.36.0


