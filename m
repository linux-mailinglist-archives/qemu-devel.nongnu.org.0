Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91EE50F71A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 11:36:48 +0200 (CEST)
Received: from localhost ([::1]:50086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njHcl-0001aB-SQ
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 05:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHUU-0002bW-97
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:28:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHUR-0006F1-S9
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650965291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMVPhdrlzVEd06o+UUcoyzxI+0+cEwHGGptVjniS6Zc=;
 b=hdk+ZvI+zr6JdPTd48g3IEdaAdxuJ9W0gx5XH/yQxihv7xsOD+J5/OoolfJg+hCYxost8F
 4X6vExDSfkScUl/qE3Ykkb51FUgmmTvGjGJe3ZEGUcAtrCkHYB/BCvE5ewohoToAGdWsIU
 3fLCB0UMRi4TcfLLkDvr74Bn2CQqq6k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-MhawHTbLOeuEAYa08xtj6g-1; Tue, 26 Apr 2022 05:28:08 -0400
X-MC-Unique: MhawHTbLOeuEAYa08xtj6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38A9329AB403;
 Tue, 26 Apr 2022 09:27:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C651241136E0;
 Tue, 26 Apr 2022 09:27:45 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/26] include: move qemu_*_exec_dir() to cutils
Date: Tue, 26 Apr 2022 13:26:52 +0400
Message-Id: <20220426092715.3931705-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Weil <sw@weilnetz.de>,
 Bandan Das <bsd@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The function is required by get_relocated_path() (already in cutils),
and used by qemu-ga and may be generally useful.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/cutils.h                |   7 ++
 include/qemu/osdep.h                 |   8 --
 qemu-io.c                            |   1 +
 storage-daemon/qemu-storage-daemon.c |   1 +
 tests/qtest/fuzz/fuzz.c              |   1 +
 util/cutils.c                        | 108 +++++++++++++++++++++++++++
 util/oslib-posix.c                   |  81 --------------------
 util/oslib-win32.c                   |  36 ---------
 8 files changed, 118 insertions(+), 125 deletions(-)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 5c6572d44422..40e10e19a7ed 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -193,6 +193,13 @@ int uleb128_decode_small(const uint8_t *in, uint32_t *n);
  */
 int qemu_pstrcmp0(const char **str1, const char **str2);
 
+/* Find program directory, and save it for later usage with
+ * qemu_get_exec_dir().
+ * Try OS specific API first, if not working, parse from argv0. */
+void qemu_init_exec_dir(const char *argv0);
+
+/* Get the saved exec dir.  */
+const char *qemu_get_exec_dir(void);
 
 /**
  * get_relocated_path:
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index baaa23c1568d..220b44f710e5 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -564,14 +564,6 @@ bool fips_get_state(void);
  */
 char *qemu_get_local_state_dir(void);
 
-/* Find program directory, and save it for later usage with
- * qemu_get_exec_dir().
- * Try OS specific API first, if not working, parse from argv0. */
-void qemu_init_exec_dir(const char *argv0);
-
-/* Get the saved exec dir.  */
-const char *qemu_get_exec_dir(void);
-
 /**
  * qemu_getauxval:
  * @type: the auxiliary vector key to lookup
diff --git a/qemu-io.c b/qemu-io.c
index d70d3dd4fde5..2bd7bfb65073 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -16,6 +16,7 @@
 #endif
 
 #include "qemu/help-texts.h"
+#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "qemu-io.h"
 #include "qemu/error-report.h"
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 9b8b17f52e48..c104817cdddc 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -44,6 +44,7 @@
 
 #include "qemu/help-texts.h"
 #include "qemu-version.h"
+#include "qemu/cutils.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "qemu/help_option.h"
diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index 5f77c849837f..d3afd294db24 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -15,6 +15,7 @@
 
 #include <wordexp.h>
 
+#include "qemu/cutils.h"
 #include "qemu/datadir.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
diff --git a/util/cutils.c b/util/cutils.c
index b2777210e7da..6cc7cc8cde99 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -931,6 +931,114 @@ static inline const char *next_component(const char *dir, int *p_len)
     return dir;
 }
 
+static const char *exec_dir;
+
+void qemu_init_exec_dir(const char *argv0)
+{
+#ifdef G_OS_WIN32
+    char *p;
+    char buf[MAX_PATH];
+    DWORD len;
+
+    if (exec_dir) {
+        return;
+    }
+
+    len = GetModuleFileName(NULL, buf, sizeof(buf) - 1);
+    if (len == 0) {
+        return;
+    }
+
+    buf[len] = 0;
+    p = buf + len - 1;
+    while (p != buf && *p != '\\') {
+        p--;
+    }
+    *p = 0;
+    if (access(buf, R_OK) == 0) {
+        exec_dir = g_strdup(buf);
+    } else {
+        exec_dir = CONFIG_BINDIR;
+    }
+#else
+    char *p = NULL;
+    char buf[PATH_MAX];
+
+    if (exec_dir) {
+        return;
+    }
+
+#if defined(__linux__)
+    {
+        int len;
+        len = readlink("/proc/self/exe", buf, sizeof(buf) - 1);
+        if (len > 0) {
+            buf[len] = 0;
+            p = buf;
+        }
+    }
+#elif defined(__FreeBSD__) \
+      || (defined(__NetBSD__) && defined(KERN_PROC_PATHNAME))
+    {
+#if defined(__FreeBSD__)
+        static int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_PATHNAME, -1};
+#else
+        static int mib[4] = {CTL_KERN, KERN_PROC_ARGS, -1, KERN_PROC_PATHNAME};
+#endif
+        size_t len = sizeof(buf) - 1;
+
+        *buf = '\0';
+        if (!sysctl(mib, ARRAY_SIZE(mib), buf, &len, NULL, 0) &&
+            *buf) {
+            buf[sizeof(buf) - 1] = '\0';
+            p = buf;
+        }
+    }
+#elif defined(__APPLE__)
+    {
+        char fpath[PATH_MAX];
+        uint32_t len = sizeof(fpath);
+        if (_NSGetExecutablePath(fpath, &len) == 0) {
+            p = realpath(fpath, buf);
+            if (!p) {
+                return;
+            }
+        }
+    }
+#elif defined(__HAIKU__)
+    {
+        image_info ii;
+        int32_t c = 0;
+
+        *buf = '\0';
+        while (get_next_image_info(0, &c, &ii) == B_OK) {
+            if (ii.type == B_APP_IMAGE) {
+                strncpy(buf, ii.name, sizeof(buf));
+                buf[sizeof(buf) - 1] = 0;
+                p = buf;
+                break;
+            }
+        }
+    }
+#endif
+    /* If we don't have any way of figuring out the actual executable
+       location then try argv[0].  */
+    if (!p && argv0) {
+        p = realpath(argv0, buf);
+    }
+    if (p) {
+        exec_dir = g_path_get_dirname(p);
+    } else {
+        exec_dir = CONFIG_BINDIR;
+    }
+#endif
+}
+
+const char *qemu_get_exec_dir(void)
+{
+    return exec_dir;
+}
+
 char *get_relocated_path(const char *dir)
 {
     size_t prefix_len = strlen(CONFIG_PREFIX);
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index b8bf7d4070ce..03d97741562c 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -317,87 +317,6 @@ void qemu_set_tty_echo(int fd, bool echo)
     tcsetattr(fd, TCSANOW, &tty);
 }
 
