Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FE950D5D7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:41:59 +0200 (CEST)
Received: from localhost ([::1]:52220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikvW-0002Nf-DS
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikUQ-0003Pk-UX
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:13:58 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikUP-0002xA-0R
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:13:58 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ8-0001ea-LI; Sun, 24 Apr 2022 23:02:18 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 19/42] i386: Rewrite blendv helpers
Date: Sun, 24 Apr 2022 23:01:41 +0100
Message-Id: <20220424220204.2493824-20-paul@nowt.org>
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

Rewrite the blendv helpers so that they can easily be extended to support
the AVX encodings, which make all 4 arguments explicit.

No functional changes to the existing helpers

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h | 119 +++++++++++++++++++++---------------------
 1 file changed, 60 insertions(+), 59 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 3202c00572..9f388b02b9 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2141,73 +2141,74 @@ void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     }
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
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
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
+        Reg *v = d;                                                     \
+        Reg *m = &env->xmm_regs[0];                                     \
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
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,   \
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
+        Reg *v = d;                                                     \
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
@@ -2521,7 +2522,7 @@ void glue(helper_roundsd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 }
 #endif
 
-#define FBLENDP(d, s, m) (m ? s : d)
+#define FBLENDP(v, s, m) (m ? s : v)
 SSE_HELPER_I(helper_blendps, L, 4, FBLENDP)
 SSE_HELPER_I(helper_blendpd, Q, 2, FBLENDP)
 SSE_HELPER_I(helper_pblendw, W, 8, FBLENDP)
-- 
2.36.0


