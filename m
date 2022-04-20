Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BF25090E1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:56:19 +0200 (CEST)
Received: from localhost ([::1]:46456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGQz-0000yG-NJ
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhFoe-00013h-8Y
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:16:40 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:39657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhFoc-0003AK-Bw
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:16:39 -0400
Received: by mail-pf1-x431.google.com with SMTP id l127so2852262pfl.6
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 12:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sj/SSJt7nvun+kV3U3qohvykaEIR74rwfzg6+qzkVmM=;
 b=NbZYXVceWGlVe5wfIxzrX98iTA6oA32X4zBypowExI0m4aLqazTCnSfLLx6EESDux/
 Vv5GAM4C6NgMZYYA9gQNemXrCcU8LMtitznxRq5sZSRH2jW59HkeGqaOiRzi9/JIUVQ+
 5ytxZdQPdt6/aR9woAb7YDdLRyM0VkyZXfLhQVvZ61smHgLTFqtTrGLDqO5gt2zUUMw9
 T0UDY9GwXrsB15v67d2D+XD+BM9dRVEyhTR1Y0OHJ14qxnOFEdjjPTkOoXtO13HhuF56
 jcwwnQBkyF7qfsoPKJXdHr2HqB1Y18hHUxGLOBpNpSOEdpQa0rifKip5/K0qhWlLxcO7
 WWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sj/SSJt7nvun+kV3U3qohvykaEIR74rwfzg6+qzkVmM=;
 b=t5lKqMHFEfYVDzfhxopGUYKGnLgbYQPQJ3efBlFkipmiGJkTDmXt/JlhgIuLMiIqWu
 NS6j7Kz3yPJb4hXZ5mAS5WhNuHpQ9NwDENyWm/flKN9oTuKwarVi7hy1+2FlbMSphSX8
 5uPCoK0gS/99qYmDyekjCwqqhbmpXjX1ndenCxZqoAAsxYOZIikSCa4wyh+p5zU/xFQI
 r4QpopURVwVaHeTbGMN6ffQ7iTt9/lJC6V6CxlW1K4fdik8mS0FJ20QZtV4uXBw5Wo3F
 3Z7vh8NArG20ML2P4hBVN9ftjcstIElWeUCHM1bQS8hcWLgMhKmtiogVauK6EE43wtjo
 5twA==
X-Gm-Message-State: AOAM533z4f7507dzDSEkHwSXphewXxDUIjFvk8G8ewp3mHOW+dttO88D
 o2wKy2hjK27YCpz+apPtgQ06SEj3WhNE9A==
X-Google-Smtp-Source: ABdhPJx6RcCin1NxDiaLPGML+nr7WR/s1+4B7WQiImUZQuA1f2RAMCfeBaW3EiijVO4zukg4eyE2cg==
X-Received: by 2002:a63:a551:0:b0:3aa:5150:a94a with SMTP id
 r17-20020a63a551000000b003aa5150a94amr6431114pgu.144.1650482196899; 
 Wed, 20 Apr 2022 12:16:36 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 n24-20020aa79058000000b0050612d0fe01sm20599200pfo.2.2022.04.20.12.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 12:16:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] tcg: Fix indirect lowering vs TCG_OPF_COND_BRANCH
Date: Wed, 20 Apr 2022 12:16:32 -0700
Message-Id: <20220420191634.1402437-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420191634.1402437-1-richard.henderson@linaro.org>
References: <20220420191634.1402437-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With TCG_OPF_COND_BRANCH, we extended the lifetimes of
globals across extended basic blocks.  This means that
the liveness computed in pass 1 does not kill globals
in the same way as normal temps.

