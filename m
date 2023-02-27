Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63826A3AC5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:47:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWE1-0006fe-8G; Mon, 27 Feb 2023 00:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWD3-0003Nb-NE
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:38:08 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCz-0002qQ-8m
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:38:00 -0500
Received: by mail-pl1-x62d.google.com with SMTP id v11so2023404plz.8
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yzfn6SwReNHYrs90SleSmiPQOxaudqzmn6c62VzQnAs=;
 b=ldr53H7oVSDHYuoh0pMMrd9XDW2g1l3KMuEfa6qVejtVsdhog4ySBkAsP0FvK4C784
 MITsBb9I6wG0H2JfuuwJT3hfN+M+NW/6NrRrq0Dt7N3roU647k4gcm9XPvs5r9LpRwux
 Dp7cq4h9aD1009OzJFL/drNo+gR+WEKlTmxBGINLgkHiy8xsfc2yHJdEz1CtIJFhdeqQ
 MXXkDO55kjZQ9H8hNVkw4l3m9IPEV0JzYN8fucy4x9Sem3iavlw+U1YSlIzaN4vLv/k7
 fYs2O8fiNupqr0vW+xGhjRNetoaiy0W/5vq3eB76FEV2jc+TiMg/G63v7IuVpMjrYekj
 8ANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yzfn6SwReNHYrs90SleSmiPQOxaudqzmn6c62VzQnAs=;
 b=aSnQeRrPEkRsaT3Pa+ns7wFXWk1+wwwuirKuLN4wqO0sUok4HyUj0Oj4uGzEimQgAI
 xRZrpqWGN7pu8gyu4iSMrWrpLiRKqjSEckTmLxWspu/6DCMMxOedDq9JNaB42d5jdJg8
 PBCjsqNPxcvH423L725cBDRrJuOdECea6jnX0GaCEX9k8Rkxf7YkZlEimpQHeYxFsNDA
 5nV0APS1iYm+cU1FJQatTy3nGl2H5c5UpUy/WvI9RUO9LaXDaVsuQwXkinwwO5Lcaacl
 V2+gjYf04zSea8mJSwd07RL4w1Ng4/ocU35pcoWrERAOrqzKYjmM1wtub5Bd4JRDhbxq
 AlfQ==
X-Gm-Message-State: AO0yUKUCQS8vtn+MDzGpOdj0T0xhxZlzd6kSWLLt6dJQXKunhsbWLHxe
 fEhnJ6Z7D06+9VeSRaWM9MWXOgijEKXrlKSONYY=
X-Google-Smtp-Source: AK7set8MnRvuSu4xUHz+jUdmiAg/wiS7lCCu5L2iFKOGc9+3TwfQfb9vjftvC7xZcDMiBof/PLqS0w==
X-Received: by 2002:a05:6a20:8ec5:b0:cc:f27d:eb83 with SMTP id
 m5-20020a056a208ec500b000ccf27deb83mr4868937pzk.53.1677476273331; 
 Sun, 26 Feb 2023 21:37:53 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v4 17/31] tcg: Don't re-use TEMP_TB temporaries
Date: Sun, 26 Feb 2023 19:36:47 -1000
Message-Id: <20230227053701.368744-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


