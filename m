Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5B24CD358
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:24:41 +0100 (CET)
Received: from localhost ([::1]:58164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ635-0005nW-TI
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:24:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ60A-0002h3-Rm
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:21:38 -0500
Received: from [2a00:1450:4864:20::32e] (port=34062
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ609-0004g5-1I
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:21:38 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 l2-20020a7bc342000000b0037fa585de26so5142670wmj.1
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 03:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3IoHncrKvkRkJHPBCTp7M3clrurRATuEJ8R1LK7s9II=;
 b=Gfz0cqsh6OEZOF/xvs43pK5q2ueuEUwHi7NGoDbibXWSpdF4WSlMuitBdmrOiC3Lfw
 XFBckkVJ350GO2xLFiibCoNApVs1QkPGvicmmDJRpa/AOfyN02GJyeF91SaHfRVhiA0k
 9Hxpv6nXOwmoR6wmGS9ycCYycnS8eoirTz5OYx1DJRDROAjF8CfNqAtFuvY+It272wyc
 rbOOBUv6OxFBIrRwz3M6kvEbcSC4ezxflUKtoBmGAEghrkryBPwOs0SgHL5qFO/7RGP4
 aRTLvES0uiNlYYiWmi8+gcI3NuOv9K99D8DzzkpuYPeb/P/ejcFvYiGjMr0YmaM7hj1X
 jlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3IoHncrKvkRkJHPBCTp7M3clrurRATuEJ8R1LK7s9II=;
 b=rCVRynB6eVTBxkuA5TzDOmeUK4LfLGirLoeoEvGtnd+jLZs+cNPTfB07LaJpWRjjWO
 CrFLq74DXd8+FpJcciNBCSf20uvG32mK+6f5+vbC32GE9Bqwf1pwMKetdShjla6LgjBN
 TsipSqSVKIs0iWCdgSGk3SxovJuWt+VNS68zBih3AU02WMY/YPGLd3jsCFvqtdDb0S2s
 xQy6bN/r8xBgqY7Ta3mTliyW3TxLs8ylJaKIVDs9RFxza0lM+Z/gBodcvhCchEqhhM3y
 Qy9lvgkOAIXB3Elcaq0EfVyHzW2cwJ/7ImxiTHiade+L+sTgik0aDZjf5kl0unyqq1hq
 j+rQ==
X-Gm-Message-State: AOAM530c8uBryKliZzU+TTf71zsXGd7iYR4sd0B9Qu7zlEsYwMDrjzVL
 ZNExT1FFQSNlna/Pm2Kvpbjgs2Y0ZdmjsQ==
X-Google-Smtp-Source: ABdhPJyzJruwHWVdGiqp78AIrD/+csvrGLHoBJlZ5n7bVIgiFJ+C+IL6LM02kHmXER4l2JLiIk0p5Q==
X-Received: by 2002:a05:600c:350f:b0:381:738e:d678 with SMTP id
 h15-20020a05600c350f00b00381738ed678mr7285640wmq.124.1646392895725; 
 Fri, 04 Mar 2022 03:21:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfed4e000000b001e3323611e5sm4148651wro.26.2022.03.04.03.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 03:21:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/9] util: Share qemu_try_memalign() implementation between
 POSIX and Windows
Date: Fri,  4 Mar 2022 11:21:23 +0000
Message-Id: <20220304112126.2261039-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304112126.2261039-1-peter.maydell@linaro.org>
References: <20220304112126.2261039-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu_try_memalign() functions for POSIX and Windows used to be
significantly different, but these days they are identical except for
the actual allocation function called, and the POSIX version already
has to have ifdeffery for different allocation functions.

Move to a single implementation in memalign.c, which uses the Windows
_aligned_malloc if we detect that function in meson.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220226180723.1706285-7-peter.maydell@linaro.org
---
 meson.build        |  1 +
 util/memalign.c    | 39 +++++++++++++++++++++++++++++++++++++++
 util/oslib-posix.c | 29 -----------------------------
 util/oslib-win32.c | 17 -----------------
 4 files changed, 40 insertions(+), 46 deletions(-)

diff --git a/meson.build b/meson.build
index 73fd17a0523..eae0e4febb3 100644
--- a/meson.build
+++ b/meson.build
@@ -1622,6 +1622,7 @@ config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'
 # Note that we need to specify prefix: here to avoid incorrectly
 # thinking that Windows has posix_memalign()
 config_host_data.set('CONFIG_POSIX_MEMALIGN', cc.has_function('posix_memalign', prefix: '#include <stdlib.h>'))
+config_host_data.set('CONFIG_ALIGNED_MALLOC', cc.has_function('_aligned_malloc'))
 config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 config_host_data.set('CONFIG_SEM_TIMEDWAIT', cc.has_function('sem_timedwait', dependencies: threads))
diff --git a/util/memalign.c b/util/memalign.c
index 6dfc20abbb1..c3280528d24 100644
--- a/util/memalign.c
+++ b/util/memalign.c
@@ -25,6 +25,45 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "trace.h"
+
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
+    /*
+     * Handling of 0 allocations varies among the different
+     * platform APIs (for instance _alligned_malloc() will
+     * fail) -- ensure that we always return a valid non-NULL
+     * pointer that can be freed by qemu_vfree().
+     */
+    if (size == 0) {
+        size++;
+    }
+#if defined(CONFIG_POSIX_MEMALIGN)
+    int ret;
+    ret = posix_memalign(&ptr, alignment, size);
+    if (ret != 0) {
+        errno = ret;
+        ptr = NULL;
+    }
+#elif defined(CONFIG_ALIGNED_MALLOC)
+    ptr = _aligned_malloc(size, alignment);
+#elif defined(CONFIG_BSD)
+    ptr = valloc(size);
+#else
+    ptr = memalign(alignment, size);
+#endif
+    trace_qemu_memalign(alignment, size, ptr);
+    return ptr;
+}
 
 void *qemu_memalign(size_t alignment, size_t size)
 {
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index f7e22f4ff9b..91798f7e504 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -199,35 +199,6 @@ fail_close:
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
-    if (size == 0) {
-        size++;
-    }
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
index 8c28d70904d..d9768532bec 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -44,23 +44,6 @@
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
-    if (size == 0) {
-        size++;
-    }
-    ptr = _aligned_malloc(size, alignment);
-    trace_qemu_memalign(alignment, size, ptr);
-    return ptr;
-}
-
 static int get_allocation_granularity(void)
 {
     SYSTEM_INFO system_info;
-- 
2.25.1


