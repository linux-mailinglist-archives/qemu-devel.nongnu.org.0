Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C70D5F5FE5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:05:23 +0200 (CEST)
Received: from localhost ([::1]:43900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogI8Q-0004UL-BO
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHiw-00038q-Oi
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:39:07 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHiq-0002vN-NI
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:39:02 -0400
Received: by mail-pf1-x42e.google.com with SMTP id i3so889906pfk.9
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=hxkewtWvPGUBefmuaGVs8yKIdDHYoI2r+L5xurseZpc=;
 b=GkuRXKXKrpK87JmzqXZm24r1N1RxiHCTAfdfYC0JpXdKUuFLEdXNtrHnxy3cPj7VvA
 8lh/D11UtZZ566JE8/Tj+DqtSwDne3+WRgAWx8PdFEnyF+30owYLGY0cqabAq3sD5o0O
 Eud7fNmMtQ7AM+NU3PBeE+JuO2cm6dqkYdeGqI8CQ5j9ZGuY5xshLbf6mkdVpCS+p7kl
 NNrAgMalFCXwc7gVOuMvuFfgulxg/oMqjzK8a4ghvvousCf627McRqxJtKyL0DNdg1B3
 gpnsaUZDnYceKM1V5zOWH1ZeyTRTYdEXI9hOW6d1AvUo4NaktVHrXqUXpUPJtXuZwtAO
 faHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hxkewtWvPGUBefmuaGVs8yKIdDHYoI2r+L5xurseZpc=;
 b=MRV/BAZyfCysVu2818B551tkwcP4IlWwqk65kdFWbPSpfQtJBIx/AR8GUPfnn2yaTS
 IwGcr2FHQhYB+vxs6D57FG4eLp8gCRJlMQutPM1mi9VcHJC28Ta+l/59eUeRW5Zcidby
 iTL9sw2eEWAoFyyzkLtQqd6P08Ps3wURMY9juJNY+2GydUzKd6dXlpJMxrvww9T553Ak
 3ywIMP9fJ2v+/5ZG+Rna44oFtDtJAX+CbH6zKGiZV57e3B+7DJaWzt2wy3P2YFMovo0r
 Cf+O+QrFJfCH8I1Oe0bbVZ3St4brRaaGBommMQZVUiKF7dUumy85MtjE0dS5MFrPFvZ0
 EWSA==
X-Gm-Message-State: ACrzQf3d1rUqf/npiOyl6TPaPXIp9uCmcD0Sn0eipt5aiJBCvTVg9Ojw
 Bscs8EHqWlWDXkBdZfzC6D0SLqAwq9ujsw==
X-Google-Smtp-Source: AMsMyM4NhLlRr0x5lF8SfE7193w+dDfFxYGBkE5R+6/eEQ3KkCs24nRe4C2kYuJlxpAGkbarL66hiw==
X-Received: by 2002:a63:3104:0:b0:459:a367:95ad with SMTP id
 x4-20020a633104000000b00459a36795admr2766397pgx.112.1665027535231; 
 Wed, 05 Oct 2022 20:38:55 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a63534b000000b0043014f9a4c9sm539831pgl.93.2022.10.05.20.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:38:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 8/9] target/arm: Introduce gen_pc_plus_diff for aarch32
Date: Wed,  5 Oct 2022 20:38:45 -0700
Message-Id: <20221006033846.1178422-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006033846.1178422-1-richard.henderson@linaro.org>
References: <20221006033846.1178422-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 target/arm/translate.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 336f151c4a..7c1e277732 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -276,11 +276,16 @@ static target_long jmp_diff(DisasContext *s, target_long diff)
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
@@ -296,7 +301,8 @@ TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     if (reg == 15) {
-        tcg_gen_movi_i32(tmp, (read_pc(s) & ~3) + ofs);
+        /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
+        gen_pc_plus_diff(s, tmp, (read_pc(s) & ~3) - s->pc_curr + ofs);
     } else {
         tcg_gen_addi_i32(tmp, cpu_R[reg], ofs);
     }
@@ -1159,7 +1165,7 @@ void unallocated_encoding(DisasContext *s)
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 void gen_lookup_tb(DisasContext *s)
 {
-    tcg_gen_movi_i32(cpu_R[15], s->base.pc_next);
+    gen_pc_plus_diff(s, cpu_R[15], curr_insn_len(s));
     s->base.is_jmp = DISAS_EXIT;
 }
 
@@ -6483,7 +6489,7 @@ static bool trans_BLX_r(DisasContext *s, arg_BLX_r *a)
         return false;
     }
     tmp = load_reg(s, a->rm);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_bx(s, tmp);
     return true;
 }
@@ -8351,7 +8357,7 @@ static bool trans_B_cond_thumb(DisasContext *s, arg_ci *a)
 
 static bool trans_BL(DisasContext *s, arg_i *a)
 {
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
@@ -8370,7 +8376,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     if (s->thumb && (a->imm & 2)) {
         return false;
     }
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     store_cpu_field_constant(!s->thumb, thumb);
     /* This jump is computed from an aligned PC: subtract off the low bits. */
     gen_jmp(s, jmp_diff(s, a->imm - (s->pc_curr & 3)));
@@ -8380,7 +8386,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
 static bool trans_BL_BLX_prefix(DisasContext *s, arg_BL_BLX_prefix *a)
 {
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
-    tcg_gen_movi_i32(cpu_R[14], read_pc(s) + (a->imm << 12));
+    gen_pc_plus_diff(s, cpu_R[14], jmp_diff(s, a->imm << 12));
     return true;
 }
 
@@ -8390,7 +8396,7 @@ static bool trans_BL_suffix(DisasContext *s, arg_BL_suffix *a)
 
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
     tcg_gen_addi_i32(tmp, cpu_R[14], (a->imm << 1) | 1);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8406,7 +8412,7 @@ static bool trans_BLX_suffix(DisasContext *s, arg_BLX_suffix *a)
     tmp = tcg_temp_new_i32();
     tcg_gen_addi_i32(tmp, cpu_R[14], a->imm << 1);
     tcg_gen_andi_i32(tmp, tmp, 0xfffffffc);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8729,10 +8735,11 @@ static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
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


