Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B2B307183
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:33:33 +0100 (CET)
Received: from localhost ([::1]:50648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52k8-0006Gz-Ck
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:33:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52an-0005nx-T6
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:53 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52al-0005hH-Qb
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:53 -0500
Received: by mail-pl1-x633.google.com with SMTP id u11so2899490plg.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pvG/cWlHNORYY/HDoMp4ct94G02BusWJclWGSoO3BcE=;
 b=FTEEHUgfHOpGfzwwFKL1SZFEbxQK4HQb1w6Bgv9EeBogijn5m3CjOcqwO4SbBXfiNZ
 sou8XMrA4GumPlfG/zH/jtHShXqpq0vzvF8spuAjEFbTWPCZk2AwwWX06FcMAIoO+11K
 pr4EAkd2KMSYgn+c+j1rGev4Zr6vYvG5Z/+1MUje+Ra4Q4FZcQKt5WHnoK4ZSLyGPaHP
 yce0wEx5BLy8yUJGllJAThOc/xbJNyPWdbBaQ9cNvrmDaMpk2XjedhNxsfLuJbGyhRyH
 VMz8sh0aYNRKqJC07ZuyKBKeD3Z4iJi7soeD16iOgWxWFe68P4bzCwnZp5omEysHpvyK
 L7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pvG/cWlHNORYY/HDoMp4ct94G02BusWJclWGSoO3BcE=;
 b=kYGnWBt0AGRaJqCNZQqPZX1szuB9kTiEaLHz8L6HKmhWBDw2Vvbmx98vJZI0jicGGZ
 wUMcQziDQhNTgswBEFc9JfGLphk4vX8Cc5f8geSUlYdr4bYl5dwO2LPyXH5+UAd2Q33J
 8Nhn83YAgZNaQt/vlS2yO0c/atUNeyoJEsjpyagdel17XFKxR6vATPoAzUa9NhdLLIQB
 5m7vON1rJS7HIvTxFsOhTPvS2BU9IIjvY48uGjwebH13CsLAEmpdeR0Fk/an23Z+ElMi
 wA3yt8klK56BFOTwl8P76yhUL+GuFNDWQplywOtH/HpFf5fJYT9+gIkyIeaeUbomkxhi
 5CNw==
X-Gm-Message-State: AOAM532TSUJCc8X1irLforNqYapqocaZYlVycQ8fRktTOvcD/WnnUc3A
 l2NWlT33l4dSs2qiwPFdd32WHdtPV6Z6rU30
X-Google-Smtp-Source: ABdhPJzHcMXWQ8+F+PB3iCt99PrjT1lTeW++Jhd8kcxZcZIWiK2X+hJ/+SLx+Gukok42BkZ9ZpsFIw==
X-Received: by 2002:a17:90a:4897:: with SMTP id
 b23mr10241787pjh.193.1611822230063; 
 Thu, 28 Jan 2021 00:23:50 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:23:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/23] tcg/tci: Inline tci_write_reg32 into all callers
Date: Wed, 27 Jan 2021 22:23:17 -1000
Message-Id: <20210128082331.196801-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

For a 64-bit TCI, the upper bits of a 32-bit operation are
undefined (much like a native ppc64 32-bit operation).  It
simplifies everything if we don't force-extend the result.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 66 +++++++++++++++++++++++++------------------------------
 1 file changed, 30 insertions(+), 36 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 0b27f26cfb..f75971dd5e 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -115,12 +115,6 @@ tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
     regs[index] = value;
 }
 
-static void
-tci_write_reg32(tcg_target_ulong *regs, TCGReg index, uint32_t value)
-{
-    tci_write_reg(regs, index, value);
-}
-
 #if TCG_TARGET_REG_BITS == 32
 static void tci_write_reg64(tcg_target_ulong *regs, uint32_t high_index,
                             uint32_t low_index, uint64_t value)
@@ -550,7 +544,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t1 = tci_read_r32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
             condition = *tb_ptr++;
-            tci_write_reg32(regs, t0, tci_compare32(t1, t2, condition));
+            tci_write_reg(regs, t0, tci_compare32(t1, t2, condition));
             break;
 #if TCG_TARGET_REG_BITS == 32
         case INDEX_op_setcond2_i32:
@@ -558,7 +552,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tmp64 = tci_read_r64(regs, &tb_ptr);
             v64 = tci_read_ri64(regs, &tb_ptr);
             condition = *tb_ptr++;
-            tci_write_reg32(regs, t0, tci_compare64(tmp64, v64, condition));
+            tci_write_reg(regs, t0, tci_compare64(tmp64, v64, condition));
             break;
 #elif TCG_TARGET_REG_BITS == 64
         case INDEX_op_setcond_i64:
