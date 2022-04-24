Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F343A50D5CF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:35:14 +0200 (CEST)
Received: from localhost ([::1]:37800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikp0-0000rW-4H
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikUN-0003Gz-45
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:13:55 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikUJ-0002wu-Em
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:13:54 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJA-0001ea-9c; Sun, 24 Apr 2022 23:02:20 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 27/42] i386: Translate 256 bit AVX instructions
Date: Sun, 24 Apr 2022 23:01:49 +0100
Message-Id: <20220424220204.2493824-28-paul@nowt.org>
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

All the work for the helper functions is already done, we just need to build
them, and a few macro tweaks to poulate the lookup tables.

For sse_op_table6 and sse_op_table7 we use #defines to fill in the entries
where and opcode only supports one vector size, rather than complicating the
main table.

Several of the open-coded mov type instruction need special handling, but most
of the rest falls out from the infrastructure we already added.

Also clear the top half of the register after 128 bit VEX register writes.
In the current code this correlates with VEX.L == 0, but there are exceptios
later.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/helper.h         |   2 +
 target/i386/tcg/fpu_helper.c |   3 +
 target/i386/tcg/translate.c  | 370 +++++++++++++++++++++++++++++------
 3 files changed, 319 insertions(+), 56 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index ac3b4d1ee3..3da5df98b9 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -218,6 +218,8 @@ DEF_HELPER_3(movq, void, env, ptr, ptr)
 #include "ops_sse_header.h"
 #define SHIFT 1
 #include "ops_sse_header.h"
+#define SHIFT 2
+#include "ops_sse_header.h"
 
 DEF_HELPER_3(rclb, tl, env, tl, tl)
 DEF_HELPER_3(rclw, tl, env, tl, tl)
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index b391b69635..74cf86c986 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -3053,3 +3053,6 @@ void helper_movq(CPUX86State *env, void *d, void *s)
 
 #define SHIFT 1
 #include "ops_sse.h"
+
+#define SHIFT 2
+#include "ops_sse.h"
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 278ed8ed1c..bcd6d47fd0 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2742,6 +2742,29 @@ static inline void gen_ldo_env_A0(DisasContext *s, int offset)
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(1)));
 }
 
+static inline void gen_ldo_env_A0_ymmh(DisasContext *s, int offset)
+{
+    int mem_index = s->mem_index;
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, mem_index, MO_LEUQ);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_addi_tl(s->tmp0, s->A0, 8);
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(3)));
+}
+
+/* Load 256-bit ymm register value */
+static inline void gen_ldy_env_A0(DisasContext *s, int offset)
+{
+    int mem_index = s->mem_index;
+    gen_ldo_env_A0(s, offset);
+    tcg_gen_addi_tl(s->tmp0, s->A0, 16);
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_addi_tl(s->tmp0, s->A0, 24);
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(3)));
+}
+
 static inline void gen_sto_env_A0(DisasContext *s, int offset)
 {
     int mem_index = s->mem_index;
@@ -2752,6 +2775,29 @@ static inline void gen_sto_env_A0(DisasContext *s, int offset)
     tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
 }
 
+static inline void gen_sto_env_A0_ymmh(DisasContext *s, int offset)
+{
+    int mem_index = s->mem_index;
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, mem_index, MO_LEUQ);
+    tcg_gen_addi_tl(s->tmp0, s->A0, 8);
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(3)));
+    tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+}
+
+/* Store 256-bit ymm register value */
+static inline void gen_sty_env_A0(DisasContext *s, int offset)
+{
+    int mem_index = s->mem_index;
+    gen_sto_env_A0(s, offset);
+    tcg_gen_addi_tl(s->tmp0, s->A0, 16);
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+    tcg_gen_addi_tl(s->tmp0, s->A0, 24);
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(3)));
+    tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+}
+
 static inline void gen_op_movo(DisasContext *s, int d_offset, int s_offset)
 {
     tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(0)));
@@ -2760,6 +2806,14 @@ static inline void gen_op_movo(DisasContext *s, int d_offset, int s_offset)
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(1)));
 }
 
+static inline void gen_op_movo_ymmh(DisasContext *s, int d_offset, int s_offset)
+{
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(3)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(3)));
+}
+
 static inline void gen_op_movq(DisasContext *s, int d_offset, int s_offset)
 {
     tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset);
@@ -2823,17 +2877,21 @@ typedef void (*SSEFunc_0_epppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
 #define SSE_OPF_AVX2      (1 << 7) /* AVX2 instruction */
 #define SSE_OPF_SHUF      (1 << 9) /* pshufx/shufpx */
 
-#define OP(op, flags, a, b, c, d)       \
-    {flags, {{.op = a}, {.op = b}, {.op = c}, {.op = d} } }
+#define OP(op, flags, a, b, c, d, e, f, g, h)       \
+    {flags, {{.op = a}, {.op = b}, {.op = c}, {.op = d},    \
+             {.op = e}, {.op = f}, {.op = g}, {.op = h} } }
 
 #define MMX_OP(x) OP(op2, SSE_OPF_MMX, \
-        gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm, NULL, NULL)
+        gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm, NULL, NULL, \
+        NULL, gen_helper_ ## x ## _ymm, NULL, NULL)
 
 #define SSE_FOP(name) OP(op2, SSE_OPF_SCALAR, \
