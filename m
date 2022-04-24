Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED53450D5D3
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:37:47 +0200 (CEST)
Received: from localhost ([::1]:44482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikrT-0005SI-3L
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikTC-0001kZ-Jv
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:44 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikTB-0002sS-3c
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:42 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ8-0001ea-Pf; Sun, 24 Apr 2022 23:02:18 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 20/42] i386: AVX pclmulqdq
Date: Sun, 24 Apr 2022 23:01:42 +0100
Message-Id: <20220424220204.2493824-21-paul@nowt.org>
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

Make the pclmulqdq helper AVX ready

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 9f388b02b9..b7100fdce1 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2885,14 +2885,14 @@ target_ulong helper_crc32(uint32_t crc1, target_ulong msg, uint32_t len)
 
 #endif
 
-void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
-                                    uint32_t ctrl)
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
@@ -2905,8 +2905,25 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
         b >>= 1;
     }
 
-    d->Q(0) = resl;
-    d->Q(1) = resh;
+    *dest_l = resl;
+    *dest_h = resh;
+}
+#endif
+
+void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+                                    uint32_t ctrl)
+{
+    Reg *v = d;
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
 }
 
 void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-- 
2.36.0


