Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954C12EE70A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:39:15 +0100 (CET)
Received: from localhost ([::1]:33480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxc3u-000680-Lp
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:39:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhS-0001W3-CE
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:03 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhC-0001gK-Rt
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:02 -0500
Received: by mail-pl1-x62f.google.com with SMTP id x12so4144643plr.10
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AJQYK8LKfTzhiujiEv/x9kE4WE8MnmVirj6n1IdQE8k=;
 b=oYgkaGUj4DjWATq4agAPN/g3www0/eM2cvpGQwrMS1lA/4HgQtcWZeCIeq9moiiM5M
 7YLWWYgu+15H6akT9Sl3ZNTv8a2CVrYdPR1ajgmrgbYNlBNmeFl54n3ADKQWbL3qk6/s
 2cszoqGLKEZUHLpYTrvWx4m2WmBuX+UMvd7bkUW5toNei4L+OqTO3/TMNWVm0xDH1dIP
 JcMw5xeAONYSDDmviZ9I8jO/5/+4W/YDMytyPA0CIsUTGtBTYaG0T9NDQbkUjypE1j3g
 oLP+7usT/JLu1Y7PGgsxhUfLdR8oQExqcxR9nsZmUgG8PdNBaKVxYa0m7+sTUVylcYvM
 WWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJQYK8LKfTzhiujiEv/x9kE4WE8MnmVirj6n1IdQE8k=;
 b=UJDHFUev13RnsywUZB9uOTSgtD3LcyDBQzdAy23u2j0M1fri3xMHlGhQErvP3GF9Yc
 YGmvgyY/82rthc+9/oaJsBYSJTL8AD3pW9yUNDEDenW/M9W89GAl7/LfeZobj7sRQdcO
 zzqJVvLNW9XOpjidCuCsLsiP95dPRGjBvaZ0hejeJhvFYTucnXcvK7KDT0jFqvvwgYNR
 qQhbL0EGKZN2Y6MVV/AbfXWrqYa00Mpi0UUc1Pg3Lfg9j5QhKeayvgq8lEBtzqznTKii
 oAyp+FatM+GhHUOrDOcF9pJCKU/Ebl5CADKban/xHKLHDRs0tgTFen8XqrQ1jM4J9xL/
 DrQQ==
X-Gm-Message-State: AOAM531t0G2AF8gHxSQtknidy5r53hTBR2E1dE5o+QoUEn41LjH0oLP8
 Ar/pqAr9z6CsxbTmCiWVloCimSCMm7zlJw==
X-Google-Smtp-Source: ABdhPJwSz3Xvma7woDFVlMzgr+5v1jPSavsreVqKKlzyEbW+t19r/6HTcc26A7K8A9/elMVJr6urcw==
X-Received: by 2002:a17:90a:1057:: with SMTP id
 y23mr166356pjd.97.1610050543339; 
 Thu, 07 Jan 2021 12:15:43 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/47] tcg/tci: Push const down through bytecode reading
Date: Thu,  7 Jan 2021 10:14:30 -1000
Message-Id: <20210107201448.1152301-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: peter.maydell@linaro.org, Joelle van Dyne <j@getutm.app>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Joelle van Dyne <j@getutm.app>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 60 +++++++++++++++++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 017887bbc9..2bcc4409be 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -164,34 +164,34 @@ static uint64_t tci_uint64(uint32_t high, uint32_t low)
 #endif
 
 /* Read constant (native size) from bytecode. */
-static tcg_target_ulong tci_read_i(uint8_t **tb_ptr)
+static tcg_target_ulong tci_read_i(const uint8_t **tb_ptr)
 {
-    tcg_target_ulong value = *(tcg_target_ulong *)(*tb_ptr);
+    tcg_target_ulong value = *(const tcg_target_ulong *)(*tb_ptr);
     *tb_ptr += sizeof(value);
     return value;
 }
 
 /* Read unsigned constant (32 bit) from bytecode. */
