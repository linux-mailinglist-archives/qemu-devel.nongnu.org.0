Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799B21CB2B3
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 17:20:48 +0200 (CEST)
Received: from localhost ([::1]:39186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX4nv-0008Lu-D9
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 11:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX4lA-0005gL-FI
 for qemu-devel@nongnu.org; Fri, 08 May 2020 11:17:56 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:42609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX4l8-0002po-Uk
 for qemu-devel@nongnu.org; Fri, 08 May 2020 11:17:56 -0400
Received: by mail-pf1-x441.google.com with SMTP id f7so1069859pfa.9
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q2Hu6R+yXoo2zdjGVfH6/b6E3wPdHyA+Gme+a50XUmw=;
 b=yNDVhxW0CMRKMlY/6thoPnO6u+7+LuIF8JUHGhKte78QxhrU0Lv7Ci5yoUmUbM+MxR
 pjN+ZVj/XCI/J9m4xCv3BDdSIBc3fDngUfvNrDBNpn6RXcLYM4RNH4LI77QqcJryQ7oH
 GxU0uz3q9HGGS97ZVK6egfy6qVgZZSPbGWhetzi6aC4rGB3d4hYCGFzfQmR/gOBjC85d
 bE1hubp9Y4o5a8Tw0cmeH0vSgRDi/vP/uXG6taUBXjQupowFEcg/MwcCX5OFPVPyOene
 EoskflGcAWXDkcmZMe4+iVxpsYPU0X6e5MQjI6OKwX5Av19fzjSDSVooaqylN1uoE7L8
 je4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q2Hu6R+yXoo2zdjGVfH6/b6E3wPdHyA+Gme+a50XUmw=;
 b=e+niqlJgsYH53P7xSxztv+4lzU5c/rI7kFo4L5tSdcCGDFoq6Vav2SNpeGEXdHnnzD
 fPBYPq258vDUSWsMsCKV8yiAhdyYlGIpxR1Gn4c5l9S9LTnrO+QroGHz5oe0KP2xphrz
 KqtwoLlC167G2r8qpbSDOruDTiRwGPhIq66MvXqosV/oSDMDObfDEBCVVys1VZ/9FXyU
 0jr7B2kPtagYqTOA5E1Ro1h/HSxBnRpObnmMlc/pPw8J+DGVHp3JsYD6+7plAcp6VcRM
 XlKYpXyTgNmsB04r6Xcz2NxVV70wK65wnoO/t8VqWLNn9WUA/00+KP9Kgr+xSPHV2xI4
 Buew==
X-Gm-Message-State: AGi0PuYBe15AUgZkdFoBX3WqNU7w3M+VjCTtQ6EaGH7K+INa0/3LUZnT
 ToxfRlH+80gAerRJI6uIWi+QOb+b1/E=
X-Google-Smtp-Source: APiQypLhOx16kDQnfs9qaa0vPA1f96jnWDkf6UfNM9FeYstV1F6w3C6nD81kYWhIBnjJ8CQzI5m6QQ==
X-Received: by 2002:a63:1160:: with SMTP id 32mr2543513pgr.441.1588951072772; 
 Fri, 08 May 2020 08:17:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id b5sm2125933pfb.190.2020.05.08.08.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 08:17:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/19] tcg: Introduce TYPE_CONST temporaries
Date: Fri,  8 May 2020 08:17:31 -0700
Message-Id: <20200508151747.6166-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200508151747.6166-1-richard.henderson@linaro.org>
References: <20200508151747.6166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These will hold a single constant for the duration of the TB.
They are hashed, so that each value has one temp across the TB.

