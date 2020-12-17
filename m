Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BFA2DD3A8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:05:36 +0100 (CET)
Received: from localhost ([::1]:47958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpuqV-0007Py-AI
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:05:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpue0-0003TP-3y
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:40 -0500
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e]:38747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudo-0004tB-4G
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:39 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id i18so6863696ooh.5
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vh2RnCqJKW0Iq3hPKx9Bhx7AqkcecpFuZuzmVLuxCys=;
 b=tS3CEdkon8NIiJepJL2rNAkGHaZL5zDbSMApw2Fe9YvTHI+LLhExfCtb/65XCzLuuB
 YuROhcV9hpyZSnTyN48h6TO5hSBuALMDfTMWUJL5Evj8ybovlk+IcOtmdv6UeTEXv57w
 +fejKMgquLHCLI8pSNRLK42XzcKfOo9AlXM5etJvh3u2e2VWyMNQpZRhCEHa+NHYvzpf
 DhauU+WHEeOXiRYvLApnKUit2uu5lSSGtiu+uwWiSHoL9NpVdqxb2DQCRHQRLgVyZMif
 K0iQ5gIkpTMZ3CesCjtFypL7nVe6VVhjcQwL9bobxDmWZNhbC41P9VH55cMbroaEhkYI
 6XjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vh2RnCqJKW0Iq3hPKx9Bhx7AqkcecpFuZuzmVLuxCys=;
 b=nAqRj2iLk2JoOJ6CDzWMKtJ49OnSM3tCb8u2b4zucTxL8DBBNqRCdFT+AcUf4Wthje
 wPoVflFvbWXFB8xo7vmGndz7hQ1ZGvWJcZ9xZEg9HsqpFd6jYOes5JCZ8tJZ84SaoroY
 WpGnNvflPIHpGlotyGmWZ3a3cOV1jGTB2L5wZkYg8UEaB5VHLJxUKLDRO3U9KshGKuFL
 mKF90hn4weidiRrNPlUmV41SujmPw65H1lfX0AlFLYZP/r/sVFX+2NRPEsOYk2GCN+Kg
 cKScbVm10mcx6u4B0+Gq7ad9rTsECtxNKc3oUn1bZ7z/HHr9DoE3XEt6YeQDeSFl/vAp
 nYGw==
X-Gm-Message-State: AOAM5311KQwJkJn22BGmOYic2ppvRRcmbX13oIe2JyBdynziTTu5EOys
 i3ZZKFQmzye+KqXV7IMXRETxeKORV0lVUdJh
X-Google-Smtp-Source: ABdhPJx6KMCtrtMHp7w9eFk/SOEqC6j3lQ9038RlmTay+rNhkajY5VDMr9Q7C+kC0FF2uSbACiOgTg==
X-Received: by 2002:a4a:6154:: with SMTP id u20mr23879492ooe.12.1608216740702; 
 Thu, 17 Dec 2020 06:52:20 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/23] tcg: Consolidate 3 bits into enum TCGTempKind
Date: Thu, 17 Dec 2020 08:51:55 -0600
Message-Id: <20201217145215.534637-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2e.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The temp_fixed, temp_global, temp_local bits are all related.
Combine them into a single enumeration.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |  20 +++++---
 tcg/optimize.c    |   8 +--
 tcg/tcg.c         | 126 ++++++++++++++++++++++++++++------------------
 3 files changed, 92 insertions(+), 62 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 8ff9dad4ef..30bd525d83 100644
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
index 220f4601d5..3cffd941bd 100644
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
index 2326e61b51..07a25e59b6 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1161,7 +1161,7 @@ static inline TCGTemp *tcg_global_alloc(TCGContext *s)
     tcg_debug_assert(s->nb_globals == s->nb_temps);
     s->nb_globals++;
     ts = tcg_temp_alloc(s);
-    ts->temp_global = 1;
+    ts->kind = TEMP_GLOBAL;
 
     return ts;
 }
