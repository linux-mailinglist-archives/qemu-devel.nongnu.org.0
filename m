Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6FA33F49D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:52:47 +0100 (CET)
Received: from localhost ([::1]:45232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYTW-0006L7-4C
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCS-0005EY-Nd
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:10 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:46990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCP-0007Ch-EX
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:08 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso2149919ott.13
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pMCNtzw8zxb7KEVYhmhe7WEY+ee7y9TjAKBvQCxei8U=;
 b=rWzksdTNvO64hJ1ywz2I9q3NPMMJvo3DCmXDYJtcSBcEjtUQDXf+0IdNQ8w9tlc4I+
 Jp1JYAyrsVlIEbNVPI4wLVBEA9phjJGghBvb1UUj1FImmJ5xRLgFTlJN5k4ojACmFc+2
 SzNXa+xRpeQvQxIFA1c1tqzPcyTzE0kw9nPsDBXqdaRFbAn0dA3j/cMuVpaZ71El7Vni
 it5ttsGLT2SojaduQxL3Dwsx2UxBRGqGac047Amyl5VjI4mXLAzxr8fk86V2CfccMj5k
 bpbrOKNCTdk5bf6LaLIg+m73t3Zv45BXySF6ev1KL8MkFqKEHQ4r/I88RaADKgSawpCN
 HNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pMCNtzw8zxb7KEVYhmhe7WEY+ee7y9TjAKBvQCxei8U=;
 b=QgTxQ539j0+vlIvuTooVFkUdPeCnYaR4EKGgFU2ItX4ijeNA0NSkZPeFK7OOaRzfSy
 0ZSBylZL/6ASoFvYG4xZctCuVdqmLyt7sej4fKu2BGSPm4xczpOJHzLhbhZMxQ+KEq3r
 JfTd6bBNExk7tunPExyoMpC8ZEb4LoF08cLGrsNDb2AiwOrEEUZCjnuAxMbiGjuM/2uO
 3sj74c50xmzmL82x0FvP2QjzbbCer/HY3d3F9JJ93kTopO2HQlPlfaLU3x/w0RWaBSXn
 f3ARULiXWK2awn2Em00EzAL6DLVr7aMKOU5wOLkZBJnWuCsvEc4MWSITzLM0qxFDnqvL
 zWdg==
X-Gm-Message-State: AOAM530bR4AtYbVrLndJOK7qz16byisTKnFVhVGWKzJBdxc+KGhSFZI5
 yPWPmbqyL2qdeCn+2DZVyNF5abVVEOthG211
X-Google-Smtp-Source: ABdhPJzPT32dSZCoC8t8aivKvnkH8W6HK08CrhbiS0u420J6yYsUP/tmaXRmYWOPQCL3FiT/8LQwGA==
X-Received: by 2002:a9d:370:: with SMTP id 103mr3749513otv.232.1615995304216; 
 Wed, 17 Mar 2021 08:35:04 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/38] tcg/tci: Split out tci_args_{rrm,rrrm,rrrrm}
Date: Wed, 17 Mar 2021 09:34:24 -0600
Message-Id: <20210317153444.310566-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 147 ++++++++++++++++++++++++++++++------------------------
 1 file changed, 81 insertions(+), 66 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index ebd4c74176..1aa63fae4d 100644
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
@@ -173,6 +132,7 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   i = immediate (uint32_t)
  *   I = immediate (tcg_target_ulong)
  *   l = label or pointer
+ *   m = immediate (TCGMemOpIdx)
  *   r = register
  *   s = signed ldst offset
  */
@@ -205,6 +165,14 @@ static void tci_args_rI(const uint8_t **tb_ptr,
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
@@ -239,6 +207,15 @@ static void tci_args_rrrc(const uint8_t **tb_ptr,
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
@@ -249,6 +226,16 @@ static void tci_args_rrrbb(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
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
@@ -442,8 +429,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint8_t op_size = tb_ptr[1];
         const uint8_t *old_code_ptr = tb_ptr;
 #endif
-        TCGReg r0, r1, r2;
-        tcg_target_ulong t0;
+        TCGReg r0, r1, r2, r3;
         tcg_target_ulong t1;
         TCGCond condition;
         target_ulong taddr;
@@ -451,7 +437,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint32_t tmp32;
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
-        TCGReg r3, r4, r5;
+        TCGReg r4, r5;
         uint64_t T1, T2;
 #endif
         TCGMemOpIdx oi;
@@ -838,9 +824,13 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -869,15 +859,20 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -918,39 +913,58 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -977,6 +991,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 g_assert_not_reached();
             }
             break;
+
         case INDEX_op_mb:
             /* Ensure ordering for all kinds */
             smp_mb();
-- 
2.25.1