-        gen_helper_##name##ps##_xmm, gen_helper_##name##pd##_xmm, \
-        gen_helper_##name##ss, gen_helper_##name##sd)
+        gen_helper_##name##ps_xmm, gen_helper_##name##pd_xmm, \
+        gen_helper_##name##ss, gen_helper_##name##sd, \
+        gen_helper_##name##ps_ymm, gen_helper_##name##pd_ymm, NULL, NULL)
 #define SSE_OP(sname, dname, op, flags) OP(op, flags, \
-        gen_helper_##sname##_xmm, gen_helper_##dname##_xmm, NULL, NULL)
+        gen_helper_##sname##_xmm, gen_helper_##dname##_xmm, NULL, NULL, \
+        gen_helper_##sname##_ymm, gen_helper_##dname##_ymm, NULL, NULL)
 
 struct SSEOpHelper_table1 {
     int flags;
@@ -2843,7 +2901,7 @@ struct SSEOpHelper_table1 {
         SSEFunc_0_eppt op1t;
         SSEFunc_0_eppp op2;
         SSEFunc_0_pppi op2i;
-    } fn[4];
+    } fn[8];
 };
 
 #define SSE_3DNOW { SSE_OPF_3DNOW }
@@ -2870,17 +2928,22 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x2c] = SSE_SPECIAL, /* cvttps2pi, cvttpd2pi, cvttsd2si, cvttss2si */
     [0x2d] = SSE_SPECIAL, /* cvtps2pi, cvtpd2pi, cvtsd2si, cvtss2si */
     [0x2e] = OP(op1, SSE_OPF_CMP | SSE_OPF_SCALAR | SSE_OPF_V0,
-            gen_helper_ucomiss, gen_helper_ucomisd, NULL, NULL),
+            gen_helper_ucomiss, gen_helper_ucomisd, NULL, NULL,
+            NULL, NULL, NULL, NULL),
     [0x2f] = OP(op1, SSE_OPF_CMP | SSE_OPF_SCALAR | SSE_OPF_V0,
-            gen_helper_comiss, gen_helper_comisd, NULL, NULL),
+            gen_helper_comiss, gen_helper_comisd, NULL, NULL,
+            NULL, NULL, NULL, NULL),
     [0x50] = SSE_SPECIAL, /* movmskps, movmskpd */
     [0x51] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
                 gen_helper_sqrtps_xmm, gen_helper_sqrtpd_xmm,
-                gen_helper_sqrtss, gen_helper_sqrtsd),
+                gen_helper_sqrtss, gen_helper_sqrtsd,
+                gen_helper_sqrtps_ymm, gen_helper_sqrtpd_ymm, NULL, NULL),
     [0x52] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
-                gen_helper_rsqrtps_xmm, NULL, gen_helper_rsqrtss, NULL),
+                gen_helper_rsqrtps_xmm, NULL, gen_helper_rsqrtss, NULL,
+                gen_helper_rsqrtps_ymm, NULL, NULL, NULL),
     [0x53] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
-                gen_helper_rcpps_xmm, NULL, gen_helper_rcpss, NULL),
+                gen_helper_rcpps_xmm, NULL, gen_helper_rcpss, NULL,
+                gen_helper_rcpps_ymm, NULL, NULL, NULL),
     [0x54] = SSE_OP(pand, pand, op2, 0), /* andps, andpd */
     [0x55] = SSE_OP(pandn, pandn, op2, 0), /* andnps, andnpd */
     [0x56] = SSE_OP(por, por, op2, 0), /* orps, orpd */
@@ -2889,10 +2952,13 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x59] = SSE_FOP(mul),
     [0x5a] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
                 gen_helper_cvtps2pd_xmm, gen_helper_cvtpd2ps_xmm,
-                gen_helper_cvtss2sd, gen_helper_cvtsd2ss),
+                gen_helper_cvtss2sd, gen_helper_cvtsd2ss,
+                gen_helper_cvtps2pd_ymm, gen_helper_cvtpd2ps_ymm, NULL, NULL),
     [0x5b] = OP(op1, SSE_OPF_V0,
                 gen_helper_cvtdq2ps_xmm, gen_helper_cvtps2dq_xmm,
-                gen_helper_cvttps2dq_xmm, NULL),
+                gen_helper_cvttps2dq_xmm, NULL,
+                gen_helper_cvtdq2ps_ymm, gen_helper_cvtps2dq_ymm,
+                gen_helper_cvttps2dq_ymm, NULL),
     [0x5c] = SSE_FOP(sub),
     [0x5d] = SSE_FOP(min),
     [0x5e] = SSE_FOP(div),
