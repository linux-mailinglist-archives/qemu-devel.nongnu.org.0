Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5733700A8A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:43:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTxb-00076R-Rt; Fri, 12 May 2023 10:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxY-00071Y-T3
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:28 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxK-0004j2-IP
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:28 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f415a90215so77656135e9.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902473; x=1686494473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nzdtd8sSIBwgurLXo/J3BqpDdo3UGdPx+81efDnWFSc=;
 b=nYq+L2cqItWFFHTDHAFPB6RmQyZyQWl7BQo8w/cldvMZ3F/Tc/DUAabHWbwiBwSFLM
 8k4adEW3y3ckjvILkQ+Uu8lsTqXNPMN/cExxmljZVqYlqqI+QbICf8tviZ4T1Y1FzqYt
 qcES4CXyp+XAi8t/yRbZ/DQlQ3vqXKxDpdmgy6ZVRg2QB+31q3diFG6UkLyfwu4ICQSq
 sYomkmWjahQejtbuLugL/19Qjs6APkDhgTJYyjOE42qBgMaPs0a9qH6GC6T+24o7PU4p
 kesXbGLpBOXTRocIICXjCgzzKCaF8GMXuAO+MnkvDRDRbsILlEjhV2ATBAIMcC2kg3w5
 yR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902473; x=1686494473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nzdtd8sSIBwgurLXo/J3BqpDdo3UGdPx+81efDnWFSc=;
 b=TByXLUzy3MqIQCz3LZmiLmzW9ZP9II4qiVi5yXW9Lb5RNJb0mGxeZqLSWccnGaFG8A
 f1MuYJ6ps4it8D04Dk9/selsB7nw8wEV+g+8UYvQ6Hlk32Ej6WlA6/1tfrCBTi3Zb8Sc
 mkb62ordqyrtqBQCZomOMC6E/yU3jB8CKX5rOYBEd4ZUti3E4wy/oxZEgbIKalRmKi+F
 U386v4ns1NIwLiSxjP2NRiItNZmzK/VOYHI4kI3U38pe1Ic4Pydux6Z+EwSgc2bbX/iJ
 C1JNbAI8DtNOUEQghcJoRBuSWeNutSXNCVgQf5F5xmzeNINWOkMZVNDMpY1juUF8RD6t
 Pwdg==
X-Gm-Message-State: AC+VfDwrrbEwRRfkinujYF7BAbIBfMrA3vZyD4QuFE9G60s+5bh6yoI/
 YwKs+u9+hSj2DiFFoXHPS/DnZQ==
X-Google-Smtp-Source: ACHHUZ7vTSiv+aHnGPEfNJqa8ZN3TjFNEpti17LkcOoR8qz+nnYpGtQo3MQBrEsLcCnC0udQOMUDMw==
X-Received: by 2002:a7b:ca42:0:b0:3f1:6fb3:ffcc with SMTP id
 m2-20020a7bca42000000b003f16fb3ffccmr16752655wml.22.1683902473125; 
 Fri, 12 May 2023 07:41:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 10/20] target/arm: Convert Move wide (immediate) to decodetree
Date: Fri, 12 May 2023 15:40:56 +0100
Message-Id: <20230512144106.3608981-11-peter.maydell@linaro.org>
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

Convert the MON, MOVZ, MOVK instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMM: Rebased]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      | 13 ++++++
 target/arm/tcg/translate-a64.c | 73 ++++++++++++++--------------------
 2 files changed, 42 insertions(+), 44 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 1933afa457b..350b37c8f37 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -71,3 +71,16 @@ EOR_i           . 10 100100 . ...... ...... ..... ..... @logic_imm_64
 EOR_i           . 10 100100 . ...... ...... ..... ..... @logic_imm_32
 ANDS_i          . 11 100100 . ...... ...... ..... ..... @logic_imm_64
 ANDS_i          . 11 100100 . ...... ...... ..... ..... @logic_imm_32
