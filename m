Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14296A6649
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:07:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCip-00044H-0L; Tue, 28 Feb 2023 22:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCiZ-0002Uq-VH
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:24 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCi8-0004F4-LL
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:00:58 -0500
Received: by mail-pl1-x629.google.com with SMTP id p6so11728374plf.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wY08qeKc21qRRHHHoTekg0Uc+uq0Eu7dfqAq4lwmGt0=;
 b=dMp/e76abok66rs6zx+vBEpLKzeE7WBon2rjXA3Z8ToVEH03kHYYIRwCn80Ty0QM9n
 Gs6xSQ3vTgqf3+o6MVkHrer/6R/wSo2l+Syv5Qz/1F0H1Mis7I5PkwmkUBMuu9gl9HIK
 EffvK2tGOu0dg2n/Z30DhGpf2tTKLBWSajXaJC5k/sct3xoeUlReGytVBeeOXAeiiCJ5
 kQUHsFEptwwHhNI8GCXQRI0PYLoW+hK/Zwg2+4861sPWUPrPtfr3CmgRUZufAWkzWeKd
 x/NfP36VZro9uOLAb5n7Bo11HIft+CZiMME9sZWFf6rCzmlwicu5ErsJ5fwF9uwx50EQ
 oYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wY08qeKc21qRRHHHoTekg0Uc+uq0Eu7dfqAq4lwmGt0=;
 b=jwvonndBB/nwlUIYd0DT81sursavVl3kR8KpebjOpt22jbeXUOsZby/Ce9uCSFdT+t
 gLvKF/Y+DvUCKsgeoooaRKW4kM6UiTdVrjTHQuAu6ClThU5rzwHwiup7E+A3nlqJ1kGO
 3Ah5WA3O179tZCvyEKs+qFJuYhkN6YJogKadx3Buu32CyMIGFfIchSetr9CJFlZz5QGC
 JrwpljSVarWlnB6QoltfmF/MPBnLgq+7AcZV5Y08PhjUrEd1WbTRTe4SUqDjnA7qRnBC
 bSUYtm/QlrSZ6pJtjpPI4G3f8D81FJmxCME4gU3a2koHjURMx+EOBgVXuzq2CUDjHWTE
 w43w==
X-Gm-Message-State: AO0yUKVwdbhn73YTsvU8c6NjhdbKAOJ5VNZog2dlssELQ6mEVupSF3Wg
 bdAg4b+JCPZFHWEJJX6F+CHswytNJz4sMGlYCu4=
X-Google-Smtp-Source: AK7set/vS5QrP02Bre69XwyNTc6LinW5rWv0VBz3YVpCXqY6QS5f04N3ojwZPauHpKnbAFhp+6t1bQ==
X-Received: by 2002:a17:902:e842:b0:19a:8ce1:2c55 with SMTP id
 t2-20020a170902e84200b0019a8ce12c55mr6657982plg.8.1677639655028; 
 Tue, 28 Feb 2023 19:00:55 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:00:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 40/62] tcg: Pass TCGTempKind to tcg_temp_new_internal
Date: Tue, 28 Feb 2023 16:56:21 -1000
Message-Id: <20230301025643.1227244-41-richard.henderson@linaro.org>
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
index 9be3632b94..8662f03ded 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1254,10 +1254,10 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
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
 
@@ -1340,7 +1340,7 @@ TCGv_vec tcg_temp_new_vec(TCGType type)
     }
 #endif
 
-    t = tcg_temp_new_internal(type, 0);
+    t = tcg_temp_new_internal(type, TEMP_EBB);
     return temp_tcgv_vec(t);
 }
 
@@ -1351,7 +1351,7 @@ TCGv_vec tcg_temp_new_vec_matching(TCGv_vec match)
 
     tcg_debug_assert(t->temp_allocated != 0);
 
-    t = tcg_temp_new_internal(t->base_type, 0);
+    t = tcg_temp_new_internal(t->base_type, TEMP_EBB);
     return temp_tcgv_vec(t);
 }
 
-- 
2.34.1


