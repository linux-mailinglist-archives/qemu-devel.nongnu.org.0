Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3781360615F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:19:45 +0200 (CEST)
Received: from localhost ([::1]:41122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVSZ-00017n-BJ
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:19:43 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVN2-0007kv-18
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU8K-0005aH-Dz
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:59 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:37856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU8I-00019o-6J
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:43 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 f9-20020a17090a654900b00210928389f8so3234772pjs.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OAZD4QBJGhiyOPEOc0OMuiwabfJARYkQ0jeoggD+zCs=;
 b=aKDf7PAxV3m1723avZ6WOpc35Hr4XAv+cQK6Qp59kizzy01bmDw4bvIpTf5+XGFq1C
 qLgXfCnQQr0xZOuaZd7kU53LHhzuNgYjtL4gF7uyFl6DDt8CEVmgQ+n0VnR6yfhBozOc
 90daZDGy5PFmMcq+VpbYS6hhUXmuhC2mCpPMasuHgFJNxxBXXhYqRKzKSAhL5tXT7Vot
 EoAJ1AYNKvgC9r2CeldFznwJUULvN1haXWv+C1/ZHbdS6vsqpd7f9CNXFDqItbA5fxR5
 ofc0hPzpfUHw+x3hA1HTNhdRh1sYXRDXywjSbaD+WlNnccs5bJZU4ZY/lowZxH4gqJYE
 BYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OAZD4QBJGhiyOPEOc0OMuiwabfJARYkQ0jeoggD+zCs=;
 b=O6fV7yqVNeDlpeXWpPOCAjTvy1ciYLCMBlycqKBf1rqu92BuE27XMYRkx9NqNpZKfc
 HdyyZqIzGgJjIthA39A25eFv7CMwrNSCjvXKgS43FxE0ll23D+tNey3QPRrMvTvzqay7
 yUbhrUImRuERbdO4wMF+g3GYoNnym5XgDAmCeQkdp9Fj6J1BelcPLBhxyg2vKEBdnkAr
 sBFC4NCtsnwALTRO6yPDCut8aPSpDmVMlLGKjelPskTL4W0a1ymLP4kRq/B3fTW4mcPZ
 9P2y/isreXIG/klFhartf8JBpSXAlERY5iqcq07u4DuYZSWwi7p5esJcZ65GuC9mopzY
 z+MQ==
X-Gm-Message-State: ACrzQf1j5BCMTEmyZD72+Q/ok41jqCcItZAgvu0lw2M08uLFvEWvfN7I
 25eMADrR71AgdmoNheaSuHjniKqA6KzC6k7I
X-Google-Smtp-Source: AMsMyM59w8CdbC6aqGvza5TCAIEUbeae0MYbsV6EGtSEu5xkNVH7tG9bbSspHmTSyUYGr0gLiOjmJg==
X-Received: by 2002:a17:90a:bb94:b0:209:618f:46ac with SMTP id
 v20-20020a17090abb9400b00209618f46acmr52330279pjr.240.1666266880486; 
 Thu, 20 Oct 2022 04:54:40 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.54.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:54:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/31] tcg: Add temp allocation for TCGv_i128
Date: Thu, 20 Oct 2022 21:52:41 +1000
Message-Id: <20221020115242.2301066-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This enables allocation of i128.  The type is not yet
usable, as we have not yet added data movement ops.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h    | 32 ++++++++++++++++++++++++++++++++
 tcg/tci/tcg-target.h |  3 +++
 tcg/tcg.c            | 32 +++++++++++++++++++++++++++-----
 3 files changed, 62 insertions(+), 5 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index e80c78b2e8..185408935b 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -695,6 +695,11 @@ static inline TCGTemp *tcgv_i64_temp(TCGv_i64 v)
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
@@ -715,6 +720,11 @@ static inline TCGArg tcgv_i64_arg(TCGv_i64 v)
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
@@ -736,6 +746,11 @@ static inline TCGv_i64 temp_tcgv_i64(TCGTemp *t)
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
@@ -858,6 +873,11 @@ static inline void tcg_temp_free_i64(TCGv_i64 arg)
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
@@ -906,6 +926,18 @@ static inline TCGv_i64 tcg_temp_local_new_i64(void)
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
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 94ec541b4e..9d569c9e04 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -161,10 +161,13 @@ typedef enum {
 #if TCG_TARGET_REG_BITS == 32
 # define TCG_TARGET_CALL_ARG_I32        TCG_CALL_ARG_EVEN
 # define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_EVEN
+# define TCG_TARGET_CALL_ARG_I128       TCG_CALL_ARG_EVEN
 #else
 # define TCG_TARGET_CALL_ARG_I32        TCG_CALL_ARG_NORMAL
 # define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_NORMAL
+# define TCG_TARGET_CALL_ARG_I128       TCG_CALL_ARG_NORMAL
 #endif
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 #define HAVE_TCG_QEMU_TB_EXEC
 #define TCG_TARGET_NEED_POOL_LABELS
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 352175afcd..c6e856a2cc 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1250,18 +1250,39 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
         tcg_debug_assert(ts->base_type == type);
         tcg_debug_assert(ts->kind == kind);
     } else {
+        bool want_pair = false;
+        TCGType half = type;
+
+        switch (type) {
+        case TCG_TYPE_I32:
+        case TCG_TYPE_V64:
+        case TCG_TYPE_V128:
+        case TCG_TYPE_V256:
+            break;
+        case TCG_TYPE_I64:
+            half = TCG_TYPE_I32;
+            want_pair = TCG_TARGET_REG_BITS == 32;
+            break;
+        case TCG_TYPE_I128:
+            half = TCG_TYPE_I64;
+            want_pair = TCG_TARGET_REG_BITS == 64;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
         ts = tcg_temp_alloc(s);
-        if (TCG_TARGET_REG_BITS == 32 && type == TCG_TYPE_I64) {
+        if (want_pair) {
             TCGTemp *ts2 = tcg_temp_alloc(s);
 
             ts->base_type = type;
-            ts->type = TCG_TYPE_I32;
+            ts->type = half;
             ts->temp_allocated = 1;
             ts->kind = kind;
 
             tcg_debug_assert(ts2 == ts + 1);
-            ts2->base_type = TCG_TYPE_I64;
-            ts2->type = TCG_TYPE_I32;
+            ts2->base_type = type;
+            ts2->type = half;
             ts2->temp_allocated = 1;
             ts2->temp_subindex = 1;
             ts2->kind = kind;
@@ -2773,7 +2794,7 @@ static void la_cross_call(TCGContext *s, int nt)
 
     for (i = 0; i < nt; i++) {
         TCGTemp *ts = &s->temps[i];
-        if (!(ts->state & TS_DEAD)) {
+        if (ts->type != TCG_TYPE_I128 && !(ts->state & TS_DEAD)) {
             TCGRegSet *pset = la_temp_pref(ts);
             TCGRegSet set = *pset;
 
@@ -3404,6 +3425,7 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
     case TCG_TYPE_V64:
         align = 8;
         break;
+    case TCG_TYPE_I128:
     case TCG_TYPE_V128:
     case TCG_TYPE_V256:
         /* Note that we do not require aligned storage for V256. */
-- 
2.34.1


