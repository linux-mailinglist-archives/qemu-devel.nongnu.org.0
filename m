Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD8950D5D6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:40:29 +0200 (CEST)
Received: from localhost ([::1]:50058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niku4-0000ph-Dd
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikTz-0002aA-Dj
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:13:31 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikTx-0002w7-Ln
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:13:31 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJB-0001ea-6F; Sun, 24 Apr 2022 23:02:21 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 31/42] i386: Implement AVX variable shifts
Date: Sun, 24 Apr 2022 23:01:53 +0100
Message-Id: <20220424220204.2493824-32-paul@nowt.org>
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

These use the W bit to encode the operand width, but otherwise fairly
straightforward.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h        | 17 +++++++++++++++++
 target/i386/ops_sse_header.h |  6 ++++++
 target/i386/tcg/translate.c  | 17 +++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 9b92b9790a..8f2bd48394 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -3195,6 +3195,23 @@ void glue(helper_vpermilps_imm, SUFFIX)(CPUX86State *env,
 #endif
 }
 
+#if SHIFT == 1
+#define FPSRLVD(x, c) (c < 32 ? ((x) >> c) : 0)
+#define FPSRLVQ(x, c) (c < 64 ? ((x) >> c) : 0)
+#define FPSRAVD(x, c) ((int32_t)(x) >> (c < 64 ? c : 31))
+#define FPSRAVQ(x, c) ((int64_t)(x) >> (c < 64 ? c : 63))
+#define FPSLLVD(x, c) (c < 32 ? ((x) << c) : 0)
+#define FPSLLVQ(x, c) (c < 64 ? ((x) << c) : 0)
+#endif
+
+SSE_HELPER_L(helper_vpsrlvd, FPSRLVD)
+SSE_HELPER_L(helper_vpsravd, FPSRAVD)
+SSE_HELPER_L(helper_vpsllvd, FPSLLVD)
+
+SSE_HELPER_Q(helper_vpsrlvq, FPSRLVQ)
+SSE_HELPER_Q(helper_vpsravq, FPSRAVQ)
+SSE_HELPER_Q(helper_vpsllvq, FPSLLVQ)
+
 #if SHIFT == 2
 void glue(helper_vbroadcastdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index c52169a030..20db6c4240 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -421,6 +421,12 @@ DEF_HELPER_4(glue(vpermilpd, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(vpermilps, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(vpermilpd_imm, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(vpermilps_imm, SUFFIX), void, env, Reg, Reg, i32)
+DEF_HELPER_4(glue(vpsrlvd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpsravd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpsllvd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpsrlvq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpsravq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(vpsllvq, SUFFIX), void, env, Reg, Reg, Reg)
 #if SHIFT == 2
 DEF_HELPER_3(glue(vbroadcastdq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_1(vzeroall, void, env)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 358c3ecb0b..4990470083 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3293,6 +3293,9 @@ static const struct SSEOpHelper_table6 sse_op_table6[256] = {
     [0x40] = BINARY_OP(pmulld, SSE41, SSE_OPF_MMX),
 #define gen_helper_phminposuw_ymm NULL
     [0x41] = UNARY_OP(phminposuw, SSE41, 0),
+    [0x45] = BINARY_OP(vpsrlvd, AVX, SSE_OPF_AVX2),
+    [0x46] = BINARY_OP(vpsravd, AVX, SSE_OPF_AVX2),
+    [0x47] = BINARY_OP(vpsllvd, AVX, SSE_OPF_AVX2),
     /* vpbroadcastd */
     [0x58] = UNARY_OP(vbroadcastl, AVX, SSE_OPF_SCALAR | SSE_OPF_MMX),
     /* vpbroadcastq */
@@ -3357,6 +3360,15 @@ static const struct SSEOpHelper_table7 sse_op_table7[256] = {
 #undef BLENDV_OP
 #undef SPECIAL_OP
 
+#define SSE_OP(name) \
+    {gen_helper_ ## name ##_xmm, gen_helper_ ## name ##_ymm}
+static const SSEFunc_0_eppp sse_op_table8[3][2] = {
+    SSE_OP(vpsrlvq),
+    SSE_OP(vpsravq),
+    SSE_OP(vpsllvq),
+};
+#undef SSE_OP
+
 /* VEX prefix not allowed */
 #define CHECK_NO_VEX(s) do { \
     if (s->prefix & PREFIX_VEX) \
@@ -4439,6 +4451,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                         tcg_temp_free_ptr(mask);
                     } else {
                         SSEFunc_0_eppp fn = op6.fn[b1].op2;
+                        if (REX_W(s)) {
+                            if (b >= 0x45 && b <= 0x47) {
+                                fn = sse_op_table8[b - 0x45][b1 - 1];
+                            }
+                        }
                         fn(cpu_env, s->ptr0, s->ptr2, s->ptr1);
                     }
                 }
-- 
2.36.0


