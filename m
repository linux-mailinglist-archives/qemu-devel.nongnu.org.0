Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708D23F3294
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 19:55:59 +0200 (CEST)
Received: from localhost ([::1]:57410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH8kI-0002yL-G3
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 13:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8YB-0005fT-RY
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:43:28 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Y5-0003vT-T5
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:43:27 -0400
Received: by mail-pl1-x62e.google.com with SMTP id x1so3796796plg.10
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 10:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c+J+/7PDJw+/zNnDzmXKtGVwcAQNMcE1adqOvHSAuIU=;
 b=p/UDpfGgiFoAj6qqpM0OU7AtNVG4uYQhxxWh7Hmfl2PvwdizxFI2GXYxMgVytlEFig
 ObSBmjKuBKZRI8WN0M6s/2cSUD5CX1/eWy/IXakoT43AUPPxoPuak62QqFTes8WFxILX
 bddqw/r8Wqt62VeA07xO9uDK72Hzg1k1u4u1FliAzzzklytT4IVpH1uadxfmf1M5ulW4
 AvyfJl1/js3EiHo124LVQabIHF2E8D7pKV1qAaw6KS3yYlaiZXZV+LkEvwHuz2FJcbTC
 kbCzoaeotv4pNvhqucb04NbLkJcR/BTr4NpTnyxU7cxD1odeNqzTeNkLl+dnXPQpgCEw
 aDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c+J+/7PDJw+/zNnDzmXKtGVwcAQNMcE1adqOvHSAuIU=;
 b=rungOdmdAcKEZfsEEKawKEr6w3sL7p++WPoJQ9ya0z8ZiexQn9L4VOm15Ipde49IND
 90zI0DdlEr6ECnrWDruGvAGfbmRqJ9Rfj3qrsQYnpNW1xa/tHZbHN0+XjI07nBZ7TjPk
 pmT9MGmQ18Y+OB5etEMeAC5aQNkNfd9iP2loDkHuEckP7oGUi05ePlhs/a5OnEbVIl4+
 ylYDuAT8nlj4ScYyLs86x2YcQ8FaF4TXmJ5y83t2EsD9pxvh/q4sLMkJrhjwmpTJFUQQ
 e6gf5xZST65hCdajESX6qGFkQcMj6X9pEuHFN5uv2OcT4W0mN4w09pGhW4dzNRd0RlPf
 +Fvw==
X-Gm-Message-State: AOAM5306FMfWBy/Ok7DpNp2z/AI17AQIJP+jYK2WJQI4Om5tpkkzUicU
 qWMYVPHMNp1W61YkJs44ezS2V+cQu+3vsA==
X-Google-Smtp-Source: ABdhPJz6hYJvxtziB3B9JAYGxDw32BQvAOXxUgy3TvMVk56I2fHZRPWyl9HWgW5PHC4xSWmLbuRHEg==
X-Received: by 2002:a17:90a:af88:: with SMTP id
 w8mr5807619pjq.104.1629481397059; 
 Fri, 20 Aug 2021 10:43:17 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l2sm7304142pfc.157.2021.08.20.10.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:43:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/21] target/riscv: Move gen_* helpers for RVB
Date: Fri, 20 Aug 2021 07:42:46 -1000
Message-Id: <20210820174257.548286-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820174257.548286-1-richard.henderson@linaro.org>
References: <20210820174257.548286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move these helpers near their use by the trans_*
functions within insn_trans/trans_rvb.c.inc.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 233 -----------------------
 target/riscv/insn_trans/trans_rvb.c.inc | 234 ++++++++++++++++++++++++
 2 files changed, 234 insertions(+), 233 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7fbacfa6ee..09853530c4 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -380,229 +380,6 @@ static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a, DisasExtend ext,
     return true;
 }
 
