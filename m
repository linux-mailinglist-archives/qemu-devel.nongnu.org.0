Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB1D31E102
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:06:24 +0100 (CET)
Received: from localhost ([::1]:37276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCU1f-0000Xt-AM
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLj-0008O6-89
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:03 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:43621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLh-0007O1-7r
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:03 -0500
Received: by mail-pg1-x52e.google.com with SMTP id n10so9193467pgl.10
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BGjOxn7oBYKM0brcxUQhOzUdPq+WpZr2L0yE6bqXqs8=;
 b=DkwnQBxw6tYUOXWZT5dww3i2HNIg/74Scr7jmVd5IjDOnlD+an/6YggEazPlyOSc+v
 ZwAE6qXK0lSPZ/jBxyLTVzQi1rHa8UuqMcqY+GEfmxjfQcGC3/xtYR0htb7YrCP1YliK
 KxFju+A+RUXtqIuI9ofeFIS6/iX8Ygdp5FphVzZ63dozHkFO5SWnPSLBshpoARAG4SR+
 LDO1ykz7rznVjdhYwcN0fGaDv68O7fWcHqPz6zIU80R1AuxJGSzNs3dwJtXs551dA7Ef
 FkFg9XtinDIf1bSHbH2fUcjYaWCP2gzX6GBjSTMgsdxz+OxCv3FU45Bbhtgw9hbcELaz
 jHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BGjOxn7oBYKM0brcxUQhOzUdPq+WpZr2L0yE6bqXqs8=;
 b=PXzgUmnl/kb19sZfI3SlNm7mNHHP5hX44x6hFEvxQZbJH2YOqDfN9q+IBXZgx7i8bi
 sqWaKJR4lOFAtxrKvlLkxpO2d7ufWTxViIEiRRzEhK4qUDw69Ie2JKjC9sPWf4nt5ssm
 luPh5Ox0nBJMIdjBDh7kWzZjqdDFwrhJA3zxA8ExSLGrGP1TA8SWHjcl0Slbur4pC2nT
 in/PpL4WaJS2VAylsY64s7Um6hsUcWNEcNT1pw2XTGiCH7W1Zc0uVqMf7s9cAdA/QqRI
 UK4SgafVCkZxXn49qyIVe/IpBDGePxjcjteJsyt7C65GdGXZRjmh6eOTCm9xVJEsB1Oo
 RBIQ==
X-Gm-Message-State: AOAM532WUsyfLlgCKVBKwZqUwD9o4cDDJ/JohjbBlJdVD8DKLwFxKEy8
 yUNJEhDF7OaDsQjZWwYv0mzYVgMILtbpVQ==
X-Google-Smtp-Source: ABdhPJzRYEk9PATAhFrqS1X8isr5SCN8JXiy48391+pjEMgpiEZMntS9KqxIuaOb5se72YOkxUAURg==
X-Received: by 2002:aa7:9281:0:b029:1ec:48b2:811c with SMTP id
 j1-20020aa792810000b02901ec48b2811cmr975756pfa.18.1613593379880; 
 Wed, 17 Feb 2021 12:22:59 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 33/71] tcg/tci: Split out tci_args_{rrm,rrrm,rrrrm}
Date: Wed, 17 Feb 2021 12:19:58 -0800
Message-Id: <20210217202036.1724901-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 147 ++++++++++++++++++++++++++++++------------------------
 1 file changed, 81 insertions(+), 66 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 583059f319..f6cc5a3ab0 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -66,22 +66,18 @@ tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
     regs[index] = value;
 }
 
-#if TCG_TARGET_REG_BITS == 32
 static void tci_write_reg64(tcg_target_ulong *regs, uint32_t high_index,
                             uint32_t low_index, uint64_t value)
 {
     tci_write_reg(regs, low_index, value);
     tci_write_reg(regs, high_index, value >> 32);
 }
-#endif
 
-#if TCG_TARGET_REG_BITS == 32
 /* Create a 64 bit value from two 32 bit values. */
 static uint64_t tci_uint64(uint32_t high, uint32_t low)
 {
     return ((uint64_t)high << 32) + low;
 }
-#endif
 
 /* Read constant byte from bytecode. */
 static uint8_t tci_read_b(const uint8_t **tb_ptr)
@@ -121,43 +117,6 @@ static int32_t tci_read_s32(const uint8_t **tb_ptr)
     return value;
 }
 
