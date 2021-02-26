Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF99325C22
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:49:25 +0100 (CET)
Received: from localhost ([::1]:35686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFU84-0004NK-PJ
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTiz-0001Md-16
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:23:29 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTip-00027i-BT
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:23:28 -0500
Received: by mail-pf1-x432.google.com with SMTP id j12so5299294pfj.12
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5HpLdnkVTyG3J12vkzaoSQShFiVf7Hlo5ZNk9P1QNg0=;
 b=NrfQHsG7da3aQ3fDPBcRW71Q/w/SNCPZ4UvAOTDQ0ZT4FmybRA8h7fjYib23zaGNR/
 /jrbNT/IVZQRFx7eioK2b0CMXTqocL0QGqR9NVCQJQdcSNsLBw2Yjl9NZNW1lmZ6RaDU
 Z1EBs0NPPEuojj6+ca9VvMkmO3XgJfr0xlUtXcrqzT+pdWqq83RrpNjmj5k0icidg70D
 0Nt7Z+5q50qjPr4MZlIW8sfemUkbSxkBy1PNp5wWGAtVqCfu8BQfgV8TAlogj8hwFuBf
 iK6Q3IjfDUEzWOy6s/Edx2ymkvyVQPQAFx7+DCAMA2bbCP+KPqAgfHVkMWeElVNoXEvu
 mvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5HpLdnkVTyG3J12vkzaoSQShFiVf7Hlo5ZNk9P1QNg0=;
 b=pjsNLl0bwjA7awivLo/iQFIRqc6MTeXth0OQJ6XVm9D0FK9RPMSl4kQesGfGs4Qoq5
 1SOR+3aZW65/mVQoh3WJTPq99mj2HqRhfiOAR+HigUvQdc9QlnOUyY7Y7LMK2ze4/OS/
 t0zg8CLGcyBFQ/TFtqa0Jt6YiT+gvZfLKI2nPYrHO5vyGQBmboVKQ9hEAOo1TyqYK9QD
 KsAdugVAci9UMnDF9HRz4SajHOQO17YAeME9LN21Jf/DuUuiAnhRQL3txyssuH9nSPEs
 BBBZ1v5PpurejkYzVQFJXabVCnF0ixVVc2MWUFB/EHUnfqdTauQVgT0mTEZnPimhqJ9t
 s3Eg==
X-Gm-Message-State: AOAM533QlJrMI5NvU76L+FUJkLo0xNlVI2ik0/5p3auYaaa57pXbSDp1
 Sd1bi+JdelrmH66SSKd0p1/+I9AI1VE28A==
X-Google-Smtp-Source: ABdhPJwWjiXVAwNqt5JoSjwBJ0aaEOLfbm6f/zHK9TOxvC0h6IEW98meBAwIfKeM5ypmBAWLQk8fyA==
X-Received: by 2002:a63:484b:: with SMTP id x11mr1058532pgk.2.1614309797891;
 Thu, 25 Feb 2021 19:23:17 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:23:17 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 43/75] target/riscv: rvv-1.0: narrowing integer right shift
 instructions
Date: Fri, 26 Feb 2021 11:18:27 +0800
Message-Id: <20210226031902.23656-44-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 24 ++++++++++----------
 target/riscv/insn32.decode              | 12 +++++-----
 target/riscv/insn_trans/trans_rvv.c.inc | 30 ++++++++++++-------------
 target/riscv/vector_helper.c            | 24 ++++++++++----------
 4 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 421bc423c98..f5f34c2dcdb 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -392,18 +392,18 @@ DEF_HELPER_6(vsra_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsra_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsra_vx_d, void, ptr, ptr, tl, ptr, env, i32)
 
