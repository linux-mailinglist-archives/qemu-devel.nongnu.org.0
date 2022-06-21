Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9672B553BF4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 22:52:58 +0200 (CEST)
Received: from localhost ([::1]:56826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3krp-0004jq-GS
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 16:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3km1-0006dD-VR
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:57 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:41863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3klw-00016E-Om
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:57 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 23so8003716pgc.8
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 13:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OQNphu6lEVBTCzL3EikuxiWNO8eLN6Zl5Gd4LZTqGRA=;
 b=W5YbCsFXe/c/9NW0NQOlICurwY611Hsyi07Zlz3b+se/2ejA8ZsDjNA2Oz782HHpLx
 oyUwtldoqH2fbbbgJ/TGfIK9bt5XLr/mCwNmUX5V2Q4W/xcVm3KCxAs0wKg+H3CBIjHO
 RnjJKszstTXLwhXGoT0T3FO+0SN/XsbmRDI1NZxIdn48aOA1+q4/XR4bfCYZi2NhsvhJ
 HQzuGfWkpaDdMvDM8KTt+HyW0YqIvjdb81wqsiLLUfJrnUpVyiY2KlJ0goDSbfpSSjlB
 I/povpd/hH5bBRd0WjNkeG6SKbpM5WLYmdjMp14OjYMtdXwOO0EQxAv23bPvWe1O4723
 viog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OQNphu6lEVBTCzL3EikuxiWNO8eLN6Zl5Gd4LZTqGRA=;
 b=RXzpZAdJMjheQScNpidhX9DUvkJepzVXMRHZb0MADe0qnk04LLtxwXdlEV3u0O9hXV
 /oNkqYe+pMh+wo+VMs0CXsBZNPJvpcTAOh6hoUeQAXhpoZQUkCTBqh4IA1Qme0YypWpM
 aWs6hDQOLHdujlnQoniOaSqQaMqA1oyg9DfrE9ca8bxHdDG+2qKzNVjbT2hYwYD4nB2g
 JiDG5QRXJVyiE4FeeEdAoW65NmiZLiiuLH/yB9g+WMLtNhOSQQ5eVbxSiahIk+PGJeP7
 jeP6P3aewmUeNYlBYfXE0sw4rD6/LnmxI2v6cPMgOE9pf5T+SpdUfhRQobDaDUAxUSY4
 8SeQ==
X-Gm-Message-State: AJIora8wVqeN+LcestkfUMYAP+jSOuDvNmKbSENeqtVO0oV2C08nkLO0
 7PQnnL2m9cH3bym5QBsfjT6N6/HtwZiElQ==
X-Google-Smtp-Source: AGRyM1supzaiTXs3HiizN/jHAHGhh7O0KN9EV2sQ8khniItfSWxnBFljCeHzlxWTATxyHNXqCb/Tyw==
X-Received: by 2002:a63:c07:0:b0:405:408:949 with SMTP id
 b7-20020a630c07000000b0040504080949mr27939058pgl.368.1655844411337; 
 Tue, 21 Jun 2022 13:46:51 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 p66-20020a625b45000000b005252defb016sm3649674pfb.122.2022.06.21.13.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 13:46:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 7/9] util: Merge cacheflush.c and cacheinfo.c
Date: Tue, 21 Jun 2022 13:46:41 -0700
Message-Id: <20220621204643.371397-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621204643.371397-1-richard.henderson@linaro.org>
References: <20220621204643.371397-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

Combine the two files into cacheflush.c.  There's a couple of bits
that would be helpful to share between the two, and combining them
seems better than exporting the bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220621014837.189139-2-richard.henderson@linaro.org>
---
 util/cacheflush.c | 202 +++++++++++++++++++++++++++++++++++++++++++++-
 util/cacheinfo.c  | 200 ---------------------------------------------
 util/meson.build  |   2 +-
 3 files changed, 202 insertions(+), 202 deletions(-)
 delete mode 100644 util/cacheinfo.c

