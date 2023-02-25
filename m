Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F756A2806
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:01:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqPY-0000Qc-5S; Sat, 25 Feb 2023 04:00:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPW-0000Pw-4H
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:06 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPU-0004re-8w
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:05 -0500
Received: by mail-pf1-x432.google.com with SMTP id n5so812926pfv.11
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/CRGrAXoy0I0U2f47XrfnXHSDepPYdq71QllQBa+J0=;
 b=m3+siJukSfr2ktfNyYQV0pVIqH4Zj02JJ7RUq2CIu7uVssMf4weQX2/G3uP2Y6fchV
 a7GdDDXYjiretVX6d6RewpuvdYeTRaYkTvPTxGCfNHJhqFHodU6ICM1il2tg486zA70T
 yP0uwJmxLr6zR1DsW3NsGBlGsRYZrhU7SdIoIMpwV9ikOLfeXWzzuZpNxaEIM7F6ua+M
 ZdhA1yLzRxDltksnURaFWLSMo8wvud8ltcIfZzpaSg5yaLcAD+lldn09A3Y1jeJ2prHC
 0dy206re6Fr+Jg1wDnNi9NpaP7Xt5yD1AqcKscyKvL3vehzTTfvZPCWxtw9K368FJRfF
 vh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L/CRGrAXoy0I0U2f47XrfnXHSDepPYdq71QllQBa+J0=;
 b=H3QjsrYPQt4dKKRGMga97fgpE3pCnU9z5bWGYluhxjzOHMLmUBFunq1sN9arFaNCgs
 RFCzlRxt5vFYxUiVL23n0ctp0wGo7hRKUMr3SeA6L1zjf1Ke5px3e+eMCAkyRijI2hxW
 eSwaOqlbXnSSKhUBFXuZ0XoSQJIuBNq++dAo8KK68AcCJn+liJjdsKasi99cFZcpHiLt
 AkMvcaxoP5APGydsodFTIygUq43SlAEeSD9M4VhJuRGjXpF1fejZKD4Ceg8fed21x8J8
 I/MdaZx1iJLl9t+/JPYZs0ZjSrs3B5lh4XHSGRojgResa3iTHmCAIuiND1cH9Ooins4c
 0akg==
X-Gm-Message-State: AO0yUKXSzYvv6lzm0xsrO4bPtcrSGvWizagRpItMsKbfm/COlimgZYgJ
 dMmqKfBLwVLmd7AjNva1MzNh2qgtRw7KWsKh8gk=
X-Google-Smtp-Source: AK7set+BV2lGvAH3rsGefxRIX190NVevU5EBXIx1rMhCPZVtm3PKBJbRzEJ9O4tZpdlpMngfbCda+w==
X-Received: by 2002:aa7:9715:0:b0:5dc:e03d:b95 with SMTP id
 a21-20020aa79715000000b005dce03d0b95mr8509280pfg.12.1677315602890; 
 Sat, 25 Feb 2023 01:00:02 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 09/30] tcg: Pass TCGTempKind to tcg_temp_new_internal
Date: Fri, 24 Feb 2023 22:59:24 -1000
Message-Id: <20230225085945.1798188-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
index 7ffd4a4f28..e09ef46b85 100644
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


