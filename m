Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32063400092
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:33:30 +0200 (CEST)
Received: from localhost ([::1]:36052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9Jx-0002ZD-8G
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mM91Z-00021k-F5
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:14:29 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:39806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mM91X-0003dc-Mr
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:14:29 -0400
Received: by mail-lj1-x22d.google.com with SMTP id q21so9554452ljj.6
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 06:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LRnVrwRCuMr+9UoCLC0NdtbpN+j1zxeD7w+qDcSesiQ=;
 b=dRZeZqZlU69sQZOhx0h8/RFvnO4pxl1OctVZkw/x1DnA9vxTlG8jPBQo9CYueZCF2Z
 nrjHBTFy+FiPImINEMAxL0WX6E9XSybAV6Jr153f78U14tCDnwPUch70ew7odb8og7Wc
 QPPRLCgUuRQuk0NZls2uc35bOi/ty6zwIfjuQ9QxMkbBCPS9YdcbqFh1fSxU6MCwKAzo
 VwG8NrhZAS2cSTEeZZvuNn/scH5z1lIJ+sooqxj6Qa9yMUvi6/Cdh2uIcq0MmZLwwDlE
 q3yzL90mnP9Xk+k8X3pL94UZegLaPdTHydJTiqDmmLveY5aQgH1Pe7SRzH4NA0IVTBck
 jZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LRnVrwRCuMr+9UoCLC0NdtbpN+j1zxeD7w+qDcSesiQ=;
 b=s+gcQ+d5C2+72krcYhcg7ATwcBUM2hsd9QRLut3/uHaPdc0V2KZnLZmhWcKLWAsXNY
 cwQ5+iLD+tMr9DF1bzyZe+3yLDJ6f084HyC+9XGx2BZsAL2ndCbJ/tAdq0sJa/6TYCej
 d+ONqzzGQ3t0K4qZo7eKpEOHlgAUjyJPiJXulTR69Z83eompZpAj867WBhiM32i5++Cl
 NviYVD9qbueguYNuBu+m6Z2kfZywsAnDOAkTFnHlg0jI79sJFlmmmUmMeQWJ1sYcW1Ts
 BdD8/OVI7fAU6/9kuybO2imQiK2q2D/y1OsPrWivaSwXOxMmgzLSWXTSD2XhIa0asQ/O
 nayA==
X-Gm-Message-State: AOAM5315GDsNL4qLgRnIF/pFENm4WrfHTXBGkxg6JtfOfHdVFcsQcA1f
 5OV86aVyzORRD7eszAQmI7kc6tdBTHjvUKoECgw=
X-Google-Smtp-Source: ABdhPJwcG1gYwf/tihODpGUzl1EwH+SoButjBkfWnpSq3o4xr0qe429kUQ8cwJGnv1C0Dj3XotqiEA==
X-Received: by 2002:a2e:90cf:: with SMTP id o15mr2919186ljg.14.1630674865909; 
 Fri, 03 Sep 2021 06:14:25 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id n5sm577995ljj.97.2021.09.03.06.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 06:14:25 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 06/14] target/riscv: Reassign instructions to the
 Zbs-extension
Date: Fri,  3 Sep 2021 15:14:09 +0200
Message-Id: <20210903131417.2248471-7-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903131417.2248471-1-philipp.tomsich@vrull.eu>
References: <20210903131417.2248471-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x22d.google.com
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


