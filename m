Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BF6681BFF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:00:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbFv-00088f-Bv; Mon, 30 Jan 2023 15:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFp-0007c4-OT
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:54 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFn-0005Ey-4W
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:53 -0500
Received: by mail-pf1-x435.google.com with SMTP id z1so5765894pfg.12
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2E58Iw876uTd6FlkZzM6tT65+aYePaxETl7ncokxgbo=;
 b=aJmPGhhHMw3nd1pu8s4Nymoo+IbHVRRTxMEAOpjvhDbMkrE2+d1jPlZmF8dnl/RV9a
 02JSqUc0qSZHfdU8NCRE5Ydjd5rSkCR8R3BxKuXQlVvp2bAEg1u7JAb/21FiyLasB4EM
 segxId4yj45iZwsrtKC1gOX47TuDPtIOoDjOQSXSAVc3GSagpjtq5SJx5CAVLXo1GwRi
 QLNkRm7rl67nQJH9iS6FQFDisFwx/p1HQ0V+O8c1VFpd4og1vNKQpZhr8pVV9uAPMpTW
 eqUmUN4z+b3noT7zrc88l0g+WeEsQL/LFYByGgiLEfj4T06DXaoYIcN/l4xtmxzYzCFr
 vW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2E58Iw876uTd6FlkZzM6tT65+aYePaxETl7ncokxgbo=;
 b=2VjbZP1Ntbdl5uvyFvf5c13wzeJB0DpEYeYJa1/VihumBXWQDu6No0HPHwcCJ6VhrH
 1cc293KT+tchRc61mL7rJCD6yRM3/ACh9wQnGcs+bhglZ/M3QOtzAD3dTjy7Uo0Kfgvv
 7UoE5IdHJdewT0JllDPuaw+jA6LgpmlbC3+4h0IiqXvoh8OAi5f3iXZornwFcOwr2pzP
 4VpeKTxaXfFij5qyYrTrGNegi2V47yt5CigOs5mtX/6Qy8nilN2sWIdyB6f/Sb3Wmolw
 quvB7rxVZrqfkAmScjDPKj/cud0+1Ku12QpZflPevPvXiIa0o6G5KQm5lZnIaMQlWTQr
 63bQ==
X-Gm-Message-State: AO0yUKXk/814i5R1qPvuAsUOnYx2Zk0EO9uYacBzPMOX2tRq0TdTBUt9
 ivowivMPn6NFuwljqMheCPQwixH/VF2P5H2S
X-Google-Smtp-Source: AK7set9GzmaHfTnAratYr6bGPUUtirOUBk+4KaYXo34KfyNKeZaqpI3yNIZD7Je1fE9TMZi/FBo/AQ==
X-Received: by 2002:aa7:9159:0:b0:592:d3ce:fdd1 with SMTP id
 25-20020aa79159000000b00592d3cefdd1mr10999950pfi.25.1675112389336; 
 Mon, 30 Jan 2023 12:59:49 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.12.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:59:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 05/27] tcg: Rename TEMP_LOCAL to TEMP_TB
Date: Mon, 30 Jan 2023 10:59:13 -1000
Message-Id: <20230130205935.1157347-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use TEMP_TB as that is more explicit about the default
lifetime of the data.  While "global" and "local" used
to be contrasting, we have more lifetimes than that now.

