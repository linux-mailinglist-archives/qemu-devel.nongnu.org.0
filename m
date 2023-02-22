Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB4569FF88
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:31:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWN-0000RN-L1; Wed, 22 Feb 2023 18:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWL-0000Qm-6d
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:33 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWJ-0005K7-Is
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:32 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso2871143pjv.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VjZP4LY1Wxefy+0rLrks1q4QR8IjH+TMsA5bjteWWKA=;
 b=TimWdTiw/3U7ur/tP9E6ByhNdznVb1WA8KiiVMq/kaurolfDyY5+m3A+Lf2gs/7tDE
 go0gPGxvxpixEZPzKFkLVeEgVAR0F3IlBdtSvZpzkwaNQxb5EAPq0y8ithqpkMaLByCw
 nGjISBR3+lmoNHM3xzz7KMGlTL87TimYQBxvIMzNL+882/0pIK0Xa9uWpiAlV2bkS/iU
 fekxBItZUHUD/U2XCwvHkDOX8jghojbYMJSTAp2YfNlYL2Z+LRuh8eioGmstfQ8uoXp/
 1vun04FJAh04gFoZEiL57ezx6CTg4nxfKQJ9+xz54P/YNzTlJsioK10APHv2Eudx5V1q
 xhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VjZP4LY1Wxefy+0rLrks1q4QR8IjH+TMsA5bjteWWKA=;
 b=ElKJOTEyZXTnhtKGMRFAsKToS1VNyeZ41ZLvPr0WWSwzbEzcYQmAG2o/w4Jg0G99UW
 qhi/qSroTreoPaZ2OXC7FAV9sWGqyWwwPSlVgPVS1kZIVYblkin7mnGHqLq1KxEYEf8e
 /FesVvyuMoA3hVfTgD1lGv32NX6wzR0iqZOhbuNHBSIDzJlSmGhdPb4qEXwb9+Qm0Bnv
 9u4/1qNGTVqSjWY59RXQhneyu3+4F3BUFSMqExIoUGXv/cryQFQnGEFdn6N7S1SyR4eb
 un0hUxHPnjzGRolwcs7EgTm2rdlQi5o63QVCbbvPaUSMzho4DmYagafidFlNQOBDSU1H
 uMFw==
X-Gm-Message-State: AO0yUKXYeV9y1+8VqTj30Ds5YOGjMlpQEUVFfb/EZr+55p/7SrKEekgF
 DFbbxfgaCMR7zx6XGfA5VKF+MfF7a1IZlDIakgM=
X-Google-Smtp-Source: AK7set9D3xBZh+MPBBbycZv+uZZ1FCa1Gq0eUf1EcJmRMgYkv639xWLpR9kJLGaq3rOJN4S1G7JSwA==
X-Received: by 2002:a17:90b:4ac5:b0:22b:f0d4:9e1e with SMTP id
 mh5-20020a17090b4ac500b0022bf0d49e1emr8880107pjb.8.1677108450093; 
 Wed, 22 Feb 2023 15:27:30 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/28] tcg: Add tcg_temp_ebb_new_{i32,i64,ptr}
Date: Wed, 22 Feb 2023 13:26:56 -1000
Message-Id: <20230222232715.15034-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FUZZY_BITCOIN=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

TCG internals will want to be able to allocate and reuse
explicitly life-limited temporaries.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 8d896bcbf4..0c2041bcf7 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -892,6 +892,13 @@ static inline TCGv_i32 tcg_global_mem_new_i32(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_i32(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
+    return temp_tcgv_i32(t);
+}
+
 static inline TCGv_i32 tcg_temp_new_i32(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
@@ -911,6 +918,13 @@ static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_i64(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
+    return temp_tcgv_i64(t);
+}
+
 static inline TCGv_i64 tcg_temp_new_i64(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
@@ -923,6 +937,13 @@ static inline TCGv_i64 tcg_temp_local_new_i64(void)
     return temp_tcgv_i64(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
+    return temp_tcgv_i128(t);
+}
+
 static inline TCGv_i128 tcg_temp_new_i128(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
@@ -942,6 +963,13 @@ static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_ptr(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
+    return temp_tcgv_ptr(t);
+}
+
 static inline TCGv_ptr tcg_temp_new_ptr(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
-- 
2.34.1


