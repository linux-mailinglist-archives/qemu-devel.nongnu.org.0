Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9996DB87A
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 05:06:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkysN-0004Bh-Ot; Fri, 07 Apr 2023 23:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkysB-00047D-0j
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:16 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys8-0004Xx-HR
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:14 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-632384298b3so271007b3a.0
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 20:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680923051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SMU8At/4U7O1Bf4F5hIg0nT65apfwtt8AlnB6b9nPKA=;
 b=ou7uAIW3MZl13Z7eKTD+wPz+TNlGe3gYZGCDPxSNJIZ9rJYDDI9kPuBtHGPa6Ju4ZK
 39ZmJiMaHlLKco733GwV0epXcoWso6pHXF3hPHfztxqwci9Og++Oz+1ReMzw5JbatEu4
 MwEtO5q3ZORV0zAWpC9lcgTPlCHz7KGU6zIfPQcdYR1LaKIFJvP/cHiUB4F6RwJPNwuJ
 xNvMGjw3nNLFhrjaKhgGraVJbHKpLUx2aS4eOgVHplID2WbkvnYVAxGyZtuzVCR91Wuw
 /hP3sMRRVYDKTCa9/o0i+woKs0GeczfdZHEY/ZjB+a1ARrNvv2A6yZ8e7M0CbRdEfY1a
 ozSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680923051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SMU8At/4U7O1Bf4F5hIg0nT65apfwtt8AlnB6b9nPKA=;
 b=1oMLYj+egl7GbxTxX7Ns8msDFWsv4b7PA+EXQ6kIi15SXy7Hqt84+D2tQzdk8hMh1D
 PYP+e+mw12QHNcGTsWOGEXli093RcBowufvTZL5ZQXb55wK1ru6g/hluEoZTVvIRp9r9
 wq8B9xU4YoY40jbNY4sv7/CoXiIUrFY5a7OPuLa3ARybxaTUKNIAet1r3Yw2bKir1YOs
 YM1nkLeLzU/LiyH1SuNbGUJANjNiGy96Z4xawTuD5dwxZnd/9X5CplbyBM3Img1x8nsO
 5DJtzk3AUTFDntGJvIJJaMwsXaFEUzygjIHipo0DtCrkMENGMtHgblrPelAV/Y7qgqSO
 A+ig==
X-Gm-Message-State: AAQBX9ewa1UUaGn9jBO3yQYMoM0fyzQdGraqoBg1cpTtX91GbwbUXbeA
 4/G3fjG/y8zyLXmGSYN6+2U0QRTbM2D3JHrWHrc=
X-Google-Smtp-Source: AKy350b5U+RXh1NniLRBD7GZb2rbeQdqCb277wf3+KVMpGo8ye3jYKkwv8PFIjCGY952/5IaDQYwPA==
X-Received: by 2002:a05:6a00:2d95:b0:62d:d85b:fcfc with SMTP id
 fb21-20020a056a002d9500b0062dd85bfcfcmr4388409pfb.8.1680923050955; 
 Fri, 07 Apr 2023 20:04:10 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 c12-20020aa78e0c000000b0062b5a55835dsm3687025pfr.213.2023.04.07.20.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 20:04:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org
Subject: [PATCH 12/12] tcg/mips: Replace MIPS_BE with HOST_BIG_ENDIAN
Date: Fri,  7 Apr 2023 20:03:59 -0700
Message-Id: <20230408030359.3368868-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408030359.3368868-1-richard.henderson@linaro.org>
References: <20230408030359.3368868-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since e03b56863d2b, which replaced HOST_WORDS_BIGENDIAN
with HOST_BIG_ENDIAN, there is no need to define a second
symbol which is [0,1].

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 88 ++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 47 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 1df00bf027..9767065af0 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -27,14 +27,8 @@
 #include "../tcg-ldst.c.inc"
 #include "../tcg-pool.c.inc"
 
-#if HOST_BIG_ENDIAN
-# define MIPS_BE  1
-#else
-# define MIPS_BE  0
-#endif
-
 #if TCG_TARGET_REG_BITS == 32
-# define LO_OFF  (MIPS_BE * 4)
+# define LO_OFF  (HOST_BIG_ENDIAN * 4)
 # define HI_OFF  (4 - LO_OFF)
 #else
 /* Assert at compile-time that these values are never used for 64-bit. */
