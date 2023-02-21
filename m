Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E2769E373
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:32:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUbS-0002hE-Me; Tue, 21 Feb 2023 10:30:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUUb4-0002GC-Td
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:30:26 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUUb2-0000Va-Mt
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:30:26 -0500
Received: by mail-wr1-x435.google.com with SMTP id 6so4463100wrb.11
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 07:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JGLiZUBdLguQ8v1zIoAL8gWJ2AVvRrGKswtrTjBu1+w=;
 b=QjVk0rCAum3q/9kpJVw30TOeUo6FvzLqy1Rg2zI5T3femKiwABrXqrQXDaOv4cZnne
 P9NUEnI4wOv9kuu5X8CEzjh8t5fkCYzpWvH2KVIxomrZb53jQj/T8rHgHvNvfSzV49RQ
 T0VnPU7wRf7b/f/kbC1mVBlf1EHfG+iJTe6rpISFovMJ2KyswDrVn5VCEljIOslI1mX6
 F7sGr68u3UPmtovE8Ms8p+K5fXe6WRJ/cm+o1zkJ40A9CJACuI1H+pjOk1xCqokle4qo
 xkb1EkR1fWLm3EyQVYEBM4JmviIObjtagJF7o4GYTGukDqFZXwza55DyBO9KQZGrbCZb
 E6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JGLiZUBdLguQ8v1zIoAL8gWJ2AVvRrGKswtrTjBu1+w=;
 b=a29k/t6yXwBSP05G/nRBSFJbnC2M+L657qDcfM1/eJyZjM5OdXkwnZveYBvURU5E88
 +WEVqyp28j+FrLRrZZBH39jIO9GTUC9wQlkLU23j9tpOfFY1UqMxEnYpU1WubQJc34fH
 078ST7R1i34QMp3ip6J3nRhE3yFqOvVxLHLxaKWWeG7+LVajqjk6hSR+ubqSq7xyE9o2
 3yox4UvFELdXPFVbBbNejP9/ZV0AgvPjdy9kKLgnAcsOfcxXUMRLVvy+NlCVZZ6/vHYz
 wi2eLh/KQtiPapd7QUX0sMayYGHtwdZ72i0dAO2Q1U900yb5M1WGDU+rGbRWvGoX823U
 ciTQ==
X-Gm-Message-State: AO0yUKXtftLlfixE4EsXPybr/avDsSNWlNNVdtKmsmKWX5P312n6MvZo
 kyCOCcJVQ1qkBNmplGHQrA8TCAO1HNB6J6X0EII=
X-Google-Smtp-Source: AK7set+u9BG9xH2i0wuOnTjC/0fhYSQvkWJfgcrrru/lsPi9C3mGqidJJDzTxjzgAqMzE9Af6IfJ1Q==
X-Received: by 2002:a5d:4e0e:0:b0:2c6:8e3a:f701 with SMTP id
 p14-20020a5d4e0e000000b002c68e3af701mr3632593wrt.56.1676993422981; 
 Tue, 21 Feb 2023 07:30:22 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:c49d:d14a:e6ed:555a])
 by smtp.gmail.com with ESMTPSA id
 r1-20020adfdc81000000b002c5503a8d21sm2803417wrj.70.2023.02.21.07.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 07:30:22 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 1/4] util/cacheflush: fix cache on windows-arm64
Date: Tue, 21 Feb 2023 16:30:03 +0100
Message-Id: <20230221153006.20300-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
References: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x435.google.com
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

ctr_el0 access is privileged on this platform and fails as an illegal
instruction.

Windows does not offer a way to flush data cache from userspace, and
only FlushInstructionCache is available in Windows API.

The generic implementation of flush_idcache_range uses,
__builtin___clear_cache, which already use the FlushInstructionCache
function. So we rely on that.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/cacheflush.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/util/cacheflush.c b/util/cacheflush.c
index 2c2c73e085..06c2333a60 100644
--- a/util/cacheflush.c
+++ b/util/cacheflush.c
@@ -121,8 +121,12 @@ static void sys_cache_info(int *isize, int *dsize)
 static bool have_coherent_icache;
 #endif
 
-#if defined(__aarch64__) && !defined(CONFIG_DARWIN)
-/* Apple does not expose CTR_EL0, so we must use system interfaces. */
+#if defined(__aarch64__) && !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
+/*
+ * Apple does not expose CTR_EL0, so we must use system interfaces.
+ * Windows neither, but we use a generic implementation of flush_idcache_range
+ * in this case.
+ */
 static uint64_t save_ctr_el0;
 static void arch_cache_info(int *isize, int *dsize)
 {
@@ -225,7 +229,11 @@ static void __attribute__((constructor)) init_cache_info(void)
 
 /* Caches are coherent and do not require flushing; symbol inline. */
 
-#elif defined(__aarch64__)
+#elif defined(__aarch64__) && !defined(CONFIG_WIN32)
+/*
+ * For Windows, we use generic implementation of flush_idcache_range, that
+ * performs a call to FlushInstructionCache, through __builtin___clear_cache.
+ */
 
 #ifdef CONFIG_DARWIN
 /* Apple does not expose CTR_EL0, so we must use system interfaces. */
-- 
2.30.2


