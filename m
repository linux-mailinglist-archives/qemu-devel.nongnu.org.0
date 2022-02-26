Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283CA4C575C
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 19:15:30 +0100 (CET)
Received: from localhost ([::1]:48682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO1bN-0002XV-9N
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 13:15:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Tl-0005eH-Qs
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:37 -0500
Received: from [2a00:1450:4864:20::432] (port=45010
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Ti-0004OK-4n
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:37 -0500
Received: by mail-wr1-x432.google.com with SMTP id u1so9143570wrg.11
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 10:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wtF+98JRuxd5OjAw52Lho5GMRtdIqK6nH1UDlgPa8sQ=;
 b=oc1gnn9JfFBpofKSeZ4sPS81/OJJ2C6fwbIB5s7T9rtwMdy58DK44GVZYsb4Qucm9w
 7Ck7P3kgXi7CUCoF6vt5LUYMJpFjqkvcDbLvXtGZP8PuzHieUoVNMjjul2MECKmq+jvG
 EK5ZSWuu4Ba6+VTRd3zP6hidUOdl9q3Kt61vaAweTSfQ2q8KulU2U8BxKuFchFJKRQAG
 CiJ2j80oA0GN1qE1ymnSkcxgvT0MDBl9RVZ9G/TvScmrcWimIFpoa4J5jwcVU4PlUdwj
 ayPpDBAqEmJRGNgAxEex/keLewXJvWtxADSm9s+wqxn1CsY+CTcwRmv3UnVbnEj4RLGD
 0HCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wtF+98JRuxd5OjAw52Lho5GMRtdIqK6nH1UDlgPa8sQ=;
 b=oQ9bhJdqyeprawQXw5VC0wOVPRp1VP8rgJl1LKbC3e/rvuUZPWliZfm4TznQJYNYOB
 eTv/hAHcy47459YA1WvxMJL1p3ulZFunycFKAjrp97NXcfGFS0WNBCByv9hGtMwqP5vc
 5pQRiMPUIKWLg7JhJzDH4Y4c+3IFgNUJRicvAWbmjoOu2evC6iTqCwRJx5mDYph4WPCy
 9dzxW1QGftsRwuf1tglaejUIAynmzhs5aOTBOtWc03bifGyYmD+lCwov8N/q/EEdgo8r
 +stUll4UQFBlb0WbJwpyOR2F5hz4Q7SmZ5nK3eW+AZFX7jZnF7XhFkNHFf/DJICjTqSv
 8S4Q==
X-Gm-Message-State: AOAM53272dYtFd/e29Qh0OeZBlEvY+MwMTn5ujWYUKVcPfzxAiRuQrGR
 TWopm9SgA8Ws6MDj0kdMfum+le1roCwy5w==
X-Google-Smtp-Source: ABdhPJzP2l5faGSYQzZ4mWGacJdg0fqz8a6eV8TmxkkGWgzYmCZPOb7sP4tqX1ykvIhfm+RkvaRxTQ==
X-Received: by 2002:a5d:470a:0:b0:1ed:e403:579a with SMTP id
 y10-20020a5d470a000000b001ede403579amr10139761wrq.224.1645898851607; 
 Sat, 26 Feb 2022 10:07:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adfe64f000000b001e60965a5d4sm5622409wrn.44.2022.02.26.10.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 10:07:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] util: Share qemu_try_memalign() implementation between
 POSIX and Windows
Date: Sat, 26 Feb 2022 18:07:20 +0000
Message-Id: <20220226180723.1706285-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220226180723.1706285-1-peter.maydell@linaro.org>
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu_try_memalign() functions for POSIX and Windows used to be
significantly different, but these days they are identical except for
the actual allocation function called, and the POSIX version already
has to have ifdeffery for different allocation functions.

Move to a single implementation in memalign.c, which uses the Windows
_aligned_malloc if we detect that function in meson.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 meson.build        |  1 +
 util/memalign.c    | 33 +++++++++++++++++++++++++++++++++
 util/oslib-posix.c | 26 --------------------------
 util/oslib-win32.c | 18 ------------------
 4 files changed, 34 insertions(+), 44 deletions(-)

diff --git a/meson.build b/meson.build
index e08de177c87..21511d4fb61 100644
--- a/meson.build
+++ b/meson.build
@@ -1609,6 +1609,7 @@ config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'
 # Note that we need to specify prefix: here to avoid incorrectly
 # thinking that Windows has posix_memalign()
 config_host_data.set('CONFIG_POSIX_MEMALIGN', cc.has_function('posix_memalign', prefix: '#include <stdlib.h>'))
+config_host_data.set('CONFIG_ALIGNED_MALLOC', cc.has_function('_aligned_malloc'))
 config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 config_host_data.set('CONFIG_SEM_TIMEDWAIT', cc.has_function('sem_timedwait', dependencies: threads))
diff --git a/util/memalign.c b/util/memalign.c
index 6dfc20abbb1..ee3393cc601 100644
--- a/util/memalign.c
+++ b/util/memalign.c
@@ -26,6 +26,39 @@
 
 #include "qemu/osdep.h"
 
+void *qemu_try_memalign(size_t alignment, size_t size)
+{
+    void *ptr;
+
+    if (alignment < sizeof(void*)) {
+        alignment = sizeof(void*);
+    } else {
+        g_assert(is_power_of_2(alignment));
+    }
+
+#if defined(CONFIG_POSIX_MEMALIGN)
+    int ret;
+    ret = posix_memalign(&ptr, alignment, size);
+    if (ret != 0) {
+        errno = ret;
+        ptr = NULL;
+    }
+#elif defined(CONFIG_ALIGNED_MALLOC)
+    /* _aligned_malloc() fails on 0 size */
+    if (size) {
+        ptr = _aligned_malloc(size, alignment);
+    } else {
+        ptr = NULL;
+    }
+#elif defined(CONFIG_BSD)
+    ptr = valloc(size);
+#else
+    ptr = memalign(alignment, size);
+#endif
+    trace_qemu_memalign(alignment, size, ptr);
+    return ptr;
+}
+
 void *qemu_memalign(size_t alignment, size_t size)
 {
     void *p = qemu_try_memalign(alignment, size);
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 0278902ee79..91798f7e504 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -199,32 +199,6 @@ fail_close:
     return false;
 }
 
-void *qemu_try_memalign(size_t alignment, size_t size)
-{
-    void *ptr;
-
-    if (alignment < sizeof(void*)) {
-        alignment = sizeof(void*);
-    } else {
-        g_assert(is_power_of_2(alignment));
-    }
-
-#if defined(CONFIG_POSIX_MEMALIGN)
-    int ret;
-    ret = posix_memalign(&ptr, alignment, size);
-    if (ret != 0) {
-        errno = ret;
-        ptr = NULL;
-    }
-#elif defined(CONFIG_BSD)
-    ptr = valloc(size);
-#else
-    ptr = memalign(alignment, size);
-#endif
-    trace_qemu_memalign(alignment, size, ptr);
-    return ptr;
-}
-
 /* alloc shared memory pages */
 void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared,
                           bool noreserve)
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 8c1c64719d7..d9768532bec 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -44,24 +44,6 @@
 /* this must come after including "trace.h" */
 #include <shlobj.h>
 
-void *qemu_try_memalign(size_t alignment, size_t size)
-{
-    void *ptr;
-
-    if (alignment < sizeof(void *)) {
-        alignment = sizeof(void *);
-    } else {
-        g_assert(is_power_of_2(alignment));
-    }
-    if (size) {
-        ptr = _aligned_malloc(size, alignment);
-    } else {
-        ptr = NULL;
-    }
-    trace_qemu_memalign(alignment, size, ptr);
-    return ptr;
-}
-
 static int get_allocation_granularity(void)
 {
     SYSTEM_INFO system_info;
-- 
2.25.1