diff --git a/util/cacheflush.c b/util/cacheflush.c
index 4b57186d89..8096afd33c 100644
--- a/util/cacheflush.c
+++ b/util/cacheflush.c
@@ -1,5 +1,5 @@
 /*
- * Flush the host cpu caches.
+ * Info about, and flushing the host cpu caches.
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
@@ -9,8 +9,208 @@
 #include "qemu/cacheflush.h"
 #include "qemu/cacheinfo.h"
 #include "qemu/bitops.h"
+#include "qemu/host-utils.h"
+#include "qemu/atomic.h"
 
 
+int qemu_icache_linesize = 0;
+int qemu_icache_linesize_log;
+int qemu_dcache_linesize = 0;
+int qemu_dcache_linesize_log;
+
+/*
+ * Operating system specific cache detection mechanisms.
+ */
+
+#if defined(_WIN32)
+
+static void sys_cache_info(int *isize, int *dsize)
+{
+    SYSTEM_LOGICAL_PROCESSOR_INFORMATION *buf;
+    DWORD size = 0;
+    BOOL success;
+    size_t i, n;
+
+    /*
+     * Check for the required buffer size first.  Note that if the zero
+     * size we use for the probe results in success, then there is no
+     * data available; fail in that case.
+     */
+    success = GetLogicalProcessorInformation(0, &size);
+    if (success || GetLastError() != ERROR_INSUFFICIENT_BUFFER) {
+        return;
+    }
+
+    n = size / sizeof(SYSTEM_LOGICAL_PROCESSOR_INFORMATION);
+    size = n * sizeof(SYSTEM_LOGICAL_PROCESSOR_INFORMATION);
+    buf = g_new0(SYSTEM_LOGICAL_PROCESSOR_INFORMATION, n);
+    if (!GetLogicalProcessorInformation(buf, &size)) {
+        goto fail;
+    }
+
+    for (i = 0; i < n; i++) {
+        if (buf[i].Relationship == RelationCache
+            && buf[i].Cache.Level == 1) {
+            switch (buf[i].Cache.Type) {
+            case CacheUnified:
+                *isize = *dsize = buf[i].Cache.LineSize;
+                break;
+            case CacheInstruction:
+                *isize = buf[i].Cache.LineSize;
+                break;
+            case CacheData:
+                *dsize = buf[i].Cache.LineSize;
+                break;
+            default:
+                break;
+            }
+        }
+    }
+ fail:
+    g_free(buf);
+}
+
+#elif defined(__APPLE__)
+# include <sys/sysctl.h>
+static void sys_cache_info(int *isize, int *dsize)
+{
+    /* There's only a single sysctl for both I/D cache line sizes.  */
+    long size;
+    size_t len = sizeof(size);
+    if (!sysctlbyname("hw.cachelinesize", &size, &len, NULL, 0)) {
+        *isize = *dsize = size;
+    }
+}
+#elif defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
+# include <sys/sysctl.h>
+static void sys_cache_info(int *isize, int *dsize)
+{
+    /* There's only a single sysctl for both I/D cache line sizes.  */
+    int size;
+    size_t len = sizeof(size);
+    if (!sysctlbyname("machdep.cacheline_size", &size, &len, NULL, 0)) {
+        *isize = *dsize = size;
+    }
+}
+#else
+/* POSIX */
+
+static void sys_cache_info(int *isize, int *dsize)
+{
+# ifdef _SC_LEVEL1_ICACHE_LINESIZE
+    int tmp_isize = (int) sysconf(_SC_LEVEL1_ICACHE_LINESIZE);
+    if (tmp_isize > 0) {
+        *isize = tmp_isize;
+    }
+# endif
+# ifdef _SC_LEVEL1_DCACHE_LINESIZE
+    int tmp_dsize = (int) sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
+    if (tmp_dsize > 0) {
+        *dsize = tmp_dsize;
+    }
+# endif
+}
+#endif /* sys_cache_info */
+
+
+/*
+ * Architecture (+ OS) specific cache detection mechanisms.
+ */
+
+#if defined(__aarch64__)
+
+static void arch_cache_info(int *isize, int *dsize)
+{
+    if (*isize == 0 || *dsize == 0) {
+        uint64_t ctr;
+
+        /*
+         * The real cache geometry is in CCSIDR_EL1/CLIDR_EL1/CSSELR_EL1,
+         * but (at least under Linux) these are marked protected by the
+         * kernel.  However, CTR_EL0 contains the minimum linesize in the
+         * entire hierarchy, and is used by userspace cache flushing.
+         */
+        asm volatile("mrs\t%0, ctr_el0" : "=r"(ctr));
+        if (*isize == 0) {
+            *isize = 4 << (ctr & 0xf);
+        }
+        if (*dsize == 0) {
+            *dsize = 4 << ((ctr >> 16) & 0xf);
+        }
+    }
+}
+
+#elif defined(_ARCH_PPC) && defined(__linux__)
+# include "elf.h"
+
+static void arch_cache_info(int *isize, int *dsize)
+{
+    if (*isize == 0) {
+        *isize = qemu_getauxval(AT_ICACHEBSIZE);
+    }
+    if (*dsize == 0) {
+        *dsize = qemu_getauxval(AT_DCACHEBSIZE);
+    }
+}
+
+#else
+static void arch_cache_info(int *isize, int *dsize) { }
+#endif /* arch_cache_info */
+
+/*
+ * ... and if all else fails ...
+ */
+
+static void fallback_cache_info(int *isize, int *dsize)
+{
+    /* If we can only find one of the two, assume they're the same.  */
+    if (*isize) {
+        if (*dsize) {
+            /* Success! */
+        } else {
+            *dsize = *isize;
+        }
+    } else if (*dsize) {
+        *isize = *dsize;
+    } else {
+#if defined(_ARCH_PPC)
+        /*
+         * For PPC, we're going to use the cache sizes computed for
+         * flush_idcache_range.  Which means that we must use the
+         * architecture minimum.
+         */
+        *isize = *dsize = 16;
+#else
+        /* Otherwise, 64 bytes is not uncommon.  */
+        *isize = *dsize = 64;
+#endif
+    }
+}
+
+static void __attribute__((constructor)) init_cache_info(void)
+{
+    int isize = 0, dsize = 0;
+
+    sys_cache_info(&isize, &dsize);
+    arch_cache_info(&isize, &dsize);
+    fallback_cache_info(&isize, &dsize);
+
+    assert((isize & (isize - 1)) == 0);
+    assert((dsize & (dsize - 1)) == 0);
+
+    qemu_icache_linesize = isize;
+    qemu_icache_linesize_log = ctz32(isize);
+    qemu_dcache_linesize = dsize;
+    qemu_dcache_linesize_log = ctz32(dsize);
+
+    qatomic64_init();
+}
+
+
+/*
+ * Architecture (+ OS) specific cache flushing mechanisms.
+ */
+
 #if defined(__i386__) || defined(__x86_64__) || defined(__s390__)
 
 /* Caches are coherent and do not require flushing; symbol inline. */
