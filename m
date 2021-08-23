Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E84AD3F5033
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:14:06 +0200 (CEST)
Received: from localhost ([::1]:43062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIESU-000098-09
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEQH-0006Rx-Eh
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:11:49 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:40661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEQ9-0008KX-53
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:11:49 -0400
Received: by mail-lf1-x132.google.com with SMTP id v19so14453577lfo.7
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MLLe4Tu08mgHcORWS/pHdYGKSvTUe26JnB4KVXQw/Xg=;
 b=VJ63TLT12o7g2wSyQhrnve9IvulVszlBU/qgmDyfpvI3HQQfeRbTKDdWmJyG3jbGcw
 0X7CYscqvfqgFE1Ohbtu/d3R4orlRDPn08YklPT29zaugrkPWMKlUHNJxYallAbCWP2Y
 NtJctWbi9vuWmPH2xi3o4A9zFYC9yZiism3e54SSz0JiQQNfc0yTFYu55ZhT1zjswM6S
 kScjDt/HEglrEIs4XNTDoVZ4q3qV8heHW6/DMhjx6zx7pGyeOADtK4ZKSItaBj1TZQEb
 nCvqkdTDMOSfBCc0458cjqwkTJ1hn9zf3UU6B7JiOSMPQdX/6/ySDQx6URYMZVeFv0So
 CQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MLLe4Tu08mgHcORWS/pHdYGKSvTUe26JnB4KVXQw/Xg=;
 b=rvMx7yxC4SPalok0h1mqDsLPsBN1Q35x+wwPDK2EMYtz1aa/B5F+kWcZ6QGPlw/qsq
 o8h3Lipfru85DpMRaV3tfrpJFtXO8ruoYvN+FCduaF7u61RVhndUFxZ2ge1JMs5VNU17
 nxX03na4PMRIscKB8oXaUKHoJ8gzBkL8YcbzZz94XQK8srduavfqkZMN6IfgYEi6xO6Q
 p6EwGS4OI99eF7HSxOdo6VPag580/1SXsgpZwYEcbHPDLgQJYcKe1SycAyYW+XNf+5yP
 j8Ha51+GiOh9Kl0sp/PTuQwEq0PctWN8pkXAkWj7H5GOG22xi4xCS782uH0YB2tYVXg3
 DbIA==
X-Gm-Message-State: AOAM531s5MdYKFJdqaj2AtCRbadFQ5wnyvuNq0zd+KHWyxf6QXKqC8jG
 p1Q8LtACXddYU2NqolA8zu7zjon70yAy3sOs
X-Google-Smtp-Source: ABdhPJx9/7sbzNT81A83hbYku2uv+pF29UgrARwaEp2aQJGAYJ8hhATNppVOGVDw7h7eZt0QX9dsIA==
X-Received: by 2002:a05:6512:2311:: with SMTP id
 o17mr9889754lfu.108.1629742299399; 
 Mon, 23 Aug 2021 11:11:39 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id w26sm1511739lfk.223.2021.08.23.11.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:11:39 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/14] target/riscv: Remove the W-form instructions from Zbs
Date: Mon, 23 Aug 2021 20:11:22 +0200
Message-Id: <20210823181132.2205367-5-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823181132.2205367-1-philipp.tomsich@vrull.eu>
References: <20210823181132.2205367-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x132.google.com
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