-static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_deposit_tl(ret, arg1, arg2,
-                       TARGET_LONG_BITS / 2,
-                       TARGET_LONG_BITS / 2);
-}
-
-static void gen_packu(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv t = tcg_temp_new();
-    tcg_gen_shri_tl(t, arg1, TARGET_LONG_BITS / 2);
-    tcg_gen_deposit_tl(ret, arg2, t, 0, TARGET_LONG_BITS / 2);
-    tcg_temp_free(t);
-}
-
-static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv t = tcg_temp_new();
-    tcg_gen_ext8u_tl(t, arg2);
-    tcg_gen_deposit_tl(ret, arg1, t, 8, TARGET_LONG_BITS - 8);
-    tcg_temp_free(t);
-}
-
-static void gen_sbop_mask(TCGv ret, TCGv shamt)
-{
-    tcg_gen_movi_tl(ret, 1);
-    tcg_gen_shl_tl(ret, ret, shamt);
-}
-
-static void gen_bset(TCGv ret, TCGv arg1, TCGv shamt)
-{
-    TCGv t = tcg_temp_new();
-
-    gen_sbop_mask(t, shamt);
-    tcg_gen_or_tl(ret, arg1, t);
-
-    tcg_temp_free(t);
-}
-
-static void gen_bclr(TCGv ret, TCGv arg1, TCGv shamt)
-{
-    TCGv t = tcg_temp_new();
-
-    gen_sbop_mask(t, shamt);
-    tcg_gen_andc_tl(ret, arg1, t);
-
-    tcg_temp_free(t);
-}
-
-static void gen_binv(TCGv ret, TCGv arg1, TCGv shamt)
-{
-    TCGv t = tcg_temp_new();
-
-    gen_sbop_mask(t, shamt);
-    tcg_gen_xor_tl(ret, arg1, t);
-
-    tcg_temp_free(t);
-}
-
-static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
-{
-    tcg_gen_shr_tl(ret, arg1, shamt);
-    tcg_gen_andi_tl(ret, ret, 1);
-}
-
-static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_not_tl(ret, arg1);
-    tcg_gen_shl_tl(ret, ret, arg2);
-    tcg_gen_not_tl(ret, ret);
-}
-
-static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_not_tl(ret, arg1);
-    tcg_gen_shr_tl(ret, ret, arg2);
-    tcg_gen_not_tl(ret, ret);
-}
-
-static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
-{
-    TCGv source1 = tcg_temp_new();
-    TCGv source2;
-
-    gen_get_gpr(ctx, source1, a->rs1);
-
-    if (a->shamt == (TARGET_LONG_BITS - 8)) {
-        /* rev8, byte swaps */
-        tcg_gen_bswap_tl(source1, source1);
-    } else {
-        source2 = tcg_temp_new();
-        tcg_gen_movi_tl(source2, a->shamt);
-        gen_helper_grev(source1, source1, source2);
-        tcg_temp_free(source2);
-    }
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    return true;
-}
-
-#define GEN_SHADD(SHAMT)                                       \
-static void gen_sh##SHAMT##add(TCGv ret, TCGv arg1, TCGv arg2) \
-{                                                              \
-    TCGv t = tcg_temp_new();                                   \
-                                                               \
-    tcg_gen_shli_tl(t, arg1, SHAMT);                           \
-    tcg_gen_add_tl(ret, t, arg2);                              \
-                                                               \
-    tcg_temp_free(t);                                          \
-}
-
-GEN_SHADD(1)
-GEN_SHADD(2)
-GEN_SHADD(3)
-
-static void gen_ctzw(TCGv ret, TCGv arg1)
-{
-    tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
-    tcg_gen_ctzi_tl(ret, ret, 64);
-}
-
-static void gen_clzw(TCGv ret, TCGv arg1)
-{
-    tcg_gen_ext32u_tl(ret, arg1);
-    tcg_gen_clzi_tl(ret, ret, 64);
-    tcg_gen_subi_tl(ret, ret, 32);
-}
-
-static void gen_cpopw(TCGv ret, TCGv arg1)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    tcg_gen_ctpop_tl(ret, arg1);
-}
-
-static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv t = tcg_temp_new();
-    tcg_gen_ext16s_tl(t, arg2);
-    tcg_gen_deposit_tl(ret, arg1, t, 16, 48);
-    tcg_temp_free(t);
-}
-
-static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv t = tcg_temp_new();
-    tcg_gen_shri_tl(t, arg1, 16);
-    tcg_gen_deposit_tl(ret, arg2, t, 0, 16);
-    tcg_gen_ext32s_tl(ret, ret);
-    tcg_temp_free(t);
-}
-
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
-}
-
-static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    gen_helper_grev(ret, arg1, arg2);
-}
-
-static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    gen_helper_gorcw(ret, arg1, arg2);
-}
-
-#define GEN_SHADD_UW(SHAMT)                                       \
-static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
-{                                                                 \
-    TCGv t = tcg_temp_new();                                      \
-                                                                  \
-    tcg_gen_ext32u_tl(t, arg1);                                   \
-                                                                  \
-    tcg_gen_shli_tl(t, t, SHAMT);                                 \
-    tcg_gen_add_tl(ret, t, arg2);                                 \
-                                                                  \
-    tcg_temp_free(t);                                             \
-}
-
-GEN_SHADD_UW(1)
-GEN_SHADD_UW(2)
-GEN_SHADD_UW(3)
-
-static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    tcg_gen_add_tl(ret, arg1, arg2);
-}
-
 static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
                       void (*func)(TCGv, TCGv, TCGv))
 {
@@ -701,16 +478,6 @@ static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
     return true;
 }
 
