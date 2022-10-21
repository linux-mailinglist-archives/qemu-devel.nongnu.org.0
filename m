Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43156607321
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 10:59:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnsU-0005MR-6j
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:59:43 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmIJ-0003ig-7k
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmI7-0003Tb-4S
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:18:03 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmI5-0005vu-1i
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:18:02 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 67so1768210pfz.12
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PgG5Fqrssx+hkjV71ieV43u3E3Admzr0DyJnKERg/wk=;
 b=uTjEO3S+5D2iCzyR9gxlKziNgg/CVVxBavm+mGgXMCLCOw8k19pHpw7VemSUDD1sVd
 6WzWgZ6/1oPuEkiGg/OQluP9Ctd5Evs3dNHJKKv+AXtdzhhnHyuk1rRuZcsA+IJM0pgU
 6ZsDetv0Z7G7YmyaW6wbfxP68wbdjsrrKP4q2lRzKw0UfNcHDUGuIX0jNa5MwYy1Ft1v
 Wzf6C0qsdDKPQI97g582jw1rRmX2I23ym2Vt1oOBTXEGDX4kny6Vt2Th3MZTW8W5adT5
 jFjECOeOy1mAkZbwvBwDmoh6f0NduRGVUWwbO/xfMz/cBaaIMLRFNQuSpM7PylXopFxn
 gsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PgG5Fqrssx+hkjV71ieV43u3E3Admzr0DyJnKERg/wk=;
 b=lbrdpp8BFpm3gqi5857h4ruOfLqbpRXNC8tfj/ash/EbtKP8QuI4qXpBR+43JumWyB
 OR1IDCYnVc9DJI7Kz/ScW+0M4GhYgCP+i5YQUMBQh4I9TYiLYvaaGfhOeK9EmHmtUzF8
 OrX6U2liLFS9OFUSPeQexKrkdts2hMhdaHuf0SCZuhYGYu18nYBtNsETiD/BkQqJggE8
 +uwaW15JtMqQBavgC53cs09l671LkAIXu6uOBv8sPeLZQuIowaKGgp5gytmUzxfjdLPm
 oYWCfR/DFVzAEtkX+rbELQ9+lWTX6YiVOzkj4akJAkX8rkfvcb+dsFzZgNYrCoxq0LS+
 UOPA==
X-Gm-Message-State: ACrzQf2xHzuyxjvVn5HlpMQV61A/i40eZDODw/KlkXEKClYIq/87ZfAG
 PrWc9BsPeFRfd4ott7ekpwNNSVSuNfImIGog
X-Google-Smtp-Source: AMsMyM4tAS36muBNk+er0pd2SQzmFntHouV1gGH1AYJC7Vim9T51qZ5SfeYgPuN1fsbJupB97KuPpw==
X-Received: by 2002:a63:5703:0:b0:439:14a8:52b with SMTP id
 l3-20020a635703000000b0043914a8052bmr14521561pgb.500.1666336679704; 
 Fri, 21 Oct 2022 00:17:59 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 35/36] tcg: Add temp allocation for TCGv_i128
Date: Fri, 21 Oct 2022 17:15:48 +1000
Message-Id: <20221021071549.2398137-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
 include/tcg/tcg.h | 32 ++++++++++++++++++++++++++++++++
 tcg/tcg.c         | 32 +++++++++++++++++++++++++++-----
 2 files changed, 59 insertions(+), 5 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 88fb4f1d17..db2e10610d 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -701,6 +701,11 @@ static inline TCGTemp *tcgv_i64_temp(TCGv_i64 v)
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
@@ -721,6 +726,11 @@ static inline TCGArg tcgv_i64_arg(TCGv_i64 v)
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
@@ -742,6 +752,11 @@ static inline TCGv_i64 temp_tcgv_i64(TCGTemp *t)
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
@@ -864,6 +879,11 @@ static inline void tcg_temp_free_i64(TCGv_i64 arg)
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
@@ -912,6 +932,18 @@ static inline TCGv_i64 tcg_temp_local_new_i64(void)
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
index 7cde82f12d..adf592ac96 100644
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


