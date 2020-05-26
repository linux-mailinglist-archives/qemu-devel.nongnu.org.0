Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B994E1CB732
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 20:29:38 +0200 (CEST)
Received: from localhost ([::1]:51768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX7kf-00038v-P0
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 14:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX7hY-0006c0-3i
 for qemu-devel@nongnu.org; Fri, 08 May 2020 14:26:24 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:34849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX7hW-000591-I1
 for qemu-devel@nongnu.org; Fri, 08 May 2020 14:26:23 -0400
Received: by mail-pj1-x1041.google.com with SMTP id ms17so4658468pjb.0
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 11:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BRsVpU1z9zuL1lkxFwdPAnMCWCYTUg87AJTyrr2g3xk=;
 b=c1zx+Ar7QhT+kNsr0npCdiDLo5tWbgjiuAPSJBRjcwxeiLqjxoCrt3290Wbz5aZii5
 t4Rt9wpLNiZ7OuRque0dfxuLo8YdVZ+K00R7OZTK0ha1AtMLWjP4FZIMU3+e57wiutkq
 ZuX7OxNhp9NKM+wD/wxUchYgXiVyPptMBJkZoi4OAF2faKPywjnN67kZsfYC5sB4tpr4
 m+dEqIrPGG4/DKPTSMP0BfP9Mah75wr0Gsg1CWs9srso5MxJA7aann9pwBVe5KaylwWT
 9HTlU5OxX5TAKQrO4LD7awAUdj9S52OAMQab3QlbRx/0R6CRsfI5krVojTw96MG0knh1
 /b+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BRsVpU1z9zuL1lkxFwdPAnMCWCYTUg87AJTyrr2g3xk=;
 b=fP1asfZB6sJttUpCTlRH+r/qemoz4MyyXNVnOVXGRnNGm5wOP89lOskKX8laJl0+Ri
 A6Lwsodn/HLBsG4/bFCW1i1D+z/RwPZGtdNjMrte1+DJms4ZMp/GvmHtFMoSJIF+kFUs
 r9Bhx67IPSm2Onil/nQiLPfRkDnrSzv+Pj/aPpVZ1jrym6igHeWtgj2injqNVDtikV3u
 4Ma/5Tm0BHDKlUsjmD5rgkzA0VcHs3cbIZlxnODvEXKt6mYSZvxfoTdm8vGEO4NB7E9y
 p/3iPrm/8+d68ay2rouraSKkOMA+XW/3QTCQSvGFTJn2hPuvnQKHo5D2BqmRw0GRYYMD
 LGmA==
X-Gm-Message-State: AGi0PuZEIkmvV5NLDOPTNIFvSLKC3cNEqjETi1lOsB/LZRDeG7ZpSgzc
 Bz3D3YT97c1xtk1dgcyUhc9mKPxY2qk=
X-Google-Smtp-Source: APiQypLxHFFMNDTo4bKQ685z14QV/TjnB1hufa/U4dU9GCh7OKzXgyhLCRBY47iutNYu3OkMqbQ0+g==
X-Received: by 2002:a17:902:8ec5:: with SMTP id
 x5mr3680947plo.149.1588962379701; 
 Fri, 08 May 2020 11:26:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id u9sm2421775pfn.197.2020.05.08.11.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 11:26:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/19] tcg: Consolidate 3 bits into enum TCGTempKind
Date: Fri,  8 May 2020 11:25:58 -0700
Message-Id: <20200508182616.18318-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200508182616.18318-1-richard.henderson@linaro.org>
References: <20200508182616.18318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
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

The temp_fixed, temp_global, temp_local bits are all related.
Combine them into a single enumeration.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |  20 +++++---
 tcg/optimize.c    |   8 +--
 tcg/tcg.c         | 122 ++++++++++++++++++++++++++++------------------
 3 files changed, 90 insertions(+), 60 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 380014ed80..06486635e6 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -483,23 +483,27 @@ typedef enum TCGTempVal {
     TEMP_VAL_CONST,
 } TCGTempVal;
 
