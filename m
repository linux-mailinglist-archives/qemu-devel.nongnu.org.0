Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2A440A236
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:54:27 +0200 (CEST)
Received: from localhost ([::1]:42948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwiQ-00063Y-DI
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw9i-0006n9-VH
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:18:35 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:42753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw9c-0001Q1-69
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:18:34 -0400
Received: by mail-pf1-x434.google.com with SMTP id 18so10429013pfh.9
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wt+sxY5kSdOyAZD1dEZwpS1ehhFW4uyDzTdzSn48ZSc=;
 b=wtyZZs+Eoi9Z/sc2E/3M+GMYNu61G5FFsfLnJmBbcEVXkrI9qqKdrzHTSBhymMJKbh
 TaPlU7ALmuiQgE9PjijZM5JAQ7NwijwHgvTcQFbc7XOe8I0xDvPgY3kH75VhqUFuiR5z
 XyjEB9sSd8ahUC73jPmxF/nmb0OYEncvvLzmL2QoNLV7iEg6KMkm9kZFltofS/aym8cg
 stDLR+AADIJQY8FoTBxDW9XUtAQeVGd2d2M/MJYD/gFg/Ir6jVNloydQ223imhVsr5LD
 0W4GV1VBLHd61tA9/LDtuDupOYJd/mAwflBfZC48k3gqaQEflrszVGhqLHbtXxrhKyx6
 XRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wt+sxY5kSdOyAZD1dEZwpS1ehhFW4uyDzTdzSn48ZSc=;
 b=MxvFhDlmybDpJbhvtZDfuxHPe22ODKdVS47fOwV0iNcaTzKgmB8Izus1mxNvZcFbIm
 ItpYoaeOOqerW18zol6V0/sZs9r0XeDIKzW7JzcY/JLbwvPjMDUro2eShKUEU5P0TzM6
 kUxCCxlhyntBettAnXnz3ynUf5UizPkYsPRsa/mnt2j8ck6EdhFd5DW/FkHKXQ9FJg+a
 SZkSliVgz9giiyOOL4qmguw0PRquRwaISQusST8MvLJm0sgiWAbyoz3akhN/0s1ruhxQ
 ZMcESfgykwcQkINLPteXa21rS90dxmJvmIXG6wyHPrOhaHyuXKN2GZ7GEAaZqTSsnElN
 7xyQ==
X-Gm-Message-State: AOAM532bXAK0MHkRYTLh1cTktgE7Asdb3q9dMlBKUsgmjQsGF0I4Ql7c
 s1fSuQL4fG7KfEW1AsQAukenTcaxsaYELQ==
X-Google-Smtp-Source: ABdhPJwMeNTh1KeqCDc2wDOwnGq0TVKCvpYXGTw/IisyVf66TnXLVGZR5ArQMvzWcVs1/QXLAxfKgg==
X-Received: by 2002:a63:c10b:: with SMTP id w11mr13329756pgf.228.1631578706629; 
 Mon, 13 Sep 2021 17:18:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id hi12sm2638909pjb.48.2021.09.13.17.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:18:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/44] tcg/arm: Simplify usage of encode_imm
Date: Mon, 13 Sep 2021 17:14:52 -0700
Message-Id: <20210914001456.793490-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have already computed the rotated value of the imm8
portion of the complete imm12 encoding.  No sense leaving
the combination of rot + rotation to the caller.

Create an encode_imm12_nofail helper that performs an assert.

