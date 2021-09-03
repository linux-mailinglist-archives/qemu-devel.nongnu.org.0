Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4968740008F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:29:24 +0200 (CEST)
Received: from localhost ([::1]:56004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9Fz-0005HW-Be
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mM91Y-0001xk-FF
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:14:28 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:38803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mM91W-0003dL-If
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:14:28 -0400
Received: by mail-lj1-x229.google.com with SMTP id g14so9558663ljk.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 06:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iMopUCg9QAzWlunfdm/GsDlTDvbpbsrVAzOY1rKxOCQ=;
 b=cjYr3duJgHt4zlpQnlRJPjIz4s7z7URU8GSeQbd5HdEwqbo3pap1MFeFxZNtHHX/ii
 gUEJl2lz48Vp3jJ0dnWlYjzQE04LRsNmwSx12Bihra8MxvnasLZsRcHhW4la7VhPoBPk
 6VM9IFcnhhH++5HCLjDbQBSjRjIjxkAVgRJ9oc25V8keFHjWKqGMeR3TkelwcZif2/TP
 yhjL8LeIPuo/Ollrucy9K1AAwTqjxc//p3hkgZyBeZZxE+vk7Ho9pRKO5T4t2WDQOpN+
 1KY8V3BFbXC+Q2vP+SkfY+xuoqjhL1XTA0zCXVxn5Yli8fAuEPIlu+TD8ATEQcLhyuTy
 t9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iMopUCg9QAzWlunfdm/GsDlTDvbpbsrVAzOY1rKxOCQ=;
 b=lUzjsziIN8GM2F8DjqkOgDKgpdni1iiasOykIHhH+zn8NcJgptoOvL8kQRK+0EinSn
 u9XKLLf29JuL+CHxcjoWWSynwP3y5GxyB+2X450hKURPkd9UQhmD7ehKzEmxZZqEc8wF
 JxyuQ+oTTervyh90rrg8CJTmk/+4llkuQrNFsdARp4eTkRYlafj3rjg4rjPKOpZDFvRe
 ABwGDDCKV6edndGePeNNXhq8HXv5Wq0tdzt2ZxmJ9zgQilMOdFoEgU4muXukiXLQrfah
 i1U+PRolqIHVMXkd+OLzdJtb5zB9NNZCv2ekdTbe6jG0HV0BvbRZgw0GtEH/Njdzmanx
 4TmQ==
X-Gm-Message-State: AOAM531S1LeUqVQm/oacIaCqikxv0inMJQkYhR9LuXlsKt1aqrRembL4
 oRejR1p8EGvvmEY7li3c1aJYuQ8rFLY+40BPcWQ=
X-Google-Smtp-Source: ABdhPJzgblvDtLnSdvCHgI+UqwlAPcd2QJ7H56twq4ULtG4vwVA23v30AL2vTcp6VWzbkWU2IphLFQ==
X-Received: by 2002:a2e:8495:: with SMTP id b21mr2906251ljh.4.1630674864879;
 Fri, 03 Sep 2021 06:14:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id n5sm577995ljj.97.2021.09.03.06.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 06:14:24 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 05/14] target/riscv: Remove shift-one instructions
 (proposed Zbo in pre-0.93 draft-B)
Date: Fri,  3 Sep 2021 15:14:08 +0200
Message-Id: <20210903131417.2248471-6-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903131417.2248471-1-philipp.tomsich@vrull.eu>
References: <20210903131417.2248471-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x229.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


