Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE93700A9A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:45:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTxM-0006mH-9p; Fri, 12 May 2023 10:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxK-0006m5-SE
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:14 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxH-0004ha-CQ
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:14 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f450815d0bso37254185e9.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902470; x=1686494470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aGMeEb09oEnMrpyNK209IcBkUtOebSdaEKZrMIshndE=;
 b=daK08hxLQ2i3lifTHbEReBfJe+G/1ujqs81fDAvariEV4QSzhLcjSHFxmQR+NDpME1
 iDmQLpU8mAx4mrsyCqZ019gpE/4yqKUmqugSnkW6Qa0F+ODkIktZ5/1zNgqfv5C3BwYZ
 hRmUjhoGXxo8X6qfnLlJDPq2zSI4eDVS4EAFJcwd0rfOvltoANFnfWXF1U1twZgMG/dt
 IghiQdMOWjjtjEEafMglDQczj0i1zUXxF0XuL5u620sUF1f7LhZd3VzoYhCiQTv1aTR5
 M/wqeijcTlyCVpLUi34WddBScXtMSIkSzH8lVHawpx41HfwIFROeOcXXDl39ZbXNk+w+
 jKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902470; x=1686494470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aGMeEb09oEnMrpyNK209IcBkUtOebSdaEKZrMIshndE=;
 b=RaF6VkrtAZ5ja0s1zUGO0DP7IsTwhyPGD1rki6chAILfJW2ur+lkbg0/sBGbcc0vNh
 bGPFkbLW0sEwfUCVE44taABc+4c+E2Io/PrhuFT3X6JpN3nu5z0wt1exKuYI3N0vkl9r
 d+cI8n9ZWlyGp8QQkeB4mQA8/eBZGu4cI6Y1ZncIM99cBJd3p5Xce22lkIlQhH7iqopZ
 cLmmzD6T1nPvradJQ3TyI02be2KUVRT3CgMnt9ccwWVqGfI64XvvvBjZMG/sa3ZyKUVW
 uc8K0dAYDUgmNG2DSICEvQUEdCbWWegF0m7dYvC/Q6aP8lgvrRJiTTnvmHDgvs0uoaEd
 SYGw==
X-Gm-Message-State: AC+VfDzOMNbSxkVQihl6mRnzvVADS+sD4DkQMlBbrS7iM3HC2UYIMUxj
 OKhQ5p947TJKOxiVkZVUIiyeQA==
X-Google-Smtp-Source: ACHHUZ4uGV/j990UZ9scgnBLtAwTvs3+Wy4oyzXfCe9CZZg8qF+kkaN95URquO1nzT5Y9oDdzD/hAA==
X-Received: by 2002:a1c:750a:0:b0:3f4:16bc:bd19 with SMTP id
 o10-20020a1c750a000000b003f416bcbd19mr16088948wmc.23.1683902469997; 
 Fri, 12 May 2023 07:41:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 04/20] target/arm: Convert PC-rel addressing to decodetree
Date: Fri, 12 May 2023 15:40:50 +0100
Message-Id: <20230512144106.3608981-5-peter.maydell@linaro.org>
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

From: Richard Henderson <richard.henderson@linaro.org>

Convert the ADR and ADRP instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMM: Rebased]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      | 13 ++++++++++++
 target/arm/tcg/translate-a64.c | 38 +++++++++++++---------------------
 2 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 43321bbbb05..bcf46fc37d7 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -18,3 +18,16 @@
 #
 # This file is processed by scripts/decodetree.py
 #
+
+&ri              rd imm
+
+
+### Data Processing - Immediate
+
+# PC-rel addressing
+
+%imm_pcrel      5:s19 29:2
+@pcrel          . .. ..... ................... rd:5     &ri imm=%imm_pcrel
+
+ADR             0 .. 10000 ................... .....    @pcrel
+ADRP            1 .. 10000 ................... .....    @pcrel
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 2845febb713..ce3e8b1d08e 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4179,31 +4179,24 @@ static void disas_ldst(DisasContext *s, uint32_t insn)
     }
 }
 
-/* PC-rel. addressing
- *   31  30   29 28       24 23                5 4    0
- * +----+-------+-----------+-------------------+------+
- * | op | immlo | 1 0 0 0 0 |       immhi       |  Rd  |
- * +----+-------+-----------+-------------------+------+
+/*
+ * PC-rel. addressing
  */
-static void disas_pc_rel_adr(DisasContext *s, uint32_t insn)
+
+static bool trans_ADR(DisasContext *s, arg_ri *a)
 {
-    unsigned int page, rd;
-    int64_t offset;
+    gen_pc_plus_diff(s, cpu_reg(s, a->rd), a->imm);
+    return true;
+}
 
-    page = extract32(insn, 31, 1);
-    /* SignExtend(immhi:immlo) -> offset */
-    offset = sextract64(insn, 5, 19);
-    offset = offset << 2 | extract32(insn, 29, 2);
-    rd = extract32(insn, 0, 5);
+static bool trans_ADRP(DisasContext *s, arg_ri *a)
+{
+    int64_t offset = (int64_t)a->imm << 12;
 
-    if (page) {
-        /* ADRP (page based) */
-        offset <<= 12;
-        /* The page offset is ok for CF_PCREL. */
-        offset -= s->pc_curr & 0xfff;
-    }
-
-    gen_pc_plus_diff(s, cpu_reg(s, rd), offset);
+    /* The page offset is ok for CF_PCREL. */
+    offset -= s->pc_curr & 0xfff;
+    gen_pc_plus_diff(s, cpu_reg(s, a->rd), offset);
+    return true;
 }
 
 /*
@@ -4656,9 +4649,6 @@ static void disas_extract(DisasContext *s, uint32_t insn)
 static void disas_data_proc_imm(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 23, 6)) {
-    case 0x20: case 0x21: /* PC-rel. addressing */
-        disas_pc_rel_adr(s, insn);
-        break;
     case 0x22: /* Add/subtract (immediate) */
         disas_add_sub_imm(s, insn);
         break;
-- 
2.34.1


