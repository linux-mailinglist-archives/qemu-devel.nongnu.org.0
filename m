Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1991F312909
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:46:17 +0100 (CET)
Received: from localhost ([::1]:47112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wZ6-0001rK-4s
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:46:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRF-0001Fb-8d
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:10 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRD-0005je-6f
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:08 -0500
Received: by mail-pg1-x532.google.com with SMTP id j5so451818pgb.11
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2u2lbOSRco87Z5Lz8RFNE5CKuXtUEmG/NCJRjRL/uNk=;
 b=yLWQ7yC3JWxnfJoMhCx53AMaBrifeh69Ycg8crIRiB4Mt8SDBaRAEcSPB6S5l0x+jA
 1c2aBBWZCOT5wS/kXizktyZl+sUjfQnWtVaAZ+ViDg075ZxMsfCl1wz92UMITMiY5FvJ
 HtlSiF2f8zfcf7H2X6RR4qWn/xSQmn1i/MQ+b2RGcVUamf61rTLQ1gDwqG+/U6Wq7XiD
 JEv6RqGr2WtyruNIzcdvqV7s9IHvi21CYzLtsiqOr+q+SihimGBU02wYHlj8WDSbDdcn
 OOorXo6o7PYAj9aPkH6898190bjGqnQjlWTtLfV+cqxe0djfj7qwOOH0HPpp7ipv3UFv
 tS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2u2lbOSRco87Z5Lz8RFNE5CKuXtUEmG/NCJRjRL/uNk=;
 b=hlZ9s/AGRPmTSSzuPkLvgH9fbNKWs8L3vV86x5qJdWcZi1e8rwWfvTzr5V8DJwOd/E
 jlBB5ZYltxeLbuc2m3GctUbdYLS4QV95YqWmfqwec/wriEg0UxPiGaML6PTuQCx5wG92
 j01z6qM0kNTBejqCyntSzcx3m8B3Iq/J61mKkl1H5nwAJsc/TRJTz52F62dOu+xbHc+e
 JVqzmVF2W6ByEBkDKciQVLC3v8wIqJ5UVjQUKeG9SXlD9EHLaTftCcqiXpQHpNlQYu0C
 HW5Ai5mmqzqsj0Kc19yq7EW6HS4Zs1M/M+vXAFiADYu39YDWwSDWGx4pK/tEgMFQ90Nw
 uUOQ==
X-Gm-Message-State: AOAM5314ZwU+j8Dm8vaCUteqLlBYMlehRKeYmqRWW+e/ul+flLUMxEdA
 TKHnhZlO5KOHARnnfY9BGgcbJKRQxua/uA==
X-Google-Smtp-Source: ABdhPJyV4Osvy2y5lpdf17II/Wwgo3qpo52LgXfZJzyr13IGnvTQt+eNrgKVY0CoTZAPMPnUCNK71g==
X-Received: by 2002:a63:dc56:: with SMTP id f22mr15036459pgj.106.1612751885845; 
 Sun, 07 Feb 2021 18:38:05 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/70] tcg/tci: Remove tci_read_r32
Date: Sun,  7 Feb 2021 18:36:51 -0800
Message-Id: <20210208023752.270606-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use explicit casts for ext32u opcodes, and allow truncation
to happen for other users.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 122 ++++++++++++++++++++++++------------------------------
 1 file changed, 54 insertions(+), 68 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index d2bfcb3c93..72ec63e18e 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -64,11 +64,6 @@ static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
 }
 #endif
 
-static uint32_t tci_read_reg32(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (uint32_t)tci_read_reg(regs, index);
-}
-
 #if TCG_TARGET_REG_BITS == 64
 static uint64_t tci_read_reg64(const tcg_target_ulong *regs, TCGReg index)
 {
@@ -145,22 +140,13 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return value;
 }
 