-static const char *exec_dir;
-
-void qemu_init_exec_dir(const char *argv0)
-{
-    char *p = NULL;
-    char buf[PATH_MAX];
-
-    if (exec_dir) {
-        return;
-    }
-
-#if defined(__linux__)
-    {
-        int len;
-        len = readlink("/proc/self/exe", buf, sizeof(buf) - 1);
-        if (len > 0) {
-            buf[len] = 0;
-            p = buf;
-        }
-    }
-#elif defined(__FreeBSD__) \
-      || (defined(__NetBSD__) && defined(KERN_PROC_PATHNAME))
-    {
-#if defined(__FreeBSD__)
-        static int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_PATHNAME, -1};
-#else
-        static int mib[4] = {CTL_KERN, KERN_PROC_ARGS, -1, KERN_PROC_PATHNAME};
-#endif
-        size_t len = sizeof(buf) - 1;
-
-        *buf = '\0';
-        if (!sysctl(mib, ARRAY_SIZE(mib), buf, &len, NULL, 0) &&
-            *buf) {
-            buf[sizeof(buf) - 1] = '\0';
-            p = buf;
-        }
-    }
-#elif defined(__APPLE__)
-    {
-        char fpath[PATH_MAX];
-        uint32_t len = sizeof(fpath);
-        if (_NSGetExecutablePath(fpath, &len) == 0) {
-            p = realpath(fpath, buf);
-            if (!p) {
-                return;
-            }
-        }
-    }
-#elif defined(__HAIKU__)
-    {
-        image_info ii;
-        int32_t c = 0;
-
-        *buf = '\0';
-        while (get_next_image_info(0, &c, &ii) == B_OK) {
-            if (ii.type == B_APP_IMAGE) {
-                strncpy(buf, ii.name, sizeof(buf));
-                buf[sizeof(buf) - 1] = 0;
-                p = buf;
-                break;
-            }
-        }
-    }
-#endif
-    /* If we don't have any way of figuring out the actual executable
-       location then try argv[0].  */
-    if (!p && argv0) {
-        p = realpath(argv0, buf);
-    }
-    if (p) {
-        exec_dir = g_path_get_dirname(p);
-    } else {
-        exec_dir = CONFIG_BINDIR;
-    }
-}
-
-const char *qemu_get_exec_dir(void)
-{
-    return exec_dir;
-}
-
 #ifdef CONFIG_LINUX
 static void sigbus_handler(int signal, siginfo_t *siginfo, void *ctx)
 #else /* CONFIG_LINUX */
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 9c1e8121fd6d..9483c4c1d5de 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -269,42 +269,6 @@ void qemu_set_tty_echo(int fd, bool echo)
     }
 }
 
-static const char *exec_dir;
-
-void qemu_init_exec_dir(const char *argv0)
-{
-
-    char *p;
-    char buf[MAX_PATH];
-    DWORD len;
-
-    if (exec_dir) {
-        return;
-    }
-
-    len = GetModuleFileName(NULL, buf, sizeof(buf) - 1);
-    if (len == 0) {
-        return;
-    }
-
-    buf[len] = 0;
-    p = buf + len - 1;
-    while (p != buf && *p != '\\') {
-        p--;
-    }
-    *p = 0;
-    if (access(buf, R_OK) == 0) {
-        exec_dir = g_strdup(buf);
-    } else {
-        exec_dir = CONFIG_BINDIR;
-    }
-}
-
-const char *qemu_get_exec_dir(void)
-{
-    return exec_dir;
-}
-
 int getpagesize(void)
 {
     SYSTEM_INFO system_info;
-- 
2.36.0


