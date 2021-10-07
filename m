Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5161D425A18
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:56:33 +0200 (CEST)
Received: from localhost ([::1]:46204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXdA-00030x-6q
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUc-00044R-Kj
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:47:44 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUW-0006wz-TR
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:47:42 -0400
Received: by mail-pg1-x536.google.com with SMTP id h3so506290pgb.7
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xgVgN3nv5jhHcDS7Ua2oeBb2JMX8tUz0628CF3KrShU=;
 b=zEvnxj9enVvk7Gn2zclO+slqfc1RMJmjLjK6FSiKLdQ+c5HJwAzzMD/ewJDGcizui9
 Z5Pw94iShalvycIFB4SgNso5I2IGe/ULLP4OlrYTiz91kaRI7oGVSw9OxRgSchQPB+c6
 TxlS5EL8py/8UTIom5efCc/lOPgbaCIgCRAdkC9DE4GPMmAxOyzoN7+Z6ONWXCTmf/gn
 cgb8mQGpxPblwWM4vWm4cd3SQmkObpGyacP7QFZhcOMeZzlZX4yBetd3LKwbx2kGs1dP
 V81IosEq0fxSHNlPqEaoq4zkxWyJYAyRJ/+w/eBx9swErgnp/PIxKwtHWOw3IQoQfjji
 LBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xgVgN3nv5jhHcDS7Ua2oeBb2JMX8tUz0628CF3KrShU=;
 b=ufUzDdxlqJW+kMHth8hD/uHq13vOlHk5RNDZrCBkaHP95jz7q1zF74/AKAkz75g5iI
 snX0HaQTifUNUxq2aqswdnMYikBV3MDjE6IDrKAJEtlHCQYZDCEQrDA0z5R84NWKYcZ0
 D/KRMwxFpz+fmoz46kONqRpN2GzHmjB69Yo8VTnEQg3IK5ZhGPSjD/I2HiUIG3c/D97Q
 oAduBNJ5pgAsmNT53MzI+Ybn+T1Eu+M2/4YtJOarb9DJ16xTJKtlTHKWmnEtLV7BDIFx
 M9s/DlmYx3byKUUWj54jPYFn7uwF+yiq4tmTX7rcoK4OaoO1vUbf+/jRM+uWAA+FFG+G
 wRdQ==
X-Gm-Message-State: AOAM533opuAv4TXQqG33wl83cscWpJAgcU1V1FjpOhFG14QVIMKVFpdP
 4op4gERPcVxIZtjx/z6yWGX2JQxwj3d90g==
X-Google-Smtp-Source: ABdhPJxCa+kl178OBhDlKE3qw7NiJgLaCvcL8bT9MrgtNs5aWI/PUVtzY6HfncagY4RjRpOE5O5yoA==
X-Received: by 2002:a63:1a64:: with SMTP id a36mr768435pgm.225.1633628853461; 
 Thu, 07 Oct 2021 10:47:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 197sm83318pfv.6.2021.10.07.10.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:47:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/13] target/riscv: Use gen_shift*_per_ol for RVB, RVI
Date: Thu,  7 Oct 2021 10:47:22 -0700
Message-Id: <20211007174722.929993-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007174722.929993-1-richard.henderson@linaro.org>
References: <20211007174722.929993-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most shift instructions require a separate implementation
for RV32 when TARGET_LONG_BITS == 64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 31 +++++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 92 ++++++++++++++-----------
 target/riscv/insn_trans/trans_rvi.c.inc | 26 +++----
 3 files changed, 97 insertions(+), 52 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index be458ae0c2..dbe3670ff3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -462,6 +462,22 @@ static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
     return true;
 }
 
