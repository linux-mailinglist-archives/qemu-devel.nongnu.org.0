Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B8132FDA1
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:49:40 +0100 (CET)
Received: from localhost ([::1]:37012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIenq-0000dv-I8
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebH-0007A0-L7
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:39 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:45754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebA-0002yS-Uu
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:39 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso1060546pjb.4
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+dmSE8N34SoJjro0pmrBj+i1Q6RRI4T10gidnvhwlpU=;
 b=J12vIspqK+c2hjFPlnR1S626J49Ncxt82QIWppTBFWpnBZChP/1Okf01K0Zwssb3hB
 uH9qF61BqwCax+rvLumXr/7GdedTvlfQX2inEwFhCtJehObJk/X0sTwcVZ+Ec5+zSzLD
 UcYQBULOpcMg3t5fvtN2itkWw1l082J3m36g90y+ijAajgdFlM6Vi8EURkBai/VtpF0f
 ae6SHjpNf2qYXEiEe/5oIOLfscULocjAdxLBzy3qLhXWyQ+tq/VIG+UNd4u4WIPOIUyC
 fkDU12IrSyrTxrn16ALFC8H7alHeXh1DZWeYOF+sty2US2ar0roHmC0eFy4+hRLfR7yC
 5Dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+dmSE8N34SoJjro0pmrBj+i1Q6RRI4T10gidnvhwlpU=;
 b=PrmXK/RVxSAF+SZ3i0TpCinCyUMxS8+f+C+8+ydIkNTBiyanLDaA9bmm+WuQ8/vXr8
 ATIbSzTpQ2dN+gu/n53X42MhXSw3GOCNd5rMT3/YzFaqDDtUgYhNb3YefRicRgYecg6I
 pAmqhSdp6VAAXMPzgqffkW3Fyb7/ePH0I4yvTp4WsKzn2YpMslR9JiGNIyM4aDhmH2Mq
 dwUdq4P+wFGNpqIR1zYl7cUyhh4Ew/mR4y9Gik+oYs1261Y1J7pSEaemyaT8qZwK80mF
 gMDZ0WQsRXzUYumpDe3GOUad8JBQQUZtlsCWsx+s5em+l175Wix+w9N34l88bIcwLlM2
 DJSA==
X-Gm-Message-State: AOAM532urmignSjzhRdyzG4PGhCqZ+yntdL7Go3RgMqaKgW2Rp0KAbuZ
 pzKVXwvDK5LV9PYnytlMe399rJF4MYpFyw==
X-Google-Smtp-Source: ABdhPJya/TJt7PqxyTkbERfe0FOPzycEG5yYW4jz9V2x31HkfDVW/sJQVjx/RYrG4z8UkvwaNokEEw==
X-Received: by 2002:a17:903:189:b029:e5:d7c3:a264 with SMTP id
 z9-20020a1709030189b02900e5d7c3a264mr14381465plg.6.1615066591664; 
 Sat, 06 Mar 2021 13:36:31 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/27] tcg/tci: Remove tci_read_r32
Date: Sat,  6 Mar 2021 13:36:02 -0800
Message-Id: <20210306213613.85168-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use explicit casts for ext32u opcodes, and allow truncation
to happen for other users.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 122 ++++++++++++++++++++++++------------------------------
 1 file changed, 54 insertions(+), 68 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 8b91e6efc3..a5aaa763f8 100644
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
@@ -404,8 +390,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -428,7 +414,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
         case INDEX_op_mov_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1);
             break;
         case INDEX_op_tci_movi_i32:
@@ -484,7 +470,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
         case INDEX_op_st_i32:
         CASE_64(st32)
-            t0 = tci_read_r32(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint32_t *)(t1 + t2) = t0;
@@ -494,62 +480,62 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
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
 
@@ -557,41 +543,41 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
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
@@ -599,8 +585,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -638,9 +624,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -681,21 +667,21 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -892,8 +878,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -905,7 +891,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


