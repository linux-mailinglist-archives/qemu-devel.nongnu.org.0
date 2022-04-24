Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706AB50D599
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:10:44 +0200 (CEST)
Received: from localhost ([::1]:58770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikRH-0007Hj-H5
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikJE-00056x-2N
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:02:24 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikJA-0001LB-LH
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:02:23 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ6-0001ea-Ar; Sun, 24 Apr 2022 23:02:16 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 08/42] i386: Add ZMM_OFFSET macro
Date: Sun, 24 Apr 2022 23:01:30 +0100
Message-Id: <20220424220204.2493824-9-paul@nowt.org>
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

Add a convenience macro to get the address of an xmm_regs element within
CPUX86State.

This was originally going to be the basis of an implementation that broke
operations into 128 bit chunks. I scrapped that idea, so this is now a purely
cosmetic change. But I think a worthwhile one - it reduces the number of
function calls that need to be split over multiple lines.

No functional changes.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/tcg/translate.c | 60 +++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 33 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 2f5cc24e0c..e9e6062b7f 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2777,6 +2777,8 @@ static inline void gen_op_movq_env_0(DisasContext *s, int d_offset)
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset);
 }
 
+#define ZMM_OFFSET(reg) offsetof(CPUX86State, xmm_regs[reg])
+
 typedef void (*SSEFunc_i_ep)(TCGv_i32 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_l_ep)(TCGv_i64 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_0_epi)(TCGv_ptr env, TCGv_ptr reg, TCGv_i32 val);
@@ -3329,14 +3331,14 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
-            gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+            gen_sto_env_A0(s, ZMM_OFFSET(reg));
             break;
         case 0x3f0: /* lddqu */
             CHECK_AVX_V0(s);
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
-            gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+            gen_ldo_env_A0(s, ZMM_OFFSET(reg));
             break;
         case 0x22b: /* movntss */
         case 0x32b: /* movntsd */
@@ -3375,15 +3377,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
 #ifdef TARGET_X86_64
             if (s->dflag == MO_64) {
                 gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 0);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State,xmm_regs[reg]));
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(reg));
                 gen_helper_movq_mm_T0_xmm(s->ptr0, s->T0);
             } else
 #endif
             {
                 gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 0);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State,xmm_regs[reg]));
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(reg));
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_movl_mm_T0_xmm(s->ptr0, s->tmp2_i32);
             }
@@ -3410,11 +3410,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                gen_ldo_env_A0(s, ZMM_OFFSET(reg));
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                gen_op_movo(s, offsetof(CPUX86State, xmm_regs[reg]),
-                            offsetof(CPUX86State,xmm_regs[rm]));
+                gen_op_movo(s, ZMM_OFFSET(reg), ZMM_OFFSET(rm));
             }
             break;
         case 0x210: /* movss xmm, ea */
@@ -3474,7 +3473,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                gen_ldo_env_A0(s, ZMM_OFFSET(reg));
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
@@ -3519,7 +3518,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                gen_ldo_env_A0(s, ZMM_OFFSET(reg));
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
@@ -3542,8 +3541,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     goto illegal_op;
                 field_length = x86_ldub_code(env, s) & 0x3F;
                 bit_index = x86_ldub_code(env, s) & 0x3F;
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                    offsetof(CPUX86State,xmm_regs[reg]));
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(reg));
                 if (b1 == 1)
                     gen_helper_extrq_i(cpu_env, s->ptr0,
                                        tcg_const_i32(bit_index),
@@ -3617,11 +3615,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                gen_sto_env_A0(s, ZMM_OFFSET(reg));
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                gen_op_movo(s, offsetof(CPUX86State, xmm_regs[rm]),
-                            offsetof(CPUX86State,xmm_regs[reg]));
+                gen_op_movo(s, ZMM_OFFSET(rm), ZMM_OFFSET(reg));
             }
             break;
         case 0x211: /* movss ea, xmm */
@@ -3708,7 +3705,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             if (is_xmm) {
                 rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+                op2_offset = ZMM_OFFSET(rm);
             } else {
                 rm = (modrm & 7);
                 op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
@@ -3720,16 +3717,14 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x050: /* movmskps */
             CHECK_AVX_V0(s);
             rm = (modrm & 7) | REX_B(s);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                             offsetof(CPUX86State,xmm_regs[rm]));
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
             gen_helper_movmskps(s->tmp2_i32, cpu_env, s->ptr0);
             tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
             break;
         case 0x150: /* movmskpd */
             CHECK_AVX_V0(s);
             rm = (modrm & 7) | REX_B(s);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                             offsetof(CPUX86State,xmm_regs[rm]));
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
             gen_helper_movmskpd(s->tmp2_i32, cpu_env, s->ptr0);
             tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
             break;
@@ -3745,7 +3740,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 rm = (modrm & 7);
                 op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
             }
-            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+            op1_offset = ZMM_OFFSET(reg);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
             switch(b >> 8) {
@@ -3763,7 +3758,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             CHECK_AVX(s);
             ot = mo_64_32(s->dflag);
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+            op1_offset = ZMM_OFFSET(reg);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             if (ot == MO_32) {
                 SSEFunc_0_epi sse_fn_epi = sse_op_table3ai[(b >> 8) & 1];
@@ -3790,7 +3785,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 gen_ldo_env_A0(s, op2_offset);
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+                op2_offset = ZMM_OFFSET(rm);
             }
             op1_offset = offsetof(CPUX86State,fpregs[reg & 7].mmx);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
@@ -3828,7 +3823,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 op2_offset = offsetof(CPUX86State,xmm_t0);
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+                op2_offset = ZMM_OFFSET(rm);
             }
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op2_offset);
             if (ot == MO_32) {
@@ -3921,8 +3916,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             if (b1) {
                 CHECK_AVX_V0(s);
                 rm = (modrm & 7) | REX_B(s);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State, xmm_regs[rm]));
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
                 gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, s->ptr0);
             } else {
                 CHECK_NO_VEX(s);
@@ -3969,7 +3963,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 } else {
                     CHECK_AVX(s);
                 }
-                op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+                op1_offset = ZMM_OFFSET(reg);
 
                 if (op6.flags & SSE_OPF_MMX) {
                     CHECK_AVX2_256(s);
@@ -3983,7 +3977,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 }
 
                 if (mod == 3) {
-                    op2_offset = offsetof(CPUX86State,xmm_regs[rm | REX_B(s)]);
+                    op2_offset = ZMM_OFFSET(rm | REX_B(s));
                 } else {
                     op2_offset = offsetof(CPUX86State,xmm_t0);
                     gen_lea_modrm(env, s, modrm);
@@ -4580,9 +4574,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
 
             if (b1) {
-                op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+                op1_offset = ZMM_OFFSET(reg);
                 if (mod == 3) {
-                    op2_offset = offsetof(CPUX86State,xmm_regs[rm | REX_B(s)]);
+                    op2_offset = ZMM_OFFSET(rm | REX_B(s));
                 } else {
                     op2_offset = offsetof(CPUX86State,xmm_t0);
                     gen_lea_modrm(env, s, modrm);
@@ -4679,7 +4673,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             if (sse_op.flags & SSE_OPF_MMX) {
                 CHECK_AVX2_256(s);
             }
-            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+            op1_offset = ZMM_OFFSET(reg);
             if (mod != 3) {
                 int sz = 4;
 
@@ -4726,7 +4720,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 }
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+                op2_offset = ZMM_OFFSET(rm);
             }
         } else {
             CHECK_NO_VEX(s);
-- 
2.36.0