This removes the final use of the local "rotl" function,
which duplicated our generic "rol32" function.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 141 +++++++++++++++++++++------------------
 1 file changed, 77 insertions(+), 64 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index c9e3fcfeac..1931cea1ca 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -312,10 +312,10 @@ static bool reloc_pc8(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
 {
     const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
     ptrdiff_t offset = tcg_ptr_byte_diff(target, src_rx) - 8;
-    int rot = encode_imm(offset);
+    int imm12 = encode_imm(offset);
 
-    if (rot >= 0) {
-        *src_rw = deposit32(*src_rw, 0, 12, rol32(offset, rot) | (rot << 7));
+    if (imm12 >= 0) {
+        *src_rw = deposit32(*src_rw, 0, 12, imm12);
         return true;
     }
     return false;
@@ -369,33 +369,52 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
     (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1)))
 #endif
 
-static inline uint32_t rotl(uint32_t val, int n)
-{
-  return (val << n) | (val >> (32 - n));
-}
-
-/* ARM immediates for ALU instructions are made of an unsigned 8-bit
-   right-rotated by an even amount between 0 and 30. */
+/*
+ * ARM immediates for ALU instructions are made of an unsigned 8-bit
+ * right-rotated by an even amount between 0 and 30.
+ *
+ * Return < 0 if @imm cannot be encoded, else the entire imm12 field.
+ */
 static int encode_imm(uint32_t imm)
 {
-    int shift;
+    uint32_t rot, imm8;
 
-    /* simple case, only lower bits */
-    if ((imm & ~0xff) == 0)
-        return 0;
-    /* then try a simple even shift */
-    shift = ctz32(imm) & ~1;
-    if (((imm >> shift) & ~0xff) == 0)
-        return 32 - shift;
-    /* now try harder with rotations */
-    if ((rotl(imm, 2) & ~0xff) == 0)
-        return 2;
-    if ((rotl(imm, 4) & ~0xff) == 0)
-        return 4;
-    if ((rotl(imm, 6) & ~0xff) == 0)
-        return 6;
-    /* imm can't be encoded */
+    /* Simple case, no rotation required. */
+    if ((imm & ~0xff) == 0) {
+        return imm;
+    }
+
+    /* Next, try a simple even shift.  */
+    rot = ctz32(imm) & ~1;
+    imm8 = imm >> rot;
+    rot = 32 - rot;
+    if ((imm8 & ~0xff) == 0) {
+        goto found;
+    }
+
+    /*
+     * Finally, try harder with rotations.
+     * The ctz test above will have taken care of rotates >= 8.
+     */
+    for (rot = 2; rot < 8; rot += 2) {
+        imm8 = rol32(imm, rot);
+        if ((imm8 & ~0xff) == 0) {
+            goto found;
+        }
+    }
+    /* Fail: imm cannot be encoded. */
     return -1;
+
+ found:
+    /* Note that rot is even, and we discard bit 0 by shifting by 7. */
+    return rot << 7 | imm8;
+}
+
+static int encode_imm_nofail(uint32_t imm)
+{
+    int ret = encode_imm(imm);
+    tcg_debug_assert(ret >= 0);
+    return ret;
 }
 
 static inline int check_fit_imm(uint32_t imm)
@@ -782,20 +801,18 @@ static void tcg_out_movi_pool(TCGContext *s, int cond, int rd, uint32_t arg)
 
 static void tcg_out_movi32(TCGContext *s, int cond, int rd, uint32_t arg)
 {
-    int rot, diff, opc, sh1, sh2;
+    int imm12, diff, opc, sh1, sh2;
     uint32_t tt0, tt1, tt2;
 
     /* Check a single MOV/MVN before anything else.  */
-    rot = encode_imm(arg);
-    if (rot >= 0) {
-        tcg_out_dat_imm(s, cond, ARITH_MOV, rd, 0,
-                        rotl(arg, rot) | (rot << 7));
+    imm12 = encode_imm(arg);
+    if (imm12 >= 0) {
+        tcg_out_dat_imm(s, cond, ARITH_MOV, rd, 0, imm12);
         return;
     }
-    rot = encode_imm(~arg);
-    if (rot >= 0) {
-        tcg_out_dat_imm(s, cond, ARITH_MVN, rd, 0,
-                        rotl(~arg, rot) | (rot << 7));
+    imm12 = encode_imm(~arg);
+    if (imm12 >= 0) {
+        tcg_out_dat_imm(s, cond, ARITH_MVN, rd, 0, imm12);
         return;
     }
 
@@ -803,17 +820,15 @@ static void tcg_out_movi32(TCGContext *s, int cond, int rd, uint32_t arg)
        or within the TB, which is immediately before the code block.  */
     diff = tcg_pcrel_diff(s, (void *)arg) - 8;
     if (diff >= 0) {
-        rot = encode_imm(diff);
-        if (rot >= 0) {
-            tcg_out_dat_imm(s, cond, ARITH_ADD, rd, TCG_REG_PC,
-                            rotl(diff, rot) | (rot << 7));
+        imm12 = encode_imm(diff);
+        if (imm12 >= 0) {
+            tcg_out_dat_imm(s, cond, ARITH_ADD, rd, TCG_REG_PC, imm12);
             return;
         }
     } else {
-        rot = encode_imm(-diff);
-        if (rot >= 0) {
-            tcg_out_dat_imm(s, cond, ARITH_SUB, rd, TCG_REG_PC,
-                            rotl(-diff, rot) | (rot << 7));
+        imm12 = encode_imm(-diff);
+        if (imm12 >= 0) {
+            tcg_out_dat_imm(s, cond, ARITH_SUB, rd, TCG_REG_PC, imm12);
             return;
         }
     }
@@ -845,6 +860,8 @@ static void tcg_out_movi32(TCGContext *s, int cond, int rd, uint32_t arg)
     sh2 = ctz32(tt1) & ~1;
     tt2 = tt1 & ~(0xff << sh2);
     if (tt2 == 0) {
+        int rot;
+
         rot = ((32 - sh1) << 7) & 0xf00;
         tcg_out_dat_imm(s, cond, opc, rd,  0, ((tt0 >> sh1) & 0xff) | rot);
         rot = ((32 - sh2) << 7) & 0xf00;
@@ -857,37 +874,35 @@ static void tcg_out_movi32(TCGContext *s, int cond, int rd, uint32_t arg)
     tcg_out_movi_pool(s, cond, rd, arg);
 }
 
+/*
+ * Emit either the reg,imm or reg,reg form of a data-processing insn.
+ * rhs must satisfy the "rI" constraint.
+ */
 static inline void tcg_out_dat_rI(TCGContext *s, int cond, int opc, TCGArg dst,
                                   TCGArg lhs, TCGArg rhs, int rhs_is_const)
 {
-    /* Emit either the reg,imm or reg,reg form of a data-processing insn.
-     * rhs must satisfy the "rI" constraint.
-     */
     if (rhs_is_const) {
-        int rot = encode_imm(rhs);
-        tcg_debug_assert(rot >= 0);
-        tcg_out_dat_imm(s, cond, opc, dst, lhs, rotl(rhs, rot) | (rot << 7));
+        tcg_out_dat_imm(s, cond, opc, dst, lhs, encode_imm_nofail(rhs));
     } else {
         tcg_out_dat_reg(s, cond, opc, dst, lhs, rhs, SHIFT_IMM_LSL(0));
     }
 }
 
+/*
+ * Emit either the reg,imm or reg,reg form of a data-processing insn.
+ * rhs must satisfy the "rIK" constraint.
+ */
 static void tcg_out_dat_rIK(TCGContext *s, int cond, int opc, int opinv,
                             TCGReg dst, TCGReg lhs, TCGArg rhs,
                             bool rhs_is_const)
 {
-    /* Emit either the reg,imm or reg,reg form of a data-processing insn.
-     * rhs must satisfy the "rIK" constraint.
-     */
     if (rhs_is_const) {
-        int rot = encode_imm(rhs);
-        if (rot < 0) {
-            rhs = ~rhs;
-            rot = encode_imm(rhs);
-            tcg_debug_assert(rot >= 0);
+        int imm12 = encode_imm(rhs);
+        if (imm12 < 0) {
+            imm12 = encode_imm_nofail(~rhs);
             opc = opinv;
         }
-        tcg_out_dat_imm(s, cond, opc, dst, lhs, rotl(rhs, rot) | (rot << 7));
+        tcg_out_dat_imm(s, cond, opc, dst, lhs, imm12);
     } else {
         tcg_out_dat_reg(s, cond, opc, dst, lhs, rhs, SHIFT_IMM_LSL(0));
     }
@@ -901,14 +916,12 @@ static void tcg_out_dat_rIN(TCGContext *s, int cond, int opc, int opneg,
      * rhs must satisfy the "rIN" constraint.
      */
     if (rhs_is_const) {
-        int rot = encode_imm(rhs);
-        if (rot < 0) {
-            rhs = -rhs;
-            rot = encode_imm(rhs);
-            tcg_debug_assert(rot >= 0);
+        int imm12 = encode_imm(rhs);
+        if (imm12 < 0) {
+            imm12 = encode_imm_nofail(-rhs);
             opc = opneg;
         }
-        tcg_out_dat_imm(s, cond, opc, dst, lhs, rotl(rhs, rot) | (rot << 7));
+        tcg_out_dat_imm(s, cond, opc, dst, lhs, imm12);
     } else {
         tcg_out_dat_reg(s, cond, opc, dst, lhs, rhs, SHIFT_IMM_LSL(0));
     }
-- 
2.25.1


