Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F3B606283
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:10:46 +0200 (CEST)
Received: from localhost ([::1]:36794 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWFu-0001tg-9U
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:10:42 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVza-0002Ng-Q7
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU8N-0005au-Tp
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:59 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU8K-0001A2-FI
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:46 -0400
Received: by mail-pj1-x102b.google.com with SMTP id pq16so19563874pjb.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Pjg0KuM9fefFLZ6sJecPtemh73sMVb546+yZvj4IyU4=;
 b=RZvIDufBmbrhEWCdhK0Ts5lbIWhKSazBtG8QCVSX8qjvakGtyf5VS2eYz/PjmEI7qo
 Zj7R904WTSgFTcA13SHgWZ8kok+jGuVhsNAZDUSYtjf9NngipCkXi4ZMra4l4FBj+WaI
 XBjL5uRIv1F4anw8sq04pI5bFvywkD1JueNi2q7DqJ/Sq3q0oJPSrB2KBQCR4arcs+9B
 FF5HgrRCOUutsOx0zy2K35boMTWzpJWGgm4Si9ll9fiLC4Q43115uQ0rsw4TImY5U7vZ
 bDKWrJ3JcoszJnIJdTEQcwpyFzXNrXsDU39J05zTLrCF4j7xh7yaIl0K8ssdRLrc5Dz/
 sJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pjg0KuM9fefFLZ6sJecPtemh73sMVb546+yZvj4IyU4=;
 b=yBTapAb/E0btFXqOjF8Xp0DEd5a0uShmlp0bwsjo6k0KzOGW/2fP0bOgQ8SHgS8J/2
 WUEBbkpxkypGfzkUZgcN7IAjV6/nKsQZ0ER2FWNHE1NR62olVwA4QHjekZLBegqPiqi8
 6JtODj/crnyzOxcnh2lJSQLA2BOZOeFZQL+vRqDzCAUpjIIHeR1NJRbvIU6GiPxGqma9
 G36xi67tNNAkIu8bikM3M51u7uFEPx2sWZQ1hPM4Q577awRKPlRc+0VeL+8gzbBUB/Cf
 znZFXn51aTlXJDB9anUx09iN+WYm77xUf8pwZipn35oiNU2ciEpsd/dvPa8dC0noeAtb
 SY3Q==
X-Gm-Message-State: ACrzQf1oRhPKx1QHHzLyTg2Hk8rY0HyG4wFySEMkF86UO9hANDx7VRUv
 8xkSO6n7Pg4W9oWDwPu02AMOkY0+WIe8NB3P
X-Google-Smtp-Source: AMsMyM7L6R62RLFZzbfzJtCIhGjXlt4DoW6tfYd4BvV8RXKuFNnF9RoLC0ptYgGl48JiXfu3Y6Mvow==
X-Received: by 2002:a17:903:40cf:b0:17f:7d7e:95b0 with SMTP id
 t15-20020a17090340cf00b0017f7d7e95b0mr13458925pld.78.1666266883177; 
 Thu, 20 Oct 2022 04:54:43 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.54.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:54:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/31] tcg: Add tcg_gen_extr_i128_i64, tcg_gen_concat_i64_i128
Date: Thu, 20 Oct 2022 21:52:42 +1000
Message-Id: <20221020115242.2301066-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add code generation functions for data movement between
TCGv_i128 and TCGv_i64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h  |  3 ++
 include/tcg/tcg-opc.h |  4 ++
 tcg/tcg-internal.h    | 12 ++++++
 tcg/tcg-op.c          | 35 ++++++++++++++++++
 tcg/tcg.c             | 85 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 139 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 209e168305..2ce2ff28c9 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -735,6 +735,9 @@ void tcg_gen_extrh_i64_i32(TCGv_i32 ret, TCGv_i64 arg);
 void tcg_gen_extr_i64_i32(TCGv_i32 lo, TCGv_i32 hi, TCGv_i64 arg);
 void tcg_gen_extr32_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i64 arg);
 