-DEF_HELPER_6(vnsrl_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsrl_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsrl_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsra_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsra_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsra_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsrl_vx_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnsrl_vx_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnsrl_vx_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnsra_vx_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnsra_vx_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnsra_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsra_wv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsra_wv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsra_wv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsra_wx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsra_wx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsra_wx_w, void, ptr, ptr, tl, ptr, env, i32)
 
 DEF_HELPER_6(vmseq_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmseq_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2806334a31c..022530697ec 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -381,12 +381,12 @@ vsrl_vi         101000 . ..... ..... 011 ..... 1010111 @r_vm
 vsra_vv         101001 . ..... ..... 000 ..... 1010111 @r_vm
 vsra_vx         101001 . ..... ..... 100 ..... 1010111 @r_vm
 vsra_vi         101001 . ..... ..... 011 ..... 1010111 @r_vm
-vnsrl_vv        101100 . ..... ..... 000 ..... 1010111 @r_vm
-vnsrl_vx        101100 . ..... ..... 100 ..... 1010111 @r_vm
-vnsrl_vi        101100 . ..... ..... 011 ..... 1010111 @r_vm
-vnsra_vv        101101 . ..... ..... 000 ..... 1010111 @r_vm
-vnsra_vx        101101 . ..... ..... 100 ..... 1010111 @r_vm
-vnsra_vi        101101 . ..... ..... 011 ..... 1010111 @r_vm
+vnsrl_wv        101100 . ..... ..... 000 ..... 1010111 @r_vm
+vnsrl_wx        101100 . ..... ..... 100 ..... 1010111 @r_vm
+vnsrl_wi        101100 . ..... ..... 011 ..... 1010111 @r_vm
+vnsra_wv        101101 . ..... ..... 000 ..... 1010111 @r_vm
+vnsra_wx        101101 . ..... ..... 100 ..... 1010111 @r_vm
+vnsra_wi        101101 . ..... ..... 011 ..... 1010111 @r_vm
 vmseq_vv        011000 . ..... ..... 000 ..... 1010111 @r_vm
 vmseq_vx        011000 . ..... ..... 100 ..... 1010111 @r_vm
 vmseq_vi        011000 . ..... ..... 011 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 7711f86230c..113a20af4d7 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1920,7 +1920,7 @@ GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_TRUNC_SEW, vsrl_vx, shri)
 GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_TRUNC_SEW, vsra_vx, sari)
 
 /* Vector Narrowing Integer Right Shift Instructions */
-static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
+static bool opiwv_narrow_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
@@ -1928,10 +1928,10 @@ static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
 }
 
 /* OPIVV with NARROW */
