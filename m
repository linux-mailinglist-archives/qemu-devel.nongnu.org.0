Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909A12FBFBD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:11:19 +0100 (CET)
Received: from localhost ([::1]:51506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wPO-0007LZ-Kt
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1vpv-0002cq-1P
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:34:39 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:37710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1vps-0001Fr-Ry
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:34:38 -0500
Received: by mail-pf1-x432.google.com with SMTP id 11so12779691pfu.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0qp18WNANcXFrE2K7B3cvwfkNuDH1MH1NJQQgujUOMM=;
 b=EdEzdWi2DH3x63dyGo8z/aNiG2WgzCRPSLlTS8d6/5CBBzUY4bftTLkuviXxOue8PJ
 IuYP/bV7SwIKdwQB8JxcKPlHv+9ZiEa/Tz4jYkkvZwNjUTIROV9Uwo2DhGhZzrJWNLZA
 r/beu91lBo53BQBJCQk63dwyxskdfQ8mn2+pkbYYfF4VupazjzXfVxl/eZFnazBaE38o
 O6l40t78DKI2TVrOvJRo9UggwyJ5JMLmLH9ipyoVz+foOy9qqUPPzvjrQNueuk9ps7Qa
 xk7IPrUHKuAQMYKzxbYPYHa1r8GxWb8gsW2T3SnfJoWsnphKLEEMtnqGRlvHBgQHc5Mp
 EvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0qp18WNANcXFrE2K7B3cvwfkNuDH1MH1NJQQgujUOMM=;
 b=jUrDihDbqiAbgi3kzVSDNNgZ+AhDE0f40mtuIsUSbie7sjLrNrIQc+xbZ4tXExDOxO
 pGhX3o4y9p4572wyidwSj0Uix3FJ76tpNWweKFCBMpsp8CID1tdQXuAfifDptvMXeCvZ
 gCKpwKSQf7YuDnmQsyOnrwEM0jbMA7p74yl7HngoYJhHCQRYKEKLYx1Bs3HVeWNxJ6vJ
 LcWZNhipOmEW2YM9YaE5XeaBFpxqWCMQf3Ns4+W8WA3RiGRWjp+kexq+Eww9OAZqd69k
 H0qPzWp9c+hVXhOqNTOc/zPgCCsNurcuVJgUCe9bhRpRKZiSYQiyZzvWo852PRXngSaB
 IwyA==
X-Gm-Message-State: AOAM532Io8zD2p3M9Dxn7pOAwDXvD4y2nBJQ4OYFBka+PVTh+BjqEjd6
 zfdKslGSNkg3ESbCMlZOZmEtuAKTcEKgBA==
X-Google-Smtp-Source: ABdhPJwSHV/y67zAtiiIoe8yhadT/nVU9ub5Bu1+BRkgCAF6jzUKYDoNyhZyUypnRiwO1sUxAPz6/w==
X-Received: by 2002:a62:1d46:0:b029:1b7:fe6e:4bb4 with SMTP id
 d67-20020a621d460000b02901b7fe6e4bb4mr5560537pfd.4.1611081275247; 
 Tue, 19 Jan 2021 10:34:35 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id a136sm20651359pfd.149.2021.01.19.10.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:34:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] tcg: Introduce and use tcg_temp
Date: Tue, 19 Jan 2021 08:34:25 -1000
Message-Id: <20210119183428.556706-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119183428.556706-1-richard.henderson@linaro.org>
References: <20210119183428.556706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: lvivier@redhat.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to change the representation of the array of TCGTemps.
Wrap the indexing into an inline to minimize changes later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |  6 ++++
 tcg/optimize.c    |  5 ++--
 tcg/tcg.c         | 71 ++++++++++++++++++++++++++---------------------
 3 files changed, 48 insertions(+), 34 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 5ef644ceae..0d90701dcd 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -720,6 +720,12 @@ static inline void *tcg_splitwx_to_rw(const void *rx)
 }
 #endif
 
