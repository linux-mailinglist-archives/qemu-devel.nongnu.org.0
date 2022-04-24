Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D1750D5C2
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:31:07 +0200 (CEST)
Received: from localhost ([::1]:51660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikl0-0007it-Fe
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikUU-0003bQ-N5
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:14:02 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikUS-0002xO-US
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:14:02 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJC-0001ea-1G; Sun, 24 Apr 2022 23:02:22 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 35/42] i386: Implement VPERM
Date: Sun, 24 Apr 2022 23:01:57 +0100
Message-Id: <20220424220204.2493824-36-paul@nowt.org>
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

A set of shuffle operations that operate on complete 256 bit registers.
The integer and floating point variants have identical semantics.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h        | 73 ++++++++++++++++++++++++++++++++++++
 target/i386/ops_sse_header.h |  3 ++
 target/i386/tcg/translate.c  |  9 +++++
 3 files changed, 85 insertions(+)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 14a2d1bf78..04d2006cd8 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -3407,6 +3407,79 @@ void helper_vzeroupper_hi8(CPUX86State *env)
     }
 }
 #endif
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
 #endif
 #endif
 
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index e5d8ea9bb7..099e6e8ffc 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -457,6 +457,9 @@ DEF_HELPER_1(vzeroupper, void, env)
 DEF_HELPER_1(vzeroall_hi8, void, env)
 DEF_HELPER_1(vzeroupper_hi8, void, env)
 #endif
+DEF_HELPER_5(vpermdq_ymm, void, env, Reg, Reg, Reg, i32)
+DEF_HELPER_4(vpermq_ymm, void, env, Reg, Reg, i32)
+DEF_HELPER_4(vpermd_ymm, void, env, Reg, Reg, Reg)
 #endif
 #endif
 
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index fe1ab58d07..5a11d3c083 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3258,6 +3258,8 @@ static const struct SSEOpHelper_table6 sse_op_table6[256] = {
     [0x10] = BLENDV_OP(pblendvb, SSE41, SSE_OPF_MMX),
     [0x14] = BLENDV_OP(blendvps, SSE41, 0),
     [0x15] = BLENDV_OP(blendvpd, SSE41, 0),
+#define gen_helper_vpermd_xmm NULL
+    [0x16] = BINARY_OP(vpermd, AVX, SSE_OPF_AVX2), /* vpermps */
     [0x17] = CMP_OP(ptest, SSE41),
     /* TODO:Some vbroadcast variants require AVX2 */
     [0x18] = UNARY_OP(vbroadcastl, AVX, SSE_OPF_SCALAR), /* vbroadcastss */
@@ -3287,6 +3289,7 @@ static const struct SSEOpHelper_table6 sse_op_table6[256] = {
     [0x33] = UNARY_OP(pmovzxwd, SSE41, SSE_OPF_MMX),
     [0x34] = UNARY_OP(pmovzxwq, SSE41, SSE_OPF_MMX),
     [0x35] = UNARY_OP(pmovzxdq, SSE41, SSE_OPF_MMX),
+    [0x36] = BINARY_OP(vpermd, AVX, SSE_OPF_AVX2), /* vpermd */
     [0x37] = BINARY_OP(pcmpgtq, SSE41, SSE_OPF_MMX),
     [0x38] = BINARY_OP(pminsb, SSE41, SSE_OPF_MMX),
     [0x39] = BINARY_OP(pminsd, SSE41, SSE_OPF_MMX),
@@ -3329,8 +3332,13 @@ static const struct SSEOpHelper_table6 sse_op_table6[256] = {
 
 /* prefix [66] 0f 3a */
 static const struct SSEOpHelper_table7 sse_op_table7[256] = {
+#define gen_helper_vpermq_xmm NULL
+    [0x00] = UNARY_OP(vpermq, AVX, SSE_OPF_AVX2),
+    [0x01] = UNARY_OP(vpermq, AVX, SSE_OPF_AVX2), /* vpermpd */
     [0x04] = UNARY_OP(vpermilps_imm, AVX, 0),
     [0x05] = UNARY_OP(vpermilpd_imm, AVX, 0),
+#define gen_helper_vpermdq_xmm NULL
+    [0x06] = BINARY_OP(vpermdq, AVX, 0), /* vperm2f128 */
     [0x08] = UNARY_OP(roundps, SSE41, 0),
     [0x09] = UNARY_OP(roundpd, SSE41, 0),
 #define gen_helper_roundss_ymm NULL
@@ -3353,6 +3361,7 @@ static const struct SSEOpHelper_table7 sse_op_table7[256] = {
     [0x41] = BINARY_OP(dppd, SSE41, 0),
     [0x42] = BINARY_OP(mpsadbw, SSE41, SSE_OPF_MMX),
     [0x44] = BINARY_OP(pclmulqdq, PCLMULQDQ, 0),
+    [0x46] = BINARY_OP(vpermdq, AVX, SSE_OPF_AVX2), /* vperm2i128 */
 #define gen_helper_pcmpestrm_ymm NULL
     [0x60] = CMP_OP(pcmpestrm, SSE42),
 #define gen_helper_pcmpestri_ymm NULL
-- 
2.36.0