-/* Read indexed register (native size) from bytecode. */
-static tcg_target_ulong
-tci_read_rval(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
-{
-    tcg_target_ulong value = tci_read_reg(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-
-#if TCG_TARGET_REG_BITS == 32
-/* Read two indexed registers (2 * 32 bit) from bytecode. */
-static uint64_t tci_read_r64(const tcg_target_ulong *regs,
-                             const uint8_t **tb_ptr)
-{
-    uint32_t low = tci_read_rval(regs, tb_ptr);
-    return tci_uint64(tci_read_rval(regs, tb_ptr), low);
-}
-#elif TCG_TARGET_REG_BITS == 64
-/* Read indexed register (64 bit) from bytecode. */
-static uint64_t tci_read_r64(const tcg_target_ulong *regs,
-                             const uint8_t **tb_ptr)
-{
-    return tci_read_rval(regs, tb_ptr);
-}
-#endif
-
-/* Read indexed register(s) with target address from bytecode. */
-static target_ulong
-tci_read_ulong(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
-{
-    target_ulong taddr = tci_read_rval(regs, tb_ptr);
-#if TARGET_LONG_BITS > TCG_TARGET_REG_BITS
-    taddr += (uint64_t)tci_read_rval(regs, tb_ptr) << 32;
-#endif
-    return taddr;
-}
-
 static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
 {
     return tci_read_i(tb_ptr);
@@ -171,6 +130,7 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   b = immediate (bit position)
  *   i = immediate (uint32_t)
  *   I = immediate (tcg_target_ulong)
+ *   m = immediate (TCGMemOpIdx)
  *   r = register
  *   s = signed ldst offset
  */
@@ -203,6 +163,14 @@ static void tci_args_rI(const uint8_t **tb_ptr,
 }
 #endif
 
+static void tci_args_rrm(const uint8_t **tb_ptr,
+                         TCGReg *r0, TCGReg *r1, TCGMemOpIdx *m2)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *m2 = tci_read_i32(tb_ptr);
+}
+
 static void tci_args_rrr(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, TCGReg *r2)
 {
@@ -237,6 +205,15 @@ static void tci_args_rrrc(const uint8_t **tb_ptr,
     *c3 = tci_read_b(tb_ptr);
 }
 
+static void tci_args_rrrm(const uint8_t **tb_ptr,
+                          TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGMemOpIdx *m3)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *m3 = tci_read_i32(tb_ptr);
+}
+
 static void tci_args_rrrbb(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                            TCGReg *r2, uint8_t *i3, uint8_t *i4)
 {
@@ -247,6 +224,16 @@ static void tci_args_rrrbb(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
     *i4 = tci_read_b(tb_ptr);
 }
 
+static void tci_args_rrrrm(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
+                           TCGReg *r2, TCGReg *r3, TCGMemOpIdx *m4)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *r3 = tci_read_r(tb_ptr);
+    *m4 = tci_read_i32(tb_ptr);
+}
+
 #if TCG_TARGET_REG_BITS == 32
 static void tci_args_rrrr(const uint8_t **tb_ptr,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGReg *r3)
@@ -440,8 +427,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint8_t op_size = tb_ptr[1];
         const uint8_t *old_code_ptr = tb_ptr;
 #endif
-        TCGReg r0, r1, r2;
-        tcg_target_ulong t0;
+        TCGReg r0, r1, r2, r3;
         tcg_target_ulong t1;
         TCGCond condition;
         target_ulong taddr;
@@ -449,7 +435,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint32_t tmp32;
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
-        TCGReg r3, r4, r5;
+        TCGReg r4, r5;
         uint64_t T1, T2;
 #endif
         TCGMemOpIdx oi;
@@ -836,9 +822,13 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             continue;
 
         case INDEX_op_qemu_ld_i32:
-            t0 = *tb_ptr++;
-            taddr = tci_read_ulong(regs, &tb_ptr);
-            oi = tci_read_i32(&tb_ptr);
+            if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
+                tci_args_rrm(&tb_ptr, &r0, &r1, &oi);
+                taddr = regs[r1];
+            } else {
+                tci_args_rrrm(&tb_ptr, &r0, &r1, &r2, &oi);
+                taddr = tci_uint64(regs[r2], regs[r1]);
+            }
             switch (get_memop(oi) & (MO_BSWAP | MO_SSIZE)) {
             case MO_UB:
                 tmp32 = qemu_ld_ub;
@@ -867,15 +857,20 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             default:
                 g_assert_not_reached();
             }
-            tci_write_reg(regs, t0, tmp32);
+            regs[r0] = tmp32;
             break;
+
         case INDEX_op_qemu_ld_i64:
-            t0 = *tb_ptr++;
-            if (TCG_TARGET_REG_BITS == 32) {
-                t1 = *tb_ptr++;
+            if (TCG_TARGET_REG_BITS == 64) {
+                tci_args_rrm(&tb_ptr, &r0, &r1, &oi);
+                taddr = regs[r1];
+            } else if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
+                tci_args_rrrm(&tb_ptr, &r0, &r1, &r2, &oi);
+                taddr = regs[r2];
+            } else {
+                tci_args_rrrrm(&tb_ptr, &r0, &r1, &r2, &r3, &oi);
+                taddr = tci_uint64(regs[r3], regs[r2]);
             }
-            taddr = tci_read_ulong(regs, &tb_ptr);
-            oi = tci_read_i32(&tb_ptr);
             switch (get_memop(oi) & (MO_BSWAP | MO_SSIZE)) {
             case MO_UB:
                 tmp64 = qemu_ld_ub;
@@ -916,39 +911,58 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             default:
                 g_assert_not_reached();
             }
-            tci_write_reg(regs, t0, tmp64);
             if (TCG_TARGET_REG_BITS == 32) {
-                tci_write_reg(regs, t1, tmp64 >> 32);
+                tci_write_reg64(regs, r1, r0, tmp64);
+            } else {
+                regs[r0] = tmp64;
             }
             break;
+
         case INDEX_op_qemu_st_i32:
-            t0 = tci_read_rval(regs, &tb_ptr);
-            taddr = tci_read_ulong(regs, &tb_ptr);
-            oi = tci_read_i32(&tb_ptr);
+            if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
+                tci_args_rrm(&tb_ptr, &r0, &r1, &oi);
+                taddr = regs[r1];
+            } else {
+                tci_args_rrrm(&tb_ptr, &r0, &r1, &r2, &oi);
+                taddr = tci_uint64(regs[r2], regs[r1]);
+            }
+            tmp32 = regs[r0];
             switch (get_memop(oi) & (MO_BSWAP | MO_SIZE)) {
             case MO_UB:
-                qemu_st_b(t0);
+                qemu_st_b(tmp32);
                 break;
             case MO_LEUW:
-                qemu_st_lew(t0);
+                qemu_st_lew(tmp32);
                 break;
             case MO_LEUL:
-                qemu_st_lel(t0);
+                qemu_st_lel(tmp32);
                 break;
             case MO_BEUW:
-                qemu_st_bew(t0);
+                qemu_st_bew(tmp32);
                 break;
             case MO_BEUL:
-                qemu_st_bel(t0);
+                qemu_st_bel(tmp32);
                 break;
             default:
                 g_assert_not_reached();
             }
             break;
+
         case INDEX_op_qemu_st_i64:
-            tmp64 = tci_read_r64(regs, &tb_ptr);
-            taddr = tci_read_ulong(regs, &tb_ptr);
-            oi = tci_read_i32(&tb_ptr);
+            if (TCG_TARGET_REG_BITS == 64) {
+                tci_args_rrm(&tb_ptr, &r0, &r1, &oi);
+                taddr = regs[r1];
+                tmp64 = regs[r0];
+            } else {
+                if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
+                    tci_args_rrrm(&tb_ptr, &r0, &r1, &r2, &oi);
+                    taddr = regs[r2];
+                } else {
+                    tci_args_rrrrm(&tb_ptr, &r0, &r1, &r2, &r3, &oi);
+                    taddr = tci_uint64(regs[r3], regs[r2]);
+                }
+                tmp64 = tci_uint64(regs[r1], regs[r0]);
+            }
             switch (get_memop(oi) & (MO_BSWAP | MO_SIZE)) {
             case MO_UB:
                 qemu_st_b(tmp64);
@@ -975,6 +989,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 g_assert_not_reached();
             }
             break;
+
         case INDEX_op_mb:
             /* Ensure ordering for all kinds */
             smp_mb();
-- 
2.25.1