Do not yet rename tcg_temp_local_new_*, just the enum.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 12 ++++++++----
 tcg/optimize.c    |  2 +-
 tcg/tcg.c         | 18 +++++++++---------
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 7a8e4bbdd7..8786607510 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -431,11 +431,15 @@ typedef enum TCGTempVal {
 typedef enum TCGTempKind {
     /* Temp is dead at the end of all basic blocks. */
     TEMP_NORMAL,
-    /* Temp is live across conditional branch, but dead otherwise. */
+    /*
+     * Temp is dead at the end of the extended basic block (EBB),
+     * the single-entry multiple-exit region that falls through
+     * conditional branches.
+     */
     TEMP_EBB,
-    /* Temp is saved across basic blocks but dead at the end of TBs. */
-    TEMP_LOCAL,
-    /* Temp is saved across both basic blocks and translation blocks. */
+    /* Temp is live across the entire translation block, but dead at end. */
+    TEMP_TB,
+    /* Temp is live across the entire translation block, and between them. */
     TEMP_GLOBAL,
     /* Temp is in a fixed register. */
     TEMP_FIXED,
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 763bca9ea6..ce05989c39 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -190,7 +190,7 @@ static TCGTemp *find_better_copy(TCGContext *s, TCGTemp *ts)
         } else if (i->kind > ts->kind) {
             if (i->kind == TEMP_GLOBAL) {
                 g = i;
-            } else if (i->kind == TEMP_LOCAL) {
+            } else if (i->kind == TEMP_TB) {
                 l = i;
             }
         }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index fc0de1dccc..3e12053229 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1258,7 +1258,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
 TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
 {
     TCGContext *s = tcg_ctx;
-    TCGTempKind kind = temp_local ? TEMP_LOCAL : TEMP_NORMAL;
+    TCGTempKind kind = temp_local ? TEMP_TB : TEMP_NORMAL;
     TCGTemp *ts;
     int idx, k;
 
@@ -1369,7 +1369,7 @@ void tcg_temp_free_internal(TCGTemp *ts)
          */
         return;
     case TEMP_NORMAL:
-    case TEMP_LOCAL:
+    case TEMP_TB:
         break;
     default:
         g_assert_not_reached();
@@ -1913,7 +1913,7 @@ static void tcg_reg_alloc_start(TCGContext *s)
         case TEMP_EBB:
             val = TEMP_VAL_DEAD;
             /* fall through */
-        case TEMP_LOCAL:
+        case TEMP_TB:
             ts->mem_allocated = 0;
             break;
         default:
@@ -1935,7 +1935,7 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
     case TEMP_GLOBAL:
         pstrcpy(buf, buf_size, ts->name);
         break;
-    case TEMP_LOCAL:
+    case TEMP_TB:
         snprintf(buf, buf_size, "loc%d", idx - s->nb_globals);
         break;
     case TEMP_EBB:
@@ -2757,7 +2757,7 @@ static void la_bb_end(TCGContext *s, int ng, int nt)
         switch (ts->kind) {
         case TEMP_FIXED:
         case TEMP_GLOBAL:
-        case TEMP_LOCAL:
+        case TEMP_TB:
             state = TS_DEAD | TS_MEM;
             break;
         case TEMP_NORMAL:
@@ -2802,7 +2802,7 @@ static void la_bb_sync(TCGContext *s, int ng, int nt)
         int state;
 
         switch (ts->kind) {
-        case TEMP_LOCAL:
+        case TEMP_TB:
             state = ts->state;
             ts->state = state | TS_MEM;
             if (state != TS_DEAD) {
@@ -3494,7 +3494,7 @@ static void temp_free_or_dead(TCGContext *s, TCGTemp *ts, int free_or_dead)
     case TEMP_FIXED:
         return;
     case TEMP_GLOBAL:
-    case TEMP_LOCAL:
+    case TEMP_TB:
         new_type = TEMP_VAL_MEM;
         break;
     case TEMP_NORMAL:
@@ -3782,7 +3782,7 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
         TCGTemp *ts = &s->temps[i];
 
         switch (ts->kind) {
-        case TEMP_LOCAL:
+        case TEMP_TB:
             temp_save(s, ts, allocated_regs);
             break;
         case TEMP_NORMAL:
@@ -3819,7 +3819,7 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
          * Keep tcg_debug_asserts for safety.
          */
         switch (ts->kind) {
-        case TEMP_LOCAL:
+        case TEMP_TB:
             tcg_debug_assert(ts->val_type != TEMP_VAL_REG || ts->mem_coherent);
             break;
         case TEMP_NORMAL:
-- 
2.34.1