@@ -2919,14 +2985,18 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x6a] = MMX_OP(punpckhdq),
     [0x6b] = MMX_OP(packssdw),
     [0x6c] = OP(op2, SSE_OPF_MMX,
-                NULL, gen_helper_punpcklqdq_xmm, NULL, NULL),
+                NULL, gen_helper_punpcklqdq_xmm, NULL, NULL,
+                NULL, gen_helper_punpcklqdq_ymm, NULL, NULL),
     [0x6d] = OP(op2, SSE_OPF_MMX,
-                NULL, gen_helper_punpckhqdq_xmm, NULL, NULL),
+                NULL, gen_helper_punpckhqdq_xmm, NULL, NULL,
+                NULL, gen_helper_punpckhqdq_ymm, NULL, NULL),
     [0x6e] = SSE_SPECIAL, /* movd mm, ea */
     [0x6f] = SSE_SPECIAL, /* movq, movdqa, , movqdu */
     [0x70] = OP(op1i, SSE_OPF_SHUF | SSE_OPF_MMX | SSE_OPF_V0,
             gen_helper_pshufw_mmx, gen_helper_pshufd_xmm,
-            gen_helper_pshufhw_xmm, gen_helper_pshuflw_xmm),
+            gen_helper_pshufhw_xmm, gen_helper_pshuflw_xmm,
+            NULL, gen_helper_pshufd_ymm,
+            gen_helper_pshufhw_ymm, gen_helper_pshuflw_ymm),
     [0x71] = SSE_SPECIAL, /* shiftw */
     [0x72] = SSE_SPECIAL, /* shiftd */
     [0x73] = SSE_SPECIAL, /* shiftq */
@@ -2936,17 +3006,21 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x77] = SSE_SPECIAL, /* emms */
     [0x78] = SSE_SPECIAL, /* extrq_i, insertq_i (sse4a) */
     [0x79] = OP(op1, SSE_OPF_V0,
-            NULL, gen_helper_extrq_r, NULL, gen_helper_insertq_r),
+            NULL, gen_helper_extrq_r, NULL, gen_helper_insertq_r,
+            NULL, NULL, NULL, NULL),
     [0x7c] = OP(op2, 0,
-                NULL, gen_helper_haddpd_xmm, NULL, gen_helper_haddps_xmm),
+                NULL, gen_helper_haddpd_xmm, NULL, gen_helper_haddps_xmm,
+                NULL, gen_helper_haddpd_ymm, NULL, gen_helper_haddps_ymm),
     [0x7d] = OP(op2, 0,
-                NULL, gen_helper_hsubpd_xmm, NULL, gen_helper_hsubps_xmm),
+                NULL, gen_helper_hsubpd_xmm, NULL, gen_helper_hsubps_xmm,
+                NULL, gen_helper_hsubpd_ymm, NULL, gen_helper_hsubps_ymm),
     [0x7e] = SSE_SPECIAL, /* movd, movd, , movq */
     [0x7f] = SSE_SPECIAL, /* movq, movdqa, movdqu */
     [0xc4] = SSE_SPECIAL, /* pinsrw */
     [0xc5] = SSE_SPECIAL, /* pextrw */
     [0xd0] = OP(op2, 0,
-                NULL, gen_helper_addsubpd_xmm, NULL, gen_helper_addsubps_xmm),
+                NULL, gen_helper_addsubpd_xmm, NULL, gen_helper_addsubps_xmm,
+                NULL, gen_helper_addsubpd_ymm, NULL, gen_helper_addsubps_ymm),
     [0xd1] = MMX_OP(psrlw),
     [0xd2] = MMX_OP(psrld),
     [0xd3] = MMX_OP(psrlq),
@@ -2970,7 +3044,9 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0xe5] = MMX_OP(pmulhw),
     [0xe6] = OP(op1, SSE_OPF_V0,
             NULL, gen_helper_cvttpd2dq_xmm,
-            gen_helper_cvtdq2pd_xmm, gen_helper_cvtpd2dq_xmm),
+            gen_helper_cvtdq2pd_xmm, gen_helper_cvtpd2dq_xmm,
+            NULL, gen_helper_cvttpd2dq_ymm,
+            gen_helper_cvtdq2pd_ymm, gen_helper_cvtpd2dq_ymm),
     [0xe7] = SSE_SPECIAL,  /* movntq, movntq */
     [0xe8] = MMX_OP(psubsb),
     [0xe9] = MMX_OP(psubsw),
