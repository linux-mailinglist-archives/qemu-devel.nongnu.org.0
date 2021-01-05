Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D2A2EB180
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:38:47 +0100 (CET)
Received: from localhost ([::1]:51906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqIA-0008BN-1f
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0h-0002U7-80
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:43 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:38285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0e-0006dQ-Bm
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:42 -0500
Received: by mail-pl1-x629.google.com with SMTP id 4so62881plk.5
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qg8z1dlE9oS65UsWf3s5g5pB3pQWghIvDzukq2LmEmc=;
 b=LAiBx2Jr42CN6k8Nx+bFU6fW0L0TW3ZJtYx8JNsC0VXo4VEO4rMiipN440rLfoEyxq
 StXMhoNk4ORYfPD+vOA0Z3ip0i+3yGGcgazWcmnzkCg+bKY8HHShn8svKZNbRdnsQthb
 WyeiwltHEaPA6vxFmu5SLwNBuv5K7+sqlvA2KJly/lzCrxHqvqgFy7RGyMziV/+FcJ8c
 x+hQ17kmyhQ5cyiIszxnLjEL6DyGb3e5ZNRHlpcy5mMXzSAzBKZ6YJ7kbAnKneDXpinh
 G5VGYpqqDoQ6jHvB7FzLmosmg4B0YJraQSNV4bcXXlMRdRgo3pX3LwfBzSLkGJaSvSWR
 UgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qg8z1dlE9oS65UsWf3s5g5pB3pQWghIvDzukq2LmEmc=;
 b=E3pqXB7Aip72HqKfTQ80xJDBrdkNw6wEdtZWFstF+0YMqxztI9eMPXwcWAwLR9Z96l
 792RZt8aaLq20larFqgsH45ap+PisJXZCBlUVi9CmBpVX0ZDCy7YQZYYlGQtf0mhkGoW
 sMsn8XACPcbj7FvPZVRPSeeH1MhFQv2XBGJQRauWOLDCmE/dFB3TSsoZabYKqBIPWE+0
 +Xv+H6o8NcNC0EPoNK7ecuenJ+UPWqzf5vJalzzc8VBTLNibMGj3vtxU6nB/KcmiwRBG
 2/NIeNmBAjpANA026vr2Q3s8A/YbjJjVDA9TrY8mwmOwj0XY+QGL1mfTBArhAE4xgL2N
 yuog==
X-Gm-Message-State: AOAM533flbvSdhCYVQ5mVGJQLp4hbShCFgbqBPtxNa07tMqx9549TSxd
 kQuLY/l/zJbfqXHJtIzE5UHwJiYLZLjboA==
X-Google-Smtp-Source: ABdhPJwrZZIya1ubDVNaXrp2Tz/t5+mdjbxylieGM0/ofI5vUbaAnH8JKEslyPXXLRmdP9UJdmxu/A==
X-Received: by 2002:a17:90a:7c44:: with SMTP id
 e4mr268000pjl.138.1609867238694; 
 Tue, 05 Jan 2021 09:20:38 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 25/43] tcg/tci: Push const down through bytecode reading
Date: Tue,  5 Jan 2021 07:19:32 -1000
Message-Id: <20210105171950.415486-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 60 +++++++++++++++++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 262a2b39ce..388c1dbee8 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -163,34 +163,34 @@ static uint64_t tci_uint64(uint32_t high, uint32_t low)
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
@@ -198,7 +198,7 @@ static uint64_t tci_read_i64(uint8_t **tb_ptr)
 
 /* Read indexed register (native size) from bytecode. */
 static tcg_target_ulong
