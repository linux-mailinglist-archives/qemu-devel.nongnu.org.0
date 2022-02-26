Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB414C5757
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 19:13:19 +0100 (CET)
Received: from localhost ([::1]:41018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO1ZG-0005os-4e
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 13:13:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Ti-0005Yr-N6
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:34 -0500
Received: from [2a00:1450:4864:20::42d] (port=45005
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Te-0004Na-DC
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:33 -0500
Received: by mail-wr1-x42d.google.com with SMTP id u1so9143481wrg.11
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 10:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SoDe/ziHlSXePiaHt9j8l9tH8xjpM9yfGOu5hpZpNLA=;
 b=r0QC1VhqLpEy8UNGsu6IZsQ9Lu4XhVkqk7UcgkZyF9Dy4O5FEvY8BXDd7f/uoWQixG
 eHAR58m/xgADYOsL82b6vJL49UIgYWz4MbZF+t4TTTiuh4T88Ib3zCPpa2X3evaRpyol
 CpYRERhqYiVpOlFX9MQpfP8JZmF6kdrcwpoDlFUF2fTsBQKxyDxgVdkc/Dvjtvsy5WNl
 8VRO12BSh/H1v4aMbfm/OqHaWTUZmlANt1qeIpDOLQtREHkjX9iwdKRsfH5aaza1HpH/
 OwERPywNcSu+Z3rMqWqoNr+UjG3jN7IBlMb1rPW9bQMTEXyvMUrzs01hE7kxaL4PeE8l
 vZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SoDe/ziHlSXePiaHt9j8l9tH8xjpM9yfGOu5hpZpNLA=;
 b=Bfk2OXxPxS9y3ZNSFkRMKUZUdif0ECBkXwOdUemM/y4LnJ1jcOrzKXgeMcKtg91cfS
 Ku5nYaaE/AA9IzJ5LujJLid9XAi1JksR/3CmOrVhjIhAUzhtyaqjWTiJZjRYtDx4mszp
 7oJKBSBr/fKw3aQUgkDJlT6ZtY2WPE5CMabYUJ6gyp7/Glc1wGfEVTj5sin9bscVlIWZ
 eNFN8ppaYDdXguOcNALnWjdagJuhc+HcF/nIcARPMFh8YEKtCfNbmC5DE5nsEv1l4+i8
 8ilRC/M84HbQVbABFpw1yk0oplZLG3KFevfKSSH1Lqm2EeiHjiS9NxWlZvHx6KijydXz
 R70Q==
X-Gm-Message-State: AOAM531rzCdyISHjS1e6E2cYIDDbeHQSnfk0iWNVZu7KV+cyuyDnLY6V
 gR1xvl1DjXDMEv1njZTjvjeHru6JZOhxnQ==
X-Google-Smtp-Source: ABdhPJwKSsYkL9HucMEdWhnW2nPRdNASBfn2sNpEySZrAEU/2ziYP8KK0iHR1GdiaTAQyo/XFdZmyw==
X-Received: by 2002:a5d:56cd:0:b0:1ee:3248:525b with SMTP id
 m13-20020a5d56cd000000b001ee3248525bmr8977619wrw.124.1645898849103; 
 Sat, 26 Feb 2022 10:07:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adfe64f000000b001e60965a5d4sm5622409wrn.44.2022.02.26.10.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 10:07:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] util: Unify implementations of qemu_memalign()
Date: Sat, 26 Feb 2022 18:07:17 +0000
Message-Id: <20220226180723.1706285-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220226180723.1706285-1-peter.maydell@linaro.org>
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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