@@ -2988,7 +3064,8 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0xf5] = MMX_OP(pmaddwd),
     [0xf6] = MMX_OP(psadbw),
     [0xf7] = OP(op1t, SSE_OPF_MMX | SSE_OPF_V0,
-                gen_helper_maskmov_mmx, gen_helper_maskmov_xmm, NULL, NULL),
+                gen_helper_maskmov_mmx, gen_helper_maskmov_xmm, NULL, NULL,
+                NULL, NULL, NULL, NULL),
     [0xf8] = MMX_OP(psubb),
     [0xf9] = MMX_OP(psubw),
     [0xfa] = MMX_OP(psubl),
@@ -3003,9 +3080,9 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
 #undef SSE_OP
 #undef SSE_SPECIAL
 
-#define MMX_OP2(x) { gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm }
-
-static const SSEFunc_0_eppp sse_op_table2[3 * 8][2] = {
+#define MMX_OP2(x) { gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm, \
+                    gen_helper_ ## x ## _ymm}
+static const SSEFunc_0_eppp sse_op_table2[3 * 8][3] = {
     [0 + 2] = MMX_OP2(psrlw),
     [0 + 4] = MMX_OP2(psraw),
     [0 + 6] = MMX_OP2(psllw),
@@ -3013,9 +3090,9 @@ static const SSEFunc_0_eppp sse_op_table2[3 * 8][2] = {
     [8 + 4] = MMX_OP2(psrad),
     [8 + 6] = MMX_OP2(pslld),
     [16 + 2] = MMX_OP2(psrlq),
-    [16 + 3] = { NULL, gen_helper_psrldq_xmm },
+    [16 + 3] = { NULL, gen_helper_psrldq_xmm, gen_helper_psrldq_ymm},
     [16 + 6] = MMX_OP2(psllq),
-    [16 + 7] = { NULL, gen_helper_pslldq_xmm },
+    [16 + 7] = { NULL, gen_helper_pslldq_xmm, gen_helper_pslldq_ymm},
 };
 #undef MMX_OP2
 
@@ -3049,8 +3126,9 @@ static const SSEFunc_l_ep sse_op_table3bq[] = {
 
 #define SSE_CMP(x) { \
     gen_helper_ ## x ## ps ## _xmm, gen_helper_ ## x ## pd ## _xmm, \
-    gen_helper_ ## x ## ss, gen_helper_ ## x ## sd}
-static const SSEFunc_0_eppp sse_op_table4[32][4] = {
+    gen_helper_ ## x ## ss, gen_helper_ ## x ## sd, \
+    gen_helper_ ## x ## ps ## _ymm, gen_helper_ ## x ## pd ## _ymm}
+static const SSEFunc_0_eppp sse_op_table4[32][6] = {
     SSE_CMP(cmpeq),
     SSE_CMP(cmplt),
     SSE_CMP(cmple),
@@ -3126,7 +3204,7 @@ struct SSEOpHelper_table6 {
         SSEFunc_0_epp op1;
         SSEFunc_0_eppp op2;
         SSEFunc_0_epppp op3;
-    } fn[2];
+    } fn[3]; /* [0] = mmx, [1] = xmm, fn[2] = ymm */
     uint32_t ext_mask;
     int flags;
 };
@@ -3136,16 +3214,17 @@ struct SSEOpHelper_table7 {
         SSEFunc_0_eppi op1;
         SSEFunc_0_epppi op2;
         SSEFunc_0_epppp op3;
-    } fn[2];
+    } fn[3]; /* [0] = mmx, [1] = xmm, fn[2] = ymm */
     uint32_t ext_mask;
     int flags;
 };
 
 #define gen_helper_special_xmm NULL
+#define gen_helper_special_ymm NULL
 
 #define OP(name, op, flags, ext, mmx_name) \
-    {{{.op = mmx_name}, {.op = gen_helper_ ## name ## _xmm} }, \
-        CPUID_EXT_ ## ext, flags}
+    {{{.op = mmx_name}, {.op = gen_helper_ ## name ## _xmm}, \
+      {.op = gen_helper_ ## name ## _ymm} }, CPUID_EXT_ ## ext, flags}
 #define BINARY_OP_MMX(name, ext) \
     OP(name, op2, SSE_OPF_MMX, ext, gen_helper_ ## name ## _mmx)
 #define BINARY_OP(name, ext, flags) \
@@ -3205,7 +3284,9 @@ static const struct SSEOpHelper_table6 sse_op_table6[256] = {
     [0x3e] = BINARY_OP(pmaxuw, SSE41, SSE_OPF_MMX),
     [0x3f] = BINARY_OP(pmaxud, SSE41, SSE_OPF_MMX),
     [0x40] = BINARY_OP(pmulld, SSE41, SSE_OPF_MMX),
+#define gen_helper_phminposuw_ymm NULL
     [0x41] = UNARY_OP(phminposuw, SSE41, 0),
+#define gen_helper_aesimc_ymm NULL
     [0xdb] = UNARY_OP(aesimc, AES, 0),
     [0xdc] = BINARY_OP(aesenc, AES, 0),
     [0xdd] = BINARY_OP(aesenclast, AES, 0),
@@ -3217,7 +3298,9 @@ static const struct SSEOpHelper_table6 sse_op_table6[256] = {
 static const struct SSEOpHelper_table7 sse_op_table7[256] = {
     [0x08] = UNARY_OP(roundps, SSE41, 0),
     [0x09] = UNARY_OP(roundpd, SSE41, 0),
+#define gen_helper_roundss_ymm NULL
     [0x0a] = UNARY_OP(roundss, SSE41, SSE_OPF_SCALAR),
+#define gen_helper_roundsd_ymm NULL
     [0x0b] = UNARY_OP(roundsd, SSE41, SSE_OPF_SCALAR),
     [0x0c] = BINARY_OP(blendps, SSE41, 0),
     [0x0d] = BINARY_OP(blendpd, SSE41, 0),
@@ -3231,13 +3314,19 @@ static const struct SSEOpHelper_table7 sse_op_table7[256] = {
     [0x21] = SPECIAL_OP(SSE41), /* insertps */
     [0x22] = SPECIAL_OP(SSE41), /* pinsrd/pinsrq */
     [0x40] = BINARY_OP(dpps, SSE41, 0),
+#define gen_helper_dppd_ymm NULL
     [0x41] = BINARY_OP(dppd, SSE41, 0),
     [0x42] = BINARY_OP(mpsadbw, SSE41, SSE_OPF_MMX),
     [0x44] = BINARY_OP(pclmulqdq, PCLMULQDQ, 0),
+#define gen_helper_pcmpestrm_ymm NULL
     [0x60] = CMP_OP(pcmpestrm, SSE42),
+#define gen_helper_pcmpestri_ymm NULL
     [0x61] = CMP_OP(pcmpestri, SSE42),
+#define gen_helper_pcmpistrm_ymm NULL
     [0x62] = CMP_OP(pcmpistrm, SSE42),
+#define gen_helper_pcmpistri_ymm NULL
     [0x63] = CMP_OP(pcmpistri, SSE42),
+#define gen_helper_aeskeygenassist_ymm NULL
     [0xdf] = UNARY_OP(aeskeygenassist, AES, 0),
 };
 
@@ -3405,14 +3494,23 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
-            gen_sto_env_A0(s, ZMM_OFFSET(reg));
+            if (s->vex_l) {
+                gen_sty_env_A0(s, ZMM_OFFSET(reg));
+            } else {
+                gen_sto_env_A0(s, ZMM_OFFSET(reg));
+            }
             break;
         case 0x3f0: /* lddqu */
             CHECK_AVX_V0(s);
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
-            gen_ldo_env_A0(s, ZMM_OFFSET(reg));
+            if (s->vex_l) {
+                gen_ldy_env_A0(s, ZMM_OFFSET(reg));
+            } else {
+                gen_ldo_env_A0(s, ZMM_OFFSET(reg));
+                gen_clear_ymmh(s, reg);
+            }
             break;
         case 0x22b: /* movntss */
         case 0x32b: /* movntsd */
@@ -3461,6 +3559,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_movl_mm_T0_xmm(s->ptr0, s->tmp2_i32);
             }
+            gen_clear_ymmh(s, reg);
             break;
         case 0x6f: /* movq mm, ea */
             CHECK_NO_VEX(s);
@@ -3484,10 +3583,20 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, ZMM_OFFSET(reg));
+                if (s->vex_l) {
+                    gen_ldy_env_A0(s, ZMM_OFFSET(reg));
+                } else {
+                    gen_ldo_env_A0(s, ZMM_OFFSET(reg));
+                }
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movo(s, ZMM_OFFSET(reg), ZMM_OFFSET(rm));
+                if (s->vex_l) {
+                    gen_op_movo_ymmh(s, ZMM_OFFSET(reg), ZMM_OFFSET(rm));
+                }
+            }
+            if (!s->vex_l) {
+                gen_clear_ymmh(s, reg);
             }
             break;
         case 0x210: /* movss xmm, ea */
@@ -3515,6 +3624,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 tcg_gen_st_i32(s->tmp2_i32, cpu_env,
                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)));
             }
+            gen_clear_ymmh(s, reg);
             break;
         case 0x310: /* movsd xmm, ea */
             if (mod != 3) {
@@ -3538,6 +3648,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
                             offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)));
             }
+            gen_clear_ymmh(s, reg);
             break;
         case 0x012: /* movlps */
         case 0x112: /* movlpd */
@@ -3556,23 +3667,44 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
                             offsetof(CPUX86State, xmm_regs[reg_v].ZMM_Q(1)));
             }
+            gen_clear_ymmh(s, reg);
             break;
         case 0x212: /* movsldup */
             CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, ZMM_OFFSET(reg));