+static inline TCGTemp *tcg_temp(TCGContext *s, size_t idx)
+{
+    tcg_debug_assert(idx < s->nb_temps);
+    return &s->temps[idx];
+}
+
 static inline size_t temp_idx(TCGTemp *ts)
 {
     return ts->index;
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 37c902283e..2aa491605e 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -614,7 +614,8 @@ void tcg_optimize(TCGContext *s)
 
     memset(&temps_used, 0, sizeof(temps_used));
     for (i = 0; i < nb_temps; ++i) {
-        s->temps[i].state_ptr = NULL;
+        TCGTemp *ts = tcg_temp(s, i);
+        ts->state_ptr = NULL;
     }
 
     QTAILQ_FOREACH_SAFE(op, &s->ops, link, op_next) {
@@ -1485,7 +1486,7 @@ void tcg_optimize(TCGContext *s)
                   & (TCG_CALL_NO_READ_GLOBALS | TCG_CALL_NO_WRITE_GLOBALS))) {
                 for (i = 0; i < nb_globals; i++) {
                     if (test_bit(i, temps_used.l)) {
-                        reset_ts(&s->temps[i]);
+                        reset_ts(tcg_temp(s, i));
                     }
                 }
             }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 4a8dfb8f67..7284209cff 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -824,10 +824,10 @@ void tcg_register_thread(void)
 
     /* Relink mem_base.  */
     for (i = 0, n = tcg_init_ctx.nb_globals; i < n; ++i) {
-        if (tcg_init_ctx.temps[i].mem_base) {
-            ptrdiff_t b = tcg_init_ctx.temps[i].mem_base - tcg_init_ctx.temps;
-            tcg_debug_assert(b >= 0 && b < n);
-            s->temps[i].mem_base = &s->temps[b];
+        TCGTemp *its = tcg_temp(&tcg_init_ctx, i);
+        if (its->mem_base) {
+            TCGTemp *ots = tcg_temp(s, i);
+            ots->mem_base = tcg_temp(s, temp_idx(its->mem_base));
         }
     }
 
@@ -1332,7 +1332,7 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
         /* There is already an available temp with the right type.  */
         clear_bit(idx, s->free_temps[k].l);
 
-        ts = &s->temps[idx];
+        ts = tcg_temp(s, idx);
         ts->temp_allocated = 1;
         tcg_debug_assert(ts->base_type == type);
         tcg_debug_assert(ts->kind == kind);
@@ -2016,7 +2016,7 @@ static void tcg_reg_alloc_start(TCGContext *s)
     int i, n;
 
     for (i = 0, n = s->nb_temps; i < n; i++) {
-        TCGTemp *ts = &s->temps[i];
+        TCGTemp *ts = tcg_temp(s, i);
         TCGTempVal val = TEMP_VAL_MEM;
 
         switch (ts->kind) {
@@ -2654,12 +2654,14 @@ static void la_func_end(TCGContext *s, int ng, int nt)
     int i;
 
     for (i = 0; i < ng; ++i) {
-        s->temps[i].state = TS_DEAD | TS_MEM;
-        la_reset_pref(&s->temps[i]);
+        TCGTemp *ts = tcg_temp(s, i);
+        ts->state = TS_DEAD | TS_MEM;
+        la_reset_pref(ts);
     }
     for (i = ng; i < nt; ++i) {
-        s->temps[i].state = TS_DEAD;
-        la_reset_pref(&s->temps[i]);
+        TCGTemp *ts = tcg_temp(s, i);
+        ts->state = TS_DEAD;
+        la_reset_pref(ts);
     }
 }
 
@@ -2670,7 +2672,7 @@ static void la_bb_end(TCGContext *s, int ng, int nt)
     int i;
 
     for (i = 0; i < nt; ++i) {
-        TCGTemp *ts = &s->temps[i];
+        TCGTemp *ts = tcg_temp(s, i);
         int state;
 
         switch (ts->kind) {
@@ -2697,11 +2699,13 @@ static void la_global_sync(TCGContext *s, int ng)
     int i;
 
     for (i = 0; i < ng; ++i) {
-        int state = s->temps[i].state;
-        s->temps[i].state = state | TS_MEM;
+        TCGTemp *ts = tcg_temp(s, i);
+        int state = ts->state;
+
+        ts->state = state | TS_MEM;
         if (state == TS_DEAD) {
             /* If the global was previously dead, reset prefs.  */
-            la_reset_pref(&s->temps[i]);
+            la_reset_pref(ts);
         }
     }
 }
@@ -2715,7 +2719,7 @@ static void la_bb_sync(TCGContext *s, int ng, int nt)
     la_global_sync(s, ng);
 
     for (int i = ng; i < nt; ++i) {
-        TCGTemp *ts = &s->temps[i];
+        TCGTemp *ts = tcg_temp(s, i);
         int state;
 
         switch (ts->kind) {
@@ -2727,14 +2731,14 @@ static void la_bb_sync(TCGContext *s, int ng, int nt)
             }
             break;
         case TEMP_NORMAL:
-            s->temps[i].state = TS_DEAD;
+            ts->state = TS_DEAD;
             break;
         case TEMP_CONST:
             continue;
         default:
             g_assert_not_reached();
         }
-        la_reset_pref(&s->temps[i]);
+        la_reset_pref(ts);
     }
 }
 
@@ -2744,8 +2748,9 @@ static void la_global_kill(TCGContext *s, int ng)
     int i;
 
     for (i = 0; i < ng; i++) {
-        s->temps[i].state = TS_DEAD | TS_MEM;
-        la_reset_pref(&s->temps[i]);
+        TCGTemp *ts = tcg_temp(s, i);
+        ts->state = TS_DEAD | TS_MEM;
+        la_reset_pref(ts);
     }
 }
 
