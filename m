Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44126A27FB
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:00:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqPS-0000OU-SD; Sat, 25 Feb 2023 04:00:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPP-0000Mt-Qk
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 03:59:59 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPO-0004pY-5p
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 03:59:59 -0500
Received: by mail-pl1-x631.google.com with SMTP id bh1so1828766plb.11
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 00:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Me3y4NGZuYmWF3kVGO2rrjiIggu4967Ajmd6fpL1eaM=;
 b=rpua9tDS/XjVPicEUXxJSEz3yvAaGF/i5t31E331Rb7i4aNQxR7QjRaHKXoLJTEsPW
 smK9RX15sH2yRQm5l+mIXrPRmbwUHaJglDE+ESyD8X61yQ9j363+ThCwVmxdWE35mLvp
 +b4T9UQkqWQBxz9nZyYMBRWZUBh9L/d2RiIkA3qiCbGpinFegNMg/vW+bGCAegVzfevZ
 4It0J+fpkeYKBPJ9ZcyR15mzqRURyjJ0ijEWVnefFgv2VpLrIx4Qid/Fr5kWlknFa3aJ
 LH+6DFs5bmZOQAoJ2ZGw1b6mbdZq2QeHV4Yn2dUKRs2yakVgWMrhneg7NyqHOVg/iBHu
 9G8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Me3y4NGZuYmWF3kVGO2rrjiIggu4967Ajmd6fpL1eaM=;
 b=OXQ6M+dFx8i7c9SQgMFhERIaRn6iflux5zC72yfhXFH7JPmPr8Llwv3YqjmRcJ6vNa
 YbejRR4uU3GubdeZGW9nj+7qtkEg39ngRmFO4bqH9edrsMC1HESHfpUn8G5j7zMLKYBu
 fFOACCEPfXd6Ck1Iw3xnDSrnx8adlIWzrsnd6zWdXksTmMZxrj2mM7g88fNGr3Eq7zcx
 aku5ezp3fNnmpq3SnZdfLTlp/wDSFElViRsAPk6eYG+sh0OCSY++p+lvFDnaa7U8W/Lr
 E2aL6MWEyEQvFgOSlxmbLWjCzt9ehKgBkmucQ8csxVNchjfFwCazrEkXIlpEAa45mucE
 1iiw==
X-Gm-Message-State: AO0yUKVeOKuoXeLXhtffzUlXX0sqfbHAlk5sxtbFuZ5a98YLthk4TSUJ
 MeY6a+yQh8w3O2JzGemx/fHVKATTatYufXanMrU=
X-Google-Smtp-Source: AK7set9gDu+puxiDCmFBVEsM7VTdGRu4yTf2+y2gj8LxHiVjtEtn51sPIIMNus1M9GMgU0MbTIMgaw==
X-Received: by 2002:a05:6a20:1610:b0:be:22c5:92df with SMTP id
 l16-20020a056a20161000b000be22c592dfmr15540413pzj.16.1677315596831; 
 Sat, 25 Feb 2023 00:59:56 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.00.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 00:59:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 05/30] tcg: Rename TEMP_LOCAL to TEMP_TB
Date: Fri, 24 Feb 2023 22:59:20 -1000
Message-Id: <20230225085945.1798188-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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