Not used yet, this is all infrastructure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |  27 +++++++-
 tcg/optimize.c    |  13 +++-
 tcg/tcg-op-vec.c  |  17 +++++
 tcg/tcg.c         | 170 ++++++++++++++++++++++++++++++++++------------
 4 files changed, 182 insertions(+), 45 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 0d09ea7822..57d6b0216c 100644
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
@@ -667,6 +669,7 @@ struct TCGContext {
     QSIMPLEQ_HEAD(, TCGOp) plugin_ops;
 #endif
 
+    GHashTable *const_table[TCG_TYPE_COUNT];
     TCGTempSet free_temps[TCG_TYPE_COUNT * 2];
     TCGTemp temps[TCG_MAX_TEMPS]; /* globals first, temps after */
 
@@ -683,7 +686,7 @@ struct TCGContext {
 
 static inline bool temp_readonly(TCGTemp *ts)
 {
-    return ts->kind == TEMP_FIXED;
+    return ts->kind >= TEMP_FIXED;
 }
 
 extern TCGContext tcg_init_ctx;
@@ -1041,6 +1044,7 @@ TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *op, TCGOpcode opc);
 
 void tcg_optimize(TCGContext *s);
 
+/* Allocate a new temporary and initialize it with a constant. */
 TCGv_i32 tcg_const_i32(int32_t val);
 TCGv_i64 tcg_const_i64(int64_t val);
 TCGv_i32 tcg_const_local_i32(int32_t val);
@@ -1050,6 +1054,27 @@ TCGv_vec tcg_const_ones_vec(TCGType);
 TCGv_vec tcg_const_zeros_vec_matching(TCGv_vec);
 TCGv_vec tcg_const_ones_vec_matching(TCGv_vec);
 
+/*
+ * Locate or create a read-only temporary that is a constant.
+ * This kind of temporary need not and should not be freed.
+ */
+TCGTemp *tcg_constant_internal(TCGType type, tcg_target_long val);
+
+static inline TCGv_i32 tcg_constant_i32(int32_t val)
+{
+    return temp_tcgv_i32(tcg_constant_internal(TCG_TYPE_I32, val));
+}
+
+static inline TCGv_i64 tcg_constant_i64(int64_t val)
+{
+    if (TCG_TARGET_REG_BITS == 32) {
+        qemu_build_not_reached();
+    }
+    return temp_tcgv_i64(tcg_constant_internal(TCG_TYPE_I64, val));
+}
+
+TCGv_vec tcg_constant_vec(TCGType type, unsigned vece, int64_t val);
+
 #if UINTPTR_MAX == UINT32_MAX
 # define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i32((intptr_t)(x)))
 # define tcg_const_local_ptr(x)  ((TCGv_ptr)tcg_const_local_i32((intptr_t)(x)))
diff --git a/tcg/optimize.c b/tcg/optimize.c
index afb4a9a5a9..8f3bd99ff4 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -99,8 +99,17 @@ static void init_ts_info(struct tcg_temp_info *infos,
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
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index f784517d84..43101defe4 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -209,6 +209,23 @@ static void vec_gen_op3(TCGOpcode opc, unsigned vece,
     vec_gen_3(opc, type, vece, temp_arg(rt), temp_arg(at), temp_arg(bt));
 }
 
+TCGv_vec tcg_constant_vec(TCGType type, unsigned vece, int64_t val)
+{
+    val = dup_const(vece, val);
+
+    /*
+     * For MO_64 constants that can't be represented in tcg_target_long,
+     * we must use INDEX_op_dup2_vec, which requires a non-const temporary.
+     */
+    if (TCG_TARGET_REG_BITS == 32 &&
+        val != deposit64(val, 32, 32, val) &&
+        val != (uint64_t)(int32_t)val) {
+        g_assert_not_reached();
+    }
+
+    return temp_tcgv_vec(tcg_constant_internal(type, val));
+}
+
 void tcg_gen_mov_vec(TCGv_vec r, TCGv_vec a)
 {
     if (r != a) {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index a529166026..94f7898317 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1127,6 +1127,7 @@ void tcg_func_start(TCGContext *s)
 
     /* No temps have been previously allocated for size or locality.  */
     memset(s->free_temps, 0, sizeof(s->free_temps));
+    memset(s->const_table, 0, sizeof(s->const_table));
 
     s->nb_ops = 0;
     s->nb_labels = 0;
@@ -1199,13 +1200,19 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
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
@@ -1346,6 +1353,37 @@ void tcg_temp_free_internal(TCGTemp *ts)
     set_bit(idx, s->free_temps[k].l);
 }
 
+TCGTemp *tcg_constant_internal(TCGType type, tcg_target_long val)
+{
+    TCGContext *s = tcg_ctx;
+    GHashTable *h = s->const_table[type];
+    TCGTemp *ts;
+
+    if (h == NULL) {
+        if (sizeof(tcg_target_long) == sizeof(gint64)) {
+            h = g_hash_table_new(g_int64_hash, g_int64_equal);
+        } else if (sizeof(tcg_target_long) == sizeof(gint)) {
+            h = g_hash_table_new(g_int_hash, g_int_equal);
+        } else {
+            qemu_build_not_reached();
+        }
+        s->const_table[type] = h;
+    }
+
+    ts = g_hash_table_lookup(h, &val);
+    if (ts == NULL) {
+        ts = tcg_temp_alloc(s);
+        ts->base_type = type;
+        ts->type = type;
+        ts->kind = TEMP_CONST;
+        ts->temp_allocated = 1;
+        ts->val = val;
+        g_hash_table_insert(h, &ts->val, ts);
+    }
+
+    return ts;
+}
+
 TCGv_i32 tcg_const_i32(int32_t val)
 {
     TCGv_i32 t0;
@@ -1878,6 +1916,9 @@ static void tcg_reg_alloc_start(TCGContext *s)
         TCGTempVal val = TEMP_VAL_MEM;
 
         switch (ts->kind) {
+        case TEMP_CONST:
+            val = TEMP_VAL_CONST;
+            break;
         case TEMP_FIXED:
             val = TEMP_VAL_REG;
             break;
@@ -1914,6 +1955,26 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
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
+            snprintf(buf, buf_size, "$0x%" TCG_PRIlx, ts->val);
+            break;
+#endif
+        case TCG_TYPE_V64:
+        case TCG_TYPE_V128:
+        case TCG_TYPE_V256:
+            snprintf(buf, buf_size, "v%d$0x%" TCG_PRIlx,
+                     64 << (ts->type - TCG_TYPE_V64), ts->val);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        break;
     }
     return buf;
 }
@@ -2520,6 +2581,7 @@ static void la_bb_end(TCGContext *s, int ng, int nt)
             state = TS_DEAD | TS_MEM;
             break;
         case TEMP_NORMAL:
+        case TEMP_CONST:
             state = TS_DEAD;
             break;
         default:
@@ -3173,15 +3235,28 @@ static void temp_load(TCGContext *, TCGTemp *, TCGRegSet, TCGRegSet, TCGRegSet);
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
@@ -3197,10 +3272,7 @@ static inline void temp_dead(TCGContext *s, TCGTemp *ts)
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
@@ -3393,12 +3465,22 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
 
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
 
@@ -3691,46 +3773,43 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         i_preferred_regs = o_preferred_regs = 0;
         if (arg_ct->ct & TCG_CT_IALIAS) {
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
-                        i2 = def->sorted_args[nb_oargs + k2];
-                        if ((def->args_ct[i2].ct & TCG_CT_IALIAS) &&
-                            reg == new_args[i2]) {
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
+                    int i2 = def->sorted_args[nb_oargs + k2];
+                    if ((def->args_ct[i2].ct & TCG_CT_IALIAS) &&
+                        reg == new_args[i2]) {
+                        goto allocate_in_reg;
                     }
                 }
-                i_preferred_regs = o_preferred_regs;
             }
+            i_preferred_regs = o_preferred_regs;
         }
 
         temp_load(s, ts, arg_ct->u.regs, i_allocated_regs, i_preferred_regs);
         reg = ts->reg;
 
-        if (tcg_regset_test_reg(arg_ct->u.regs, reg)) {
-            /* nothing to do : the constraint is satisfied */
-        } else {
-        allocate_in_reg:
-            /* allocate a new register matching the constraint 
-               and move the temporary register into it */
+        if (!tcg_regset_test_reg(arg_ct->u.regs, reg)) {
+ allocate_in_reg:
+            /*
+             * Allocate a new register matching the constraint
+             * and move the temporary register into it.
+             */
             temp_load(s, ts, tcg_target_available_regs[ts->type],
                       i_allocated_regs, 0);
             reg = tcg_reg_alloc(s, arg_ct->u.regs, i_allocated_regs,
@@ -4189,6 +4268,13 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
     }
 #endif
 
+    for (i = 0; i < TCG_TYPE_COUNT; ++i) {
+        if (s->const_table[i]) {
+            g_hash_table_destroy(s->const_table[i]);
+            s->const_table[i] = NULL;
+        }
+    }
+
     tcg_reg_alloc_start(s);
 
     s->code_buf = tb->tc.ptr;
-- 
2.20.1


