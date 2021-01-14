Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BD42F572F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 03:22:16 +0100 (CET)
Received: from localhost ([::1]:46496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzsH9-0000H1-3z
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 21:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCJ-0003ai-OH
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:21 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCH-0003Ry-Hw
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:15 -0500
Received: by mail-pj1-x102f.google.com with SMTP id l23so2366187pjg.1
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 18:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LsIdAJbKACMjuuIjOJp26kSOqsc3HuJuSVDCVt9lL6E=;
 b=PEAN90QDdYWg0D6+2VK+ECzrdt94z49ITK0kV81PjzWuIvu4XTH8BKUA4Fi2Ym3KEV
 u6MSflwnYbWycHeb+E7ryAcNRSqaH6Dk1n+psSC15WBz0NHZVeRU/6Yv1ILeYYC+IjJD
 9qYHddH3dfVUdLOZLGJGurc8RPhhgCuMYxDU77t9S/8u835zMP1Oaj3+sc9tOCuGY+SA
 7pENk91p/VOH4tZGOiDdyU6um2wNI8nfH1HUOHhCdej76STfFQA6jYFCm2RqQiA3LmEg
 nF2SSr6FzmCkZnI43BMghg41oo65G3HnDywqLQ/ZFJy5yqfi6gGJl5a+TfbvN7E1XEUY
 hUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LsIdAJbKACMjuuIjOJp26kSOqsc3HuJuSVDCVt9lL6E=;
 b=didqRJzJCzQC8/hVzXz0f1vqmmIqDqm6LEg+NFibkQBG9dgs05XhwkNklgIPAzqKmf
 kRPJ1wirEUFL3ZTp1knyhHcbiThh3LWGcSyHRNM1UiCSQDAZoqC8Zr5gqhBd+M6hQQZn
 hl/j6ZTFH0/C3DBfAd0WAH2iAFNFbNcE9UG5gyK8wjuRW4BaH5jJB7z3hlxOao8yzfa8
 HFQDlIATs8quOARzYUpTZRWDo90Q8rbZX2CZapkTcUy2ZKimLqR43swGdRm2WM0SSdeJ
 aiNp3MlpnMVoKUn9H5DFVP1zwdhsUI89Z33uew7QSwjQNKySTjPdtDMS/uZ02cboSbj+
 4ZoA==
X-Gm-Message-State: AOAM530YpuY8yHzuQRw14HySQwBrhLdu8qPMFlsK2bnqW1RKNixT0CMw
 u+P9dI6LzUngFFFYwHKHwaaSyOgDgh/gig==
X-Google-Smtp-Source: ABdhPJw0I8Ic+RNijA8lVVod7zwCrC3rezL+/a3qaTt/iXhQEihQnpiOwg0Uc6dbdAIiDuzMufjjDg==
X-Received: by 2002:a17:902:bc41:b029:de:1ec2:dac1 with SMTP id
 t1-20020a170902bc41b02900de1ec2dac1mr5315916plz.9.1610590631728; 
 Wed, 13 Jan 2021 18:17:11 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i7sm3771687pfc.50.2021.01.13.18.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:17:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/24] tcg: Introduce TYPE_CONST temporaries
Date: Wed, 13 Jan 2021 16:16:38 -1000
Message-Id: <20210114021654.647242-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114021654.647242-1-richard.henderson@linaro.org>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These will hold a single constant for the duration of the TB.
They are hashed, so that each value has one temp across the TB.

