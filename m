Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD96750D5BC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:28:27 +0200 (CEST)
Received: from localhost ([::1]:43176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikiR-0001xX-0u
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikTO-0001vP-ES
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:55 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikTM-0002tG-Fz
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:54 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJB-0001ea-Qa; Sun, 24 Apr 2022 23:02:21 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 34/42] i386: Implement VGATHER
Date: Sun, 24 Apr 2022 23:01:56 +0100
Message-Id: <20220424220204.2493824-35-paul@nowt.org>
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

These are scatter load instructions that need introduce a new "Vector SIB"
encoding.  Also a bit of hair to handle different index sizes and scaling
factors, but overall the combinatorial explosion doesn't end up too bad.

The other thing of note is probably that these also modify the mask operand.
Thankfully the operands may not overlap, and we do not have to make the whole
thing appear atomic.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h        | 65 +++++++++++++++++++++++++++++++
 target/i386/ops_sse_header.h | 16 ++++++++
 target/i386/tcg/translate.c  | 74 ++++++++++++++++++++++++++++++++++++
 3 files changed, 155 insertions(+)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index ffcba3d02c..14a2d1bf78 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -3288,6 +3288,71 @@ void glue(helper_vpmaskmovq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 #endif
 }
 
+#define VGATHER_HELPER(scale)                                       \
+void glue(helper_vpgatherdd ## scale, SUFFIX)(CPUX86State *env,     \
+        Reg *d, Reg *v, Reg *s, target_ulong a0)                    \
+{                                                                   \
+    int i;                                                          \
+    for (i = 0; i < (2 << SHIFT); i++) {                            \
+        if (v->L(i) >> 31) {                                        \
+            target_ulong addr = a0                                  \
+                + ((target_ulong)(int32_t)s->L(i) << scale);        \
+            d->L(i) = cpu_ldl_data_ra(env, addr, GETPC());          \
+        }                                                           \
+        v->L(i) = 0;                                                \
+    }                                                               \
+}                                                                   \
+void glue(helper_vpgatherdq ## scale, SUFFIX)(CPUX86State *env,     \
+        Reg *d, Reg *v, Reg *s, target_ulong a0)                    \
+{                                                                   \
+    int i;                                                          \
+    for (i = 0; i < (1 << SHIFT); i++) {                            \
+        if (v->Q(i) >> 63) {                                        \
+            target_ulong addr = a0                                  \
+                + ((target_ulong)(int32_t)s->L(i) << scale);        \
+            d->Q(i) = cpu_ldq_data_ra(env, addr, GETPC());          \
+        }                                                           \
+        v->Q(i) = 0;                                                \
+    }                                                               \
+}                                                                   \
+void glue(helper_vpgatherqd ## scale, SUFFIX)(CPUX86State *env,     \
+        Reg *d, Reg *v, Reg *s, target_ulong a0)                    \
+{                                                                   \
+    int i;                                                          \
+    for (i = 0; i < (1 << SHIFT); i++) {                            \
+        if (v->L(i) >> 31) {                                        \
+            target_ulong addr = a0                                  \
+                + ((target_ulong)(int64_t)s->Q(i) << scale);        \
+            d->L(i) = cpu_ldl_data_ra(env, addr, GETPC());          \
+        }                                                           \
+        v->L(i) = 0;                                                \
+    }                                                               \
+    d->Q(SHIFT) = 0;                                                    \
+    v->Q(SHIFT) = 0;                                                    \
+    YMM_ONLY(                                                       \
+    d->Q(3) = 0;                                                    \
+    v->Q(3) = 0;                                                    \
+    )                                                               \
+}                                                                   \
+void glue(helper_vpgatherqq ## scale, SUFFIX)(CPUX86State *env,     \
+        Reg *d, Reg *v, Reg *s, target_ulong a0)                    \
+{                                                                   \
+    int i;                                                          \
+    for (i = 0; i < (1 << SHIFT); i++) {                            \
+        if (v->Q(i) >> 63) {                                        \
+            target_ulong addr = a0                                  \
+                + ((target_ulong)(int64_t)s->Q(i) << scale);        \
+            d->Q(i) = cpu_ldq_data_ra(env, addr, GETPC());          \
+        }                                                           \
+        v->Q(i) = 0;                                                \
+    }                                                               \
+}
+
+VGATHER_HELPER(0)
+VGATHER_HELPER(1)
+VGATHER_HELPER(2)
+VGATHER_HELPER(3)
+
 #if SHIFT == 2
 void glue(helper_vbroadcastdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index a7a6bf6b10..e5d8ea9bb7 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -433,6 +433,22 @@ DEF_HELPER_4(glue(vpmaskmovd_st, SUFFIX), void, env, Reg, Reg, tl)
 DEF_HELPER_4(glue(vpmaskmovq_st, SUFFIX), void, env, Reg, Reg, tl)
 DEF_HELPER_4(glue(vpmaskmovd, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(vpmaskmovq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_5(glue(vpgatherdd0, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherdq0, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherqd0, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherqq0, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherdd1, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherdq1, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherqd1, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherqq1, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherdd2, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherdq2, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherqd2, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherqq2, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherdd3, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherdq3, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherqd3, SUFFIX), void, env, Reg, Reg, Reg, tl)
+DEF_HELPER_5(glue(vpgatherqq3, SUFFIX), void, env, Reg, Reg, Reg, tl)
 #if SHIFT == 2
 DEF_HELPER_3(glue(vbroadcastdq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_1(vzeroall, void, env)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index e00195d301..fe1ab58d07 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3315,6 +3315,10 @@ static const struct SSEOpHelper_table6 sse_op_table6[256] = {
     /* vpmaskmovd, vpmaskmovq */
     [0x8c] = BINARY_OP(vpmaskmovd, AVX, SSE_OPF_AVX2),
     [0x8e] = SPECIAL_OP(AVX), /* vpmaskmovd, vpmaskmovq */
+    [0x90] = SPECIAL_OP(AVX), /* vpgatherdd, vpgatherdq */
+    [0x91] = SPECIAL_OP(AVX), /* vpgatherqd, vpgatherqq */
+    [0x92] = SPECIAL_OP(AVX), /* vgatherdpd, vgatherdps */
+    [0x93] = SPECIAL_OP(AVX), /* vgatherqpd, vgatherqps */
 #define gen_helper_aesimc_ymm NULL
     [0xdb] = UNARY_OP(aesimc, AES, 0),
     [0xdc] = BINARY_OP(aesenc, AES, 0),
@@ -3381,6 +3385,25 @@ static const SSEFunc_0_eppt sse_op_table9[2][2] = {
     SSE_OP(vpmaskmovd_st),
     SSE_OP(vpmaskmovq_st),
 };
+
+static const SSEFunc_0_epppt sse_op_table10[16][2] = {
+    SSE_OP(vpgatherdd0),
+    SSE_OP(vpgatherdq0),
+    SSE_OP(vpgatherqd0),
+    SSE_OP(vpgatherqq0),
+    SSE_OP(vpgatherdd1),
+    SSE_OP(vpgatherdq1),
+    SSE_OP(vpgatherqd1),
+    SSE_OP(vpgatherqq1),
+    SSE_OP(vpgatherdd2),
+    SSE_OP(vpgatherdq2),
+    SSE_OP(vpgatherqd2),
+    SSE_OP(vpgatherqq2),
+    SSE_OP(vpgatherdd3),
+    SSE_OP(vpgatherdq3),
+    SSE_OP(vpgatherqd3),
+    SSE_OP(vpgatherqq3),
+};
 #undef SSE_OP
 
 /* VEX prefix not allowed */
@@ -4350,6 +4373,57 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 }
                 op1_offset = ZMM_OFFSET(reg);
 
+                if ((b & 0xfc) == 0x90) { /* vgather */
+                    int scale, index, base;
+                    target_long disp = 0;
+                    CHECK_AVX2(s);
+                    if (mod == 3 || rm != 4) {
+                        goto illegal_op;
+                    }
+
+                    /* Vector SIB */
+                    val = x86_ldub_code(env, s);
+                    scale = (val >> 6) & 3;
+                    index = ((val >> 3) & 7) | REX_X(s);
+                    base = (val & 7) | REX_B(s);
+                    switch (mod) {
+                    case 0:
+                        if (base == 5) {
+                            base = -1;
+                            disp = (int32_t)x86_ldl_code(env, s);
+                        }
+                        break;
+                    case 1:
+                        disp = (int8_t)x86_ldub_code(env, s);
+                        break;
+                    default:
+                    case 2:
+                        disp = (int32_t)x86_ldl_code(env, s);
+                        break;
+                    }
+
+                    /* destination, index and mask registers must not overlap */
+                    if (reg == index || reg == reg_v) {
+                        goto illegal_op;
+                    }
+
+                    tcg_gen_addi_tl(s->A0, cpu_regs[base], disp);
+                    gen_add_A0_ds_seg(s);
+                    op2_offset = ZMM_OFFSET(index);
+                    v_offset = ZMM_OFFSET(reg_v);
+                    tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                    tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+                    tcg_gen_addi_ptr(s->ptr2, cpu_env, v_offset);
+                    b1 = REX_W(s) | ((b & 1) << 1) | (scale << 2);
+                    sse_op_table10[b1][s->vex_l](cpu_env,
+                            s->ptr0, s->ptr2, s->ptr1, s->A0);
+                    if (!s->vex_l) {
+                        gen_clear_ymmh(s, reg);
+                        gen_clear_ymmh(s, reg_v);
+                    }
+                    return;
+                }
+
                 if (op6.flags & SSE_OPF_MMX) {
                     CHECK_AVX2_256(s);
                 }
-- 
2.36.0