+typedef enum TCGTempKind {
+    /* Temp is dead at the end of all basic blocks. */
+    TEMP_NORMAL,
+    /* Temp is saved across basic blocks but dead at the end of TBs. */
+    TEMP_LOCAL,
+    /* Temp is saved across both basic blocks and translation blocks. */
+    TEMP_GLOBAL,
+    /* Temp is in a fixed register. */
+    TEMP_FIXED,
+} TCGTempKind;
+
 typedef struct TCGTemp {
     TCGReg reg:8;
     TCGTempVal val_type:8;
     TCGType base_type:8;
     TCGType type:8;
-    unsigned int fixed_reg:1;
+    TCGTempKind kind:3;
     unsigned int indirect_reg:1;
     unsigned int indirect_base:1;
     unsigned int mem_coherent:1;
     unsigned int mem_allocated:1;
-    /* If true, the temp is saved across both basic blocks and
-       translation blocks.  */
-    unsigned int temp_global:1;
-    /* If true, the temp is saved across basic blocks but dead
-       at the end of translation blocks.  If false, the temp is
-       dead at the end of basic blocks.  */
-    unsigned int temp_local:1;
     unsigned int temp_allocated:1;
 
     tcg_target_long val;
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 53aa8e5329..afb4a9a5a9 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -116,21 +116,21 @@ static TCGTemp *find_better_copy(TCGContext *s, TCGTemp *ts)
     TCGTemp *i;
 
     /* If this is already a global, we can't do better. */
-    if (ts->temp_global) {
+    if (ts->kind >= TEMP_GLOBAL) {
         return ts;
     }
 
     /* Search for a global first. */
     for (i = ts_info(ts)->next_copy; i != ts; i = ts_info(i)->next_copy) {
-        if (i->temp_global) {
+        if (i->kind >= TEMP_GLOBAL) {
             return i;
         }
     }
 
     /* If it is a temp, search for a temp local. */
-    if (!ts->temp_local) {
+    if (ts->kind == TEMP_NORMAL) {
         for (i = ts_info(ts)->next_copy; i != ts; i = ts_info(i)->next_copy) {
-            if (ts->temp_local) {
+            if (i->kind >= TEMP_LOCAL) {
                 return i;
             }
         }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 216a6963b3..2c022c9621 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1155,7 +1155,7 @@ static inline TCGTemp *tcg_global_alloc(TCGContext *s)
     tcg_debug_assert(s->nb_globals == s->nb_temps);
     s->nb_globals++;
     ts = tcg_temp_alloc(s);
-    ts->temp_global = 1;
+    ts->kind = TEMP_GLOBAL;
 
     return ts;
 }
@@ -1172,7 +1172,7 @@ static TCGTemp *tcg_global_reg_new_internal(TCGContext *s, TCGType type,
     ts = tcg_global_alloc(s);
     ts->base_type = type;
     ts->type = type;
-    ts->fixed_reg = 1;
+    ts->kind = TEMP_FIXED;
     ts->reg = reg;
     ts->name = name;
     tcg_regset_set_reg(s->reserved_regs, reg);
@@ -1199,7 +1199,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
     bigendian = 1;
 #endif
 
-    if (!base_ts->fixed_reg) {
+    if (base_ts->kind != TEMP_FIXED) {
         /* We do not support double-indirect registers.  */
         tcg_debug_assert(!base_ts->indirect_reg);
         base_ts->indirect_base = 1;
@@ -1247,6 +1247,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
 TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
 {
     TCGContext *s = tcg_ctx;
+    TCGTempKind kind = temp_local ? TEMP_LOCAL : TEMP_NORMAL;
     TCGTemp *ts;
     int idx, k;
 
@@ -1259,7 +1260,7 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
         ts = &s->temps[idx];
         ts->temp_allocated = 1;
         tcg_debug_assert(ts->base_type == type);
-        tcg_debug_assert(ts->temp_local == temp_local);
+        tcg_debug_assert(ts->kind == kind);
     } else {
         ts = tcg_temp_alloc(s);
         if (TCG_TARGET_REG_BITS == 32 && type == TCG_TYPE_I64) {
@@ -1268,18 +1269,18 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
             ts->base_type = type;
             ts->type = TCG_TYPE_I32;
             ts->temp_allocated = 1;
-            ts->temp_local = temp_local;
+            ts->kind = kind;
 
             tcg_debug_assert(ts2 == ts + 1);
             ts2->base_type = TCG_TYPE_I64;
             ts2->type = TCG_TYPE_I32;
             ts2->temp_allocated = 1;
-            ts2->temp_local = temp_local;
+            ts2->kind = kind;
         } else {
             ts->base_type = type;
             ts->type = type;
             ts->temp_allocated = 1;
-            ts->temp_local = temp_local;
+            ts->kind = kind;
         }
     }
 
@@ -1336,12 +1337,12 @@ void tcg_temp_free_internal(TCGTemp *ts)
     }
 #endif
 
-    tcg_debug_assert(ts->temp_global == 0);
+    tcg_debug_assert(ts->kind < TEMP_GLOBAL);
     tcg_debug_assert(ts->temp_allocated != 0);
     ts->temp_allocated = 0;
 
     idx = temp_idx(ts);
-    k = ts->base_type + (ts->temp_local ? TCG_TYPE_COUNT : 0);
+    k = ts->base_type + (ts->kind == TEMP_NORMAL ? 0 : TCG_TYPE_COUNT);
     set_bit(idx, s->free_temps[k].l);
 }
 
@@ -1871,17 +1872,27 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 static void tcg_reg_alloc_start(TCGContext *s)
 {
     int i, n;
-    TCGTemp *ts;
 
-    for (i = 0, n = s->nb_globals; i < n; i++) {
-        ts = &s->temps[i];
-        ts->val_type = (ts->fixed_reg ? TEMP_VAL_REG : TEMP_VAL_MEM);
-    }
-    for (n = s->nb_temps; i < n; i++) {
-        ts = &s->temps[i];
-        ts->val_type = (ts->temp_local ? TEMP_VAL_MEM : TEMP_VAL_DEAD);
-        ts->mem_allocated = 0;
-        ts->fixed_reg = 0;
+    for (i = 0, n = s->nb_temps; i < n; i++) {
+        TCGTemp *ts = &s->temps[i];
+        TCGTempVal val = TEMP_VAL_MEM;
+
+        switch (ts->kind) {
+        case TEMP_FIXED:
+            val = TEMP_VAL_REG;
+            break;
+        case TEMP_GLOBAL:
+            break;
+        case TEMP_NORMAL:
+            val = TEMP_VAL_DEAD;
+            /* fall through */
+        case TEMP_LOCAL:
+            ts->mem_allocated = 0;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        ts->val_type = val;
     }
 
     memset(s->reg_to_temp, 0, sizeof(s->reg_to_temp));
@@ -1892,12 +1903,17 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
 {
     int idx = temp_idx(ts);
 
-    if (ts->temp_global) {
+    switch (ts->kind) {
+    case TEMP_FIXED:
+    case TEMP_GLOBAL:
         pstrcpy(buf, buf_size, ts->name);
-    } else if (ts->temp_local) {
+        break;
+    case TEMP_LOCAL:
         snprintf(buf, buf_size, "loc%d", idx - s->nb_globals);
-    } else {
+        break;
+    case TEMP_NORMAL:
         snprintf(buf, buf_size, "tmp%d", idx - s->nb_globals);
+        break;
     }
     return buf;
 }
@@ -2493,15 +2509,24 @@ static void la_bb_end(TCGContext *s, int ng, int nt)
 {
     int i;
 
-    for (i = 0; i < ng; ++i) {
-        s->temps[i].state = TS_DEAD | TS_MEM;
-        la_reset_pref(&s->temps[i]);
-    }
-    for (i = ng; i < nt; ++i) {
-        s->temps[i].state = (s->temps[i].temp_local
-                             ? TS_DEAD | TS_MEM
-                             : TS_DEAD);
-        la_reset_pref(&s->temps[i]);
+    for (i = 0; i < nt; ++i) {
+        TCGTemp *ts = &s->temps[i];
+        int state;
+
+        switch (ts->kind) {
+        case TEMP_FIXED:
+        case TEMP_GLOBAL:
+        case TEMP_LOCAL:
+            state = TS_DEAD | TS_MEM;
+            break;
+        case TEMP_NORMAL:
+            state = TS_DEAD;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        ts->state = state;
+        la_reset_pref(ts);
     }
 }
 
@@ -3110,7 +3135,8 @@ static void check_regs(TCGContext *s)
     }
     for (k = 0; k < s->nb_temps; k++) {
         ts = &s->temps[k];
-        if (ts->val_type == TEMP_VAL_REG && !ts->fixed_reg
+        if (ts->val_type == TEMP_VAL_REG
+            && ts->kind != TEMP_FIXED
             && s->reg_to_temp[ts->reg] != ts) {
             printf("Inconsistency for temp %s:\n",
                    tcg_get_arg_str_ptr(s, buf, sizeof(buf), ts));
@@ -3147,15 +3173,14 @@ static void temp_load(TCGContext *, TCGTemp *, TCGRegSet, TCGRegSet, TCGRegSet);
    mark it free; otherwise mark it dead.  */
 static void temp_free_or_dead(TCGContext *s, TCGTemp *ts, int free_or_dead)
 {
-    if (ts->fixed_reg) {
+    if (ts->kind == TEMP_FIXED) {
         return;
     }
     if (ts->val_type == TEMP_VAL_REG) {
         s->reg_to_temp[ts->reg] = NULL;
     }
     ts->val_type = (free_or_dead < 0
-                    || ts->temp_local
-                    || ts->temp_global
+                    || ts->kind != TEMP_NORMAL
                     ? TEMP_VAL_MEM : TEMP_VAL_DEAD);
 }
 
@@ -3172,7 +3197,7 @@ static inline void temp_dead(TCGContext *s, TCGTemp *ts)
 static void temp_sync(TCGContext *s, TCGTemp *ts, TCGRegSet allocated_regs,
                       TCGRegSet preferred_regs, int free_or_dead)
 {
-    if (ts->fixed_reg) {
+    if (ts->kind == TEMP_FIXED) {
         return;
     }
     if (!ts->mem_coherent) {
@@ -3330,7 +3355,8 @@ static void temp_save(TCGContext *s, TCGTemp *ts, TCGRegSet allocated_regs)
 {
     /* The liveness analysis already ensures that globals are back
        in memory. Keep an tcg_debug_assert for safety. */
-    tcg_debug_assert(ts->val_type == TEMP_VAL_MEM || ts->fixed_reg);
+    tcg_debug_assert(ts->val_type == TEMP_VAL_MEM
+                     || ts->kind == TEMP_FIXED);
 }
 
 /* save globals to their canonical location and assume they can be
@@ -3355,7 +3381,7 @@ static void sync_globals(TCGContext *s, TCGRegSet allocated_regs)
     for (i = 0, n = s->nb_globals; i < n; i++) {
         TCGTemp *ts = &s->temps[i];
         tcg_debug_assert(ts->val_type != TEMP_VAL_REG
-                         || ts->fixed_reg
+                         || ts->kind == TEMP_FIXED
                          || ts->mem_coherent);
     }
 }
@@ -3368,7 +3394,7 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
 
     for (i = s->nb_globals; i < s->nb_temps; i++) {
         TCGTemp *ts = &s->temps[i];
-        if (ts->temp_local) {
+        if (ts->kind == TEMP_LOCAL) {
             temp_save(s, ts, allocated_regs);
         } else {
             /* The liveness analysis already ensures that temps are dead.
@@ -3388,7 +3414,7 @@ static void tcg_reg_alloc_do_movi(TCGContext *s, TCGTemp *ots,
                                   TCGRegSet preferred_regs)
 {
     /* ENV should not be modified.  */
-    tcg_debug_assert(!ots->fixed_reg);
+    tcg_debug_assert(ots->kind != TEMP_FIXED);
 
     /* The movi is not explicitly generated here.  */
     if (ots->val_type == TEMP_VAL_REG) {
@@ -3428,7 +3454,7 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
     ts = arg_temp(op->args[1]);
 
     /* ENV should not be modified.  */
-    tcg_debug_assert(!ots->fixed_reg);
+    tcg_debug_assert(ots->kind != TEMP_FIXED);
 
     /* Note that otype != itype for no-op truncation.  */
     otype = ots->type;
@@ -3467,7 +3493,7 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
         }
         temp_dead(s, ots);
     } else {
-        if (IS_DEAD_ARG(1) && !ts->fixed_reg) {
+        if (IS_DEAD_ARG(1) && ts->kind != TEMP_FIXED) {
             /* the mov can be suppressed */
             if (ots->val_type == TEMP_VAL_REG) {
                 s->reg_to_temp[ots->reg] = NULL;
@@ -3489,7 +3515,7 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
                  * Store the source register into the destination slot
                  * and leave the destination temp as TEMP_VAL_MEM.
                  */
-                assert(!ots->fixed_reg);
+                assert(ots->kind != TEMP_FIXED);
                 if (!ts->mem_allocated) {
                     temp_allocate_frame(s, ots);
                 }
@@ -3526,7 +3552,7 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
     its = arg_temp(op->args[1]);
 
     /* ENV should not be modified.  */
-    tcg_debug_assert(!ots->fixed_reg);
+    tcg_debug_assert(ots->kind != TEMP_FIXED);
 
     itype = its->type;
     vece = TCGOP_VECE(op);
@@ -3666,7 +3692,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         i_preferred_regs = o_preferred_regs = 0;
         if (arg_ct->ct & TCG_CT_IALIAS) {
             o_preferred_regs = op->output_pref[arg_ct->alias_index];
-            if (ts->fixed_reg) {
+            if (ts->kind == TEMP_FIXED) {
                 /* if fixed register, we must allocate a new register
                    if the alias is not the same register */
                 if (arg != op->args[arg_ct->alias_index]) {
@@ -3757,7 +3783,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
             ts = arg_temp(arg);
 
             /* ENV should not be modified.  */
-            tcg_debug_assert(!ts->fixed_reg);
+            tcg_debug_assert(ts->kind != TEMP_FIXED);
 
             if ((arg_ct->ct & TCG_CT_ALIAS)
                 && !const_args[arg_ct->alias_index]) {
@@ -3799,7 +3825,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         ts = arg_temp(op->args[i]);
 
         /* ENV should not be modified.  */
-        tcg_debug_assert(!ts->fixed_reg);
+        tcg_debug_assert(ts->kind != TEMP_FIXED);
 
         if (NEED_SYNC_ARG(i)) {
             temp_sync(s, ts, o_allocated_regs, 0, IS_DEAD_ARG(i));
@@ -3931,7 +3957,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         ts = arg_temp(arg);
 
         /* ENV should not be modified.  */
-        tcg_debug_assert(!ts->fixed_reg);
+        tcg_debug_assert(ts->kind != TEMP_FIXED);
 
         reg = tcg_target_call_oarg_regs[i];
         tcg_debug_assert(s->reg_to_temp[reg] == NULL);
-- 
2.20.1


