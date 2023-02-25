Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C836A280E
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:03:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqQF-0001VL-12; Sat, 25 Feb 2023 04:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPh-0000Uo-P4
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:18 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPf-0004py-9F
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:17 -0500
Received: by mail-pj1-x1036.google.com with SMTP id kb15so1420060pjb.1
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yzfn6SwReNHYrs90SleSmiPQOxaudqzmn6c62VzQnAs=;
 b=QAKQnB6WiF7p86Uu2fVjNbOxyRNlmbPv0uqfD2/CYCf1iUcGSF7V2+ckezKjX0dx3s
 xOXf7LKBoOQo+hAkMqixDfHPKXT8ZiN7A0fXAD8if1V8xH4DdRYhmsvXGYmhwwEm02iX
 8RAvAXwxYCK5azkjvdgbbIfqifiSEtHTq/c+px4SjheCJ7J0brkZLGrkyeSEJVy6Tz6v
 Az/wQDLE8gWrQkRroN5p8IjH74MyKyVf6D9rh/uT8utvRHeBgruWZkw0KIWUHOS+61N4
 SK5VmN1qB2XGosdqx+cUfrgjwTkd67N9F1Y8czXnXgBLJq/R6VZFzDzQYLo83IjZHHpl
 ClLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yzfn6SwReNHYrs90SleSmiPQOxaudqzmn6c62VzQnAs=;
 b=ENoPYvb7etjnBHmV0MKQ8Q9wfYFEtu5cRdo3VXJzyagixg+IrgrlZBPtkFNPgiH64P
 wn+Gw56C+EGImdCptmRs988kVRQ34nhW92wEnHzs7xdAZoe6lOnfGTyeHswYCXT3nwnp
 CFOpK6nPEhgxdw4E2L89djTAP0yNJZcrmJqBllklpupjrtxk/M5bzRwYQqCYzjxbUZ9S
 1Hfo+gx31pTFrjr5GC97mDTMVNDH6jFpKaSrnTYz7oAzhdiBwAbcHHyd5IkvQOqkaWyC
 yge+kNnH7qLMEf4xyt3gDfvjTR+u1wn23fzzMu/wkXMXXHElTmKxd0NwFjw1C8DATvKH
 5VCA==
X-Gm-Message-State: AO0yUKXfTAeMv27knGV11QlUoPCJt1tpnwRCWVLu0Lvwcm/fouOzwweA
 jTUXO6oJ43k0N0PPuzWcU/spF6t0jzJB68aWKpM=
X-Google-Smtp-Source: AK7set/GwyL3lDEWana00zsS1e8L1pwFEciwhs5n+GU6OuI9f6n9sJsl3keYMmZb4xdUBdmDIdNbNg==
X-Received: by 2002:a05:6a20:3d81:b0:cc:32aa:8570 with SMTP id
 s1-20020a056a203d8100b000cc32aa8570mr9314269pzi.14.1677315614439; 
 Sat, 25 Feb 2023 01:00:14 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PATCH v3 17/30] tcg: Don't re-use TEMP_TB temporaries
