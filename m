Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0768B4D0480
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:49:06 +0100 (CET)
Received: from localhost ([::1]:36606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGXg-0004E8-Vv
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:49:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGVz-0001T5-80
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:19 -0500
Received: from [2a00:1450:4864:20::335] (port=56171
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGVx-0007jP-GK
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:18 -0500
Received: by mail-wm1-x335.google.com with SMTP id i66so9554896wma.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=88/vli9sz3m24lTiI0cGWu1ovNoRhU1oqr+a87iSyJw=;
 b=iDa9H092MybqwrOSEyObQw2tgUbZDEZNrbeQ6QZO49MO6OOpuzHuPBHqiWRmVLocmK
 9Xd5C4c3iCOC2KUFqf8FLj/IQYhT1/I3YwQ0PFlFiLixY9UdKFWzVOZv1HwK9LLLWErE
 We8u2K9aP14MCgRlud1MbCum2iapB6JbJ2rQIBM16w7knAdwwgrDZYdx9osetAnIibZV
 8FBJj80R3aTGXGOfz++GQpRkgqh7jz301QesimhTqIkoZtIOANphksc51NzXcOem1ODE
 7D3q3U7v12dEAjUmrIKmB2A0gah4uSFBWwchMtVh2wuCWyjxWgqBUC3C35oomyJZE8k6
 cqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=88/vli9sz3m24lTiI0cGWu1ovNoRhU1oqr+a87iSyJw=;
 b=OdqW8xCnlgqX78tIZ+UDb1Qzsaxkk+fhaHsxq2GC4ChfcGVghpXzNPAvgLbkBCQ5c5
 flNgAc6FtxMpkbBAnJo0F257n3Z34eLW/4Tu1qyZB/Ge9bIoWQfDkG591btk9Rn1/q8e
 3OeeIMmcUYHRS2tOOI93GwYkPC92fsNGao2G4xaCkmoyXZ5zeynwZxgZBS/etxM0yvmU
 ZRtegUt5pnR6ADuZmDd8tce2QFp7zf8DAmvIUjAwwjJlc3k5ieuQXQuTP0JdaxqEqIHz
 pnuob3R3MLIQSni8og0180MWxEM+lylmeHnukNI2PyCX+G6IGZCj/Z6f7MrmOOwm1Jk4
 Mf/w==
X-Gm-Message-State: AOAM530pkx5YWKudAoAS4iMVWKOip+VeP8GfzWYELUXb8PDDiyyRYy+X
 Y3Qw/s3qa0pNvQbYWHcc0ByGGD6oyamZVw==
X-Google-Smtp-Source: ABdhPJztqNFvzXrMnx3R0PVNk8UqQZD+7Iy2i1Rgg0eLwV9QGWyWB7Y2f3QS5GSFLwM/2/iMrFCKSg==
X-Received: by 2002:a05:600c:154c:b0:382:6377:14bd with SMTP id
 f12-20020a05600c154c00b00382637714bdmr9949277wmg.125.1646671636166; 
 Mon, 07 Mar 2022 08:47:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/18] util: Share qemu_try_memalign() implementation between
 POSIX and Windows
Date: Mon,  7 Mar 2022 16:46:56 +0000
Message-Id: <20220307164709.2503250-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build        |  1 +
 util/memalign.c    | 39 +++++++++++++++++++++++++++++++++++++++
 util/oslib-posix.c | 29 -----------------------------
 util/oslib-win32.c | 17 -----------------
 4 files changed, 40 insertions(+), 46 deletions(-)

diff --git a/meson.build b/meson.build
index b541506c1c5..bc0ac931e1a 100644
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
index 6dfc20abbb1..22b405700e3 100644
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
+     * platform APIs (for instance _aligned_malloc() will
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


