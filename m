Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201524003ED
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:10:05 +0200 (CEST)
Received: from localhost ([::1]:54730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMChY-0004qA-2O
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMCYz-0007Jf-MJ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:01:13 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:33743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMCYx-000534-Lh
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:01:13 -0400
Received: by mail-lj1-x22b.google.com with SMTP id s12so10572615ljg.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MlvZycGLKdvFwSDPG1Qq4HAJkbFd1XEZk3GKCDbKdoY=;
 b=Tj+cfKFMfYtFHRjGIXh03FDK+rX7QtmG5lvjZNrGhtjT2hjsYUCYZRkgy8Xl/XUtl6
 UnPWXcGUsmsjU/oPJ7nD4XiCDKRy/YTxPkDPZPfdn3ZvfxxbMXhjmK2ZDZZDwpDjopgF
 HdvkxmzXBAWhpsRUz07Mjv2YGotXCJZyIMiIaix38yE7juGxkE3+AFAYtiJ4TEYvg9oD
 BTkOlvqRLhKJHAdhBhirH+JGzGLzZDj3FwkyrpEjc8o+02bNXrHd0LUA58aGtFayvG2E
 k3s/0YMjbGYkb0Bq6qm3rxArUBlTRKdAbH4u/0aPNZ93hHuvTvJSiSwyNiv4OTC/xXVG
 CCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MlvZycGLKdvFwSDPG1Qq4HAJkbFd1XEZk3GKCDbKdoY=;
 b=cBkTBbTj7PjxEf/SUxNN/0Dr3DkntVmnsvdqnn5QhwfxZisooP9eGLTvJGCp4SBHg0
 Cu5j/aQeX1ls0e7rt5KbnkjZ89rdWUixRi2HTJqMKEGyRr2ryv9x6bD6hP8QkOO/yzlU
 fY7YbmPbH/hqqJkWK4nQYavdB00XJiwdZsQXnMdGtWMlv4WVXMYy2PnE+FiSAMtNXTSe
 2J2ou9/AcLf8AhQT9cBPF10KbycAR3gu22DTnaQPl3XypuxtGFT1/+/bESCB7Bz+c/H1
 Gdvs2qFp9OMomiSirL5FPYc+IWrb/EFGA29c6+2riSvkBrFYJTuOSXRdL7Ubxbie604q
 I4Sw==
X-Gm-Message-State: AOAM533MzNmZFHeu7LA1FtCbnB6m6Xb7rNAE76Fq2Yum6ZwKGcRjBihA
 KHoMNK37za+asj+XPNM/3E3jgjLLSiUO4ckrYVM=
X-Google-Smtp-Source: ABdhPJyMat31uGB9NTEwLlXVBrTZCnCVgTThX1gFA0LYi+5+RXbavqL6kDwEjep51WeTVdOSbQhUrg==
X-Received: by 2002:a2e:8457:: with SMTP id u23mr18050ljh.3.1630688468289;
 Fri, 03 Sep 2021 10:01:08 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id c3sm628401ljj.77.2021.09.03.10.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:01:07 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 04/14] target/riscv: Remove the W-form instructions from Zbs
Date: Fri,  3 Sep 2021 19:00:50 +0200
Message-Id: <20210903170100.2529121-5-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903170100.2529121-1-philipp.tomsich@vrull.eu>
References: <20210903170100.2529121-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x22b.google.com
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

Zbs 1.0.0 (just as the 0.93 draft-B before) does no provide for W-form
instructions for Zbs (single-bit instructions).  Remove them.

Note that these instructions had already been removed for the 0.93
version of the draft-B extenstion and have not been present in the
binutils patches circulating in January 2021.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v3)

Changes in v3:
- Remove the W-form instructions from Zbs in a separate commit.

 target/riscv/insn32.decode              |  7 ----
 target/riscv/insn_trans/trans_rvb.c.inc | 56 -------------------------
 2 files changed, 63 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 86f1166dab..b499691a9e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -717,10 +717,6 @@ cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
 
 packw      0000100 .......... 100 ..... 0111011 @r
 packuw     0100100 .......... 100 ..... 0111011 @r
-bsetw      0010100 .......... 001 ..... 0111011 @r
-bclrw      0100100 .......... 001 ..... 0111011 @r
-binvw      0110100 .......... 001 ..... 0111011 @r
-bextw      0100100 .......... 101 ..... 0111011 @r
 slow       0010000 .......... 001 ..... 0111011 @r
 srow       0010000 .......... 101 ..... 0111011 @r
 rorw       0110000 .......... 101 ..... 0111011 @r
@@ -728,9 +724,6 @@ rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
 gorcw      0010100 .......... 101 ..... 0111011 @r
 
-bsetiw     0010100 .......... 001 ..... 0011011 @sh5
-bclriw     0100100 .......... 001 ..... 0011011 @sh5
-binviw     0110100 .......... 001 ..... 0011011 @sh5
 sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 77114889de..0763d0f836 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -418,62 +418,6 @@ static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
     return gen_arith(ctx, a, EXT_NONE, gen_packuw);
 }
 
-static bool trans_bsetw(DisasContext *ctx, arg_bsetw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w = true;
-    return gen_shift(ctx, a, EXT_NONE, gen_bset);
-}
-
-static bool trans_bsetiw(DisasContext *ctx, arg_bsetiw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w = true;
-    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bset);
-}
-
-static bool trans_bclrw(DisasContext *ctx, arg_bclrw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w = true;
-    return gen_shift(ctx, a, EXT_NONE, gen_bclr);
-}
-
-static bool trans_bclriw(DisasContext *ctx, arg_bclriw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w = true;
-    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bclr);
-}
-
-static bool trans_binvw(DisasContext *ctx, arg_binvw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w = true;
-    return gen_shift(ctx, a, EXT_NONE, gen_binv);
-}
-
-static bool trans_binviw(DisasContext *ctx, arg_binviw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w = true;
-    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_binv);
-}
-
-static bool trans_bextw(DisasContext *ctx, arg_bextw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w = true;
-    return gen_shift(ctx, a, EXT_NONE, gen_bext);
-}
-
 static bool trans_slow(DisasContext *ctx, arg_slow *a)
 {
     REQUIRE_64BIT(ctx);
-- 
2.25.1


