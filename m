Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884AB66131C
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 03:45:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELZj-0005EW-Np; Sat, 07 Jan 2023 21:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZZ-00058K-R2
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:11 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZ2-0004bP-V3
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:09 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 fz16-20020a17090b025000b002269d6c2d83so8701319pjb.0
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 18:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aqGBKhQ5AgkdFtp5J1OJW+jsP9G85axr6xXMVQ+qicY=;
 b=QefVl/VVnrGkxsT2QTgsW/LhAU89JsLZVSkjOSX/LreGzAMlXna4UQ6vk0EaHAX77q
 Ut637GZHonFO+qNseAieDkWh4xlO0pB4JW1VFT7ibxuJmB/bqZr2mbUAXbFzZv6CM0XF
 dddeCmSO8a/pZK4mKlyxODOK0EdO6X7X+Q+M5Yq/WOp/DzJ2bu7pO+cXBxrmXfZhCh5S
 nW2q2lYPj/x6q+RFePUII07bjK3nwkU+2YkoHbAN3CkoYCHf0NMLV5DoFAfLeJAAEQbe
 FgkHrJ5Dm4+UZjS+3jkKp2bc28ab2lvB8spjJQgkjcV7WwPmv1RXVDf7sWzN6z4LKPlM
 NRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aqGBKhQ5AgkdFtp5J1OJW+jsP9G85axr6xXMVQ+qicY=;
 b=Zuj8EIcNLKLL81O8WYsAkQInh+UHCU1ww0hII0pr6bA9eL1NL+0oZo9w7j0eSRBSEa
 w817ZLgbv2ifzkgBPaW/5xXdcsPJOMBiebPD1Lb2kegxL7kYFGa5FAMZc/djpltzUhCJ
 UvvnwOeQ1C67AA7BgihvY2U1V5yJ+OBkTn3j3MeDVKqKRreBrqAjtRQzifhzxeLVTxGn
 vFyMJTBwXDcvVT8sdJd3Q9HKJDUQ/IGLzkRsWZ5BTOGqjEOqEjRnNxvWDJpaVQ1gEpJS
 t92oLOn+XuckI/4QU4GmjLJ2cTCd+w+D3BFU4s/qZP5y6Q73gMy1wLTmQ5f+lPJPnxh2
 MEgg==
X-Gm-Message-State: AFqh2kpwSdic0VayrkJ8N4DQXGuy8WypdB4BXPH+hoXYr287YQ5/3Skt
 mhlkhCUaH+3fiLce79V7+xYsmce8NVJGVZjp
X-Google-Smtp-Source: AMrXdXvPx5V0nWs3XUZjBLeT0ki8TLbXHr+9q7xtTCl3hU+bSDtNoW+bFe6bjMROFXzto5wOqbxdSQ==
X-Received: by 2002:a17:902:a510:b0:192:48d1:f06c with SMTP id
 s16-20020a170902a51000b0019248d1f06cmr55734540plq.35.1673145455267; 
 Sat, 07 Jan 2023 18:37:35 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 13/36] tcg: Add temp allocation for TCGv_i128
Date: Sat,  7 Jan 2023 18:36:56 -0800
Message-Id: <20230108023719.2466341-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
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

This enables allocation of i128.  The type is not yet
usable, as we have not yet added data movement ops.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 32 +++++++++++++++++++++++++
 tcg/tcg.c         | 60 +++++++++++++++++++++++++++++++++--------------
 2 files changed, 74 insertions(+), 18 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 7d346192ca..a996da60b5 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -697,6 +697,11 @@ static inline TCGTemp *tcgv_i64_temp(TCGv_i64 v)
     return tcgv_i32_temp((TCGv_i32)v);
 }
 
+static inline TCGTemp *tcgv_i128_temp(TCGv_i128 v)
+{
+    return tcgv_i32_temp((TCGv_i32)v);
+}
+
 static inline TCGTemp *tcgv_ptr_temp(TCGv_ptr v)
 {
     return tcgv_i32_temp((TCGv_i32)v);
@@ -717,6 +722,11 @@ static inline TCGArg tcgv_i64_arg(TCGv_i64 v)
     return temp_arg(tcgv_i64_temp(v));
 }
 