@@ -1354,7 +1348,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
         /* We eliminated V0 from the possible output registers, so it
            cannot be clobbered here.  So we must move V1 first.  */
-        if (MIPS_BE) {
+        if (HOST_BIG_ENDIAN) {
             tcg_out_mov(s, TCG_TYPE_I32, v0, TCG_REG_V1);
             v0 = l->datahi_reg;
         } else {
@@ -1438,8 +1432,8 @@ static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
         /* A0 is env, A1 is skipped, A2:A3 is the uint64_t address. */
-        TCGReg a2 = MIPS_BE ? l->addrhi_reg : l->addrlo_reg;
-        TCGReg a3 = MIPS_BE ? l->addrlo_reg : l->addrhi_reg;
+        TCGReg a2 = HOST_BIG_ENDIAN ? l->addrhi_reg : l->addrlo_reg;
+        TCGReg a3 = HOST_BIG_ENDIAN ? l->addrlo_reg : l->addrhi_reg;
 
         if (a3 != TCG_REG_A2) {
             tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A2, a2);
@@ -1551,8 +1545,8 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_opc_imm(s, OPC_LW, TCG_TMP1, base, 4);
             tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP0, 0, TCG_TMP0);
             tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP1, 0, TCG_TMP1);
-            tcg_out_opc_sa(s, OPC_ROTR, MIPS_BE ? lo : hi, TCG_TMP0, 16);
-            tcg_out_opc_sa(s, OPC_ROTR, MIPS_BE ? hi : lo, TCG_TMP1, 16);
+            tcg_out_opc_sa(s, OPC_ROTR, HOST_BIG_ENDIAN ? lo : hi, TCG_TMP0, 16);
+            tcg_out_opc_sa(s, OPC_ROTR, HOST_BIG_ENDIAN ? hi : lo, TCG_TMP1, 16);
         } else {
             tcg_out_bswap_subr(s, bswap32_addr);
             /* delay slot */
@@ -1560,15 +1554,15 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_opc_imm(s, OPC_LW, TCG_TMP0, base, 4);
             tcg_out_bswap_subr(s, bswap32_addr);
             /* delay slot */
-            tcg_out_mov(s, TCG_TYPE_I32, MIPS_BE ? lo : hi, TCG_TMP3);
-            tcg_out_mov(s, TCG_TYPE_I32, MIPS_BE ? hi : lo, TCG_TMP3);
+            tcg_out_mov(s, TCG_TYPE_I32, HOST_BIG_ENDIAN ? lo : hi, TCG_TMP3);
+            tcg_out_mov(s, TCG_TYPE_I32, HOST_BIG_ENDIAN ? hi : lo, TCG_TMP3);
         }
         break;
     case MO_UQ:
         /* Prefer to load from offset 0 first, but allow for overlap.  */
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_opc_imm(s, OPC_LD, lo, base, 0);
-        } else if (MIPS_BE ? hi != base : lo == base) {
+        } else if (HOST_BIG_ENDIAN ? hi != base : lo == base) {
             tcg_out_opc_imm(s, OPC_LW, hi, base, HI_OFF);
             tcg_out_opc_imm(s, OPC_LW, lo, base, LO_OFF);
         } else {
@@ -1584,10 +1578,10 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
 static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
                                     TCGReg base, MemOp opc, TCGType type)
 {
-    const MIPSInsn lw1 = MIPS_BE ? OPC_LWL : OPC_LWR;
-    const MIPSInsn lw2 = MIPS_BE ? OPC_LWR : OPC_LWL;
-    const MIPSInsn ld1 = MIPS_BE ? OPC_LDL : OPC_LDR;
-    const MIPSInsn ld2 = MIPS_BE ? OPC_LDR : OPC_LDL;
+    const MIPSInsn lw1 = HOST_BIG_ENDIAN ? OPC_LWL : OPC_LWR;
+    const MIPSInsn lw2 = HOST_BIG_ENDIAN ? OPC_LWR : OPC_LWL;
+    const MIPSInsn ld1 = HOST_BIG_ENDIAN ? OPC_LDL : OPC_LDR;
+    const MIPSInsn ld2 = HOST_BIG_ENDIAN ? OPC_LDR : OPC_LDL;
 
     bool sgn = (opc & MO_SIGN);
 
@@ -1653,10 +1647,10 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_opc_imm(s, ld1, lo, base, 0);
             tcg_out_opc_imm(s, ld2, lo, base, 7);
         } else {
-            tcg_out_opc_imm(s, lw1, MIPS_BE ? hi : lo, base, 0 + 0);
-            tcg_out_opc_imm(s, lw2, MIPS_BE ? hi : lo, base, 0 + 3);
-            tcg_out_opc_imm(s, lw1, MIPS_BE ? lo : hi, base, 4 + 0);
-            tcg_out_opc_imm(s, lw2, MIPS_BE ? lo : hi, base, 4 + 3);
+            tcg_out_opc_imm(s, lw1, HOST_BIG_ENDIAN ? hi : lo, base, 0 + 0);
+            tcg_out_opc_imm(s, lw2, HOST_BIG_ENDIAN ? hi : lo, base, 0 + 3);
+            tcg_out_opc_imm(s, lw1, HOST_BIG_ENDIAN ? lo : hi, base, 4 + 0);
+            tcg_out_opc_imm(s, lw2, HOST_BIG_ENDIAN ? lo : hi, base, 4 + 3);
         }
         break;
 
