Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDEC40789A
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 16:03:29 +0200 (CEST)
Received: from localhost ([::1]:36450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP3bN-0005En-2W
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 10:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YT-0002Qs-E9
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:30 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:34403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YQ-0005dn-LT
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:29 -0400
Received: by mail-lf1-x135.google.com with SMTP id l11so10395253lfe.1
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 07:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/KjmmVEmbtJ48GRreoJSwiA90gpq1J5MAiYqZ/CYqqY=;
 b=EmAisuqJKJtiXddh6q58qO5M3MdwTg8GSQE6pmijFOXtH58UcSzdT9YmzmKCW1Izm2
 gVc+fDx9upIfAkA5B/v4iLI6CZHv6PV58SsCorfImSO/8jXhVQPbf0sbmhB929//GY1C
 Mg2Fy9zf8O04JFvgd3SgdK2weF4vSh9k+WjEpuC5CIlXQ+mOHazg+qZQGuCL264dB/86
 ByXIlVQ+qKovOFCw1iBSYz39Swq4b4X1HgCMJ+RaoHjJfauf7iE+KVEAjyPtf3BBfQzg
 IcpfR5oErVPakbFSjC1Egyqexz8ahrb23pEaDKa+vtN33FysDvUb7mk6tPZdjZqSnSho
 St3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/KjmmVEmbtJ48GRreoJSwiA90gpq1J5MAiYqZ/CYqqY=;
 b=tpaNeVVghUxTj4pV8XeEtKdIKrnvVmyBTDutJ1lrmzRYkC+n8PzSO4DFnP5HAqUfOI
 jP8wSUPsf6q5Yl4YtEp8XNM4odqPXa3DX+hDS7QOezv0MZcqlKScx0cgh5p1JFqkbp9W
 imLGKTy8RFtO8ci9rOgY4zi3MrX8bmN7afKKJBfK+f1nQOvLegq7ycd+qVASn0k68kC2
 NJRmblBfXXAUyf2imXNybgBCLvI7k+FEwg9JcB+Woafyc5xcCmykAG3SmaX7CfLb3oQk
 8S8fPMZanw66MSyAlMF4yw0mftou51Le9Y5yfD5iOpQnhpzZjhmtP7V5z+8kxRiNxqS8
 PfrQ==
X-Gm-Message-State: AOAM530Twwk7//U3/xicEnekwRGXwGO9OdpBhMedo7+qUsMSVGLNXEES
 8uzhEepra1GvkJEyYkXqPLt6kKrz6XaFrMui
X-Google-Smtp-Source: ABdhPJyDvagMqG0i4cbpYHmGGwmKdoI/c6kjYV3Rc/SiTFxt9U2N7tDtUpZwLJEBft96N1rxipXchg==
X-Received: by 2002:a05:6512:31e:: with SMTP id
 t30mr2182337lfp.218.1631368824928; 
 Sat, 11 Sep 2021 07:00:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u15sm213052lfk.26.2021.09.11.07.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 07:00:24 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 06/16] target/riscv: Remove the W-form instructions from
 Zbs
Date: Sat, 11 Sep 2021 16:00:06 +0200
Message-Id: <20210911140016.834071-7-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x135.google.com
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

Zbs 1.0.0 (just as the 0.93 draft-B before) does not provide for W-form
instructions for Zbs (single-bit instructions).  Remove them.

Note that these instructions had already been removed for the 0.93
version of the draft-B extention and have not been present in the
binutils patches circulating in January 2021.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Bin Meng <bmeng.cn@gmail.com>
---

Changes in v11:
- Fix typos in commit message.

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
index fd549c7b0f..fbe1c3b410 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -420,62 +420,6 @@ static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
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