+static bool gen_shift_imm_fn_per_ol(DisasContext *ctx, arg_shift *a,
+                                    DisasExtend ext,
+                                    void (*f_tl)(TCGv, TCGv, target_long),
+                                    void (*f_32)(TCGv, TCGv, target_long))
+{
+    int olen = get_olen(ctx);
+    if (olen != TARGET_LONG_BITS) {
+        if (olen == 32) {
+            f_tl = f_32;
+        } else {
+            g_assert_not_reached();
+        }
+    }
+    return gen_shift_imm_fn(ctx, a, ext, f_tl);
+}
+
 static bool gen_shift_imm_tl(DisasContext *ctx, arg_shift *a, DisasExtend ext,
                              void (*func)(TCGv, TCGv, TCGv))
 {
@@ -498,6 +514,21 @@ static bool gen_shift(DisasContext *ctx, arg_r *a, DisasExtend ext,
     return true;
 }
 
+static bool gen_shift_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ext,
+                             void (*f_tl)(TCGv, TCGv, TCGv),
+                             void (*f_32)(TCGv, TCGv, TCGv))
+{
+    int olen = get_olen(ctx);
+    if (olen != TARGET_LONG_BITS) {
+        if (olen == 32) {
+            f_tl = f_32;
+        } else {
+            g_assert_not_reached();
+        }
+    }
+    return gen_shift(ctx, a, ext, f_tl);
+}
+
 static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
                       void (*func)(TCGv, TCGv))
 {
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index adc35b6491..9b9c9c8bc4 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -227,22 +227,70 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bext);
 }
 
+static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotr_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotr_tl);
+    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotr_tl, gen_rorw);
+}
+
+static void gen_roriw(TCGv ret, TCGv arg1, target_long shamt)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_rotri_i32(t1, t1, shamt);
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
 }
 
 static bool trans_rori(DisasContext *ctx, arg_rori *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_rotri_tl);
+    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
+                                   tcg_gen_rotri_tl, gen_roriw);
+}
+
+static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotl_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
 }
 
 static bool trans_rol(DisasContext *ctx, arg_rol *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
+    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotl_tl, gen_rolw);
 }
 
 static void gen_rev8_32(TCGv ret, TCGv src1)
@@ -349,24 +397,6 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
     return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
 }
 
-static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv_i32 t1 = tcg_temp_new_i32();
-    TCGv_i32 t2 = tcg_temp_new_i32();
-
-    /* truncate to 32-bits */
-    tcg_gen_trunc_tl_i32(t1, arg1);
-    tcg_gen_trunc_tl_i32(t2, arg2);
-
-    tcg_gen_rotr_i32(t1, t1, t2);
-
-    /* sign-extend 64-bits */
-    tcg_gen_ext_i32_tl(ret, t1);
-
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
-}
-
 static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -380,25 +410,7 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
     ctx->ol = MXL_RV32;
-    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_rorw);
-}
-
-static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv_i32 t1 = tcg_temp_new_i32();
-    TCGv_i32 t2 = tcg_temp_new_i32();
-
-    /* truncate to 32-bits */
-    tcg_gen_trunc_tl_i32(t1, arg1);
-    tcg_gen_trunc_tl_i32(t2, arg2);
-
-    tcg_gen_rotl_i32(t1, t1, t2);
-
-    /* sign-extend 64-bits */
-    tcg_gen_ext_i32_tl(ret, t1);
-
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw);
 }
 
 static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index c0a46d823f..b0fdec97de 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -270,14 +270,26 @@ static bool trans_slli(DisasContext *ctx, arg_slli *a)
     return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
 }
 
+static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
+{
+    tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
+}
+
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
-    return gen_shift_imm_fn(ctx, a, EXT_ZERO, tcg_gen_shri_tl);
+    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
+                                   tcg_gen_shri_tl, gen_srliw);
+}
+
+static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
+{
+    tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
 }
 
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
-    return gen_shift_imm_fn(ctx, a, EXT_SIGN, tcg_gen_sari_tl);
+    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
+                                   tcg_gen_sari_tl, gen_sraiw);
 }
 
 static bool trans_add(DisasContext *ctx, arg_add *a)
@@ -344,11 +356,6 @@ static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
     return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
 }
 
-static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
-{
-    tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
-}
-
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -356,11 +363,6 @@ static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
     return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_srliw);
 }
 
-static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
-{
-    tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
-}
-
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
     REQUIRE_64BIT(ctx);
-- 
2.25.1


