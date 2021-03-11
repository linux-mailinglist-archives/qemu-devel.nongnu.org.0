Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F493368A3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:31:16 +0100 (CET)
Received: from localhost ([::1]:52028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9ER-00082U-NK
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95g-0004fa-Vb
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:12 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:41402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95c-0001Kf-7G
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:12 -0500
Received: by mail-oi1-x22b.google.com with SMTP id y131so18360497oia.8
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=36uzHkl7+IX2hopk8rVzdZIi+gPh2gDVUz4jl8wQF7M=;
 b=ADhtVdMl0V6DD1DqDevtc0nxPpMyDW2sGCw6uNTSL1TGtLdwCJnJGtGmODOeN0ak1A
 Z4ipYV2j+0tcLakD3RNm9eXgA0U2boKBbV9SWyQ4FGSSkWNUH7vTWb1yk3Pnkm0yrsJT
 ChAsVfReenzKNx9I9MTyiX8KD8V37m6KYXPjeCEfAq/0nz9RgVhHxGhKctyEltTs2njg
 4xgilhP3u4qDbz5gBHQc386p32ELLxgkf6JgrPMbeJcZNf1qtjW/ZEraf7WeK8wbgnRw
 qoYmhdjhTL1XZsaKkkJERRrYd4kMvqiPijqvVgMvHr2YILhqOQuZU74rV5708C6x89JE
 rMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=36uzHkl7+IX2hopk8rVzdZIi+gPh2gDVUz4jl8wQF7M=;
 b=SnsuMb2TBQ8tXOqmj05GSqK61YqLv8UEVA9pSS0iWyWktJ6tBwGIkhQ268/pXWbMeN
 8vfXL9wdYAEsMNU7Mr+LsBMk11RYa1RosD5DVeVMMHPhxDbaWdJzgY4Nxb7LD+sxwwUN
 C1lNDvB/9YZPyC1gDk/1pkxjoy+VdNMPDv3/JQuOC05w07ko034P28EGOJ0SmCdSEMG6
 VS8hlsfNmVGFKScuiaTm4NqYU/mLJUlecziQ1URjl7gfUSkHTA/c7yf8mRH2izeqDeCm
 m+iiRS7zPteKJXS+2DbVFmE0sFqof/5gLg663F8M8RDnQOrr/9seAgzjX0Iqr4hPWG10
 DouQ==
X-Gm-Message-State: AOAM530OrDxXwrxYRFkkWd+UiI7dxdjuFCm/NhZC+ffYaCctJFXSghlc
 Hs0BM+ssMDBKf1JfvZJltcwgPfFivARMwioS
X-Google-Smtp-Source: ABdhPJydrj8LiHE5jzK3y6V/r2c+96PpAwdKP8icu0DiCgSbqT81cVbBLJTNP7gUI6tvB4ubigUcNA==
X-Received: by 2002:aca:4e55:: with SMTP id c82mr4263801oib.43.1615422126944; 
 Wed, 10 Mar 2021 16:22:06 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/26] tcg: Split out tcg_region_initial_alloc
Date: Wed, 10 Mar 2021 18:21:36 -0600
Message-Id: <20210311002156.253711-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This has only one user, and currently needs an ifdef,
but will make more sense after some code motion.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 2b631fccdf..3316a22bde 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -726,6 +726,15 @@ static void tcg_region_initial_alloc__locked(TCGContext *s)
     g_assert(!err);
 }
 
+#ifndef CONFIG_USER_ONLY
+static void tcg_region_initial_alloc(TCGContext *s)
+{
+    qemu_mutex_lock(&region.lock);
+    tcg_region_initial_alloc__locked(s);
+    qemu_mutex_unlock(&region.lock);
+}
+#endif
+
 /* Call from a safe-work context */
 void tcg_region_reset_all(void)
 {
@@ -957,9 +966,7 @@ void tcg_register_thread(void)
     }
 
     tcg_ctx = s;
-    qemu_mutex_lock(&region.lock);
-    tcg_region_initial_alloc__locked(s);
-    qemu_mutex_unlock(&region.lock);
+    tcg_region_initial_alloc(s);
 }
 #endif /* !CONFIG_USER_ONLY */
 
-- 
2.25.1


