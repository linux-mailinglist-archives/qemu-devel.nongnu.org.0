Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AFE50D5A6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:18:09 +0200 (CEST)
Received: from localhost ([::1]:45996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikYS-0001G2-Db
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikRs-0000sc-EY
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:11:22 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikRq-0002ln-LQ
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:11:20 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ8-0001ea-7q; Sun, 24 Apr 2022 23:02:18 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 17/42] i386: Destructive FP helpers for AVX
Date: Sun, 24 Apr 2022 23:01:39 +0100
Message-Id: <20220424220204.2493824-18-paul@nowt.org>
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

Perpare the horizontal atithmetic vector helpers for AVX
These currently use a dummy Reg typed variable to store the result then
assign the whole register.  This will cause 128 bit operations to corrupt
the upper half of the register, so replace it with explicit temporaries
and element assignments.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h | 96 +++++++++++++++++++++++++++++++------------
 1 file changed, 70 insertions(+), 26 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 4137e6e1fa..d128af6cc8 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1196,44 +1196,88 @@ void helper_insertq_i(CPUX86State *env, ZMMReg *d, int index, int length)
     d->ZMM_Q(0) = helper_insertq(d->ZMM_Q(0), index, length);
 }
 
-void glue(helper_haddps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_haddps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    ZMMReg r;
-
-    r.ZMM_S(0) = float32_add(d->ZMM_S(0), d->ZMM_S(1), &env->sse_status);
-    r.ZMM_S(1) = float32_add(d->ZMM_S(2), d->ZMM_S(3), &env->sse_status);
-    r.ZMM_S(2) = float32_add(s->ZMM_S(0), s->ZMM_S(1), &env->sse_status);
-    r.ZMM_S(3) = float32_add(s->ZMM_S(2), s->ZMM_S(3), &env->sse_status);
-    MOVE(*d, r);
+    Reg *v = d;
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
 
-void glue(helper_haddpd, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_haddpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    ZMMReg r;
+    Reg *v = d;
+    float64 r0, r1;
 
-    r.ZMM_D(0) = float64_add(d->ZMM_D(0), d->ZMM_D(1), &env->sse_status);
-    r.ZMM_D(1) = float64_add(s->ZMM_D(0), s->ZMM_D(1), &env->sse_status);
-    MOVE(*d, r);
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
 
-void glue(helper_hsubps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_hsubps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    ZMMReg r;
-
-    r.ZMM_S(0) = float32_sub(d->ZMM_S(0), d->ZMM_S(1), &env->sse_status);
-    r.ZMM_S(1) = float32_sub(d->ZMM_S(2), d->ZMM_S(3), &env->sse_status);
-    r.ZMM_S(2) = float32_sub(s->ZMM_S(0), s->ZMM_S(1), &env->sse_status);
-    r.ZMM_S(3) = float32_sub(s->ZMM_S(2), s->ZMM_S(3), &env->sse_status);
-    MOVE(*d, r);
+    Reg *v = d;
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
 
-void glue(helper_hsubpd, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_hsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    ZMMReg r;
+    Reg *v = d;
+    float64 r0, r1;
 
-    r.ZMM_D(0) = float64_sub(d->ZMM_D(0), d->ZMM_D(1), &env->sse_status);
-    r.ZMM_D(1) = float64_sub(s->ZMM_D(0), s->ZMM_D(1), &env->sse_status);
-    MOVE(*d, r);
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
 
 void glue(helper_addsubps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-- 
2.36.0


