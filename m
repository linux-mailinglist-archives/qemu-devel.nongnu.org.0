Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623953B7895
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:26:15 +0200 (CEST)
Received: from localhost ([::1]:36754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJN8-0008UU-Fo
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItV-0000FI-Ev
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:37 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItF-0000zh-RI
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:37 -0400
Received: by mail-pl1-x62e.google.com with SMTP id f11so69844plg.0
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4YyQO3FbDlFClyDWmJjxOpZ7dtoBaiXSXTjpxONdiUM=;
 b=WWr/PUYkSSa/zt3903ubJTV2f3TtxRNFDWcAlfLVub1MaHZOvVlpBnDlzTZ3+oBbQ8
 jMVqfxEcv4Q3irgjPDhnv1oLMtHNHM07VRk4uQML6IY+uP87wOsbjgv/ZHgV0TKPMDOj
 8ksxTIOrKgpWjoF5MS8/oTT1W9UUkyLuvuXLkBtkqj5rcGvhRhS4PqTNZtFyDHwSM9KV
 4+RDNy9Gedu3TzIfa/nBGVB8Qkex7SoaWeXSMrYQ7ny9J+rLuJqCnrcp5teT0iM3jD+T
 nzfHUtYsXU44feFqCfed53DdT05AQ/TXJGemOLnNa2trq0fiFa+ZG0W41GHjyOth5jaw
 m6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4YyQO3FbDlFClyDWmJjxOpZ7dtoBaiXSXTjpxONdiUM=;
 b=QnwXEqDYd2FGtRuxmCL4wxpPnSC86JYTQ/t/KAIqu0bBpzEG7AemOZSz7G9wyyO99z
 r6+CQDuvsgqNgsz3FH8kclejUAre2xXcc1H+RRaYaMBctY2XS/wL2RY8HEOJcTpnIsXB
 wYbwWqRC6u2FKpaBAIyD/ZLSqVI8OZ6Pbm1FX7HniRKggkJpAkT5Nr0QqQVncNXclENY
 RGnurxOi3DEADVKAZoXqLKG0d/rQ1YHBqH4uPU2jGV82MgSGfvR78IvCpktI+/64kTWZ
 xoseVf1KqZ13H2Mr07/uiaI4cNQEL4tYjUEPH5pQ8678gAHc5ETN1JqQviSeFLUuI4P3
 O7TA==
X-Gm-Message-State: AOAM530oWJKxKAblSU32W9blA8aw0u7xwtglvbsUOVnFjPmIwn1TsN72
 2X0U7Y4tyP+4YH9YTHAN96Km7xgP0UTbmw==
X-Google-Smtp-Source: ABdhPJxUSvceqjz2R55IXEIQBOvXY291m64c/U/PNM5/HmDhrD0qeZxbOrIw3t09UPaIweQ9ncCdjg==
X-Received: by 2002:a17:902:7806:b029:128:cef0:e4f7 with SMTP id
 p6-20020a1709027806b0290128cef0e4f7mr13409564pll.14.1624992920467; 
 Tue, 29 Jun 2021 11:55:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/63] tcg/arm: Support bswap flags
Date: Tue, 29 Jun 2021 11:54:31 -0700
Message-Id: <20210629185455.3131172-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Combine the three bswap16 routines, and differentiate via the flags.
Use the correct flags combination from the load/store routines, and
pass along the constant parameter from tcg_out_op.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 101 ++++++++++++++++++++++++---------------
 1 file changed, 63 insertions(+), 38 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 5157143246..73e0455511 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1013,50 +1013,71 @@ static inline void tcg_out_ext16u(TCGContext *s, int cond,
     }
 }
 