+                if (s->vex_l) {
+                    gen_ldy_env_A0(s, ZMM_OFFSET(reg));
+                } else {
+                    gen_ldo_env_A0(s, ZMM_OFFSET(reg));
+                }
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
                             offsetof(CPUX86State,xmm_regs[rm].ZMM_L(0)));
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)),
                             offsetof(CPUX86State,xmm_regs[rm].ZMM_L(2)));
+                if (s->vex_l) {
+                    gen_op_movl(s,
+                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(4)),
+                                offsetof(CPUX86State, xmm_regs[rm].ZMM_L(4)));
+                    gen_op_movl(s,
+                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(6)),
+                                offsetof(CPUX86State, xmm_regs[rm].ZMM_L(6)));
+                }
             }
             gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
                         offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
             gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)),
                         offsetof(CPUX86State,xmm_regs[reg].ZMM_L(2)));
+            if (s->vex_l) {
+                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(5)),
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_L(4)));
+                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(7)),
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_L(6)));
+            } else {
+                gen_clear_ymmh(s, reg);
+            }
             break;
         case 0x312: /* movddup */
             CHECK_AVX_V0(s);
@@ -3580,13 +3712,29 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 gen_lea_modrm(env, s, modrm);
                 gen_ldq_env_A0(s, offsetof(CPUX86State,
                                            xmm_regs[reg].ZMM_Q(0)));
