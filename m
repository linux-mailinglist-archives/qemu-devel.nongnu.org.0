Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC4050D582
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:05:11 +0200 (CEST)
Received: from localhost ([::1]:47198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikLu-0007oA-SH
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikJC-00056M-Hk
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:02:22 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikJA-0001L1-JN
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:02:22 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ5-0001ea-0t; Sun, 24 Apr 2022 23:02:15 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 02/42] i386: DPPS rounding fix
Date: Sun, 24 Apr 2022 23:01:24 +0100
Message-Id: <20220424220204.2493824-3-paul@nowt.org>
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

The DPPS (Dot Product) instruction is defined to first sum pairs of
intermediate results, then sum those values to get the final result.
i.e. (A+B)+(C+D)

We incrementally sum the results, i.e. ((A+B)+C)+D, which can result
in incorrect rouding.

For consistency, also remove the redundant (but harmless) add operation
from DPPD

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h | 47 +++++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 535440f882..a5a48a20f6 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1934,32 +1934,36 @@ SSE_HELPER_I(helper_pblendw, W, 8, FBLENDP)
 
 void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
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
+        iresult = float32_mul(d->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
+    } else {
+        iresult = float32_zero;
     }
     if (mask & (1 << 5)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(1), s->ZMM_S(1),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod = float32_mul(d->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
+    } else {
+        prod = float32_zero;
     }
+    iresult = float32_add(iresult, prod, &env->sse_status);
     if (mask & (1 << 6)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(2), s->ZMM_S(2),
-                                          &env->sse_status),
-                              &env->sse_status);
+        iresult2 = float32_mul(d->ZMM_S(2), s->ZMM_S(2), &env->sse_status);
+    } else {
+        iresult2 = float32_zero;
     }
     if (mask & (1 << 7)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(3), s->ZMM_S(3),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod = float32_mul(d->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
+    } else {
+        prod = float32_zero;
     }
+    iresult2 = float32_add(iresult2, prod, &env->sse_status);
+    iresult = float32_add(iresult, iresult2, &env->sse_status);
+
     d->ZMM_S(0) = (mask & (1 << 0)) ? iresult : float32_zero;
     d->ZMM_S(1) = (mask & (1 << 1)) ? iresult : float32_zero;
     d->ZMM_S(2) = (mask & (1 << 2)) ? iresult : float32_zero;
@@ -1968,13 +1972,12 @@ void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
 
 void glue(helper_dppd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
 {
-    float64 iresult = float64_zero;
+    float64 iresult;
 
     if (mask & (1 << 4)) {
-        iresult = float64_add(iresult,
-                              float64_mul(d->ZMM_D(0), s->ZMM_D(0),
-                                          &env->sse_status),
-                              &env->sse_status);
+        iresult = float64_mul(d->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
+    } else {
+        iresult = float64_zero;
     }
     if (mask & (1 << 5)) {
         iresult = float64_add(iresult,
-- 
2.36.0


