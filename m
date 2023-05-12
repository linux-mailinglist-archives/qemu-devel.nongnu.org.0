Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DF9700A90
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:44:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTxf-0007AU-Qk; Fri, 12 May 2023 10:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxa-00074g-BH
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:30 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxL-0004jN-7n
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:30 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-306f2b42a86so6675666f8f.3
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902473; x=1686494473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B7nyR7O1R/Xj3JLca+ITi9DYuDIC2bfZZm42nTKWjuM=;
 b=CXfpV45F7L784+TxMCo4L8LJOinY7JibefPKU3zr+KdYvDfafa0UpeABMqBCmjTXCf
 jFqmx7oqqe7yKDfVAaLgS64UquFmW/kjab5vrTe6m2LdADTQRJIr5gKCNmRSSm+Xw2r0
 UhNyyDV3qhS4CEpxdEANvySr905mzLn7NZYuJIhaRs/YusscjeTgTdPQqofDm4buNdky
 WMT8jCQaSGk7E+FAznGqPM29BDcZs5jXMnQevbwTG7zngEJT+na58w+NtG5SLU44sXsK
 C7rrIYJVlBq1q+ufMhtgvfgCihLObey/dLTbEQsquoqZRtecQszBUmp+mBd6O1buk2cF
 LIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902473; x=1686494473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B7nyR7O1R/Xj3JLca+ITi9DYuDIC2bfZZm42nTKWjuM=;
 b=H4N5P06+s/1RfrsdaYVHn/dJ5wQrx4pP53ua0+ynVPVdIwS0YRUmGQWBhBW0NsUDh6
 b1ZVPo8Ugwagw/UVLOzqrgM/lejwKRKwBwkEwD6ZHwe5ONlHmBtCWn9bN4CmnR+MPhhK
 M3nE9Iq4QVRB8EI4IovQss+1Z33Qyi18s11LRu+rtqeZcV3HTEimx3GRcCrncRnoDZov
 BEewkLBKeOzYhDaTKo5bqaasDYwbtgs4k3A2pCIm09yWscpbIUP1aOrNqJ6HT14TMo0D
 rnpgbC0XCtX/LuesMhoABc6l7NK98OawSpr8yp6hin6gs8ujBlt5w3E735Q5HMdVdWzw
 /fyQ==
X-Gm-Message-State: AC+VfDw03iQFM+pWAyUDGqAgQgvEXFS3b29+mKUUH0TLwNJbk5bdX6wR
 08l0ia73C9hx+3sZVl/J4PKEma+nlJuhKxt7TdU=
X-Google-Smtp-Source: ACHHUZ6B4RxV5qU9hopxqcIj/nLjK18h9TFdcUaQxtu0YseZB2ibtQYqZl+lRqtNBkBANXkg/RHhrg==
X-Received: by 2002:adf:d092:0:b0:306:31fb:1c3d with SMTP id
 y18-20020adfd092000000b0030631fb1c3dmr16725735wrh.32.1683902473599; 
 Fri, 12 May 2023 07:41:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 11/20] target/arm: Convert Bitfield to decodetree
Date: Fri, 12 May 2023 15:40:57 +0100
Message-Id: <20230512144106.3608981-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Convert the BFM, SBFM, UBFM instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: Rebased]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |  13 +++
 target/arm/tcg/translate-a64.c | 144 ++++++++++++++++++---------------
 2 files changed, 94 insertions(+), 63 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 350b37c8f37..4d5709f9857 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -84,3 +84,16 @@ MOVZ            . 10 100101 .. ................ .....   @movw_64
 MOVZ            . 10 100101 .. ................ .....   @movw_32
 MOVK            . 11 100101 .. ................ .....   @movw_64
 MOVK            . 11 100101 .. ................ .....   @movw_32
