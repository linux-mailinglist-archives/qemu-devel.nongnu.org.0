Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511B33F51B4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 22:07:53 +0200 (CEST)
Received: from localhost ([::1]:56932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIGEa-0000U8-9g
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 16:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG35-0006qD-LY
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:59 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:38600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2w-0003FG-8S
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:58 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so215757pjb.3
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pF9B+WgTG1ENelmtPU7ViwHIJlITnPqEauelQYdlqDU=;
 b=thQ5I75b2k6oml/GDGKbvQVZMbIUjO03GkDZBXm+YAz8EUmkw0iYt6q4qbsQ4OgBCL
 EFWFhGFJu8H0YngHa3ue3d6V9x+Qr1prFIvXlXq1tF5n0OuWiy52ZN35UVjtBRSH3vyn
 8t5u41dSbRYnfMv6iNE6/qq5PB/rYf2+If3HIrZYT4XgbJYS5weaPOWwYDV6CagB7K1c
 cc/qiKZMQvVAVdXNASdhMIY5CUPRtCyizPYNYvZxqc3yClRAnjXt4cQgmbHeH1n+OwR4
 YlNtebhyVevpakh0/Zc4zSW4TwhE0PKVPn6J1lnv4hB6IHWdNBgTc7Zuz0x409AvFQt7
 GeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pF9B+WgTG1ENelmtPU7ViwHIJlITnPqEauelQYdlqDU=;
 b=l40R2+k4LvpNZavBM1H9if4G3AHeTQLkv8/N9nVRJF0nF2FtO00VWLiFD0GQsGv/Sk
 w4OjpznDKaAgj2MWps7Fjyl8wi5uoOckMIQuZelhFQMXyUTOe+ugXaFLBVvcnE38dylc
 hKeiP4AIeG/J6B7ZlokLdNZqnkwqYBM4McUXsL2Mo1mvTIGxsM7sHK9e/guB40Iiy9cl
 602FQ01/JHKUbFe1lBDH0j1DX6zwS0sg6FV0MCoWpFro2k3WiBb6jALxkfaAEvHqPdLq
 BErenuYxql3g1arTg+nSOyha0ZFal+UjFE7NMORt9btPsUXFQdWIe0QIgbL1HAqOuFYW
 66xg==
X-Gm-Message-State: AOAM530PXyDd8ejxm2UnhNfGEqDa7BEHwjLCvmwTmjFdW2c3CRNhW1jj
 7I29sSEnxsdlCj2XA+L1Ev1poA/PRCVb9A==
X-Google-Smtp-Source: ABdhPJyYAwbM9GNQFRm8FfE0bftxGFgzYQ0+vrUiEsrScrd8kfUE94ts3hzAeZnRRQNJ05btOXOoeA==
X-Received: by 2002:a17:902:b594:b0:132:479d:2108 with SMTP id
 a20-20020a170902b59400b00132479d2108mr12007619pls.10.1629748546799; 
 Mon, 23 Aug 2021 12:55:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 23/24] target/riscv: Tidy trans_rvh.c.inc
Date: Mon, 23 Aug 2021 12:55:28 -0700
Message-Id: <20210823195529.560295-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Exit early if check_access fails.
Split out do_hlv, do_hsv, do_hlvx subroutines.
Use dest_gpr, get_gpr in the new subroutines.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |   1 +
 target/riscv/insn_trans/trans_rvh.c.inc | 266 +++++-------------------
 2 files changed, 57 insertions(+), 210 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f09f8d5faf..2cd921d51c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -42,6 +42,7 @@
 &j    imm rd
 &r    rd rs1 rs2
 &r2   rd rs1
+&r2_s rs1 rs2
 &s    imm rs1 rs2
 &u    imm rd
 &shift     shamt rs1 rd
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index 585eb1d87e..ecbf77ff9c 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -17,281 +17,139 @@
  */
 
 #ifndef CONFIG_USER_ONLY
