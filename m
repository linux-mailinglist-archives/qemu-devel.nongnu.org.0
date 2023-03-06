Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2C96AB406
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:52:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyye-0004zy-DY; Sun, 05 Mar 2023 19:45:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxo-0003AF-6U
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:28 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxk-0007Mu-C1
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:27 -0500
Received: by mail-pf1-x444.google.com with SMTP id z11so4724340pfh.4
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5VDjWfuGr8f2QZ5BkkXZ1D9Q/TMMHg2AI7FYA6WCBxU=;
 b=jQGP5OIVtI0qmM0rsr29ErVCW53AgTkMO4NCeCpm+0F/PkweLcEPvmm2SGQA+E/n7N
 84zDXNXvfFvMQoKuhrUQKjPNvrJlfZ3L865RYqoxc2VCdZP0skRZlzfKAb/n0q+cli3S
 cHbcSdjeLR2uGbD2JT4YQxQTAzum+yNN7xOLXMkFXp8iMYOpeDIBpwdFdRCbS05ZF1ZA
 RDvSwmetou3UlH+fJ432WVusF3t9Z8DxV21fqiykuZdgQAX8o9S+hJ7R8/HVYE40mTZT
 abOpMM3FEcBlSkhQY1zngGd8ddgGz6MUkSOqD41miRJCzN2y9dnpizBJU/0EyOp6stql
 ZqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5VDjWfuGr8f2QZ5BkkXZ1D9Q/TMMHg2AI7FYA6WCBxU=;
 b=qGFEkItIoeJnLg2grl+SFsxPsfuwfLvpPbz7kDDHXEsoclGbGtEnlBYLhqfshUJdja
 NHJNPw7iQJ34Hibq5UchO/XRnhjbHIc/4Qlj44zbSgRO5tHyEjAOV1LNRKCIw3x1agVO
 RK6uZXnlP26Hps/nOAUkH5DGUkr5NFtZGa0PCLBRHFUgNijuWlLr5FpqSr3qLixrdiIg
 DLVoxRW6FVp36y1/tNkHB32m/zURl/lhBm8cdeWMfqwohXz9pfC7vk21pLJmmQrdENPN
 Vd5VoHUkXmoU79024+u0wjnl/VQAbwjm7tkrDtTI/z/7IB9PaIM/N/eSTxIDWBbNNFm1
 tBQw==
X-Gm-Message-State: AO0yUKWVoxyUHV0V2d9pv/w7MfOMmZEjXiH76l6DZU6O4Obblg7vAhKK
 5IUCHfAzXiRLXDNnpVP+lxKxTzzbV3bOouJaW7O1dhB1
X-Google-Smtp-Source: AK7set8nNhN/cvskE3bqG1GijbXe2ivzmVl2c770QvfsvX8VMb5CrwofNP7XRUPgRJN+yM0p1K5uNg==
X-Received: by 2002:aa7:9418:0:b0:5cd:d766:8a26 with SMTP id
 x24-20020aa79418000000b005cdd7668a26mr8541376pfo.8.1678063462766; 
 Sun, 05 Mar 2023 16:44:22 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:44:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 75/84] target/microblaze: Avoid tcg_const_* throughout
Date: Sun,  5 Mar 2023 16:39:45 -0800
Message-Id: <20230306003954.1866998-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

