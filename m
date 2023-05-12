Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FE0700A89
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:43:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTxe-000786-Pf; Fri, 12 May 2023 10:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxa-00074H-44
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:30 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxL-0004ha-7n
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:29 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f450815d0bso37254905e9.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902474; x=1686494474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yE0yzHpn5HGcapGUBNgyOVRbnrVrPALQXSeI3NGRfYY=;
 b=oQjj7qB42CPYtTl76vhjZFi/EX9EAeVNb6zOSysosMns+hVeTIFqt9FICZsed15em4
 VfLsML4g0iWJQj+CbfrK6lzg5tWus1lW95e1fAEbKhq0TxoXozPPfqC19i6UM0ie4GFB
 U82tZnRsbNqd5SOMTN2Kf0Uzk9c6AiTVyg2f0yBJEx+aGEqwvqCQp1PRR0YJYkMO2Ouo
 YsIgsPbqnZ9/6y/YGOoglfzqgz/EXo5/lbVGOElGdRC42Oo6SkYiqK+GzRz6o0aFt/Cm
 zWOnwdEOhV40qWfQ771xUhTmx/EYJAJKLll4z9JFcOsV6jD4NtRB6IxeCaobfWkkUuUx
 vksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902474; x=1686494474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yE0yzHpn5HGcapGUBNgyOVRbnrVrPALQXSeI3NGRfYY=;
 b=LK6WXYARftG5SIGVKHqEkvyfX9xyANyLXzb0Rr6yBCrdutRWDXPaBDqe/pweI1Xfze
 SX4ba7LPv4aWZvlOOXHfi113PXEi54DpFDlt+Mt7dV0vPrY2l8HFYMt5Abv1PRnexAzV
 JKl27UjaUUhFXA+jZGLUbm69ANxZxzI03s1dEvVrjkmO8NpObS+wP5PCGj8rWSQgKOvi
 nJ69ppaYA2Caw4NrmwIsdmxeLLVwGL62vZrDvdTm+neHK6aGkeBk9fDiSx9be65T/bUj
 ceqn7EiqvmFKLNojaU8Y2XOdQ/gSPAJs+kc8oqZaPMdXFU/ZJZoOKICqLI7qRXNlohOW
 1qxA==
X-Gm-Message-State: AC+VfDw3lVOy7OFF52egGDIbtmWRlP7xXv+Q/g2N9U7VVQ79XsIeaiOS
 g5d9wFty4ed1G9UfqRH8/UNkQw==
X-Google-Smtp-Source: ACHHUZ6Li1oT92ebrBx8hrYQsM3oq71ovycR3Fye/wcZcrKlf8b44Aay7lcnGFe7VhIHtMnoVRenuQ==
X-Received: by 2002:a7b:cd09:0:b0:3f1:80a7:bfb2 with SMTP id
 f9-20020a7bcd09000000b003f180a7bfb2mr17292469wmj.32.1683902474500; 
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
Subject: [PATCH 13/20] target/arm: Convert unconditional branch immediate to
 decodetree
Date: Fri, 12 May 2023 15:40:59 +0100
Message-Id: <20230512144106.3608981-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Convert the unconditional branch immediate insns B and BL to
decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |  9 +++++++++
 target/arm/tcg/translate-a64.c | 31 +++++++++++--------------------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index eb5d4cb0d57..d54c6522028 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -21,6 +21,7 @@
 
 &ri              rd imm
 &rri_sf          rd rn imm sf
+&i               imm
 
 
 ### Data Processing - Immediate
@@ -106,3 +107,11 @@ UBFM            . 10 100110 . ...... ...... ..... ..... @bitfield_32
 
 EXTR            . 00 100111 . 0 ..... ...... ..... ..... @extract_64
 EXTR            . 00 100111 . 0 ..... ...... ..... ..... @extract_32
+
+# Branches
+
+%imm26   0:s26 !function=times_4
+@branch         . ..... .......................... &i imm=%imm26
+
+B               0 00101 .......................... @branch
+BL              1 00101 .......................... @branch
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 4319559057f..fe6b4a68288 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1319,24 +1319,19 @@ static inline AArch64DecodeFn *lookup_disas_fn(const AArch64DecodeTable *table,
  * match up with those in the manual.
  */
 
-/* Unconditional branch (immediate)
- *   31  30       26 25                                  0
- * +----+-----------+-------------------------------------+
- * | op | 0 0 1 0 1 |                 imm26               |
- * +----+-----------+-------------------------------------+
- */
-static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
+static bool trans_B(DisasContext *s, arg_i *a)
 {
-    int64_t diff = sextract32(insn, 0, 26) * 4;
-
-    if (insn & (1U << 31)) {
-        /* BL Branch with link */
-        gen_pc_plus_diff(s, cpu_reg(s, 30), curr_insn_len(s));
-    }
-
-    /* B Branch / BL Branch with link */
     reset_btype(s);
-    gen_goto_tb(s, 0, diff);
+    gen_goto_tb(s, 0, a->imm);
+    return true;
+}
+
+static bool trans_BL(DisasContext *s, arg_i *a)
+{
+    gen_pc_plus_diff(s, cpu_reg(s, 30), curr_insn_len(s));
+    reset_btype(s);
+    gen_goto_tb(s, 0, a->imm);
+    return true;
 }
 
 /* Compare and branch (immediate)
@@ -2413,10 +2408,6 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
 static void disas_b_exc_sys(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 25, 7)) {
-    case 0x0a: case 0x0b:
-    case 0x4a: case 0x4b: /* Unconditional branch (immediate) */
-        disas_uncond_b_imm(s, insn);
-        break;
     case 0x1a: case 0x5a: /* Compare & branch (immediate) */
         disas_comp_b_imm(s, insn);
         break;
-- 
2.34.1