+                if (s->vex_l) {
+                    tcg_gen_addi_tl(s->A0, s->A0, 16);
+                    gen_ldq_env_A0(s, offsetof(CPUX86State,
+                                               xmm_regs[reg].ZMM_Q(2)));
+                }
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
                             offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
+                if (s->vex_l) {
+                    gen_op_movq(s,
+                                offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(2)),
+                                offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(2)));
+                }
             }
             gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
                         offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
+            if (s->vex_l) {
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(3)),
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(2)));
+            } else {
+                gen_clear_ymmh(s, reg);
+            }
             break;
         case 0x016: /* movhps */
         case 0x116: /* movhpd */
@@ -3605,23 +3753,44 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
                             offsetof(CPUX86State, xmm_regs[reg_v].ZMM_Q(0)));
             }
+            gen_clear_ymmh(s, reg);
             break;
         case 0x216: /* movshdup */
             CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, ZMM_OFFSET(reg));
+                if (s->vex_l) {
+                    gen_ldy_env_A0(s, ZMM_OFFSET(reg));
+                } else {
+                    gen_ldo_env_A0(s, ZMM_OFFSET(reg));
+                }
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
                             offsetof(CPUX86State,xmm_regs[rm].ZMM_L(1)));
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)),
                             offsetof(CPUX86State,xmm_regs[rm].ZMM_L(3)));
+                if (s->vex_l) {
+                    gen_op_movl(s,
+                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(5)),
+                                offsetof(CPUX86State, xmm_regs[rm].ZMM_L(5)));
+                    gen_op_movl(s,
+                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(7)),
+                                offsetof(CPUX86State, xmm_regs[rm].ZMM_L(7)));
+                }
             }
             gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
                         offsetof(CPUX86State,xmm_regs[reg].ZMM_L(1)));
             gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)),
                         offsetof(CPUX86State,xmm_regs[reg].ZMM_L(3)));
+            if (s->vex_l) {
+                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(4)),
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_L(5)));
+                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(6)),
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_L(7)));
+            } else {
+                gen_clear_ymmh(s, reg);
+            }
             break;
         case 0x178:
         case 0x378:
@@ -3686,6 +3855,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                             offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
             }
             gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)));
+            gen_clear_ymmh(s, reg);
             break;
         case 0x7f: /* movq ea, mm */
             CHECK_NO_VEX(s);
@@ -3707,10 +3877,19 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_sto_env_A0(s, ZMM_OFFSET(reg));
+                if (s->vex_l) {
+                    gen_sty_env_A0(s, ZMM_OFFSET(reg));
+                } else {
+                    gen_sto_env_A0(s, ZMM_OFFSET(reg));
+                }
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movo(s, ZMM_OFFSET(rm), ZMM_OFFSET(reg));
+                if (s->vex_l) {
+                    gen_op_movo_ymmh(s, ZMM_OFFSET(rm), ZMM_OFFSET(reg));
+                } else {
+                    gen_clear_ymmh(s, rm);
+                }
             }
             break;
         case 0x211: /* movss ea, xmm */
@@ -3728,6 +3907,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 }
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_L(0)),
                             offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
+                gen_clear_ymmh(s, rm);
             }
             break;
         case 0x311: /* movsd ea, xmm */
@@ -3746,6 +3926,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 }
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)),
                             offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
+                gen_clear_ymmh(s, rm);
             }
             break;
         case 0x013: /* movlps */