+
+# Move wide (immediate)
+
+&movw           rd sf imm hw
+@movw_64        1 .. ...... hw:2   imm:16 rd:5          &movw sf=1
+@movw_32        0 .. ...... 0 hw:1 imm:16 rd:5          &movw sf=0
+
+MOVN            . 00 100101 .. ................ .....   @movw_64
+MOVN            . 00 100101 .. ................ .....   @movw_32
+MOVZ            . 10 100101 .. ................ .....   @movw_64
+MOVZ            . 10 100101 .. ................ .....   @movw_32
+MOVK            . 11 100101 .. ................ .....   @movw_64
+MOVK            . 11 100101 .. ................ .....   @movw_32
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1273c4de456..a36b98925fb 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4395,52 +4395,40 @@ TRANS(ANDS_i, gen_rri_log, a, true, tcg_gen_andi_i64)
 
 /*
  * Move wide (immediate)
- *
- *  31 30 29 28         23 22 21 20             5 4    0
- * +--+-----+-------------+-----+----------------+------+
- * |sf| opc | 1 0 0 1 0 1 |  hw |  imm16         |  Rd  |
- * +--+-----+-------------+-----+----------------+------+
- *
- * sf: 0 -> 32 bit, 1 -> 64 bit
- * opc: 00 -> N, 10 -> Z, 11 -> K
- * hw: shift/16 (0,16, and sf only 32, 48)
  */
-static void disas_movw_imm(DisasContext *s, uint32_t insn)
+
+static bool trans_MOVZ(DisasContext *s, arg_movw *a)
 {
-    int rd = extract32(insn, 0, 5);
-    uint64_t imm = extract32(insn, 5, 16);
-    int sf = extract32(insn, 31, 1);
-    int opc = extract32(insn, 29, 2);
-    int pos = extract32(insn, 21, 2) << 4;
-    TCGv_i64 tcg_rd = cpu_reg(s, rd);
+    int pos = a->hw << 4;
+    tcg_gen_movi_i64(cpu_reg(s, a->rd), (uint64_t)a->imm << pos);
+    return true;
+}
 
-    if (!sf && (pos >= 32)) {
-        unallocated_encoding(s);
-        return;
-    }
+static bool trans_MOVN(DisasContext *s, arg_movw *a)
+{
+    int pos = a->hw << 4;
+    uint64_t imm = a->imm;
 
-    switch (opc) {
-    case 0: /* MOVN */
-    case 2: /* MOVZ */
-        imm <<= pos;
-        if (opc == 0) {
-            imm = ~imm;
-        }
-        if (!sf) {
-            imm &= 0xffffffffu;
-        }
-        tcg_gen_movi_i64(tcg_rd, imm);
-        break;
-    case 3: /* MOVK */
-        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_constant_i64(imm), pos, 16);
-        if (!sf) {
-            tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
-        }
-        break;
-    default:
-        unallocated_encoding(s);
-        break;
+    imm = ~(imm << pos);
+    if (!a->sf) {
+        imm = (uint32_t)imm;
     }
+    tcg_gen_movi_i64(cpu_reg(s, a->rd), imm);
+    return true;
+}
+
+static bool trans_MOVK(DisasContext *s, arg_movw *a)
+{
+    int pos = a->hw << 4;
+    TCGv_i64 tcg_rd, tcg_im;
+
+    tcg_rd = cpu_reg(s, a->rd);
+    tcg_im = tcg_constant_i64(a->imm);
+    tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_im, pos, 16);
+    if (!a->sf) {
+        tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
+    }
+    return true;
 }
 
 /* Bitfield
@@ -4585,9 +4573,6 @@ static void disas_extract(DisasContext *s, uint32_t insn)
 static void disas_data_proc_imm(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 23, 6)) {
-    case 0x25: /* Move wide (immediate) */
-        disas_movw_imm(s, insn);
-        break;
     case 0x26: /* Bitfield */
         disas_bitfield(s, insn);
         break;
-- 
2.34.1


