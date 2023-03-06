Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBFB6AB3E8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:47:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyxP-0001Nk-RK; Sun, 05 Mar 2023 19:44:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyx4-0000Z5-MR
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:43 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyx1-0007FS-Hr
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:41 -0500
Received: by mail-pg1-x544.google.com with SMTP id q189so4535250pga.9
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kOmzLL5fVyyZPRh+wB5sAMBb0tM1efABIB4qnFeCzY8=;
 b=bwrb146I/RRbA7QXxG0bych2aDwuHUMK7dd0k8fvwkTP0sZCM3rtQ3YItXDSOdz9tB
 JNjan6Qi4ThJcTuUo4prVlUE3Q9ef7hLvR+kyFbH3/w/7pSZJxcWQA5LBSWIAB09HO1d
 Ol0WTJMxZZziRRsOdMjtsddgla/HzRFKULR7XfftvmmJcXA0T69HTAnzrr3rU460yW/+
 mz60foq/Wfz8REKqYzHpasaExrONSEL4tI0g/i5Pdrxgue3n6d4iwn/aMPxznz1/d+D8
 pjL4BrlKwnd9HCcru602amMOxon7B+fCWAzxBMxrULUxiBMVyfuQ0OqO5SBW5Qn0Atqw
 5Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kOmzLL5fVyyZPRh+wB5sAMBb0tM1efABIB4qnFeCzY8=;
 b=X1eUP784Wg9g5m76mLOpFfKQp+Urv1cuSvMxk3cMXstVNYvnOTwkGNZeBlG4UzhuBj
 6YaUE0ggrCjHEFL+rl/ekf6OCSbOgSd/3H51o99M6tKlkof67S7Fehsr2B7DdEhMm8Z5
 cFLqEasKIe7du+BsBVR1v2yYdhe3PdD49uXYAvDplPKVyeTQqkVQ0kCsbxpUMtyERKIl
 cr4GZrEAHwWfOSOlcJCyh9Yyb8HQqh4gVJDfbLDKQJ19q+sb63QvdnlVsV1rNgRzZ7Ef
 Wk204MBY72Hd/imaYd0uwKyreThzVv4OFvMRi8DxWH+hyeEgGt/x2YE5n4e/F+68FboE
 5Z3Q==
X-Gm-Message-State: AO0yUKUPXqk/9Ilf99em5+R9H8LSasBWioTZKN5BVBs449QmMaPMRPhd
 2vWWS19tt8EqNT2IlUiiTa8LaEGjAWsN8a1Gpoea+4XF
X-Google-Smtp-Source: AK7set8XvYsCKVXGwr+1KxaUrL8wz2IPfMzrK96pr2xIMnHUfqLwX0STqe1S8oYPGv9pYSAHLB8anw==
X-Received: by 2002:aa7:941d:0:b0:5ce:ef1b:a86 with SMTP id
 x29-20020aa7941d000000b005ceef1b0a86mr8517718pfo.2.1678063418216; 
 Sun, 05 Mar 2023 16:43:38 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:43:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 47/84] target/nios2: Drop tcg_temp_free
Date: Sun,  5 Mar 2023 16:39:17 -0800
Message-Id: <20230306003954.1866998-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
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

Translators are no longer required to free tcg temporaries.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 140bc31017..6610e22236 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -233,7 +233,6 @@ static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
 
     tcg_gen_andi_tl(test, dest, 3);
     tcg_gen_brcondi_tl(TCG_COND_NE, test, 0, l);
-    tcg_temp_free(test);
 
     tcg_gen_mov_tl(cpu_pc, dest);
     if (is_call) {
@@ -300,7 +299,6 @@ static void gen_ldx(DisasContext *dc, uint32_t code, uint32_t flags)
 
     tcg_gen_addi_tl(addr, load_gpr(dc, instr.a), instr.imm16.s);
     tcg_gen_qemu_ld_tl(data, addr, dc->mem_idx, flags);
-    tcg_temp_free(addr);
 }
 
 /* Store instructions */
@@ -312,7 +310,6 @@ static void gen_stx(DisasContext *dc, uint32_t code, uint32_t flags)
     TCGv addr = tcg_temp_new();
     tcg_gen_addi_tl(addr, load_gpr(dc, instr.a), instr.imm16.s);
     tcg_gen_qemu_st_tl(val, addr, dc->mem_idx, flags);
-    tcg_temp_free(addr);
 }
 
 /* Branch instructions */
@@ -500,7 +497,6 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
         TCGv tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_ESTATUS]));
         gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_EA));
-        tcg_temp_free(tmp);
     } else {
         gen_helper_eret(cpu_env, load_gpr(dc, R_SSTATUS), load_gpr(dc, R_EA));
     }
@@ -530,7 +526,6 @@ static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
     TCGv tmp = tcg_temp_new();
     tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_BSTATUS]));
     gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_BA));
-    tcg_temp_free(tmp);
 
     dc->base.is_jmp = DISAS_NORETURN;
 #endif
@@ -597,8 +592,6 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
         tcg_gen_ld_tl(t1, cpu_env, offsetof(CPUNios2State, ctrl[CR_IPENDING]));
         tcg_gen_ld_tl(t2, cpu_env, offsetof(CPUNios2State, ctrl[CR_IENABLE]));
         tcg_gen_and_tl(dest, t1, t2);
-        tcg_temp_free(t1);
-        tcg_temp_free(t2);
         break;
     default:
         tcg_gen_ld_tl(dest, cpu_env,
@@ -662,11 +655,9 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
                 tcg_gen_ld_tl(o, cpu_env, ofs);
                 tcg_gen_andi_tl(o, o, ro);
                 tcg_gen_or_tl(n, n, o);
-                tcg_temp_free(o);
             }
 
             tcg_gen_st_tl(n, cpu_env, ofs);
-            tcg_temp_free(n);
         }
         break;
     }
@@ -753,7 +744,6 @@ static void do_rr_mul_high(DisasContext *dc, uint32_t insn, GenFn4 *fn)
 
     fn(discard, dest_gpr(dc, instr.c),
        load_gpr(dc, instr.a), load_gpr(dc, instr.b));
-    tcg_temp_free(discard);
 }
 
 #define gen_rr_mul_high(fname, insn)                                        \
@@ -771,7 +761,6 @@ static void do_rr_shift(DisasContext *dc, uint32_t insn, GenFn3 *fn)
 
     tcg_gen_andi_tl(sh, load_gpr(dc, instr.b), 31);
     fn(dest_gpr(dc, instr.c), load_gpr(dc, instr.a), sh);
-    tcg_temp_free(sh);
 }
 
 #define gen_rr_shift(fname, insn)                                           \
@@ -990,10 +979,6 @@ static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 
     instr = &i_type_instructions[op];
     instr->handler(dc, code, instr->flags);
-
-    if (dc->sink) {
-        tcg_temp_free(dc->sink);
-    }
 }
 
 static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1


