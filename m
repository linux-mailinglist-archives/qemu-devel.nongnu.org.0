Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0C550D5A0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:15:54 +0200 (CEST)
Received: from localhost ([::1]:39106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikWH-0004xe-Sn
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikS1-00014a-U5
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:11:30 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikRz-0002mj-SF
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:11:29 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJB-0001ea-Jq; Sun, 24 Apr 2022 23:02:21 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 33/42] i386: Implement VMASKMOV
Date: Sun, 24 Apr 2022 23:01:55 +0100
Message-Id: <20220424220204.2493824-34-paul@nowt.org>
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

Decoding these is a bit messy, but at least the integer and float variants
have the same semantics once decoded.

We don't try and be clever with the load forms, instead load the whole
vector then mask out the elements we want.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h        | 48 ++++++++++++++++++++++++++++++++++++
 target/i386/ops_sse_header.h |  4 +++
 target/i386/tcg/translate.c  | 34 +++++++++++++++++++++++++
 3 files changed, 86 insertions(+)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index edf14a25d7..ffcba3d02c 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -3240,6 +3240,54 @@ void glue(helper_vtestpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     CC_SRC = ((zf >> 63) ? 0 : CC_Z) | ((cf >> 63) ? 0 : CC_C);
 }
 
+void glue(helper_vpmaskmovd_st, SUFFIX)(CPUX86State *env,
+                                        Reg *s, Reg *v, target_ulong a0)
+{
+    int i;
+
+    for (i = 0; i < (2 << SHIFT); i++) {
+        if (v->L(i) >> 31) {
+            cpu_stl_data_ra(env, a0 + i * 4, s->L(i), GETPC());
+        }
+    }
+}
+
+void glue(helper_vpmaskmovq_st, SUFFIX)(CPUX86State *env,
+                                        Reg *s, Reg *v, target_ulong a0)
+{
+    int i;
+
+    for (i = 0; i < (1 << SHIFT); i++) {
+        if (v->Q(i) >> 63) {
+            cpu_stq_data_ra(env, a0 + i * 8, s->Q(i), GETPC());
+        }
+    }
+}
+
+void glue(helper_vpmaskmovd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
+{
+    d->L(0) = (v->L(0) >> 31) ? s->L(0) : 0;
+    d->L(1) = (v->L(1) >> 31) ? s->L(1) : 0;
+    d->L(2) = (v->L(2) >> 31) ? s->L(2) : 0;
+    d->L(3) = (v->L(3) >> 31) ? s->L(3) : 0;
+#if SHIFT == 2
+    d->L(4) = (v->L(4) >> 31) ? s->L(4) : 0;
+    d->L(5) = (v->L(5) >> 31) ? s->L(5) : 0;
+    d->L(6) = (v->L(6) >> 31) ? s->L(6) : 0;
+    d->L(7) = (v->L(7) >> 31) ? s->L(7) : 0;
+#endif
+}
+
+void glue(helper_vpmaskmovq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
+{
+    d->Q(0) = (v->Q(0) >> 63) ? s->Q(0) : 0;
+    d->Q(1) = (v->Q(1) >> 63) ? s->Q(1) : 0;
+#if SHIFT == 2
+    d->Q(2) = (v->Q(2) >> 63) ? s->Q(2) : 0;
+    d->Q(3) = (v->Q(3) >> 63) ? s->Q(3) : 0;
+#endif
+}
+
 #if SHIFT == 2
 void glue(helper_vbroadcastdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 8b93b8e6d6..a7a6bf6b10 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -429,6 +429,10 @@ DEF_HELPER_4(glue(vpsravq, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(vpsllvq, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_3(glue(vtestps, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(vtestpd, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(vpmaskmovd_st, SUFFIX), void, env, Reg, Reg, tl)
+DEF_HELPER_4(glue(vpmaskmovq_st, SUFFIX), void, env, Reg, Reg, tl)
+DEF_HELPER_4(glue(vpmaskmovd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpmaskmovq, SUFFIX), void, env, Reg, Reg, Reg)
 #if SHIFT == 2
 DEF_HELPER_3(glue(vbroadcastdq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_1(vzeroall, void, env)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 2fbb7bfcad..e00195d301 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3277,6 +3277,10 @@ static const struct SSEOpHelper_table6 sse_op_table6[256] = {
     [0x29] = BINARY_OP(pcmpeqq, SSE41, SSE_OPF_MMX),
     [0x2a] = SPECIAL_OP(SSE41), /* movntqda */
     [0x2b] = BINARY_OP(packusdw, SSE41, SSE_OPF_MMX),
+    [0x2c] = BINARY_OP(vpmaskmovd, AVX, 0), /* vmaskmovps */
+    [0x2d] = BINARY_OP(vpmaskmovq, AVX, 0), /* vmaskmovpd */
+    [0x2e] = SPECIAL_OP(AVX), /* vmaskmovps */
+    [0x2f] = SPECIAL_OP(AVX), /* vmaskmovpd */
     [0x30] = UNARY_OP(pmovzxbw, SSE41, SSE_OPF_MMX),
     [0x31] = UNARY_OP(pmovzxbd, SSE41, SSE_OPF_MMX),
     [0x32] = UNARY_OP(pmovzxbq, SSE41, SSE_OPF_MMX),
@@ -3308,6 +3312,9 @@ static const struct SSEOpHelper_table6 sse_op_table6[256] = {
     [0x78] = UNARY_OP(vbroadcastb, AVX, SSE_OPF_SCALAR | SSE_OPF_MMX),
     /* vpbroadcastw */
     [0x79] = UNARY_OP(vbroadcastw, AVX, SSE_OPF_SCALAR | SSE_OPF_MMX),
+    /* vpmaskmovd, vpmaskmovq */
+    [0x8c] = BINARY_OP(vpmaskmovd, AVX, SSE_OPF_AVX2),
+    [0x8e] = SPECIAL_OP(AVX), /* vpmaskmovd, vpmaskmovq */
 #define gen_helper_aesimc_ymm NULL
     [0xdb] = UNARY_OP(aesimc, AES, 0),
     [0xdc] = BINARY_OP(aesenc, AES, 0),
@@ -3369,6 +3376,11 @@ static const SSEFunc_0_eppp sse_op_table8[3][2] = {
     SSE_OP(vpsravq),
     SSE_OP(vpsllvq),
 };
+
+static const SSEFunc_0_eppt sse_op_table9[2][2] = {
+    SSE_OP(vpmaskmovd_st),
+    SSE_OP(vpmaskmovq_st),
+};
 #undef SSE_OP
 
 /* VEX prefix not allowed */
@@ -4394,6 +4406,22 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                             gen_clear_ymmh(s, reg);
                         }
                         return;
+                    case 0x2e: /* maskmovpd */
+                        b1 = 0;
+                        goto vpmaskmov;
+                    case 0x2f: /* maskmovpd */
+                        b1 = 1;
+                        goto vpmaskmov;
+                    case 0x8e: /* vpmaskmovd, vpmaskmovq */
+                        CHECK_AVX2(s);
+                        b1 = REX_W(s);
+                    vpmaskmov:
+                        tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                        v_offset = ZMM_OFFSET(reg_v);
+                        tcg_gen_addi_ptr(s->ptr2, cpu_env, v_offset);
+                        sse_op_table9[b1][s->vex_l](cpu_env,
+                                s->ptr0, s->ptr2, s->A0);
+                        return;
                     default:
                         size = 128;
                     }
@@ -4456,6 +4484,12 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                         if (REX_W(s)) {
                             if (b >= 0x45 && b <= 0x47) {
                                 fn = sse_op_table8[b - 0x45][b1 - 1];
+                            } else if (b == 0x8c) {
+                                if (s->vex_l) {
+                                    fn = gen_helper_vpmaskmovq_ymm;
+                                } else {
+                                    fn = gen_helper_vpmaskmovq_xmm;
+                                }
                             }
                         }
                         fn(cpu_env, s->ptr0, s->ptr2, s->ptr1);
-- 
2.36.0