-tci_read_r(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
 {
     tcg_target_ulong value = tci_read_reg(regs, **tb_ptr);
     *tb_ptr += 1;
@@ -206,7 +206,7 @@ tci_read_r(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 }
 
 /* Read indexed register (8 bit) from bytecode. */
-static uint8_t tci_read_r8(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static uint8_t tci_read_r8(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
 {
     uint8_t value = tci_read_reg8(regs, **tb_ptr);
     *tb_ptr += 1;
@@ -215,7 +215,7 @@ static uint8_t tci_read_r8(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
 /* Read indexed register (8 bit signed) from bytecode. */
-static int8_t tci_read_r8s(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static int8_t tci_read_r8s(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
 {
     int8_t value = tci_read_reg8s(regs, **tb_ptr);
     *tb_ptr += 1;
@@ -224,7 +224,8 @@ static int8_t tci_read_r8s(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 #endif
 
 /* Read indexed register (16 bit) from bytecode. */
-static uint16_t tci_read_r16(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static uint16_t tci_read_r16(const tcg_target_ulong *regs,
+                             const uint8_t **tb_ptr)
 {
     uint16_t value = tci_read_reg16(regs, **tb_ptr);
     *tb_ptr += 1;
@@ -233,7 +234,8 @@ static uint16_t tci_read_r16(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 
 #if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
 /* Read indexed register (16 bit signed) from bytecode. */
-static int16_t tci_read_r16s(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static int16_t tci_read_r16s(const tcg_target_ulong *regs,
+                             const uint8_t **tb_ptr)
 {
     int16_t value = tci_read_reg16s(regs, **tb_ptr);
     *tb_ptr += 1;
@@ -242,7 +244,8 @@ static int16_t tci_read_r16s(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 #endif
 
 /* Read indexed register (32 bit) from bytecode. */
-static uint32_t tci_read_r32(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static uint32_t tci_read_r32(const tcg_target_ulong *regs,
+                             const uint8_t **tb_ptr)
 {
     uint32_t value = tci_read_reg32(regs, **tb_ptr);
     *tb_ptr += 1;
@@ -251,14 +254,16 @@ static uint32_t tci_read_r32(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 
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
@@ -266,7 +271,8 @@ static int32_t tci_read_r32s(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 }
 
 /* Read indexed register (64 bit) from bytecode. */
-static uint64_t tci_read_r64(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static uint64_t tci_read_r64(const tcg_target_ulong *regs,
+                             const uint8_t **tb_ptr)
 {
     uint64_t value = tci_read_reg64(regs, **tb_ptr);
     *tb_ptr += 1;
@@ -276,7 +282,7 @@ static uint64_t tci_read_r64(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 
 /* Read indexed register(s) with target address from bytecode. */
 static target_ulong
-tci_read_ulong(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+tci_read_ulong(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
 {
     target_ulong taddr = tci_read_r(regs, tb_ptr);
 #if TARGET_LONG_BITS > TCG_TARGET_REG_BITS
@@ -287,7 +293,7 @@ tci_read_ulong(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 
 /* Read indexed register or constant (native size) from bytecode. */
 static tcg_target_ulong
-tci_read_ri(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+tci_read_ri(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
 {
     tcg_target_ulong value;
     TCGReg r = **tb_ptr;
@@ -301,7 +307,8 @@ tci_read_ri(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 }
 
 /* Read indexed register or constant (32 bit) from bytecode. */
-static uint32_t tci_read_ri32(const tcg_target_ulong *regs, uint8_t **tb_ptr)
+static uint32_t tci_read_ri32(const tcg_target_ulong *regs,
+                              const uint8_t **tb_ptr)
 {
     uint32_t value;
     TCGReg r = **tb_ptr;
@@ -316,14 +323,16 @@ static uint32_t tci_read_ri32(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 
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
@@ -337,7 +346,7 @@ static uint64_t tci_read_ri64(const tcg_target_ulong *regs, uint8_t **tb_ptr)
 }
 #endif
 
-static tcg_target_ulong tci_read_label(uint8_t **tb_ptr)
+static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
 {
     tcg_target_ulong label = tci_read_i(tb_ptr);
     tci_assert(label != 0);
@@ -477,8 +486,7 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
 /* Interpret pseudo code in tb. */
 uintptr_t tcg_qemu_tb_exec(CPUArchState *env, const void *v_tb_ptr)
 {
-    /* TODO: Propagate const through this file. */
-    uint8_t *tb_ptr = (uint8_t *)v_tb_ptr;
+    const uint8_t *tb_ptr = v_tb_ptr;
     tcg_target_ulong regs[TCG_TARGET_NB_REGS];
     long tcg_temps[CPU_TEMP_BUF_NLONGS];
     uintptr_t sp_value = (uintptr_t)(tcg_temps + CPU_TEMP_BUF_NLONGS);
@@ -492,7 +500,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, const void *v_tb_ptr)
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


