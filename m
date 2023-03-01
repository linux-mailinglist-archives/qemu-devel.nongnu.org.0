Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C936A6634
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:06:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCio-00040L-OX; Tue, 28 Feb 2023 22:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCib-0002Xw-Du
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:25 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCiK-0004F4-Tv
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:10 -0500
Received: by mail-pl1-x629.google.com with SMTP id p6so11728829plf.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QOqj12NZ3gNRNBV2U+M0PKbEnSnQS1hXJwZ2GVjP+0c=;
 b=hMOIofZsltI/o5cfepXE7wyTAM2JkKzhoCsCQ6u8Hz+CSSlVsvubn2gD6xc34tgt7L
 w0A6OdaA0urJuwB9mi4Dk0cnSR8yDD7JBMQIB2s0zHHZvGnhODJ7WHJ3D8SALYD/LPFL
 9MHcM9o42LyOfrKpivoVk4C4BySmaL4VUtzQaLj+G1TsNIj5iTLb1lxkG5dysTAV0qax
 rKk3kbhdlIpOvG7i2rUXDA8HVj/ZTeQtzrqjSXdNU6ibGdTs2UcjMmBzOX8XzEV7IQDs
 lZykY15uOfC3taLTAtSTxQoRsSV6yfBHq/2B8M2zOlE20KVmQmavDS0zSk5Rnm8TOHkT
 plpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QOqj12NZ3gNRNBV2U+M0PKbEnSnQS1hXJwZ2GVjP+0c=;
 b=6L1hsPX+sYedO4w0SrdydnrmAakFq+Z2JHW1gP/+xb/TPI7cdCHFumuHOmGmV/PysO
 E1ZR+U6vXcJQ5ViRePlxxFqGQM9mt9VKr4Y2gEO06V4eNEKBrkfv9nl+hT9gqcwWOMt9
 4kr8OaA5zxVZOAikMIO0CB259+Zm4WnhgfArD6KFR4qunKcIhx1HYFd0ptKCEOQ9YYw2
 EzEeRUgm4Qz8yWeIYmimtwkiz5h19+n9dTgsXUvhbuW08nsXMncG/eKpxcr2XCNHoouI
 RJRT+a3gpxG78zRbLZgXcPvHqBCSRZbYKD1ZrKneWy3zYQ4Mfb+CGTXYZAs8w3OlMjrf
 99fg==
X-Gm-Message-State: AO0yUKVM4zFbLG2LovJgxwX1BdQBOZYGiD5JJIY5ACxkTioB9XI4QTjK
 yFps0gV/QblFLo5hT9DkR1GVQ/syvvVl4c90Qb4=
X-Google-Smtp-Source: AK7set9tcZsIams+VJD1AF830BlY6+yGyZw8gcynwL4HkcJg8j2o11qv500GR/mlpg3IYraZ/L9mMQ==
X-Received: by 2002:a17:903:1245:b0:19e:29ce:697f with SMTP id
 u5-20020a170903124500b0019e29ce697fmr5126482plh.41.1677639668089; 
 Tue, 28 Feb 2023 19:01:08 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:01:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 48/62] tcg: Don't re-use TEMP_TB temporaries
Date: Tue, 28 Feb 2023 16:56:29 -1000
Message-Id: <20230301025643.1227244-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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
index a54f93c858..7f4d2f1920 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1257,63 +1257,66 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
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
@@ -1358,7 +1361,6 @@ TCGv_vec tcg_temp_new_vec_matching(TCGv_vec match)
 void tcg_temp_free_internal(TCGTemp *ts)
 {
     TCGContext *s = tcg_ctx;
-    int k, idx;
 
     switch (ts->kind) {
     case TEMP_CONST:
@@ -1382,9 +1384,10 @@ void tcg_temp_free_internal(TCGTemp *ts)
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


