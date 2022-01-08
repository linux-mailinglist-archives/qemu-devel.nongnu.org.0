Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A5A48821A
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 08:19:48 +0100 (CET)
Received: from localhost ([::1]:39356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n660x-0000Cy-CQ
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:19:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65I3-0001Lt-Jo
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:33:30 -0500
Received: from [2607:f8b0:4864:20::102f] (port=53010
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65I1-0003cH-KD
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:33:23 -0500
Received: by mail-pj1-x102f.google.com with SMTP id pj2so5878023pjb.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qiheRZfPkN/WV7mHuxWK1QcAkexQvnGwQPuHTMHYn+4=;
 b=NH15t+vY1L+ytv+reMmyoaTPmm03JpeJiBcz/qBYOD199UK9+h6TaYiGsuCBO46E1i
 3bK4NJzsS1K0GU1WUTy5RxIwBRSZBjejG27esweGYvwhrUGCeTXN1LiBGnMsNgSkJ0g8
 Y7sH44syptNf4TsQdLYbSCRNdLG/i9jI4CGrr9+0xweqGcvx70PbeOfa1cX/qwny3fNj
 sVP1Cxf9Nw6Z2h/fa55xNizm6J2+NUsO30xBjbr3hDIWb9rOiNN7kEA+N+GctVUNqK9h
 BATGLn76tNdO61ERZ9SRI5CxGRGObKwRthlj3ML1OHYTJnaXczZ9OKL3Y0MdBBRCKdDX
 FI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qiheRZfPkN/WV7mHuxWK1QcAkexQvnGwQPuHTMHYn+4=;
 b=rdxl37VfB5wphorPWuMHbFZuUvs0VlkAZwgDy5kPFnnaADwkNYWBGBYi0pr5nZqT1p
 COcIzbCcmxuBq1xJxlrCZOfG5ARvkjs3Kh8LHK4YfWPLO73k1D5WgAukarPHI2F+cfz3
 NytKWAIf1g4fXYuuSEuuEACJ9/o9AgbzXh5bRCZcZpjVvpwy/+1Y3JYSJOYf38ADio0N
 3HYJjWJ5CBzpR7TLXdZyY66KzzEUDwf/N9i9QiF6d4b6DE6Do7SvKOvpz8bM6oWZcR60
 UWPIq/sQFgCOZjeGAXdUROR+UgVSJxCTviHB1N7eP2bIhZmh/w2uYLdYBWsExKqDe6jA
 pUzw==
X-Gm-Message-State: AOAM53163TWjZcvSFGHcJP3iT1fCXgQ5cz1NjMdJ5E3JZQsoTyNiu1DR
 Aq8M5CZ7xYMwGacYIRIvbTAXtQKkqEcKzg==
X-Google-Smtp-Source: ABdhPJxOTxfbo9OrBHPH+x+11FB2/MgDwe5uELHNi8wHxaBVEzm63p7gYS+hS9DRK3RtmboFY1jq1A==
X-Received: by 2002:a17:903:32c3:b0:14a:1597:99ff with SMTP id
 i3-20020a17090332c300b0014a159799ffmr2594309plr.13.1641623600254; 
 Fri, 07 Jan 2022 22:33:20 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s7sm834760pfu.133.2022.01.07.22.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:33:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/7] tcg/arm: Remove use_armv6_instructions
Date: Fri,  7 Jan 2022 22:33:09 -0800
Message-Id: <20220108063313.477784-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220108063313.477784-1-richard.henderson@linaro.org>
References: <20220108063313.477784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is now always true, since we require armv6.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h     |   1 -
 tcg/arm/tcg-target.c.inc | 192 ++++++---------------------------------
 2 files changed, 27 insertions(+), 166 deletions(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 5c9ba5feea..1dd4cd5377 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -28,7 +28,6 @@
 
 extern int arm_arch;
 
-#define use_armv6_instructions  (__ARM_ARCH >= 6 || arm_arch >= 6)
 #define use_armv7_instructions  (__ARM_ARCH >= 7 || arm_arch >= 7)
 
 #undef TCG_TARGET_STACK_GROWSUP
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index fd30e6e99e..ea8b90e6e2 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -923,17 +923,6 @@ static void tcg_out_dat_rIN(TCGContext *s, ARMCond cond, ARMInsn opc,
 static void tcg_out_mul32(TCGContext *s, ARMCond cond, TCGReg rd,
                           TCGReg rn, TCGReg rm)
 {
-    /* if ArchVersion() < 6 && d == n then UNPREDICTABLE;  */
-    if (!use_armv6_instructions && rd == rn) {
-        if (rd == rm) {
-            /* rd == rn == rm; copy an input to tmp first.  */
-            tcg_out_mov_reg(s, cond, TCG_REG_TMP, rn);
-            rm = rn = TCG_REG_TMP;
-        } else {
-            rn = rm;
-            rm = rd;
-        }
-    }
     /* mul */
     tcg_out32(s, (cond << 28) | 0x90 | (rd << 16) | (rm << 8) | rn);
 }
@@ -941,17 +930,6 @@ static void tcg_out_mul32(TCGContext *s, ARMCond cond, TCGReg rd,
 static void tcg_out_umull32(TCGContext *s, ARMCond cond, TCGReg rd0,
                             TCGReg rd1, TCGReg rn, TCGReg rm)
 {
-    /* if ArchVersion() < 6 && (dHi == n || dLo == n) then UNPREDICTABLE;  */
-    if (!use_armv6_instructions && (rd0 == rn || rd1 == rn)) {
-        if (rd0 == rm || rd1 == rm) {
-            tcg_out_mov_reg(s, cond, TCG_REG_TMP, rn);
-            rn = TCG_REG_TMP;
-        } else {
-            TCGReg t = rn;
-            rn = rm;
-            rm = t;
-        }
-    }
     /* umull */
     tcg_out32(s, (cond << 28) | 0x00800090 |
               (rd1 << 16) | (rd0 << 12) | (rm << 8) | rn);
@@ -960,17 +938,6 @@ static void tcg_out_umull32(TCGContext *s, ARMCond cond, TCGReg rd0,
 static void tcg_out_smull32(TCGContext *s, ARMCond cond, TCGReg rd0,
                             TCGReg rd1, TCGReg rn, TCGReg rm)
 {
-    /* if ArchVersion() < 6 && (dHi == n || dLo == n) then UNPREDICTABLE;  */
-    if (!use_armv6_instructions && (rd0 == rn || rd1 == rn)) {
-        if (rd0 == rm || rd1 == rm) {
-            tcg_out_mov_reg(s, cond, TCG_REG_TMP, rn);
-            rn = TCG_REG_TMP;
-        } else {
-            TCGReg t = rn;
-            rn = rm;
-            rm = t;
-        }
-    }
     /* smull */
     tcg_out32(s, (cond << 28) | 0x00c00090 |
               (rd1 << 16) | (rd0 << 12) | (rm << 8) | rn);
@@ -990,15 +957,8 @@ static void tcg_out_udiv(TCGContext *s, ARMCond cond,
 
 static void tcg_out_ext8s(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
 {
-    if (use_armv6_instructions) {
-        /* sxtb */
-        tcg_out32(s, 0x06af0070 | (cond << 28) | (rd << 12) | rn);
-    } else {
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        rd, 0, rn, SHIFT_IMM_LSL(24));
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        rd, 0, rd, SHIFT_IMM_ASR(24));
-    }
+    /* sxtb */
+    tcg_out32(s, 0x06af0070 | (cond << 28) | (rd << 12) | rn);
 }
 
 static void __attribute__((unused))
@@ -1009,113 +969,37 @@ tcg_out_ext8u(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
 
 static void tcg_out_ext16s(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
 {
-    if (use_armv6_instructions) {
-        /* sxth */
-        tcg_out32(s, 0x06bf0070 | (cond << 28) | (rd << 12) | rn);
-    } else {
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        rd, 0, rn, SHIFT_IMM_LSL(16));
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        rd, 0, rd, SHIFT_IMM_ASR(16));
-    }
+    /* sxth */
+    tcg_out32(s, 0x06bf0070 | (cond << 28) | (rd << 12) | rn);
 }
 
 static void tcg_out_ext16u(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
 {
-    if (use_armv6_instructions) {
-        /* uxth */
-        tcg_out32(s, 0x06ff0070 | (cond << 28) | (rd << 12) | rn);
-    } else {
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        rd, 0, rn, SHIFT_IMM_LSL(16));
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        rd, 0, rd, SHIFT_IMM_LSR(16));
-    }
+    /* uxth */
+    tcg_out32(s, 0x06ff0070 | (cond << 28) | (rd << 12) | rn);
 }
 
 static void tcg_out_bswap16(TCGContext *s, ARMCond cond,
                             TCGReg rd, TCGReg rn, int flags)
 {
-    if (use_armv6_instructions) {
-        if (flags & TCG_BSWAP_OS) {
-            /* revsh */
-            tcg_out32(s, 0x06ff0fb0 | (cond << 28) | (rd << 12) | rn);
-            return;
-        }
-
-        /* rev16 */
-        tcg_out32(s, 0x06bf0fb0 | (cond << 28) | (rd << 12) | rn);
-        if ((flags & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
-            /* uxth */
-            tcg_out32(s, 0x06ff0070 | (cond << 28) | (rd << 12) | rd);
-        }
+    if (flags & TCG_BSWAP_OS) {
+        /* revsh */
+        tcg_out32(s, 0x06ff0fb0 | (cond << 28) | (rd << 12) | rn);
         return;
     }
 
-    if (flags == 0) {
-        /*
-         * For stores, no input or output extension:
-         *                              rn  = xxAB
-         * lsr tmp, rn, #8              tmp = 0xxA
-         * and tmp, tmp, #0xff          tmp = 000A
-         * orr rd, tmp, rn, lsl #8      rd  = xABA
-         */
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        TCG_REG_TMP, 0, rn, SHIFT_IMM_LSR(8));
-        tcg_out_dat_imm(s, cond, ARITH_AND, TCG_REG_TMP, TCG_REG_TMP, 0xff);
-        tcg_out_dat_reg(s, cond, ARITH_ORR,
-                        rd, TCG_REG_TMP, rn, SHIFT_IMM_LSL(8));
-        return;
+    /* rev16 */
+    tcg_out32(s, 0x06bf0fb0 | (cond << 28) | (rd << 12) | rn);
+    if ((flags & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+        /* uxth */
+        tcg_out32(s, 0x06ff0070 | (cond << 28) | (rd << 12) | rd);
     }
-
-    /*
-     * Byte swap, leaving the result at the top of the register.
-     * We will then shift down, zero or sign-extending.
-     */
-    if (flags & TCG_BSWAP_IZ) {
-        /*
-         *                              rn  = 00AB
-         * ror tmp, rn, #8              tmp = B00A
-         * orr tmp, tmp, tmp, lsl #16   tmp = BA00
-         */
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        TCG_REG_TMP, 0, rn, SHIFT_IMM_ROR(8));
-        tcg_out_dat_reg(s, cond, ARITH_ORR,
-                        TCG_REG_TMP, TCG_REG_TMP, TCG_REG_TMP,
-                        SHIFT_IMM_LSL(16));
-    } else {
-        /*
-         *                              rn  = xxAB
-         * and tmp, rn, #0xff00         tmp = 00A0
-         * lsl tmp, tmp, #8             tmp = 0A00
-         * orr tmp, tmp, rn, lsl #24    tmp = BA00
-         */
-        tcg_out_dat_rI(s, cond, ARITH_AND, TCG_REG_TMP, rn, 0xff00, 1);
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        TCG_REG_TMP, 0, TCG_REG_TMP, SHIFT_IMM_LSL(8));
-        tcg_out_dat_reg(s, cond, ARITH_ORR,
-                        TCG_REG_TMP, TCG_REG_TMP, rn, SHIFT_IMM_LSL(24));
-    }
-    tcg_out_dat_reg(s, cond, ARITH_MOV, rd, 0, TCG_REG_TMP,
-                    (flags & TCG_BSWAP_OS
-                     ? SHIFT_IMM_ASR(8) : SHIFT_IMM_LSR(8)));
 }
 
 static void tcg_out_bswap32(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
 {
-    if (use_armv6_instructions) {
-        /* rev */
-        tcg_out32(s, 0x06bf0f30 | (cond << 28) | (rd << 12) | rn);
-    } else {
-        tcg_out_dat_reg(s, cond, ARITH_EOR,
-                        TCG_REG_TMP, rn, rn, SHIFT_IMM_ROR(16));
-        tcg_out_dat_imm(s, cond, ARITH_BIC,
-                        TCG_REG_TMP, TCG_REG_TMP, 0xff | 0x800);
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        rd, 0, rn, SHIFT_IMM_ROR(8));
-        tcg_out_dat_reg(s, cond, ARITH_EOR,
-                        rd, rd, TCG_REG_TMP, SHIFT_IMM_LSR(8));
-    }
+    /* rev */
+    tcg_out32(s, 0x06bf0f30 | (cond << 28) | (rd << 12) | rn);
 }
 
 static void tcg_out_deposit(TCGContext *s, ARMCond cond, TCGReg rd,
@@ -1283,7 +1167,7 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
 {
     if (use_armv7_instructions) {
         tcg_out32(s, INSN_DMB_ISH);
-    } else if (use_armv6_instructions) {
+    } else {
         tcg_out32(s, INSN_DMB_MCR);
     }
 }
@@ -1489,8 +1373,7 @@ static TCGReg tcg_out_arg_reg64(TCGContext *s, TCGReg argreg,
     if (argreg & 1) {
         argreg++;
     }
-    if (use_armv6_instructions && argreg >= 4
-        && (arglo & 1) == 0 && arghi == arglo + 1) {
+    if (argreg >= 4 && (arglo & 1) == 0 && arghi == arglo + 1) {
         tcg_out_strd_8(s, COND_AL, arglo,
                        TCG_REG_CALL_STACK, (argreg - 4) * 4);
         return argreg + 2;
@@ -1520,8 +1403,6 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
     int cmp_off = (is_load ? offsetof(CPUTLBEntry, addr_read)
                    : offsetof(CPUTLBEntry, addr_write));
     int fast_off = TLB_MASK_TABLE_OFS(mem_index);
-    int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
-    int table_off = fast_off + offsetof(CPUTLBDescFast, table);
     unsigned s_bits = opc & MO_SIZE;
     unsigned a_bits = get_alignment_bits(opc);
 
@@ -1534,12 +1415,7 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
     }
 
     /* Load env_tlb(env)->f[mmu_idx].{mask,table} into {r0,r1}.  */
-    if (use_armv6_instructions) {
-        tcg_out_ldrd_8(s, COND_AL, TCG_REG_R0, TCG_AREG0, fast_off);
-    } else {
-        tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_R0, TCG_AREG0, mask_off);
-        tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_R1, TCG_AREG0, table_off);
-    }
+    tcg_out_ldrd_8(s, COND_AL, TCG_REG_R0, TCG_AREG0, fast_off);
 
     /* Extract the tlb index from the address into R0.  */
     tcg_out_dat_reg(s, COND_AL, ARITH_AND, TCG_REG_R0, TCG_REG_R0, addrlo,
@@ -1550,7 +1426,7 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
      * Load the tlb comparator into R2/R3 and the fast path addend into R1.
      */
     if (cmp_off == 0) {
-        if (use_armv6_instructions && TARGET_LONG_BITS == 64) {
+        if (TARGET_LONG_BITS == 64) {
             tcg_out_ldrd_rwb(s, COND_AL, TCG_REG_R2, TCG_REG_R1, TCG_REG_R0);
         } else {
             tcg_out_ld32_rwb(s, COND_AL, TCG_REG_R2, TCG_REG_R1, TCG_REG_R0);
@@ -1558,15 +1434,12 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
     } else {
         tcg_out_dat_reg(s, COND_AL, ARITH_ADD,
                         TCG_REG_R1, TCG_REG_R1, TCG_REG_R0, 0);
-        if (use_armv6_instructions && TARGET_LONG_BITS == 64) {
+        if (TARGET_LONG_BITS == 64) {
             tcg_out_ldrd_8(s, COND_AL, TCG_REG_R2, TCG_REG_R1, cmp_off);
         } else {
             tcg_out_ld32_12(s, COND_AL, TCG_REG_R2, TCG_REG_R1, cmp_off);
         }
     }
-    if (!use_armv6_instructions && TARGET_LONG_BITS == 64) {
-        tcg_out_ld32_12(s, COND_AL, TCG_REG_R3, TCG_REG_R1, cmp_off + 4);
-    }
 
     /* Load the tlb addend.  */
     tcg_out_ld32_12(s, COND_AL, TCG_REG_R1, TCG_REG_R1,
@@ -1631,7 +1504,6 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     TCGReg argreg, datalo, datahi;
     MemOpIdx oi = lb->oi;
     MemOp opc = get_memop(oi);
-    void *func;
 
     if (!reloc_pc24(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
@@ -1646,18 +1518,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     argreg = tcg_out_arg_imm32(s, argreg, oi);
     argreg = tcg_out_arg_reg32(s, argreg, TCG_REG_R14);
 
-    /* For armv6 we can use the canonical unsigned helpers and minimize
-       icache usage.  For pre-armv6, use the signed helpers since we do
-       not have a single insn sign-extend.  */
-    if (use_armv6_instructions) {
-        func = qemu_ld_helpers[opc & MO_SIZE];
-    } else {
-        func = qemu_ld_helpers[opc & MO_SSIZE];
-        if (opc & MO_SIGN) {
-            opc = MO_UL;
-        }
-    }
-    tcg_out_call(s, func);
+    /* Use the canonical unsigned helpers and minimize icache usage. */
+    tcg_out_call(s, qemu_ld_helpers[opc & MO_SIZE]);
 
     datalo = lb->datalo_reg;
     datahi = lb->datahi_reg;
@@ -1760,7 +1622,7 @@ static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
         break;
     case MO_Q:
         /* Avoid ldrd for user-only emulation, to handle unaligned.  */
-        if (USING_SOFTMMU && use_armv6_instructions
+        if (USING_SOFTMMU
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_ldrd_r(s, COND_AL, datalo, addrlo, addend);
         } else if (datalo != addend) {
@@ -1803,7 +1665,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
         break;
     case MO_Q:
         /* Avoid ldrd for user-only emulation, to handle unaligned.  */
-        if (USING_SOFTMMU && use_armv6_instructions
+        if (USING_SOFTMMU
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_ldrd_8(s, COND_AL, datalo, addrlo, 0);
         } else if (datalo == addrlo) {
@@ -1880,7 +1742,7 @@ static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
         break;
     case MO_64:
         /* Avoid strd for user-only emulation, to handle unaligned.  */
-        if (USING_SOFTMMU && use_armv6_instructions
+        if (USING_SOFTMMU
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_strd_r(s, cond, datalo, addrlo, addend);
         } else {
@@ -1912,7 +1774,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
         break;
     case MO_64:
         /* Avoid strd for user-only emulation, to handle unaligned.  */
-        if (USING_SOFTMMU && use_armv6_instructions
+        if (USING_SOFTMMU
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_strd_8(s, COND_AL, datalo, addrlo, 0);
         } else {
-- 
2.25.1


