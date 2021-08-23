Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A783F4EA7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:44:46 +0200 (CEST)
Received: from localhost ([::1]:57724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mID3w-0002mG-Hq
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mID0K-0006Js-F9
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:40:56 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:34624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mID0C-0006Ky-2D
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:40:56 -0400
Received: by mail-lf1-x133.google.com with SMTP id z2so39209250lft.1
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DPR0qOKNhd3KGZCemfo3eY9bEhO/vkvziEpncl4ge+8=;
 b=S/glaR83EGuxt/i5ARg84QPYcCea+5PjD/QmgtfzuZT/3Rk6qW2e+0xhSkjBX5x2pZ
 LsUlaj34PPxQRspqUBvtOyva5C0CBinBD2LjCHwKN4GPp9W45jBv+x+/iT+hlVRKSxQy
 kmBO6SU+lKk/yW//j6WSC9r4hHMfNQftvgh7IeJt5z0u7dKqviNrpFVEsvX9JccV+fCT
 WeCnYKZ66Wcn2awChjJI8I9I7P/PJyoc7hXmOQDPoVNXKOIlu3wdg63XU7tKb4ch3bHj
 cQNznPADvp2Tj6CMwQQhI85sdYiYkdOEU+FKJhpS6vP4NUSWfx3wGcHFaAVUhtQ6BQEd
 x7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DPR0qOKNhd3KGZCemfo3eY9bEhO/vkvziEpncl4ge+8=;
 b=lcq05/LXQL2rETfS6NXMZ3jj34Tr5yQfvXbK9bjFCwj5Pa3mCG3TwvsfV9ytrvGurK
 kZV7irMWvRYMAUEvzSeNzQF+d1AJGwEvgmtKbTe5CulbWg/jpqSpn6FFAAOUK41q3/lz
 LAsPde5ynMejijwTRvy3sHHcDTgFvgDHuX72/mkO6jsBqeO32exYpm/TmK4GK0PC3MEv
 bmS96InXTrdO8cFYsimzTS8UpCED2CMy2yMPYfkSEyrRR1g6Q4mhW2ccqN48ArNLeLil
 j4pqFkt8zGbMMFZOJ5c2vkC+0MdduhFXAiR8idDOndlTHgg9z605P95DStiaJdC1pkNF
 WIeA==
X-Gm-Message-State: AOAM532laEENC4LA5astSnMB2i2ORzfHB+Br+hILfR53ljmUVcGCOK+z
 V90EN8HA4LXdwl1ZuBYzmMCq9jP/9jbLEymg
X-Google-Smtp-Source: ABdhPJwu+CbT1P+E5BXZznolCB+hMQgUTMK4OxyGSjE8jEtH3cQPT7TG9pyTfVnUAtMbkbbxPKcTrg==
X-Received: by 2002:a05:6512:3455:: with SMTP id
 j21mr26224280lfr.8.1629736846304; 
 Mon, 23 Aug 2021 09:40:46 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id z5sm1491671lfs.126.2021.08.23.09.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:40:46 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/15] target/riscv: Reassign instructions to the
 Zbs-extension
Date: Mon, 23 Aug 2021 18:40:29 +0200
Message-Id: <20210823164038.2195113-7-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x133.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
---

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


