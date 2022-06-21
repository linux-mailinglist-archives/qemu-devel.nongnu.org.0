Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8725553C3E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 22:58:37 +0200 (CEST)
Received: from localhost ([::1]:43162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3kxI-0006FK-N7
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 16:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3km1-0006cB-IC
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:57 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:41049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3klx-00016e-K8
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:57 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 g10-20020a17090a708a00b001ea8aadd42bso14681338pjk.0
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 13:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gyCp94sx1oZe6nOn8Y4djL6VCvHuh8DxBZPF3P7Jjzk=;
 b=P5uZVO5c9KH/oIaNhlUD5l12DwX4cDqQqcqgS3oQt5se7HU+Wvglwt8hoqxeIhwLuM
 CZXWUlyj5MTc2ZZufmd3Epz/oOEtr3ZLHD2vTuDTi5t3WwXG0SsxSW6HTeL3A2c2ZGhE
 V1h/i11zpYDBBjDxnL8oQAOC8WL6xVFnv+/3UuCsLjWz2WPA0Ob1OQKeb4rCXwi0Ci6y
 JlgqCkg2179x9mldvQGDCucMY9S+mF95KZsicsJPsd3H9W88w5+vtJknWmFgJDo23iaK
 isS/7IxAaS0ff5YyKrx/JC55lbBEXVGwuGSnWxQFgdmOO5cu04tSC4kB6CWCCpR0XGvF
 2OzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gyCp94sx1oZe6nOn8Y4djL6VCvHuh8DxBZPF3P7Jjzk=;
 b=WxN895dmLSizc3kwcnIa/JwOb+fAdVFKcv2uofSQifUVCSundT9Fw1o+5Tjek/0s+U
 wAiqF8QacFKEe3wqs/0YTpoQyLRih328mPP4eZonV/B9t+YVQ2F2mnu9b9weuvE7LCkd
 oXn6s/0d3g+SVVCIUd+hWL2ttTPs39Ox/89AFcA7jVITdbGJzAHPzjp03tGK0pACLZ+Z
 L4iT+IssWS3VVW/0M5GEIWKAIpDqnctRkEOq72qkC4JfRDtMs2821vMrfnz67njR+2O9
 wvLg/ZD9UsZKnnlS8UVMMoE8/UWV4p8Vmx0g5TB4GE2gO3kB8sNNb4WZzVCQi/PnF5LK
 kDQQ==
X-Gm-Message-State: AJIora8/UAKKJE6bsdCecohH4wv3l7FYPbuN7apXW9xBGTlvSTNNKwAi
 8/DZGi07wL4ZNqxiyzlazYOgBv+DGi2IHA==
X-Google-Smtp-Source: AGRyM1ur5Yj2YDxSRwO7AN8exVlNK17LeLZW/nDdi5HJdtS08663RPc3qEKt6SXb0IIito0qwHS0Dw==
X-Received: by 2002:a17:903:268b:b0:16a:17e5:f2a9 with SMTP id
 jf11-20020a170903268b00b0016a17e5f2a9mr15929725plb.38.1655844412236; 
 Tue, 21 Jun 2022 13:46:52 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 p66-20020a625b45000000b005252defb016sm3649674pfb.122.2022.06.21.13.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 13:46:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 8/9] util/cacheflush: Merge aarch64 ctr_el0 usage
Date: Tue, 21 Jun 2022 13:46:42 -0700
Message-Id: <20220621204643.371397-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621204643.371397-1-richard.henderson@linaro.org>
References: <20220621204643.371397-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Merge init_ctr_el0 into arch_cache_info.  In flush_idcache_range,
use the pre-computed line sizes from the global variables.
Use CONFIG_DARWIN in preference to __APPLE__.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220621014837.189139-3-richard.henderson@linaro.org>
---
 util/cacheflush.c | 44 +++++++++++++++++++-------------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/util/cacheflush.c b/util/cacheflush.c
index 8096afd33c..01b6cb7583 100644
--- a/util/cacheflush.c
+++ b/util/cacheflush.c
@@ -70,7 +70,7 @@ static void sys_cache_info(int *isize, int *dsize)
     g_free(buf);
 }
 
-#elif defined(__APPLE__)
+#elif defined(CONFIG_DARWIN)
 # include <sys/sysctl.h>
 static void sys_cache_info(int *isize, int *dsize)
 {
@@ -117,20 +117,25 @@ static void sys_cache_info(int *isize, int *dsize)
  * Architecture (+ OS) specific cache detection mechanisms.
  */
 
-#if defined(__aarch64__)
-
+#if defined(__aarch64__) && !defined(CONFIG_DARWIN)
+/* Apple does not expose CTR_EL0, so we must use system interfaces. */
+static uint64_t save_ctr_el0;
 static void arch_cache_info(int *isize, int *dsize)
 {
-    if (*isize == 0 || *dsize == 0) {
-        uint64_t ctr;
+    uint64_t ctr;
 
-        /*
-         * The real cache geometry is in CCSIDR_EL1/CLIDR_EL1/CSSELR_EL1,
-         * but (at least under Linux) these are marked protected by the
-         * kernel.  However, CTR_EL0 contains the minimum linesize in the
-         * entire hierarchy, and is used by userspace cache flushing.
-         */
-        asm volatile("mrs\t%0, ctr_el0" : "=r"(ctr));
+    /*
+     * The real cache geometry is in CCSIDR_EL1/CLIDR_EL1/CSSELR_EL1,
+     * but (at least under Linux) these are marked protected by the
+     * kernel.  However, CTR_EL0 contains the minimum linesize in the
+     * entire hierarchy, and is used by userspace cache flushing.
+     *
+     * We will also use this value in flush_idcache_range.
+     */
+    asm volatile("mrs\t%0, ctr_el0" : "=r"(ctr));
+    save_ctr_el0 = ctr;
+
+    if (*isize == 0 || *dsize == 0) {
         if (*isize == 0) {
             *isize = 4 << (ctr & 0xf);
         }
@@ -228,17 +233,6 @@ void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
 }
 #else
 
-/*
- * TODO: unify this with cacheinfo.c.
- * We want to save the whole contents of CTR_EL0, so that we
- * have more than the linesize, but also IDC and DIC.
- */
-static uint64_t save_ctr_el0;
-static void __attribute__((constructor)) init_ctr_el0(void)
-{
-    asm volatile("mrs\t%0, ctr_el0" : "=r"(save_ctr_el0));
-}
-
 /*
  * This is a copy of gcc's __aarch64_sync_cache_range, modified
  * to fit this three-operand interface.
@@ -248,8 +242,8 @@ void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
     const unsigned CTR_IDC = 1u << 28;
     const unsigned CTR_DIC = 1u << 29;
     const uint64_t ctr_el0 = save_ctr_el0;
-    const uintptr_t icache_lsize = 4 << extract64(ctr_el0, 0, 4);
-    const uintptr_t dcache_lsize = 4 << extract64(ctr_el0, 16, 4);
+    const uintptr_t icache_lsize = qemu_icache_linesize;
+    const uintptr_t dcache_lsize = qemu_dcache_linesize;
     uintptr_t p;
 
     /*
-- 
2.34.1


