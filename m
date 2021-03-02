Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4639032A8B1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:03:03 +0100 (CET)
Received: from localhost ([::1]:40444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9MM-00008e-7j
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HX-00030q-TE
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:03 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:40248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HV-0007bJ-Ov
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:03 -0500
Received: by mail-pl1-x636.google.com with SMTP id z7so12462508plk.7
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+dmSE8N34SoJjro0pmrBj+i1Q6RRI4T10gidnvhwlpU=;
 b=ZvSPVF6lZxeECdYfAGs+y7cnEfnS+TwGZnY2anZzrTooUSUBtiBzJ/1rf8wCcFJe6i
 1fgePkbtAzKOnW5uxHxj31AsdvqEeo33qurDdEQw4GJ3K7bQeGrr0S6GsfkgS/tvB5NA
 IsSfG0V5s+aqYTlNtHnpzzsqrQ41vHq+83bGoizdlO0+RH9C9gpmmDqUnLO7tgk+iCaQ
 CNZZKbekpoApHWQGk0MyPevpUGYUQEBL/rDIFRN1nqYvI2Os6W96jtFc1q3TIJsfEoMU
 4h3U64bGhbwIRu4cC+9uT4ZdZzmRVsy3PPVD83fXhjn8gN3BHBeOMWmM6rpLF6423GZ8
 f0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+dmSE8N34SoJjro0pmrBj+i1Q6RRI4T10gidnvhwlpU=;
 b=ZNDQNLStiSf+L/eup+kb5lquVOBnWUooqBZvFUu7g+cI0LUNVOpXrOeoNXEKB9Pk5j
 LIG/xxto7GyRDb2ISsXLxRkd9lI7CmXyy0CmiJVIhePNxBxWeIGeW4v4+oeRWQs3AZ0V
 c7wAUP3qrr4zk19eGl49Thjhtn9C5pXulVZ0nr0Wbs9UJ5omMh86O6mVviFM6pNnhf5V
 ImfixhfToSYRUjUYeHPHSHOMnoSyuNbLbspgKPZWNO9w2TNdG4D5nI6xhuLMt47rtepB
 5/PwzX17+BoLZ4QaBf/Uln2M0YXu2A13xdQs/5sDo9xWZPq7xZgltxGFWJlb5ZZ1PDWh
 M7Nw==
X-Gm-Message-State: AOAM5330z7fgFYT4U2dt6vxInyX41/W1ol3eznpjcyessj49LRuta9o+
 mlZum25puFW9FocuyIFWu6ZjFL35BZTwMA==
X-Google-Smtp-Source: ABdhPJyin2ogFExAQnGyBQlFXd9SEPggVgKd0s5hZ5+BQPH7o0zMO+91O3dZhEXanUC426SZlL65+w==
X-Received: by 2002:a17:90a:4fc1:: with SMTP id
 q59mr5809150pjh.129.1614707880415; 
 Tue, 02 Mar 2021 09:58:00 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:57:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/27] tcg/tci: Remove tci_read_r32
Date: Tue,  2 Mar 2021 09:57:30 -0800
Message-Id: <20210302175741.1079851-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: alex.bennee@linaro.org,
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