+static inline TCGArg tcgv_i128_arg(TCGv_i128 v)
+{
+    return temp_arg(tcgv_i128_temp(v));
+}
+
 static inline TCGArg tcgv_ptr_arg(TCGv_ptr v)
 {
     return temp_arg(tcgv_ptr_temp(v));
@@ -738,6 +748,11 @@ static inline TCGv_i64 temp_tcgv_i64(TCGTemp *t)
     return (TCGv_i64)temp_tcgv_i32(t);
 }
 
+static inline TCGv_i128 temp_tcgv_i128(TCGTemp *t)
+{
+    return (TCGv_i128)temp_tcgv_i32(t);
+}
+
 static inline TCGv_ptr temp_tcgv_ptr(TCGTemp *t)
 {
     return (TCGv_ptr)temp_tcgv_i32(t);
@@ -860,6 +875,11 @@ static inline void tcg_temp_free_i64(TCGv_i64 arg)
     tcg_temp_free_internal(tcgv_i64_temp(arg));
 }
 
+static inline void tcg_temp_free_i128(TCGv_i128 arg)
+{
+    tcg_temp_free_internal(tcgv_i128_temp(arg));
+}
+
 static inline void tcg_temp_free_ptr(TCGv_ptr arg)
 {
     tcg_temp_free_internal(tcgv_ptr_temp(arg));
@@ -908,6 +928,18 @@ static inline TCGv_i64 tcg_temp_local_new_i64(void)
     return temp_tcgv_i64(t);
 }
 
+static inline TCGv_i128 tcg_temp_new_i128(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, false);
+    return temp_tcgv_i128(t);
+}
+
+static inline TCGv_i128 tcg_temp_local_new_i128(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, true);
+    return temp_tcgv_i128(t);
+}
+
 static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
                                               const char *name)
 {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index e9bb1f329f..2ab012a095 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1251,26 +1251,45 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
         tcg_debug_assert(ts->base_type == type);
         tcg_debug_assert(ts->kind == kind);
     } else {
+        int i, n;
+
+        switch (type) {
+        case TCG_TYPE_I32:
+        case TCG_TYPE_V64:
+        case TCG_TYPE_V128:
+        case TCG_TYPE_V256:
+            n = 1;
+            break;
+        case TCG_TYPE_I64:
+            n = 64 / TCG_TARGET_REG_BITS;
+            break;
+        case TCG_TYPE_I128:
+            n = 128 / TCG_TARGET_REG_BITS;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
         ts = tcg_temp_alloc(s);
-        if (TCG_TARGET_REG_BITS == 32 && type == TCG_TYPE_I64) {
-            TCGTemp *ts2 = tcg_temp_alloc(s);
+        ts->base_type = type;
+        ts->temp_allocated = 1;
+        ts->kind = kind;
 
-            ts->base_type = type;
-            ts->type = TCG_TYPE_I32;
-            ts->temp_allocated = 1;
-            ts->kind = kind;
-
-            tcg_debug_assert(ts2 == ts + 1);
-            ts2->base_type = TCG_TYPE_I64;
-            ts2->type = TCG_TYPE_I32;
-            ts2->temp_allocated = 1;
-            ts2->temp_subindex = 1;
-            ts2->kind = kind;
-        } else {
-            ts->base_type = type;
+        if (n == 1) {
             ts->type = type;
-            ts->temp_allocated = 1;
-            ts->kind = kind;
+        } else {
+            ts->type = TCG_TYPE_REG;
+
+            for (i = 1; i < n; ++i) {
+                TCGTemp *ts2 = tcg_temp_alloc(s);
+
+                tcg_debug_assert(ts2 == ts + i);
+                ts2->base_type = type;
+                ts2->type = TCG_TYPE_REG;
+                ts2->temp_allocated = 1;
+                ts2->temp_subindex = i;
+                ts2->kind = kind;
+            }
         }
     }
 
@@ -3359,9 +3378,14 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
     case TCG_TYPE_V64:
         align = 8;
         break;
+    case TCG_TYPE_I128:
     case TCG_TYPE_V128:
     case TCG_TYPE_V256:
-        /* Note that we do not require aligned storage for V256. */
+        /*
+         * Note that we do not require aligned storage for V256,
+         * and that we provide alignment for I128 to match V128,
+         * even if that's above what the host ABI requires.
+         */
         align = 16;
         break;
     default:
-- 
2.34.1


