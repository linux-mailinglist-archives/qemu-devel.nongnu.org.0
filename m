Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F286F8AE4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:26:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vX-0000pd-8o; Fri, 05 May 2023 17:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vT-0000mu-Q9
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:15 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vL-0004eC-PA
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:15 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3077d134028so817064f8f.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321903; x=1685913903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZLKOkrrM6X6Chuoo3/tcJ4CYY7RF9VAHo0E2og71vlU=;
 b=N97QupoH4M0BRRKYI4+tlPbzg2kjWCLr93jtqfpCV7dHYdjWor/ZQ8yOUiH7vIi2xN
 cnuNESIW6GunmREzEP26B80gq2dwwKcj3G6KdhH+4kUFqAqfrBWxxk5UpepyX2HaFco/
 xtb2nc+F+7C+L9ezeHermPf/V1LzgAUAkmrc+tXwkklt4YhnMlasjwp+CVCnEQvGC3JF
 PfjZdyvxA0pCYkKUrHh3CV59tHDtoooYAsT2NFSGXkkeJplck9ivaJ6HR0SEavNUD2/H
 3jtnkF56mDtL1GE683qnO2eMRaZ9SI/hdICFP/WiXyy124mP0aldycdNKNpcGHB/C8yS
 WFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321903; x=1685913903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZLKOkrrM6X6Chuoo3/tcJ4CYY7RF9VAHo0E2og71vlU=;
 b=EdzsfUf6EDzGlOorCiiDmXbTPw1742lFQsPCUahLNh5LX2ayxBW2ANNw4oDr6d99UA
 0sjFC3ZYGKbgubvoZS7rcpVGXEgwhFn4Quxyxr4AFXuydsDZhBoRZk/KG/hTyHWfblgn
 vQXYo+ShH1KVY+Pu/1bJ+yPQETtWs+WiL9vU6ZDHDqXv2ZwBDEfTcm5MKiCugdyQpdK/
 L3v162qvEHECTb0PKearj87SQDjL5tz8HKH+nvRYBQz8CHGvbaoyr3afyTRou0sFA1oC
 8+lFmVvkLTCSwrD6dLxWgdH2on11KtoS1nA6whSi5UfdwYyXIerhdKkwbJwgQ5Wg1cTn
 LmRg==
X-Gm-Message-State: AC+VfDy7sYtF4g9Llx4ozxlZujSxytKb2tHiXlg5DqeG0YCktVgB29nb
 39bDhnc5llc74of90BjQ73sD4mwX6g+fdypnQwXYhw==
X-Google-Smtp-Source: ACHHUZ77f4uSZNPocOggauDkQxUW3cC06M2GZA7Noaojhqg5lOgalxPDgk8gwV5nYW2dhNwFvphNoA==
X-Received: by 2002:adf:fe47:0:b0:306:434:f8ef with SMTP id
 m7-20020adffe47000000b003060434f8efmr1943858wrs.70.1683321903644; 
 Fri, 05 May 2023 14:25:03 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.25.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:25:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/42] tcg/arm: Introduce HostAddress
Date: Fri,  5 May 2023 22:24:32 +0100
Message-Id: <20230505212447.374546-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Collect the parts of the host address, and condition, into a struct.
Merge tcg_out_qemu_*_{index,direct} and use it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 248 ++++++++++++++++++---------------------
 1 file changed, 115 insertions(+), 133 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 6ce52b9612..b6b4ffc546 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1337,6 +1337,13 @@ static void tcg_out_vldst(TCGContext *s, ARMInsn insn,
     tcg_out32(s, insn | (rn << 16) | encode_vd(rd) | 0xf);
 }
 
+typedef struct {
+    ARMCond cond;
+    TCGReg base;
+    int index;
+    bool index_scratch;
+} HostAddress;
+
 #ifdef CONFIG_SOFTMMU
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     int mmu_idx, uintptr_t ra)
@@ -1696,29 +1703,49 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 }
 #endif /* SOFTMMU */
 
