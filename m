Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB9E6003E6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 00:23:06 +0200 (CEST)
Received: from localhost ([::1]:38688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okC2D-0004U2-Tx
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 18:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBqF-0003Fl-3k
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 18:10:43 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:38401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBqC-0007tv-4r
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 18:10:41 -0400
Received: by mail-pg1-x534.google.com with SMTP id 129so8925598pgc.5
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 15:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eirybTGa1WIietzoG766hMinqRXYJPoKdxjJFXnDkP8=;
 b=NFDF4Ej0AEKt0VgZz4sOVQJtMb41bXxGM2LSfjSP5HC7sNjYsB/6KRHg9N5h5a6k5u
 rNGZdKu1V9bv3r/+rNw48UoHqS0r8mcd8CQQJ4yNRjipfUbipsJaFtE4c9bGxMdmdIgl
 9mBowzO/fhl09wzVJ3+almIgzYJqAMzzrIvnfp5QelIwDjp81jJbjcAd7s67bi9h9wVo
 s5eQ7usJBH0/eKMwzX01jLki1gTcFQkPkcF88DUnYYEdVuxZ7bEx0xZIT96XQ7oHvr4q
 9aZBZxowpSSfsLBX8nCMqFSFfT5yUftt+A+CBoJVXK/AfAk37OR1km+mEWey1lz6IsPL
 cbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eirybTGa1WIietzoG766hMinqRXYJPoKdxjJFXnDkP8=;
 b=kTKARUWH24OEzbG9UOkGR0gpnO7YZXSznyqdzGMBKNT7/aQlz9zY0dy/+JLgy2g06U
 vxwS+8atr+85ANioGsvit3m+ExyDe5Eiin0aieMCzzgaAdc1+UGejcUGpJRmcRWEn1Ny
 CzQ7H7fUcczfiDh9AtHs5zu3B8PVibUsLvYE4dvpKQ+1Y7h4KSZRpY7502p7zIaxv6Bw
 Yu76rMl6InhvQNpy3MJIVQlPZYoeCEg3PN6WZ3lMkRLXcsJ/nIHM2HAyKP5CJATxmEt+
 KdRthg3xnfwR/SJZ5mLODMkODtU7YFOfFJzw7DYzBrNE68//dkK2WlJ8tzJuMqBnNVK8
 gaaw==
X-Gm-Message-State: ACrzQf0IqH1kPRPFNh98a1q6HQV28n+6TaSzFeorOlAM4zrXkYILauFw
 8chtOrkj2rosD1O6L53WVhI2AIDkELB3OlDd
X-Google-Smtp-Source: AMsMyM6Q9Y4WoxAdku5TOJZZ5VJMshzZrtRfP4oNrBuvbcKojbeOo16mntUP6ihPtQ5I8Dpk6lQfiA==
X-Received: by 2002:a62:8249:0:b0:565:c121:dedd with SMTP id
 w70-20020a628249000000b00565c121deddmr9253798pfd.40.1665958238663; 
 Sun, 16 Oct 2022 15:10:38 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 z18-20020aa79592000000b0053e2b61b714sm5454751pfj.114.2022.10.16.15.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 15:10:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 8/9] target/arm: Introduce gen_pc_plus_diff for aarch32
Date: Mon, 17 Oct 2022 08:09:31 +1000
Message-Id: <20221016220932.274260-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016220932.274260-1-richard.henderson@linaro.org>
References: <20221016220932.274260-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ca128edab7..5f6bd9b5b7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -260,23 +260,22 @@ static inline int get_a32_user_mem_index(DisasContext *s)
     }
 }
 
-/* The architectural value of PC.  */
-static uint32_t read_pc(DisasContext *s)
-{
-    return s->pc_curr + (s->thumb ? 4 : 8);
-}
-
 /* The pc_curr difference for an architectural jump. */
 static target_long jmp_diff(DisasContext *s, target_long diff)
 {
     return diff + (s->thumb ? 4 : 8);
 }
 
+static void gen_pc_plus_diff(DisasContext *s, TCGv_i32 var, target_long diff)
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
@@ -292,7 +291,11 @@ TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     if (reg == 15) {
-        tcg_gen_movi_i32(tmp, (read_pc(s) & ~3) + ofs);
+        /*
+         * This address is computed from an aligned PC:
+         * subtract off the low bits.
+         */
+        gen_pc_plus_diff(s, tmp, jmp_diff(s, ofs - (s->pc_curr & 3)));
     } else {
         tcg_gen_addi_i32(tmp, cpu_R[reg], ofs);
     }
@@ -1155,7 +1158,7 @@ void unallocated_encoding(DisasContext *s)
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 void gen_lookup_tb(DisasContext *s)
 {
-    tcg_gen_movi_i32(cpu_R[15], s->base.pc_next);
+    gen_pc_plus_diff(s, cpu_R[15], curr_insn_len(s));
     s->base.is_jmp = DISAS_EXIT;
 }
 
@@ -6479,7 +6482,7 @@ static bool trans_BLX_r(DisasContext *s, arg_BLX_r *a)
         return false;
     }
     tmp = load_reg(s, a->rm);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_bx(s, tmp);
     return true;
 }
@@ -8347,7 +8350,7 @@ static bool trans_B_cond_thumb(DisasContext *s, arg_ci *a)
 
 static bool trans_BL(DisasContext *s, arg_i *a)
 {
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
@@ -8366,7 +8369,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     if (s->thumb && (a->imm & 2)) {
         return false;
     }
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     store_cpu_field_constant(!s->thumb, thumb);
     /* This jump is computed from an aligned PC: subtract off the low bits. */
     gen_jmp(s, jmp_diff(s, a->imm - (s->pc_curr & 3)));
@@ -8376,7 +8379,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
 static bool trans_BL_BLX_prefix(DisasContext *s, arg_BL_BLX_prefix *a)
 {
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
-    tcg_gen_movi_i32(cpu_R[14], read_pc(s) + (a->imm << 12));
+    gen_pc_plus_diff(s, cpu_R[14], jmp_diff(s, a->imm << 12));
     return true;
 }
 
@@ -8386,7 +8389,7 @@ static bool trans_BL_suffix(DisasContext *s, arg_BL_suffix *a)
 
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
     tcg_gen_addi_i32(tmp, cpu_R[14], (a->imm << 1) | 1);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8402,7 +8405,7 @@ static bool trans_BLX_suffix(DisasContext *s, arg_BLX_suffix *a)
     tmp = tcg_temp_new_i32();
     tcg_gen_addi_i32(tmp, cpu_R[14], a->imm << 1);
     tcg_gen_andi_i32(tmp, tmp, 0xfffffffc);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8725,10 +8728,11 @@ static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
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


