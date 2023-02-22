Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C6669FF73
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:28:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWL-0000Qj-0q; Wed, 22 Feb 2023 18:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWJ-0000Q8-Ql
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:31 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWI-0005Jg-2o
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:31 -0500
Received: by mail-pl1-x636.google.com with SMTP id s5so10720393plg.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Jx8uQBKUHFDOWNE+SgDRUOnSf90ewk9OLxtw3FyGaI=;
 b=GvrAXpQHMNN7jOctxkaIZjpe5DoJq5gj3flFQkqHshNrq7eN17IpKKmhLaXo+nvbsC
 Evg0Ip60z5p2RBCnM7dVt8TNqwZZ/c/la6Ud4bh4o3m7Zlf32ycmelM++8BRpCm5igkW
 PLLwtD4GL6iM9Ji4n+oEEfFkzB/o5ndPinIylx315oNnKvZxRlZ6xYLPJAsqczECYLnF
 v0J5H12yWiAma26C1lmnqBIMvUigE1oxo8vrkWnOzvpSfEiV0RtvHT1kezf03AwU2n5I
 97Ext37XibIL5NwclRF5Mpnc9kTM1QwH8F/OcGa7pS1KDoa1bJ+nTND6Kc0BokfIm9bU
 aMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Jx8uQBKUHFDOWNE+SgDRUOnSf90ewk9OLxtw3FyGaI=;
 b=GvSKla8nd8X1su61p8hIiFV2wzbv5gEVmBs2rtoXE7CgWFzaE7rbzIobJT/gFsqZ4O
 g+rpRpfaHtEJWHwHdj+dkJCjUS/x4tfqpdLdp9gNxqedd9iSykaCXMX7ttIh12pJ8a/a
 NT2mMta+6SLEHIn3rayVtwfwQNcZMID7dgQW0F4oHN4dz/mJHx5WKmZ2QduZa6i9853+
 3dFvMqQnNbUM+sYLhnlW5Q+I5qR+I5cbQ4ylnt45Dwm9glA1x0q9zK2TLuIs20c6KIFy
 QWERU9G6zeVVySJdydrgHw5Crd3pR5wHCe1G5ezx1rCMs0e1sZpKGxHaexXPLGAGmIrO
 +wDg==
X-Gm-Message-State: AO0yUKXjq7cqZ3TjlDTCQTVmj0FcntnO6Lp2R9/y3OsPu7gC1+Hiany2
 bcAqMDYbY/Hkmf1Wnsc3IFWyTnhVhjYpFZs/Pqw=
X-Google-Smtp-Source: AK7set/I3Ko/4h9UNEi5QXwRkSHQIiGwyVkaVvGfpshwUYrfq0Y3APxJ4ApC16QCTyA+ogdS9uYZAQ==
X-Received: by 2002:a05:6a20:3d27:b0:bf:58d1:ce86 with SMTP id
 y39-20020a056a203d2700b000bf58d1ce86mr10078862pzi.5.1677108448716; 
 Wed, 22 Feb 2023 15:27:28 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 08/28] tcg: Pass TCGTempKind to tcg_temp_new_internal
Date: Wed, 22 Feb 2023 13:26:55 -1000
Message-Id: <20230222232715.15034-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

While the argument can only be TEMP_EBB or TEMP_TB,
it's more obvious this way.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 18 +++++++++---------
 tcg/tcg.c         |  8 ++++----
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 02d5cfc049..8d896bcbf4 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -855,7 +855,7 @@ void tcg_set_frame(TCGContext *s, TCGReg reg, intptr_t start, intptr_t size);
 
 TCGTemp *tcg_global_mem_new_internal(TCGType, TCGv_ptr,
                                      intptr_t, const char *);
-TCGTemp *tcg_temp_new_internal(TCGType, bool);
+TCGTemp *tcg_temp_new_internal(TCGType, TCGTempKind);
 void tcg_temp_free_internal(TCGTemp *);
 TCGv_vec tcg_temp_new_vec(TCGType type);
 TCGv_vec tcg_temp_new_vec_matching(TCGv_vec match);
@@ -894,13 +894,13 @@ static inline TCGv_i32 tcg_global_mem_new_i32(TCGv_ptr reg, intptr_t offset,
 
 static inline TCGv_i32 tcg_temp_new_i32(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, false);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
     return temp_tcgv_i32(t);
 }
 
 static inline TCGv_i32 tcg_temp_local_new_i32(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, true);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_TB);
     return temp_tcgv_i32(t);
 }
 
@@ -913,25 +913,25 @@ static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
 
 static inline TCGv_i64 tcg_temp_new_i64(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, false);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
     return temp_tcgv_i64(t);
 }
 
 static inline TCGv_i64 tcg_temp_local_new_i64(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, true);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_TB);
     return temp_tcgv_i64(t);
 }
 
 static inline TCGv_i128 tcg_temp_new_i128(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, false);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
     return temp_tcgv_i128(t);
 }
 
 static inline TCGv_i128 tcg_temp_local_new_i128(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, true);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_TB);
     return temp_tcgv_i128(t);
 }
 
@@ -944,13 +944,13 @@ static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
 
 static inline TCGv_ptr tcg_temp_new_ptr(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, false);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
     return temp_tcgv_ptr(t);
 }
 
 static inline TCGv_ptr tcg_temp_local_new_ptr(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, true);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_TB);
     return temp_tcgv_ptr(t);
 }
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index f52e9baf83..bbae9d493b 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1255,10 +1255,10 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
     return ts;
 }
 
-TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
+TCGTemp *tcg_temp_new_internal(TCGType type, TCGTempKind kind)
 {
     TCGContext *s = tcg_ctx;
-    TCGTempKind kind = temp_local ? TEMP_TB : TEMP_EBB;
+    bool temp_local = kind == TEMP_TB;
     TCGTemp *ts;
     int idx, k;
 
@@ -1341,7 +1341,7 @@ TCGv_vec tcg_temp_new_vec(TCGType type)
     }
 #endif
 
-    t = tcg_temp_new_internal(type, 0);
+    t = tcg_temp_new_internal(type, TEMP_EBB);
     return temp_tcgv_vec(t);
 }
 
@@ -1352,7 +1352,7 @@ TCGv_vec tcg_temp_new_vec_matching(TCGv_vec match)
 
     tcg_debug_assert(t->temp_allocated != 0);
 
-    t = tcg_temp_new_internal(t->base_type, 0);
+    t = tcg_temp_new_internal(t->base_type, TEMP_EBB);
     return temp_tcgv_vec(t);
 }
 
-- 
2.34.1


