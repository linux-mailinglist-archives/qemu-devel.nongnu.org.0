Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D01700A91
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:44:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTxg-0007Bc-A2; Fri, 12 May 2023 10:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxd-00078O-Cf
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:33 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxM-0004k3-QR
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:33 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f42bcf5df1so45805235e9.3
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902475; x=1686494475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MFhepMGaE0XG072ziJIvurTDqYdBHGuPC3+MsbwqRWw=;
 b=L5by0c0KR0Xk86y/A7dMZxjdDPWyGzOW6xvd3kUtHH9By/zWfql0StrJp+u8E9R5FL
 oehq9vON9HI+KKG3TssdJKPZNO32UpBtHz2VpZw9V2hpx2fefhZClp3XD8bm0rfstEXC
 IEGzHOOyHiKIhSOiB/a7HB2k0Cd21gkm4RhIYV0PRKly0K4A7TLKg7oFGwERrHXmn4Sv
 V8HSadY6BJt82OZKiTGjGeAFnLCWwkxZWI9IaKCVMzvEqqqBbs3vKJaUe5LYYc2f0xXa
 6477JE7Q9ZIBjvd7liHpa1cbsCgqn6INfge81wT6Es9IpC3KpZgF7vSsVmFsZqdKnNQM
 5oJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902475; x=1686494475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MFhepMGaE0XG072ziJIvurTDqYdBHGuPC3+MsbwqRWw=;
 b=eD28ls2sh68+NX5pFfjCbLm/blJmnYX97uN2NRJpTvCfBT+OCqWxVQXW3GjIXKQb2O
 3a2HQPl+QAz8Qxc6fxXAqg7Ciaf+zCQrCBs2LIiP53aKSh8yY2fUvuOuEZy8wsfztx5w
 hnqFSsMT9BqblcdAm95KfthT8a8XJ0+vdcloih7dz1X7YKA/XPK9DEU+38iT8DZmewGC
 iKBNJm4nZIn52+cfk6IpBMIP08hyAWuFNR+KP35B8tYtBdZxPpZVsjMGypYXUg5xgW6+
 RmYj7TiUD1PbRp0Cah7j6sG9SbcYErcfKOrYyhT+YePip1MUi7TVD78NoNvtVpvxN4br
 J81w==
X-Gm-Message-State: AC+VfDwQC/8zOcFJh//U5XraNRrCKyyfmSdOx4zhJq7qXu/0VdSHe2Un
 jmy3OpZSpogNrjJC5b8rXaqJfQ==
X-Google-Smtp-Source: ACHHUZ5pQh3ooLXj+4CQpnnjNYRR/74V8Qkl3nGBARIzbWNPi1S3ToCt8dJvGVD7LDz43wJkV4qYKQ==
X-Received: by 2002:a1c:ed04:0:b0:3f4:f03b:56d7 with SMTP id
 l4-20020a1ced04000000b003f4f03b56d7mr3117608wmh.16.1683902475454; 
 Fri, 12 May 2023 07:41:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 15/20] target/arm: Convert TBZ, TBNZ to decodetree
Date: Fri, 12 May 2023 15:41:01 +0100
Message-Id: <20230512144106.3608981-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Convert the test-and-branch-immediate insns TBZ and TBNZ
to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |  7 +++++++
 target/arm/tcg/translate-a64.c | 25 +++++--------------------
 2 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 86220569e13..68dc820ece0 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -121,3 +121,10 @@ BL              1 00101 .......................... @branch
 @cbz            sf:1 ...... nz:1 ................... rt:5 &cbz imm=%imm19
 
 CBZ             . 011010 . ................... ..... @cbz
+
+%imm14     5:s14 !function=times_4
+%imm31_19  31:1 19:5
+&tbz       rt imm nz bitpos
+@tbz            . ...... nz:1 ..... .............. rt:5 &tbz  imm=%imm14 bitpos=%imm31_19
+
+TBZ             . 011011 . ..... .............. ..... @tbz
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5da551385bd..bd59d0616e3 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1352,35 +1352,23 @@ static bool trans_CBZ(DisasContext *s, arg_cbz *a)
     return true;
 }
 
-/* Test and branch (immediate)
- *   31  30         25  24  23   19 18          5 4    0
- * +----+-------------+----+-------+-------------+------+
- * | b5 | 0 1 1 0 1 1 | op |  b40  |    imm14    |  Rt  |
- * +----+-------------+----+-------+-------------+------+
- */
-static void disas_test_b_imm(DisasContext *s, uint32_t insn)
+static bool trans_TBZ(DisasContext *s, arg_tbz *a)
 {
-    unsigned int bit_pos, op, rt;
-    int64_t diff;
     DisasLabel match;
     TCGv_i64 tcg_cmp;
 
-    bit_pos = (extract32(insn, 31, 1) << 5) | extract32(insn, 19, 5);
-    op = extract32(insn, 24, 1); /* 0: TBZ; 1: TBNZ */
-    diff = sextract32(insn, 5, 14) * 4;
-    rt = extract32(insn, 0, 5);
-
     tcg_cmp = tcg_temp_new_i64();
-    tcg_gen_andi_i64(tcg_cmp, cpu_reg(s, rt), (1ULL << bit_pos));
+    tcg_gen_andi_i64(tcg_cmp, cpu_reg(s, a->rt), (1ULL << a->bitpos));
 
     reset_btype(s);
 
     match = gen_disas_label(s);
-    tcg_gen_brcondi_i64(op ? TCG_COND_NE : TCG_COND_EQ,
+    tcg_gen_brcondi_i64(a->nz ? TCG_COND_NE : TCG_COND_EQ,
                         tcg_cmp, 0, match.label);
     gen_goto_tb(s, 0, 4);
     set_disas_label(s, match);
-    gen_goto_tb(s, 1, diff);
+    gen_goto_tb(s, 1, a->imm);
+    return true;
 }
 
 /* Conditional branch (immediate)
@@ -2397,9 +2385,6 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
 static void disas_b_exc_sys(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 25, 7)) {
-    case 0x1b: case 0x5b: /* Test & branch (immediate) */
-        disas_test_b_imm(s, insn);
-        break;
     case 0x2a: /* Conditional branch (immediate) */
         disas_cond_b_imm(s, insn);
         break;
-- 
2.34.1