@@ -572,12 +566,12 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_mov_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
         case INDEX_op_tci_movi_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_i32(&tb_ptr);
-            tci_write_reg32(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 
             /* Load/store operations (32 bit). */
@@ -604,7 +598,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg32(regs, t0, *(uint32_t *)(t1 + t2));
+            tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
             break;
         case INDEX_op_st8_i32:
             t0 = tci_read_r8(regs, &tb_ptr);
@@ -632,44 +626,44 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 + t2);
+            tci_write_reg(regs, t0, t1 + t2);
             break;
         case INDEX_op_sub_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 - t2);
+            tci_write_reg(regs, t0, t1 - t2);
             break;
         case INDEX_op_mul_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 * t2);
+            tci_write_reg(regs, t0, t1 * t2);
             break;
 #if TCG_TARGET_HAS_div_i32
         case INDEX_op_div_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, (int32_t)t1 / (int32_t)t2);
+            tci_write_reg(regs, t0, (int32_t)t1 / (int32_t)t2);
             break;
         case INDEX_op_divu_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 / t2);
+            tci_write_reg(regs, t0, t1 / t2);
             break;
         case INDEX_op_rem_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, (int32_t)t1 % (int32_t)t2);
+            tci_write_reg(regs, t0, (int32_t)t1 % (int32_t)t2);
             break;
         case INDEX_op_remu_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 % t2);
+            tci_write_reg(regs, t0, t1 % t2);
             break;
 #elif TCG_TARGET_HAS_div2_i32
         case INDEX_op_div2_i32:
@@ -681,19 +675,19 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 & t2);
+            tci_write_reg(regs, t0, t1 & t2);
             break;
         case INDEX_op_or_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 | t2);
+            tci_write_reg(regs, t0, t1 | t2);
             break;
         case INDEX_op_xor_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 ^ t2);
+            tci_write_reg(regs, t0, t1 ^ t2);
             break;
 
             /* Shift/rotate operations (32 bit). */
@@ -702,32 +696,32 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 << (t2 & 31));
+            tci_write_reg(regs, t0, t1 << (t2 & 31));
             break;
         case INDEX_op_shr_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1 >> (t2 & 31));
+            tci_write_reg(regs, t0, t1 >> (t2 & 31));
             break;
         case INDEX_op_sar_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, ((int32_t)t1 >> (t2 & 31)));
+            tci_write_reg(regs, t0, ((int32_t)t1 >> (t2 & 31)));
             break;
 #if TCG_TARGET_HAS_rot_i32
         case INDEX_op_rotl_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, rol32(t1, t2 & 31));
+            tci_write_reg(regs, t0, rol32(t1, t2 & 31));
             break;
         case INDEX_op_rotr_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
             t2 = tci_read_ri32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, ror32(t1, t2 & 31));
+            tci_write_reg(regs, t0, ror32(t1, t2 & 31));
             break;
 #endif
 #if TCG_TARGET_HAS_deposit_i32
@@ -738,7 +732,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tmp16 = *tb_ptr++;
             tmp8 = *tb_ptr++;
             tmp32 = (((1 << tmp8) - 1) << tmp16);
-            tci_write_reg32(regs, t0, (t1 & ~tmp32) | ((t2 << tmp16) & tmp32));
+            tci_write_reg(regs, t0, (t1 & ~tmp32) | ((t2 << tmp16) & tmp32));
             break;
 #endif
         case INDEX_op_brcond_i32:
@@ -790,56 +784,56 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_ext8s_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r8s(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16s_i32
         case INDEX_op_ext16s_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r16s(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext8u_i32
         case INDEX_op_ext8u_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r8(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i32
         case INDEX_op_ext16u_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r16(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #endif
 #if TCG_TARGET_HAS_bswap16_i32
         case INDEX_op_bswap16_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r16(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, bswap16(t1));
+            tci_write_reg(regs, t0, bswap16(t1));
             break;
 #endif
 #if TCG_TARGET_HAS_bswap32_i32
         case INDEX_op_bswap32_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, bswap32(t1));
+            tci_write_reg(regs, t0, bswap32(t1));
             break;
 #endif
 #if TCG_TARGET_HAS_not_i32
         case INDEX_op_not_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, ~t1);
+            tci_write_reg(regs, t0, ~t1);
             break;
 #endif
 #if TCG_TARGET_HAS_neg_i32
         case INDEX_op_neg_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg32(regs, t0, -t1);
+            tci_write_reg(regs, t0, -t1);
             break;
 #endif
 #if TCG_TARGET_REG_BITS == 64
@@ -881,7 +875,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg32(regs, t0, *(uint32_t *)(t1 + t2));
+            tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
             break;
         case INDEX_op_ld32s_i64:
             t0 = *tb_ptr++;
-- 
2.25.1