Introduce TYPE_EBB to match this lifetime, so that we
get correct register allocation for the temps that we
introduce during the indirect lowering pass.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: b4cb76e6208 ("tcg: Do not kill globals at conditional branches")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |  2 ++
 tcg/tcg.c         | 34 +++++++++++++++++++++++++++-------
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 73869fd9d0..27de13fae0 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -433,6 +433,8 @@ typedef enum TCGTempVal {
 typedef enum TCGTempKind {
     /* Temp is dead at the end of all basic blocks. */
     TEMP_NORMAL,
+    /* Temp is live across conditional branch, but dead otherwise. */
+    TEMP_EBB,
     /* Temp is saved across basic blocks but dead at the end of TBs. */
     TEMP_LOCAL,
     /* Temp is saved across both basic blocks and translation blocks. */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index f8542529d0..f2d9ce19b8 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1024,9 +1024,18 @@ void tcg_temp_free_internal(TCGTemp *ts)
     TCGContext *s = tcg_ctx;
     int k, idx;
 
-    /* In order to simplify users of tcg_constant_*, silently ignore free. */
-    if (ts->kind == TEMP_CONST) {
+    switch (ts->kind) {
+    case TEMP_CONST:
+        /*
+         * In order to simplify users of tcg_constant_*,
+         * silently ignore free.
+         */
         return;
+    case TEMP_NORMAL:
+    case TEMP_LOCAL:
+        break;
+    default:
+        g_assert_not_reached();
     }
 
 #if defined(CONFIG_DEBUG_TCG)
@@ -1036,7 +1045,6 @@ void tcg_temp_free_internal(TCGTemp *ts)
     }
 #endif
 
-    tcg_debug_assert(ts->kind < TEMP_GLOBAL);
     tcg_debug_assert(ts->temp_allocated != 0);
     ts->temp_allocated = 0;
 
@@ -1674,6 +1682,7 @@ static void tcg_reg_alloc_start(TCGContext *s)
         case TEMP_GLOBAL:
             break;
         case TEMP_NORMAL:
+        case TEMP_EBB:
             val = TEMP_VAL_DEAD;
             /* fall through */
         case TEMP_LOCAL:
@@ -1701,6 +1710,9 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
     case TEMP_LOCAL:
         snprintf(buf, buf_size, "loc%d", idx - s->nb_globals);
         break;
+    case TEMP_EBB:
+        snprintf(buf, buf_size, "ebb%d", idx - s->nb_globals);
+        break;
     case TEMP_NORMAL:
         snprintf(buf, buf_size, "tmp%d", idx - s->nb_globals);
         break;
@@ -2378,6 +2390,7 @@ static void la_bb_end(TCGContext *s, int ng, int nt)
             state = TS_DEAD | TS_MEM;
             break;
         case TEMP_NORMAL:
+        case TEMP_EBB:
         case TEMP_CONST:
             state = TS_DEAD;
             break;
@@ -2405,8 +2418,9 @@ static void la_global_sync(TCGContext *s, int ng)
 }
 
 /*
- * liveness analysis: conditional branch: all temps are dead,
- * globals and local temps should be synced.
+ * liveness analysis: conditional branch: all temps are dead unless
+ * explicitly live-across-conditional-branch, globals and local temps
+ * should be synced.
  */
 static void la_bb_sync(TCGContext *s, int ng, int nt)
 {
@@ -2427,6 +2441,7 @@ static void la_bb_sync(TCGContext *s, int ng, int nt)
         case TEMP_NORMAL:
             s->temps[i].state = TS_DEAD;
             break;
+        case TEMP_EBB:
         case TEMP_CONST:
             continue;
         default:
@@ -2797,6 +2812,7 @@ static bool liveness_pass_2(TCGContext *s)
             TCGTemp *dts = tcg_temp_alloc(s);
             dts->type = its->type;
             dts->base_type = its->base_type;
+            dts->kind = TEMP_EBB;
             its->state_ptr = dts;
         } else {
             its->state_ptr = NULL;
@@ -3107,6 +3123,7 @@ static void temp_free_or_dead(TCGContext *s, TCGTemp *ts, int free_or_dead)
         new_type = TEMP_VAL_MEM;
         break;
     case TEMP_NORMAL:
+    case TEMP_EBB:
         new_type = free_or_dead < 0 ? TEMP_VAL_MEM : TEMP_VAL_DEAD;
         break;
     case TEMP_CONST:
@@ -3353,6 +3370,7 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
             temp_save(s, ts, allocated_regs);
             break;
         case TEMP_NORMAL:
+        case TEMP_EBB:
             /* The liveness analysis already ensures that temps are dead.
                Keep an tcg_debug_assert for safety. */
             tcg_debug_assert(ts->val_type == TEMP_VAL_DEAD);
@@ -3370,8 +3388,9 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
 }
 
 /*
- * At a conditional branch, we assume all temporaries are dead and
- * all globals and local temps are synced to their location.
+ * At a conditional branch, we assume all temporaries are dead unless
+ * explicitly live-across-conditional-branch; all globals and local
+ * temps are synced to their location.
  */
 static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
 {
@@ -3390,6 +3409,7 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
         case TEMP_NORMAL:
             tcg_debug_assert(ts->val_type == TEMP_VAL_DEAD);
             break;
+        case TEMP_EBB:
         case TEMP_CONST:
             break;
         default:
-- 
2.34.1