-static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
-                                  TCGReg datalo, TCGReg datahi,
-                                  TCGReg addrlo, TCGReg addend,
-                                  bool scratch_addend)
+static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
+                                   TCGReg datahi, HostAddress h)
 {
+    TCGReg base;
+
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & MO_SSIZE) {
     case MO_UB:
-        tcg_out_ld8_r(s, COND_AL, datalo, addrlo, addend);
+        if (h.index < 0) {
+            tcg_out_ld8_12(s, h.cond, datalo, h.base, 0);
+        } else {
+            tcg_out_ld8_r(s, h.cond, datalo, h.base, h.index);
+        }
         break;
     case MO_SB:
-        tcg_out_ld8s_r(s, COND_AL, datalo, addrlo, addend);
+        if (h.index < 0) {
+            tcg_out_ld8s_8(s, h.cond, datalo, h.base, 0);
+        } else {
+            tcg_out_ld8s_r(s, h.cond, datalo, h.base, h.index);
+        }
         break;
     case MO_UW:
-        tcg_out_ld16u_r(s, COND_AL, datalo, addrlo, addend);
+        if (h.index < 0) {
+            tcg_out_ld16u_8(s, h.cond, datalo, h.base, 0);
+        } else {
+            tcg_out_ld16u_r(s, h.cond, datalo, h.base, h.index);
+        }
         break;
     case MO_SW:
-        tcg_out_ld16s_r(s, COND_AL, datalo, addrlo, addend);
+        if (h.index < 0) {
+            tcg_out_ld16s_8(s, h.cond, datalo, h.base, 0);
+        } else {
+            tcg_out_ld16s_r(s, h.cond, datalo, h.base, h.index);
+        }
         break;
     case MO_UL:
-        tcg_out_ld32_r(s, COND_AL, datalo, addrlo, addend);
+        if (h.index < 0) {
+            tcg_out_ld32_12(s, h.cond, datalo, h.base, 0);
+        } else {
+            tcg_out_ld32_r(s, h.cond, datalo, h.base, h.index);
+        }
         break;
     case MO_UQ:
         /* We used pair allocation for datalo, so already should be aligned. */
@@ -1726,87 +1753,59 @@ static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
         tcg_debug_assert(datahi == datalo + 1);
         /* LDRD requires alignment; double-check that. */
         if (get_alignment_bits(opc) >= MO_64) {
+            if (h.index < 0) {
+                tcg_out_ldrd_8(s, h.cond, datalo, h.base, 0);
+                break;
+            }
             /*
              * Rm (the second address op) must not overlap Rt or Rt + 1.
              * Since datalo is aligned, we can simplify the test via alignment.
              * Flip the two address arguments if that works.
              */
-            if ((addend & ~1) != datalo) {
-                tcg_out_ldrd_r(s, COND_AL, datalo, addrlo, addend);
+            if ((h.index & ~1) != datalo) {
+                tcg_out_ldrd_r(s, h.cond, datalo, h.base, h.index);
                 break;
             }
-            if ((addrlo & ~1) != datalo) {
-                tcg_out_ldrd_r(s, COND_AL, datalo, addend, addrlo);
+            if ((h.base & ~1) != datalo) {
+                tcg_out_ldrd_r(s, h.cond, datalo, h.index, h.base);
                 break;
             }
         }
-        if (scratch_addend) {
-            tcg_out_ld32_rwb(s, COND_AL, datalo, addend, addrlo);
-            tcg_out_ld32_12(s, COND_AL, datahi, addend, 4);
+        if (h.index < 0) {
+            base = h.base;
+            if (datalo == h.base) {
+                tcg_out_mov_reg(s, h.cond, TCG_REG_TMP, base);
+                base = TCG_REG_TMP;
+            }
+        } else if (h.index_scratch) {
+            tcg_out_ld32_rwb(s, h.cond, datalo, h.index, h.base);
+            tcg_out_ld32_12(s, h.cond, datahi, h.index, 4);
+            break;
         } else {
-            tcg_out_dat_reg(s, COND_AL, ARITH_ADD, TCG_REG_TMP,
-                            addend, addrlo, SHIFT_IMM_LSL(0));
-            tcg_out_ld32_12(s, COND_AL, datalo, TCG_REG_TMP, 0);
-            tcg_out_ld32_12(s, COND_AL, datahi, TCG_REG_TMP, 4);
+            tcg_out_dat_reg(s, h.cond, ARITH_ADD, TCG_REG_TMP,
+                            h.base, h.index, SHIFT_IMM_LSL(0));
+            base = TCG_REG_TMP;
         }
+        tcg_out_ld32_12(s, h.cond, datalo, base, 0);
+        tcg_out_ld32_12(s, h.cond, datahi, base, 4);
         break;
     default:
         g_assert_not_reached();
     }
 }
 
-#ifndef CONFIG_SOFTMMU
-static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
-                                   TCGReg datahi, TCGReg addrlo)
-{
-    /* Byte swapping is left to middle-end expansion. */
-    tcg_debug_assert((opc & MO_BSWAP) == 0);
-
-    switch (opc & MO_SSIZE) {
-    case MO_UB:
-        tcg_out_ld8_12(s, COND_AL, datalo, addrlo, 0);
-        break;
-    case MO_SB:
-        tcg_out_ld8s_8(s, COND_AL, datalo, addrlo, 0);
-        break;
-    case MO_UW:
-        tcg_out_ld16u_8(s, COND_AL, datalo, addrlo, 0);
-        break;
-    case MO_SW:
-        tcg_out_ld16s_8(s, COND_AL, datalo, addrlo, 0);
-        break;
-    case MO_UL:
-        tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
-        break;
-    case MO_UQ:
-        /* We used pair allocation for datalo, so already should be aligned. */
-        tcg_debug_assert((datalo & 1) == 0);
-        tcg_debug_assert(datahi == datalo + 1);
-        /* LDRD requires alignment; double-check that. */
-        if (get_alignment_bits(opc) >= MO_64) {
-            tcg_out_ldrd_8(s, COND_AL, datalo, addrlo, 0);
-        } else if (datalo == addrlo) {
-            tcg_out_ld32_12(s, COND_AL, datahi, addrlo, 4);
-            tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
-        } else {
-            tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
-            tcg_out_ld32_12(s, COND_AL, datahi, addrlo, 4);
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
-}
-#endif
-
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             TCGReg addrlo, TCGReg addrhi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    HostAddress h;
 
 #ifdef CONFIG_SOFTMMU
-    TCGReg addend= tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 1);
+    h.cond = COND_AL;
+    h.base = addrlo;
+    h.index_scratch = true;
+    h.index = tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 1);
 
     /*
      * This a conditional BL only to load a pointer within this opcode into
@@ -1815,80 +1814,51 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
     tcg_insn_unit *label_ptr = s->code_ptr;
     tcg_out_bl_imm(s, COND_NE, 0);
 
-    tcg_out_qemu_ld_index(s, opc, datalo, datahi, addrlo, addend, true);
+    tcg_out_qemu_ld_direct(s, opc, datalo, datahi, h);
 
     add_qemu_ldst_label(s, true, oi, data_type, datalo, datahi,
                         addrlo, addrhi, s->code_ptr, label_ptr);
-#else /* !CONFIG_SOFTMMU */
+#else
     unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
     }
