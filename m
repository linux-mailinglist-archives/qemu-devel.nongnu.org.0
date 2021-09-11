Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E394B4078AA
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 16:13:15 +0200 (CEST)
Received: from localhost ([::1]:58654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP3ko-0003dD-Vs
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 10:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YU-0002Ro-Os
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:32 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:41965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YR-0005eL-W6
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:30 -0400
Received: by mail-lf1-x129.google.com with SMTP id a4so10348268lfg.8
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BI32t+GA2AajnJ7k1xw3Eik8p4neSIW8cX5+uT2eNGI=;
 b=DzG58SWl/58c7mPZzd0dPrmQhbAgYSx2W9wGVCpRJnJOYPXzOgGiB8rW4xbrsrpoU1
 phxU2y4eePSqEIljqKK16khQsBtbn8NVNfVoC1C1TTCP5LzKxOjh9S/B4Y3eZnU84x7H
 VGzBL18kZyG1kKjkjLFqyLxfeOjxjbgRKqM7zoAUS1H2Z0Kwdqo9sRcR2lWPTbPuU8vY
 4LJ8My7bLax8BSQFd1aI35egVHDM1OuZdctXHbbTyzNrm0H9IGvIw9k9AjrlEfMnztTH
 E2i6JOvAwobuFqr8tpi3x6G/IqrqlfvkRVWqiqaRuoEwEB0mtt0ey/T+XXqiFDw1rXiz
 Jnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BI32t+GA2AajnJ7k1xw3Eik8p4neSIW8cX5+uT2eNGI=;
 b=rZ7bhTvnhm4zUw42yOaO6JeavsOyZyzUuZ6JQPjNYIQhjDuYQzi+qDWuNRY8/vA7GI
 PyPouglICXbA8HUVrZG709SjqSDxKWMXLSP6fiUFUbeT59nubcVZNu2/BwCkQcQe3kbv
 Pt1TQR+evJl7TOMTSalrCZPPKprj5lemkqubtjmGd7NI9Ehktf2dY8IUcV0yUs70vRYb
 fVpLYj7RkUsQCkJqQUeE+yMhWmUyGS+r/MQcFgNDiUQMb78FmBEvCTlEqwZ59yuJPUeJ
 6VclcRNVd/Zjc9f4ZDcoM6yh81NXoAc9NXjTUCS0CXTgNh9CRdleMoimtYlZspMmj65j
 DuiA==
X-Gm-Message-State: AOAM530EJAdquyugZZ3QxnEr2aNO6mSUjWOYlOLt/OdK7KlXTzB6fA4a
 vIqslE1VZFQfwvyt/wDfrcFFOZkAoMeHtOhi
X-Google-Smtp-Source: ABdhPJzIwNyLTAZsDHjeUBSHgjR+fF19TWfk7zXN0jb5om8Z2heCpdZYBuVhqipIAR5WdsD6JU0vIA==
X-Received: by 2002:ac2:48bc:: with SMTP id u28mr2282926lfg.370.1631368825695; 
 Sat, 11 Sep 2021 07:00:25 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u15sm213052lfk.26.2021.09.11.07.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 07:00:25 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 07/16] target/riscv: Remove shift-one instructions
 (proposed Zbo in pre-0.93 draft-B)
Date: Sat, 11 Sep 2021 16:00:07 +0200
Message-Id: <20210911140016.834071-8-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x129.google.com
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
 Kito Cheng <kito.cheng@sifive.com>, Bin Meng <bmeng.cn@gmail.com>,
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
Acked-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v3)

Changes in v3:
- Remove shift-one instructions in a separate commit.

 target/riscv/insn32.decode              |  8 ---
 target/riscv/insn_trans/trans_rvb.c.inc | 70 -------------------------
 2 files changed, 78 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b499691a9e..e0f6e315a2 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -693,8 +693,6 @@ bset       0010100 .......... 001 ..... 0110011 @r
 bclr       0100100 .......... 001 ..... 0110011 @r
 binv       0110100 .......... 001 ..... 0110011 @r
 bext       0100100 .......... 101 ..... 0110011 @r
-slo        0010000 .......... 001 ..... 0110011 @r
-sro        0010000 .......... 101 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
@@ -704,8 +702,6 @@ bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
 binvi      01101. ........... 001 ..... 0010011 @sh
 bexti      01001. ........... 101 ..... 0010011 @sh
-sloi       00100. ........... 001 ..... 0010011 @sh
-sroi       00100. ........... 101 ..... 0010011 @sh
 rori       01100. ........... 101 ..... 0010011 @sh
 grevi      01101. ........... 101 ..... 0010011 @sh
 gorci      00101. ........... 101 ..... 0010011 @sh
@@ -717,15 +713,11 @@ cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
 
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
index fbe1c3b410..a5bf40f95b 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -237,44 +237,6 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bext);
 }
 
-static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_not_tl(ret, arg1);
-    tcg_gen_shl_tl(ret, ret, arg2);
-    tcg_gen_not_tl(ret, ret);
-}
-
-static bool trans_slo(DisasContext *ctx, arg_slo *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_NONE, gen_slo);
-}
-
-static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_slo);
-}
-
-static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_not_tl(ret, arg1);
-    tcg_gen_shr_tl(ret, ret, arg2);
-    tcg_gen_not_tl(ret, ret);
-}
-
-static bool trans_sro(DisasContext *ctx, arg_sro *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_ZERO, gen_sro);
-}
-
-static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_sro);
-}
-
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -420,38 +382,6 @@ static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
     return gen_arith(ctx, a, EXT_NONE, gen_packuw);
 }
 
-static bool trans_slow(DisasContext *ctx, arg_slow *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w = true;
-    return gen_shift(ctx, a, EXT_NONE, gen_slo);
-}
-
-static bool trans_sloiw(DisasContext *ctx, arg_sloiw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w = true;
-    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_slo);
-}
-
-static bool trans_srow(DisasContext *ctx, arg_srow *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w = true;
-    return gen_shift(ctx, a, EXT_ZERO, gen_sro);
-}
-
-static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w = true;
-    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_sro);
-}
-
 static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
 {
     TCGv_i32 t1 = tcg_temp_new_i32();
-- 
2.25.1


