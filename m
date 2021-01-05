Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473432EB1A7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:44:44 +0100 (CET)
Received: from localhost ([::1]:45462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqNv-0000Zw-8O
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0H-0002Is-4V
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:17 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:45543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq07-0006RI-A3
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:12 -0500
Received: by mail-pf1-x436.google.com with SMTP id q22so101296pfk.12
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NqDvAjSsLSimLcFmAjOdfLypVhA8Qg70u4hgiCmTSw4=;
 b=x/ESSpedXBeFlnRFsPIKceBYtW9mD5NB57qPwmlqel24EloiJsL9LBAaaxslOKF7/k
 m8ETtSHJqF55iMCeFbx5uSrmOCsdH1lS+AgBws4JYEZTSTjTYpcmMFFLdoI4DB0sJhGd
 wbpoPjUF6gzCtoqNrHb4lOZSnJd1kPw0ajNTyJocxBVtZfXs+HZqrAKB16o1J7uQZeD+
 8AxR9pFh2LkI0f2UYvehpfRMC7nvQ5qFXBc1IeLo+HSFXrmuCgDx0sLOCamFl/PNvkBr
 kMZE1zsExc0dz7gvCNUwjz3JFxV52rNtPlbPnJI1a0Ha+6yazlb7xZS54Y4KQUMtCamQ
 C6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NqDvAjSsLSimLcFmAjOdfLypVhA8Qg70u4hgiCmTSw4=;
 b=N0byVBZZce/dmBJY5EAKResj2o984SNbkcKqtZhUy+3y4PCd3/vHNnpLy1Xo6Fr9UO
 JSa8YHTxAmNyhY2ocDHTb84bn+vo7pUhMaYF1Xzn2YbqMZcvzaheEwsirl8Y8dKxiVid
 hac849ns1jQOADkgTVFePH+uJu2fYHM5GPnNRjOew3/+LIznE0SUvYkcL2phUMTIe42k
 P0ny7KN6EwKaTIeFpxD8fGWFAnDXdphp0VOZjx9aLIfQKuTjZpg78ZumELaY2NZH7Oja
 illDMs3R2lOXMsgX2+5L3RroAjD1A7WbkkivBXcptM6f35d7K6Gy1r6pCiIZ1HoD3SfL
 M9uA==
X-Gm-Message-State: AOAM5322sjAVJ3NWfrxkBT4nIAq7IPvcThxs8G22WEF8gyM9fDZsGCMP
 xJhWFJ9/p6ZZ0M3HsW32g8ksq128UNy1Gw==
X-Google-Smtp-Source: ABdhPJxf0yMdwCp5UKCV1wLci6OBIYaShJrepv+zTj0klaacmKx1NEreXQcZ22Ca7e451qP93LdQ0w==
X-Received: by 2002:a63:4d59:: with SMTP id n25mr362531pgl.122.1609867204698; 
 Tue, 05 Jan 2021 09:20:04 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/43] util: Specialize flush_idcache_range for aarch64
Date: Tue,  5 Jan 2021 07:19:11 -1000
Message-Id: <20210105171950.415486-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: Joelle van Dyne <j@getutm.app>
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