-static void gen_ctz(TCGv ret, TCGv arg1)
-{
-    tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
-}
-
-static void gen_clz(TCGv ret, TCGv arg1)
-{
-    tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
-}
-
 static bool gen_unary(DisasContext *ctx, arg_r2 *a,
                       void(*func)(TCGv, TCGv))
 {
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 217a7d1f26..73f088be23 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -17,12 +17,23 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+
+static void gen_clz(TCGv ret, TCGv arg1)
+{
+    tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
+}
+
 static bool trans_clz(DisasContext *ctx, arg_clz *a)
 {
     REQUIRE_EXT(ctx, RVB);
     return gen_unary(ctx, a, gen_clz);
 }
 
+static void gen_ctz(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
+}
+
 static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -53,18 +64,41 @@ static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_eqv_tl);
 }
 
+static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_deposit_tl(ret, arg1, arg2,
+                       TARGET_LONG_BITS / 2,
+                       TARGET_LONG_BITS / 2);
+}
+
 static bool trans_pack(DisasContext *ctx, arg_pack *a)
 {
     REQUIRE_EXT(ctx, RVB);
     return gen_arith(ctx, a, EXT_NONE, gen_pack);
 }
 
+static void gen_packu(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_shri_tl(t, arg1, TARGET_LONG_BITS / 2);
+    tcg_gen_deposit_tl(ret, arg2, t, 0, TARGET_LONG_BITS / 2);
+    tcg_temp_free(t);
+}
+
 static bool trans_packu(DisasContext *ctx, arg_packu *a)
 {
     REQUIRE_EXT(ctx, RVB);
     return gen_arith(ctx, a, EXT_NONE, gen_packu);
 }
 
+static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_ext8u_tl(t, arg2);
+    tcg_gen_deposit_tl(ret, arg1, t, 8, TARGET_LONG_BITS - 8);
+    tcg_temp_free(t);
+}
+
 static bool trans_packh(DisasContext *ctx, arg_packh *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -107,6 +141,22 @@ static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
     return gen_unary(ctx, a, tcg_gen_ext16s_tl);
 }
 
+static void gen_sbop_mask(TCGv ret, TCGv shamt)
+{
+    tcg_gen_movi_tl(ret, 1);
+    tcg_gen_shl_tl(ret, ret, shamt);
+}
+
+static void gen_bset(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    TCGv t = tcg_temp_new();
+
+    gen_sbop_mask(t, shamt);
+    tcg_gen_or_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
 static bool trans_bset(DisasContext *ctx, arg_bset *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -119,6 +169,16 @@ static bool trans_bseti(DisasContext *ctx, arg_bseti *a)
     return gen_shifti(ctx, a, gen_bset);
 }
 
+static void gen_bclr(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    TCGv t = tcg_temp_new();
+
+    gen_sbop_mask(t, shamt);
+    tcg_gen_andc_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
 static bool trans_bclr(DisasContext *ctx, arg_bclr *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -131,6 +191,16 @@ static bool trans_bclri(DisasContext *ctx, arg_bclri *a)
     return gen_shifti(ctx, a, gen_bclr);
 }
 
+static void gen_binv(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    TCGv t = tcg_temp_new();
+
+    gen_sbop_mask(t, shamt);
+    tcg_gen_xor_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
 static bool trans_binv(DisasContext *ctx, arg_binv *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -143,6 +213,12 @@ static bool trans_binvi(DisasContext *ctx, arg_binvi *a)
     return gen_shifti(ctx, a, gen_binv);
 }
 
+static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    tcg_gen_shr_tl(ret, arg1, shamt);
+    tcg_gen_andi_tl(ret, ret, 1);
+}
+
 static bool trans_bext(DisasContext *ctx, arg_bext *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -155,6 +231,13 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
     return gen_shifti(ctx, a, gen_bext);
 }
 
+static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_not_tl(ret, arg1);
+    tcg_gen_shl_tl(ret, ret, arg2);
+    tcg_gen_not_tl(ret, ret);
+}
+
 static bool trans_slo(DisasContext *ctx, arg_slo *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -167,6 +250,13 @@ static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
     return gen_shifti(ctx, a, gen_slo);
 }
 
+static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_not_tl(ret, arg1);
+    tcg_gen_shr_tl(ret, ret, arg2);
+    tcg_gen_not_tl(ret, ret);
+}
+
 static bool trans_sro(DisasContext *ctx, arg_sro *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -203,6 +293,28 @@ static bool trans_grev(DisasContext *ctx, arg_grev *a)
     return gen_shift(ctx, a, gen_helper_grev);
 }
 
