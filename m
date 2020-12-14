Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9499D2D9973
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:09:33 +0100 (CET)
Received: from localhost ([::1]:54346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kooXc-0006v0-JX
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRk-0001XG-Ti
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:28 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:36344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRh-0003uM-SW
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:28 -0500
Received: by mail-oi1-x244.google.com with SMTP id 9so12096191oiq.3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OCpAIDmNxfXuUcIom3vUf6VIYVS6wp4D0QytQgRfHqY=;
 b=kbYbAaJTyoXLm02/V3NWvhS70MF5OGX2yo6AKpzAWLSLZm/5tXOJdQcT8AQ8Y+nKw8
 vh7CxCRD8BKZKsjuyPiS3OIIJ7Vmo6tFlRgDg1W5XLtxX8wq9MZF8KfkZkvI9ZpWA+56
 DoGFb/eEc1jzZWtJTk5c9aFHrET/QXFTUyb9EDPDii0vt6f6JUufbikz86nGsFWYoKD7
 ciRcJ0vsK2YZr/33umYb/KNXh1QHlkRlvbs16XjBShR4sRdaAjtW+ZFQ6xthchPwI8hY
 b/AhO0khAt7YcGasX33stOCyeak8DElEK61PCBMvo952fKzgXl7d+7OWmzuYxZ0lyPJS
 NkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OCpAIDmNxfXuUcIom3vUf6VIYVS6wp4D0QytQgRfHqY=;
 b=VCE1i+/9mrDJBUfqtfY0C25vsTrwJUROuVNZS5QU0Nk2f2oxEXoTYdH382zt6V/WbS
 aiyZfbEqSVbWb8YQvK+CHzFRjI8I/vO17S2aGqypuy1eUkwbFjgWks3kIgyrzUdrekro
 D4t9ggzKvJu3DTPDOze6VdV4Xqm/ytKh+lrw7A3t4yexvYJ5I8nV3c6lgxWDVNFLMs0r
 Gnq82dgwv32OhbmXMlmCMvvfGknQQHfaKSZmZwh1/A6KqFr1x1cdtB6290gFKn3xufrG
 7e9xi8IVFGXRABN9zsS+0l5K1lxeDMfh3Z29tsF0wBlB/4jYWzHf4jgYuhTtTZllE+4c
 J1rg==
X-Gm-Message-State: AOAM533EFFqFWZQddhJNRqxxcPQL2HVYwqHczhAW5lUxMu9ZSDzo7srG
 FIzUd3o1luxtMvF45hoo1m9mO+tB+Z9CioBt
X-Google-Smtp-Source: ABdhPJwcAyNgVKxOSBpOqAQ40aT6CXjhpw76b0VcoqtNGrzzcLFmNqKq5u+mMpY94dYGJWVaUlbi1A==
X-Received: by 2002:aca:afd0:: with SMTP id y199mr18221481oie.7.1607954604180; 
 Mon, 14 Dec 2020 06:03:24 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/43] util: Specialize flush_idcache_range for aarch64
Date: Mon, 14 Dec 2020 08:02:35 -0600
Message-Id: <20201214140314.18544-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
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

Cc: Joelle van Dyne <j@getutm.app>
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


