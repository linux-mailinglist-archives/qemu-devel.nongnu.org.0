Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7702F432B16
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 02:11:00 +0200 (CEST)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcciZ-0003B6-JG
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 20:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZS-00050F-3Q
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:34 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZE-0001lX-Uo
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:32 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e7so17736224pgk.2
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 17:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v38EgObVIQZxnJyRBCc7mAXK+cvyWQc+ZvLKbhcUEpc=;
 b=l+IKxgPe6q3NntPeN7/pgNueU3oalEnsj71rx1BMQFY88ZEwkFl6BiHcHRYw22rhQR
 gRWvb27pl6RaUu/mgW8cIJkj93Ie+AJ5ZlmubQuQZ+QWdvPzaoTxtpKj98GXENAXdfir
 Q9YZVOKxjgasLqGSI8voT38djA5bcqvx6hNubASgmrpnR37zwDMMt8KdWlBwYcDTIdQG
 URS586XRC8aLJU8/cWqL9wiHUBclAXUDS3EMQOC9PDjvhEcpQeEDZh1Zzb/jOT+3Cz38
 gY6TndAqGZGfrQMS7nku+WEZnC/+X3/ey9rX7sLch5xRwdILuP3NGn7+Wssje8j1+/hw
 r7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v38EgObVIQZxnJyRBCc7mAXK+cvyWQc+ZvLKbhcUEpc=;
 b=thDAY40qcROcopF+5ZLSSg1GDOdaqDUGAVjMV67IGCQNEIn9weYaTn80agLOJjp/vq
 dvHfAIb50/G7Bo2/wlW5f8VIt7FJUSIV962niunbaTK97rZfq1NY4qjRuHiWBTR2D98J
 Ksa8J0N7rExeWitKoATY9LIsdPWyAkPokw4hpfGV0KaUGirwbNkY8em9Xu/ezlwH7xXk
 4UuGaSUbdRj7zUKuC8sXp33SJw4M8+aCnP8OLx68Mpd9MQtT5FHmiQxDUQodjHhuCagF
 dC63FhqXnnc6JkRx+Cekp5V676krMAVtZDXWzvmkkgU8KbleGWjAvCo5FrZzBAtXsI/X
 RqCQ==
X-Gm-Message-State: AOAM530SgwO9ApzD9yzMfqW39AUbJsny3yulVdZpc50WAs9jkzJxetft
 T+AVKIcrRykaGXYr8DnoJd++vPqKilGSXQ==
X-Google-Smtp-Source: ABdhPJyrO7r48QwA4biYvByGgZqhaFylvMajxqBlgMFJF6CzwyEmsoocUl8L+2zoi30iwJ675QboBQ==
X-Received: by 2002:a63:7d01:: with SMTP id y1mr26415290pgc.343.1634601679405; 
 Mon, 18 Oct 2021 17:01:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/16] target/riscv: Use gen_shift*_per_ol for RVB, RVI
Date: Mon, 18 Oct 2021 17:01:05 -0700
Message-Id: <20211019000108.3678724-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019000108.3678724-1-richard.henderson@linaro.org>
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most shift instructions require a separate implementation
for RV32 when TARGET_LONG_BITS == 64.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 31 +++++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 92 ++++++++++++++-----------
 target/riscv/insn_trans/trans_rvi.c.inc | 26 +++----
 3 files changed, 97 insertions(+), 52 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ebcd1c8431..de013fbf9b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -438,6 +438,22 @@ static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
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
@@ -474,6 +490,21 @@ static bool gen_shift(DisasContext *ctx, arg_r *a, DisasExtend ext,
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
index 0c2120428d..cc39e6033b 100644
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
index 9cf0383cfb..91dc438a3a 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -268,14 +268,26 @@ static bool trans_slli(DisasContext *ctx, arg_slli *a)
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
@@ -342,11 +354,6 @@ static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
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
@@ -354,11 +361,6 @@ static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
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