+void tcg_gen_extr_i128_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i128 arg);
+void tcg_gen_concat_i64_i128(TCGv_i128 ret, TCGv_i64 lo, TCGv_i64 hi);
+
 static inline void tcg_gen_concat32_i64(TCGv_i64 ret, TCGv_i64 lo, TCGv_i64 hi)
 {
     tcg_gen_deposit_i64(ret, lo, hi, 32, 32);
diff --git a/include/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
index dd444734d9..6211fb3242 100644
--- a/include/tcg/tcg-opc.h
+++ b/include/tcg/tcg-opc.h
@@ -158,6 +158,10 @@ DEF(extrh_i64_i32, 1, 1, 0,
     IMPL(TCG_TARGET_HAS_extrh_i64_i32)
     | (TCG_TARGET_REG_BITS == 32 ? TCG_OPF_NOT_PRESENT : 0))
 
+/* For 32-bit host only, implemented generically using ld/st/mov. */
+DEF(extr_i128_i32, 1, 1, 1, TCG_OPF_NOT_PRESENT)
+DEF(concat4_i32_i128, 1, 4, 0, TCG_OPF_NOT_PRESENT)
+
 DEF(brcond_i64, 0, 2, 2, TCG_OPF_BB_END | TCG_OPF_COND_BRANCH | IMPL64)
 DEF(ext8s_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_ext8s_i64))
 DEF(ext16s_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_ext16s_i64))
diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 44ef51ca30..8112a0a491 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -110,9 +110,21 @@ static inline TCGv_i32 TCGV_HIGH(TCGv_i64 t)
 {
     return temp_tcgv_i32(tcgv_i64_temp(t) + !HOST_BIG_ENDIAN);
 }
+extern TCGv_i64 TCGV128_LOW(TCGv_i128)
+    QEMU_ERROR("64-bit code path is reachable");
+extern TCGv_i64 TCGV128_HIGH(TCGv_i128)
+    QEMU_ERROR("64-bit code path is reachable");
 #else
 extern TCGv_i32 TCGV_LOW(TCGv_i64) QEMU_ERROR("32-bit code path is reachable");
 extern TCGv_i32 TCGV_HIGH(TCGv_i64) QEMU_ERROR("32-bit code path is reachable");
+static inline TCGv_i64 TCGV128_LOW(TCGv_i128 t)
+{
+    return temp_tcgv_i64(tcgv_i128_temp(t) + HOST_BIG_ENDIAN);
+}
+static inline TCGv_i64 TCGV128_HIGH(TCGv_i128 t)
+{
+    return temp_tcgv_i64(tcgv_i128_temp(t) + !HOST_BIG_ENDIAN);
+}
 #endif
 
 #endif /* TCG_INTERNAL_H */
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 3ed98ffa01..6031fa89c2 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2718,6 +2718,41 @@ void tcg_gen_extr32_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i64 arg)
     tcg_gen_shri_i64(hi, arg, 32);
 }
 
+void tcg_gen_extr_i128_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i128 arg)
+{
+    if (TCG_TARGET_REG_BITS == 32) {
+        TCGArg a_arg = tcgv_i128_arg(arg);
+        int be = HOST_BIG_ENDIAN ? 0xc : 0;
+
+        tcg_gen_op3(INDEX_op_extr_i128_i32, tcgv_i32_arg(TCGV_LOW(lo)),
+                    a_arg, 0x0 ^ be);
+        tcg_gen_op3(INDEX_op_extr_i128_i32, tcgv_i32_arg(TCGV_HIGH(lo)),
+                    a_arg, 0x4 ^ be);
+        tcg_gen_op3(INDEX_op_extr_i128_i32, tcgv_i32_arg(TCGV_LOW(hi)),
+                    a_arg, 0x8 ^ be);
+        tcg_gen_op3(INDEX_op_extr_i128_i32, tcgv_i32_arg(TCGV_HIGH(hi)),
+                    a_arg, 0xc ^ be);
+    } else {
+        tcg_gen_mov_i64(lo, TCGV128_LOW(arg));
+        tcg_gen_mov_i64(hi, TCGV128_HIGH(arg));
+    }
+}
+
+void tcg_gen_concat_i64_i128(TCGv_i128 ret, TCGv_i64 lo, TCGv_i64 hi)
+{
+    if (TCG_TARGET_REG_BITS == 32) {
+        tcg_gen_op5(INDEX_op_concat4_i32_i128,
+                    tcgv_i128_arg(ret),
+                    tcgv_i32_arg(TCGV_LOW(lo)),
+                    tcgv_i32_arg(TCGV_HIGH(lo)),
+                    tcgv_i32_arg(TCGV_LOW(hi)),
+                    tcgv_i32_arg(TCGV_HIGH(hi)));
+    } else {
+        tcg_gen_mov_i64(TCGV128_LOW(ret), lo);
+        tcg_gen_mov_i64(TCGV128_HIGH(ret), hi);
+    }
+}
+
 /* QEMU specific operations.  */
 
 void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx)
