Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6EB3C7554
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:52:38 +0200 (CEST)
Received: from localhost ([::1]:57036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LeA-00048W-0f
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUF-0006vk-51
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:23 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:42678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUA-0005fl-61
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:22 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 i16-20020a17090acf90b02901736d9d2218so2495554pju.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KuDDoLNIk68fDtCCr2zu8W55ZPfrf4mbWdcj3lhD6LA=;
 b=stMahCLEOa24hin7oxfFzA/mdz4zAICUhlB+O/qaIn5SMU4E3rH43tL0XBywFjdDnE
 1732FV4SZPo3s7Dbbz/9q0ttsRRcWEnG65YKS1JwX8KtpXOVZmvD9X1780UbMu313lpV
 x+fmTjOKDvm2Tz5XGkOAmHBRU1mJriTEH+SP0lt5bWDGDONKBFH/sSQ0ibUoE4yIoYwd
 Mj43bOEx0CIVp/10wcVA+lkJsM/RInI7x/BAcE9dLyCwOKSFHj5QCY7HN1a418GJrt9c
 kJiIpS6SAmTKJJaRjwRb+HB8cvZp8uHehZRC+Yrp3pqWYOAWs7unzsJeEJQq4/8GTUXU
 6dUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KuDDoLNIk68fDtCCr2zu8W55ZPfrf4mbWdcj3lhD6LA=;
 b=lqFgjVTGjxz3/ySdZmLeezmN5zTJJAOXadj4tumbwPW1QMhz+A7qug5v2t+S/nblx4
 FR4wAg7SFRoyEtp/iOvXLpKL0DZ9+MayLBAx67Ymfe05d7ug9MCy3x7ATnb7i6W7cMnZ
 bGl+IaFKZURZu0qZKIUh9OEUH7s0KHwINovAFVexdz6P5QnK+BxaB+nKssK/dFF8R/pQ
 xExUnZZi3xDKTTsAx93NBDhdaqF1jRwYyS8mM8KGxT0rh44Lay0YdmEOM/kxyIad2Jou
 uy/tTvZvbq5OGFmoRnMRK1ctEVHVwWdWOxrHYdCxb3GdH1tjJd2qZupMV0llbNLCvyFp
 a5Fg==
X-Gm-Message-State: AOAM533Xpk9IGEBOwUtM+mED0bR9pOAA2bjb3H0q30XsPngIsCHQyynm
 P0s4RmljVaW5d4vmTDmiSo373SpZ0yl8dg==
X-Google-Smtp-Source: ABdhPJxrqRXirwVeJ7aKvLDGc58tsTMMIOaGdS4QVVNvPY2S71lJ4XgpYKRp67a6j8tv/hO/WHY+fw==
X-Received: by 2002:a17:90a:a6e:: with SMTP id
 o101mr5147603pjo.208.1626194536928; 
 Tue, 13 Jul 2021 09:42:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z13sm4947865pfn.94.2021.07.13.09.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:42:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/14] target/alpha: Use tcg_constant_* elsewhere
Date: Tue, 13 Jul 2021 09:42:05 -0700
Message-Id: <20210713164211.1520109-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713164211.1520109-1-richard.henderson@linaro.org>
References: <20210713164211.1520109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the remaining uses of tcg_const_*.  These uses are
all local, with the allocate and free close together.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 46 ++++++++++++----------------------------
 1 file changed, 14 insertions(+), 32 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 58c0e08c0c..103c6326a2 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -250,11 +250,9 @@ static void gen_excp_1(int exception, int error_code)
 {
     TCGv_i32 tmp1, tmp2;
 
-    tmp1 = tcg_const_i32(exception);
-    tmp2 = tcg_const_i32(error_code);
+    tmp1 = tcg_constant_i32(exception);
+    tmp2 = tcg_constant_i32(error_code);
     gen_helper_excp(cpu_env, tmp1, tmp2);
-    tcg_temp_free_i32(tmp2);
-    tcg_temp_free_i32(tmp1);
 }
 
 static DisasJumpType gen_excp(DisasContext *ctx, int exception, int error_code)