-static void check_access(DisasContext *ctx) {
+static bool check_access(DisasContext *ctx)
+{
     if (!ctx->hlsx) {
         if (ctx->virt_enabled) {
             generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT);
         } else {
             generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
         }
+        return false;
     }
+    return true;
 }
 #endif
 
+static bool do_hlv(DisasContext *ctx, arg_r2 *a, MemOp mop)
+{
+#ifdef CONFIG_USER_ONLY
+    return false;
+#else
+    if (check_access(ctx)) {
+        TCGv dest = dest_gpr(ctx, a->rd);
+        TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
+        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+        tcg_gen_qemu_ld_tl(dest, addr, mem_idx, mop);
+        gen_set_gpr(ctx, a->rd, dest);
+    }
+    return true;
+#endif
+}
+
 static bool trans_hlv_b(DisasContext *ctx, arg_hlv_b *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_SB);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_SB);
 }
 
 static bool trans_hlv_h(DisasContext *ctx, arg_hlv_h *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESW);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_TESW);
 }
 
 static bool trans_hlv_w(DisasContext *ctx, arg_hlv_w *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESL);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_TESL);
 }
 
 static bool trans_hlv_bu(DisasContext *ctx, arg_hlv_bu *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_UB);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_UB);
 }
 
 static bool trans_hlv_hu(DisasContext *ctx, arg_hlv_hu *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
+    return do_hlv(ctx, a, MO_TEUW);
+}
 
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEUW);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
+static bool do_hsv(DisasContext *ctx, arg_r2_s *a, MemOp mop)
+{
+#ifdef CONFIG_USER_ONLY
     return false;
+#else
+    if (check_access(ctx)) {
+        TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
+        TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
+        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+        tcg_gen_qemu_st_tl(data, addr, mem_idx, mop);
+    }
+    return true;
 #endif
 }
 
 static bool trans_hsv_b(DisasContext *ctx, arg_hsv_b *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-    gen_get_gpr(ctx, dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_SB);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-    return true;
-#else
-    return false;
-#endif
+    return do_hsv(ctx, a, MO_SB);
 }
 
 static bool trans_hsv_h(DisasContext *ctx, arg_hsv_h *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-    gen_get_gpr(ctx, dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESW);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-    return true;
-#else
-    return false;
-#endif
+    return do_hsv(ctx, a, MO_TESW);
 }
 
 static bool trans_hsv_w(DisasContext *ctx, arg_hsv_w *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-    gen_get_gpr(ctx, dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESL);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-    return true;
-#else
-    return false;
-#endif
+    return do_hsv(ctx, a, MO_TESL);
 }
 
 static bool trans_hlv_wu(DisasContext *ctx, arg_hlv_wu *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
-
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEUL);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_TEUL);
 }
 
 static bool trans_hlv_d(DisasContext *ctx, arg_hlv_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
-
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEQ);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_TEQ);
 }
 
 static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
+    return do_hsv(ctx, a, MO_TEQ);
+}
 
 #ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-    gen_get_gpr(ctx, dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEQ);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
+static bool do_hlvx(DisasContext *ctx, arg_r2 *a,
+                    void (*func)(TCGv, TCGv_env, TCGv))
+{
+    if (check_access(ctx)) {
+        TCGv dest = dest_gpr(ctx, a->rd);
+        TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
+        func(dest, cpu_env, addr);
+        gen_set_gpr(ctx, a->rd, dest);
+    }
     return true;
-#else
-    return false;
-#endif
 }
+#endif
 
 static bool trans_hlvx_hu(DisasContext *ctx, arg_hlvx_hu *a)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    gen_helper_hyp_hlvx_hu(t1, cpu_env, t0);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
+    return do_hlvx(ctx, a, gen_helper_hyp_hlvx_hu);
 #else
     return false;
 #endif
@@ -301,19 +159,7 @@ static bool trans_hlvx_wu(DisasContext *ctx, arg_hlvx_wu *a)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    gen_helper_hyp_hlvx_wu(t1, cpu_env, t0);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
+    return do_hlvx(ctx, a, gen_helper_hyp_hlvx_wu);
 #else
     return false;
 #endif
-- 
2.25.1