+
+# Bitfield
+
+&bitfield       rd rn sf immr imms
+@bitfield_64    1 .. ...... 1 immr:6 imms:6 rn:5 rd:5      &bitfield sf=1
+@bitfield_32    0 .. ...... 0 0 immr:5 0 imms:5 rn:5 rd:5  &bitfield sf=0
+
+SBFM            . 00 100110 . ...... ...... ..... ..... @bitfield_64
+SBFM            . 00 100110 . ...... ...... ..... ..... @bitfield_32
+BFM             . 01 100110 . ...... ...... ..... ..... @bitfield_64
+BFM             . 01 100110 . ...... ...... ..... ..... @bitfield_32
+UBFM            . 10 100110 . ...... ...... ..... ..... @bitfield_64
+UBFM            . 10 100110 . ...... ...... ..... ..... @bitfield_32
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index a36b98925fb..f5649de60a8 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4431,82 +4431,103 @@ static bool trans_MOVK(DisasContext *s, arg_movw *a)
     return true;
 }
 
-/* Bitfield
- *   31  30 29 28         23 22  21  16 15  10 9    5 4    0
- * +----+-----+-------------+---+------+------+------+------+
- * | sf | opc | 1 0 0 1 1 0 | N | immr | imms |  Rn  |  Rd  |
- * +----+-----+-------------+---+------+------+------+------+
+/*
+ * Bitfield
  */
