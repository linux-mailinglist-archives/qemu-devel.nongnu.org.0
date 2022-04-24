Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752CF50D5BB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:28:25 +0200 (CEST)
Received: from localhost ([::1]:43014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikiO-0001r0-Ig
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikSK-0001Lv-Ly
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:11:48 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikSI-0002ng-Ur
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:11:48 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ8-0001ea-1t; Sun, 24 Apr 2022 23:02:18 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 16/42] i386: Dot product AVX helper prep
Date: Sun, 24 Apr 2022 23:01:38 +0100
Message-Id: <20220424220204.2493824-17-paul@nowt.org>
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

Make the dpps and dppd helpers AVX-ready

I can't see any obvious reason why dppd shouldn't work on 256 bit ymm
registers, but both AMD and Intel agree that it's xmm only.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h | 54 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index d308a1ec40..4137e6e1fa 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2366,8 +2366,10 @@ SSE_HELPER_I(helper_blendps, L, 4, FBLENDP)
 SSE_HELPER_I(helper_blendpd, Q, 2, FBLENDP)
 SSE_HELPER_I(helper_pblendw, W, 8, FBLENDP)
 
-void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
+void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+                               uint32_t mask)
 {
+    Reg *v = d;
     float32 prod, iresult, iresult2;
 
     /*
@@ -2375,23 +2377,23 @@ void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
      * to correctly round the intermediate results
      */
     if (mask & (1 << 4)) {
-        iresult = float32_mul(d->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
+        iresult = float32_mul(v->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
     } else {
         iresult = float32_zero;
     }
     if (mask & (1 << 5)) {
-        prod = float32_mul(d->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
+        prod = float32_mul(v->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
     } else {
         prod = float32_zero;
     }
     iresult = float32_add(iresult, prod, &env->sse_status);
     if (mask & (1 << 6)) {
-        iresult2 = float32_mul(d->ZMM_S(2), s->ZMM_S(2), &env->sse_status);
+        iresult2 = float32_mul(v->ZMM_S(2), s->ZMM_S(2), &env->sse_status);
     } else {
         iresult2 = float32_zero;
     }
     if (mask & (1 << 7)) {
-        prod = float32_mul(d->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
+        prod = float32_mul(v->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
     } else {
         prod = float32_zero;
     }
@@ -2402,26 +2404,62 @@ void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
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
+                               Reg *d, Reg *s, uint32_t mask)
 {
+    Reg *v = d;
     float64 iresult;
 
     if (mask & (1 << 4)) {
-        iresult = float64_mul(d->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
+        iresult = float64_mul(v->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
     } else {
         iresult = float64_zero;
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
 
 void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   uint32_t offset)
-- 
2.36.0


