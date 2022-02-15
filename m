Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FD94B792A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 22:11:01 +0100 (CET)
Received: from localhost ([::1]:36210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK56B-0001Wy-MV
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 16:10:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.kanavin@gmail.com>)
 id 1nK53z-00081q-Ix
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 16:08:44 -0500
Received: from [2a00:1450:4864:20::62a] (port=36400
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.kanavin@gmail.com>)
 id 1nK53w-0005Kz-Uy
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 16:08:43 -0500
Received: by mail-ej1-x62a.google.com with SMTP id jg20so22039273ejc.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 13:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CfQRdtbyJnVTZ5vcMfgR0ZQCgifg3c+t/Lrr5IqOCGw=;
 b=ihPphRGuqXGpVxwnmkooVTWITTDzBTrAu9eeweEvHGLqK0fTVbR10UEGFUQx/q8TbP
 yaMWKHwuGJ9vD/pBs55lPbXI6K1PihHww8iin9gVHyargcqEtyf6Hq7fQvoH2EEIZnf/
 JoLqoiyB/y8ZrvN27VeIKoTfXYlNI2b1xz7p3Ox+4pg/FGn9et2qKid4rUg0U2moHXcN
 rImF/+/J3MReKrEBYZFSrGM8YItRjyJIzJ2L8pfOJws6avLWJOOkrmbjBPl9XAF+gQ6p
 a4a7EvuV4DNUkHkYj/iPpG6hD0sIu+SBDGFTMV1VpKs51qWwfqOeByI32eUqVRUv4kUY
 Cnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CfQRdtbyJnVTZ5vcMfgR0ZQCgifg3c+t/Lrr5IqOCGw=;
 b=nflrTSgCa4O6uB/FjCdeGLDwLPtmqTZb9dsYanD62CSkkpfdegsCCSqFMZYSPa0rkX
 BlYNgpEYPeHWPu1P/LIGM2+NrUSnOf0O+fm7URhVnrMwNEXh45lyULYML3se1O+50juA
 Wk4KTYXmE6ylFBHDgSukrCnyM7wuBT1BR8CBdoy96snrvIDUvNj+daGGOmvx5r1WEjNs
 IfC27QhNsaGDiOLF1lcLTQ1/02zlMvySLto4Qw4WoACcDoEez5V8hkEjJRnuJTYv+5Q7
 kE37vwD6h0mpGAjPxibKIcGEINUOrSiCaUW+0Gq24H3fR3lJmVPHTg4XtVe6SWWk8b8V
 DCkQ==
X-Gm-Message-State: AOAM532T1cvrpCD2eZuWLi2UBeAiJuegJABkv+19gePFB6QipmF5ayRj
 0ytNvarmVf3qugQlgUmjDJ2YH+uiFRs=
X-Google-Smtp-Source: ABdhPJyE/+2xFxp9/ohvwsOwMutKNa2a7DrUAYh0jGvd0RN7rYuiTXPR+NP65A/Xgt8CjhSxigoVbw==
X-Received: by 2002:a17:906:549:: with SMTP id k9mr725457eja.649.1644958861523; 
 Tue, 15 Feb 2022 13:01:01 -0800 (PST)
Received: from alex-lx-laptop.fritz.box
 ([2a02:2454:29b:3b00:6474:2a45:decd:ac3c])
 by smtp.gmail.com with ESMTPSA id z1sm1217455eji.136.2022.02.15.13.01.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 13:01:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] i386/tcg: add AVX/AVX2 support (severely incomplete,
 just for preliminary feedback)
Date: Tue, 15 Feb 2022 22:00:59 +0100
Message-Id: <20220215210059.37002-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.kanavin@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lack of AVX/AVX2 support in the i386 TCG has been a significant gap
for a long while; I've started work to close this gap.

This is of course nowhere near complete, or even buildable, I'm
just requesting initial feedback from the qemu gurus - am I on
the right track with this? Does something need to be done differently?

There's an enormous amount of legacy SSE instructions to adjust
for VEX-128 and VEX-256 flavours, so I would want to know that this
way would be acceptable.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 target/i386/cpu.h            |   6 ++
 target/i386/ops_sse.h        |  40 +++++++++---
 target/i386/ops_sse_header.h |   6 +-
 target/i386/tcg/translate.c  | 115 ++++++++++++++++++++++++++++++-----
 4 files changed, 140 insertions(+), 27 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9911d7c871..ff83c7ef5b 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -82,6 +82,12 @@ typedef enum X86Seg {
     R_TR = 7,
 } X86Seg;
 
+enum {
+    SIMD_SSE,
+    SIMD_VEX128,
+    SIMD_VEX256
+};
+
 /* segment descriptor fields */
 #define DESC_G_SHIFT    23
 #define DESC_G_MASK     (1 << DESC_G_SHIFT)
diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 6f1fc174b3..5a57abd383 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1249,15 +1249,27 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     }                                                                   \
                                                                         \
     void glue(helper_punpck ## base_name ## dq, SUFFIX)(CPUX86State *env,\
-                                                        Reg *d, Reg *s) \
+                                                        Reg *d, Reg *s2, Reg *s1, unsigned int simd_type) \
     {                                                                   \
         Reg r;                                                          \
                                                                         \
-        r.L(0) = d->L((base << SHIFT) + 0);                             \
-        r.L(1) = s->L((base << SHIFT) + 0);                             \
+        if (simd_type == SIMD_SSE)                             \
+            s1 = d;                                            \
+        r.L(0) = s1->L((base << SHIFT) + 0);                             \
+        r.L(1) = s2->L((base << SHIFT) + 0);                             \
         XMM_ONLY(                                                       \
-                 r.L(2) = d->L((base << SHIFT) + 1);                    \
-                 r.L(3) = s->L((base << SHIFT) + 1);                    \
+                 r.L(2) = s1->L((base << SHIFT) + 1);                    \
+                 r.L(3) = s2->L((base << SHIFT) + 1);                    \
+                 if (simd_type == SIMD_VEX256) {                        \
+                     r.L(4) = s1->L((base<<1) + 4);                            \
+                     r.L(5) = s2->L((base<<1) + 4);                            \
+                     r.L(6) = s1->L((base<<1) + 5);                            \
+                     r.L(7) = s2->L((base<<1) + 5);                            \
+                 }                                                      \
+                 if (simd_type == SIMD_VEX128) {                        \
+                     r.Q(2) = 0;                                        \
+                     r.Q(3) = 0;                                        \
+                 }                                                      \
                                                                       ) \
             *d = r;                                                     \
     }                                                                   \
@@ -1266,12 +1278,24 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
              void glue(helper_punpck ## base_name ## qdq, SUFFIX)(CPUX86State \
                                                                   *env, \
                                                                   Reg *d, \
-                                                                  Reg *s) \
+                                                                  Reg *s2, \
+                                                                  Reg *s1, \
+                                                                  unsigned int simd_type) \
              {                                                          \
                  Reg r;                                                 \
                                                                         \
-                 r.Q(0) = d->Q(base);                                   \
-                 r.Q(1) = s->Q(base);                                   \
+                 if (simd_type == SIMD_SSE)                             \
+                     s1 = d;                                            \
+                 r.Q(0) = s1->Q(base);                                  \
+                 r.Q(1) = s2->Q(base);                                  \
+                 if (simd_type == SIMD_VEX256) {                        \
+                     r.Q(2) = s1->Q(base+2);                            \
+                     r.Q(3) = s2->Q(base+2);                            \
+                 }                                                      \
+                 if (simd_type == SIMD_VEX128) {                        \
+                     r.Q(2) = 0;                                        \
+                     r.Q(3) = 0;                                        \
+                 }                                                      \
                  *d = r;                                                \
              }                                                          \
                                                                         )
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index e68af5c403..269aef771b 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -228,14 +228,14 @@ DEF_HELPER_3(glue(packssdw, SUFFIX), void, env, Reg, Reg)
 #define UNPCK_OP(base_name, base)                                       \
     DEF_HELPER_3(glue(punpck ## base_name ## bw, SUFFIX), void, env, Reg, Reg) \
     DEF_HELPER_3(glue(punpck ## base_name ## wd, SUFFIX), void, env, Reg, Reg) \
-    DEF_HELPER_3(glue(punpck ## base_name ## dq, SUFFIX), void, env, Reg, Reg)
+    DEF_HELPER_5(glue(punpck ## base_name ## dq, SUFFIX), void, env, Reg, Reg, Reg, i32)
 
 UNPCK_OP(l, 0)
 UNPCK_OP(h, 1)
 
 #if SHIFT == 1
-DEF_HELPER_3(glue(punpcklqdq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(punpckhqdq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_5(glue(punpcklqdq, SUFFIX), void, env, Reg, Reg, Reg, i32)
+DEF_HELPER_5(glue(punpckhqdq, SUFFIX), void, env, Reg, Reg, Reg, i32)
 #endif
 
 /* 3DNow! float ops */
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 77878cd832..5d59472ea9 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2729,7 +2729,7 @@ static inline void gen_stq_env_A0(DisasContext *s, int offset)
     tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEUQ);
 }
 
-static inline void gen_ldo_env_A0(DisasContext *s, int offset)
+static inline void gen_ldo_env_A0(DisasContext *s, int offset, int simd_type)
 {
     int mem_index = s->mem_index;
     tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, mem_index, MO_LEUQ);
@@ -2737,6 +2737,17 @@ static inline void gen_ldo_env_A0(DisasContext *s, int offset)
     tcg_gen_addi_tl(s->tmp0, s->A0, 8);
     tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(1)));
+    if (simd_type == SIMD_VEX128) {
+        tcg_gen_st_i64(0, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(2)));
+        tcg_gen_st_i64(0, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(3)));
+    } else if (simd_type == SIMD_VEX256) {
+        tcg_gen_addi_tl(s->tmp0, s->A0, 8);
+        tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+        tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(2)));
+        tcg_gen_addi_tl(s->tmp0, s->A0, 8);
+        tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
+        tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(3)));
+    }
 }
 
 static inline void gen_sto_env_A0(DisasContext *s, int offset)