Not used yet, this is all infrastructure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |  24 ++++-
 tcg/optimize.c    |  13 ++-
 tcg/tcg.c         | 224 ++++++++++++++++++++++++++++++++++++----------
 3 files changed, 211 insertions(+), 50 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index e7adc7e265..eeeb70ad43 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -492,6 +492,8 @@ typedef enum TCGTempKind {
     TEMP_GLOBAL,
     /* Temp is in a fixed register. */
     TEMP_FIXED,
+    /* Temp is a fixed constant. */
+    TEMP_CONST,
 } TCGTempKind;
 
 typedef struct TCGTemp {
@@ -665,6 +667,7 @@ struct TCGContext {
     QSIMPLEQ_HEAD(, TCGOp) plugin_ops;
 #endif
 
+    GHashTable *const_table[TCG_TYPE_COUNT];
     TCGTempSet free_temps[TCG_TYPE_COUNT * 2];
     TCGTemp temps[TCG_MAX_TEMPS]; /* globals first, temps after */
 
@@ -681,7 +684,7 @@ struct TCGContext {
 
 static inline bool temp_readonly(TCGTemp *ts)
 {
-    return ts->kind == TEMP_FIXED;
+    return ts->kind >= TEMP_FIXED;
 }
 
 extern TCGContext tcg_init_ctx;
@@ -1079,6 +1082,7 @@ TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *op, TCGOpcode opc);
 
 void tcg_optimize(TCGContext *s);
 
+/* Allocate a new temporary and initialize it with a constant. */
 TCGv_i32 tcg_const_i32(int32_t val);
 TCGv_i64 tcg_const_i64(int64_t val);
 TCGv_i32 tcg_const_local_i32(int32_t val);
@@ -1088,6 +1092,24 @@ TCGv_vec tcg_const_ones_vec(TCGType);
 TCGv_vec tcg_const_zeros_vec_matching(TCGv_vec);
 TCGv_vec tcg_const_ones_vec_matching(TCGv_vec);
 
+/*
+ * Locate or create a read-only temporary that is a constant.
+ * This kind of temporary need not and should not be freed.
+ */
+TCGTemp *tcg_constant_internal(TCGType type, int64_t val);
+
+static inline TCGv_i32 tcg_constant_i32(int32_t val)
+{
+    return temp_tcgv_i32(tcg_constant_internal(TCG_TYPE_I32, val));
+}
+
+static inline TCGv_i64 tcg_constant_i64(int64_t val)
+{
+    return temp_tcgv_i64(tcg_constant_internal(TCG_TYPE_I64, val));
+}
+
+TCGv_vec tcg_constant_vec(TCGType type, unsigned vece, int64_t val);
+
 #if UINTPTR_MAX == UINT32_MAX
 # define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i32((intptr_t)(x)))
 # define tcg_const_local_ptr(x)  ((TCGv_ptr)tcg_const_local_i32((intptr_t)(x)))
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 433d2540f4..16b0aa7229 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -99,8 +99,17 @@ static void init_ts_info(TempOptInfo *infos,
         ts->state_ptr = ti;
         ti->next_copy = ts;
         ti->prev_copy = ts;
-        ti->is_const = false;
-        ti->mask = -1;
+        if (ts->kind == TEMP_CONST) {
+            ti->is_const = true;
+            ti->val = ti->mask = ts->val;
+            if (TCG_TARGET_REG_BITS > 32 && ts->type == TCG_TYPE_I32) {
+                /* High bits of a 32-bit quantity are garbage.  */
+                ti->mask |= ~0xffffffffull;
+            }
+        } else {
+            ti->is_const = false;
+            ti->mask = -1;
+        }
         set_bit(idx, temps_used->l);
     }
 }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 545dd2b0b2..802f0b8a32 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1184,6 +1184,13 @@ void tcg_func_start(TCGContext *s)
     /* No temps have been previously allocated for size or locality.  */
     memset(s->free_temps, 0, sizeof(s->free_temps));
 
+    /* No constant temps have been previously allocated. */
+    for (int i = 0; i < TCG_TYPE_COUNT; ++i) {
+        if (s->const_table[i]) {
+            g_hash_table_remove_all(s->const_table[i]);
+        }
+    }
+
     s->nb_ops = 0;
     s->nb_labels = 0;
     s->current_frame_offset = s->frame_start;
@@ -1255,13 +1262,19 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
     bigendian = 1;
 #endif
 
-    if (base_ts->kind != TEMP_FIXED) {
+    switch (base_ts->kind) {
+    case TEMP_FIXED:
+        break;
+    case TEMP_GLOBAL:
         /* We do not support double-indirect registers.  */
         tcg_debug_assert(!base_ts->indirect_reg);
         base_ts->indirect_base = 1;
         s->nb_indirects += (TCG_TARGET_REG_BITS == 32 && type == TCG_TYPE_I64
                             ? 2 : 1);
         indirect_reg = 1;
+        break;
+    default:
+        g_assert_not_reached();
     }
 
     if (TCG_TARGET_REG_BITS == 32 && type == TCG_TYPE_I64) {
@@ -1386,6 +1399,11 @@ void tcg_temp_free_internal(TCGTemp *ts)
     TCGContext *s = tcg_ctx;
     int k, idx;
 
+    /* In order to simplify users of tcg_constant_*, silently ignore free. */
+    if (ts->kind == TEMP_CONST) {
+        return;
+    }
+
 #if defined(CONFIG_DEBUG_TCG)
     s->temps_in_use--;
     if (s->temps_in_use < 0) {
@@ -1402,6 +1420,60 @@ void tcg_temp_free_internal(TCGTemp *ts)
     set_bit(idx, s->free_temps[k].l);
 }
 
+TCGTemp *tcg_constant_internal(TCGType type, int64_t val)
+{
+    TCGContext *s = tcg_ctx;
+    GHashTable *h = s->const_table[type];
+    TCGTemp *ts;
+
+    if (h == NULL) {
+        h = g_hash_table_new(g_int64_hash, g_int64_equal);
+        s->const_table[type] = h;
+    }
+
+    ts = g_hash_table_lookup(h, &val);
+    if (ts == NULL) {
+        ts = tcg_temp_alloc(s);
+
+        if (TCG_TARGET_REG_BITS == 32 && type == TCG_TYPE_I64) {
+            TCGTemp *ts2 = tcg_temp_alloc(s);
+
+            ts->base_type = TCG_TYPE_I64;
+            ts->type = TCG_TYPE_I32;
+            ts->kind = TEMP_CONST;
+            ts->temp_allocated = 1;
+            /*
+             * Retain the full value of the 64-bit constant in the low
+             * part, so that the hash table works.  Actual uses will
+             * truncate the value to the low part.
+             */
+            ts->val = val;
+
+            tcg_debug_assert(ts2 == ts + 1);
+            ts2->base_type = TCG_TYPE_I64;
+            ts2->type = TCG_TYPE_I32;
+            ts2->kind = TEMP_CONST;
+            ts2->temp_allocated = 1;
+            ts2->val = val >> 32;
+        } else {
+            ts->base_type = type;
+            ts->type = type;
+            ts->kind = TEMP_CONST;
+            ts->temp_allocated = 1;
+            ts->val = val;
+        }
+        g_hash_table_insert(h, &ts->val, ts);
+    }
+
+    return ts;
+}
+
+TCGv_vec tcg_constant_vec(TCGType type, unsigned vece, int64_t val)
+{
+    val = dup_const(vece, val);
+    return temp_tcgv_vec(tcg_constant_internal(type, val));
+}
+
 TCGv_i32 tcg_const_i32(int32_t val)
 {
     TCGv_i32 t0;
@@ -1937,6 +2009,9 @@ static void tcg_reg_alloc_start(TCGContext *s)
         TCGTempVal val = TEMP_VAL_MEM;
 
         switch (ts->kind) {
+        case TEMP_CONST:
+            val = TEMP_VAL_CONST;
+            break;
         case TEMP_FIXED:
             val = TEMP_VAL_REG;
             break;
@@ -1973,6 +2048,26 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
     case TEMP_NORMAL:
         snprintf(buf, buf_size, "tmp%d", idx - s->nb_globals);
         break;
+    case TEMP_CONST:
+        switch (ts->type) {
+        case TCG_TYPE_I32:
+            snprintf(buf, buf_size, "$0x%x", (int32_t)ts->val);
+            break;
+#if TCG_TARGET_REG_BITS > 32
+        case TCG_TYPE_I64:
+            snprintf(buf, buf_size, "$0x%" PRIx64, ts->val);
+            break;
+#endif
+        case TCG_TYPE_V64:
+        case TCG_TYPE_V128:
+        case TCG_TYPE_V256:
+            snprintf(buf, buf_size, "v%d$0x%" PRIx64,
+                     64 << (ts->type - TCG_TYPE_V64), ts->val);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        break;
     }
     return buf;
 }
@@ -2574,6 +2669,7 @@ static void la_bb_end(TCGContext *s, int ng, int nt)
             state = TS_DEAD | TS_MEM;
             break;
         case TEMP_NORMAL:
+        case TEMP_CONST:
             state = TS_DEAD;
             break;
         default:
@@ -2608,14 +2704,24 @@ static void la_bb_sync(TCGContext *s, int ng, int nt)
     la_global_sync(s, ng);
 
     for (int i = ng; i < nt; ++i) {
-        if (s->temps[i].kind == TEMP_LOCAL) {
-            int state = s->temps[i].state;
-            s->temps[i].state = state | TS_MEM;
+        TCGTemp *ts = &s->temps[i];
+        int state;
+
+        switch (ts->kind) {
+        case TEMP_LOCAL:
+            state = ts->state;
+            ts->state = state | TS_MEM;
             if (state != TS_DEAD) {
                 continue;
             }
-        } else {
+            break;
+        case TEMP_NORMAL:
             s->temps[i].state = TS_DEAD;
+            break;
+        case TEMP_CONST:
+            continue;
+        default:
+            g_assert_not_reached();
         }
         la_reset_pref(&s->temps[i]);
     }
@@ -3254,15 +3360,28 @@ static void temp_load(TCGContext *, TCGTemp *, TCGRegSet, TCGRegSet, TCGRegSet);
    mark it free; otherwise mark it dead.  */
 static void temp_free_or_dead(TCGContext *s, TCGTemp *ts, int free_or_dead)
 {
-    if (temp_readonly(ts)) {
+    TCGTempVal new_type;
+
+    switch (ts->kind) {
+    case TEMP_FIXED:
         return;
+    case TEMP_GLOBAL:
+    case TEMP_LOCAL:
+        new_type = TEMP_VAL_MEM;
+        break;
+    case TEMP_NORMAL:
+        new_type = free_or_dead < 0 ? TEMP_VAL_MEM : TEMP_VAL_DEAD;
+        break;
+    case TEMP_CONST:
+        new_type = TEMP_VAL_CONST;
+        break;
+    default:
+        g_assert_not_reached();
     }
     if (ts->val_type == TEMP_VAL_REG) {
         s->reg_to_temp[ts->reg] = NULL;
     }
-    ts->val_type = (free_or_dead < 0
-                    || ts->kind != TEMP_NORMAL
-                    ? TEMP_VAL_MEM : TEMP_VAL_DEAD);
+    ts->val_type = new_type;
 }
 
 /* Mark a temporary as dead.  */
@@ -3278,10 +3397,7 @@ static inline void temp_dead(TCGContext *s, TCGTemp *ts)
 static void temp_sync(TCGContext *s, TCGTemp *ts, TCGRegSet allocated_regs,
                       TCGRegSet preferred_regs, int free_or_dead)
 {
-    if (temp_readonly(ts)) {
-        return;
-    }
-    if (!ts->mem_coherent) {
+    if (!temp_readonly(ts) && !ts->mem_coherent) {
         if (!ts->mem_allocated) {
             temp_allocate_frame(s, ts);
         }
@@ -3499,12 +3615,22 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
 
     for (i = s->nb_globals; i < s->nb_temps; i++) {
         TCGTemp *ts = &s->temps[i];
-        if (ts->kind == TEMP_LOCAL) {
+
+        switch (ts->kind) {
+        case TEMP_LOCAL:
             temp_save(s, ts, allocated_regs);
-        } else {
+            break;
+        case TEMP_NORMAL:
             /* The liveness analysis already ensures that temps are dead.
                Keep an tcg_debug_assert for safety. */
             tcg_debug_assert(ts->val_type == TEMP_VAL_DEAD);
+            break;
+        case TEMP_CONST:
+            /* Similarly, we should have freed any allocated register. */
+            tcg_debug_assert(ts->val_type == TEMP_VAL_CONST);
+            break;
+        default:
+            g_assert_not_reached();
         }
     }
 
@@ -3525,10 +3651,17 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
          * The liveness analysis already ensures that temps are dead.
          * Keep tcg_debug_asserts for safety.
          */
-        if (ts->kind == TEMP_LOCAL) {
+        switch (ts->kind) {
+        case TEMP_LOCAL:
             tcg_debug_assert(ts->val_type != TEMP_VAL_REG || ts->mem_coherent);
-        } else {
+            break;
+        case TEMP_NORMAL:
             tcg_debug_assert(ts->val_type == TEMP_VAL_DEAD);
+            break;
+        case TEMP_CONST:
+            break;
+        default:
+            g_assert_not_reached();
         }
     }
 }
@@ -3819,45 +3952,42 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         i_preferred_regs = o_preferred_regs = 0;
         if (arg_ct->ialias) {
             o_preferred_regs = op->output_pref[arg_ct->alias_index];
-            if (ts->kind == TEMP_FIXED) {
-                /* if fixed register, we must allocate a new register
-                   if the alias is not the same register */
-                if (arg != op->args[arg_ct->alias_index]) {
-                    goto allocate_in_reg;
-                }
-            } else {
-                /* if the input is aliased to an output and if it is
-                   not dead after the instruction, we must allocate
-                   a new register and move it */
-                if (!IS_DEAD_ARG(i)) {
-                    goto allocate_in_reg;
-                }
 
-                /* check if the current register has already been allocated
-                   for another input aliased to an output */
-                if (ts->val_type == TEMP_VAL_REG) {
-                    int k2, i2;
-                    reg = ts->reg;
-                    for (k2 = 0 ; k2 < k ; k2++) {
-                        i2 = def->args_ct[nb_oargs + k2].sort_index;
-                        if (def->args_ct[i2].ialias && reg == new_args[i2]) {
-                            goto allocate_in_reg;
-                        }
+            /*
+             * If the input is readonly, then it cannot also be an
+             * output and aliased to itself.  If the input is not
+             * dead after the instruction, we must allocate a new
+             * register and move it.
+             */
+            if (temp_readonly(ts) || !IS_DEAD_ARG(i)) {
+                goto allocate_in_reg;
+            }
+
+            /*
+             * Check if the current register has already been allocated
+             * for another input aliased to an output.
+             */
+            if (ts->val_type == TEMP_VAL_REG) {
+                reg = ts->reg;
+                for (int k2 = 0; k2 < k; k2++) {
+                    int i2 = def->args_ct[nb_oargs + k2].sort_index;
+                    if (def->args_ct[i2].ialias && reg == new_args[i2]) {
+                        goto allocate_in_reg;
                     }
                 }
-                i_preferred_regs = o_preferred_regs;
             }
+            i_preferred_regs = o_preferred_regs;
         }
 
         temp_load(s, ts, arg_ct->regs, i_allocated_regs, i_preferred_regs);
         reg = ts->reg;
 
-        if (tcg_regset_test_reg(arg_ct->regs, reg)) {
-            /* nothing to do : the constraint is satisfied */
-        } else {
-        allocate_in_reg:
-            /* allocate a new register matching the constraint 
-               and move the temporary register into it */
+        if (!tcg_regset_test_reg(arg_ct->regs, reg)) {
+ allocate_in_reg:
+            /*
+             * Allocate a new register matching the constraint
+             * and move the temporary register into it.
+             */
             temp_load(s, ts, tcg_target_available_regs[ts->type],
                       i_allocated_regs, 0);
             reg = tcg_reg_alloc(s, arg_ct->regs, i_allocated_regs,
-- 
2.25.1


