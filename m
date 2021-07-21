Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2923D093F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:54:43 +0200 (CEST)
Received: from localhost ([::1]:45124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m667u-0007NX-Ty
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vv-0005Cx-7q
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:19 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vt-0005ez-Hi
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:19 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 jx7-20020a17090b46c7b02901757deaf2c8so465298pjb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=19+eBha8Su7fvWuryK0pEBtOSE7+NFntpYhh8TaiKnw=;
 b=jCys5QIjCTAAqzmcwZgaW3CXNnR2Du8jratp/Np7q6X9t3Frw34HkbDDr6VDgoQ4Xy
 8qiCJU3SuI7RusSM1ntsHWp6N0VHt1RrHGleeYb1cogxZEHZ4uRSEkviE00YCp/qgxFS
 bvgLo3TDPiEctyNVkCRF4r7rBQkcdj5gRF0MBRKD/e+hnNi6gxeQbzt/P7DrhBtLGvvI
 H5HgIz5SXc+fvMJf8th5VJNiyYERqB+Zr3qNjNfO8t2n9fpSYXyNRUxgKTLJM8YsHCwX
 2XDcoLEA7EoMasj9G3rTphGbgNYcFu/iS/gt4kQ/me995FIcrX8sKHFcrib+8uStgvRv
 UlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=19+eBha8Su7fvWuryK0pEBtOSE7+NFntpYhh8TaiKnw=;
 b=Eyydeop56AIWUWteGNkj08xHoJt1VRmUE2/zGkdtjmdOrs4WR/OLeueir0syDF7SqS
 gZ4PkRudWM+QK0FCnNi7nJjIjLpRtXiUjmtZnIWAoIcouMP1R44GfHsEjfGt3lUp4iS+
 pG2Chh7DMGlkJrRSWJWd5Ee866u7hiXcGIIBnH0MhfkvxHaVPvmWQv7iCfW3WZyOopGv
 L03GShF+s/a28iHXRv9nMGLMCyT0cbbfFCtGGY11B6zrDxRV7ARH1DCUxz2ttpY9Bk0x
 Lk+QHJz5Y7zB+OtIoNYym9tz4FZJEMXGINRoRBy1BmWuPRUoqWlUGo944m3YqXvbm6xH
 j0Fw==
X-Gm-Message-State: AOAM530jTgrKA9uYMVIQkPHfMkXmykh/wsKo/YE+yclO5lhDIYm0URUr
 0doesz7QYxZvcVBKAZ7uLYKufyThuyPGJg==
X-Google-Smtp-Source: ABdhPJwvdi9K9X0i8g80IiZXkNWzzg/QOI0PODaBzC0GJEOX5Y+/EtZwT7od8mAvHIKIIIsl+tXwdQ==
X-Received: by 2002:a17:902:ea09:b029:12b:1dc0:ac74 with SMTP id
 s9-20020a170902ea09b029012b1dc0ac74mr26538689plg.82.1626849736106; 
 Tue, 20 Jul 2021 23:42:16 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 18/23] target/riscv: Remove exit_tb and
 lookup_and_goto_ptr
Date: Tue, 20 Jul 2021 20:41:50 -1000
Message-Id: <20210721064155.645508-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

GDB single-stepping is now handled generically, which means
we don't need to do anything in the wrappers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                      | 29 +------------------
 .../riscv/insn_trans/trans_privileged.c.inc   |  4 +--
 target/riscv/insn_trans/trans_rvi.c.inc       |  6 ++--
 target/riscv/insn_trans/trans_rvv.c.inc       |  2 +-
 4 files changed, 7 insertions(+), 34 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6983be5723..b4cc79a494 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -131,33 +131,6 @@ static void generate_exception_mtval(DisasContext *ctx, int excp)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception_debug(void)
-{
-    TCGv_i32 helper_tmp = tcg_const_i32(EXCP_DEBUG);
-    gen_helper_raise_exception(cpu_env, helper_tmp);
-    tcg_temp_free_i32(helper_tmp);
-}
-
-/* Wrapper around tcg_gen_exit_tb that handles single stepping */
-static void exit_tb(DisasContext *ctx)
-{
-    if (ctx->base.singlestep_enabled) {
-        gen_exception_debug();
-    } else {
-        tcg_gen_exit_tb(NULL, 0);
-    }
-}
-
-/* Wrapper around tcg_gen_lookup_and_goto_ptr that handles single stepping */
-static void lookup_and_goto_ptr(DisasContext *ctx)
-{
-    if (ctx->base.singlestep_enabled) {
-        gen_exception_debug();
-    } else {
-        tcg_gen_lookup_and_goto_ptr();
-    }
-}
-
 static void gen_exception_illegal(DisasContext *ctx)
 {
     generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
@@ -176,7 +149,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
         tcg_gen_movi_tl(cpu_pc, dest);
-        lookup_and_goto_ptr(ctx);
+        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index a7afcb15ce..75c6ef80a6 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -78,7 +78,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 
     if (has_ext(ctx, RVS)) {
         gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
-        exit_tb(ctx); /* no chaining */
+        tcg_gen_exit_tb(NULL, 0); /* no chaining */
         ctx->base.is_jmp = DISAS_NORETURN;
     } else {
         return false;
@@ -94,7 +94,7 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
 #ifndef CONFIG_USER_ONLY
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
     gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
-    exit_tb(ctx); /* no chaining */
+    tcg_gen_exit_tb(NULL, 0); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 #else
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 6e736c9d0d..aef3e84ca8 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -72,7 +72,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     if (a->rd != 0) {
         tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->pc_succ_insn);
     }
-    lookup_and_goto_ptr(ctx);
+    tcg_gen_lookup_and_goto_ptr();
 
     if (misaligned) {
         gen_set_label(misaligned);
@@ -461,7 +461,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
      * however we need to end the translation block
      */
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
-    exit_tb(ctx);
+    tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
@@ -481,7 +481,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
 #define RISCV_OP_CSR_POST do {\
     gen_set_gpr(a->rd, dest); \
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn); \
-    exit_tb(ctx); \
+    tcg_gen_exit_tb(NULL, 0); \
     ctx->base.is_jmp = DISAS_NORETURN; \
     tcg_temp_free(source1); \
     tcg_temp_free(csr_store); \
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 83d9a285ba..56eb775cef 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -42,7 +42,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
     gen_set_gpr(a->rd, dst);
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
-    lookup_and_goto_ptr(ctx);
+    tcg_gen_lookup_and_goto_ptr();
     ctx->base.is_jmp = DISAS_NORETURN;
 
     tcg_temp_free(s1);
-- 
2.25.1


