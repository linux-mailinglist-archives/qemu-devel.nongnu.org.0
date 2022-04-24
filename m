Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EB150D59A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:10:45 +0200 (CEST)
Received: from localhost ([::1]:58840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikRI-0007KS-Ka
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikJD-00056v-Hs
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:02:24 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikJA-0001LA-Ix
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:02:23 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ6-0001ea-4W; Sun, 24 Apr 2022 23:02:16 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 07/42] Enforce VEX encoding restrictions
Date: Sun, 24 Apr 2022 23:01:29 +0100
Message-Id: <20220424220204.2493824-8-paul@nowt.org>
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

Add CHECK_AVX* macros, and use them to validate VEX encoded AVX instructions

All AVX instructions require both CPU and OS support, this is encapsulated
by HF_AVX_EN.

Some also require specific values in the VEX.L and VEX.V fields.
Some (mostly integer operations) also require AVX2

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/tcg/translate.c | 159 +++++++++++++++++++++++++++++++++---
 1 file changed, 149 insertions(+), 10 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 66ba690b7d..2f5cc24e0c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3185,10 +3185,54 @@ static const struct SSEOpHelper_table7 sse_op_table7[256] = {
         goto illegal_op; \
     } while (0)
 
+/*
+ * VEX encodings require AVX
+ * Allow legacy SSE encodings even if AVX not enabled
+ */
+#define CHECK_AVX(s) do { \
+    if ((s->prefix & PREFIX_VEX) \
+        && !(env->hflags & HF_AVX_EN_MASK)) \
+        goto illegal_op; \
+    } while (0)
+
+/* If a VEX prefix is used then it must have V=1111b */
+#define CHECK_AVX_V0(s) do { \
+    CHECK_AVX(s); \
+    if ((s->prefix & PREFIX_VEX) && (s->vex_v != 0)) \
+        goto illegal_op; \
+    } while (0)
+
+/* If a VEX prefix is used then it must have L=0 */
+#define CHECK_AVX_128(s) do { \
+    CHECK_AVX(s); \
+    if ((s->prefix & PREFIX_VEX) && (s->vex_l != 0)) \
+        goto illegal_op; \
+    } while (0)
+
+/* If a VEX prefix is used then it must have V=1111b and L=0 */
+#define CHECK_AVX_V0_128(s) do { \
+    CHECK_AVX(s); \
+    if ((s->prefix & PREFIX_VEX) && (s->vex_v != 0 || s->vex_l != 0)) \
+        goto illegal_op; \
+    } while (0)
+
+/* 256-bit (ymm) variants require AVX2 */
+#define CHECK_AVX2_256(s) do { \
+    if (s->vex_l && !(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_AVX2)) \
+        goto illegal_op; \
+    } while (0)
+
+/* Requires AVX2 and VEX encoding */
+#define CHECK_AVX2(s) do { \
+    if ((s->prefix & PREFIX_VEX) == 0 \
+            || !(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_AVX2)) \
+        goto illegal_op; \
+    } while (0)
+
 static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     target_ulong pc_start)
 {
-    int b1, op1_offset, op2_offset, is_xmm, val;
+    int b1, op1_offset, op2_offset, is_xmm, val, scalar_op;
     int modrm, mod, rm, reg;
     struct SSEOpHelper_table1 sse_op;
     struct SSEOpHelper_table6 op6;
@@ -3228,15 +3272,18 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
         return;
     }