@@ -1680,19 +1674,19 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_opc_imm(s, lw2, TCG_TMP1, base, 4 + 3);
             tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP0, 0, TCG_TMP0);
             tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP1, 0, TCG_TMP1);
-            tcg_out_opc_sa(s, OPC_ROTR, MIPS_BE ? lo : hi, TCG_TMP0, 16);
-            tcg_out_opc_sa(s, OPC_ROTR, MIPS_BE ? hi : lo, TCG_TMP1, 16);
+            tcg_out_opc_sa(s, OPC_ROTR, HOST_BIG_ENDIAN ? lo : hi, TCG_TMP0, 16);
+            tcg_out_opc_sa(s, OPC_ROTR, HOST_BIG_ENDIAN ? hi : lo, TCG_TMP1, 16);
         } else {
             tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 0 + 0);
             tcg_out_bswap_subr(s, bswap32_addr);
             /* delay slot */
             tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 0 + 3);
             tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 4 + 0);
-            tcg_out_mov(s, TCG_TYPE_I32, MIPS_BE ? lo : hi, TCG_TMP3);
+            tcg_out_mov(s, TCG_TYPE_I32, HOST_BIG_ENDIAN ? lo : hi, TCG_TMP3);
             tcg_out_bswap_subr(s, bswap32_addr);
             /* delay slot */
             tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 4 + 3);
-            tcg_out_mov(s, TCG_TYPE_I32, MIPS_BE ? hi : lo, TCG_TMP3);
+            tcg_out_mov(s, TCG_TYPE_I32, HOST_BIG_ENDIAN ? hi : lo, TCG_TMP3);
         }
         break;
 
@@ -1802,16 +1796,16 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_bswap64(s, TCG_TMP3, lo);
             tcg_out_opc_imm(s, OPC_SD, TCG_TMP3, base, 0);
         } else if (use_mips32r2_instructions) {
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP0, 0, MIPS_BE ? lo : hi);
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP1, 0, MIPS_BE ? hi : lo);
+            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP0, 0, HOST_BIG_ENDIAN ? lo : hi);
+            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP1, 0, HOST_BIG_ENDIAN ? hi : lo);
             tcg_out_opc_sa(s, OPC_ROTR, TCG_TMP0, TCG_TMP0, 16);
             tcg_out_opc_sa(s, OPC_ROTR, TCG_TMP1, TCG_TMP1, 16);
             tcg_out_opc_imm(s, OPC_SW, TCG_TMP0, base, 0);
             tcg_out_opc_imm(s, OPC_SW, TCG_TMP1, base, 4);
         } else {
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? lo : hi, 0);
+            tcg_out_bswap32(s, TCG_TMP3, HOST_BIG_ENDIAN ? lo : hi, 0);
             tcg_out_opc_imm(s, OPC_SW, TCG_TMP3, base, 0);
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? hi : lo, 0);
+            tcg_out_bswap32(s, TCG_TMP3, HOST_BIG_ENDIAN ? hi : lo, 0);
             tcg_out_opc_imm(s, OPC_SW, TCG_TMP3, base, 4);
         }
         break;
@@ -1819,8 +1813,8 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_opc_imm(s, OPC_SD, lo, base, 0);
         } else {
-            tcg_out_opc_imm(s, OPC_SW, MIPS_BE ? hi : lo, base, 0);
-            tcg_out_opc_imm(s, OPC_SW, MIPS_BE ? lo : hi, base, 4);
+            tcg_out_opc_imm(s, OPC_SW, HOST_BIG_ENDIAN ? hi : lo, base, 0);
+            tcg_out_opc_imm(s, OPC_SW, HOST_BIG_ENDIAN ? lo : hi, base, 4);
         }
         break;
 