@@ -1178,7 +1178,7 @@ static TCGTemp *tcg_global_reg_new_internal(TCGContext *s, TCGType type,
     ts = tcg_global_alloc(s);
     ts->base_type = type;
     ts->type = type;
-    ts->fixed_reg = 1;
+    ts->kind = TEMP_FIXED;
     ts->reg = reg;
     ts->name = name;
     tcg_regset_set_reg(s->reserved_regs, reg);
@@ -1205,7 +1205,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
     bigendian = 1;
 #endif
 
-    if (!base_ts->fixed_reg) {
+    if (base_ts->kind != TEMP_FIXED) {
         /* We do not support double-indirect registers.  */
         tcg_debug_assert(!base_ts->indirect_reg);
         base_ts->indirect_base = 1;
@@ -1253,6 +1253,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
 TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
 {
     TCGContext *s = tcg_ctx;
+    TCGTempKind kind = temp_local ? TEMP_LOCAL : TEMP_NORMAL;
     TCGTemp *ts;
     int idx, k;
 
@@ -1265,7 +1266,7 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
         ts = &s->temps[idx];
         ts->temp_allocated = 1;
         tcg_debug_assert(ts->base_type == type);
-        tcg_debug_assert(ts->temp_local == temp_local);
+        tcg_debug_assert(ts->kind == kind);
     } else {
         ts = tcg_temp_alloc(s);
         if (TCG_TARGET_REG_BITS == 32 && type == TCG_TYPE_I64) {
@@ -1274,18 +1275,18 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
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
 
@@ -1342,12 +1343,12 @@ void tcg_temp_free_internal(TCGTemp *ts)
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
 
@@ -1877,17 +1878,27 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
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
@@ -1898,12 +1909,17 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
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
 
@@ -2529,7 +2554,7 @@ static void la_bb_sync(TCGContext *s, int ng, int nt)
     la_global_sync(s, ng);
 
     for (int i = ng; i < nt; ++i) {
-        if (s->temps[i].temp_local) {
+        if (s->temps[i].kind == TEMP_LOCAL) {
             int state = s->temps[i].state;
             s->temps[i].state = state | TS_MEM;
             if (state != TS_DEAD) {
@@ -3137,7 +3162,8 @@ static void check_regs(TCGContext *s)
     }
     for (k = 0; k < s->nb_temps; k++) {
         ts = &s->temps[k];
-        if (ts->val_type == TEMP_VAL_REG && !ts->fixed_reg
+        if (ts->val_type == TEMP_VAL_REG
+            && ts->kind != TEMP_FIXED
             && s->reg_to_temp[ts->reg] != ts) {
             printf("Inconsistency for temp %s:\n",
                    tcg_get_arg_str_ptr(s, buf, sizeof(buf), ts));
@@ -3174,15 +3200,14 @@ static void temp_load(TCGContext *, TCGTemp *, TCGRegSet, TCGRegSet, TCGRegSet);
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
 
@@ -3199,7 +3224,7 @@ static inline void temp_dead(TCGContext *s, TCGTemp *ts)
 static void temp_sync(TCGContext *s, TCGTemp *ts, TCGRegSet allocated_regs,
                       TCGRegSet preferred_regs, int free_or_dead)
 {
-    if (ts->fixed_reg) {
+    if (ts->kind == TEMP_FIXED) {
         return;
     }
     if (!ts->mem_coherent) {
@@ -3382,7 +3407,8 @@ static void temp_save(TCGContext *s, TCGTemp *ts, TCGRegSet allocated_regs)
 {
     /* The liveness analysis already ensures that globals are back
        in memory. Keep an tcg_debug_assert for safety. */
-    tcg_debug_assert(ts->val_type == TEMP_VAL_MEM || ts->fixed_reg);
+    tcg_debug_assert(ts->val_type == TEMP_VAL_MEM
+                     || ts->kind == TEMP_FIXED);
 }
 
 /* save globals to their canonical location and assume they can be
@@ -3407,7 +3433,7 @@ static void sync_globals(TCGContext *s, TCGRegSet allocated_regs)
     for (i = 0, n = s->nb_globals; i < n; i++) {
         TCGTemp *ts = &s->temps[i];
         tcg_debug_assert(ts->val_type != TEMP_VAL_REG
-                         || ts->fixed_reg
+                         || ts->kind == TEMP_FIXED
                          || ts->mem_coherent);
     }
 }
@@ -3420,7 +3446,7 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
 
     for (i = s->nb_globals; i < s->nb_temps; i++) {
         TCGTemp *ts = &s->temps[i];
-        if (ts->temp_local) {
+        if (ts->kind == TEMP_LOCAL) {
             temp_save(s, ts, allocated_regs);
         } else {
             /* The liveness analysis already ensures that temps are dead.
@@ -3446,7 +3472,7 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
          * The liveness analysis already ensures that temps are dead.
          * Keep tcg_debug_asserts for safety.
          */
-        if (ts->temp_local) {
+        if (ts->kind == TEMP_LOCAL) {
             tcg_debug_assert(ts->val_type != TEMP_VAL_REG || ts->mem_coherent);
         } else {
             tcg_debug_assert(ts->val_type == TEMP_VAL_DEAD);
@@ -3462,7 +3488,7 @@ static void tcg_reg_alloc_do_movi(TCGContext *s, TCGTemp *ots,
                                   TCGRegSet preferred_regs)
 {
     /* ENV should not be modified.  */
-    tcg_debug_assert(!ots->fixed_reg);
+    tcg_debug_assert(ots->kind != TEMP_FIXED);
 
     /* The movi is not explicitly generated here.  */
     if (ots->val_type == TEMP_VAL_REG) {
@@ -3502,7 +3528,7 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
     ts = arg_temp(op->args[1]);
 
     /* ENV should not be modified.  */
-    tcg_debug_assert(!ots->fixed_reg);
+    tcg_debug_assert(ots->kind != TEMP_FIXED);
 
     /* Note that otype != itype for no-op truncation.  */
     otype = ots->type;
@@ -3541,7 +3567,7 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
         }
         temp_dead(s, ots);
     } else {
-        if (IS_DEAD_ARG(1) && !ts->fixed_reg) {
+        if (IS_DEAD_ARG(1) && ts->kind != TEMP_FIXED) {
             /* the mov can be suppressed */
             if (ots->val_type == TEMP_VAL_REG) {
                 s->reg_to_temp[ots->reg] = NULL;
@@ -3563,7 +3589,7 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
                  * Store the source register into the destination slot
                  * and leave the destination temp as TEMP_VAL_MEM.
                  */
-                assert(!ots->fixed_reg);
+                assert(ots->kind != TEMP_FIXED);
                 if (!ts->mem_allocated) {
                     temp_allocate_frame(s, ots);
                 }
@@ -3600,7 +3626,7 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
     its = arg_temp(op->args[1]);
 
     /* ENV should not be modified.  */
-    tcg_debug_assert(!ots->fixed_reg);
+    tcg_debug_assert(ots->kind != TEMP_FIXED);
 
     itype = its->type;
     vece = TCGOP_VECE(op);
@@ -3740,7 +3766,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         i_preferred_regs = o_preferred_regs = 0;
         if (arg_ct->ialias) {
             o_preferred_regs = op->output_pref[arg_ct->alias_index];
-            if (ts->fixed_reg) {
+            if (ts->kind == TEMP_FIXED) {
                 /* if fixed register, we must allocate a new register
                    if the alias is not the same register */
                 if (arg != op->args[arg_ct->alias_index]) {
@@ -3832,7 +3858,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
             ts = arg_temp(arg);
 
             /* ENV should not be modified.  */
-            tcg_debug_assert(!ts->fixed_reg);
+            tcg_debug_assert(ts->kind != TEMP_FIXED);
 
             if (arg_ct->oalias && !const_args[arg_ct->alias_index]) {
                 reg = new_args[arg_ct->alias_index];
@@ -3873,7 +3899,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         ts = arg_temp(op->args[i]);
 
         /* ENV should not be modified.  */
-        tcg_debug_assert(!ts->fixed_reg);
+        tcg_debug_assert(ts->kind != TEMP_FIXED);
 
         if (NEED_SYNC_ARG(i)) {
             temp_sync(s, ts, o_allocated_regs, 0, IS_DEAD_ARG(i));
@@ -4005,7 +4031,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         ts = arg_temp(arg);
 
         /* ENV should not be modified.  */
-        tcg_debug_assert(!ts->fixed_reg);
+        tcg_debug_assert(ts->kind != TEMP_FIXED);
 
         reg = tcg_target_call_oarg_regs[i];
         tcg_debug_assert(s->reg_to_temp[reg] == NULL);
-- 
2.25.1


