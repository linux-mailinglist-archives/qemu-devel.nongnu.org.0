Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1C650D5AF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:21:57 +0200 (CEST)
Received: from localhost ([::1]:54108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikc8-0006jR-PN
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikS6-00016T-3A
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:11:34 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikS4-0002mv-78
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:11:33 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJA-0001ea-Of; Sun, 24 Apr 2022 23:02:20 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 29/42] i386: Implement VBROADCAST
Date: Sun, 24 Apr 2022 23:01:51 +0100
Message-Id: <20220424220204.2493824-30-paul@nowt.org>
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

The catch here is that these are whole vector operations (not independent 128
bit lanes). We abuse the SSE_OPF_SCALAR flag to select the memory operand
width appropriately.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h        | 51 ++++++++++++++++++++++++++++++++++++
 target/i386/ops_sse_header.h |  8 ++++++
 target/i386/tcg/translate.c  | 42 ++++++++++++++++++++++++++++-
 3 files changed, 100 insertions(+), 1 deletion(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index a1f50f0c8b..4115c9a257 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -3071,7 +3071,57 @@ void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 #endif
 #endif
 
+#if SHIFT >= 1
+void glue(helper_vbroadcastb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    uint8_t val = s->B(0);
+    int i;
+
+    for (i = 0; i < 16 * SHIFT; i++) {
+        d->B(i) = val;
+    }
+}
+
+void glue(helper_vbroadcastw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    uint16_t val = s->W(0);
+    int i;
+
+    for (i = 0; i < 8 * SHIFT; i++) {
+        d->W(i) = val;
+    }
+}
+
+void glue(helper_vbroadcastl, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    uint32_t val = s->L(0);
+    int i;
+
+    for (i = 0; i < 8 * SHIFT; i++) {
+        d->L(i) = val;
+    }
+}
+
+void glue(helper_vbroadcastq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    uint64_t val = s->Q(0);
+    d->Q(0) = val;
+    d->Q(1) = val;
 #if SHIFT == 2
+    d->Q(2) = val;
+    d->Q(3) = val;
+#endif
+}
+
+#if SHIFT == 2
+void glue(helper_vbroadcastdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    d->Q(0) = s->Q(0);
+    d->Q(1) = s->Q(1);
+    d->Q(2) = s->Q(0);
+    d->Q(3) = s->Q(1);
+}
+
 void helper_vzeroall(CPUX86State *env)
 {
     int i;
@@ -3118,6 +3168,7 @@ void helper_vzeroupper_hi8(CPUX86State *env)
 }
 #endif
 #endif
+#endif
 
 #undef SSE_HELPER_S
 
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 48f0945917..51e02cd4fa 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -411,7 +411,14 @@ DEF_HELPER_4(glue(aeskeygenassist, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_5(glue(pclmulqdq, SUFFIX), void, env, Reg, Reg, Reg, i32)
 #endif
 
+/* AVX helpers */
+#if SHIFT >= 1
+DEF_HELPER_3(glue(vbroadcastb, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(vbroadcastw, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(vbroadcastl, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(vbroadcastq, SUFFIX), void, env, Reg, Reg)
 #if SHIFT == 2
+DEF_HELPER_3(glue(vbroadcastdq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_1(vzeroall, void, env)
 DEF_HELPER_1(vzeroupper, void, env)
 #ifdef TARGET_X86_64
@@ -419,6 +426,7 @@ DEF_HELPER_1(vzeroall_hi8, void, env)
 DEF_HELPER_1(vzeroupper_hi8, void, env)
 #endif
 #endif
+#endif
 
 #undef SHIFT
 #undef Reg
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index ba70aeb039..59ab1dc562 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3255,6 +3255,11 @@ static const struct SSEOpHelper_table6 sse_op_table6[256] = {
     [0x14] = BLENDV_OP(blendvps, SSE41, 0),
     [0x15] = BLENDV_OP(blendvpd, SSE41, 0),
     [0x17] = CMP_OP(ptest, SSE41),
+    /* TODO:Some vbroadcast variants require AVX2 */
+    [0x18] = UNARY_OP(vbroadcastl, AVX, SSE_OPF_SCALAR), /* vbroadcastss */
+    [0x19] = UNARY_OP(vbroadcastq, AVX, SSE_OPF_SCALAR), /* vbroadcastsd */
+#define gen_helper_vbroadcastdq_xmm NULL
+    [0x1a] = UNARY_OP(vbroadcastdq, AVX, SSE_OPF_SCALAR), /* vbroadcastf128 */
     [0x1c] = UNARY_OP_MMX(pabsb, SSSE3),
     [0x1d] = UNARY_OP_MMX(pabsw, SSSE3),
     [0x1e] = UNARY_OP_MMX(pabsd, SSSE3),
@@ -3286,6 +3291,16 @@ static const struct SSEOpHelper_table6 sse_op_table6[256] = {
     [0x40] = BINARY_OP(pmulld, SSE41, SSE_OPF_MMX),
 #define gen_helper_phminposuw_ymm NULL
     [0x41] = UNARY_OP(phminposuw, SSE41, 0),
+    /* vpbroadcastd */
+    [0x58] = UNARY_OP(vbroadcastl, AVX, SSE_OPF_SCALAR | SSE_OPF_MMX),
+    /* vpbroadcastq */
+    [0x59] = UNARY_OP(vbroadcastq, AVX, SSE_OPF_SCALAR | SSE_OPF_MMX),
+    /* vbroadcasti128 */
+    [0x5a] = UNARY_OP(vbroadcastdq, AVX, SSE_OPF_SCALAR | SSE_OPF_MMX),
+    /* vpbroadcastb */
+    [0x78] = UNARY_OP(vbroadcastb, AVX, SSE_OPF_SCALAR | SSE_OPF_MMX),
+    /* vpbroadcastw */
+    [0x79] = UNARY_OP(vbroadcastw, AVX, SSE_OPF_SCALAR | SSE_OPF_MMX),
 #define gen_helper_aesimc_ymm NULL
     [0xdb] = UNARY_OP(aesimc, AES, 0),
     [0xdc] = BINARY_OP(aesenc, AES, 0),
@@ -4323,6 +4338,24 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     op2_offset = offsetof(CPUX86State, xmm_t0);
                     gen_lea_modrm(env, s, modrm);
                     switch (b) {
+                    case 0x78: /* vpbroadcastb */
+                        size = 8;
+                        break;
+                    case 0x79: /* vpbroadcastw */
+                        size = 16;
+                        break;
+                    case 0x18: /* vbroadcastss */
+                    case 0x58: /* vpbroadcastd */
+                        size = 32;
+                        break;
+                    case 0x19: /* vbroadcastsd */
+                    case 0x59: /* vpbroadcastq */
+                        size = 64;
+                        break;
+                    case 0x1a: /* vbroadcastf128 */
+                    case 0x5a: /* vbroadcasti128 */
+                        size = 128;
+                        break;
                     case 0x20: case 0x30: /* pmovsxbw, pmovzxbw */
                     case 0x23: case 0x33: /* pmovsxwd, pmovzxwd */
                     case 0x25: case 0x35: /* pmovsxdq, pmovzxdq */
@@ -4346,10 +4379,17 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     default:
                         size = 128;
                     }
-                    if (s->vex_l) {
+                    /* 256 bit vbroadcast only load a single element.  */
+                    if ((op6.flags & SSE_OPF_SCALAR) == 0 && s->vex_l) {
                         size *= 2;
                     }
                     switch (size) {
+                    case 8:
+                        tcg_gen_qemu_ld_tl(s->tmp0, s->A0,
+                                           s->mem_index, MO_UB);
+                        tcg_gen_st16_tl(s->tmp0, cpu_env, op2_offset +
+                                        offsetof(ZMMReg, ZMM_B(0)));
+                        break;
                     case 16:
                         tcg_gen_qemu_ld_tl(s->tmp0, s->A0,
                                            s->mem_index, MO_LEUW);
-- 
2.36.0


