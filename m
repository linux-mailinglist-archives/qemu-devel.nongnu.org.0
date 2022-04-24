Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6C250D597
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:08:30 +0200 (CEST)
Received: from localhost ([::1]:54518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikP7-0004N3-KC
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikJC-00056i-Sk
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:02:22 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikJA-0001L7-JI
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:02:22 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ5-0001ea-SZ; Sun, 24 Apr 2022 23:02:15 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 06/42] i386: Add CHECK_NO_VEX
Date: Sun, 24 Apr 2022 23:01:28 +0100
Message-Id: <20220424220204.2493824-7-paul@nowt.org>
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

Reject invalid VEX encodings on MMX instructions.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/tcg/translate.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5335b86c01..66ba690b7d 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3179,6 +3179,12 @@ static const struct SSEOpHelper_table7 sse_op_table7[256] = {
 #undef BLENDV_OP
 #undef SPECIAL_OP
 
+/* VEX prefix not allowed */
+#define CHECK_NO_VEX(s) do { \
+    if (s->prefix & PREFIX_VEX) \
+        goto illegal_op; \
+    } while (0)
+
 static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     target_ulong pc_start)
 {
@@ -3262,6 +3268,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         b |= (b1 << 8);
         switch(b) {
         case 0x0e7: /* movntq */
+            CHECK_NO_VEX(s);
             if (mod == 3) {
                 goto illegal_op;
             }
@@ -3297,6 +3304,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x6e: /* movd mm, ea */
+            CHECK_NO_VEX(s);
 #ifdef TARGET_X86_64
             if (s->dflag == MO_64) {
                 gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 0);
@@ -3330,6 +3338,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x6f: /* movq mm, ea */
+            CHECK_NO_VEX(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_ldq_env_A0(s, offsetof(CPUX86State, fpregs[reg].mmx));
@@ -3464,6 +3473,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x178:
         case 0x378:
+            CHECK_NO_VEX(s);
             {
                 int bit_index, field_length;
 
@@ -3484,6 +3494,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x7e: /* movd ea, mm */
+            CHECK_NO_VEX(s);
 #ifdef TARGET_X86_64
             if (s->dflag == MO_64) {
                 tcg_gen_ld_i64(s->T0, cpu_env,
@@ -3524,6 +3535,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)));
             break;
         case 0x7f: /* movq ea, mm */
+            CHECK_NO_VEX(s);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_stq_env_A0(s, offsetof(CPUX86State, fpregs[reg].mmx));
@@ -3607,6 +3619,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                                 offsetof(CPUX86State, xmm_t0.ZMM_L(1)));
                 op1_offset = offsetof(CPUX86State,xmm_t0);
             } else {
+                CHECK_NO_VEX(s);
                 tcg_gen_movi_tl(s->T0, val);
                 tcg_gen_st32_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State, mmx_t0.MMX_L(0)));
@@ -3648,6 +3661,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x02a: /* cvtpi2ps */
         case 0x12a: /* cvtpi2pd */
+            CHECK_NO_VEX(s);
             gen_helper_enter_mmx(cpu_env);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
@@ -3693,6 +3707,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x12c: /* cvttpd2pi */
         case 0x02d: /* cvtps2pi */
         case 0x12d: /* cvtpd2pi */
+            CHECK_NO_VEX(s);
             gen_helper_enter_mmx(cpu_env);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
@@ -3766,6 +3781,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 tcg_gen_st16_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State,xmm_regs[reg].ZMM_W(val)));
             } else {
+                CHECK_NO_VEX(s);
                 val &= 3;
                 tcg_gen_st16_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State,fpregs[reg].mmx.MMX_W(val)));
@@ -3805,6 +3821,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
         case 0x2d6: /* movq2dq */
+            CHECK_NO_VEX(s);
             gen_helper_enter_mmx(cpu_env);
             rm = (modrm & 7);
             gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
@@ -3812,6 +3829,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)));
             break;
         case 0x3d6: /* movdq2q */
+            CHECK_NO_VEX(s);
             gen_helper_enter_mmx(cpu_env);
             rm = (modrm & 7) | REX_B(s);
             gen_op_movq(s, offsetof(CPUX86State, fpregs[reg & 7].mmx),
@@ -3827,6 +3845,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                                  offsetof(CPUX86State, xmm_regs[rm]));
                 gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, s->ptr0);
             } else {
+                CHECK_NO_VEX(s);
                 rm = (modrm & 7);
                 tcg_gen_addi_ptr(s->ptr0, cpu_env,
                                  offsetof(CPUX86State, fpregs[rm].mmx));
@@ -3891,6 +3910,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     }
                 }
             } else {
+                CHECK_NO_VEX(s);
                 if ((op6.flags & SSE_OPF_MMX) == 0) {
                     goto unknown_op;
                 }
@@ -3928,6 +3948,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             case 0x3f0: /* crc32 Gd,Eb */
             case 0x3f1: /* crc32 Gd,Ey */
             do_crc32:
+                CHECK_NO_VEX(s);
                 if (!(s->cpuid_ext_features & CPUID_EXT_SSE42)) {
                     goto illegal_op;
                 }
@@ -3950,6 +3971,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
 
             case 0x1f0: /* crc32 or movbe */
             case 0x1f1:
+                CHECK_NO_VEX(s);
                 /* For these insns, the f3 prefix is supposed to have priority
                    over the 66 prefix, but that's not what we implement above
                    setting b1.  */
@@ -3959,6 +3981,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 /* FALLTHRU */
             case 0x0f0: /* movbe Gy,My */
             case 0x0f1: /* movbe My,Gy */
+                CHECK_NO_VEX(s);
                 if (!(s->cpuid_ext_features & CPUID_EXT_MOVBE)) {
                     goto illegal_op;
                 }
@@ -4125,6 +4148,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
 
             case 0x1f6: /* adcx Gy, Ey */
             case 0x2f6: /* adox Gy, Ey */
+                CHECK_NO_VEX(s);
                 if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_ADX)) {
                     goto illegal_op;
                 } else {
@@ -4439,6 +4463,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     gen_ldo_env_A0(s, op2_offset);
                 }
             } else {
+                CHECK_NO_VEX(s);
                 if ((op7.flags & SSE_OPF_MMX) == 0) {
                     goto illegal_op;
                 }
@@ -4565,6 +4590,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
             }
         } else {
+            CHECK_NO_VEX(s);
             op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-- 
2.36.0


