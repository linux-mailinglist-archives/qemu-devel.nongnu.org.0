Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECC11B3473
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 03:23:18 +0200 (CEST)
Received: from localhost ([::1]:38705 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jR46e-0001xa-Nx
	for lists+qemu-devel@lfdr.de; Tue, 21 Apr 2020 21:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34684)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR41H-0001SE-QS
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 21:17:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR41G-0001j1-I5
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 21:17:43 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:44989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR41F-0001cy-2A
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 21:17:42 -0400
Received: by mail-pg1-x542.google.com with SMTP id q18so241763pgm.11
 for <qemu-devel@nongnu.org>; Tue, 21 Apr 2020 18:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3qRzDIJe35AYacmzNyFLQ1yNiwezF16i9LevP5JOC1c=;
 b=DTxIwE6doGwQD8ksteMLLaJ7ptQJp7zywH3BziSMYJg77LVHftsiHtqxVT6SctEtyr
 DN1AmlUYZ3beq9+0ICM9I3BLrgT7CUq4YuUX8I8eLIQMS9iyt+3ngro1RG5D7CBkuKal
 h+JxCMK/lM381ALLMV5L56yO1hssBsAnhQEXizPTTixSx0UXaYFnng3IVMuhzfENWeYL
 XgDHjW/XUeFxYHcJ0cCSRbhemG2AYYAL8HOlqXfW7rpvaQOJyPVu8S4zi2/vKqj784RJ
 ldH3h2GdFSZuJ96YXzKnxiovqDIZGXJBDJPz74IGehA8ELbJF/EwNoBthXndifpblm5/
 cR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3qRzDIJe35AYacmzNyFLQ1yNiwezF16i9LevP5JOC1c=;
 b=MIZylJjCYijhilWTV76T+lD/wpexmI9efz6x8iY4FdpMLww+wz1QAZ1GynGZRC1L2S
 3Qh4KiO2u02WGoL3QErK8zq+mMjiE4DUGOvi7Z+qo+s7Wyj68obiBlaL3sAw5ZArEyIl
 rHTG7db6gh0WNvvqAAIXo74s1DXeX5tuW1t2cBZHI6lTbe8Gu/yUZjdrEq2HsEq1nosX
 IePS2TWev8dobRO23QziRFNA/VIe7tyfhJfnT8wGr/ddto5uxV9fMHs542JEs7BkXiuM
 zSCegRaG5TGQoNq612FGuGDEAgPBGZbuK7jc/5sn/+QPyZ3INtHS2FUbScGJNZQHBRoa
 Ik1w==
X-Gm-Message-State: AGi0PuZNQYBRNcNx1ydPBm7W2sF5TlzMSE37U6KcpenMHGfDuYKJJjK1
 RK+aQ0ecx78LmWY1v6UXzOwUZgV5I3A=
X-Google-Smtp-Source: APiQypKSL1OPVcWaWmKNy1DpE48Jkkgl2N9z6vr+3lC4qsCYgWLiQjHZIpmgpg0J/0ssuTOY2X/BkQ==
X-Received: by 2002:a63:6d87:: with SMTP id i129mr24204115pgc.54.1587518258812; 
 Tue, 21 Apr 2020 18:17:38 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id m4sm3673561pfm.26.2020.04.21.18.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 18:17:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/36] tcg: Introduce TYPE_CONST temporaries
