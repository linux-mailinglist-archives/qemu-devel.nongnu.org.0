Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D093681C50
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:06:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbGQ-0000RN-KR; Mon, 30 Jan 2023 16:00:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGF-000058-93
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:19 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGB-0005U2-7C
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:18 -0500
Received: by mail-pl1-x62a.google.com with SMTP id 5so12994643plo.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwpLnuYCUpmcV4+JYwkmOkFpg7UmEeQL/zP2GZlbo7Y=;
 b=bKDRmcPTLhibQxqaeBplk9xLkwE9vVqKxKmCj4i7dmYQ+WIRg4LyalrbQfpmsWZ0aE
 /mZi3HAFIAoqhYbgeMmMVQFS+jLU9fDGosq/dt9nVsF1Vsy+mCPRF9/qKECllwDVzVgB
 7FKcYNZOtQqJdQW2fX0VzTv/OXY+pwcaTQwshVrrhXIqUHYlLamOoLHlOEECuQlTkAuB
 Byw7qniaatbawPh4GoMxaMYjfVzOB6EkWHosJMfgkQAPzFW1t5PlvqA+k0FjQDer3lzC
 zHAxngMW5MbdZgvJGDjY+gUaPll96q4Fm4FHowJluJxUHT5H6LRzSVEbP7qBsHYgXskL
 Y47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QwpLnuYCUpmcV4+JYwkmOkFpg7UmEeQL/zP2GZlbo7Y=;
 b=kdPC9Sj2cSOd9XxYnOy5X/CD66Yw4Tvg4lXY3VBzBTQAheapNQByQEu4Xa/V+uLE7D
 VxQvo1JKkGhYf4TLioM2pfPWa6jbS6+ye+k4dnKuRRn0+m9Sz68oRG3ovtBB6t7gJdnU
 C4tnGgq994k19pwYtm2YZJaYH7MeuHvcuy1Yd/y6t3anHaxiZ8mf7LRhIMs+fbBCNyta
 ymj1KteX0PxkwYwJv8Ymf+y6/ibYu2cmdYm63CjmuGtpOJoSG7O4CP9/uyfu+Wvlg75G
 XxnTME9oO7MlbSkUKUYBAhQPF2tNN27dsvtEvcNhOkyYm0I9OZ20EyeTHpnEhT2q+CL9
 X4jQ==
X-Gm-Message-State: AO0yUKWJFJVIwoyZCJki0aCxoAbJoyLE925wc3u3cugK5GUCmkzRcmLK
 9+EOZeIW+ER1hYtajGhrmkQi9TQHbqr/q9xS
X-Google-Smtp-Source: AK7set/+KKiUlQqGg5DshQ354PYYT/xeM0hsZQ5giiW7qxj3YWT4qpQm7EnyEfp5xDuUWln9FPoQ9A==
X-Received: by 2002:a17:903:244f:b0:196:4643:e1eb with SMTP id
 l15-20020a170903244f00b001964643e1ebmr21248035pls.36.1675112412836; 
 Mon, 30 Jan 2023 13:00:12 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.13.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:00:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 20/27] target/hppa: Don't use tcg_temp_local_new
Date: Mon, 30 Jan 2023 10:59:28 -1000
Message-Id: <20230130205935.1157347-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

This wasn't actually used at all, just some unused
macro re-definitions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 0102cf451b..cee960949f 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -35,7 +35,6 @@
 #undef TCGv
 #undef tcg_temp_new
 #undef tcg_global_mem_new
-#undef tcg_temp_local_new
 #undef tcg_temp_free
 
 #if TARGET_LONG_BITS == 64
@@ -59,7 +58,6 @@
 
 #define tcg_temp_new         tcg_temp_new_i64
 #define tcg_global_mem_new   tcg_global_mem_new_i64
-#define tcg_temp_local_new   tcg_temp_local_new_i64
 #define tcg_temp_free        tcg_temp_free_i64
 
 #define tcg_gen_movi_reg     tcg_gen_movi_i64
@@ -155,7 +153,6 @@
 #define TCGv_reg             TCGv_i32
 #define tcg_temp_new         tcg_temp_new_i32
 #define tcg_global_mem_new   tcg_global_mem_new_i32
-#define tcg_temp_local_new   tcg_temp_local_new_i32
 #define tcg_temp_free        tcg_temp_free_i32
 
 #define tcg_gen_movi_reg     tcg_gen_movi_i32
-- 
2.34.1


