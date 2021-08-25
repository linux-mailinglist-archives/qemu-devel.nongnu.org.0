Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEFA3F7B0B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 19:00:11 +0200 (CEST)
Received: from localhost ([::1]:34916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIwG2-0003dD-Q1
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 13:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwCn-0003ms-Qq
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:56:49 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:43883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwCf-0007DF-A4
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:56:49 -0400
Received: by mail-lj1-x235.google.com with SMTP id j12so30336515ljg.10
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 09:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QthBx0S31GUuylmSYQH/l+lHXCuRpcqu5N0yv+/c2vU=;
 b=R/uI2DtPnUzFhxv8sazG1jvXHgTgBrzkTvuL1kyQVQTKbmOqXo/pXh/ZKGnzBuLhes
 JIDI7PmqSA+EWWJ0Jnajy2sM3I08mhaiXqpwYe338ihzA1OqF3rsYcPxE6nebgudoUYG
 tJNLI3usEm2eXSD3R97sRsPdcWmJKMhKdl6bJ6muKLH01Rz8GFyjOCWl7db9wBI3tnjZ
 0h+TzdjIS04o2k4f4M8oC/PNPDDHXv5Cphl1nF2/wZS+pKvtDaezQKqugeR2TeLJdahM
 VIjXWLiTUaR5BQeu4r1XvDkx7ZDHpra9ZV9BEAxOT1rCIJqOWCc9zG6Kd44z+LLD/FBY
 beuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QthBx0S31GUuylmSYQH/l+lHXCuRpcqu5N0yv+/c2vU=;
 b=dQPpOMrzb6z7lioWQOpSE0HskSVigOd+vjmngZqCeA2clnYK4gdMCP003oBfxztSuP
 M+zd/DvsIM0Zv3A+g/VQEMgvaBbXAKFBaaJymZ8FOodPBN7pquAe+eJvFrGbOX1AuB1l
 iXQdof9M6A68fm6Elqt4Kf08/RWNRTumvPfcYH1B13PjztIK0lA5Yn5xIKShS5AIQtHD
 5Gp6OuM3bLrhFDSpayWiZZQN2712lWmnWkamrsCNujJA2I4RDExV+jWyi4yJXDbe99E5
 iA76juHb/a+veDuow8TllRbceErjjcLj4x7fr41lQblznFI/p4Bq89BNWbXAf4idCEip
 iLgA==
X-Gm-Message-State: AOAM533gUCSuLBJaYsUcttGhuNl9r48hYJnHLrezqO1xadx1JZgPARiL
 JUmkqFXX7mmUq6Bp769B58wPu920MsClqiDu
X-Google-Smtp-Source: ABdhPJxUMww+wHAqzr4gXSlPpmAq4GvaxH0XbVcbjX8Q9ORaDZ9oaxpk/Rf/V6sSqPvtsORekQyIDQ==
X-Received: by 2002:a05:651c:2ca:: with SMTP id
 f10mr37139933ljo.211.1629910598588; 
 Wed, 25 Aug 2021 09:56:38 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id i8sm55686lfl.280.2021.08.25.09.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 09:56:38 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/14] target/riscv: Reassign instructions to the
 Zba-extension
Date: Wed, 25 Aug 2021 18:56:22 +0200
Message-Id: <20210825165634.32935-3-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825165634.32935-1-philipp.tomsich@vrull.eu>
References: <20210825165634.32935-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x235.google.com
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

The following instructions are part of Zba:
 - add.uw (RV64 only)
 - sh[123]add (RV32 and RV64)
 - sh[123]add.uw (RV64-only)
 - slli.uw (RV64-only)

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---

(no changes since v3)

Changes in v3:
- The changes to the Zba instructions (i.e. the REQUIRE_ZBA macro
  and its use for qualifying the Zba instructions) are moved into
  a separate commit.

 target/riscv/insn32.decode              | 20 ++++++++++++--------
 target/riscv/insn_trans/trans_rvb.c.inc | 17 ++++++++++++-----
 2 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f09f8d5faf..68b163b72d 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -659,6 +659,18 @@ vamomaxd_v      10100 . . ..... ..... 111 ..... 0101111 @r_wdvm
 vamominud_v     11000 . . ..... ..... 111 ..... 0101111 @r_wdvm
 vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
 
+# *** RV32 Zba Standard Extension ***
+sh1add     0010000 .......... 010 ..... 0110011 @r
+sh2add     0010000 .......... 100 ..... 0110011 @r
+sh3add     0010000 .......... 110 ..... 0110011 @r
+
+# *** RV64 Zba Standard Extension (in addition to RV32 Zba) ***
+add_uw     0000100 .......... 000 ..... 0111011 @r
+sh1add_uw  0010000 .......... 010 ..... 0111011 @r
+sh2add_uw  0010000 .......... 100 ..... 0111011 @r
+sh3add_uw  0010000 .......... 110 ..... 0111011 @r
+slli_uw    00001 ............ 001 ..... 0011011 @sh
+
 # *** RV32B Standard Extension ***
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
@@ -686,9 +698,6 @@ ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
 gorc       0010100 .......... 101 ..... 0110011 @r
-sh1add     0010000 .......... 010 ..... 0110011 @r
-sh2add     0010000 .......... 100 ..... 0110011 @r
-sh3add     0010000 .......... 110 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
@@ -717,10 +726,6 @@ rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
 gorcw      0010100 .......... 101 ..... 0111011 @r
-sh1add_uw  0010000 .......... 010 ..... 0111011 @r
-sh2add_uw  0010000 .......... 100 ..... 0111011 @r
-sh3add_uw  0010000 .......... 110 ..... 0111011 @r
-add_uw     0000100 .......... 000 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
@@ -731,4 +736,3 @@ roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
 
-slli_uw    00001. ........... 001 ..... 0011011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 9e81f6e3de..3cdd70a2b9 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -1,8 +1,9 @@
 /*
- * RISC-V translation routines for the RVB Standard Extension.
+ * RISC-V translation routines for the RVB draft and Zba Standard Extension.
  *
  * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
  * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
+ * Copyright (c) 2021 Philipp Tomsich, philipp.tomsich@vrull.eu
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -17,6 +18,12 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#define REQUIRE_ZBA(ctx) do {                    \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zba) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 static bool trans_clz(DisasContext *ctx, arg_clz *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -229,7 +236,7 @@ static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
 #define GEN_TRANS_SHADD(SHAMT)                                             \
 static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
 {                                                                          \
-    REQUIRE_EXT(ctx, RVB);                                                 \
+    REQUIRE_ZBA(ctx);                                                      \
     return gen_arith(ctx, a, gen_sh##SHAMT##add);                          \
 }
 
@@ -403,7 +410,7 @@ static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
                                     arg_sh##SHAMT##add_uw *a) \
 {                                                             \
     REQUIRE_64BIT(ctx);                                       \
-    REQUIRE_EXT(ctx, RVB);                                    \
+    REQUIRE_ZBA(ctx);                                         \
     return gen_arith(ctx, a, gen_sh##SHAMT##add_uw);          \
 }
 
@@ -414,14 +421,14 @@ GEN_TRANS_SHADD_UW(3)
 static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBA(ctx);
     return gen_arith(ctx, a, gen_add_uw);
 }
 
 static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBA(ctx);
 
     TCGv source1 = tcg_temp_new();
     gen_get_gpr(source1, a->rs1);
-- 
2.25.1


