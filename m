Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB0033F4A9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:53:57 +0100 (CET)
Received: from localhost ([::1]:50562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYUe-0008VQ-K8
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCK-0004xY-56
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:00 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:45828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCA-00074Q-Cy
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:34:59 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 f73-20020a9d03cf0000b02901b4d889bce0so2145266otf.12
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ruHlP0Os3wjw5VxiF3cEbfCQgqFVOBkfP7egc8QHYeI=;
 b=v4u4BBvPyM/CdVwkq2Top/DdQhH5VzRtuToVLvAd1pRUC+oDX4SudHhEL9KcruJlb9
 YhX6XkMNFWYiNlJBtvECw2acfWtmZeuSLc3nJJTBDbxsDjImqjQiPNOT4o8kENrudE4J
 Qr6bxii2VZ3m8s64K8mPGULRVHSW0eJLK/M3H9Cs/dFiQrMNi7e4a6nAeBCCQEORfcR2
 aJtISqdhGlv7o68O7wvnKfAsaxz2+LdE543R8N5BhjVnGy6dE+CCNVSg+OKd2SDqch3/
 Dcfr4lbc3kQ4CwH6H0pQ9rt1oRWxaajcB5xlW1CGegBQUCwxO2nt+tR/AQvFBIYk7bNr
 Y6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ruHlP0Os3wjw5VxiF3cEbfCQgqFVOBkfP7egc8QHYeI=;
 b=VemC/HFIza4wpPnO8m06gJmjOvnUIieUIQcD+wkWLP4zhOOMrQQg8wIgL5uUdzWld9
 RZ27MILUNdw/VqGrU9CqzkBQXFlyTZSjj3fnMhSAUCfuHrCAwfoSbJMnRioCfSdJaGMN
 QtUt1Q6KcI2meWErGlh4a03Ufs/9Lg6zZCfm939Q6YD06I5sPGPQJ34OQ88qAPKBgrIB
 5qZKqfsP/H3+oIyDwBTNu5kaPYwSKGOeTXdpaskPz7xqw7krTf98nz3pUnNxTsPHE5MV
 kf8TDTSNMbSPxDRl2+IZAOasNp22slSxdXijej3GmJyALrBQPpjCr+k/ixfSOa7meBCC
 prBQ==
X-Gm-Message-State: AOAM531YqY/jNOyvLYUC8EGOE6oLwePxm2TNm52CRGAKDh9s70/S8dUD
 sC29tEUfnO4H3GxKjjEw1QLwb9Ip9QqTA+ZI
X-Google-Smtp-Source: ABdhPJw/pbhnpr/YSYcJvqsOV/WUo8FWfX6tClRueuhW+TWpJhUfHBHUixmdF8FG9pClcb5CRwPkJw==
X-Received: by 2002:a9d:6e87:: with SMTP id a7mr3735615otr.298.1615995288026; 
 Wed, 17 Mar 2021 08:34:48 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:34:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/38] tcg/tci: Rename tci_read_r to tci_read_rval
Date: Wed, 17 Mar 2021 09:34:08 -0600
Message-Id: <20210317153444.310566-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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

In the next patches, we want to use tci_read_r to return
the raw register number.  So rename the existing function,
which returns the register value, to tci_read_rval.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 192 +++++++++++++++++++++++++++---------------------------
 1 file changed, 96 insertions(+), 96 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 6a0bdf028b..6d6a5510da 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -119,7 +119,7 @@ static uint64_t tci_read_i64(const uint8_t **tb_ptr)
 
 /* Read indexed register (native size) from bytecode. */
 static tcg_target_ulong
-tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
+tci_read_rval(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
 {
     tcg_target_ulong value = tci_read_reg(regs, **tb_ptr);
     *tb_ptr += 1;
@@ -131,15 +131,15 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
 static uint64_t tci_read_r64(const tcg_target_ulong *regs,
                              const uint8_t **tb_ptr)
 {
-    uint32_t low = tci_read_r(regs, tb_ptr);
-    return tci_uint64(tci_read_r(regs, tb_ptr), low);
+    uint32_t low = tci_read_rval(regs, tb_ptr);
+    return tci_uint64(tci_read_rval(regs, tb_ptr), low);
 }
 #elif TCG_TARGET_REG_BITS == 64
 /* Read indexed register (64 bit) from bytecode. */
 static uint64_t tci_read_r64(const tcg_target_ulong *regs,
                              const uint8_t **tb_ptr)
 {
-    return tci_read_r(regs, tb_ptr);
+    return tci_read_rval(regs, tb_ptr);
 }
 #endif
 
@@ -147,9 +147,9 @@ static uint64_t tci_read_r64(const tcg_target_ulong *regs,
 static target_ulong
 tci_read_ulong(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
 {
-    target_ulong taddr = tci_read_r(regs, tb_ptr);
+    target_ulong taddr = tci_read_rval(regs, tb_ptr);
 #if TARGET_LONG_BITS > TCG_TARGET_REG_BITS
-    taddr += (uint64_t)tci_read_r(regs, tb_ptr) << 32;
+    taddr += (uint64_t)tci_read_rval(regs, tb_ptr) << 32;
 #endif
     return taddr;
 }
@@ -365,8 +365,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             continue;
         case INDEX_op_setcond_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             condition = *tb_ptr++;
             tci_write_reg(regs, t0, tci_compare32(t1, t2, condition));
             break;
@@ -381,15 +381,15 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #elif TCG_TARGET_REG_BITS == 64
         case INDEX_op_setcond_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             condition = *tb_ptr++;
             tci_write_reg(regs, t0, tci_compare64(t1, t2, condition));
             break;
 #endif
         CASE_32_64(mov)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1);
             break;
         case INDEX_op_tci_movi_i32:
@@ -402,51 +402,51 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         CASE_32_64(ld8u)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(uint8_t *)(t1 + t2));
             break;
         CASE_32_64(ld8s)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(int8_t *)(t1 + t2));
             break;
         CASE_32_64(ld16u)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(uint16_t *)(t1 + t2));
             break;
         CASE_32_64(ld16s)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(int16_t *)(t1 + t2));
             break;
         case INDEX_op_ld_i32:
         CASE_64(ld32u)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
             break;
         CASE_32_64(st8)
-            t0 = tci_read_r(regs, &tb_ptr);
-            t1 = tci_read_r(regs, &tb_ptr);
+            t0 = tci_read_rval(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint8_t *)(t1 + t2) = t0;
             break;
         CASE_32_64(st16)
-            t0 = tci_read_r(regs, &tb_ptr);
-            t1 = tci_read_r(regs, &tb_ptr);
+            t0 = tci_read_rval(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint16_t *)(t1 + t2) = t0;
             break;
         case INDEX_op_st_i32:
         CASE_64(st32)
-            t0 = tci_read_r(regs, &tb_ptr);
-            t1 = tci_read_r(regs, &tb_ptr);
+            t0 = tci_read_rval(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint32_t *)(t1 + t2) = t0;
             break;
@@ -455,38 +455,38 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         CASE_32_64(add)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 + t2);
             break;
         CASE_32_64(sub)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 - t2);
             break;
         CASE_32_64(mul)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 * t2);
             break;
         CASE_32_64(and)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 & t2);
             break;
         CASE_32_64(or)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 | t2);
             break;
         CASE_32_64(xor)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 ^ t2);
             break;
 
@@ -494,26 +494,26 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_div_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int32_t)t1 / (int32_t)t2);
             break;
         case INDEX_op_divu_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint32_t)t1 / (uint32_t)t2);
             break;
         case INDEX_op_rem_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int32_t)t1 % (int32_t)t2);
             break;
         case INDEX_op_remu_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint32_t)t1 % (uint32_t)t2);
             break;
 
@@ -521,41 +521,41 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_shl_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint32_t)t1 << (t2 & 31));
             break;
         case INDEX_op_shr_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint32_t)t1 >> (t2 & 31));
             break;
         case INDEX_op_sar_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int32_t)t1 >> (t2 & 31));
             break;
 #if TCG_TARGET_HAS_rot_i32
         case INDEX_op_rotl_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, rol32(t1, t2 & 31));
             break;
         case INDEX_op_rotr_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, ror32(t1, t2 & 31));
             break;
 #endif
 #if TCG_TARGET_HAS_deposit_i32
         case INDEX_op_deposit_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tmp16 = *tb_ptr++;
             tmp8 = *tb_ptr++;
             tmp32 = (((1 << tmp8) - 1) << tmp16);