@@ -1832,10 +1826,10 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
 static void tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
                                     TCGReg base, MemOp opc)
 {
-    const MIPSInsn sw1 = MIPS_BE ? OPC_SWL : OPC_SWR;
-    const MIPSInsn sw2 = MIPS_BE ? OPC_SWR : OPC_SWL;
-    const MIPSInsn sd1 = MIPS_BE ? OPC_SDL : OPC_SDR;
-    const MIPSInsn sd2 = MIPS_BE ? OPC_SDR : OPC_SDL;
+    const MIPSInsn sw1 = HOST_BIG_ENDIAN ? OPC_SWL : OPC_SWR;
+    const MIPSInsn sw2 = HOST_BIG_ENDIAN ? OPC_SWR : OPC_SWL;
+    const MIPSInsn sd1 = HOST_BIG_ENDIAN ? OPC_SDL : OPC_SDR;
+    const MIPSInsn sd2 = HOST_BIG_ENDIAN ? OPC_SDR : OPC_SDL;
 
     /* Don't clutter the code below with checks to avoid bswapping ZERO.  */
     if ((lo | hi) == 0) {
@@ -1869,17 +1863,17 @@ static void tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_bswap64(s, TCG_TMP3, lo);
             lo = TCG_TMP3;
         } else if (use_mips32r2_instructions) {
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP0, 0, MIPS_BE ? hi : lo);
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP1, 0, MIPS_BE ? lo : hi);
+            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP0, 0, HOST_BIG_ENDIAN ? hi : lo);
+            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP1, 0, HOST_BIG_ENDIAN ? lo : hi);
             tcg_out_opc_sa(s, OPC_ROTR, TCG_TMP0, TCG_TMP0, 16);
             tcg_out_opc_sa(s, OPC_ROTR, TCG_TMP1, TCG_TMP1, 16);
-            hi = MIPS_BE ? TCG_TMP0 : TCG_TMP1;
-            lo = MIPS_BE ? TCG_TMP1 : TCG_TMP0;
+            hi = HOST_BIG_ENDIAN ? TCG_TMP0 : TCG_TMP1;
+            lo = HOST_BIG_ENDIAN ? TCG_TMP1 : TCG_TMP0;
         } else {
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? lo : hi, 0);
+            tcg_out_bswap32(s, TCG_TMP3, HOST_BIG_ENDIAN ? lo : hi, 0);
             tcg_out_opc_imm(s, sw1, TCG_TMP3, base, 0 + 0);
             tcg_out_opc_imm(s, sw2, TCG_TMP3, base, 0 + 3);
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? hi : lo, 0);
+            tcg_out_bswap32(s, TCG_TMP3, HOST_BIG_ENDIAN ? hi : lo, 0);
             tcg_out_opc_imm(s, sw1, TCG_TMP3, base, 4 + 0);
             tcg_out_opc_imm(s, sw2, TCG_TMP3, base, 4 + 3);
             break;
@@ -1890,10 +1884,10 @@ static void tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_opc_imm(s, sd1, lo, base, 0);
             tcg_out_opc_imm(s, sd2, lo, base, 7);
         } else {
-            tcg_out_opc_imm(s, sw1, MIPS_BE ? hi : lo, base, 0 + 0);
-            tcg_out_opc_imm(s, sw2, MIPS_BE ? hi : lo, base, 0 + 3);
-            tcg_out_opc_imm(s, sw1, MIPS_BE ? lo : hi, base, 4 + 0);
-            tcg_out_opc_imm(s, sw2, MIPS_BE ? lo : hi, base, 4 + 3);
+            tcg_out_opc_imm(s, sw1, HOST_BIG_ENDIAN ? hi : lo, base, 0 + 0);
+            tcg_out_opc_imm(s, sw2, HOST_BIG_ENDIAN ? hi : lo, base, 0 + 3);
+            tcg_out_opc_imm(s, sw1, HOST_BIG_ENDIAN ? lo : hi, base, 4 + 0);
+            tcg_out_opc_imm(s, sw2, HOST_BIG_ENDIAN ? lo : hi, base, 4 + 3);
         }
         break;
 
-- 
2.34.1