diff --git a/tcg/tcg.c b/tcg/tcg.c
index c6e856a2cc..04e52c42d8 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3949,6 +3949,85 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
     }
 }
 
+/*
+ * Specialized code generation for TCG_TYPE_I128 on 32-bit host.
+ * Here, 128-bit values are *always* in memory, never regs or constants.
+ * Move 32-bit pieces into and out of the 128-bit memory slot.
+ */
+static void tcg_reg_alloc_exrl_i128_i32(TCGContext *s, const TCGOp *op)
+{
+    const TCGLifeData arg_life = op->life;
+    TCGTemp *ots = arg_temp(op->args[0]);
+    TCGTemp *its = arg_temp(op->args[1]);
+    TCGArg ofs = op->args[2];
+    TCGReg reg;
+
+    assert(TCG_TARGET_REG_BITS == 32);
+    tcg_debug_assert(ots->type == TCG_TYPE_I32);
+    tcg_debug_assert(!temp_readonly(ots));
+    tcg_debug_assert(its->type == TCG_TYPE_I128);
+    tcg_debug_assert(its->val_type == TEMP_VAL_MEM);
+    tcg_debug_assert(ofs < 16);
+    tcg_debug_assert((ofs & 3) == 0);
+
+    if (ots->val_type == TEMP_VAL_REG) {
+        reg = ots->reg;
+    } else {
+        reg = tcg_reg_alloc(s, tcg_target_available_regs[TCG_TYPE_I32],
+                            s->reserved_regs, op->output_pref[0],
+                            ots->indirect_base);
+        ots->val_type = TEMP_VAL_REG;
+        ots->reg = reg;
+        s->reg_to_temp[reg] = ots;
+    }
+
+    tcg_out_ld(s, TCG_TYPE_I32, reg,
+               its->mem_base->reg, its->mem_offset + ofs);
+    ots->mem_coherent = 0;
+
+    if (IS_DEAD_ARG(1)) {
+        temp_dead(s, its);
+    }
+}
+
+static void tcg_reg_alloc_concat4_i32_i128(TCGContext *s, const TCGOp *op)
+{
+    const TCGLifeData arg_life = op->life;
+    TCGTemp *ots = arg_temp(op->args[0]);
+    int be = HOST_BIG_ENDIAN ? 0xc : 0;
+
+    assert(TCG_TARGET_REG_BITS == 32);
+    tcg_debug_assert(ots->type == TCG_TYPE_I128);
+    tcg_debug_assert(!temp_readonly(ots));
+    tcg_debug_assert(NEED_SYNC_ARG(0));
+
+    if (!ots->mem_allocated) {
+        temp_allocate_frame(s, ots);
+    }
+
+    for (int i = 0; i < 4; ++i) {
+        TCGTemp *its = arg_temp(op->args[i + 1]);
+        int ofs = ots->mem_offset + ((i * 4) ^ be);
+
+        if (its->val_type == TEMP_VAL_CONST &&
+            IS_DEAD_ARG(i + 1) &&
+            tcg_out_sti(s, TCG_TYPE_I32, its->val, ots->mem_base->reg, ofs)) {
+            continue;
+        }
+
+        temp_load(s, its, tcg_target_available_regs[TCG_TYPE_I32],
+                  s->reserved_regs, 0);
+        tcg_out_st(s, TCG_TYPE_I32, its->reg, ots->mem_base->reg, ofs);
+
+        if (IS_DEAD_ARG(i + 1)) {
+            temp_dead(s, its);
+        }
+    }
+
+    ots->val_type = TEMP_VAL_MEM;
+    ots->mem_coherent = 1;
+}
+
 /*
  * Specialized code generation for INDEX_op_dup_vec.
  */
@@ -5007,6 +5086,12 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
         case INDEX_op_mov_vec:
             tcg_reg_alloc_mov(s, op);
             break;
+        case INDEX_op_extr_i128_i32:
+            tcg_reg_alloc_exrl_i128_i32(s, op);
+            break;
+        case INDEX_op_concat4_i32_i128:
+            tcg_reg_alloc_concat4_i32_i128(s, op);
+            break;
         case INDEX_op_dup_vec:
             tcg_reg_alloc_dup(s, op);
             break;
-- 
2.34.1


