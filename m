Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD4B3C3F69
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:10:33 +0200 (CEST)
Received: from localhost ([::1]:56596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gic-0003Fx-Cw
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZA-0006Ti-K1
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:00:45 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZ9-0000Z6-3i
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:00:44 -0400
Received: by mail-wr1-x429.google.com with SMTP id a13so22055011wrf.10
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ix0ZNByA7PaYvpQ6FepEgQp4kdYoJ33K1BtkJW9E8Xk=;
 b=O5N7VwfjhZ0WX7izdmkITCjNeHI341iYtaVFi5pTgm9iVmhiNi/jChIeZ8b0ZAe68x
 jU215KlpijDmISgMujiNvJOfeAooEnminwnL2vTdKsN+G4fuqNzYUMIoghzD1qifXSw0
 zed9i5Ty4PDVTueij7WU6jmQHf8rcstf+A5f5fidan9fkZ7W60Rd7rhuSjpk7s0kFcd9
 eG1V1rt5OmB4pOZltqu5Jk9CJ/sZhyUOYVffmzi6M/O/jj7JLFCPsF6YlkDJPs3E0Yy1
 h+aPNpA1bLImKQ+UvLSpqYLxOvNKI8I5QkgMjpeDcYvzsMusczhwh02oStEbo5jXP9dJ
 a32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ix0ZNByA7PaYvpQ6FepEgQp4kdYoJ33K1BtkJW9E8Xk=;
 b=Yr+2AEYI8YmEV/PamEaKeOHXOKA6wYtp+e5ypKISSUOwL52LTc+tcZVgcqVPAPVTDW
 +/dAxosg8PAYMc+1UJ06IMKO6+llICv1BcMd3H4ZNlhLItItMzWKape78yw28MjZjDBN
 OPw72NPR3dPXdOamQwXFMsE9BC5O9lYXeSKsZPMYmWD/uWLZDTi2P5J6Pt2KsY65/TBQ
 duAU2CSUpgmwzKwzezozZrtSqSfk7WHeBMj/y+jD/SXXPbQnNN0YIPYOO8wj3epzb5Em
 d2FcDycg7EAMoHuZ9lkNN5S7Z83GpPoccil2nPrTqPzEGzJqs34987gzDh/jlBF6ea8P
 k4ug==
X-Gm-Message-State: AOAM533LJ2zdgcz41ULwCD2NnwWoSVru9HScDLleNA8VcvG4Ss9uucXX
 0kyOml2D+UfICX2fXqQVM2RPw27qkfx/eR8b
X-Google-Smtp-Source: ABdhPJxUFHzIodV0I/+SL5WndIzzAUHwpD99cjaU1fiY/PEluI+PM0v/cnwoz95TgHjJCGYSHaefOQ==
X-Received: by 2002:a05:6000:50f:: with SMTP id
 a15mr48913409wrf.108.1626037240271; 
 Sun, 11 Jul 2021 14:00:40 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id f7sm5469311wru.11.2021.07.11.14.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:00:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/19] target/mips/tx79: Introduce PAND/POR/PXOR/PNOR opcodes
 (parallel logic)
Date: Sun, 11 Jul 2021 23:00:00 +0200
Message-Id: <20210711210016.2710100-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the parallel logic opcodes:

 - PAND (Parallel AND)
 - POR  (Parallel OR)
 - PXOR (Parallel XOR)
 - PNOR (Parallel NOR)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-16-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/tx79.decode      |  4 +++
 target/mips/tcg/tx79_translate.c | 54 ++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/target/mips/tcg/tx79.decode b/target/mips/tcg/tx79.decode
index 0f748b53a64..26c80b9bce5 100644
--- a/target/mips/tcg/tx79.decode
+++ b/target/mips/tcg/tx79.decode
@@ -32,8 +32,12 @@ MTLO1           011100 .....  0000000000 00000 010011   @rs
 # MMI2
 
 PCPYLD          011100 ..... ..... ..... 01110 001001   @rs_rt_rd
+PAND            011100 ..... ..... ..... 10010 001001   @rs_rt_rd
+PXOR            011100 ..... ..... ..... 10011 001001   @rs_rt_rd
 
 # MMI3
 
 PCPYUD          011100 ..... ..... ..... 01110 101001   @rs_rt_rd
+POR             011100 ..... ..... ..... 10010 101001   @rs_rt_rd
+PNOR            011100 ..... ..... ..... 10011 101001   @rs_rt_rd
 PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index ad83774b977..00364f10d47 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -2,6 +2,7 @@
  * Toshiba TX79-specific instructions translation routines
  *
  *  Copyright (c) 2018 Fredrik Noring
+ *  Copyright (c) 2021 Philippe Mathieu-Daudé
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
@@ -114,6 +115,35 @@ static bool trans_MTLO1(DisasContext *ctx, arg_rtype *a)
  * PSUBUW  rd, rs, rt        Parallel Subtract with Unsigned saturation Word
  */
 
+static bool trans_parallel_arith(DisasContext *ctx, arg_rtype *a,
+                                 void (*gen_logic_i64)(TCGv_i64, TCGv_i64, TCGv_i64))
+{
+    TCGv_i64 ax, bx;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    ax = tcg_temp_new_i64();
+    bx = tcg_temp_new_i64();
+
+    /* Lower half */
+    gen_load_gpr(ax, a->rs);
+    gen_load_gpr(bx, a->rt);
+    gen_logic_i64(cpu_gpr[a->rd], ax, bx);
+
+    /* Upper half */
+    gen_load_gpr_hi(ax, a->rs);
+    gen_load_gpr_hi(bx, a->rt);
+    gen_logic_i64(cpu_gpr_hi[a->rd], ax, bx);
+
+    tcg_temp_free(bx);
+    tcg_temp_free(ax);
+
+    return true;
+}
+
 /*
  *     Min/Max (4 instructions)
  *     ------------------------
@@ -139,6 +169,30 @@ static bool trans_MTLO1(DisasContext *ctx, arg_rtype *a)
  * PNOR    rd, rs, rt        Parallel NOR
  */
 
+/* Parallel And */
+static bool trans_PAND(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_arith(ctx, a, tcg_gen_and_i64);
+}
+
+/* Parallel Or */
+static bool trans_POR(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_arith(ctx, a, tcg_gen_or_i64);
+}
+
+/* Parallel Exclusive Or */
+static bool trans_PXOR(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_arith(ctx, a, tcg_gen_xor_i64);
+}
+
+/* Parallel Not Or */
+static bool trans_PNOR(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_arith(ctx, a, tcg_gen_nor_i64);
+}
+
 /*
  *     Shift (9 instructions)
  *     ----------------------
-- 
2.31.1