Date: Tue, 21 Apr 2020 18:16:57 -0700
Message-Id: <20200422011722.13287-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200422011722.13287-1-richard.henderson@linaro.org>
References: <20200422011722.13287-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::542
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
 include/tcg/tcg.h |  27 ++++++++++-
 tcg/optimize.c    |  40 ++++++++++-------
 tcg/tcg-op-vec.c  |  17 +++++++
 tcg/tcg.c         | 111 +++++++++++++++++++++++++++++++++++++++++-----
 4 files changed, 166 insertions(+), 29 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 27e1b509a6..f72530dfda 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -489,6 +489,8 @@ typedef enum TCGTempKind {
     TEMP_GLOBAL,
     /* Temp is in a fixed register. */
     TEMP_FIXED,
+    /* Temp is a fixed constant. */
+    TEMP_CONST,
 } TCGTempKind;
 
 typedef struct TCGTemp {
@@ -664,6 +666,7 @@ struct TCGContext {
     QSIMPLEQ_HEAD(, TCGOp) plugin_ops;
 #endif
 
+    GHashTable *const_table[TCG_TYPE_COUNT];
     TCGTempSet free_temps[TCG_TYPE_COUNT * 2];
     TCGTemp temps[TCG_MAX_TEMPS]; /* globals first, temps after */
 
@@ -680,7 +683,7 @@ struct TCGContext {
 
 static inline bool temp_readonly(TCGTemp *ts)
 {
-    return ts->kind == TEMP_FIXED;
+    return ts->kind >= TEMP_FIXED;
 }
 
 extern TCGContext tcg_init_ctx;
@@ -1038,6 +1041,7 @@ TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *op, TCGOpcode opc);
 
 void tcg_optimize(TCGContext *s);
 
+/* Allocate a new temporary and initialize it with a constant. */
 TCGv_i32 tcg_const_i32(int32_t val);
 TCGv_i64 tcg_const_i64(int64_t val);
 TCGv_i32 tcg_const_local_i32(int32_t val);
@@ -1047,6 +1051,27 @@ TCGv_vec tcg_const_ones_vec(TCGType);
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
index afb4a9a5a9..effb47eefd 100644
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
@@ -113,31 +122,28 @@ static void init_arg_info(struct tcg_temp_info *infos,
 
 static TCGTemp *find_better_copy(TCGContext *s, TCGTemp *ts)
 {
-    TCGTemp *i;
+    TCGTemp *i, *g, *l;
 
-    /* If this is already a global, we can't do better. */
-    if (ts->kind >= TEMP_GLOBAL) {
+    /* If this is already readonly, we can't do better. */
+    if (temp_readonly(ts)) {
         return ts;
     }
 
-    /* Search for a global first. */
+    g = l = NULL;
     for (i = ts_info(ts)->next_copy; i != ts; i = ts_info(i)->next_copy) {
-        if (i->kind >= TEMP_GLOBAL) {
+        if (temp_readonly(i)) {
             return i;
-        }
-    }
-
-    /* If it is a temp, search for a temp local. */
-    if (ts->kind == TEMP_NORMAL) {
-        for (i = ts_info(ts)->next_copy; i != ts; i = ts_info(i)->next_copy) {
-            if (i->kind >= TEMP_LOCAL) {
-                return i;
+        } else if (i->kind > ts->kind) {
+            if (i->kind == TEMP_GLOBAL) {
+                g = i;
+            } else if (i->kind == TEMP_LOCAL) {
+                l = i;
             }
         }
     }
 
-    /* Failure to find a better representation, return the same temp. */
-    return ts;
+    /* If we didn't find a better representation, return the same temp. */
+    return g ? g : l ? l : ts;
 }
 
 static bool ts_are_copies(TCGTemp *ts1, TCGTemp *ts2)
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index b6937e8d64..f3927089a7 100644
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
index 92b3767097..59beb2bf29 100644
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
@@ -1871,6 +1909,9 @@ static void tcg_reg_alloc_start(TCGContext *s)
         TCGTempVal val = TEMP_VAL_MEM;
 
         switch (ts->kind) {
+        case TEMP_CONST:
+            val = TEMP_VAL_CONST;
+            break;
         case TEMP_FIXED:
             val = TEMP_VAL_REG;
             break;
@@ -1907,6 +1948,26 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
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
@@ -2513,6 +2574,7 @@ static void la_bb_end(TCGContext *s, int ng, int nt)
             state = TS_DEAD | TS_MEM;
             break;
         case TEMP_NORMAL:
+        case TEMP_CONST:
             state = TS_DEAD;
             break;
         default:
@@ -3132,15 +3194,28 @@ static void temp_load(TCGContext *, TCGTemp *, TCGRegSet, TCGRegSet, TCGRegSet);
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
@@ -3156,10 +3231,7 @@ static inline void temp_dead(TCGContext *s, TCGTemp *ts)
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
@@ -3352,12 +3424,22 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
 
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
 
@@ -4148,6 +4230,13 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
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


