Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6834C3F4EAE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:48:12 +0200 (CEST)
Received: from localhost ([::1]:41270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mID7L-0002Jg-Eq
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mID0F-0006EN-6W
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:40:51 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:38490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mID0B-0006KY-C4
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:40:50 -0400
Received: by mail-lj1-x230.google.com with SMTP id c12so32617060ljr.5
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gPhKrJMCI+/hHEYZKIRNImGP0IHRP8SO8bk5wT7Weu4=;
 b=oDa+b0aHsNNAUGrqWUnB+GBQ3EmWqrRkRQJV4Y7wX1eE7jGE2Z8D2XCeK3qP3ahV2W
 tPGWIRap3xq7TBQ2qdlJUO9gOYId9KrKnreHVe12TNJa/wLgsEW/GP7M0G7ho+7/2VgK
 1iUVT5ctTWpGlR9oy9+EljxCom22EYPWsqXsTtcdAIUg3Cc4zU2CGlZnMJ8g/8h5vrps
 uDtrmPfnevZk6Dpgkj6clMbxsPqoY3z1mbLfI0cr4c6a+6KnJmilvShQtBgX3vH9Xr2H
 tY9Vv0zsFLLxcRO515cojTNlMdAbUybF/prAYYHpY1kdys6aRjU9tNO3AHw/zKwI9wvh
 rekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gPhKrJMCI+/hHEYZKIRNImGP0IHRP8SO8bk5wT7Weu4=;
 b=CLaLjbLcZQrT5hldhq47/eaxPhvCr35PRAaRC54rwDDIk8efo3S3iIQm4XW3tC7bjo
 1kJwLMD314mswdsMnHS5KdypVOhU1ypWZOnW/hV/hVx3C/lhJ/s32eKksEDWAhFfJW4j
 Yqh5/H16xorJwj5qrwFbQAl4augJQtPnRsIuOzbrPrfLDdd5ISiIhtZHSm16t7aVULWc
 kO6+0txDQYFe002sQp2mR0Y2/+DFg502bQr1wh5j2zxCZKWNarRF7JcRMZiL0KyptrO5
 TTlfrIkwBj7lnRL+m/zNoEsCFk1cmGYz+Cqn+7qLcCbH84lMbogDBYdY4oN/eRG29mHJ
 goYQ==
X-Gm-Message-State: AOAM532ggfkEFWW1Ibulf5nPNy7DqCngwCcrdieMkQVm4SQ1fWuMOurc
 hO2v0/GtwTEVqsdHjQZ/6q7fC66kUXjeabEX
X-Google-Smtp-Source: ABdhPJw/0uK8DP3z0YmVU4NdalM7q56f2r+0vQdteP8SM8riog9CRDSfzHtn1Vtnqf7phcG0UWhk4g==
X-Received: by 2002:a2e:834e:: with SMTP id l14mr27612217ljh.458.1629736845652; 
 Mon, 23 Aug 2021 09:40:45 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id z5sm1491671lfs.126.2021.08.23.09.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:40:45 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/15] target/riscv: Remove shift-one instructions
 (proposed Zbo in pre-0.93 draft-B)
Date: Mon, 23 Aug 2021 18:40:28 +0200
Message-Id: <20210823164038.2195113-6-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x230.google.com
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

The Zb[abcs] ratification package does not include the proposed
shift-one instructions. There currently is no clear plan to whether
these (or variants of them) will be ratified as Zbo (or a different
extension) or what the timeframe for such a decision could be.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

Changes in v3:
- Remove shift-one instructions in a separate commit.

 target/riscv/insn32.decode              |  8 ----
 target/riscv/insn_trans/trans_rvb.c.inc | 52 -------------------------
 target/riscv/translate.c                | 14 -------
 3 files changed, 74 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 9abdbcb799..7e38477553 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -692,8 +692,6 @@ bset       0010100 .......... 001 ..... 0110011 @r
 bclr       0100100 .......... 001 ..... 0110011 @r
 binv       0110100 .......... 001 ..... 0110011 @r
 bext       0100100 .......... 101 ..... 0110011 @r
-slo        0010000 .......... 001 ..... 0110011 @r
-sro        0010000 .......... 101 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
@@ -703,8 +701,6 @@ bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
 binvi      01101. ........... 001 ..... 0010011 @sh
 bexti      01001. ........... 101 ..... 0010011 @sh
-sloi       00100. ........... 001 ..... 0010011 @sh
-sroi       00100. ........... 101 ..... 0010011 @sh
 rori       01100. ........... 101 ..... 0010011 @sh
 grevi      01101. ........... 101 ..... 0010011 @sh
 gorci      00101. ........... 101 ..... 0010011 @sh
@@ -716,15 +712,11 @@ cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
 
 packw      0000100 .......... 100 ..... 0111011 @r
 packuw     0100100 .......... 100 ..... 0111011 @r
-slow       0010000 .......... 001 ..... 0111011 @r
-srow       0010000 .......... 101 ..... 0111011 @r
 rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
 gorcw      0010100 .......... 101 ..... 0111011 @r
 
-sloiw      0010000 .......... 001 ..... 0011011 @sh5
-sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 975492d45c..ac706349f5 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -162,30 +162,6 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
     return gen_shifti(ctx, a, gen_bext);
 }
 
-static bool trans_slo(DisasContext *ctx, arg_slo *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_slo);
-}
-
-static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_slo);
-}
-
-static bool trans_sro(DisasContext *ctx, arg_sro *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_sro);
-}
-
-static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_sro);
-}
-
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -279,34 +255,6 @@ static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
     return gen_arith(ctx, a, gen_packuw);
 }
 
-static bool trans_slow(DisasContext *ctx, arg_slow *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_slo);
-}
-
-static bool trans_sloiw(DisasContext *ctx, arg_sloiw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_slo);
-}
-
-static bool trans_srow(DisasContext *ctx, arg_srow *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_sro);
-}
-
-static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_sro);
-}
-
 static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
 {
     REQUIRE_64BIT(ctx);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6983be5723..fc22ae82d0 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -595,20 +595,6 @@ static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
     tcg_gen_andi_tl(ret, ret, 1);
 }
 
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
 static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
 {
     TCGv source1 = tcg_temp_new();
-- 
2.25.1


