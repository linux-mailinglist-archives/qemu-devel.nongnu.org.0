Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40C54B1B95
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:46:26 +0100 (CET)
Received: from localhost ([::1]:39506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIL10-0002RO-3X
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:46:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnT-0004by-GR
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:27 -0500
Received: from [2607:f8b0:4864:20::62b] (port=33523
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnQ-0007Qq-K6
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:27 -0500
Received: by mail-pl1-x62b.google.com with SMTP id l9so1804348plg.0
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1eIr+o74KNNgcXDiiw/QxB0XZ933sRJAUNisk+EGA/Y=;
 b=jyv1DnmR2VvRWV2JObvZjs0/751S3pmZMv68KeMMHIhs9He7jxBg7iR0y5noHUR0r7
 N4AUzjnJAxfZCwIBHRe+idUnzxQwTurgMNo5IPzxPOX9TEYkLbCTCVT2OWc5OrJ0pGgo
 FAuXWOjKAv1nmtQ0jrc1U9Xhke4AJK5m39x3oYS2yshVRPn2QPEQ1Bm56sMjfE8jWwXy
 XXS/br8mfSr5u7bGVCs/mrQf06NcONps3uPfL4r9RnTnWJHzh/96MpjcVCCv9HIBB8k+
 ARoUxfcvUmpN57upQzfNCwu6n844TVqZbTMe3/agXNWdVTGT4aCspybHYemMTLeTjezB
 fBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1eIr+o74KNNgcXDiiw/QxB0XZ933sRJAUNisk+EGA/Y=;
 b=BkCmQR+A80Fh+foOwuqtDQ4hzE0/vvURc3l5pHW1f0kEEtygEgXRIJTvDAxmwAcdwg
 6kAJcj3JV2WR0fBWZsT396A8IRg7J8iuawbDNk5+kSw7RxwbrsjJXze8w0Rg/f54GFCn
 R6RW6Pyru7PdNspCoR6FXSlQaOQNJTscSW2vKhu4/kJHxBzcRNeImGg8J3eAxgO5f9BP
 jA4zYD84skAXmgydCy2wNYiFCi+jHvWsxevPbPt3QDwD57D+SLUlKDuc7dLE11wiAN4T
 ReavSleRS823gmBKxjaQInBKlcylviqmzcVLyjJrTtsl6QEuoI/c8yhhPA2aPXN6dE6u
 sIHw==
X-Gm-Message-State: AOAM532RQ/D7HU701hkz2hsMwvUfNMov+6V1raS2Hq9tds4jk81yTG8V
 a1gDZZUEvPD5piP8MMCawiwDh+PodPr0N6xm
X-Google-Smtp-Source: ABdhPJzmz5Si6kqlgGkC5x+fJe3YaKOAMEH58Nj6tz0tYWqoo0tmSxpluwdN8f9oD8mbtKWtee92bQ==
X-Received: by 2002:a17:902:da91:: with SMTP id
 j17mr10106792plx.89.1644543142931; 
 Thu, 10 Feb 2022 17:32:22 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/34] tcg/arm: Remove use_armv6_instructions
Date: Fri, 11 Feb 2022 12:30:44 +1100
Message-Id: <20220211013059.17994-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index f3b635063f..9eb43407ea 100644
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
     case MO_UQ:
         /* Avoid ldrd for user-only emulation, to handle unaligned.  */
-        if (USING_SOFTMMU && use_armv6_instructions
+        if (USING_SOFTMMU
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_ldrd_r(s, COND_AL, datalo, addrlo, addend);
         } else if (datalo != addend) {
@@ -1803,7 +1665,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
         break;
     case MO_UQ:
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


