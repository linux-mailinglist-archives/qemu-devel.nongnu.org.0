Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDF23FB47A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 13:23:00 +0200 (CEST)
Received: from localhost ([::1]:45370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKfNT-0004Sr-Nq
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 07:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mKfGd-0006t7-Lb
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:15:55 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:45775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mKfGX-0004Vd-OQ
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:15:55 -0400
Received: by mail-lf1-x130.google.com with SMTP id g13so30404721lfj.12
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 04:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NKF6J4Nz/aYSq0iBWLPg/Wi+N+rJR7n5q7HTT+s2dwc=;
 b=fRuJc6dc+cjV/f9piU65hT4AhdGVZpx/6n4vqYnZhQuzwpw3JvA5q5016a7Il2eCpi
 SjsRDOEDwPQvESceR5IY//GIpnSWlrK1X7b3y4t5qF0rg0u58n7dtcmZCV99Iu4t6P6Q
 duWVP+tTolKIowljnIHkYU1KgjKXsG23Vm1PLwoo5odEyr/sQofDYS9T+UWmiDKLadBT
 zENiQyqVfGgkAalKWHs0IOn4MCa2GbiZAY7Z/eixGrKcbxSsHB2T5FbVyr211m/rps+m
 LpVOIRzcRL6sluhAYGhjmp9g9OV+Ie3kUx9wM9sh7MgMASxeS4Mg2Nci/88UVuciMDxp
 f3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NKF6J4Nz/aYSq0iBWLPg/Wi+N+rJR7n5q7HTT+s2dwc=;
 b=q/OHuCqCUQt3PrHUzU9vj1ni6WPrpo5C852SCFTJ5rF6+syC0lPJ1blDgEecv0yLMu
 JdWnKPr0TsR1HWLtY108GTUD5E8d4kfw+Fsz2hPUrPPUj2Mn/Ylf3yK7AvnlCEcDqNUX
 7D8DtYmKuWCF9YtZR7IpAN+o5L7kLqeHys4JkotBgT2iGqRQH3v2kt1GW45gGF+fRsKV
 A4c99oWDTlPwZ7Xahlh4cxxLHF5VwaGFUCe4prrcd/mwFvtUw+zpcCldcfLyDJDnuRbz
 qM7Ss/1yF3VvMNPVd+n69Oxtv3iKKQ9WeammOgWh3BIMVBjyrncPpYJy1ZcdbYIHvSUf
 LOOQ==
X-Gm-Message-State: AOAM531VEnz2hfEQLUz4XDlSCA+OePK6l0jZG4IZaxixQiwhqGm+CwZZ
 PYMYHPWzCuAJBmoB1qQDGc1K7F+twhu2DRZ4
X-Google-Smtp-Source: ABdhPJyC0xXIYlYdM70mAkqlxQqPlA2b7LjCDlalalNDltFQYhd+9Lu3SqPniHlTaYx6ytpJpPqyyw==
X-Received: by 2002:a05:6512:2315:: with SMTP id
 o21mr17542537lfu.138.1630322147993; 
 Mon, 30 Aug 2021 04:15:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id j3sm1790129ljq.84.2021.08.30.04.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 04:15:47 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/14] target/riscv: Remove the W-form instructions from Zbs
Date: Mon, 30 Aug 2021 13:15:02 +0200
Message-Id: <20210830111511.1905048-5-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
References: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x130.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


