Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD86E50D581
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:05:11 +0200 (CEST)
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikLu-0007kM-Vg
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikJC-00056L-Ft
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:02:22 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikJA-0001L2-Ky
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:02:22 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ4-0001ea-Qu; Sun, 24 Apr 2022 23:02:14 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 01/42] i386: pcmpestr 64-bit sign extension bug
Date: Sun, 24 Apr 2022 23:01:23 +0100
Message-Id: <20220424220204.2493824-2-paul@nowt.org>
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

The abs1 function in ops_sse.h only works sorrectly when the result fits
in a signed int. This is fine most of the time because we're only dealing
with byte sized values.

However pcmp_elen helper function uses abs1 to calculate the absolute value
of a cpu register. This incorrectly truncates to 32 bits, and will give
the wrong anser for the most negative value.

Fix by open coding the saturation check before taking the absolute value.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index e4d74b814a..535440f882 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2011,25 +2011,23 @@ SSE_HELPER_Q(helper_pcmpgtq, FCMPGTQ)
 
 static inline int pcmp_elen(CPUX86State *env, int reg, uint32_t ctrl)
 {
-    int val;
+    target_long val, limit;
 
     /* Presence of REX.W is indicated by a bit higher than 7 set */
     if (ctrl >> 8) {
-        val = abs1((int64_t)env->regs[reg]);
+        val = (target_long)env->regs[reg];
     } else {
-        val = abs1((int32_t)env->regs[reg]);
+        val = (int32_t)env->regs[reg];
     }
-
     if (ctrl & 1) {
-        if (val > 8) {
-            return 8;
-        }
+        limit = 8;
     } else {
-        if (val > 16) {
-            return 16;
-        }
+        limit = 16;
     }
-    return val;
+    if ((val > limit) || (val < -limit)) {
+        return limit;
+    }
+    return abs1(val);
 }
 
 static inline int pcmp_ilen(Reg *r, uint8_t ctrl)
-- 
2.36.0


