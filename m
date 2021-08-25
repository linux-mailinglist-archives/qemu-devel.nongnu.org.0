Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD74B3F7B11
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 19:00:34 +0200 (CEST)
Received: from localhost ([::1]:35344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIwGP-0003u6-Sb
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 13:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwCs-0003wF-1k
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:56:57 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:46684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwCm-0007JY-BE
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:56:53 -0400
Received: by mail-lj1-x231.google.com with SMTP id w4so43261550ljh.13
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 09:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RqhNQ9XQmyoPZQZThDiBFZvCNh+NuBamfI6xGvrdcEI=;
 b=ZJqqAsj6DqmNDKuhMLAQ/ZsgXUarDWplS9hVFnLj4L4FS3HQXvsvx60cvQMt4kkSwV
 xajQ0pOSkviEj1YddOpX32aHSYgSOlUUzwoO1N+b5Ukx116lQyNMSrF4Nra1seuzw9rz
 onzNH7asIaUUpqI9ostX+kuJFbAbtjluDEBAVtT+j9EobHpemtjCKc8ETMi8P8twdKL0
 7B9yotu+yDarGXNO8MZ8D1nHJRUfVx8VC3TiKORJPJt89EKhwDcTqOHHbF8Fa8TJarY0
 RBMZ0IRFJlAK3uKnb5XwMnN0rWx3Pp59i/2CXhOaKUEh0WgbBY5++A3oCEKZlz1vHaYv
 X7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RqhNQ9XQmyoPZQZThDiBFZvCNh+NuBamfI6xGvrdcEI=;
 b=G0I6qw8uObTAqCI1pu43xMs5uIVjI/l5XR+S25wTN8Fu/RahlnnIu6zvbBEXemZCr+
 OmAN7EmFnawJK4LM5GSoq1lv+AIoFQymbgGpnbuRRP+IPyoOspCZFUFf3dQTxRCr83Fz
 C87nZRPyqZEUKBtFP4rx6nisU5uWECojytMY1z0ChruGTD6yObSfTngemLICGBPGrMHm
 1R8wz8OXZWhzCWBBuxBjf1ZH/8wbizRYaD50WOIk15xD2MRhEiI45Xv12rl1Sr7KPslZ
 cwm1KkYDiKvcByf0lPNASfy7pvbPT3vWkBKZMKjTVVlIqGqeZ+DzpV06tO3ybdmolKN9
 uuXg==
X-Gm-Message-State: AOAM532eKgqvQGrHLyofOdpX7OM8/nzfgqEDcjg/JJRRRFFITq8VcYyI
 LuZzhY33VnMmpQTWukDmusgA0Xq2tOYqjjwg
X-Google-Smtp-Source: ABdhPJwclilMw+Hg8T4bdgPBgGMtPB93tkjHfqtDkMGSxgQfISjkV5c5MP8M4xZNl+2fsjXPg5rIpg==
X-Received: by 2002:a2e:a4ba:: with SMTP id g26mr36486563ljm.254.1629910606280; 
 Wed, 25 Aug 2021 09:56:46 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id i8sm55686lfl.280.2021.08.25.09.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 09:56:46 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/14] target/riscv: Add zext.h instructions to Zbb,
 removing pack/packu/packh
Date: Wed, 25 Aug 2021 18:56:32 +0200
Message-Id: <20210825165634.32935-13-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825165634.32935-1-philipp.tomsich@vrull.eu>
References: <20210825165634.32935-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x231.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index b283c1dccf..4949fb6fdb 100644
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
@@ -236,6 +218,20 @@ static bool trans_orc_b(DisasContext *ctx, arg_orc_b *a)
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
@@ -269,20 +265,6 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
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