@@ -2756,7 +2761,8 @@ static void la_cross_call(TCGContext *s, int nt)
     int i;
 
     for (i = 0; i < nt; i++) {
-        TCGTemp *ts = &s->temps[i];
+        TCGTemp *ts = tcg_temp(s, i);
+
         if (!(ts->state & TS_DEAD)) {
             TCGRegSet *pset = la_temp_pref(ts);
             TCGRegSet set = *pset;
@@ -2784,7 +2790,8 @@ static void liveness_pass_1(TCGContext *s)
 
     prefs = tcg_malloc(sizeof(TCGRegSet) * nb_temps);
     for (i = 0; i < nb_temps; ++i) {
-        s->temps[i].state_ptr = prefs + i;
+        TCGTemp *ts = tcg_temp(s, i);
+        ts->state_ptr = prefs + i;
     }
 
     /* ??? Should be redundant with the exit_tb that ends the TB.  */
@@ -3094,7 +3101,7 @@ static bool liveness_pass_2(TCGContext *s)
 
     /* Create a temporary for each indirect global.  */
     for (i = 0; i < nb_globals; ++i) {
-        TCGTemp *its = &s->temps[i];
+        TCGTemp *its = tcg_temp(s, i);
         if (its->indirect_reg) {
             TCGTemp *dts = tcg_temp_alloc(s);
             dts->type = its->type;
@@ -3107,7 +3114,7 @@ static bool liveness_pass_2(TCGContext *s)
         its->state = TS_DEAD;
     }
     for (nb_temps = s->nb_temps; i < nb_temps; ++i) {
-        TCGTemp *its = &s->temps[i];
+        TCGTemp *its = tcg_temp(s, i);
         its->state_ptr = NULL;
         its->state = TS_DEAD;
     }
@@ -3190,7 +3197,7 @@ static bool liveness_pass_2(TCGContext *s)
             for (i = 0; i < nb_globals; ++i) {
                 /* Liveness should see that globals are synced back,
                    that is, either TS_DEAD or TS_MEM.  */
-                arg_ts = &s->temps[i];
+                arg_ts = tcg_temp(s, i);
                 tcg_debug_assert(arg_ts->state_ptr == 0
                                  || arg_ts->state != 0);
             }
@@ -3198,7 +3205,7 @@ static bool liveness_pass_2(TCGContext *s)
             for (i = 0; i < nb_globals; ++i) {
                 /* Liveness should see that globals are saved back,
                    that is, TS_DEAD, waiting to be reloaded.  */
-                arg_ts = &s->temps[i];
+                arg_ts = tcg_temp(s, i);
                 tcg_debug_assert(arg_ts->state_ptr == 0
                                  || arg_ts->state == TS_DEAD);
             }
@@ -3277,12 +3284,11 @@ static bool liveness_pass_2(TCGContext *s)
 #ifdef CONFIG_DEBUG_TCG
 static void dump_regs(TCGContext *s)
 {
-    TCGTemp *ts;
     int i;
     char buf[64];
 
     for(i = 0; i < s->nb_temps; i++) {
-        ts = &s->temps[i];
+        TCGTemp *ts = tcg_temp(s, i);
         printf("  %10s: ", tcg_get_arg_str_ptr(s, buf, sizeof(buf), ts));
         switch(ts->val_type) {
         case TEMP_VAL_REG:
@@ -3332,7 +3338,7 @@ static void check_regs(TCGContext *s)
         }
     }
     for (k = 0; k < s->nb_temps; k++) {
-        ts = &s->temps[k];
+        ts = tcg_temp(s, k);
         if (ts->val_type == TEMP_VAL_REG
             && ts->kind != TEMP_FIXED
             && s->reg_to_temp[ts->reg] != ts) {
@@ -3594,7 +3600,7 @@ static void save_globals(TCGContext *s, TCGRegSet allocated_regs)
     int i, n;
 
     for (i = 0, n = s->nb_globals; i < n; i++) {
-        temp_save(s, &s->temps[i], allocated_regs);
+        temp_save(s, tcg_temp(s, i), allocated_regs);
     }
 }
 
@@ -3606,7 +3612,7 @@ static void sync_globals(TCGContext *s, TCGRegSet allocated_regs)
     int i, n;
 
     for (i = 0, n = s->nb_globals; i < n; i++) {
-        TCGTemp *ts = &s->temps[i];
+        TCGTemp *ts = tcg_temp(s, i);
         tcg_debug_assert(ts->val_type != TEMP_VAL_REG
                          || ts->kind == TEMP_FIXED
                          || ts->mem_coherent);
@@ -3620,7 +3626,7 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
     int i;
 
     for (i = s->nb_globals; i < s->nb_temps; i++) {
-        TCGTemp *ts = &s->temps[i];
+        TCGTemp *ts = tcg_temp(s, i);
 
         switch (ts->kind) {
         case TEMP_LOCAL:
@@ -3652,7 +3658,8 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
     sync_globals(s, allocated_regs);
 
     for (int i = s->nb_globals; i < s->nb_temps; i++) {
-        TCGTemp *ts = &s->temps[i];
+        TCGTemp *ts = tcg_temp(s, i);
+
         /*
          * The liveness analysis already ensures that temps are dead.
          * Keep tcg_debug_asserts for safety.
-- 
2.25.1


