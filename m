Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C3150D5A5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:18:01 +0200 (CEST)
Received: from localhost ([::1]:45524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikYK-0000vY-J8
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikRx-00010u-At
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:11:26 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikRv-0002mE-KU
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:11:25 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJA-0001ea-Vr; Sun, 24 Apr 2022 23:02:21 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 30/42] i386: Implement VPERMIL
Date: Sun, 24 Apr 2022 23:01:52 +0100
Message-Id: <20220424220204.2493824-31-paul@nowt.org>
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

Some potentially surprising details when comparing vpermilpd v.s. vpermilps,
but overall pretty straightforward.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h        | 82 ++++++++++++++++++++++++++++++++++++
 target/i386/ops_sse_header.h |  4 ++
 target/i386/tcg/translate.c  |  4 ++
 3 files changed, 90 insertions(+)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 4115c9a257..9b92b9790a 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -3113,6 +3113,88 @@ void glue(helper_vbroadcastq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #endif
 }
 
+void glue(helper_vpermilpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
+{
+    uint64_t r0, r1;
+
+    r0 = v->Q((s->Q(0) >> 1) & 1);
+    r1 = v->Q((s->Q(1) >> 1) & 1);
+    d->Q(0) = r0;
+    d->Q(1) = r1;
+#if SHIFT == 2
+    r0 = v->Q(((s->Q(2) >> 1) & 1) + 2);
+    r1 = v->Q(((s->Q(3) >> 1) & 1) + 2);
+    d->Q(2) = r0;
+    d->Q(3) = r1;
+#endif
+}
+
+void glue(helper_vpermilps, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
+{
+    uint32_t r0, r1, r2, r3;
+
+    r0 = v->L(s->L(0) & 3);
+    r1 = v->L(s->L(1) & 3);
+    r2 = v->L(s->L(2) & 3);
+    r3 = v->L(s->L(3) & 3);
+    d->L(0) = r0;
+    d->L(1) = r1;
+    d->L(2) = r2;
+    d->L(3) = r3;
+#if SHIFT == 2
+    r0 = v->L((s->L(4) & 3) + 4);
+    r1 = v->L((s->L(5) & 3) + 4);
+    r2 = v->L((s->L(6) & 3) + 4);
+    r3 = v->L((s->L(7) & 3) + 4);
+    d->L(4) = r0;
+    d->L(5) = r1;
+    d->L(6) = r2;
+    d->L(7) = r3;
+#endif
+}
+
+void glue(helper_vpermilpd_imm, SUFFIX)(CPUX86State *env,
+                                        Reg *d, Reg *s, uint32_t order)
+{
+    uint64_t r0, r1;
+
+    r0 = s->Q((order >> 0) & 1);
+    r1 = s->Q((order >> 1) & 1);
+    d->Q(0) = r0;
+    d->Q(1) = r1;
+#if SHIFT == 2
+    r0 = s->Q(((order >> 2) & 1) + 2);
+    r1 = s->Q(((order >> 3) & 1) + 2);
+    d->Q(2) = r0;
+    d->Q(3) = r1;
+#endif
+}
+
+void glue(helper_vpermilps_imm, SUFFIX)(CPUX86State *env,
+                                        Reg *d, Reg *s, uint32_t order)
+{
+    uint32_t r0, r1, r2, r3;
+
+    r0 = s->L((order >> 0) & 3);
+    r1 = s->L((order >> 2) & 3);
+    r2 = s->L((order >> 4) & 3);
+    r3 = s->L((order >> 6) & 3);
+    d->L(0) = r0;
+    d->L(1) = r1;
+    d->L(2) = r2;
+    d->L(3) = r3;
+#if SHIFT == 2
+    r0 = s->L(((order >> 0) & 3) + 4);
+    r1 = s->L(((order >> 2) & 3) + 4);
+    r2 = s->L(((order >> 4) & 3) + 4);
+    r3 = s->L(((order >> 6) & 3) + 4);
+    d->L(4) = r0;
+    d->L(5) = r1;
+    d->L(6) = r2;
+    d->L(7) = r3;
+#endif
+}
+
 #if SHIFT == 2
 void glue(helper_vbroadcastdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 51e02cd4fa..c52169a030 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -417,6 +417,10 @@ DEF_HELPER_3(glue(vbroadcastb, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(vbroadcastw, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(vbroadcastl, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(vbroadcastq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(vpermilpd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpermilps, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpermilpd_imm, SUFFIX), void, env, Reg, Reg, i32)
+DEF_HELPER_4(glue(vpermilps_imm, SUFFIX), void, env, Reg, Reg, i32)
 #if SHIFT == 2
 DEF_HELPER_3(glue(vbroadcastdq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_1(vzeroall, void, env)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 59ab1dc562..358c3ecb0b 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3251,6 +3251,8 @@ static const struct SSEOpHelper_table6 sse_op_table6[256] = {
     [0x09] = BINARY_OP_MMX(psignw, SSSE3),
     [0x0a] = BINARY_OP_MMX(psignd, SSSE3),
     [0x0b] = BINARY_OP_MMX(pmulhrsw, SSSE3),
+    [0x0c] = BINARY_OP(vpermilps, AVX, 0),
+    [0x0d] = BINARY_OP(vpermilpd, AVX, 0),
     [0x10] = BLENDV_OP(pblendvb, SSE41, SSE_OPF_MMX),
     [0x14] = BLENDV_OP(blendvps, SSE41, 0),
     [0x15] = BLENDV_OP(blendvpd, SSE41, 0),
@@ -3311,6 +3313,8 @@ static const struct SSEOpHelper_table6 sse_op_table6[256] = {
 
 /* prefix [66] 0f 3a */
 static const struct SSEOpHelper_table7 sse_op_table7[256] = {
+    [0x04] = UNARY_OP(vpermilps_imm, AVX, 0),
+    [0x05] = UNARY_OP(vpermilpd_imm, AVX, 0),
     [0x08] = UNARY_OP(roundps, SSE41, 0),
     [0x09] = UNARY_OP(roundpd, SSE41, 0),
 #define gen_helper_roundss_ymm NULL
-- 
2.36.0