-static uint32_t tci_read_i32(uint8_t **tb_ptr)
+static uint32_t tci_read_i32(const uint8_t **tb_ptr)
 {
-    uint32_t value = *(uint32_t *)(*tb_ptr);
+    uint32_t value = *(const uint32_t *)(*tb_ptr);
     *tb_ptr += sizeof(value);
     return value;
 }
 
 /* Read signed constant (32 bit) from bytecode. */
-static int32_t tci_read_s32(uint8_t **tb_ptr)
+static int32_t tci_read_s32(const uint8_t **tb_ptr)
 {
-    int32_t value = *(int32_t *)(*tb_ptr);
+    int32_t value = *(const int32_t *)(*tb_ptr);
     *tb_ptr += sizeof(value);
     return value;
 }
 
 #if TCG_TARGET_REG_BITS == 64
 /* Read constant (64 bit) from bytecode. */
-static uint64_t tci_read_i64(uint8_t **tb_ptr)
+static uint64_t tci_read_i64(const uint8_t **tb_ptr)
 {
-    uint64_t value = *(uint64_t *)(*tb_ptr);
+    uint64_t value = *(const uint64_t *)(*tb_ptr);
     *tb_ptr += sizeof(value);
     return value;
 }
@@ -199,7 +199,7 @@ static uint64_t tci_read_i64(uint8_t **tb_ptr)
 
 /* Read indexed register (native size) from bytecode. */
 static tcg_target_ulong