-static void disas_bitfield(DisasContext *s, uint32_t insn)
+
+static bool trans_SBFM(DisasContext *s, arg_SBFM *a)
 {
-    unsigned int sf, n, opc, ri, si, rn, rd, bitsize, pos, len;
-    TCGv_i64 tcg_rd, tcg_tmp;
+    TCGv_i64 tcg_rd = cpu_reg(s, a->rd);
+    TCGv_i64 tcg_tmp = read_cpu_reg(s, a->rn, 1);
+    unsigned int bitsize = a->sf ? 64 : 32;
+    unsigned int ri = a->immr;
+    unsigned int si = a->imms;
+    unsigned int pos, len;
 
-    sf = extract32(insn, 31, 1);
-    opc = extract32(insn, 29, 2);
-    n = extract32(insn, 22, 1);
-    ri = extract32(insn, 16, 6);
-    si = extract32(insn, 10, 6);
-    rn = extract32(insn, 5, 5);
-    rd = extract32(insn, 0, 5);
-    bitsize = sf ? 64 : 32;
-
-    if (sf != n || ri >= bitsize || si >= bitsize || opc > 2) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    tcg_rd = cpu_reg(s, rd);
-
-    /* Suppress the zero-extend for !sf.  Since RI and SI are constrained
-       to be smaller than bitsize, we'll never reference data outside the
-       low 32-bits anyway.  */
-    tcg_tmp = read_cpu_reg(s, rn, 1);
-
-    /* Recognize simple(r) extractions.  */
     if (si >= ri) {
         /* Wd<s-r:0> = Wn<s:r> */
         len = (si - ri) + 1;
-        if (opc == 0) { /* SBFM: ASR, SBFX, SXTB, SXTH, SXTW */
-            tcg_gen_sextract_i64(tcg_rd, tcg_tmp, ri, len);
-            goto done;
-        } else if (opc == 2) { /* UBFM: UBFX, LSR, UXTB, UXTH */
-            tcg_gen_extract_i64(tcg_rd, tcg_tmp, ri, len);
-            return;
+        tcg_gen_sextract_i64(tcg_rd, tcg_tmp, ri, len);
+        if (!a->sf) {
+            tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
         }
-        /* opc == 1, BFXIL fall through to deposit */
+    } else {
+        /* Wd<32+s-r,32-r> = Wn<s:0> */
+        len = si + 1;
+        pos = (bitsize - ri) & (bitsize - 1);
+
+        if (len < ri) {
+            /*
+             * Sign extend the destination field from len to fill the
+             * balance of the word.  Let the deposit below insert all
+             * of those sign bits.
+             */
+            tcg_gen_sextract_i64(tcg_tmp, tcg_tmp, 0, len);
+            len = ri;
+        }
+
+        /*
+         * We start with zero, and we haven't modified any bits outside
+         * bitsize, therefore no final zero-extension is unneeded for !sf.
+         */
+        tcg_gen_deposit_z_i64(tcg_rd, tcg_tmp, pos, len);
+    }
+    return true;
+}
+
+static bool trans_UBFM(DisasContext *s, arg_UBFM *a)
+{
+    TCGv_i64 tcg_rd = cpu_reg(s, a->rd);
+    TCGv_i64 tcg_tmp = read_cpu_reg(s, a->rn, 1);
+    unsigned int bitsize = a->sf ? 64 : 32;
+    unsigned int ri = a->immr;
+    unsigned int si = a->imms;
+    unsigned int pos, len;
+
+    tcg_rd = cpu_reg(s, a->rd);
+    tcg_tmp = read_cpu_reg(s, a->rn, 1);
+
+    if (si >= ri) {
+        /* Wd<s-r:0> = Wn<s:r> */
+        len = (si - ri) + 1;
+        tcg_gen_extract_i64(tcg_rd, tcg_tmp, ri, len);
+    } else {
+        /* Wd<32+s-r,32-r> = Wn<s:0> */
+        len = si + 1;
+        pos = (bitsize - ri) & (bitsize - 1);
+        tcg_gen_deposit_z_i64(tcg_rd, tcg_tmp, pos, len);
+    }
+    return true;
+}
+
+static bool trans_BFM(DisasContext *s, arg_BFM *a)
+{
+    TCGv_i64 tcg_rd = cpu_reg(s, a->rd);
+    TCGv_i64 tcg_tmp = read_cpu_reg(s, a->rn, 1);
+    unsigned int bitsize = a->sf ? 64 : 32;
+    unsigned int ri = a->immr;
+    unsigned int si = a->imms;
+    unsigned int pos, len;
+
+    tcg_rd = cpu_reg(s, a->rd);
+    tcg_tmp = read_cpu_reg(s, a->rn, 1);
+
+    if (si >= ri) {
+        /* Wd<s-r:0> = Wn<s:r> */
         tcg_gen_shri_i64(tcg_tmp, tcg_tmp, ri);
+        len = (si - ri) + 1;
         pos = 0;
     } else {
-        /* Handle the ri > si case with a deposit
-         * Wd<32+s-r,32-r> = Wn<s:0>
-         */
+        /* Wd<32+s-r,32-r> = Wn<s:0> */
         len = si + 1;
         pos = (bitsize - ri) & (bitsize - 1);
     }
 
-    if (opc == 0 && len < ri) {
-        /* SBFM: sign extend the destination field from len to fill
-           the balance of the word.  Let the deposit below insert all
-           of those sign bits.  */
-        tcg_gen_sextract_i64(tcg_tmp, tcg_tmp, 0, len);
-        len = ri;
-    }
-
-    if (opc == 1) { /* BFM, BFXIL */
-        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, pos, len);
-    } else {
-        /* SBFM or UBFM: We start with zero, and we haven't modified
-           any bits outside bitsize, therefore the zero-extension
-           below is unneeded.  */
-        tcg_gen_deposit_z_i64(tcg_rd, tcg_tmp, pos, len);
-        return;
-    }
-
- done:
-    if (!sf) { /* zero extend final result */
+    tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, pos, len);
+    if (!a->sf) {
         tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
     }
+    return true;
 }
 
 /* Extract
@@ -4573,9 +4594,6 @@ static void disas_extract(DisasContext *s, uint32_t insn)
 static void disas_data_proc_imm(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 23, 6)) {
-    case 0x26: /* Bitfield */
-        disas_bitfield(s, insn);
-        break;
     case 0x27: /* Extract */
         disas_extract(s, insn);
         break;
-- 
2.34.1