-static inline void tcg_out_bswap16s(TCGContext *s, int cond, int rd, int rn)
+static void tcg_out_bswap16(TCGContext *s, int cond, int rd, int rn, int flags)
 {
     if (use_armv6_instructions) {
-        /* revsh */
-        tcg_out32(s, 0x06ff0fb0 | (cond << 28) | (rd << 12) | rn);
-    } else {
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        TCG_REG_TMP, 0, rn, SHIFT_IMM_LSL(24));
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        TCG_REG_TMP, 0, TCG_REG_TMP, SHIFT_IMM_ASR(16));
-        tcg_out_dat_reg(s, cond, ARITH_ORR,
-                        rd, TCG_REG_TMP, rn, SHIFT_IMM_LSR(8));
-    }
-}
+        if (flags & TCG_BSWAP_OS) {
+            /* revsh */
+            tcg_out32(s, 0x06ff0fb0 | (cond << 28) | (rd << 12) | rn);
+            return;
+        }
 
-static inline void tcg_out_bswap16(TCGContext *s, int cond, int rd, int rn)
-{
-    if (use_armv6_instructions) {
         /* rev16 */
         tcg_out32(s, 0x06bf0fb0 | (cond << 28) | (rd << 12) | rn);
-    } else {
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        TCG_REG_TMP, 0, rn, SHIFT_IMM_LSL(24));
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        TCG_REG_TMP, 0, TCG_REG_TMP, SHIFT_IMM_LSR(16));
-        tcg_out_dat_reg(s, cond, ARITH_ORR,
-                        rd, TCG_REG_TMP, rn, SHIFT_IMM_LSR(8));
+        if ((flags & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            /* uxth */
+            tcg_out32(s, 0x06ff0070 | (cond << 28) | (rd << 12) | rd);
+        }
+        return;
     }
-}
 