-    if (s->flags & HF_EM_MASK) {
-    illegal_op:
-        gen_illegal_opcode(s);
-        return;
-    }
-    if (is_xmm
-        && !(s->flags & HF_OSFXSR_MASK)
-        && (b != 0x38 && b != 0x3a)) {
-        goto unknown_op;
+    /* VEX encoded instuctions ignore EM bit. See also CHECK_AVX */
+    if (!(s->prefix & PREFIX_VEX)) {
+        if (s->flags & HF_EM_MASK) {
+        illegal_op:
+            gen_illegal_opcode(s);
+            return;
+        }
+        if (is_xmm
+            && !(s->flags & HF_OSFXSR_MASK)
+            && (b != 0x38 && b != 0x3a)) {
+            goto unknown_op;
+        }
     }
     if (b == 0x0e) {
         if (!(s->cpuid_ext2_features & CPUID_EXT2_3DNOW)) {
@@ -3278,12 +3325,14 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x1e7: /* movntdq */
         case 0x02b: /* movntps */
         case 0x12b: /* movntps */
+            CHECK_AVX_V0(s);
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
             gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
             break;
         case 0x3f0: /* lddqu */
+            CHECK_AVX_V0(s);
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
@@ -3291,6 +3340,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x22b: /* movntss */
         case 0x32b: /* movntsd */
+            CHECK_AVX_V0_128(s);
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
@@ -3321,6 +3371,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x16e: /* movd xmm, ea */
+            CHECK_AVX_V0_128(s);
 #ifdef TARGET_X86_64
             if (s->dflag == MO_64) {
                 gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 0);
@@ -3356,6 +3407,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x128: /* movapd */
         case 0x16f: /* movdqa xmm, ea */
         case 0x26f: /* movdqu xmm, ea */
+            CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
@@ -3367,6 +3419,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x210: /* movss xmm, ea */
             if (mod != 3) {
+                CHECK_AVX_V0_128(s);
                 gen_lea_modrm(env, s, modrm);
                 gen_op_ld_v(s, MO_32, s->T0, s->A0);
                 tcg_gen_st32_tl(s->T0, cpu_env,
@@ -3379,6 +3432,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 tcg_gen_st32_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)));
             } else {
+                CHECK_AVX_128(s);
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
                             offsetof(CPUX86State,xmm_regs[rm].ZMM_L(0)));
@@ -3386,6 +3440,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x310: /* movsd xmm, ea */
             if (mod != 3) {
+                CHECK_AVX_V0_128(s);
                 gen_lea_modrm(env, s, modrm);
                 gen_ldq_env_A0(s, offsetof(CPUX86State,
                                            xmm_regs[reg].ZMM_Q(0)));
@@ -3395,6 +3450,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 tcg_gen_st32_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)));
             } else {
+                CHECK_AVX_128(s);
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
                             offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
@@ -3402,6 +3458,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x012: /* movlps */
         case 0x112: /* movlpd */
+            CHECK_AVX_128(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_ldq_env_A0(s, offsetof(CPUX86State,
@@ -3414,6 +3471,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x212: /* movsldup */
+            CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
@@ -3430,6 +3488,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                         offsetof(CPUX86State,xmm_regs[reg].ZMM_L(2)));
             break;
         case 0x312: /* movddup */
+            CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_ldq_env_A0(s, offsetof(CPUX86State,
@@ -3444,6 +3503,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x016: /* movhps */
         case 0x116: /* movhpd */
+            CHECK_AVX_128(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_ldq_env_A0(s, offsetof(CPUX86State,
@@ -3456,6 +3516,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x216: /* movshdup */
+            CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
@@ -3509,6 +3570,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x17e: /* movd ea, xmm */
+            CHECK_AVX_V0_128(s);
 #ifdef TARGET_X86_64
             if (s->dflag == MO_64) {
                 tcg_gen_ld_i64(s->T0, cpu_env,
@@ -3523,6 +3585,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x27e: /* movq xmm, ea */
+            CHECK_AVX_V0_128(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_ldq_env_A0(s, offsetof(CPUX86State,
@@ -3551,6 +3614,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x129: /* movapd */
         case 0x17f: /* movdqa ea, xmm */
         case 0x27f: /* movdqu ea, xmm */
+            CHECK_AVX_V0(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
@@ -3562,11 +3626,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x211: /* movss ea, xmm */
             if (mod != 3) {
+                CHECK_AVX_V0_128(s);
                 gen_lea_modrm(env, s, modrm);
                 tcg_gen_ld32u_tl(s->T0, cpu_env,
                                  offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)));
                 gen_op_st_v(s, MO_32, s->T0, s->A0);
             } else {
+                CHECK_AVX_128(s);
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_L(0)),
                             offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
@@ -3574,10 +3640,12 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x311: /* movsd ea, xmm */
             if (mod != 3) {
+                CHECK_AVX_V0_128(s);
                 gen_lea_modrm(env, s, modrm);
                 gen_stq_env_A0(s, offsetof(CPUX86State,
                                            xmm_regs[reg].ZMM_Q(0)));
             } else {
+                CHECK_AVX_128(s);
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)),
                             offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
@@ -3585,6 +3653,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x013: /* movlps */
         case 0x113: /* movlpd */
+            CHECK_AVX_V0_128(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_stq_env_A0(s, offsetof(CPUX86State,
@@ -3595,6 +3664,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x017: /* movhps */
         case 0x117: /* movhpd */
+            CHECK_AVX_V0_128(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_stq_env_A0(s, offsetof(CPUX86State,
@@ -3611,6 +3681,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x173:
             val = x86_ldub_code(env, s);
             if (is_xmm) {
+                CHECK_AVX(s);
+                CHECK_AVX2_256(s);
                 tcg_gen_movi_tl(s->T0, val);
                 tcg_gen_st32_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State, xmm_t0.ZMM_L(0)));
@@ -3646,6 +3718,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
             break;
         case 0x050: /* movmskps */
+            CHECK_AVX_V0(s);
             rm = (modrm & 7) | REX_B(s);
             tcg_gen_addi_ptr(s->ptr0, cpu_env,
                              offsetof(CPUX86State,xmm_regs[rm]));
@@ -3653,6 +3726,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
             break;
         case 0x150: /* movmskpd */
+            CHECK_AVX_V0(s);
             rm = (modrm & 7) | REX_B(s);
             tcg_gen_addi_ptr(s->ptr0, cpu_env,
                              offsetof(CPUX86State,xmm_regs[rm]));
@@ -3686,6 +3760,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x22a: /* cvtsi2ss */
         case 0x32a: /* cvtsi2sd */
+            CHECK_AVX(s);
             ot = mo_64_32(s->dflag);
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
             op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
@@ -3739,6 +3814,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x32c: /* cvttsd2si */
         case 0x22d: /* cvtss2si */
         case 0x32d: /* cvtsd2si */
+            CHECK_AVX_V0(s);
             ot = mo_64_32(s->dflag);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
@@ -3773,6 +3849,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0xc4: /* pinsrw */
         case 0x1c4:
+            CHECK_AVX_128(s);
             s->rip_offset = 1;
             gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
             val = x86_ldub_code(env, s);
@@ -3789,6 +3866,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0xc5: /* pextrw */
         case 0x1c5:
+            CHECK_AVX_V0_128(s);
             if (mod != 3)
                 goto illegal_op;
             ot = mo_64_32(s->dflag);
@@ -3808,6 +3886,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             gen_op_mov_reg_v(s, ot, reg, s->T0);
             break;
         case 0x1d6: /* movq ea, xmm */
+            CHECK_AVX_V0_128(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_stq_env_A0(s, offsetof(CPUX86State,
@@ -3840,6 +3919,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             if (mod != 3)
                 goto illegal_op;
             if (b1) {
+                CHECK_AVX_V0(s);
                 rm = (modrm & 7) | REX_B(s);
                 tcg_gen_addi_ptr(s->ptr0, cpu_env,
                                  offsetof(CPUX86State, xmm_regs[rm]));
@@ -3875,8 +3955,33 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 goto illegal_op;
             }
 
+            if (op6.ext_mask == CPUID_EXT_AVX
+                    && (s->prefix & PREFIX_VEX) == 0) {
+                goto illegal_op;
+            }
+            if (op6.flags & SSE_OPF_AVX2) {
+                CHECK_AVX2(s);
+            }
+
             if (b1) {
+                if (op6.flags & SSE_OPF_V0) {
+                    CHECK_AVX_V0(s);
+                } else {
+                    CHECK_AVX(s);
+                }
                 op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+
+                if (op6.flags & SSE_OPF_MMX) {
+                    CHECK_AVX2_256(s);
+                }
+                if (op6.flags & SSE_OPF_BLENDV) {
+                    /*
+                     * VEX encodings of the blendv opcodes are not valid
+                     * they use a different opcode with an 0f 3a prefix
+                     */
+                    CHECK_NO_VEX(s);
+                }
+
                 if (mod == 3) {
                     op2_offset = offsetof(CPUX86State,xmm_regs[rm | REX_B(s)]);
                 } else {
@@ -4327,6 +4432,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 val = x86_ldub_code(env, s);
                 switch (b) {
                 case 0x14: /* pextrb */
+                    CHECK_AVX_V0_128(s);
                     tcg_gen_ld8u_tl(s->T0, cpu_env, offsetof(CPUX86State,
                                             xmm_regs[reg].ZMM_B(val & 15)));
                     if (mod == 3) {
@@ -4337,6 +4443,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     }
                     break;
                 case 0x15: /* pextrw */
+                    CHECK_AVX_V0_128(s);
                     tcg_gen_ld16u_tl(s->T0, cpu_env, offsetof(CPUX86State,
                                             xmm_regs[reg].ZMM_W(val & 7)));
                     if (mod == 3) {
@@ -4347,6 +4454,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     }
                     break;
                 case 0x16:
+                    CHECK_AVX_V0_128(s);
                     if (ot == MO_32) { /* pextrd */
                         tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
                                         offsetof(CPUX86State,
@@ -4374,6 +4482,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     }
                     break;
                 case 0x17: /* extractps */
+                    CHECK_AVX_V0_128(s);
                     tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State,
                                             xmm_regs[reg].ZMM_L(val & 3)));
                     if (mod == 3) {
@@ -4384,6 +4493,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     }
                     break;
                 case 0x20: /* pinsrb */
+                    CHECK_AVX_128(s);
                     if (mod == 3) {
                         gen_op_mov_v_reg(s, MO_32, s->T0, rm);
                     } else {
@@ -4394,6 +4504,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                                             xmm_regs[reg].ZMM_B(val & 15)));
                     break;
                 case 0x21: /* insertps */
+                    CHECK_AVX_128(s);
                     if (mod == 3) {
                         tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
                                         offsetof(CPUX86State,xmm_regs[rm]
@@ -4423,6 +4534,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                                                 xmm_regs[reg].ZMM_L(3)));
                     break;
                 case 0x22:
+                    CHECK_AVX_128(s);
                     if (ot == MO_32) { /* pinsrd */
                         if (mod == 3) {
                             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[rm]);
@@ -4453,6 +4565,20 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 return;
             }
 
+            CHECK_AVX(s);
+            scalar_op = (s->prefix & PREFIX_VEX)
+                && (op7.flags & SSE_OPF_SCALAR)
+                && !(op7.flags & SSE_OPF_CMP);
+            if (is_xmm && (op7.flags & SSE_OPF_MMX)) {
+                CHECK_AVX2_256(s);
+            }
+            if (op7.flags & SSE_OPF_AVX2) {
+                CHECK_AVX2(s);
+            }
+            if ((op7.flags & SSE_OPF_V0) && !scalar_op) {
+                CHECK_AVX_V0(s);
+            }
+
             if (b1) {
                 op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
                 if (mod == 3) {
@@ -4540,6 +4666,19 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         }
         if (is_xmm) {
+            scalar_op = (s->prefix & PREFIX_VEX)
+                && (sse_op.flags & SSE_OPF_SCALAR)
+                && !(sse_op.flags & SSE_OPF_CMP)
+                && (b1 == 2 || b1 == 3);
+            /* VEX encoded scalar ops always have 3 operands! */
+            if ((sse_op.flags & SSE_OPF_V0) && !scalar_op) {
+                CHECK_AVX_V0(s);
+            } else {
+                CHECK_AVX(s);
+            }
+            if (sse_op.flags & SSE_OPF_MMX) {
+                CHECK_AVX2_256(s);
+            }
             op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
             if (mod != 3) {
                 int sz = 4;
-- 
2.36.0


