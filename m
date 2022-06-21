Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEC5552920
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 03:50:52 +0200 (CEST)
Received: from localhost ([::1]:32814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3T2Z-0006B6-7e
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 21:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3T0V-0003RM-G6
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 21:48:43 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:55246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3T0T-0001ta-Ol
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 21:48:43 -0400
Received: by mail-pj1-x102b.google.com with SMTP id cv13so8984332pjb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 18:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L5ak+zhha2NejqhbdG/upUYuAV+/wGYDkUJ8k4RZozs=;
 b=JvVQs7i60aH4yf2xGlaVdht5d12XserxVPEhwGxZ1N/LTj/dkhDokaiP4gZ395NR64
 ZOkYKuYIYf2U1cQRa3LcwFdzjWvfT01XtZodCHHmGyfsBrxkcGl7TJMO+jLAD4EoLdQ2
 ytX+SEO808o/S7r6EQN9u/qscAWWGSeEjy3TGQEyhbqIn5sXgB20KLwZmbCLLEE/Nk7d
 PVlxZJokSR12EJZSsxkYjrCwdt6dKnemwCWZNbBjZr3LKkEo1M/8x+V3prNeUSXkz8wL
 P9pZHiOTNka9zqLbNaGBsbKCrdmQx8QuizF0w7ytN8OIUfqafyxwBoZNSAgV3uqHZVEH
 JoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L5ak+zhha2NejqhbdG/upUYuAV+/wGYDkUJ8k4RZozs=;
 b=0iXsaZWp+lsGsNJ0d0e5ZVhg6bjZe7ZaHyy/rZihhYtkoPHj093nGZ6i7NgTJ4bGM3
 KlqoD5sYf0asmb05CqewRlE0zvoeOwYPhPT3piDHNwD97Z8tn0pBLlmtpxu81iBc5miv
 lnYLkHPXGRlakn6dBfqxlu+UDwfIS55swiQtS50ppXH1MDZxXCpf7Q9GE8CVvVRSkEHA
 wPOZ6vBEueJIHy4fpicvsBX2j6SEq9reG2zfZlZKiMCm25kA8Rv1cYhzbkJwFOCNPn4Z
 MzczNcMSiypMz59Gqhta/s3GI0uMv0aC4P5RDDQcJqmmxQKCtoiNEBBa9IrUGCczS5/A
 eS1A==
X-Gm-Message-State: AJIora+NJSb8zD4iAk3xjCA8+AlWsDj3LuyO7ZS+NgtyTBqbDgd/X82Z
 0ALWFD6kEHHF04eiiPUqbQ4ktvwX1wMtow==
X-Google-Smtp-Source: AGRyM1vQzPZ8Mv1bJKeNAvo2bWpAX8Go5ULA7Yz/IDkW+Nt7F7L4AgA93UUkMl/fRuS6a4ZUeiflVQ==
X-Received: by 2002:a17:902:d652:b0:168:bffe:e5fe with SMTP id
 y18-20020a170902d65200b00168bffee5femr27193143plh.81.1655776120396; 
 Mon, 20 Jun 2022 18:48:40 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a056a00084b00b0051bc3a2355csm9907875pfk.64.2022.06.20.18.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 18:48:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: npiggin@gmail.com,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 2/3] util/cacheflush: Merge aarch64 ctr_el0 usage
Date: Mon, 20 Jun 2022 18:48:36 -0700
Message-Id: <20220621014837.189139-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621014837.189139-1-richard.henderson@linaro.org>
References: <20220621014837.189139-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