@@ -474,15 +472,11 @@ static DisasJumpType gen_bcond_internal(DisasContext *ctx, TCGCond cond,
 
         return DISAS_NORETURN;
     } else {
-        TCGv_i64 z = tcg_const_i64(0);
-        TCGv_i64 d = tcg_const_i64(dest);
-        TCGv_i64 p = tcg_const_i64(ctx->base.pc_next);
+        TCGv_i64 z = load_zero(ctx);
+        TCGv_i64 d = tcg_constant_i64(dest);
+        TCGv_i64 p = tcg_constant_i64(ctx->base.pc_next);
 
         tcg_gen_movcond_i64(cond, cpu_pc, cmp, z, d, p);
-
-        tcg_temp_free_i64(z);
-        tcg_temp_free_i64(d);
-        tcg_temp_free_i64(p);
         return DISAS_PC_UPDATED;
     }
 }
@@ -684,22 +678,19 @@ static void gen_fp_exc_raise(int rc, int fn11)
     if (!(fn11 & QUAL_I)) {
         ignore |= FPCR_INE;
     }
-    ign = tcg_const_i32(ignore);
+    ign = tcg_constant_i32(ignore);
 
     /* ??? Pass in the regno of the destination so that the helper can
        set EXC_MASK, which contains a bitmask of destination registers
        that have caused arithmetic traps.  A simple userspace emulation
        does not require this.  We do need it for a guest kernel's entArith,
        or if we were to do something clever with imprecise exceptions.  */
-    reg = tcg_const_i32(rc + 32);
+    reg = tcg_constant_i32(rc + 32);
     if (fn11 & QUAL_S) {
         gen_helper_fp_exc_raise_s(cpu_env, ign, reg);
     } else {
         gen_helper_fp_exc_raise(cpu_env, ign, reg);
     }
-
-    tcg_temp_free_i32(reg);
-    tcg_temp_free_i32(ign);
 }
 
 static void gen_cvtlq(TCGv vc, TCGv vb)
@@ -792,7 +783,7 @@ IEEE_INTCVT(cvtqt)
 
 static void gen_cpy_mask(TCGv vc, TCGv va, TCGv vb, bool inv_a, uint64_t mask)
 {
-    TCGv vmask = tcg_const_i64(mask);
+    TCGv vmask = tcg_constant_i64(mask);
     TCGv tmp = tcg_temp_new_i64();
 
     if (inv_a) {
@@ -804,7 +795,6 @@ static void gen_cpy_mask(TCGv vc, TCGv va, TCGv vb, bool inv_a, uint64_t mask)
     tcg_gen_andc_i64(vc, vb, vmask);
     tcg_gen_or_i64(vc, vc, tmp);
 
-    tcg_temp_free(vmask);
     tcg_temp_free(tmp);
 }
 
@@ -1178,12 +1168,9 @@ static DisasJumpType gen_call_pal(DisasContext *ctx, int palcode)
 
         case 0x3E:
             /* WTINT */
-            {
-                TCGv_i32 tmp = tcg_const_i32(1);
-                tcg_gen_st_i32(tmp, cpu_env, -offsetof(AlphaCPU, env) +
-                                             offsetof(CPUState, halted));
-                tcg_temp_free_i32(tmp);
-            }
+            tcg_gen_st_i32(tcg_constant_i32(1), cpu_env,
+                           -offsetof(AlphaCPU, env) +
+                           offsetof(CPUState, halted));
             tcg_gen_movi_i64(ctx->ir[IR_V0], 0);
             return gen_excp(ctx, EXCP_HALTED, 0);
 
@@ -1334,12 +1321,8 @@ static DisasJumpType gen_mtpr(DisasContext *ctx, TCGv vb, int regno)
 
     case 253:
         /* WAIT */
-        {
-            TCGv_i32 tmp = tcg_const_i32(1);
-            tcg_gen_st_i32(tmp, cpu_env, -offsetof(AlphaCPU, env) +
-                                         offsetof(CPUState, halted));
-            tcg_temp_free_i32(tmp);
-        }
+        tcg_gen_st_i32(tcg_constant_i32(1), cpu_env,
+                       -offsetof(AlphaCPU, env) + offsetof(CPUState, halted));
         return gen_excp(ctx, EXCP_HALTED, 0);
 
     case 252:
@@ -2712,9 +2695,8 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             vb = load_gpr(ctx, rb);
         }
         tcg_gen_movi_i64(cpu_lock_addr, -1);
+        st_flag_byte(load_zero(ctx), ENV_FLAG_RX_SHIFT);
         tmp = tcg_temp_new();
-        tcg_gen_movi_i64(tmp, 0);
-        st_flag_byte(tmp, ENV_FLAG_RX_SHIFT);
         tcg_gen_andi_i64(tmp, vb, 1);
         st_flag_byte(tmp, ENV_FLAG_PAL_SHIFT);
         tcg_temp_free(tmp);
-- 
2.25.1