-    if (guest_base) {
-        tcg_out_qemu_ld_index(s, opc, datalo, datahi,
-                              addrlo, TCG_REG_GUEST_BASE, false);
-    } else {
-        tcg_out_qemu_ld_direct(s, opc, datalo, datahi, addrlo);
-    }
+
+    h.cond = COND_AL;
+    h.base = addrlo;
+    h.index = guest_base ? TCG_REG_GUEST_BASE : -1;
+    h.index_scratch = false;
+    tcg_out_qemu_ld_direct(s, opc, datalo, datahi, h);
 #endif
 }
 
-static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
-                                  TCGReg datalo, TCGReg datahi,
-                                  TCGReg addrlo, TCGReg addend,
-                                  bool scratch_addend)
-{
-    /* Byte swapping is left to middle-end expansion. */
-    tcg_debug_assert((opc & MO_BSWAP) == 0);
-
-    switch (opc & MO_SIZE) {
-    case MO_8:
-        tcg_out_st8_r(s, cond, datalo, addrlo, addend);
-        break;
-    case MO_16:
-        tcg_out_st16_r(s, cond, datalo, addrlo, addend);
-        break;
-    case MO_32:
-        tcg_out_st32_r(s, cond, datalo, addrlo, addend);
-        break;
-    case MO_64:
-        /* We used pair allocation for datalo, so already should be aligned. */
-        tcg_debug_assert((datalo & 1) == 0);
-        tcg_debug_assert(datahi == datalo + 1);
-        /* STRD requires alignment; double-check that. */
-        if (get_alignment_bits(opc) >= MO_64) {
-            tcg_out_strd_r(s, cond, datalo, addrlo, addend);
-        } else if (scratch_addend) {
-            tcg_out_st32_rwb(s, cond, datalo, addend, addrlo);
-            tcg_out_st32_12(s, cond, datahi, addend, 4);
-        } else {
-            tcg_out_dat_reg(s, cond, ARITH_ADD, TCG_REG_TMP,
-                            addend, addrlo, SHIFT_IMM_LSL(0));
-            tcg_out_st32_12(s, cond, datalo, TCG_REG_TMP, 0);
-            tcg_out_st32_12(s, cond, datahi, TCG_REG_TMP, 4);
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
-}
-
-#ifndef CONFIG_SOFTMMU
 static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
-                                   TCGReg datahi, TCGReg addrlo)
+                                   TCGReg datahi, HostAddress h)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & MO_SIZE) {
     case MO_8:
-        tcg_out_st8_12(s, COND_AL, datalo, addrlo, 0);
+        if (h.index < 0) {
+            tcg_out_st8_12(s, h.cond, datalo, h.base, 0);
+        } else {
+            tcg_out_st8_r(s, h.cond, datalo, h.base, h.index);
+        }
         break;
     case MO_16:
-        tcg_out_st16_8(s, COND_AL, datalo, addrlo, 0);
+        if (h.index < 0) {
+            tcg_out_st16_8(s, h.cond, datalo, h.base, 0);
+        } else {
+            tcg_out_st16_r(s, h.cond, datalo, h.base, h.index);
+        }
         break;
     case MO_32:
-        tcg_out_st32_12(s, COND_AL, datalo, addrlo, 0);
+        if (h.index < 0) {
+            tcg_out_st32_12(s, h.cond, datalo, h.base, 0);
+        } else {
+            tcg_out_st32_r(s, h.cond, datalo, h.base, h.index);
+        }
         break;
     case MO_64:
         /* We used pair allocation for datalo, so already should be aligned. */
@@ -1896,29 +1866,39 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
         tcg_debug_assert(datahi == datalo + 1);
         /* STRD requires alignment; double-check that. */
         if (get_alignment_bits(opc) >= MO_64) {
-            tcg_out_strd_8(s, COND_AL, datalo, addrlo, 0);
+            if (h.index < 0) {
+                tcg_out_strd_8(s, h.cond, datalo, h.base, 0);
+            } else {
+                tcg_out_strd_r(s, h.cond, datalo, h.base, h.index);
+            }
+        } else if (h.index_scratch) {
+            tcg_out_st32_rwb(s, h.cond, datalo, h.index, h.base);
+            tcg_out_st32_12(s, h.cond, datahi, h.index, 4);
         } else {
-            tcg_out_st32_12(s, COND_AL, datalo, addrlo, 0);
-            tcg_out_st32_12(s, COND_AL, datahi, addrlo, 4);
+            tcg_out_dat_reg(s, h.cond, ARITH_ADD, TCG_REG_TMP,
+                            h.base, h.index, SHIFT_IMM_LSL(0));
+            tcg_out_st32_12(s, h.cond, datalo, TCG_REG_TMP, 0);
+            tcg_out_st32_12(s, h.cond, datahi, TCG_REG_TMP, 4);
         }
         break;
     default:
         g_assert_not_reached();
     }
 }