@@ -3798,6 +3979,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 op1_offset = offsetof(CPUX86State,mmx_t0);
             }
             assert(b1 < 2);
+            if (s->vex_l) {
+                b1 = 2;
+            }
             SSEFunc_0_eppp fn = sse_op_table2[((b - 1) & 3) * 8 +
                                        (((modrm >> 3)) & 7)][b1];
             if (!fn) {
@@ -3820,19 +4004,30 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
             tcg_gen_addi_ptr(s->ptr2, cpu_env, op1_offset);
             fn(cpu_env, s->ptr0, s->ptr1, s->ptr2);
+            if (!s->vex_l) {
+                gen_clear_ymmh(s, reg_v);
+            }
             break;
         case 0x050: /* movmskps */
             CHECK_AVX_V0(s);
             rm = (modrm & 7) | REX_B(s);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
-            gen_helper_movmskps_xmm(s->tmp2_i32, cpu_env, s->ptr0);
+            if (s->vex_l) {
+                gen_helper_movmskps_ymm(s->tmp2_i32, cpu_env, s->ptr0);
+            } else {
+                gen_helper_movmskps_xmm(s->tmp2_i32, cpu_env, s->ptr0);
+            }
             tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
             break;
         case 0x150: /* movmskpd */
             CHECK_AVX_V0(s);
             rm = (modrm & 7) | REX_B(s);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
-            gen_helper_movmskpd_xmm(s->tmp2_i32, cpu_env, s->ptr0);
+            if (s->vex_l) {
+                gen_helper_movmskpd_ymm(s->tmp2_i32, cpu_env, s->ptr0);
+            } else {
+                gen_helper_movmskpd_xmm(s->tmp2_i32, cpu_env, s->ptr0);
+            }
             tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
             break;
         case 0x02a: /* cvtpi2ps */
@@ -3883,6 +4078,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 goto illegal_op;
 #endif
             }
+            gen_clear_ymmh(s, reg);
             break;
         case 0x02c: /* cvttps2pi */
         case 0x12c: /* cvttpd2pi */
@@ -3972,6 +4168,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 tcg_gen_st16_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State,fpregs[reg].mmx.MMX_W(val)));
             }
+            gen_clear_ymmh(s, reg);
             break;
         case 0xc5: /* pextrw */
         case 0x1c5:
@@ -4031,7 +4228,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 CHECK_AVX_V0(s);
                 rm = (modrm & 7) | REX_B(s);
                 tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
-                gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, s->ptr0);
+                if (s->vex_l) {
+                    gen_helper_pmovmskb_ymm(s->tmp2_i32, cpu_env, s->ptr0);
+                } else {
+                    gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, s->ptr0);
+                }
             } else {
                 CHECK_NO_VEX(s);
                 rm = (modrm & 7);
@@ -4098,37 +4299,66 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 if (mod == 3) {
                     op2_offset = ZMM_OFFSET(rm | REX_B(s));
                 } else {
-                    op2_offset = offsetof(CPUX86State,xmm_t0);
+                    int size;
+                    op2_offset = offsetof(CPUX86State, xmm_t0);
                     gen_lea_modrm(env, s, modrm);
                     switch (b) {
                     case 0x20: case 0x30: /* pmovsxbw, pmovzxbw */
                     case 0x23: case 0x33: /* pmovsxwd, pmovzxwd */
                     case 0x25: case 0x35: /* pmovsxdq, pmovzxdq */
-                        gen_ldq_env_A0(s, op2_offset +
-                                        offsetof(ZMMReg, ZMM_Q(0)));
+                        size = 64;
                         break;
                     case 0x21: case 0x31: /* pmovsxbd, pmovzxbd */
                     case 0x24: case 0x34: /* pmovsxwq, pmovzxwq */
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
-                        tcg_gen_st_i32(s->tmp2_i32, cpu_env, op2_offset +
-                                        offsetof(ZMMReg, ZMM_L(0)));
+                        size = 32;
                         break;
                     case 0x22: case 0x32: /* pmovsxbq, pmovzxbq */
+                        size = 16;
+                        break;
+                    case 0x2a:            /* movntqda */
+                        if (s->vex_l) {
+                            gen_ldy_env_A0(s, op1_offset);
+                        } else {
+                            gen_ldo_env_A0(s, op1_offset);
+                            gen_clear_ymmh(s, reg);
+                        }
+                        return;
+                    default:
+                        size = 128;
+                    }
+                    if (s->vex_l) {
+                        size *= 2;
+                    }
+                    switch (size) {
+                    case 16:
                         tcg_gen_qemu_ld_tl(s->tmp0, s->A0,
                                            s->mem_index, MO_LEUW);
                         tcg_gen_st16_tl(s->tmp0, cpu_env, op2_offset +
                                         offsetof(ZMMReg, ZMM_W(0)));
                         break;
-                    case 0x2a:            /* movntqda */
-                        gen_ldo_env_A0(s, op1_offset);
-                        return;
-                    default:
+                    case 32:
+                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                            s->mem_index, MO_LEUL);
+                        tcg_gen_st_i32(s->tmp2_i32, cpu_env, op2_offset +
+                                        offsetof(ZMMReg, ZMM_L(0)));
+                        break;
+                    case 64:
+                        gen_ldq_env_A0(s, op2_offset +
+                                        offsetof(ZMMReg, ZMM_Q(0)));
+                        break;
+                    case 128:
                         gen_ldo_env_A0(s, op2_offset);
+                        break;
+                    case 256:
+                        gen_ldy_env_A0(s, op2_offset);
+                        break;
                     }
                 }
                 tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
                 tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+                if (s->vex_l) {
+                    b1 = 2;
+                }
                 if (!op6.fn[b1].op1) {
                     goto illegal_op;
                 }