-#define GEN_OPIVV_NARROW_TRANS(NAME)                               \
+#define GEN_OPIWV_NARROW_TRANS(NAME)                               \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
 {                                                                  \
-    if (opivv_narrow_check(s, a)) {                                \
+    if (opiwv_narrow_check(s, a)) {                                \
         uint32_t data = 0;                                         \
         static gen_helper_gvec_4_ptr * const fns[3] = {            \
             gen_helper_##NAME##_b,                                 \
@@ -1953,10 +1953,10 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
     }                                                              \
     return false;                                                  \
 }
-GEN_OPIVV_NARROW_TRANS(vnsra_vv)
-GEN_OPIVV_NARROW_TRANS(vnsrl_vv)
+GEN_OPIWV_NARROW_TRANS(vnsra_wv)
+GEN_OPIWV_NARROW_TRANS(vnsrl_wv)
 
-static bool opivx_narrow_check(DisasContext *s, arg_rmrr *a)
+static bool opiwx_narrow_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
@@ -1964,10 +1964,10 @@ static bool opivx_narrow_check(DisasContext *s, arg_rmrr *a)
 }
 
 /* OPIVX with NARROW */
-#define GEN_OPIVX_NARROW_TRANS(NAME)                                     \
+#define GEN_OPIWX_NARROW_TRANS(NAME)                                     \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
 {                                                                        \
-    if (opivx_narrow_check(s, a)) {                                      \
+    if (opiwx_narrow_check(s, a)) {                                      \
         static gen_helper_opivx * const fns[3] = {                       \
             gen_helper_##NAME##_b,                                       \
             gen_helper_##NAME##_h,                                       \
@@ -1978,14 +1978,14 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
     return false;                                                        \
 }
 
-GEN_OPIVX_NARROW_TRANS(vnsra_vx)
-GEN_OPIVX_NARROW_TRANS(vnsrl_vx)
+GEN_OPIWX_NARROW_TRANS(vnsra_wx)
+GEN_OPIWX_NARROW_TRANS(vnsrl_wx)
 
-/* OPIVI with NARROW */
-#define GEN_OPIVI_NARROW_TRANS(NAME, IMM_MODE, OPIVX)                    \
+/* OPIWI with NARROW */
+#define GEN_OPIWI_NARROW_TRANS(NAME, IMM_MODE, OPIVX)                    \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
 {                                                                        \
-    if (opivx_narrow_check(s, a)) {                                      \
+    if (opiwx_narrow_check(s, a)) {                                      \
         static gen_helper_opivx * const fns[3] = {                       \
             gen_helper_##OPIVX##_b,                                      \
             gen_helper_##OPIVX##_h,                                      \
@@ -1997,8 +1997,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
     return false;                                                        \
 }
 
-GEN_OPIVI_NARROW_TRANS(vnsra_vi, IMM_ZX, vnsra_vx)
-GEN_OPIVI_NARROW_TRANS(vnsrl_vi, IMM_ZX, vnsrl_vx)
+GEN_OPIWI_NARROW_TRANS(vnsra_wi, IMM_ZX, vnsra_wx)
+GEN_OPIWI_NARROW_TRANS(vnsrl_wi, IMM_ZX, vnsrl_wx)
 
 /* Vector Integer Comparison Instructions */
 /*
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8e122ba41d0..e14626b40bb 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1373,18 +1373,18 @@ GEN_VEXT_SHIFT_VX(vsra_vx_w, int32_t, int32_t, H4, H4, DO_SRL, 0x1f)
 GEN_VEXT_SHIFT_VX(vsra_vx_d, int64_t, int64_t, H8, H8, DO_SRL, 0x3f)
 
 /* Vector Narrowing Integer Right Shift Instructions */
-GEN_VEXT_SHIFT_VV(vnsrl_vv_b, uint8_t,  uint16_t, H1, H2, DO_SRL, 0xf)
-GEN_VEXT_SHIFT_VV(vnsrl_vv_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f)
-GEN_VEXT_SHIFT_VV(vnsrl_vv_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f)
-GEN_VEXT_SHIFT_VV(vnsra_vv_b, uint8_t,  int16_t, H1, H2, DO_SRL, 0xf)
-GEN_VEXT_SHIFT_VV(vnsra_vv_h, uint16_t, int32_t, H2, H4, DO_SRL, 0x1f)
-GEN_VEXT_SHIFT_VV(vnsra_vv_w, uint32_t, int64_t, H4, H8, DO_SRL, 0x3f)
-GEN_VEXT_SHIFT_VX(vnsrl_vx_b, uint8_t, uint16_t, H1, H2, DO_SRL, 0xf)
-GEN_VEXT_SHIFT_VX(vnsrl_vx_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f)
-GEN_VEXT_SHIFT_VX(vnsrl_vx_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f)
-GEN_VEXT_SHIFT_VX(vnsra_vx_b, int8_t, int16_t, H1, H2, DO_SRL, 0xf)
-GEN_VEXT_SHIFT_VX(vnsra_vx_h, int16_t, int32_t, H2, H4, DO_SRL, 0x1f)
-GEN_VEXT_SHIFT_VX(vnsra_vx_w, int32_t, int64_t, H4, H8, DO_SRL, 0x3f)
+GEN_VEXT_SHIFT_VV(vnsrl_wv_b, uint8_t,  uint16_t, H1, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VV(vnsrl_wv_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VV(vnsrl_wv_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f)
+GEN_VEXT_SHIFT_VV(vnsra_wv_b, uint8_t,  int16_t, H1, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VV(vnsra_wv_h, uint16_t, int32_t, H2, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VV(vnsra_wv_w, uint32_t, int64_t, H4, H8, DO_SRL, 0x3f)
+GEN_VEXT_SHIFT_VX(vnsrl_wx_b, uint8_t, uint16_t, H1, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VX(vnsrl_wx_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VX(vnsrl_wx_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f)
+GEN_VEXT_SHIFT_VX(vnsra_wx_b, int8_t, int16_t, H1, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VX(vnsra_wx_h, int16_t, int32_t, H2, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VX(vnsra_wx_w, int32_t, int64_t, H4, H8, DO_SRL, 0x3f)
 
 /* Vector Integer Comparison Instructions */
 #define DO_MSEQ(N, M) (N == M)
-- 
2.17.1


