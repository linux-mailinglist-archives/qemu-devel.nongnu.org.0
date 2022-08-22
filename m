Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167E659CC7C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:49:54 +0200 (CEST)
Received: from localhost ([::1]:50632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHB3-00033P-6k
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGm2-0005lw-FL
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:24:03 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:40890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlz-0005gG-TJ
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:24:01 -0400
Received: by mail-pf1-x431.google.com with SMTP id y141so11814703pfb.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=cxOV+kgTy/28wcHyCPRFLTS2yytwO8pyxXme1WE5d5k=;
 b=xyuGQrphGoWJ2mf4HeQPWMqmpYPnv0Ofh14oSEioviCgYs3E16rNmRXT3VJ1o8l5Bg
 ktlrpeYm1r61OpuiS0WBs5xW9X8vxKBSL/3SPiaU85/D/uox6MasejoMnVWIArNveOQQ
 IRrzPtOBAz/Drbh48np6NFz+bPm4pTIEXnwkN89NgHZ4qx1eF90cfNK0C93xGI9K2GJ/
 DZ4kVHpTdDJE+oSaYjb6LO4a5RLHi2Rt6kNufii16TfPj52Z9/cwh1ABc1zSYuw2HKXh
 LS1mo7vDqcCh7A7pSagoY6HQWRni4NAOYJLHsTrIK1GFfqk2S/P075fYm9+vQPLthc4P
 L0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cxOV+kgTy/28wcHyCPRFLTS2yytwO8pyxXme1WE5d5k=;
 b=T6CdCILexQ3JSbTHWE2DegpvyN/qKm3tURTXxM9Le4kdTSV98vwqAryF8+bvT2QnXu
 FnBB3v3NyRisrHNVDoGW1lEv3Hr8ufu8ZKi+JJ80rU7UFSaaXQc1pk2/UjkYx2fpesIU
 zfP7dkE3tYt21B9D/6QSXz/L871pH+lHmq796CaRbX6OU2vmZzP/ti6UdPiGPI8KrhTN
 Bts0pwl8C7Le/C0Np5fcLXoIM4U5ms1oLobkO4McAL0advd3kPxc+fNyK/ntMbUhh+SI
 sF1+40bGwWFAp5sM5+LCw2fSR909o7iF45c+iwi4DbW21B3NeOpS61Cd0suR+72nuRgo
 4gjA==
X-Gm-Message-State: ACgBeo2PABxC841DPSHY46gq/YgHBnthnBwdzVTS9rU7T9TMyp2S3adH
 kcxiuWXe8421IfRMEmnTH4hvoUD2e+0Jvg==
X-Google-Smtp-Source: AA6agR5sqYrK1rcDYJh+aDVJac4LsDhM7jppfhtFva+CRnyUyaWD7madA8wzufavPpRevZTPI2aosA==
X-Received: by 2002:a63:224d:0:b0:42a:81ff:68ca with SMTP id
 t13-20020a63224d000000b0042a81ff68camr9562821pgm.290.1661210638587; 
 Mon, 22 Aug 2022 16:23:58 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79731000000b0052d3899f8c2sm3809112pfg.4.2022.08.22.16.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:23:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 16/17] target/arm: Introduce gen_pc_plus_diff for aarch32
Date: Mon, 22 Aug 2022 16:23:37 -0700
Message-Id: <20220822232338.1727934-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822232338.1727934-1-richard.henderson@linaro.org>
References: <20220822232338.1727934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4d13e365e2..f01c8df60a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -276,11 +276,16 @@ static int jmp_diff(DisasContext *s, int diff)
     return diff + (s->thumb ? 4 : 8);
 }
 
+static void gen_pc_plus_diff(DisasContext *s, TCGv_i32 var, int diff)
+{
+    tcg_gen_movi_i32(var, s->pc_curr + diff);
+}
+
 /* Set a variable to the value of a CPU register.  */
 void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
 {
     if (reg == 15) {
-        tcg_gen_movi_i32(var, read_pc(s));
+        gen_pc_plus_diff(s, var, jmp_diff(s, 0));
     } else {
         tcg_gen_mov_i32(var, cpu_R[reg]);
     }
@@ -296,7 +301,8 @@ TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     if (reg == 15) {
-        tcg_gen_movi_i32(tmp, (read_pc(s) & ~3) + ofs);
+        /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
+        gen_pc_plus_diff(s, tmp, (read_pc(s) & ~3) - s->pc_curr + ofs);
     } else {
         tcg_gen_addi_i32(tmp, cpu_R[reg], ofs);
     }
@@ -1158,7 +1164,7 @@ void unallocated_encoding(DisasContext *s)
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 void gen_lookup_tb(DisasContext *s)
 {
-    tcg_gen_movi_i32(cpu_R[15], s->base.pc_next);
+    gen_pc_plus_diff(s, cpu_R[15], curr_insn_len(s));
     s->base.is_jmp = DISAS_EXIT;
 }
 
@@ -6485,7 +6491,7 @@ static bool trans_BLX_r(DisasContext *s, arg_BLX_r *a)
         return false;
     }
     tmp = load_reg(s, a->rm);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_bx(s, tmp);
     return true;
 }
@@ -8356,7 +8362,7 @@ static bool trans_B_cond_thumb(DisasContext *s, arg_ci *a)
 
 static bool trans_BL(DisasContext *s, arg_i *a)
 {
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
@@ -8375,7 +8381,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     if (s->thumb && (a->imm & 2)) {
         return false;
     }
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     store_cpu_field_constant(!s->thumb, thumb);
     /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
     gen_jmp(s, (read_pc(s) & ~3) - s->pc_curr + a->imm);
@@ -8385,7 +8391,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
 static bool trans_BL_BLX_prefix(DisasContext *s, arg_BL_BLX_prefix *a)
 {
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
-    tcg_gen_movi_i32(cpu_R[14], read_pc(s) + (a->imm << 12));
+    gen_pc_plus_diff(s, cpu_R[14], jmp_diff(s, a->imm << 12));
     return true;
 }
 
@@ -8395,7 +8401,7 @@ static bool trans_BL_suffix(DisasContext *s, arg_BL_suffix *a)
 
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
     tcg_gen_addi_i32(tmp, cpu_R[14], (a->imm << 1) | 1);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8411,7 +8417,7 @@ static bool trans_BLX_suffix(DisasContext *s, arg_BLX_suffix *a)
     tmp = tcg_temp_new_i32();
     tcg_gen_addi_i32(tmp, cpu_R[14], a->imm << 1);
     tcg_gen_andi_i32(tmp, tmp, 0xfffffffc);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8734,10 +8740,11 @@ static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
     tcg_gen_add_i32(addr, addr, tmp);
 
     gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), half ? MO_UW : MO_UB);
-    tcg_temp_free_i32(addr);
 
     tcg_gen_add_i32(tmp, tmp, tmp);
-    tcg_gen_addi_i32(tmp, tmp, read_pc(s));
+    gen_pc_plus_diff(s, addr, jmp_diff(s, 0));
+    tcg_gen_add_i32(tmp, tmp, addr);
+    tcg_temp_free_i32(addr);
     store_reg(s, 15, tmp);
     return true;
 }
-- 
2.34.1