-#endif
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             TCGReg addrlo, TCGReg addrhi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    HostAddress h;
 
 #ifdef CONFIG_SOFTMMU
-    TCGReg addend = tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 0);
-
-    tcg_out_qemu_st_index(s, COND_EQ, opc, datalo, datahi,
-                          addrlo, addend, true);
+    h.cond = COND_EQ;
+    h.base = addrlo;
+    h.index_scratch = true;
+    h.index = tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 0);
+    tcg_out_qemu_st_direct(s, opc, datalo, datahi, h);
 
     /* The conditional call must come last, as we're going to return here.  */
     tcg_insn_unit *label_ptr = s->code_ptr;
@@ -1926,17 +1906,19 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
 
     add_qemu_ldst_label(s, false, oi, data_type, datalo, datahi,
                         addrlo, addrhi, s->code_ptr, label_ptr);
-#else /* !CONFIG_SOFTMMU */
+#else
     unsigned a_bits = get_alignment_bits(opc);
+
+    h.cond = COND_AL;
     if (a_bits) {
         tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
+        h.cond = COND_EQ;
     }
-    if (guest_base) {
-        tcg_out_qemu_st_index(s, COND_AL, opc, datalo, datahi,
-                              addrlo, TCG_REG_GUEST_BASE, false);
-    } else {
-        tcg_out_qemu_st_direct(s, opc, datalo, datahi, addrlo);
-    }
+
+    h.base = addrlo;
+    h.index = guest_base ? TCG_REG_GUEST_BASE : -1;
+    h.index_scratch = false;
+    tcg_out_qemu_st_direct(s, opc, datalo, datahi, h);
 #endif
 }
 
-- 
2.34.1


