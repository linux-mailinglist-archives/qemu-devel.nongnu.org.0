Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E6369FF83
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:31:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWH-0000Oe-G8; Wed, 22 Feb 2023 18:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWF-0000O0-PH
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:27 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWE-0005Iu-2r
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:27 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 na9-20020a17090b4c0900b0023058bbd7b2so10008005pjb.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Me3y4NGZuYmWF3kVGO2rrjiIggu4967Ajmd6fpL1eaM=;
 b=OG66JpeBB4WC9xhDJGwYFYLQsuuobyfBDo1u4WLvdSlI/7NLDgbUPF4k4CK+cDbC3c
 2piz1vi1dYj0KLSONJK52GrylrisRV3XbhH0ku317tVGX8o4y/DBF28bTZQRDK6a6bbg
 SbG5hP09onXHooChPmq9N/blbV1GC0zLjy9XnoVEl0dpqc/ldctQKBiewp3SX8Tay7E2
 VTbIwDSaEOpO4Anqa1Wya9qEoElE7khoLqajBM/Ja6uphJZk5ttZhnPZRnui/kExdHGh
 xfz+fkxNNPmeZMk1Io9JL4EaQE4XhzsrdmTpdDL1S18dBZohxtbh5+EFm+eO9uCBGn3q
 ndIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Me3y4NGZuYmWF3kVGO2rrjiIggu4967Ajmd6fpL1eaM=;
 b=uWBlPriMWRTvv1iPHyVOC421+c2RLl840G42E+KzYorq5UeGv+J1J7sBUDR/cvdTB/
 AxGbBSyBhaWP7HEe7P/ybE+aXyMmSYM2sjc7WdTdj2FklXV6Cpa+ipV0zHlGfIMQMHhr
 g/G9Ois4O1nVG9o/XJJHxk7eijyA0Pv2y1sXbCxSRjBuOPso8bPATNglsN/3An/zu9Ts
 dDXXgQ06CydODFIoZLC4MdEDBdRwJz0SZzJMRsDmWg+h+/b75GjG89LWJKAWAl+SRvR6
 gVCJyEMnFSCsnMdalbtWF7xwMnBGfM/003SOdXsLffEz1382dUa/bNozDtPFNtXsl/Se
 2kng==
X-Gm-Message-State: AO0yUKWVTG8fr5r3OItROMnIgqO5eC3C0MOguJbthhONwPwv9MzkNMKJ
 caVQd7MnDOR3fS8GL4xNTxAu9wUKHlUDq8gAj9k=
X-Google-Smtp-Source: AK7set9lqHXFhsQ0tR5MZNRHv6ANEqj0TTxcYZJ4oAWlh6R4081MGZuMykt1PxQrJbonI3mvBvF73w==
X-Received: by 2002:a17:90a:804c:b0:234:3e54:35c2 with SMTP id
 e12-20020a17090a804c00b002343e5435c2mr12848736pjw.25.1677108444590; 
 Wed, 22 Feb 2023 15:27:24 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 05/28] tcg: Rename TEMP_LOCAL to TEMP_TB
Date: Wed, 22 Feb 2023 13:26:52 -1000
Message-Id: <20230222232715.15034-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 12 ++++++++----
 tcg/optimize.c    |  2 +-
 tcg/tcg.c         | 18 +++++++++---------
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 59854f95b1..2010e746ca 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -433,11 +433,15 @@ typedef enum TCGTempVal {
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
index 0992fb4f31..bf2af8b0fe 100644
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
@@ -1915,7 +1915,7 @@ static void tcg_reg_alloc_start(TCGContext *s)
         case TEMP_EBB:
             val = TEMP_VAL_DEAD;
             /* fall through */
-        case TEMP_LOCAL:
+        case TEMP_TB:
             ts->mem_allocated = 0;
             break;
         default:
@@ -1937,7 +1937,7 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
     case TEMP_GLOBAL:
         pstrcpy(buf, buf_size, ts->name);
         break;
-    case TEMP_LOCAL:
+    case TEMP_TB:
         snprintf(buf, buf_size, "loc%d", idx - s->nb_globals);
         break;
     case TEMP_EBB:
@@ -2759,7 +2759,7 @@ static void la_bb_end(TCGContext *s, int ng, int nt)
         switch (ts->kind) {
         case TEMP_FIXED:
         case TEMP_GLOBAL:
-        case TEMP_LOCAL:
+        case TEMP_TB:
             state = TS_DEAD | TS_MEM;
             break;
         case TEMP_NORMAL:
@@ -2804,7 +2804,7 @@ static void la_bb_sync(TCGContext *s, int ng, int nt)
         int state;
 
         switch (ts->kind) {
-        case TEMP_LOCAL:
+        case TEMP_TB:
             state = ts->state;
             ts->state = state | TS_MEM;
             if (state != TS_DEAD) {
@@ -3497,7 +3497,7 @@ static void temp_free_or_dead(TCGContext *s, TCGTemp *ts, int free_or_dead)
     case TEMP_FIXED:
         return;
     case TEMP_GLOBAL:
-    case TEMP_LOCAL:
+    case TEMP_TB:
         new_type = TEMP_VAL_MEM;
         break;
     case TEMP_NORMAL:
@@ -3785,7 +3785,7 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
         TCGTemp *ts = &s->temps[i];
 
         switch (ts->kind) {
-        case TEMP_LOCAL:
+        case TEMP_TB:
             temp_save(s, ts, allocated_regs);
             break;
         case TEMP_NORMAL:
@@ -3822,7 +3822,7 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
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


