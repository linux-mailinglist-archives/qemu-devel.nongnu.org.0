Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA323F7B1E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 19:04:32 +0200 (CEST)
Received: from localhost ([::1]:43258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIwKF-000152-0t
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 13:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwCq-0003qj-Cc
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:56:52 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:44934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwCj-0007Fm-Db
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:56:52 -0400
Received: by mail-lj1-x230.google.com with SMTP id s3so44733603ljp.11
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 09:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Ccr676R0L0N8dXIKtyLYzw3pvB6Fou3Jl1fzwXAYNY=;
 b=rUpDanV49CFcQDRv+fi/gq1vnEUqoYDyQJUARJceMORppicg+ToZS+QR4LUnCJyoB3
 3yn+Tylyprw3amoIrM8/ZhnrT82D8Vs2SnIuJhXrxMMXPTkDU8w58vrUY7ADaS46LVV9
 p2Vxt33fqjoIufmyZiMc45wwusHr1YoWtkHQsqTS5rPXCo1AnNrdytsUN9Awo5Kjrd3X
 5RNcMQ6nJ2Ggo5BW9qBpR/97u3yhzKwjlczVgrgqATat1R+NbqeXG/7Hxj23EnKeRwq/
 KDnkd9dV+vuYuo7vHyjXPbxo0InqNS5YPg83NlXkm9euxnFaHtJ1zsI3MRica6yhWPhC
 h5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Ccr676R0L0N8dXIKtyLYzw3pvB6Fou3Jl1fzwXAYNY=;
 b=izl6qfQfpmgDTrbVkCo9fmCmNiMmNsJJy8traaGtfTr2bTVwhrebzZZr2EOJCSHJub
 0bsNUTY7EYpzAeNqJTmDnjd5/jFdhvT/UFE/jZHN9IdXF4hdaavVrHUytSaHl1XeQGJk
 wwKiOy4XLBz8keOa3O+W55hBlzUJQxxbXiwHqlSmui6eCmeJp5ioXWtNdywk/wN6N9QF
 2T5IP52GtETaE+Hi2BQfSIU+gAnGJhfHA8adOB7qOr+Zp99dedt/KneP/+OqiimjowWF
 UsFy1GMy/w3zC20XP0UuXxhZvIhPGC8OOQ1uzpBQxtwIUI5SkE3ZRyFto1x5nirp7RkV
 YLSQ==
X-Gm-Message-State: AOAM533/EoFv9LXlYgXNRkwTM++I/4CEiVIwvEup7jb5g1ePBqjp376O
 jcWO5JUYFPxwq8FJfIc2yoAcbIym7St6Ydex
X-Google-Smtp-Source: ABdhPJzfn0znTAgxWUaPzpUE2EYJKAxyNUeBQ4c5rXvSxm9Y6eive28++QHlsZbgKv2Jmt+jGSGE3A==
X-Received: by 2002:a05:651c:512:: with SMTP id
 o18mr18896857ljp.199.1629910600762; 
 Wed, 25 Aug 2021 09:56:40 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id i8sm55686lfl.280.2021.08.25.09.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 09:56:40 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/14] target/riscv: Remove shift-one instructions
 (proposed Zbo in pre-0.93 draft-B)
Date: Wed, 25 Aug 2021 18:56:25 +0200
Message-Id: <20210825165634.32935-6-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825165634.32935-1-philipp.tomsich@vrull.eu>
References: <20210825165634.32935-1-philipp.tomsich@vrull.eu>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---

(no changes since v3)

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


