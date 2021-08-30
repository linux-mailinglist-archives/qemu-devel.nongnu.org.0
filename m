Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5F53FB491
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 13:29:18 +0200 (CEST)
Received: from localhost ([::1]:59564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKfTZ-0006IA-C3
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 07:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mKfGl-0007Hk-Bo
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:16:03 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:35803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mKfGe-0004Zz-9L
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:16:02 -0400
Received: by mail-lj1-x231.google.com with SMTP id y6so25258047lje.2
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 04:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GbzxKQ3M1hVzeA9EAree9zf6FrRRHm6uUvm7j80/Uek=;
 b=VsgieQeE628GKx7RaL0N9BZpnpoXijRLnigRcvSRdAtMlhUn3+WzF6Ivl2AimV9Xkc
 SvmVZdZLfofLN7hov1lwajeP2T8giZiiCjNMgM+v7/Iocnkm9iaFZzr3FCWZOKVUtIR8
 Rhn46YHjdzHYbam6EIQgdJO9NliOpW5uxCI2GmSRMXrb7G35DA/EkOvSIcuq2O9QCTMK
 rTHbqzIYjxb50X/gRlPngG+erAsJumAT6CK4STN9FFO0iLv/tV2LxXL7qlDwgECMzWx6
 QhudmPcfNjXDKIVopaz3jI+1pYcXJRMhwIhJYx8feTkwoUP+5t16NLPzInf1762nmac6
 v5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GbzxKQ3M1hVzeA9EAree9zf6FrRRHm6uUvm7j80/Uek=;
 b=mkJ9WnP5HMMIpNFip/mVuDd6QWAmQiKTdm9TbPvXFSGrsMnlQMHlWrCBKVpay/LycK
 dPgprPxi5ISI6/DJIW/NsZJPDu7DvZUzDPzM8EuSWrNk2Tm9sDEweLTvDqtrn9oQKChy
 OWyQVs6fU1fGTijRcJdq1Jf3Ti1R3RBp7DNjMQHfM06UTgfN8KKJcrfKeIn2t3UxEsGH
 sXlCLm/tkuY5JxirJS+Ze12wq2TIE4HHF37G/iA3XxwniNV+qHsLbJItO5dpOZmj18/q
 T4WCCV/4FALM8+drKHccqXlFNqc4dZtf4iH1l2rwWFPhzEdDaFCDle0vJ1E6YJ/4VTGo
 6XOQ==
X-Gm-Message-State: AOAM530rcUkA53FtnHf8312gd3j5nGVJswQ4aJ1386YtE7ghL7wIAMRq
 muiNljrgRkqJ3MvBsWifKePO+5oZLC+RiPLW
X-Google-Smtp-Source: ABdhPJyV10qAJ43RNNt73+9/S/dtuwu5crzBE+2fkGKLw1eP6sbiXnSTt8mpurYG70tA3ya3dx2MTA==
X-Received: by 2002:a05:651c:1142:: with SMTP id
 h2mr19513511ljo.304.1630322154431; 
 Mon, 30 Aug 2021 04:15:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id j3sm1790129ljq.84.2021.08.30.04.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 04:15:54 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 12/14] target/riscv: Add zext.h instructions to Zbb,
 removing pack/packu/packh
Date: Mon, 30 Aug 2021 13:15:10 +0200
Message-Id: <20210830111511.1905048-13-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
References: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x231.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v4)

Changes in v4:
- Renamed RV32 variant to zext_h_32.
- Reordered trans_zext_h_{32,64} to be next to each other.

Changes in v3:
- Moved zext.h-addition & pack*-removal to a separate commit.

 target/riscv/insn32.decode              | 12 ++++---
 target/riscv/insn_trans/trans_rvb.c.inc | 46 ++++++++-----------------
 target/riscv/translate.c                | 40 ---------------------
 3 files changed, 21 insertions(+), 77 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 017eb50a49..abf794095a 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -691,6 +691,9 @@ rori       01100 ............ 101 ..... 0010011 @sh
 sext_b     011000 000100 ..... 001 ..... 0010011 @r2
 sext_h     011000 000101 ..... 001 ..... 0010011 @r2
 xnor       0100000 .......... 100 ..... 0110011 @r
+# The encoding for zext.h differs between RV32 and RV64.
+# zext_h_32 denotes the RV32 variant.
+zext_h_32  0000100 00000 ..... 100 ..... 0110011 @r2
 
 # *** RV64 Zbb Standard Extension (in addition to RV32 Zbb) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
@@ -703,15 +706,14 @@ rev8_64    011010 111000 ..... 101 ..... 0010011 @r2
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
index 573299d29f..7da01772a1 100644
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
@@ -238,6 +220,20 @@ static bool trans_orc_b(DisasContext *ctx, arg_orc_b *a)
     return gen_unary(ctx, a, &gen_orc_b);
 }
 
+static bool trans_zext_h_32(DisasContext *ctx, arg_zext_h_32 *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, &tcg_gen_ext16u_tl);
+}
+
+static bool trans_zext_h_64(DisasContext *ctx, arg_zext_h_64 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, &tcg_gen_ext16u_tl);
+}
+
 
 #define GEN_TRANS_SHADD(SHAMT)                                             \
 static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
@@ -271,20 +267,6 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
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