@@ -563,8 +563,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i32:
-            t0 = tci_read_r(regs, &tb_ptr);
-            t1 = tci_read_r(regs, &tb_ptr);
+            t0 = tci_read_rval(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             condition = *tb_ptr++;
             label = tci_read_label(&tb_ptr);
             if (tci_compare32(t0, t1, condition)) {
@@ -602,64 +602,64 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_mulu2_i32:
             t0 = *tb_ptr++;
             t1 = *tb_ptr++;
-            t2 = tci_read_r(regs, &tb_ptr);
-            tmp64 = (uint32_t)tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
+            tmp64 = (uint32_t)tci_read_rval(regs, &tb_ptr);
             tci_write_reg64(regs, t1, t0, (uint32_t)t2 * tmp64);
             break;
 #endif /* TCG_TARGET_REG_BITS == 32 */
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
         CASE_32_64(ext8s)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int8_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
         CASE_32_64(ext16s)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int16_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext8u_i32 || TCG_TARGET_HAS_ext8u_i64
         CASE_32_64(ext8u)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint8_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i32 || TCG_TARGET_HAS_ext16u_i64
         CASE_32_64(ext16u)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint16_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_bswap16_i32 || TCG_TARGET_HAS_bswap16_i64
         CASE_32_64(bswap16)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap16(t1));
             break;
 #endif
 #if TCG_TARGET_HAS_bswap32_i32 || TCG_TARGET_HAS_bswap32_i64
         CASE_32_64(bswap32)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap32(t1));
             break;
 #endif
 #if TCG_TARGET_HAS_not_i32 || TCG_TARGET_HAS_not_i64
         CASE_32_64(not)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, ~t1);
             break;
 #endif
 #if TCG_TARGET_HAS_neg_i32 || TCG_TARGET_HAS_neg_i64
         CASE_32_64(neg)
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, -t1);
             break;
 #endif
@@ -674,19 +674,19 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_ld32s_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(int32_t *)(t1 + t2));
             break;
         case INDEX_op_ld_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(uint64_t *)(t1 + t2));
             break;
         case INDEX_op_st_i64:
-            t0 = tci_read_r(regs, &tb_ptr);
-            t1 = tci_read_r(regs, &tb_ptr);
+            t0 = tci_read_rval(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint64_t *)(t1 + t2) = t0;
             break;
@@ -695,26 +695,26 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_div_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int64_t)t1 / (int64_t)t2);
             break;
         case INDEX_op_divu_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint64_t)t1 / (uint64_t)t2);
             break;
         case INDEX_op_rem_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int64_t)t1 % (int64_t)t2);
             break;
         case INDEX_op_remu_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint64_t)t1 % (uint64_t)t2);
             break;
 
@@ -722,41 +722,41 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_shl_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 << (t2 & 63));
             break;
         case INDEX_op_shr_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 >> (t2 & 63));
             break;
         case INDEX_op_sar_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, ((int64_t)t1 >> (t2 & 63)));
             break;
 #if TCG_TARGET_HAS_rot_i64
         case INDEX_op_rotl_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, rol64(t1, t2 & 63));
             break;
         case INDEX_op_rotr_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, ror64(t1, t2 & 63));
             break;
 #endif
 #if TCG_TARGET_HAS_deposit_i64
         case INDEX_op_deposit_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
+            t2 = tci_read_rval(regs, &tb_ptr);
             tmp16 = *tb_ptr++;
             tmp8 = *tb_ptr++;
             tmp64 = (((1ULL << tmp8) - 1) << tmp16);
@@ -764,8 +764,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i64:
-            t0 = tci_read_r(regs, &tb_ptr);
-            t1 = tci_read_r(regs, &tb_ptr);
+            t0 = tci_read_rval(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             condition = *tb_ptr++;
             label = tci_read_label(&tb_ptr);
             if (tci_compare64(t0, t1, condition)) {
@@ -777,19 +777,19 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_ext32s_i64:
         case INDEX_op_ext_i32_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int32_t)t1);
             break;
         case INDEX_op_ext32u_i64:
         case INDEX_op_extu_i32_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint32_t)t1);
             break;
 #if TCG_TARGET_HAS_bswap64_i64
         case INDEX_op_bswap64_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_rval(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap64(t1));
             break;
 #endif
@@ -896,7 +896,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             }
             break;
         case INDEX_op_qemu_st_i32:
-            t0 = tci_read_r(regs, &tb_ptr);
+            t0 = tci_read_rval(regs, &tb_ptr);
             taddr = tci_read_ulong(regs, &tb_ptr);
             oi = tci_read_i(&tb_ptr);
             switch (get_memop(oi) & (MO_BSWAP | MO_SIZE)) {
-- 
2.25.1