@@ -2749,12 +2760,21 @@ static inline void gen_sto_env_A0(DisasContext *s, int offset)
     tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
 }
 
-static inline void gen_op_movo(DisasContext *s, int d_offset, int s_offset)
+static inline void gen_op_movo(DisasContext *s, int d_offset, int s_offset, int simd_type)
 {
     tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(0)));
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(0)));
     tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(1)));
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(1)));
+    if (simd_type == SIMD_VEX128) {
+        tcg_gen_st_i64(0, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(2)));
+        tcg_gen_st_i64(0, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(3)));
+    } else if (simd_type == SIMD_VEX256) {
+        tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(2)));
+        tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(2)));
+        tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(3)));
+        tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(3)));
+    }
 }
 
 static inline void gen_op_movq(DisasContext *s, int d_offset, int s_offset)
@@ -2779,7 +2799,7 @@ typedef void (*SSEFunc_i_ep)(TCGv_i32 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_l_ep)(TCGv_i64 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_0_epi)(TCGv_ptr env, TCGv_ptr reg, TCGv_i32 val);
 typedef void (*SSEFunc_0_epl)(TCGv_ptr env, TCGv_ptr reg, TCGv_i64 val);
-typedef void (*SSEFunc_0_epp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b);
+typedef void (*SSEFunc_0_epp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b, TCGv_ptr reg_c, TCGv_i32 simd_mode);
 typedef void (*SSEFunc_0_eppi)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
                                TCGv_i32 val);
 typedef void (*SSEFunc_0_ppi)(TCGv_ptr reg_a, TCGv_ptr reg_b, TCGv_i32 val);
@@ -3115,6 +3135,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
     SSEFunc_0_ppi sse_fn_ppi;
     SSEFunc_0_eppt sse_fn_eppt;
     MemOp ot;
+    int simd_type;
+
+    simd_type = SIMD_SSE;
+    if ((s->prefix & PREFIX_VEX) && (s->vex_l == 0))
+        simd_type = SIMD_VEX128;
+    else if ((s->prefix & PREFIX_VEX) && (s->vex_l == 1))
+        simd_type = SIMD_VEX256;
 
     b &= 0xff;
     if (s->prefix & PREFIX_DATA)
@@ -3271,11 +3298,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x26f: /* movdqu xmm, ea */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]), simd_type);
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movo(s, offsetof(CPUX86State, xmm_regs[reg]),
-                            offsetof(CPUX86State,xmm_regs[rm]));
+                            offsetof(CPUX86State,xmm_regs[rm]), simd_type);
             }
             break;
         case 0x210: /* movss xmm, ea */
@@ -3291,8 +3318,16 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                                 offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)));
                 tcg_gen_st32_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)));
+                if (simd_type == SIMD_VEX128) {
+                   tcg_gen_st_i64(0, cpu_env, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(2)));
+                   tcg_gen_st_i64(0, cpu_env, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(3)));
+                }
             } else {
                 rm = (modrm & 7) | REX_B(s);
+                if (simd_type == SIMD_VEX128) {
+                    gen_op_movo(s, offsetof(CPUX86State, xmm_regs[reg]),
+                                offsetof(CPUX86State,xmm_regs[s->vex_v]), simd_type);
+                }
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
                             offsetof(CPUX86State,xmm_regs[rm].ZMM_L(0)));
             }
@@ -3307,8 +3342,16 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                                 offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)));
                 tcg_gen_st32_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)));
+                if (simd_type == SIMD_VEX128) {
+                   tcg_gen_st_i64(0, cpu_env, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(2)));
+                   tcg_gen_st_i64(0, cpu_env, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(3)));
+                }
             } else {
                 rm = (modrm & 7) | REX_B(s);
+                if (simd_type == SIMD_VEX128) {
+                    gen_op_movo(s, offsetof(CPUX86State, xmm_regs[reg]),
+                                offsetof(CPUX86State,xmm_regs[s->vex_v]), simd_type);
+                }
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
                             offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
             }
