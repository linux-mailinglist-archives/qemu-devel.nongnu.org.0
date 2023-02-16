Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2C1699643
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:49:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSedT-0001XC-LG; Thu, 16 Feb 2023 08:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pSedR-0001TY-UJ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:49:17 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pSedQ-0001aA-Br
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:49:17 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so4073129wmp.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B2dYUbNSjmgpVDD1OmNWATFHbh0VLr0h9CMNVrcVRPQ=;
 b=oXENBCjN1ukbeODkUqkkj2do0qY8rWYSpJkU89n9qxsiiLWRqlLvfRQX0XRUYhxLAq
 8t9Cuj7KOwgLNt4a0uSocNG8dGufiIwYRxt9LDibhr6p5gcnynJN3abhNP2Q0sV20MHc
 PAZcbI5xsL7z5WzEGCwQckZ6vP0aq+A6txwwatRsUxlAsNXlh5N6he5E67sXYnV6bix1
 /j4zhM2wYUe0XmWb06b6MYecO8vefxNdOXDbqGzZhXe7nTZx/5ggewdBMHStndgxpDld
 WcCAB/yeZZZ0PbOUDMSzr0xkTyHhqSscHT0vyLS+GW68rGBSDmUZWi+7/RywdVVwqIcW
 NWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B2dYUbNSjmgpVDD1OmNWATFHbh0VLr0h9CMNVrcVRPQ=;
 b=oQfPDa4uCnavfBkcPU1YM3zpBkOPxTHP7v93d4g61O3B2P4LJlECkMPux0FG3nYlYu
 B5Wnw9y6F8y81kmSs6c6fh46edaH5bxePQ8Umbo2s/e0FI6OGpml5zmozb/VdXmbxhKN
 JrpX3jUsP6AaavEDWiM+ldQlsZ4ZP3JESDZ1nqGFwVjrlRlNEQkKnjtBZT/wWCkWidLT
 E/L7dRxh07edV7dlrZ6GPknsoqOVXBPATK7/9cau5+TIeDBqz637ig1255/9YtbuFxi4
 XhFitbX2AIWmcWUa0/cF7DAJ1U+lkNMGBGcEp6gHqm2lM+DGKJb0x4Z1hcozLzlpOs+I
 Xzaw==
X-Gm-Message-State: AO0yUKXaSubBoMiOLqSasA0goVqnWoQkCC0ESJnRp3cTDg2sdGl9onbA
 AFkeyvvbvtlKyURwHRZsj7uGIAYk9BXHUQlz9xM=
X-Google-Smtp-Source: AK7set9ls/J/qRbu2Zt9/ui9CEGdqmyck92eMNymJA82Z3XoqsnC1LRCoF/vu+4iciBa7DxKPoGe1A==
X-Received: by 2002:a05:600c:1987:b0:3dc:52fc:7f06 with SMTP id
 t7-20020a05600c198700b003dc52fc7f06mr4864869wmq.41.1676555354461; 
 Thu, 16 Feb 2023 05:49:14 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:c49d:d14a:e6ed:555a])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a05600c364b00b003dc0cb5e3f1sm1557933wmq.46.2023.02.16.05.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:49:14 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 1/4] util/cacheflush: fix cache on windows-arm64
Date: Thu, 16 Feb 2023 14:49:08 +0100
Message-Id: <20230216134911.6803-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
References: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x32a.google.com
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
---
 util/cacheflush.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/util/cacheflush.c b/util/cacheflush.c
index 2c2c73e085..0a0acd70fa 100644
--- a/util/cacheflush.c
+++ b/util/cacheflush.c
@@ -121,8 +121,10 @@ static void sys_cache_info(int *isize, int *dsize)
 static bool have_coherent_icache;
 #endif
 
-#if defined(__aarch64__) && !defined(CONFIG_DARWIN)
-/* Apple does not expose CTR_EL0, so we must use system interfaces. */
+#if defined(__aarch64__) && !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
+/* Apple does not expose CTR_EL0, so we must use system interfaces.
+ * Windows neither, but we use a generic implementation of flush_idcache_range
+ * in this case. */
 static uint64_t save_ctr_el0;
 static void arch_cache_info(int *isize, int *dsize)
 {
@@ -225,7 +227,9 @@ static void __attribute__((constructor)) init_cache_info(void)
 
 /* Caches are coherent and do not require flushing; symbol inline. */
 
-#elif defined(__aarch64__)
+#elif defined(__aarch64__) && !defined(CONFIG_WIN32)
+/* For Windows, we use generic implementation of flush_idcache_range, that
+ * performs a call to FlushInstructionCache, through __builtin___clear_cache */
 
 #ifdef CONFIG_DARWIN
 /* Apple does not expose CTR_EL0, so we must use system interfaces. */
-- 
2.30.2


