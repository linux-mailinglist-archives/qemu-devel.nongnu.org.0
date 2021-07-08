Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0418A3C1930
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:29:23 +0200 (CEST)
Received: from localhost ([::1]:57784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Ym0-0003wg-TD
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1YiQ-00018J-ME
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:25:45 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1YiD-0007rW-UB
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:25:35 -0400
Received: by mail-pg1-x533.google.com with SMTP id k20so124549pgg.7
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 11:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CQb7o+ET8OOl5+pKxHwa5BifFYk4we0KyRxLN1kjWhQ=;
 b=ABIgeEaPt3wTfJwQ06JYU8f9TQ5I/FsnhnvGq4OzcHAy7T4K/vH834gSG/Olxyxrtg
 Yg1Xn7VWDdau4vydhSL1hqB5Knm3R7khthwbO/K1qHcXiVmJmAXYhESIJXauyC5IViob
 ukJODSfVEgnF57VVX1W6WzL7sC29XbvNOp42HTZ5GZDplurOKlNLl5osqMfCKWt48gDI
 X6SAldtHJFNRWptw5BRoAPiO7YIGJgV3Ez7Jz/Oc8WmjKnLL/qY534m6VcUQdx6LstyD
 6cXz/KvU8X76HrbS3cQFz3gXDavHPKKP0rv/xTUS0Odv/lXIYT2DQjSHvvc17mKOwhpl
 fTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CQb7o+ET8OOl5+pKxHwa5BifFYk4we0KyRxLN1kjWhQ=;
 b=rKLU1O/dK3JgBXyhzjioC6nyu3D3djSFCCU7Mmz7PzCTQNI5Kt1dixoc3EEjYKj4Ix
 UN/XVZJasClRZpnoAKJi/IktF+GmG4bMicJJ1VBTJGmrqwyJuI0YQ8Yi5Sz5mIB3ax8R
 1kb+Y2sQcfb8gE10xU4aR8oC6Jnm/ZtXDIbDE+Wh7O2cuBDvRJJpVBSO4Zo1rWBz2+ix
 oqxhB+leryj4lCUHqnvV2olEAKd3Z3lYcv81lqpBjr8j0fVrUzznAJOohi2TZD7pvoUt
 Svg8aoSQpaCmpKlk+23FYyFAowlTLVeZYwJbXE1SceXCxPJrDwPKiRJKZ2vLgz09MGZ8
 1X+Q==
X-Gm-Message-State: AOAM5328y9tNxVjKO+5ZUKT+47iBi0ryBmmtA9it3zlj5Uu2i7WFhbl3
 fNfQBMTbAE2akTcG6unWg2aN1JAfXVcdXQ==
X-Google-Smtp-Source: ABdhPJyt5jpMR5b0Tb4uvOBEcu/gh2urOEMS81kA23ew6Rs1qWv5paGY/GYCUWmZlM2rIVrdG1KtQQ==
X-Received: by 2002:a62:f947:0:b029:2e9:c502:7939 with SMTP id
 g7-20020a62f9470000b02902e9c5027939mr32441608pfm.34.1625768722711; 
 Thu, 08 Jul 2021 11:25:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d67sm2751810pfd.81.2021.07.08.11.25.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 11:25:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/alpha: Use tcg_constant_* elsewhere
Date: Thu,  8 Jul 2021 11:25:19 -0700
Message-Id: <20210708182519.750626-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708182519.750626-1-richard.henderson@linaro.org>
References: <20210708182519.750626-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the remaining uses of tcg_const_*.  These uses are
all local, with the allocate and free close together.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 46 ++++++++++++----------------------------
 1 file changed, 14 insertions(+), 32 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 3fd66fb78d..cf5ad46853 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -251,11 +251,9 @@ static void gen_excp_1(int exception, int error_code)
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
@@ -506,15 +504,11 @@ static DisasJumpType gen_bcond_internal(DisasContext *ctx, TCGCond cond,
 
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
@@ -716,22 +710,19 @@ static void gen_fp_exc_raise(int rc, int fn11)
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
@@ -824,7 +815,7 @@ IEEE_INTCVT(cvtqt)
 
 static void gen_cpy_mask(TCGv vc, TCGv va, TCGv vb, bool inv_a, uint64_t mask)
 {
-    TCGv vmask = tcg_const_i64(mask);
+    TCGv vmask = tcg_constant_i64(mask);
     TCGv tmp = tcg_temp_new_i64();
 
     if (inv_a) {
@@ -836,7 +827,6 @@ static void gen_cpy_mask(TCGv vc, TCGv va, TCGv vb, bool inv_a, uint64_t mask)
     tcg_gen_andc_i64(vc, vb, vmask);
     tcg_gen_or_i64(vc, vc, tmp);
 
-    tcg_temp_free(vmask);
     tcg_temp_free(tmp);
 }
 
@@ -1210,12 +1200,9 @@ static DisasJumpType gen_call_pal(DisasContext *ctx, int palcode)
 
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
 
@@ -1366,12 +1353,8 @@ static DisasJumpType gen_mtpr(DisasContext *ctx, TCGv vb, int regno)
 
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
@@ -2744,9 +2727,8 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
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