-/* Read indexed register (32 bit) from bytecode. */
-static uint32_t tci_read_r32(const tcg_target_ulong *regs,
-                             const uint8_t **tb_ptr)
-{
-    uint32_t value = tci_read_reg32(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-
 #if TCG_TARGET_REG_BITS == 32
 /* Read two indexed registers (2 * 32 bit) from bytecode. */
 static uint64_t tci_read_r64(const tcg_target_ulong *regs,
                              const uint8_t **tb_ptr)
 {
-    uint32_t low = tci_read_r32(regs, tb_ptr);
-    return tci_uint64(tci_read_r32(regs, tb_ptr), low);
+    uint32_t low = tci_read_r(regs, tb_ptr);
+    return tci_uint64(tci_read_r(regs, tb_ptr), low);
 }
 #elif TCG_TARGET_REG_BITS == 64
 /* Read indexed register (32 bit signed) from bytecode. */
@@ -421,8 +407,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             continue;
         case INDEX_op_setcond_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             condition = *tb_ptr++;
             tci_write_reg(regs, t0, tci_compare32(t1, t2, condition));
             break;
@@ -445,7 +431,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
         case INDEX_op_mov_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1);
             break;
         case INDEX_op_tci_movi_i32:
@@ -501,7 +487,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
         case INDEX_op_st_i32:
         CASE_64(st32)
-            t0 = tci_read_r32(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint32_t *)(t1 + t2) = t0;
@@ -511,62 +497,62 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_add_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 + t2);
             break;
         case INDEX_op_sub_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 - t2);
             break;
         case INDEX_op_mul_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 * t2);
             break;
         case INDEX_op_div_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int32_t)t1 / (int32_t)t2);
             break;
         case INDEX_op_divu_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 / t2);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint32_t)t1 / (uint32_t)t2);
             break;
         case INDEX_op_rem_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int32_t)t1 % (int32_t)t2);
             break;
         case INDEX_op_remu_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 % t2);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint32_t)t1 % (uint32_t)t2);
             break;
         case INDEX_op_and_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 & t2);
             break;
         case INDEX_op_or_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 | t2);
             break;
         case INDEX_op_xor_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 ^ t2);
             break;
 
@@ -574,41 +560,41 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_shl_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 << (t2 & 31));
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint32_t)t1 << (t2 & 31));
             break;
         case INDEX_op_shr_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 >> (t2 & 31));
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint32_t)t1 >> (t2 & 31));
             break;
         case INDEX_op_sar_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg(regs, t0, ((int32_t)t1 >> (t2 & 31)));
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int32_t)t1 >> (t2 & 31));
             break;
 #if TCG_TARGET_HAS_rot_i32
         case INDEX_op_rotl_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, rol32(t1, t2 & 31));
             break;
         case INDEX_op_rotr_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, ror32(t1, t2 & 31));
             break;
 #endif
 #if TCG_TARGET_HAS_deposit_i32
         case INDEX_op_deposit_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tmp16 = *tb_ptr++;
             tmp8 = *tb_ptr++;
             tmp32 = (((1 << tmp8) - 1) << tmp16);
@@ -616,8 +602,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i32:
-            t0 = tci_read_r32(regs, &tb_ptr);
-            t1 = tci_read_r32(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             condition = *tb_ptr++;
             label = tci_read_label(&tb_ptr);
             if (tci_compare32(t0, t1, condition)) {
@@ -655,9 +641,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_mulu2_i32:
             t0 = *tb_ptr++;
             t1 = *tb_ptr++;
-            t2 = tci_read_r32(regs, &tb_ptr);
-            tmp64 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg64(regs, t1, t0, t2 * tmp64);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tmp64 = (uint32_t)tci_read_r(regs, &tb_ptr);
+            tci_write_reg64(regs, t1, t0, (uint32_t)t2 * tmp64);
             break;
 #endif /* TCG_TARGET_REG_BITS == 32 */
 #if TCG_TARGET_HAS_ext8s_i32
@@ -698,21 +684,21 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_bswap32_i32
         case INDEX_op_bswap32_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap32(t1));
             break;
 #endif
 #if TCG_TARGET_HAS_not_i32
         case INDEX_op_not_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, ~t1);
             break;
 #endif
 #if TCG_TARGET_HAS_neg_i32
         case INDEX_op_neg_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, -t1);
             break;
 #endif
@@ -909,8 +895,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
         case INDEX_op_extu_i32_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint32_t)t1);
             break;
 #if TCG_TARGET_HAS_bswap16_i64
         case INDEX_op_bswap16_i64:
@@ -922,7 +908,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_bswap32_i64
         case INDEX_op_bswap32_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap32(t1));
             break;
 #endif
-- 
2.25.1