@@ -4148,6 +4378,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                         fn(cpu_env, s->ptr0, s->ptr2, s->ptr1);
                     }
                 }
+                if ((op6.flags & SSE_OPF_CMP) == 0 && s->vex_l == 0) {
+                    gen_clear_ymmh(s, reg);
+                }
             } else {
                 CHECK_NO_VEX(s);
                 if ((op6.flags & SSE_OPF_MMX) == 0) {
@@ -4644,6 +4877,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     }
                     tcg_gen_st8_tl(s->T0, cpu_env, offsetof(CPUX86State,
                                             xmm_regs[reg].ZMM_B(val & 15)));
+                    gen_clear_ymmh(s, reg);
                     break;
                 case 0x21: /* insertps */
                     CHECK_AVX_128(s);
@@ -4677,6 +4911,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                         tcg_gen_st_i32(tcg_const_i32(0 /*float32_zero*/),
                                         cpu_env, offsetof(CPUX86State,
                                                 xmm_regs[reg].ZMM_L(3)));
+                    gen_clear_ymmh(s, reg);
                     break;
                 case 0x22:
                     CHECK_AVX_128(s);
@@ -4708,6 +4943,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                         goto illegal_op;
 #endif
                     }
+                    gen_clear_ymmh(s, reg);
                     break;
                 }
                 return;
@@ -4760,7 +4996,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             } else {
                 op2_offset = offsetof(CPUX86State, xmm_t0);
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, op2_offset);
+                if (s->vex_l) {
+                    gen_ldy_env_A0(s, op2_offset);
+                } else {
+                    gen_ldo_env_A0(s, op2_offset);
+                }
             }
 
             val = x86_ldub_code(env, s);
@@ -4771,8 +5011,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     /* The helper must use entire 64-bit gp registers */
                     val |= 1 << 8;
                 }
+                if ((b & 1) == 0) /* pcmpXsrtm */
+                    gen_clear_ymmh(s, 0);
             }
 
+            if (s->vex_l) {
+                b1 = 2;
+            }
             v_offset = ZMM_OFFSET(reg_v);
             /*
              * Populate the top part of the destination register for VEX
@@ -4796,6 +5041,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 op7.fn[b1].op2(cpu_env, s->ptr0, s->ptr2, s->ptr1,
                                tcg_const_i32(val));
             }
+            if ((op7.flags & SSE_OPF_CMP) == 0 && s->vex_l == 0) {
+                gen_clear_ymmh(s, reg);
+            }
             if (op7.flags & SSE_OPF_CMP) {
                 set_cc_op(s, CC_OP_EFLAGS);
             }
@@ -4848,6 +5096,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         default:
             break;
         }
+        if (s->vex_l) {
+            b1 += 4;
+        }
         if (is_xmm) {
             scalar_op = (s->prefix & PREFIX_VEX)
                 && (sse_op.flags & SSE_OPF_SCALAR)
@@ -4864,7 +5115,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             op1_offset = ZMM_OFFSET(reg);
             if (mod != 3) {
-                int sz = 4;
+                int sz = s->vex_l ? 5 : 4;
 
                 gen_lea_modrm(env, s, modrm);
                 op2_offset = offsetof(CPUX86State, xmm_t0);
@@ -4902,6 +5153,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     /* 128 bit access */
                     gen_ldo_env_A0(s, op2_offset);
                     break;
+                case 5:
+                    /* 256 bit access */
+                    gen_ldy_env_A0(s, op2_offset);
+                    break;
                 }
             } else {
                 rm = (modrm & 7) | REX_B(s);
@@ -5010,6 +5265,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
         }
 
+        if (s->vex_l == 0 && (sse_op.flags & SSE_OPF_CMP) == 0) {
+            gen_clear_ymmh(s, reg);
+        }
         if (sse_op.flags & SSE_OPF_CMP) {
             set_cc_op(s, CC_OP_EFLAGS);
         }
-- 
2.36.0


