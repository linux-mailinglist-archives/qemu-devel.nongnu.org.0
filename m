Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F067C700A7D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:42:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTxh-0007Dt-6F; Fri, 12 May 2023 10:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxc-00077P-1t
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:32 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxM-0004jx-BH
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:31 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f41d087b3bso71927505e9.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902475; x=1686494475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b35BwkiFX8fqUrD1Px2IqZe/3AgM9JZzroufYhPa+ao=;
 b=T+6MivRRfHt3BSCGB3BusxGwRHqVnDHhfj9xEfoH3GHrSzmrOmRUDMgHQ4Ycmrryjo
 IrYa9RPZq9Tc+rvZYUn1fZwlzXotwO6j6ZbvDWO3STd3QCeDU/eubyxbmhOzhwDyRxVz
 Gm1sWD1azfTbu5dF1hKxdM2lV4jT9Ts84bQ20NKJN/pC1iv+r1vW8uxppLYuFS6+tHbU
 bU4P8TU8lhb2KOPSoax5pjsKn0p2c2KdBR/C9RPtR4BgD3jC1KxHNP5/B37z63JUVE4T
 rutEdjja6pd5i+9m/aRncZwFxFpO+6GIxhGawHWl8+NwVia9cM6Qx+uTJBEblcaTY61n
 CjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902475; x=1686494475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b35BwkiFX8fqUrD1Px2IqZe/3AgM9JZzroufYhPa+ao=;
 b=WQfOndPaU+cADiwkWzy47ciecVYzC870rKhhHniikuYJV9CTytQpJ8Fc51r54vbN2z
 TZUcItw+/D5/9JelWSrdknDK+5vpI2lRk+idE7RjVjjF4Ho0n98lf8L7QZOgcSai2Xh1
 gnlfEOXLIOAK907/5IAgbPIfKP65lsy7lk/4itUc2y/GIZxCFTdAwmuFNiBd48uPoUJX
 M2CgMBCsA8HtiQfNggH1ND+wf0sEt/YQEJA21lGfyGoEop8aUmuw1Hds7lmZu7n0fETj
 n+3L2bQhnhs9Ikrf09aEqr65P8MI7/3shdXx4XVI5VycXwiW9Td3DevdVgoCHN2PUPq7
 L5fQ==
X-Gm-Message-State: AC+VfDxS4t+cbCOLrT2/xvndu94wzgb5eo8NF55DhI7giZD0sSk9hunE
 qgHtz6BA8Ev99dRpEquIJ2Cnnh8hx5oOQPAcXDk=
X-Google-Smtp-Source: ACHHUZ6awIx5vllupVVf46rtl53UmNd2sfI1LhwoWPGpPs4V76YHRjl+P27m1sYY7v1vxIKyfzL33g==
X-Received: by 2002:a1c:e90c:0:b0:3f1:952a:4bf0 with SMTP id
 q12-20020a1ce90c000000b003f1952a4bf0mr17441034wmc.33.1683902474982; 
 Fri, 12 May 2023 07:41:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 14/20] target/arm: Convert CBZ, CBNZ to decodetree
Date: Fri, 12 May 2023 15:41:00 +0100
Message-Id: <20230512144106.3608981-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Convert the compare-and-branch-immediate insns CBZ and CBNZ
to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |  6 ++++++
 target/arm/tcg/translate-a64.c | 26 ++++++--------------------
 2 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index d54c6522028..86220569e13 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -115,3 +115,9 @@ EXTR            . 00 100111 . 0 ..... ...... ..... ..... @extract_32
 
 B               0 00101 .......................... @branch
 BL              1 00101 .......................... @branch
+
+%imm19   5:s19 !function=times_4
+&cbz     rt imm sf nz
+@cbz            sf:1 ...... nz:1 ................... rt:5 &cbz imm=%imm19
+
+CBZ             . 011010 . ................... ..... @cbz
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index fe6b4a68288..5da551385bd 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1334,33 +1334,22 @@ static bool trans_BL(DisasContext *s, arg_i *a)
     return true;
 }
 
-/* Compare and branch (immediate)
- *   31  30         25  24  23                  5 4      0
- * +----+-------------+----+---------------------+--------+
- * | sf | 0 1 1 0 1 0 | op |         imm19       |   Rt   |
- * +----+-------------+----+---------------------+--------+
- */
-static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
+
+static bool trans_CBZ(DisasContext *s, arg_cbz *a)
 {
-    unsigned int sf, op, rt;
-    int64_t diff;
     DisasLabel match;
     TCGv_i64 tcg_cmp;
 
-    sf = extract32(insn, 31, 1);
-    op = extract32(insn, 24, 1); /* 0: CBZ; 1: CBNZ */
-    rt = extract32(insn, 0, 5);
-    diff = sextract32(insn, 5, 19) * 4;
-
-    tcg_cmp = read_cpu_reg(s, rt, sf);
+    tcg_cmp = read_cpu_reg(s, a->rt, a->sf);
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
 
 /* Test and branch (immediate)
@@ -2408,9 +2397,6 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
 static void disas_b_exc_sys(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 25, 7)) {
-    case 0x1a: case 0x5a: /* Compare & branch (immediate) */
-        disas_comp_b_imm(s, insn);
-        break;
     case 0x1b: case 0x5b: /* Test & branch (immediate) */
         disas_test_b_imm(s, insn);
         break;
-- 
2.34.1