-tci_read_r(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
 {
     tcg_target_ulong value = tci_read_reg(regs, **tb_ptr);
     *tb_ptr += 1;
@@ -207,7 +207,7 @@ tci_read_r(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 }
 
 /* Read indexed register (8 bit) from bytecode. */
-static uint8_t tci_read_r8(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static uint8_t tci_read_r8(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
 {
     uint8_t value = tci_read_reg8(regs, **tb_ptr);
     *tb_ptr += 1;
@@ -216,7 +216,7 @@ static uint8_t tci_read_r8(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
 /* Read indexed register (8 bit signed) from bytecode. */
-static int8_t tci_read_r8s(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static int8_t tci_read_r8s(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
 {
     int8_t value = tci_read_reg8s(regs, **tb_ptr);
     *tb_ptr += 1;
@@ -225,7 +225,8 @@ static int8_t tci_read_r8s(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 #endif
 
 /* Read indexed register (16 bit) from bytecode. */
-static uint16_t tci_read_r16(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static uint16_t tci_read_r16(const tcg_target_ulong *regs,
+                             const uint8_t **tb_ptr)
 {
     uint16_t value = tci_read_reg16(regs, **tb_ptr);
     *tb_ptr += 1;
@@ -234,7 +235,8 @@ static uint16_t tci_read_r16(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 
 #if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
 /* Read indexed register (16 bit signed) from bytecode. */
-static int16_t tci_read_r16s(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static int16_t tci_read_r16s(const tcg_target_ulong *regs,
+                             const uint8_t **tb_ptr)
 {
     int16_t value = tci_read_reg16s(regs, **tb_ptr);
     *tb_ptr += 1;
@@ -243,7 +245,8 @@ static int16_t tci_read_r16s(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 #endif
 
 /* Read indexed register (32 bit) from bytecode. */
-static uint32_t tci_read_r32(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static uint32_t tci_read_r32(const tcg_target_ulong *regs,
+                             const uint8_t **tb_ptr)
 {
     uint32_t value = tci_read_reg32(regs, **tb_ptr);
     *tb_ptr += 1;
@@ -252,14 +255,16 @@ static uint32_t tci_read_r32(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 
 #if TCG_TARGET_REG_BITS == 32
 /* Read two indexed registers (2 * 32 bit) from bytecode. */
-static uint64_t tci_read_r64(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static uint64_t tci_read_r64(const tcg_target_ulong *regs,
+                             const uint8_t **tb_ptr)
 {
     uint32_t low = tci_read_r32(regs, tb_ptr);
     return tci_uint64(tci_read_r32(regs, tb_ptr), low);
 }
 #elif TCG_TARGET_REG_BITS == 64
 /* Read indexed register (32 bit signed) from bytecode. */
-static int32_t tci_read_r32s(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static int32_t tci_read_r32s(const tcg_target_ulong *regs,
+                             const uint8_t **tb_ptr)
 {
     int32_t value = tci_read_reg32s(regs, **tb_ptr);
     *tb_ptr += 1;
@@ -267,7 +272,8 @@ static int32_t tci_read_r32s(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 }
 
 /* Read indexed register (64 bit) from bytecode. */
-static uint64_t tci_read_r64(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static uint64_t tci_read_r64(const tcg_target_ulong *regs,
+                             const uint8_t **tb_ptr)
 {
     uint64_t value = tci_read_reg64(regs, **tb_ptr);
     *tb_ptr += 1;
@@ -277,7 +283,7 @@ static uint64_t tci_read_r64(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 
 /* Read indexed register(s) with target address from bytecode. */
 static target_ulong
-tci_read_ulong(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+tci_read_ulong(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
 {
     target_ulong taddr = tci_read_r(regs, tb_ptr);
 #if TARGET_LONG_BITS > TCG_TARGET_REG_BITS
@@ -288,7 +294,7 @@ tci_read_ulong(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 
 /* Read indexed register or constant (native size) from bytecode. */
 static tcg_target_ulong
-tci_read_ri(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+tci_read_ri(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
 {
     tcg_target_ulong value;
     TCGReg r = **tb_ptr;
@@ -302,7 +308,8 @@ tci_read_ri(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 }
 
 /* Read indexed register or constant (32 bit) from bytecode. */
-static uint32_t tci_read_ri32(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static uint32_t tci_read_ri32(const tcg_target_ulong *regs,
+                              const uint8_t **tb_ptr)
 {
     uint32_t value;
     TCGReg r = **tb_ptr;
@@ -317,14 +324,16 @@ static uint32_t tci_read_ri32(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 
 #if TCG_TARGET_REG_BITS == 32
 /* Read two indexed registers or constants (2 * 32 bit) from bytecode. */
-static uint64_t tci_read_ri64(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static uint64_t tci_read_ri64(const tcg_target_ulong *regs,
+                              const uint8_t **tb_ptr)
 {
     uint32_t low = tci_read_ri32(regs, tb_ptr);
     return tci_uint64(tci_read_ri32(regs, tb_ptr), low);
 }
 #elif TCG_TARGET_REG_BITS == 64
 /* Read indexed register or constant (64 bit) from bytecode. */
-static uint64_t tci_read_ri64(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static uint64_t tci_read_ri64(const tcg_target_ulong *regs,
+                              const uint8_t **tb_ptr)
 {
     uint64_t value;
     TCGReg r = **tb_ptr;
@@ -338,7 +347,7 @@ static uint64_t tci_read_ri64(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 }
 #endif
 
-static tcg_target_ulong tci_read_label(uint8_t **tb_ptr)
+static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
 {
     tcg_target_ulong label = tci_read_i(tb_ptr);
     tci_assert(label != 0);
@@ -484,8 +493,7 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
 uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                                             const void *v_tb_ptr)
 {
-    /* TODO: Propagate const through this file. */
-    uint8_t *tb_ptr = (uint8_t *)v_tb_ptr;
+    const uint8_t *tb_ptr = v_tb_ptr;
     tcg_target_ulong regs[TCG_TARGET_NB_REGS];
     long tcg_temps[CPU_TEMP_BUF_NLONGS];
     uintptr_t sp_value = (uintptr_t)(tcg_temps + CPU_TEMP_BUF_NLONGS);
@@ -499,7 +507,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         TCGOpcode opc = tb_ptr[0];
 #if defined(CONFIG_DEBUG_TCG) && !defined(NDEBUG)
         uint8_t op_size = tb_ptr[1];
-        uint8_t *old_code_ptr = tb_ptr;
+        const uint8_t *old_code_ptr = tb_ptr;
 #endif
         tcg_target_ulong t0;
         tcg_target_ulong t1;
-- 
2.25.1


