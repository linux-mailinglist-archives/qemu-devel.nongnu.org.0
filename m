Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963DF3F50B3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:48:14 +0200 (CEST)
Received: from localhost ([::1]:50306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIEzV-0001uH-J3
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEuQ-0000JF-GI
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:42:58 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:45584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEuO-0004RT-Bz
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:42:58 -0400
Received: by mail-lj1-x22e.google.com with SMTP id l18so25626718lji.12
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MLLe4Tu08mgHcORWS/pHdYGKSvTUe26JnB4KVXQw/Xg=;
 b=tJufbbrd2qKg5lXY+rgSsQ11+mFuaLeEocYfocWE26EadBSiT7xNb6AKP2ut8sRexd
 g8DwA0nCnGX0bgzEorvfNu5XXUbMf3NyjCoUd70HsDEqBWj73M+zyIX0+kka6xQ1J/Hj
 Y3imhO3+HuSCiEKfkkjSvqWGtuyb3UHNCOr62kHXkODQAbw69epzGAgWbDIVlVpIWG1R
 4Q11OF5sdBH1zMt3ZOoTGpE7qZDA/dzxD3eCM/mRllqWzr0syNEq4C/8rLtliW0zx2j7
 GtZBF+UkJ2P4fhoNi0fH/jPVL4BilBCGqKFHBh121Wtjz/1c3Qbyx5VHxq6EwJDB83Kq
 M0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MLLe4Tu08mgHcORWS/pHdYGKSvTUe26JnB4KVXQw/Xg=;
 b=N8ijfpatzXAWt6/hmsS/5sOluEsCgraHVlaiiHLww97GdJspIodQIzchd1ilrlDIvg
 qlz1CIsKjo53tlM4JuVhN8A/Zy52hSUY6tJHyWXNAt7GQud0keO55sHwUZGdV2KlcB6+
 l9NoohnTUha/pgJzrpVEt/yPkRqhU8hyeRobf0+K9/ZXwVB9eOXri8feotWdtg1kUnEz
 NYNeRO+3COTq/NSPxU6EBZvh1uOMpRdE5JS8UazDK6HhWw2NSBtkSSwDgjku+ukI7eIj
 kNNcVwLKkurL8gXXM/PhNe70e7xABygegBYlo+kumHvzuwolc1VplZtdfX1zahAj0Zjv
 M3Zg==
X-Gm-Message-State: AOAM532RuNegmfQME7nuWyIOZVP8LWxupmnP0FklNjPnY6zw0kle+gFh
 iyBwzCP8AHg/pfTcm9vOXREbKOHep3mcC9ns
X-Google-Smtp-Source: ABdhPJwQAOpwxsbX8PQvPClxnCy0wgMR3jeb4AL98Ev6bWNT/1MsIXtYwX9dlNF1HYmnWAzuGApNXg==
X-Received: by 2002:a2e:a30f:: with SMTP id l15mr29422591lje.153.1629744174493; 
 Mon, 23 Aug 2021 11:42:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id 25sm1443794ljw.31.2021.08.23.11.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:42:54 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/14] target/riscv: Remove the W-form instructions from Zbs
Date: Mon, 23 Aug 2021 20:42:38 +0200
Message-Id: <20210823184248.2209614-5-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823184248.2209614-1-philipp.tomsich@vrull.eu>
References: <20210823184248.2209614-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x22e.google.com
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
---

(no changes since v3)

Changes in v3:
- Remove the W-form instructions from Zbs in a separate commit.

 target/riscv/insn32.decode              |  7 ----
 target/riscv/insn_trans/trans_rvb.c.inc | 49 -------------------------
 2 files changed, 56 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 68b163b72d..9abdbcb799 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -716,10 +716,6 @@ cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
 
 packw      0000100 .......... 100 ..... 0111011 @r
 packuw     0100100 .......... 100 ..... 0111011 @r
-bsetw      0010100 .......... 001 ..... 0111011 @r
-bclrw      0100100 .......... 001 ..... 0111011 @r
-binvw      0110100 .......... 001 ..... 0111011 @r
-bextw      0100100 .......... 101 ..... 0111011 @r
 slow       0010000 .......... 001 ..... 0111011 @r
 srow       0010000 .......... 101 ..... 0111011 @r
 rorw       0110000 .......... 101 ..... 0111011 @r
@@ -727,9 +723,6 @@ rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
 gorcw      0010100 .......... 101 ..... 0111011 @r
 
-bsetiw     0010100 .......... 001 ..... 0011011 @sh5
-bclriw     0100100 .......... 001 ..... 0011011 @sh5
-binviw     0110100 .......... 001 ..... 0011011 @sh5
 sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index dcc7b6893d..975492d45c 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -279,55 +279,6 @@ static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
     return gen_arith(ctx, a, gen_packuw);
 }
 
-static bool trans_bsetw(DisasContext *ctx, arg_bsetw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_bset);
-}
-
-static bool trans_bsetiw(DisasContext *ctx, arg_bsetiw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_bset);
-}
-
-static bool trans_bclrw(DisasContext *ctx, arg_bclrw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_bclr);
-}
-
-static bool trans_bclriw(DisasContext *ctx, arg_bclriw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_bclr);
-}
-
-static bool trans_binvw(DisasContext *ctx, arg_binvw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_binv);
-}
-
-static bool trans_binviw(DisasContext *ctx, arg_binviw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_binv);
-}
-
-static bool trans_bextw(DisasContext *ctx, arg_bextw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_bext);
-}
-
 static bool trans_slow(DisasContext *ctx, arg_slow *a)
 {
     REQUIRE_64BIT(ctx);
-- 
2.25.1