diff --git a/util/cacheinfo.c b/util/cacheinfo.c
deleted file mode 100644
index ab1644d490..0000000000
--- a/util/cacheinfo.c
+++ /dev/null
@@ -1,200 +0,0 @@
-/*
- * cacheinfo.c - helpers to query the host about its caches
- *
- * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
- * License: GNU GPL, version 2 or later.
- *   See the COPYING file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include "qemu/host-utils.h"
-#include "qemu/atomic.h"
-#include "qemu/cacheinfo.h"
-
-int qemu_icache_linesize = 0;
-int qemu_icache_linesize_log;
-int qemu_dcache_linesize = 0;
-int qemu_dcache_linesize_log;
-
-/*
- * Operating system specific detection mechanisms.
- */
-
-#if defined(_WIN32)
-
-static void sys_cache_info(int *isize, int *dsize)
-{
-    SYSTEM_LOGICAL_PROCESSOR_INFORMATION *buf;
-    DWORD size = 0;
-    BOOL success;
-    size_t i, n;
-
-    /* Check for the required buffer size first.  Note that if the zero
-       size we use for the probe results in success, then there is no
-       data available; fail in that case.  */
-    success = GetLogicalProcessorInformation(0, &size);
-    if (success || GetLastError() != ERROR_INSUFFICIENT_BUFFER) {
-        return;
-    }
-
-    n = size / sizeof(SYSTEM_LOGICAL_PROCESSOR_INFORMATION);
-    size = n * sizeof(SYSTEM_LOGICAL_PROCESSOR_INFORMATION);
-    buf = g_new0(SYSTEM_LOGICAL_PROCESSOR_INFORMATION, n);
-    if (!GetLogicalProcessorInformation(buf, &size)) {
-        goto fail;
-    }
-
-    for (i = 0; i < n; i++) {
-        if (buf[i].Relationship == RelationCache
-            && buf[i].Cache.Level == 1) {
-            switch (buf[i].Cache.Type) {
-            case CacheUnified:
-                *isize = *dsize = buf[i].Cache.LineSize;
-                break;
-            case CacheInstruction:
-                *isize = buf[i].Cache.LineSize;
-                break;
-            case CacheData:
-                *dsize = buf[i].Cache.LineSize;
-                break;
-            default:
-                break;
-            }
-        }
-    }
- fail:
-    g_free(buf);
-}
-
-#elif defined(__APPLE__)
-# include <sys/sysctl.h>
-static void sys_cache_info(int *isize, int *dsize)
-{
-    /* There's only a single sysctl for both I/D cache line sizes.  */
-    long size;
-    size_t len = sizeof(size);
-    if (!sysctlbyname("hw.cachelinesize", &size, &len, NULL, 0)) {
-        *isize = *dsize = size;
-    }
-}
-#elif defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
-# include <sys/sysctl.h>
-static void sys_cache_info(int *isize, int *dsize)
-{
-    /* There's only a single sysctl for both I/D cache line sizes.  */
-    int size;
-    size_t len = sizeof(size);
-    if (!sysctlbyname("machdep.cacheline_size", &size, &len, NULL, 0)) {
-        *isize = *dsize = size;
-    }
-}
-#else
-/* POSIX */
-
-static void sys_cache_info(int *isize, int *dsize)
-{
-# ifdef _SC_LEVEL1_ICACHE_LINESIZE
-    int tmp_isize = (int) sysconf(_SC_LEVEL1_ICACHE_LINESIZE);
-    if (tmp_isize > 0) {
-        *isize = tmp_isize;
-    }
-# endif
-# ifdef _SC_LEVEL1_DCACHE_LINESIZE
-    int tmp_dsize = (int) sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
-    if (tmp_dsize > 0) {
-        *dsize = tmp_dsize;
-    }
-# endif
-}
-#endif /* sys_cache_info */
-
-/*
- * Architecture (+ OS) specific detection mechanisms.
- */
-
-#if defined(__aarch64__)
-
-static void arch_cache_info(int *isize, int *dsize)
-{
-    if (*isize == 0 || *dsize == 0) {
-        uint64_t ctr;
-
-        /* The real cache geometry is in CCSIDR_EL1/CLIDR_EL1/CSSELR_EL1,
-           but (at least under Linux) these are marked protected by the
-           kernel.  However, CTR_EL0 contains the minimum linesize in the
-           entire hierarchy, and is used by userspace cache flushing.  */
-        asm volatile("mrs\t%0, ctr_el0" : "=r"(ctr));
-        if (*isize == 0) {
-            *isize = 4 << (ctr & 0xf);
-        }
-        if (*dsize == 0) {
-            *dsize = 4 << ((ctr >> 16) & 0xf);
-        }
-    }
-}
-
-#elif defined(_ARCH_PPC) && defined(__linux__)
-# include "elf.h"
-
-static void arch_cache_info(int *isize, int *dsize)
-{
-    if (*isize == 0) {
-        *isize = qemu_getauxval(AT_ICACHEBSIZE);
-    }
-    if (*dsize == 0) {
-        *dsize = qemu_getauxval(AT_DCACHEBSIZE);
-    }
-}
-
-#else
-static void arch_cache_info(int *isize, int *dsize) { }
-#endif /* arch_cache_info */
-
-/*
- * ... and if all else fails ...
- */
-
-static void fallback_cache_info(int *isize, int *dsize)
-{
-    /* If we can only find one of the two, assume they're the same.  */
-    if (*isize) {
-        if (*dsize) {
-            /* Success! */
-        } else {
-            *dsize = *isize;
-        }
-    } else if (*dsize) {
-        *isize = *dsize;
-    } else {
-#if defined(_ARCH_PPC)
-        /*
-         * For PPC, we're going to use the cache sizes computed for
-         * flush_idcache_range.  Which means that we must use the
-         * architecture minimum.
-         */
-        *isize = *dsize = 16;
-#else
-        /* Otherwise, 64 bytes is not uncommon.  */
-        *isize = *dsize = 64;
-#endif
-    }
-}
-
-static void __attribute__((constructor)) init_cache_info(void)
-{
-    int isize = 0, dsize = 0;
-
-    sys_cache_info(&isize, &dsize);
-    arch_cache_info(&isize, &dsize);
-    fallback_cache_info(&isize, &dsize);
-
-    assert((isize & (isize - 1)) == 0);
-    assert((dsize & (dsize - 1)) == 0);
-
-    qemu_icache_linesize = isize;
-    qemu_icache_linesize_log = ctz32(isize);
-    qemu_dcache_linesize = dsize;
-    qemu_dcache_linesize_log = ctz32(dsize);
-
-    qatomic64_init();
-}
diff --git a/util/meson.build b/util/meson.build
index 8f16018cd4..4939b0b91c 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -27,7 +27,7 @@ util_ss.add(files('envlist.c', 'path.c', 'module.c'))
 util_ss.add(files('host-utils.c'))
 util_ss.add(files('bitmap.c', 'bitops.c'))
 util_ss.add(files('fifo8.c'))
-util_ss.add(files('cacheinfo.c', 'cacheflush.c'))
+util_ss.add(files('cacheflush.c'))
 util_ss.add(files('error.c', 'error-report.c'))
 util_ss.add(files('qemu-print.c'))
 util_ss.add(files('id.c'))
-- 
2.34.1


