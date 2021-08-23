Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931CB3F4EB5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:49:07 +0200 (CEST)
Received: from localhost ([::1]:43834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mID89-000451-Kq
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mID0N-0006U8-5m
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:40:59 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:39454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mID0K-0006Of-6X
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:40:58 -0400
Received: by mail-lf1-x136.google.com with SMTP id f10so24361532lfv.6
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xrXcUMrs8Xv2nZ8YaSP5ZsRlyapXS9op1ZWF125qqm0=;
 b=NfxUwD4axNkVjUXTbh50Z7xV84LDYONcTD+En71l2zkgWz0UOFm1k3T0Utz8TomdvG
 zWWxeRDSMRs3ndiCQ+dGtiKEnbb+3aP7VBIbwPFI0MElHoU6AZZ0NJyDpyePGRGOdMLE
 P0TAs+n9VacMfNRsZaELjqGNVYLqZOkeBhG1gpqGzI8GXTxGY63QiOLut3hCfdaebyyd
 FpL+FQ7Pje9LIAMVy9sgpIz4LT/C40UylK0SVDxXbPtTWxvHONLp2ehIwQcJf0DJ+iAx
 YgCIxcj+D8Ul1xq+GXnLJBxTTA0hv4fhMdlO0PlfxNomdQfW5kAS/WlKGTELy0AKKmaK
 P3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xrXcUMrs8Xv2nZ8YaSP5ZsRlyapXS9op1ZWF125qqm0=;
 b=Px0dW4D2wiTCHYgf5AtyU1+tXxs7yZdo+cPme2QGd9xoKN5xWss682M9pdlipYTR6+
 fCrP7QPVCkn56XzRe/ZBuc2mk1cvqX13hS4yOXBS89id4bfmtBj3XSOAV95VZhob8T11
 VZ6JVG+B0PsSxLGci6695hN3C8Y7tVZnFvmr4L6rrLxpb8FyGQqBbLYZev2U/fpjnf7N
 yxvur5yEwIWv16Z/gqYgjlNp2X/MtTii6WIN/6FYYheRctn2EXyfPqk7PgXL1tZaJICJ
 gUtVyyLi3GgwYW6JF5xR3W2hM3LlaXZd4AFNvK9v9PXE9pJ/HGqAXnPt18yB4irTTwao
 GIPg==
X-Gm-Message-State: AOAM532pfbLaeb6bgutqEPvv1b07A1GW0OYfVSW5H4adxv4SlLUtNmfo
 kZL8MvQcTeE92NvNFAmykTJMpxU57Bcuu6LT
X-Google-Smtp-Source: ABdhPJycJnw4dCSFtrmVr5hdvF4e1eNMAZFHnIHntGMb1qZgIkGFjiN5hMa+UiD3wja6ROcAfmzwlg==
X-Received: by 2002:ac2:456d:: with SMTP id k13mr24987324lfm.90.1629736850948; 
 Mon, 23 Aug 2021 09:40:50 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id z5sm1491671lfs.126.2021.08.23.09.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:40:50 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/15] target/riscv: Add zext.h instructions to Zbb,
 removing pack/packu/packh
Date: Mon, 23 Aug 2021 18:40:35 +0200
Message-Id: <20210823164038.2195113-13-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 1.0.0 version of Zbb does not contain pack/packu/packh. However, a
zext.h instruction is provided (built on pack/packh from pre-0.93
draft-B) is available.

This commit adds zext.h and removes the pack* instructions.

Note that the encodings for zext.h are different between RV32 and
RV64, which is handled through REQUIRE_32BIT.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

Changes in v3:
- Moved zext.h-addition & pack*-removal to a separate commit.

 target/riscv/insn32.decode              | 10 +++---
 target/riscv/insn_trans/trans_rvb.c.inc | 45 +++++++------------------
 target/riscv/translate.c                | 40 ----------------------
 3 files changed, 18 insertions(+), 77 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 72b73c6df2..0fd5afc289 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -689,6 +689,7 @@ rori       01100 ............ 101 ..... 0010011 @sh
 sext_b     011000 000100 ..... 001 ..... 0010011 @r2
 sext_h     011000 000101 ..... 001 ..... 0010011 @r2
 xnor       0100000 .......... 100 ..... 0110011 @r
+zext_h     0000100 00000 ..... 100 ..... 0110011 @r2
 
 # *** RV64 Zbb Standard Extension (in addition to RV32 Zbb) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
@@ -701,15 +702,14 @@ rev8_64    011010 111000 ..... 101 ..... 0010011 @r2
 rolw       0110000 .......... 001 ..... 0111011 @r
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 rorw       0110000 .......... 101 ..... 0111011 @r
+# The encoding for zext.h differs between RV32 and RV64.
+# When executing on RV64, the encoding used in RV32 is an illegal
+# instruction, so we use different handler functions to differentiate.
+zext_h_64  0000100 00000 ..... 100 ..... 0111011 @r2
 
 # *** RV32B Standard Extension ***
-pack       0000100 .......... 100 ..... 0110011 @r
-packu      0100100 .......... 100 ..... 0110011 @r
-packh      0000100 .......... 111 ..... 0110011 @r
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
-packw      0000100 .......... 100 ..... 0111011 @r
-packuw     0100100 .......... 100 ..... 0111011 @r
 
 # *** RV32 Zbc Standard Extension ***
 clmul      0000101 .......... 001 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 9f567cd69e..b134abd263 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -78,24 +78,6 @@ static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
     return gen_arith(ctx, a, tcg_gen_eqv_tl);
 }
 
-static bool trans_pack(DisasContext *ctx, arg_pack *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_pack);
-}
-
-static bool trans_packu(DisasContext *ctx, arg_packu *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packu);
-}
-
-static bool trans_packh(DisasContext *ctx, arg_packh *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packh);
-}
-
 static bool trans_min(DisasContext *ctx, arg_min *a)
 {
     REQUIRE_ZBB(ctx);
@@ -225,6 +207,12 @@ static bool trans_orc_b(DisasContext *ctx, arg_orc_b *a)
     return gen_unary(ctx, a, &gen_orc_b);
 }
 
+static bool trans_zext_h(DisasContext *ctx, arg_sext_h *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, &tcg_gen_ext16u_tl);
+}
 
 #define GEN_TRANS_SHADD(SHAMT)                                             \
 static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
@@ -258,20 +246,6 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
     return gen_unary(ctx, a, gen_cpopw);
 }
 
-static bool trans_packw(DisasContext *ctx, arg_packw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packw);
-}
-
-static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packuw);
-}
-
 static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -348,6 +322,13 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
     return true;
 }
 
+static bool trans_zext_h_64(DisasContext *ctx, arg_sext_h *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, &tcg_gen_ext16u_tl);
+}
+
 static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
 {
     REQUIRE_ZBC(ctx);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f16ac8bb1a..639f34b8f6 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -536,29 +536,6 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
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
 static void gen_sbop_mask(TCGv ret, TCGv shamt)
 {
     tcg_gen_movi_tl(ret, 1);
@@ -635,23 +612,6 @@ static void gen_cpopw(TCGv ret, TCGv arg1)
     tcg_gen_ctpop_tl(ret, arg1);
 }
 
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
 static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
 {
     TCGv_i32 t1 = tcg_temp_new_i32();
-- 
2.25.1