@@ -3316,6 +3359,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x012: /* movlps */
         case 0x112: /* movlpd */
             if (mod != 3) {
+                if (simd_type == SIMD_VEX128) {
+                    gen_op_movo(s, offsetof(CPUX86State, xmm_regs[reg]),
+                                offsetof(CPUX86State,xmm_regs[s->vex_v]), simd_type);
+                }
                 gen_lea_modrm(env, s, modrm);
                 gen_ldq_env_A0(s, offsetof(CPUX86State,
                                            xmm_regs[reg].ZMM_Q(0)));
@@ -3324,36 +3371,50 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
                             offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(1)));
+                if (simd_type == SIMD_VEX128) {
+                    gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
+                                offsetof(CPUX86State,xmm_regs[s->vex_v].ZMM_Q(1)));
+                    tcg_gen_st_i64(0, cpu_env, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(2)));
+                    tcg_gen_st_i64(0, cpu_env, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(3)));
+                }
             }
             break;
         case 0x212: /* movsldup */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]), simd_type);
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(0)));
-                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(2)));
+                gen_op_movo(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
+                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)), simd_type);
             }
             gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
                         offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
             gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)),
                         offsetof(CPUX86State,xmm_regs[reg].ZMM_L(2)));
+            if (simd_type == SIMD_VEX256) {
+                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(5)),
+                            offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(4)));
+                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(7)),
+                            offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(6)));
+            }
             break;
         case 0x312: /* movddup */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(0)));
+                gen_ldo_env_A0(s, offsetof(CPUX86State,
+                                           xmm_regs[reg]), simd_type);
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
+                gen_op_movo(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
+                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)), simd_type);
             }
             gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
                         offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
+            if (simd_type == SIMD_VEX256) {
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(3)),
+                            offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(2)));
+            }
             break;
         case 0x016: /* movhps */
         case 0x116: /* movhpd */
@@ -3361,11 +3422,23 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 gen_lea_modrm(env, s, modrm);
                 gen_ldq_env_A0(s, offsetof(CPUX86State,
                                            xmm_regs[reg].ZMM_Q(1)));
+                if (simd_type == SIMD_VEX128) {
+                    gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
+                                offsetof(CPUX86State,xmm_regs[s->vex_v].ZMM_Q(0)));
+                    tcg_gen_st_i64(0, cpu_env, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(2)));
+                    tcg_gen_st_i64(0, cpu_env, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(3)));
+                }
             } else {
                 /* movlhps */
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
                             offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
+                if (simd_type == SIMD_VEX128) {
+                    gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
+                                offsetof(CPUX86State,xmm_regs[s->vex_v].ZMM_Q(0)));
+                    tcg_gen_st_i64(0, cpu_env, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(2)));
+                    tcg_gen_st_i64(0, cpu_env, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(3)));
+                }
             }
             break;
         case 0x216: /* movshdup */
@@ -3467,7 +3540,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movo(s, offsetof(CPUX86State, xmm_regs[rm]),
-                            offsetof(CPUX86State,xmm_regs[reg]));
+                            offsetof(CPUX86State,xmm_regs[reg]), simd_type);
             }
             break;
         case 0x211: /* movss ea, xmm */
@@ -3478,6 +3551,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 gen_op_st_v(s, MO_32, s->T0, s->A0);
             } else {
                 rm = (modrm & 7) | REX_B(s);
+                if (simd_type == SIMD_VEX128) {
+                    gen_op_movo(s, offsetof(CPUX86State, xmm_regs[rm]),
+                                offsetof(CPUX86State,xmm_regs[s->vex_v]), simd_type);
+                }
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_L(0)),
                             offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
             }
@@ -3489,6 +3566,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                                            xmm_regs[reg].ZMM_Q(0)));
             } else {
                 rm = (modrm & 7) | REX_B(s);
+                if (simd_type == SIMD_VEX128) {
+                    gen_op_movo(s, offsetof(CPUX86State, xmm_regs[rm]),
+                                offsetof(CPUX86State,xmm_regs[s->vex_v]), simd_type);
+                }
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)),
                             offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
             }
@@ -4534,9 +4615,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             sse_fn_eppt(cpu_env, s->ptr0, s->ptr1, s->A0);
             break;
         default:
+            TCGv_ptr ptr2;
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
+            tcg_gen_addi_ptr(ptr2, cpu_env, offsetof(CPUX86State,xmm_regs[s->vex_v]));
+            sse_fn_epp(cpu_env, s->ptr0, s->ptr1, ptr2, simd_type);
             break;
         }
         if (b == 0x2e || b == 0x2f) {
-- 
2.34.1