All uses are strictly read-only.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index eb6bdb49e1..ee0d7b81ad 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -101,9 +101,7 @@ static void t_sync_flags(DisasContext *dc)
 
 static void gen_raise_exception(DisasContext *dc, uint32_t index)
 {
-    TCGv_i32 tmp = tcg_const_i32(index);
-
-    gen_helper_raise_exception(cpu_env, tmp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(index));
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -116,7 +114,7 @@ static void gen_raise_exception_sync(DisasContext *dc, uint32_t index)
 
 static void gen_raise_hw_excp(DisasContext *dc, uint32_t esr_ec)
 {
-    TCGv_i32 tmp = tcg_const_i32(esr_ec);
+    TCGv_i32 tmp = tcg_constant_i32(esr_ec);
     tcg_gen_st_i32(tmp, cpu_env, offsetof(CPUMBState, esr));
 
     gen_raise_exception_sync(dc, EXCP_HW_EXCP);
@@ -260,7 +258,7 @@ static bool do_typeb_val(DisasContext *dc, arg_typeb *arg, bool side_effects,
 
     rd = reg_for_write(dc, arg->rd);
     ra = reg_for_read(dc, arg->ra);
-    imm = tcg_const_i32(arg->imm);
+    imm = tcg_constant_i32(arg->imm);
 
     fn(rd, ra, imm);
     return true;
@@ -305,7 +303,7 @@ static bool do_typeb_val(DisasContext *dc, arg_typeb *arg, bool side_effects,
 /* No input carry, but output carry. */
 static void gen_add(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
 {
-    TCGv_i32 zero = tcg_const_i32(0);
+    TCGv_i32 zero = tcg_constant_i32(0);
 
     tcg_gen_add2_i32(out, cpu_msr_c, ina, zero, inb, zero);
 }
@@ -313,7 +311,7 @@ static void gen_add(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
 /* Input and output carry. */
 static void gen_addc(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
 {
-    TCGv_i32 zero = tcg_const_i32(0);
+    TCGv_i32 zero = tcg_constant_i32(0);
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     tcg_gen_add2_i32(tmp, cpu_msr_c, ina, zero, cpu_msr_c, zero);
@@ -546,7 +544,7 @@ static void gen_rsub(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
 /* Input and output carry. */
 static void gen_rsubc(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
 {
-    TCGv_i32 zero = tcg_const_i32(0);
+    TCGv_i32 zero = tcg_constant_i32(0);
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     tcg_gen_not_i32(tmp, ina);
@@ -1117,8 +1115,8 @@ static bool do_bcc(DisasContext *dc, int dest_rb, int dest_imm,
     }
 
     /* Compute the final destination into btarget.  */
-    zero = tcg_const_i32(0);
-    next = tcg_const_i32(dc->base.pc_next + (delay + 1) * 4);
+    zero = tcg_constant_i32(0);
+    next = tcg_constant_i32(dc->base.pc_next + (delay + 1) * 4);
     tcg_gen_movcond_i32(dc->jmp_cond, cpu_btarget,
                         reg_for_read(dc, ra), zero,
                         cpu_btarget, next);
@@ -1226,8 +1224,6 @@ static bool trans_mbar(DisasContext *dc, arg_mbar *arg)
 
     /* Sleep. */
     if (mbar_imm & 16) {
-        TCGv_i32 tmp_1;
-
         if (trap_userspace(dc, true)) {
             /* Sleep is a privileged instruction.  */
             return true;
@@ -1235,8 +1231,7 @@ static bool trans_mbar(DisasContext *dc, arg_mbar *arg)
 
         t_sync_flags(dc);
 
-        tmp_1 = tcg_const_i32(1);
-        tcg_gen_st_i32(tmp_1, cpu_env,
+        tcg_gen_st_i32(tcg_constant_i32(1), cpu_env,
                        -offsetof(MicroBlazeCPU, env)
                        +offsetof(CPUState, halted));
 
@@ -1401,8 +1396,8 @@ static bool trans_mts(DisasContext *dc, arg_mts *arg)
     case 0x1004: /* TLBHI */
     case 0x1005: /* TLBSX */
         {
-            TCGv_i32 tmp_ext = tcg_const_i32(arg->e);
-            TCGv_i32 tmp_reg = tcg_const_i32(arg->rs & 7);
+            TCGv_i32 tmp_ext = tcg_constant_i32(arg->e);
+            TCGv_i32 tmp_reg = tcg_constant_i32(arg->rs & 7);
 
             gen_helper_mmu_write(cpu_env, tmp_ext, tmp_reg, src);
         }
@@ -1487,8 +1482,8 @@ static bool trans_mfs(DisasContext *dc, arg_mfs *arg)
     case 0x1004: /* TLBHI */
     case 0x1005: /* TLBSX */
         {
-            TCGv_i32 tmp_ext = tcg_const_i32(arg->e);
-            TCGv_i32 tmp_reg = tcg_const_i32(arg->rs & 7);
+            TCGv_i32 tmp_ext = tcg_constant_i32(arg->e);
+            TCGv_i32 tmp_reg = tcg_constant_i32(arg->rs & 7);
 
             gen_helper_mmu_read(dest, cpu_env, tmp_ext, tmp_reg);
         }
@@ -1555,7 +1550,7 @@ static bool do_get(DisasContext *dc, int rd, int rb, int imm, int ctrl)
         tcg_gen_movi_i32(t_id, imm);
     }
 
-    t_ctrl = tcg_const_i32(ctrl);
+    t_ctrl = tcg_constant_i32(ctrl);
     gen_helper_get(reg_for_write(dc, rd), t_id, t_ctrl);
     return true;
 }
@@ -1585,7 +1580,7 @@ static bool do_put(DisasContext *dc, int ra, int rb, int imm, int ctrl)
         tcg_gen_movi_i32(t_id, imm);
     }
 
-    t_ctrl = tcg_const_i32(ctrl);
+    t_ctrl = tcg_constant_i32(ctrl);
     gen_helper_put(t_id, t_ctrl, reg_for_read(dc, ra));
     return true;
 }
-- 
2.34.1


