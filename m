Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11E569ECA3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:02:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUeRB-0003Ck-7y; Tue, 21 Feb 2023 21:00:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUeQy-00036V-HO
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:00:41 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUeQw-00015H-Tj
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:00:40 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 z20-20020a17090a8b9400b002372d7f823eso3070855pjn.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5QZ5Dbtl92tzklOChDMe8O5bqURzi4Z13sfncMd8SRE=;
 b=Z1+55IcG/uq/6iFXCHXoiP/xCutgmWb/8q4BiZ9mATE+IP42/ImueqxVQgNM1B8nfT
 twGCODE8Q9l631mbd6xILrHWSUi8/1pRlQMP+5YHLYrntNVDxIxMkUvcwJmJO/sSIcoJ
 cwyOb5M521KS3CoARN+CWXXtZuJwbi86cqHlugt5w/k981hkonZ9oJ7SxeGaJE8SOE1C
 5t47H051GFSRrcZRINPsKqqTVMYGC1/NvKn3+z5EHWwBGfuXeqbi1GqSpmCjWawQ1JeN
 ZMBz3L7HY0iI+giVf2Eq9p2yvLlTHAiR7AdtQwK27hEktECe9kiU2kVDqDWQFWOb5ME6
 02qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5QZ5Dbtl92tzklOChDMe8O5bqURzi4Z13sfncMd8SRE=;
 b=Sl6El3xuUYk9xSjQfOvrtBcUwh2yhSD0D0UjoujvHo15WktDYC/qQi+kUhOHh/OYcM
 RKedmq4FbP4uB0wnNBczSRztIVFIts6S/dxENmp7IXcLdY5Ymve6PeyZVP3zVCDF/h18
 C5ryfLhMQwCAiISw9GcujufEuugN1CaHc3/FC4jxd9fqXwlXtNgg/esILnajJGg26CIH
 oVrpGYMB11lxZwEvvO09YQSdden3zsedp59PTqKy0/v5rnkowHCJFvYFjLB0umULv96m
 491Iu4MDL9tK+WAiVPunbKRrHE9zQ0atstlIACiYuJB7QweR4nd/he02XKY+w1Hr9k2A
 gqug==
X-Gm-Message-State: AO0yUKVv0Ar3N0WGt0MJ5Eu7lK4EyRDesxZ4xTaJ511dXBZijcs4067w
 PuO+CGBw7d7uC7kMWg/N/Hpgsgqv2GiabadcgBs=
X-Google-Smtp-Source: AK7set/Z6K/j2j5LqwDWVz8KZgGS33bC+80x0UnHxVR90g6juZdlPehuaLRwsAqdZ7QCB4KX78rt9g==
X-Received: by 2002:a17:903:22c8:b0:192:4f85:b91d with SMTP id
 y8-20020a17090322c800b001924f85b91dmr7843024plg.46.1677031237330; 
 Tue, 21 Feb 2023 18:00:37 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c10200b00189743ed3b6sm91468pli.64.2023.02.21.18.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:00:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PULL v2 7/8] util/cacheflush: fix cache on windows-arm64
Date: Tue, 21 Feb 2023 16:00:22 -1000
Message-Id: <20230222020023.904232-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222020023.904232-1-richard.henderson@linaro.org>
References: <20230222020023.904232-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

ctr_el0 access is privileged on this platform and fails as an illegal
instruction.

Windows does not offer a way to flush data cache from userspace, and
only FlushInstructionCache is available in Windows API.

The generic implementation of flush_idcache_range uses,
__builtin___clear_cache, which already use the FlushInstructionCache
function. So we rely on that.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230221153006.20300-2-pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
2.34.1