Date: Fri, 24 Feb 2023 22:59:32 -1000
Message-Id: <20230225085945.1798188-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Reusing TEMP_TB interferes with detecting whether the
temp can be adjusted to TEMP_EBB.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |   2 +-
 tcg/tcg.c         | 101 ++++++++++++++++++++++++----------------------
 2 files changed, 53 insertions(+), 50 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 0c2041bcf7..6cc6758cd6 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -612,7 +612,7 @@ struct TCGContext {
 #endif
 
     GHashTable *const_table[TCG_TYPE_COUNT];
-    TCGTempSet free_temps[TCG_TYPE_COUNT * 2];
+    TCGTempSet free_temps[TCG_TYPE_COUNT];
     TCGTemp temps[TCG_MAX_TEMPS]; /* globals first, temps after */
 
     QTAILQ_HEAD(, TCGOp) ops, free_ops;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 437fea2f3c..758b2a3e06 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1258,63 +1258,66 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
 TCGTemp *tcg_temp_new_internal(TCGType type, TCGTempKind kind)
 {
     TCGContext *s = tcg_ctx;
-    bool temp_local = kind == TEMP_TB;
     TCGTemp *ts;
-    int idx, k;
+    int n;
 
-    k = type + (temp_local ? TCG_TYPE_COUNT : 0);
-    idx = find_first_bit(s->free_temps[k].l, TCG_MAX_TEMPS);
-    if (idx < TCG_MAX_TEMPS) {
-        /* There is already an available temp with the right type.  */
-        clear_bit(idx, s->free_temps[k].l);
+    if (kind == TEMP_EBB) {
+        int idx = find_first_bit(s->free_temps[type].l, TCG_MAX_TEMPS);
 
-        ts = &s->temps[idx];
-        ts->temp_allocated = 1;
-        tcg_debug_assert(ts->base_type == type);
-        tcg_debug_assert(ts->kind == kind);
-    } else {
-        int i, n;
+        if (idx < TCG_MAX_TEMPS) {
+            /* There is already an available temp with the right type.  */
+            clear_bit(idx, s->free_temps[type].l);
 
-        switch (type) {
-        case TCG_TYPE_I32:
-        case TCG_TYPE_V64:
-        case TCG_TYPE_V128:
-        case TCG_TYPE_V256:
-            n = 1;
-            break;
-        case TCG_TYPE_I64:
-            n = 64 / TCG_TARGET_REG_BITS;
-            break;
-        case TCG_TYPE_I128:
-            n = 128 / TCG_TARGET_REG_BITS;
-            break;
-        default:
-            g_assert_not_reached();
+            ts = &s->temps[idx];
+            ts->temp_allocated = 1;
+            tcg_debug_assert(ts->base_type == type);
+            tcg_debug_assert(ts->kind == kind);
+            goto done;
         }
+    } else {
+        tcg_debug_assert(kind == TEMP_TB);
+    }
 
-        ts = tcg_temp_alloc(s);
-        ts->base_type = type;
-        ts->temp_allocated = 1;
-        ts->kind = kind;
+    switch (type) {
+    case TCG_TYPE_I32:
+    case TCG_TYPE_V64:
+    case TCG_TYPE_V128:
+    case TCG_TYPE_V256:
+        n = 1;
+        break;
+    case TCG_TYPE_I64:
+        n = 64 / TCG_TARGET_REG_BITS;
+        break;
+    case TCG_TYPE_I128:
+        n = 128 / TCG_TARGET_REG_BITS;
+        break;
+    default:
+        g_assert_not_reached();
+    }
 
-        if (n == 1) {
-            ts->type = type;
-        } else {
-            ts->type = TCG_TYPE_REG;
+    ts = tcg_temp_alloc(s);
+    ts->base_type = type;
+    ts->temp_allocated = 1;
+    ts->kind = kind;
 
-            for (i = 1; i < n; ++i) {
-                TCGTemp *ts2 = tcg_temp_alloc(s);
+    if (n == 1) {
+        ts->type = type;
+    } else {
+        ts->type = TCG_TYPE_REG;
 
-                tcg_debug_assert(ts2 == ts + i);
-                ts2->base_type = type;
-                ts2->type = TCG_TYPE_REG;
-                ts2->temp_allocated = 1;
-                ts2->temp_subindex = i;
-                ts2->kind = kind;
-            }
+        for (int i = 1; i < n; ++i) {
+            TCGTemp *ts2 = tcg_temp_alloc(s);
+
+            tcg_debug_assert(ts2 == ts + i);
+            ts2->base_type = type;
+            ts2->type = TCG_TYPE_REG;
+            ts2->temp_allocated = 1;
+            ts2->temp_subindex = i;
+            ts2->kind = kind;
         }
     }
 
+ done:
 #if defined(CONFIG_DEBUG_TCG)
     s->temps_in_use++;
 #endif
@@ -1359,7 +1362,6 @@ TCGv_vec tcg_temp_new_vec_matching(TCGv_vec match)
 void tcg_temp_free_internal(TCGTemp *ts)
 {
     TCGContext *s = tcg_ctx;
-    int k, idx;
 
     switch (ts->kind) {
     case TEMP_CONST:
@@ -1383,9 +1385,10 @@ void tcg_temp_free_internal(TCGTemp *ts)
     s->temps_in_use--;
 #endif
 
-    idx = temp_idx(ts);
-    k = ts->base_type + (ts->kind == TEMP_EBB ? 0 : TCG_TYPE_COUNT);
-    set_bit(idx, s->free_temps[k].l);
+    if (ts->kind == TEMP_EBB) {
+        int idx = temp_idx(ts);
+        set_bit(idx, s->free_temps[ts->base_type].l);
+    }
 }
 
 TCGTemp *tcg_constant_internal(TCGType type, int64_t val)
-- 
2.34.1