+static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
+{
+    TCGv source1 = tcg_temp_new();
+    TCGv source2;
+
+    gen_get_gpr(ctx, source1, a->rs1);
+
+    if (a->shamt == (TARGET_LONG_BITS - 8)) {
+        /* rev8, byte swaps */
+        tcg_gen_bswap_tl(source1, source1);
+    } else {
+        source2 = tcg_temp_new();
+        tcg_gen_movi_tl(source2, a->shamt);
+        gen_helper_grev(source1, source1, source2);
+        tcg_temp_free(source2);
+    }
+
+    gen_set_gpr(ctx, a->rd, source1);
+    tcg_temp_free(source1);
+    return true;
+}
+
 static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -226,6 +338,21 @@ static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
     return gen_shifti(ctx, a, gen_helper_gorc);
 }
 
+#define GEN_SHADD(SHAMT)                                       \
+static void gen_sh##SHAMT##add(TCGv ret, TCGv arg1, TCGv arg2) \
+{                                                              \
+    TCGv t = tcg_temp_new();                                   \
+                                                               \
+    tcg_gen_shli_tl(t, arg1, SHAMT);                           \
+    tcg_gen_add_tl(ret, t, arg2);                              \
+                                                               \
+    tcg_temp_free(t);                                          \
+}
+
+GEN_SHADD(1)
+GEN_SHADD(2)
+GEN_SHADD(3)
+
 #define GEN_TRANS_SHADD(SHAMT)                                             \
 static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
 {                                                                          \
@@ -237,6 +364,13 @@ GEN_TRANS_SHADD(1)
 GEN_TRANS_SHADD(2)
 GEN_TRANS_SHADD(3)
 
+static void gen_clzw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ext32u_tl(ret, arg1);
+    tcg_gen_clzi_tl(ret, ret, 64);
+    tcg_gen_subi_tl(ret, ret, 32);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -244,6 +378,12 @@ static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
     return gen_unary(ctx, a, gen_clzw);
 }
 
+static void gen_ctzw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
+    tcg_gen_ctzi_tl(ret, ret, 64);
+}
+
 static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -251,6 +391,12 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
     return gen_unary(ctx, a, gen_ctzw);
 }
 
+static void gen_cpopw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_ctpop_tl(ret, arg1);
+}
+
 static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -258,6 +404,14 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
     return gen_unary(ctx, a, gen_cpopw);
 }
 
+static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_ext16s_tl(t, arg2);
+    tcg_gen_deposit_tl(ret, arg1, t, 16, 48);
+    tcg_temp_free(t);
+}
+
 static bool trans_packw(DisasContext *ctx, arg_packw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -265,6 +419,15 @@ static bool trans_packw(DisasContext *ctx, arg_packw *a)
     return gen_arith(ctx, a, EXT_NONE, gen_packw);
 }
 
+static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_shri_tl(t, arg1, 16);
+    tcg_gen_deposit_tl(ret, arg2, t, 0, 16);
+    tcg_gen_ext32s_tl(ret, ret);
+    tcg_temp_free(t);
+}
+
 static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -349,6 +512,24 @@ static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
     return gen_shiftiw(ctx, a, gen_sro);
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
 static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -363,6 +544,24 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
     return gen_shiftiw(ctx, a, gen_rorw);
 }
 
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
+}
+
 static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -370,6 +569,12 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
     return gen_shiftw(ctx, a, gen_rolw);
 }
 
+static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    gen_helper_grev(ret, arg1, arg2);
+}
+
 static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -384,6 +589,12 @@ static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
     return gen_shiftiw(ctx, a, gen_grevw);
 }
 
+static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    gen_helper_gorcw(ret, arg1, arg2);
+}
+
 static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -398,6 +609,23 @@ static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
     return gen_shiftiw(ctx, a, gen_gorcw);
 }
 
+#define GEN_SHADD_UW(SHAMT)                                       \
+static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
+{                                                                 \
+    TCGv t = tcg_temp_new();                                      \
+                                                                  \
+    tcg_gen_ext32u_tl(t, arg1);                                   \
+                                                                  \
+    tcg_gen_shli_tl(t, t, SHAMT);                                 \
+    tcg_gen_add_tl(ret, t, arg2);                                 \
+                                                                  \
+    tcg_temp_free(t);                                             \
+}
+
+GEN_SHADD_UW(1)
+GEN_SHADD_UW(2)
+GEN_SHADD_UW(3)
+
 #define GEN_TRANS_SHADD_UW(SHAMT)                             \
 static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
                                     arg_sh##SHAMT##add_uw *a) \
@@ -411,6 +639,12 @@ GEN_TRANS_SHADD_UW(1)
 GEN_TRANS_SHADD_UW(2)
 GEN_TRANS_SHADD_UW(3)
 
+static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_add_tl(ret, arg1, arg2);
+}
+
 static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
 {
     REQUIRE_64BIT(ctx);
-- 
2.25.1


