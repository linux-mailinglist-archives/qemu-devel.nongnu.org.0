Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5BF3FB46D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 13:18:23 +0200 (CEST)
Received: from localhost ([::1]:57200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKfJ0-0001XX-B4
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 07:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mKfGg-00071o-AF
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:15:58 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:40691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mKfGZ-0004Wl-6Y
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:15:58 -0400
Received: by mail-lf1-x12f.google.com with SMTP id bq28so30433203lfb.7
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 04:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LRnVrwRCuMr+9UoCLC0NdtbpN+j1zxeD7w+qDcSesiQ=;
 b=HNUE99THVi9rEfHbPLTTsmkrVa/Cy9wuj54sqD32WN8KMuvBzDeptrf7bdgsKHkyei
 wFUNSUK7+ktPd3AdlW0nPhqIQop+9s/vNggsAdSC5eCbIGGcGddwNbgKMCrFpc7k6xCF
 g2O0FMCMrRGO1pnDwYM12QF00quMk4AHDrLBln3rsHLVXbRUKBrRtsuqvl/pdkHdINsV
 WiMAqwnwHcUHv00D/xuvGmzkO+ZrEUQCMR3OtZFly90N00KrXz9FFXrOyUfUKiN3V6aC
 8d7UB2y7ZPwBVgILZ/+QZomMES8PVdI6sO0nYmNiRIEOvmFL5LT6MH2QlJNm1dcsyrtN
 iLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LRnVrwRCuMr+9UoCLC0NdtbpN+j1zxeD7w+qDcSesiQ=;
 b=C/ixC7Y6eJtxMoI+fBN/bbd5KsGb/osF11xoIczUXGWclTVnOp9vVM/BJBIiqOxeZu
 lO0LF137fpDz+gjXaDg7u/b/2t5Wjem4togUoWYHixfUfqYjDKgzgg0jN0DNsd8KlZpq
 lMqyooK8XiIyGYmX0tfYXA5lq5yfyo3yDZK3EZczId0qoFpEUoOlF3BvU9aNEm1xRDoo
 PxhDp+PepT/iGi7MvcCMQ51gp2SHz62keLQQt3aMXVSb2Qo5FmMU52IZFx/9kLF0HxCV
 8fGLt9g1RHhHNAbW+C5EiYsltaUWhH2dxXwl4GDxqVwCIn+ut/F5UlaNA4qd0dSmKhXC
 n6Kg==
X-Gm-Message-State: AOAM533w0c7H54ZI9Qs/jsAt/y6uPcTKpStUr5VA9A//L/Tt9j27JvOp
 8YtQ2NeVzt7jkKPuOiHQBmP6l6PUn7O+skve
X-Google-Smtp-Source: ABdhPJy0E+nQGIjYs+4CbUr9OdKuVa3ipR4IbwnDYoeXgv73uqJ3EAV8n0zmMBhVw1r1U/4vxvxRaA==
X-Received: by 2002:ac2:4c45:: with SMTP id o5mr11932427lfk.22.1630322149499; 
 Mon, 30 Aug 2021 04:15:49 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id j3sm1790129ljq.84.2021.08.30.04.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 04:15:49 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/14] target/riscv: Reassign instructions to the
 Zbs-extension
Date: Mon, 30 Aug 2021 13:15:04 +0200
Message-Id: <20210830111511.1905048-7-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
References: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12f.google.com
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

The following instructions are part of Zbs:
 - b{set,clr,ext,inv}
 - b{set,clr,ext,inv}i

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v3)

Changes in v3:
- The changes to the Zbs instructions (i.e. the REQUIRE_ZBS macro) and
  its use for qualifying the Zba instructions) are moved into a
  separate commit.

 target/riscv/insn32.decode              | 17 +++++++++--------
 target/riscv/insn_trans/trans_rvb.c.inc | 24 +++++++++++++++---------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7e38477553..1166e7f648 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -688,19 +688,11 @@ min        0000101 .......... 100 ..... 0110011 @r
 minu       0000101 .......... 101 ..... 0110011 @r
 max        0000101 .......... 110 ..... 0110011 @r
 maxu       0000101 .......... 111 ..... 0110011 @r
-bset       0010100 .......... 001 ..... 0110011 @r
-bclr       0100100 .......... 001 ..... 0110011 @r
-binv       0110100 .......... 001 ..... 0110011 @r
-bext       0100100 .......... 101 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
 gorc       0010100 .......... 101 ..... 0110011 @r
 
-bseti      00101. ........... 001 ..... 0010011 @sh
-bclri      01001. ........... 001 ..... 0010011 @sh
-binvi      01101. ........... 001 ..... 0010011 @sh
-bexti      01001. ........... 101 ..... 0010011 @sh
 rori       01100. ........... 101 ..... 0010011 @sh
 grevi      01101. ........... 101 ..... 0010011 @sh
 gorci      00101. ........... 101 ..... 0010011 @sh
@@ -721,3 +713,12 @@ roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
 
+# *** RV32 Zbs Standard Extension ***
+bclr       0100100 .......... 001 ..... 0110011 @r
+bclri      01001. ........... 001 ..... 0010011 @sh
+bext       0100100 .......... 101 ..... 0110011 @r
+bexti      01001. ........... 101 ..... 0010011 @sh
+binv       0110100 .......... 001 ..... 0110011 @r
+binvi      01101. ........... 001 ..... 0010011 @sh
+bset       0010100 .......... 001 ..... 0110011 @r
+bseti      00101. ........... 001 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index ac706349f5..21d713df27 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -1,5 +1,5 @@
 /*
- * RISC-V translation routines for the RVB draft and Zba Standard Extension.
+ * RISC-V translation routines for the RVB draft Zb[as] Standard Extension.
  *
  * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
  * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
@@ -24,6 +24,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_ZBS(ctx) do {                    \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbs) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 static bool trans_clz(DisasContext *ctx, arg_clz *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -116,49 +122,49 @@ static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
 
 static bool trans_bset(DisasContext *ctx, arg_bset *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift(ctx, a, gen_bset);
 }
 
 static bool trans_bseti(DisasContext *ctx, arg_bseti *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shifti(ctx, a, gen_bset);
 }
 
 static bool trans_bclr(DisasContext *ctx, arg_bclr *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift(ctx, a, gen_bclr);
 }
 
 static bool trans_bclri(DisasContext *ctx, arg_bclri *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shifti(ctx, a, gen_bclr);
 }
 
 static bool trans_binv(DisasContext *ctx, arg_binv *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift(ctx, a, gen_binv);
 }
 
 static bool trans_binvi(DisasContext *ctx, arg_binvi *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shifti(ctx, a, gen_binv);
 }
 
 static bool trans_bext(DisasContext *ctx, arg_bext *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift(ctx, a, gen_bext);
 }
 
 static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shifti(ctx, a, gen_bext);
 }
 
-- 
2.25.1


