Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8BA30EA42
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:36:22 +0100 (CET)
Received: from localhost ([::1]:53330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UVJ-0003qF-7N
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjW-0005pQ-HU
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:58 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:55432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjU-00044r-A2
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:58 -0500
Received: by mail-pj1-x1029.google.com with SMTP id s24so768877pjp.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q08wWJmkpMRbD1uCLvdIthjIJ7wpxGIx6PIRtX9sdqE=;
 b=UoScL4/EubfEzn4wQWCcvgvivy3iJVWDhQQ9tI9yZQCaI7a5gCDKKPnY90qV9rw9sh
 BG1GZPyd/X9NVdB3PEWZZxQpqRoPDzd1twwQzJirZP/kBJzhauUE4RKYPwAIaE/te5tX
 YvQ9q7Dlw61+2qqw4lUJCh7qBn1ZX4kgqhJ4a+ygBBNU9OP+gZ4sZv8BLg3cXdd/iGM1
 Z0R3YoUWZTNpSGGVZwyPKb3+sTl9oJk/sL22uVeivOkFDaingxeO5GBUzqYuKLNA8UES
 qOPfEgy8CVoIRNASXIboR+it3TdzLC/BdO9LDCiOgvPuJqGGD7pDza2lzyBpaPY11jOo
 Y2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q08wWJmkpMRbD1uCLvdIthjIJ7wpxGIx6PIRtX9sdqE=;
 b=TwqtBLjc5Gcuz4LdSxahqhAXOpPZ8rNSroGwaIcE+vxQMT2pE7IBkpra0XHf2DiJLs
 t7OjiGKgO9hccfAJgSPn4fdd8S7KHHyZ3D4YSG2q3hadSeciWTw8OyhhhuRYWKQE6G6/
 n6ubXU0mQ5MRdysPn0lO0pxKU4lFUQ/lAV7DLre9BGYOJAaPl8mN3k3rXbtr+CrfHTFX
 1GqULFd3LQSQ/YD0sfp+4MRpnNAZ6ZkuvbJH18IMxu11Izq+0csYOB4D+quW9XZT+92J
 cSN+sS2OYtupio8gx0XWzDEwNoQ30kT0e8SqPs+nMZPZeDLv99ovC4mlyjD29BeQElXo
 fMwA==
X-Gm-Message-State: AOAM531BomWdJJQFRdorvUxA/P0Qxt6TBaOa4vbq4jwYnZK7vt10xl4R
 rETyjKwnI8YphrWIpiyzagOzIlngXvhefJt+
X-Google-Smtp-Source: ABdhPJw+bJKmLBg5ZYPGNTj3/e5Hga/Q7qUXHveojGsETqkVO43aHg856dchyCiin8FVAfujbLzncg==
X-Received: by 2002:a17:902:9a4a:b029:dc:435c:70ad with SMTP id
 x10-20020a1709029a4ab02900dc435c70admr5680329plv.77.1612403214899; 
 Wed, 03 Feb 2021 17:46:54 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 58/93] tcg/tci: Split out tci_args_{rrm,rrrm,rrrrm}
Date: Wed,  3 Feb 2021 15:44:34 -1000
Message-Id: <20210204014509.882821-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 147 ++++++++++++++++++++++++++++++------------------------
 1 file changed, 81 insertions(+), 66 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index ddc138359b..a1846825ea 100644
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
@@ -457,8 +444,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint8_t op_size = tb_ptr[1];
         const uint8_t *old_code_ptr = tb_ptr;
 #endif
-        TCGReg r0, r1, r2;
-        tcg_target_ulong t0;
+        TCGReg r0, r1, r2, r3;
         tcg_target_ulong t1;
         TCGCond condition;
         target_ulong taddr;
@@ -466,7 +452,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint32_t tmp32;
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
-        TCGReg r3, r4, r5;
+        TCGReg r4, r5;
         uint64_t T1, T2;
 #endif
         TCGMemOpIdx oi;
@@ -853,9 +839,13 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -884,15 +874,20 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -933,39 +928,58 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -992,6 +1006,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 g_assert_not_reached();
             }
             break;
+
         case INDEX_op_mb:
             /* Ensure ordering for all kinds */
             smp_mb();
-- 
2.25.1


