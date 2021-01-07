Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012BC2EE6D0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:27:16 +0100 (CET)
Received: from localhost ([::1]:50222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbsJ-0005rf-0u
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:27:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgc-0000uQ-44
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:10 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:46469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbga-0001SC-Eo
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:09 -0500
Received: by mail-pf1-x434.google.com with SMTP id s21so4541125pfu.13
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NqDvAjSsLSimLcFmAjOdfLypVhA8Qg70u4hgiCmTSw4=;
 b=Stwg9jZiJZR6PaT3mLXbZ7e8lNdMsgDMfIJMf7yEEWTdcMWl2GX0WT/r27zgrhnQlE
 D5QcgHcYBuQ+OKZjmSZtMebWb1TtQxdbDcjVtvKnfpnMgP6gpCco3OdNxvVsDlG9iLQC
 rGXOBUe+6EidJkYTa8vR9Hi+1uj5HGyM6S2s4plsggYjp8dyShTdQyq+NAjqUO4rlMPA
 FczWvUZP8yffFQKiuMn+A7mNQlW8u9BAPokoQchGGYFvLuMFV3oAAKQKB0S0KtOkaFZ1
 UMDWtr6TZ7PILejev9YfGT6DPM/xwk2tWHkeRGVVeNBpwqkdzYZE3Z8+WNkqEc7L/Pie
 +fMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NqDvAjSsLSimLcFmAjOdfLypVhA8Qg70u4hgiCmTSw4=;
 b=htViOjd+pORgeDoaUFKULB5z7mbmC7KaxuxCvnuGEUL0Fz6VvBZSe3H4UCNzKDuIGi
 52HhZGNcU5H8eLi/Z6a2GSjPCph2fZg+McWZdYoqEoCJcfCL9IpB8awq68ATwHvhJ79l
 8zA6IJbvYXOmfdZC2SiwYJLzlurFhnz3I8zs4S+/zqOBd26ObyTsjU8H3dSMTiEwzUL/
 jNe92PL7o4bNQLE6CR84YqYxj2xr/UNAcMTjwWZcVzXAjKe8RvBo02cSY/GzjyPDxCuj
 11K/zp27NEX4wg+ZZnLjV1qW0shvlvPpgQT8yuyiSzUwgUr5u9UpsJwd0sfKCgD/kDfH
 yczw==
X-Gm-Message-State: AOAM531rLlg6j1C54kr22f4at8XvMsYxQzrMp6jjlWID39G5WBWg6Bpm
 FEUMVW6enTjIbrRJpSAD58QSPn7tTf+KVw==
X-Google-Smtp-Source: ABdhPJz+Q2VZY/2H2OmkIuG4q9/7A7vidnxfDAoHZM18RN9i++37qk3wzxZXEowtzAQpp3a4nncViQ==
X-Received: by 2002:a63:2f05:: with SMTP id v5mr3495674pgv.3.1610050506879;
 Thu, 07 Jan 2021 12:15:06 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/47] util: Specialize flush_idcache_range for aarch64
Date: Thu,  7 Jan 2021 10:14:09 -1000
Message-Id: <20210107201448.1152301-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: peter.maydell@linaro.org, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For darwin, the CTR_EL0 register is not accessible, but there
are system routines that we can use.

For other hosts, copy the single pointer implementation from
libgcc and modify it to support the double pointer interface
we require.  This halves the number of cache operations required
when split-rwx is enabled.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/cacheflush.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/util/cacheflush.c b/util/cacheflush.c
index 92805efe49..6a20723902 100644
--- a/util/cacheflush.c
+++ b/util/cacheflush.c
@@ -7,12 +7,81 @@
 
 #include "qemu/osdep.h"
 #include "qemu/cacheflush.h"
+#include "qemu/bitops.h"
 
 
 #if defined(__i386__) || defined(__x86_64__) || defined(__s390__)
 
 /* Caches are coherent and do not require flushing; symbol inline. */
 
+#elif defined(__aarch64__)
+
+#ifdef CONFIG_DARWIN
+/* Apple does not expose CTR_EL0, so we must use system interfaces. */
+extern void sys_icache_invalidate(void *start, size_t len);
+extern void sys_dcache_flush(void *start, size_t len);
+void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
+{
+    sys_dcache_flush((void *)rw, len);
+    sys_icache_invalidate((void *)rx, len);
+}
+#else
+
+/*
+ * TODO: unify this with cacheinfo.c.
+ * We want to save the whole contents of CTR_EL0, so that we
+ * have more than the linesize, but also IDC and DIC.
+ */
+static unsigned int save_ctr_el0;
+static void __attribute__((constructor)) init_ctr_el0(void)
+{
+    asm volatile("mrs\t%0, ctr_el0" : "=r"(save_ctr_el0));
+}
+
+/*
+ * This is a copy of gcc's __aarch64_sync_cache_range, modified
+ * to fit this three-operand interface.
+ */
+void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
+{
+    const unsigned CTR_IDC = 1u << 28;
+    const unsigned CTR_DIC = 1u << 29;
+    const unsigned int ctr_el0 = save_ctr_el0;
+    const uintptr_t icache_lsize = 4 << extract32(ctr_el0, 0, 4);
+    const uintptr_t dcache_lsize = 4 << extract32(ctr_el0, 16, 4);
+    uintptr_t p;
+
+    /*
+     * If CTR_EL0.IDC is enabled, Data cache clean to the Point of Unification
+     * is not required for instruction to data coherence.
+     */
+    if (!(ctr_el0 & CTR_IDC)) {
+        /*
+         * Loop over the address range, clearing one cache line at once.
+         * Data cache must be flushed to unification first to make sure
+         * the instruction cache fetches the updated data.
+         */
+        for (p = rw & -dcache_lsize; p < rw + len; p += dcache_lsize) {
+            asm volatile("dc\tcvau, %0" : : "r" (p) : "memory");
+        }
+        asm volatile("dsb\tish" : : : "memory");
+    }
+
+    /*
+     * If CTR_EL0.DIC is enabled, Instruction cache cleaning to the Point
+     * of Unification is not required for instruction to data coherence.
+     */
+    if (!(ctr_el0 & CTR_DIC)) {
+        for (p = rx & -icache_lsize; p < rx + len; p += icache_lsize) {
+            asm volatile("ic\tivau, %0" : : "r"(p) : "memory");
+        }
+        asm volatile ("dsb\tish" : : : "memory");
+    }
+
+    asm volatile("isb" : : : "memory");
+}
+#endif /* CONFIG_DARWIN */
+
 #elif defined(__mips__)
 
 #ifdef __OpenBSD__
-- 
2.25.1


