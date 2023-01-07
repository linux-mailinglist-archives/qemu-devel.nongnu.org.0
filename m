Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDC2660CFE
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 09:20:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3za-0003pD-Gb; Sat, 07 Jan 2023 02:51:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zP-0003iL-Gk
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:39 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zN-0004Aa-L5
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:39 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 fz16-20020a17090b025000b002269d6c2d83so7422136pjb.0
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5IbYMmM8mRZTuJ08IjLx+YXpJeIF6jKQrPFCF7FR7ms=;
 b=dVp2j8Lg4OHGufZeevzroSrtIjyWON1lgmWQOPSfp3OE5OfDdNUXNSjON+H2nEi6OO
 YBEsgZN7TTUhVW3YCfTnwMEClJceb/yIOaEh2ufZgpJCY/wBNDiQbb6NepzGs4dpYt0K
 OjvoQS68vV4VsnDnAv3W1xMPSf075piR8igihv0NeCiLwBC6ZfaV/ZBFZeUqPqj1RPR0
 anJWbA6huAsJrDIFIOw5PQIv5GtUca2k6mfNp1ifi/PKrXWUoSzxp5DCAvJozedebU27
 NPqBYCbdxQ1MckJ1Ny+dJ2MmskjS25cNC1p9Vd5BQujPSgG0uOVHWkMnn1zAArKLq3ow
 ufrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5IbYMmM8mRZTuJ08IjLx+YXpJeIF6jKQrPFCF7FR7ms=;
 b=qgC6OlWxrqoAlPxHJEdxWKPYfqFlodaYtO8betsyxjnTw9cJBjg2fL6ZlqEo2DpVx0
 pC+Ldc/ScM0Feb2KUCeqnWEbjS/E0UjI0avEmq9yod9jPKEvRQYfBtQgEexMBytBGhCr
 ou0No8HWICE/IiTijElfRvYoW063ADCt7p4sfZq54qEVXmsDb1C8tCcN565wgME+WeoV
 /govXoNxK1MRKXa6NNRhmdeRIn9JXjSLeuhAotgvPo8NHHsKsC1PuhTYj6VNvF2b50tK
 NBZ7G1wf6F/HfjFOQ+1EG1/vWFyF5b+XFsMzm9UXDCdFCEVITp6D0yfSXkZVpP5FqooC
 QGRQ==
X-Gm-Message-State: AFqh2kp+cy7rBk6Gbp2+DyWrqmLq+KUiJpf5qIexFzp8rPK4cl680x7m
 kzhXL/hQ+L1teMZGqbHMDZKLh9CrXyyYr07r
X-Google-Smtp-Source: AMrXdXuYjTFhwjvVUlOf5OMc26vXUxe9mJGTKzLeF7UQkH95uBtk6BjTfpJfafszqJ7hAKKjiQNFmg==
X-Received: by 2002:a17:90a:be10:b0:226:d7e8:e122 with SMTP id
 a16-20020a17090abe1000b00226d7e8e122mr6442330pjs.19.1673077896845; 
 Fri, 06 Jan 2023 23:51:36 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 18/27] tcg/s390x: Tighten constraints for and_i64
Date: Fri,  6 Jan 2023 23:51:09 -0800
Message-Id: <20230107075118.1814503-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Let the register allocator handle such immediates by matching
only what one insn can achieve.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |   1 +
 tcg/s390x/tcg-target-con-str.h |   2 +
 tcg/s390x/tcg-target.c.inc     | 114 +++++++++++++++++----------------
 3 files changed, 61 insertions(+), 56 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index 34ae4c7743..0c4d0da8f5 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -25,6 +25,7 @@ C_O1_I2(r, 0, rJ)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rJ)
 C_O1_I2(r, r, rK)
+C_O1_I2(r, r, rNKR)
 C_O1_I2(r, rZ, r)
 C_O1_I2(v, v, r)
 C_O1_I2(v, v, v)
diff --git a/tcg/s390x/tcg-target-con-str.h b/tcg/s390x/tcg-target-con-str.h
index 7b910d6d11..6fa64a1ed6 100644
--- a/tcg/s390x/tcg-target-con-str.h
+++ b/tcg/s390x/tcg-target-con-str.h
@@ -21,4 +21,6 @@ CONST('A', TCG_CT_CONST_S33)
 CONST('I', TCG_CT_CONST_S16)
 CONST('J', TCG_CT_CONST_S32)
 CONST('K', TCG_CT_CONST_P32)
+CONST('N', TCG_CT_CONST_INV)
+CONST('R', TCG_CT_CONST_INVRISBG)
 CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 2a7410ba58..21007f94ad 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -33,11 +33,13 @@
 #include "../tcg-pool.c.inc"
 #include "elf.h"
 
-#define TCG_CT_CONST_S16   0x100
-#define TCG_CT_CONST_S32   0x200
-#define TCG_CT_CONST_S33   0x400
-#define TCG_CT_CONST_ZERO  0x800
-#define TCG_CT_CONST_P32   0x1000
+#define TCG_CT_CONST_S16        (1 << 8)
+#define TCG_CT_CONST_S32        (1 << 9)
+#define TCG_CT_CONST_S33        (1 << 10)
+#define TCG_CT_CONST_ZERO       (1 << 11)
+#define TCG_CT_CONST_P32        (1 << 12)
+#define TCG_CT_CONST_INV        (1 << 13)
+#define TCG_CT_CONST_INVRISBG   (1 << 14)
 
 #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 16)
 #define ALL_VECTOR_REGS      MAKE_64BIT_MASK(32, 32)
