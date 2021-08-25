Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB6E3F7B2F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 19:07:07 +0200 (CEST)
Received: from localhost ([::1]:52236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIwMk-0007Ii-FM
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 13:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwFg-0004Vk-36
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:59:48 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:37815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwFd-0000b7-Rf
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:59:47 -0400
Received: by mail-lj1-x22a.google.com with SMTP id d16so44781577ljq.4
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 09:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MLLe4Tu08mgHcORWS/pHdYGKSvTUe26JnB4KVXQw/Xg=;
 b=sTKReMF4LV33kb4lYwGxkQD1lBmuBTKo1MK9x6gHezerLSW03Bc3KqCxdajBsuovE9
 D7LoypUpopbXX7Ufzmf5BypFFwtXOmrPzbEvWi71RQ6NplGYdSxvCZgxEeK+DpK3urKC
 GBVrxIOEuikDtDuq6j4v0XFY0tzpihz/NEI85a2lsN769l7xAZYF04vEoPRk72e6wE1A
 PhRBCexhqKUggCRdbAFFmgDdRIpCOsU0hl9jJ6QOccmfKrb2PYCDGAmN4ZEO6o6F6ZYe
 cvs63ntGyTptO9DQw65i31WxLNdZ0BVlrK/+6c6+UZS3euQWm9V5sSTixr8QPfufxwTu
 C0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MLLe4Tu08mgHcORWS/pHdYGKSvTUe26JnB4KVXQw/Xg=;
 b=qQwiX41AY4HEm7qyPmvUzvOQv3izFlf6uM0vyP1kSrnu90+mqPeUAIhyuMB6RnDwGo
 iR0elNfiQS1H0ObblThoPMTUE43oLC5n2PFELd0HRnPaHfHVENc/AVZgfGLm/5ZQ2VRF
 1yT81bt+w7ORSh/+UA+G0drUlXPJoQlGjjPxfstBk3kA36vMEkV3zUk7fdFCLuyaKOFt
 MI77RgjEvxqNPI1inMhlzYi2JixYJ3JcYtvUrWszR1FtYAUtU1lsqAURw+9XlcJOJbZN
 HlYgeH9XE0rnvd4E0cR+7Xsak1ZU7og4neehjHv45P4aSFBAnXG0Qtt68U5yxh5OWbT/
 rcgA==
X-Gm-Message-State: AOAM532UvX23p6kSdDq++dMdXY8sHpe83LdVl9rg7tfjEo2+F6vr0z+O
 ZbMFVD9leJvP7+XslebZjbpejPDucCKjrqt4
X-Google-Smtp-Source: ABdhPJxDoPrQCct8yTi7bwDNAKWtPyfnKB+39/h4j8bGJEM8F/7WC2K/vP+IXRy++DaL0UjQszG0zw==
X-Received: by 2002:a05:651c:2ca:: with SMTP id
 f10mr37148870ljo.211.1629910784007; 
 Wed, 25 Aug 2021 09:59:44 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id r2sm59619ljj.14.2021.08.25.09.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 09:59:43 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 04/14] target/riscv: Remove the W-form instructions from Zbs
Date: Wed, 25 Aug 2021 18:58:57 +0200
Message-Id: <20210825165907.34026-5-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
References: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x22a.google.com
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


