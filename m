Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392F24D048A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:51:10 +0100 (CET)
Received: from localhost ([::1]:44476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGZh-0000xM-8z
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:51:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGVx-0001MH-3R
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:17 -0500
Received: from [2a00:1450:4864:20::436] (port=41979
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGVu-0007is-UT
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:16 -0500
Received: by mail-wr1-x436.google.com with SMTP id i8so24261541wrr.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9VfQ5wi2gw0vpXzXf74eUVOgttIcr7mfX30dEcsQ3oM=;
 b=S7gZrJQ4mYMIduPfWXEFFEcAhjU1yxS4OLf9eRBpw6cSxvF4PdAslKPU3P8Q1f7/+f
 /PcrmSI+BGPCceHc7Xe828ZIbLLbZYLukvMil0igPaBE7kHxjElcp80MMlHNxCA4HLGe
 AyuRnaz9MmJzioqwILRzBW0Ws15bVc78LwAZAvQ93nMqhv3f5stCtJMGef4C8/ivd6Pz
 G6w34/Mpq/agOTrZ87sPo5J3oLJpbjxdyefmn6//E5pf050pRFYOng+i0W1mPWSRxdQ0
 DNU1UIFA81Ek/bwzbfEJA0hspadT764TVlQ0wfP89OProfw6wgAyHpRj9AjC5QGA1KXj
 gP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9VfQ5wi2gw0vpXzXf74eUVOgttIcr7mfX30dEcsQ3oM=;
 b=5EPs/UXrg+LDy9IoOEfSmyOM5XhbA1IU2aAGSb07s+a55QEpNdwyKFPZBSao2i4At6
 9oCkzhiEKMtteY/KLTsw9dqumByyN4nteIdc8pRlk9x1/VH3f6aGr37eZVtDNvGVpP8G
 mmpJJODfvFGMY6dJB97NCnXiUXdT+gwOj2lqOsU90eC6h3kXRk4j2ZM1c8P7Jv5c1z9j
 DUkvwBZ1JJ4/bzzyJrQKNpoDtBcBNYqrMPwBcCub3cJ+pONXfHE56FNQsAjrtPy+DmrX
 6w8HITDAt3Mzmog6jocmuYDqXg+H9dmpCqblRRQAsreKi+522ZrB+0amj5d19YNju/qd
 NIdA==
X-Gm-Message-State: AOAM532D71V8xt4yb/gNi/DQJIf8/IlaIQCtNxNKDFBqt8jWPIqm6CpR
 xnr1Ab9PPDJ+ne7MoNnVsYvjzCQWEcaqZw==
X-Google-Smtp-Source: ABdhPJzmOsML2CZV6cCofCeafLNjUlflxUjIQWiS5KhuArxIS/YkXMgJR8wBEnTH+HLBudCkytbKWA==
X-Received: by 2002:a5d:5911:0:b0:1f0:3272:2ac9 with SMTP id
 v17-20020a5d5911000000b001f032722ac9mr8751180wrd.1.1646671633620; 
 Mon, 07 Mar 2022 08:47:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/18] util: Unify implementations of qemu_memalign()
Date: Mon,  7 Mar 2022 16:46:53 +0000
Message-Id: <20220307164709.2503250-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

We implement qemu_memalign() in both oslib-posix.c and oslib-win32.c,
but the two versions are essentially the same: they call
qemu_try_memalign(), and abort() after printing an error message if
it fails.  The only difference is that the win32 version prints the
GetLastError() value whereas the POSIX version prints
strerror(errno).  However, this is a bug in the win32 version: in
commit dfbd0b873a85021 in 2020 we changed the implementation of
qemu_try_memalign() from using VirtualAlloc() (which sets the
GetLastError() value) to using _aligned_malloc() (which sets errno),
but didn't update the error message to match.

Replace the two separate functions with a single version in a
new memalign.c file, which drops the unnecessary extra qemu_oom_check()
function and instead prints a more useful message including the
requested size and alignment as well as the errno string.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220226180723.1706285-4-peter.maydell@linaro.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 util/memalign.c    | 39 +++++++++++++++++++++++++++++++++++++++
 util/oslib-posix.c | 14 --------------
 util/oslib-win32.c | 14 --------------
 util/meson.build   |  1 +
 4 files changed, 40 insertions(+), 28 deletions(-)
 create mode 100644 util/memalign.c

diff --git a/util/memalign.c b/util/memalign.c
new file mode 100644
index 00000000000..6dfc20abbb1
--- /dev/null
+++ b/util/memalign.c
@@ -0,0 +1,39 @@
+/*
+ * memalign.c: Allocate an aligned memory region
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ * Copyright (c) 2010-2016 Red Hat, Inc.
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+
+void *qemu_memalign(size_t alignment, size_t size)
+{
+    void *p = qemu_try_memalign(alignment, size);
+    if (p) {
+        return p;
+    }
+    fprintf(stderr,
+            "qemu_memalign: failed to allocate %zu bytes at alignment %zu: %s\n",
+            size, alignment, strerror(errno));
+    abort();
+}
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index ed5974d3845..0278902ee79 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -199,15 +199,6 @@ fail_close:
     return false;
 }
 
-static void *qemu_oom_check(void *ptr)
-{
-    if (ptr == NULL) {
-        fprintf(stderr, "Failed to allocate memory: %s\n", strerror(errno));
-        abort();
-    }
-    return ptr;
-}
-
 void *qemu_try_memalign(size_t alignment, size_t size)
 {
     void *ptr;
@@ -234,11 +225,6 @@ void *qemu_try_memalign(size_t alignment, size_t size)
     return ptr;
 }
 
-void *qemu_memalign(size_t alignment, size_t size)
-{
-    return qemu_oom_check(qemu_try_memalign(alignment, size));
-}
-
 /* alloc shared memory pages */
 void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared,
                           bool noreserve)
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index c87e6977246..05857414695 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -44,15 +44,6 @@
 /* this must come after including "trace.h" */
 #include <shlobj.h>
 
-static void *qemu_oom_check(void *ptr)
-{
-    if (ptr == NULL) {
-        fprintf(stderr, "Failed to allocate memory: %lu\n", GetLastError());
-        abort();
-    }
-    return ptr;
-}
-
 void *qemu_try_memalign(size_t alignment, size_t size)
 {
     void *ptr;
@@ -68,11 +59,6 @@ void *qemu_try_memalign(size_t alignment, size_t size)
     return ptr;
 }
 
-void *qemu_memalign(size_t alignment, size_t size)
-{
-    return qemu_oom_check(qemu_try_memalign(alignment, size));
-}
-
 static int get_allocation_granularity(void)
 {
     SYSTEM_INFO system_info;
diff --git a/util/meson.build b/util/meson.build
index 3736988b9f6..f6ee74ad0c8 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -51,6 +51,7 @@ util_ss.add(when: 'CONFIG_POSIX', if_true: files('drm.c'))
 util_ss.add(files('guest-random.c'))
 util_ss.add(files('yank.c'))
 util_ss.add(files('int128.c'))
+util_ss.add(files('memalign.c'))
 
 if have_user
   util_ss.add(files('selfmap.c'))
-- 
2.25.1