-/* swap the two low bytes assuming that the two high input bytes and the
-   two high output bit can hold any value. */
-static inline void tcg_out_bswap16st(TCGContext *s, int cond, int rd, int rn)
-{
-    if (use_armv6_instructions) {
-        /* rev16 */
-        tcg_out32(s, 0x06bf0fb0 | (cond << 28) | (rd << 12) | rn);
-    } else {
+    if (flags == 0) {
+        /*
+         * For stores, no input or output extension:
+         *                              rn  = xxAB
+         * lsr tmp, rn, #8              tmp = 0xxA
+         * and tmp, tmp, #0xff          tmp = 000A
+         * orr rd, tmp, rn, lsl #8      rd  = xABA
+         */
         tcg_out_dat_reg(s, cond, ARITH_MOV,
                         TCG_REG_TMP, 0, rn, SHIFT_IMM_LSR(8));
         tcg_out_dat_imm(s, cond, ARITH_AND, TCG_REG_TMP, TCG_REG_TMP, 0xff);
         tcg_out_dat_reg(s, cond, ARITH_ORR,
                         rd, TCG_REG_TMP, rn, SHIFT_IMM_LSL(8));
+        return;
     }
+
+    /*
+     * Byte swap, leaving the result at the top of the register.
+     * We will then shift down, zero or sign-extending.
+     */
+    if (flags & TCG_BSWAP_IZ) {
+        /*
+         *                              rn  = 00AB
+         * ror tmp, rn, #8              tmp = B00A
+         * orr tmp, tmp, tmp, lsl #16   tmp = BA00
+         */
+        tcg_out_dat_reg(s, cond, ARITH_MOV,
+                        TCG_REG_TMP, 0, rn, SHIFT_IMM_ROR(8));
+        tcg_out_dat_reg(s, cond, ARITH_ORR,
+                        TCG_REG_TMP, TCG_REG_TMP, TCG_REG_TMP,
+                        SHIFT_IMM_LSL(16));
+    } else {
+        /*
+         *                              rn  = xxAB
+         * and tmp, rn, #0xff00         tmp = 00A0
+         * lsl tmp, tmp, #8             tmp = 0A00
+         * orr tmp, tmp, rn, lsl #24    tmp = BA00
+         */
+        tcg_out_dat_rI(s, cond, ARITH_AND, TCG_REG_TMP, rn, 0xff00, 1);
+        tcg_out_dat_reg(s, cond, ARITH_MOV,
+                        TCG_REG_TMP, 0, TCG_REG_TMP, SHIFT_IMM_LSL(8));
+        tcg_out_dat_reg(s, cond, ARITH_ORR,
+                        TCG_REG_TMP, TCG_REG_TMP, rn, SHIFT_IMM_LSL(24));
+    }
+    tcg_out_dat_reg(s, cond, ARITH_MOV, rd, 0, TCG_REG_TMP,
+                    (flags & TCG_BSWAP_OS
+                     ? SHIFT_IMM_ASR(8) : SHIFT_IMM_LSR(8)));
 }
 
 static inline void tcg_out_bswap32(TCGContext *s, int cond, int rd, int rn)
@@ -1705,13 +1726,15 @@ static inline void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
     case MO_UW:
         tcg_out_ld16u_r(s, COND_AL, datalo, addrlo, addend);
         if (bswap) {
-            tcg_out_bswap16(s, COND_AL, datalo, datalo);
+            tcg_out_bswap16(s, COND_AL, datalo, datalo,
+                            TCG_BSWAP_IZ | TCG_BSWAP_OZ);
         }
         break;
     case MO_SW:
         if (bswap) {
             tcg_out_ld16u_r(s, COND_AL, datalo, addrlo, addend);
-            tcg_out_bswap16s(s, COND_AL, datalo, datalo);
+            tcg_out_bswap16(s, COND_AL, datalo, datalo,
+                            TCG_BSWAP_IZ | TCG_BSWAP_OS);
         } else {
             tcg_out_ld16s_r(s, COND_AL, datalo, addrlo, addend);
         }
@@ -1766,13 +1789,15 @@ static inline void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc,
     case MO_UW:
         tcg_out_ld16u_8(s, COND_AL, datalo, addrlo, 0);
         if (bswap) {
-            tcg_out_bswap16(s, COND_AL, datalo, datalo);
+            tcg_out_bswap16(s, COND_AL, datalo, datalo,
+                            TCG_BSWAP_IZ | TCG_BSWAP_OZ);
         }
         break;
     case MO_SW:
         if (bswap) {
             tcg_out_ld16u_8(s, COND_AL, datalo, addrlo, 0);
-            tcg_out_bswap16s(s, COND_AL, datalo, datalo);
+            tcg_out_bswap16(s, COND_AL, datalo, datalo,
+                            TCG_BSWAP_IZ | TCG_BSWAP_OS);
         } else {
             tcg_out_ld16s_8(s, COND_AL, datalo, addrlo, 0);
         }
@@ -1862,7 +1887,7 @@ static inline void tcg_out_qemu_st_index(TCGContext *s, int cond, MemOp opc,
         break;
     case MO_16:
         if (bswap) {
-            tcg_out_bswap16st(s, cond, TCG_REG_R0, datalo);
+            tcg_out_bswap16(s, cond, TCG_REG_R0, datalo, 0);
             tcg_out_st16_r(s, cond, TCG_REG_R0, addrlo, addend);
         } else {
             tcg_out_st16_r(s, cond, datalo, addrlo, addend);
@@ -1907,7 +1932,7 @@ static inline void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc,
         break;
     case MO_16:
         if (bswap) {
-            tcg_out_bswap16st(s, COND_AL, TCG_REG_R0, datalo);
+            tcg_out_bswap16(s, COND_AL, TCG_REG_R0, datalo, 0);
             tcg_out_st16_8(s, COND_AL, TCG_REG_R0, addrlo, 0);
         } else {
             tcg_out_st16_8(s, COND_AL, datalo, addrlo, 0);
@@ -2245,7 +2270,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_bswap16_i32:
-        tcg_out_bswap16(s, COND_AL, args[0], args[1]);
+        tcg_out_bswap16(s, COND_AL, args[0], args[1], args[2]);
         break;
     case INDEX_op_bswap32_i32:
         tcg_out_bswap32(s, COND_AL, args[0], args[1]);
-- 
2.25.1