@@ -530,6 +532,38 @@ static int is_const_p32(uint64_t val)
     return -1;
 }
 
+/*
+ * Accept bit patterns like these:
+ *  0....01....1
+ *  1....10....0
+ *  1..10..01..1
+ *  0..01..10..0
+ * Copied from gcc sources.
+ */
+static bool risbg_mask(uint64_t c)
+{
+    uint64_t lsb;
+    /* We don't change the number of transitions by inverting,
+       so make sure we start with the LSB zero.  */
+    if (c & 1) {
+        c = ~c;
+    }
+    /* Reject all zeros or all ones.  */
+    if (c == 0) {
+        return false;
+    }
+    /* Find the first transition.  */
+    lsb = c & -c;
+    /* Invert to look for a second transition.  */
+    c = ~c;
+    /* Erase the first transition.  */
+    c &= -lsb;
+    /* Find the second transition, if any.  */
+    lsb = c & -c;
+    /* Match if all the bits are 1's, or if c is zero.  */
+    return c == -lsb;
+}
+
 /* Test if a constant matches the constraint. */
 static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
@@ -552,6 +586,9 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
         return val == 0;
     }
 
+    if (ct & TCG_CT_CONST_INV) {
+        val = ~val;
+    }
     /*
      * Note that is_const_p16 is a subset of is_const_p32,
      * so we don't need both constraints.
@@ -559,6 +596,9 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
     if ((ct & TCG_CT_CONST_P32) && is_const_p32(val) >= 0) {
         return true;
     }
+    if ((ct & TCG_CT_CONST_INVRISBG) && risbg_mask(~val)) {
+        return true;
+    }
 
     return 0;
 }
@@ -1057,36 +1097,6 @@ static inline void tgen_ext32u(TCGContext *s, TCGReg dest, TCGReg src)
     tcg_out_insn(s, RRE, LLGFR, dest, src);
 }
 
-/* Accept bit patterns like these:
-    0....01....1
-    1....10....0
-    1..10..01..1
-    0..01..10..0
-   Copied from gcc sources.  */
-static inline bool risbg_mask(uint64_t c)
-{
-    uint64_t lsb;
-    /* We don't change the number of transitions by inverting,
-       so make sure we start with the LSB zero.  */
-    if (c & 1) {
-        c = ~c;
-    }
-    /* Reject all zeros or all ones.  */
-    if (c == 0) {
-        return false;
-    }
-    /* Find the first transition.  */
-    lsb = c & -c;
-    /* Invert to look for a second transition.  */
-    c = ~c;
-    /* Erase the first transition.  */
-    c &= -lsb;
-    /* Find the second transition, if any.  */
-    lsb = c & -c;
-    /* Match if all the bits are 1's, or if c is zero.  */
-    return c == -lsb;
-}
-
 static void tgen_andi_risbg(TCGContext *s, TCGReg out, TCGReg in, uint64_t val)
 {
     int msb, lsb;
@@ -1126,34 +1136,25 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
         return;
     }
 
-    /* Try all 32-bit insns that can perform it in one go.  */
-    for (i = 0; i < 4; i++) {
-        tcg_target_ulong mask = ~(0xffffull << i * 16);
-        if (((val | ~valid) & mask) == mask) {
-            tcg_out_insn_RI(s, ni_insns[i], dest, val >> i * 16);
-            return;
-        }
+    i = is_const_p16(~val & valid);
+    if (i >= 0) {
+        tcg_out_insn_RI(s, ni_insns[i], dest, val >> (i * 16));
+        return;
     }
 
-    /* Try all 48-bit insns that can perform it in one go.  */
-    for (i = 0; i < 2; i++) {
-        tcg_target_ulong mask = ~(0xffffffffull << i * 32);
-        if (((val | ~valid) & mask) == mask) {
-            tcg_out_insn_RIL(s, nif_insns[i], dest, val >> i * 32);
-            return;
-        }
+    i = is_const_p32(~val & valid);
+    tcg_debug_assert(i == 0 || type != TCG_TYPE_I32);
+    if (i >= 0) {
+        tcg_out_insn_RIL(s, nif_insns[i], dest, val >> (i * 32));
+        return;
     }
+
     if (risbg_mask(val)) {
         tgen_andi_risbg(s, dest, dest, val);
         return;
     }
 
-    tcg_out_movi(s, type, TCG_TMP0, val);
-    if (type == TCG_TYPE_I32) {
-        tcg_out_insn(s, RR, NR, dest, TCG_TMP0);
-    } else {
-        tcg_out_insn(s, RRE, NGR, dest, TCG_TMP0);
-    }
+    g_assert_not_reached();
 }
 
 static void tgen_ori(TCGContext *s, TCGReg dest, uint64_t val)
@@ -2935,10 +2936,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sub_i32:
     case INDEX_op_sub_i64:
     case INDEX_op_and_i32:
-    case INDEX_op_and_i64:
     case INDEX_op_or_i32:
     case INDEX_op_xor_i32:
         return C_O1_I2(r, r, ri);
+    case INDEX_op_and_i64:
+        return C_O1_I2(r, r, rNKR);
     case INDEX_op_or_i64:
     case INDEX_op_xor_i64:
         return C_O1_I2(r, r, rK);
-- 
2.34.1


