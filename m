Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5578E700A8C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:43:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTxW-0006xI-Vl; Fri, 12 May 2023 10:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxV-0006vD-0D
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:25 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxJ-0004iH-Ki
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:24 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f435658d23so39601665e9.3
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902471; x=1686494471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hQ1oqtC4DuCr//tYDK0BhT/RRzDG+KYHXcvP6HahZio=;
 b=Lv05wGfSZYTUjO36rR0B0NTQR/2Q2ApVA3ljqstbWN4wLDb2dXME6kg831QQXdj7dE
 wklNzgMMBcSaOrdWJ/bCH4pwSdQsOZkt11e4Kl5oL2+itLRSgiCEoB7Dnd6XZTEG4iZJ
 471ut/tz3yz2ztvQvZBii88MI/2xrjGRK+Dy+GgmB+9dKYSwq6O33eMItD6+93mJ0gfG
 6VEbFjJ5NdRp9uVi+PkyTKwREN2XgMqgW6OvbrRixf6rT5gwWr67PElUNbBMmzaMYW4q
 D7NUlCxMdwiyi/FhxI8blGXQUdsLNWwN0ufSiEomw5iWLQr7NcAqpN5cKx4rTWtLtHwR
 dN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902471; x=1686494471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hQ1oqtC4DuCr//tYDK0BhT/RRzDG+KYHXcvP6HahZio=;
 b=OHt4IWI9vM1t4xrjauoHqu7AaCfZFPLNuUgXoWfDl/Qwj+PBAR58mrLS4MgUx/pbAT
 FIkLE/KtiLUm9ao2Hu85D/znnuU4fmwjK8Q4wgee0z/mByAp4HSnwFPfLsqgPt7ibTUS
 WPi8yZjOIvmFrf8SZPNE8+MRGCWunGPL+n0i+FVCISPLW8LfNBpbsD/cH578eP40K8fG
 4K2RZ5KhXOqzzN+rAHwFPF3/L4Dkvd9c0fv3XExpQO0cn0x3wSz1Y0ttGBSCF6sKDw5I
 ra+I2vKc1NWGkVg33nS07FSos90QJX5uv4bgxXd6o3HkOReVqRmbjxaRX5VQHW4RaF3p
 JmYA==
X-Gm-Message-State: AC+VfDz8NmJBCfofnpBeR5GaWF+9vcgOs+OBrIVy5L5k67Cxy54xZxJR
 PwRbVi1uRGVqgwoooUkVgcEpzQ==
X-Google-Smtp-Source: ACHHUZ548s3N1EpAvoYj/rBb1YEGDAiXjQkqeN5xoqVAMdzrqW08ogOhavn+xLBQdj4nSSBIswQDAA==
X-Received: by 2002:a05:600c:2047:b0:3f4:2452:9675 with SMTP id
 p7-20020a05600c204700b003f424529675mr12909989wmg.0.1683902471601; 
 Fri, 12 May 2023 07:41:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 07/20] target/arm: Convert Add/subtract (immediate with tags)
 to decodetree
Date: Fri, 12 May 2023 15:40:53 +0100
Message-Id: <20230512144106.3608981-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

Convert the ADDG and SUBG (immediate) instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMM: Rebased; use TRANS_FEAT()]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |  8 +++++++
 target/arm/tcg/translate-a64.c | 38 ++++++++++------------------------
 2 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 30c2ac7e271..ed03d9e1349 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -48,3 +48,11 @@ SUB_i           . 10 100010 0 ............ ..... .....  @addsub_imm
 SUB_i           . 10 100010 1 ............ ..... .....  @addsub_imm12
 SUBS_i          . 11 100010 0 ............ ..... .....  @addsub_imm
 SUBS_i          . 11 100010 1 ............ ..... .....  @addsub_imm12
+
+# Add/subtract (immediate with tags)
+
+&rri_tag        rd rn uimm6 uimm4
+@addsub_imm_tag . .. ...... . uimm6:6 .. uimm4:4 rn:5 rd:5 &rri_tag
+
+ADDG_i          1 00 100011 0 ...... 00 .... ..... ..... @addsub_imm_tag
+SUBG_i          1 10 100011 0 ...... 00 .... ..... ..... @addsub_imm_tag
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index fb12122a3fb..3636eaadce6 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4244,49 +4244,36 @@ TRANS(SUBS_i, gen_rri, a, 0, 1, a->sf ? gen_sub64_CC : gen_sub32_CC)
 
 /*
  * Add/subtract (immediate, with tags)
- *
- *  31 30 29 28         23 22 21     16 14      10 9   5 4   0
- * +--+--+--+-------------+--+---------+--+-------+-----+-----+
- * |sf|op| S| 1 0 0 0 1 1 |o2|  uimm6  |o3| uimm4 |  Rn | Rd  |
- * +--+--+--+-------------+--+---------+--+-------+-----+-----+
- *
- *    op: 0 -> add, 1 -> sub
  */
-static void disas_add_sub_imm_with_tags(DisasContext *s, uint32_t insn)
+
+static bool gen_add_sub_imm_with_tags(DisasContext *s, arg_rri_tag *a,
+                                      bool sub_op)
 {
-    int rd = extract32(insn, 0, 5);
-    int rn = extract32(insn, 5, 5);
-    int uimm4 = extract32(insn, 10, 4);
-    int uimm6 = extract32(insn, 16, 6);
-    bool sub_op = extract32(insn, 30, 1);
     TCGv_i64 tcg_rn, tcg_rd;
     int imm;
 
-    /* Test all of sf=1, S=0, o2=0, o3=0.  */
-    if ((insn & 0xa040c000u) != 0x80000000u ||
-        !dc_isar_feature(aa64_mte_insn_reg, s)) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    imm = uimm6 << LOG2_TAG_GRANULE;
+    imm = a->uimm6 << LOG2_TAG_GRANULE;
     if (sub_op) {
         imm = -imm;
     }
 
-    tcg_rn = cpu_reg_sp(s, rn);
-    tcg_rd = cpu_reg_sp(s, rd);
+    tcg_rn = cpu_reg_sp(s, a->rn);
+    tcg_rd = cpu_reg_sp(s, a->rd);
 
     if (s->ata) {
         gen_helper_addsubg(tcg_rd, cpu_env, tcg_rn,
                            tcg_constant_i32(imm),
-                           tcg_constant_i32(uimm4));
+                           tcg_constant_i32(a->uimm4));
     } else {
         tcg_gen_addi_i64(tcg_rd, tcg_rn, imm);
         gen_address_with_allocation_tag0(tcg_rd, tcg_rd);
     }
+    return true;
 }
 
+TRANS_FEAT(ADDG_i, aa64_mte_insn_reg, gen_add_sub_imm_with_tags, a, false)
+TRANS_FEAT(SUBG_i, aa64_mte_insn_reg, gen_add_sub_imm_with_tags, a, true)
+
 /* The input should be a value in the bottom e bits (with higher
  * bits zero); returns that value replicated into every element
  * of size e in a 64 bit integer.
@@ -4638,9 +4625,6 @@ static void disas_extract(DisasContext *s, uint32_t insn)
 static void disas_data_proc_imm(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 23, 6)) {
-    case 0x23: /* Add/subtract (immediate, with tags) */
-        disas_add_sub_imm_with_tags(s, insn);
-        break;
     case 0x24: /* Logical (immediate) */
         disas_logic_imm(s, insn);
         break;
-- 
2.34.1


