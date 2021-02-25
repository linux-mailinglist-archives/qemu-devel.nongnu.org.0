Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 139EC32582A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 21:59:09 +0100 (CET)
Received: from localhost ([::1]:40566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFNj2-0007Qy-24
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 15:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aladjev.andrew@gmail.com>)
 id 1lFNf8-0004gs-C8
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:55:08 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:38062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aladjev.andrew@gmail.com>)
 id 1lFNf3-0000jQ-6R
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:55:06 -0500
Received: by mail-ej1-x630.google.com with SMTP id n20so11147171ejb.5
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 12:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KcNHLZzwLYJakepeA/qp5QD9v3VIF99pO/+5/IHilrw=;
 b=XeeW9RQwypcigs5JvcQc88f5R+k1EKxWGpZshrehc8C5hXjfe4HfyuGAfmsKzCy0LC
 ltNmajLelsGOH63rL2gnH1bInWfi3Z2jG+gTwVEY8eif5a60lb9XJWZkkj+kghsGgYbY
 YVzR9hkCKGPrJb0KXIR4HpyVy3mC19QxsKZ6u6jB4pTd8mFSAO2fmGBc6oJWU6LA2iYk
 EDq5qUkG9LsIFKPOjz+WHy/I8Ouzk2DGzA6iXiz2BvMoeRE6eG6Ww3WF3osz8XuNU0YP
 RCYT2nOZWoUQv0lObgr4Y8DB5d3gdgfATvvvpNitR9tfQycf3XiLnT9yH6KNAgvfa1Pc
 THRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KcNHLZzwLYJakepeA/qp5QD9v3VIF99pO/+5/IHilrw=;
 b=NhlNt7o2ZuNmqyBDjnm/zmANzulNdg7hdX28erebm6YF+iCK+wvDQFfqaV8v2IUuWI
 L3QzO4WtCijda6l4TNDOHnU0D/bQFEsrEfVZ36FoOM5cVACHywa5RkA7hPi/9WqcCzdb
 e2NMFyyQiVmk+s2kOXgMTodNCVOWBOyySB1HpR25H+35JRgBQsVdXwLpUpwS2Iqjx6rg
 5MwGtECYROM17tzn2H7RjyUleKyTWbO+/03EHs9HxCSa3MNo2D/go5ltl9aL8HtMOgbS
 tnxauRUxUw11GDV+/LgcUHkmabHLycfX5Zz2eA6l5zoZjlWiK/XMBiRER6g64J2yqYXk
 cUQg==
X-Gm-Message-State: AOAM530IWBqQyP37nVK/A8g7xf0XFy8iDKGd9IoB4dpCnP1j9luymcTr
 U5A0aGGzcw/RUbfSXxrW4SkiVdtpjUz6Mw==
X-Google-Smtp-Source: ABdhPJzhp6TRQqa9NNA7G1/SP/tz0l75EplHVeV6avUzU5sSFM9511TyE3zV3v95yqNZJjNNNC2XZA==
X-Received: by 2002:a17:906:f8c4:: with SMTP id
 lh4mr4523698ejb.14.1614286499457; 
 Thu, 25 Feb 2021 12:54:59 -0800 (PST)
Received: from mini.lan (ns331963.ip-37-187-122.eu. [37.187.122.190])
 by smtp.gmail.com with ESMTPSA id c17sm949472edw.32.2021.02.25.12.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 12:54:59 -0800 (PST)
From: aladjev.andrew@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] linux user: refactored is proc myself,
 added support for fd/<execfd>
Date: Thu, 25 Feb 2021 23:54:47 +0300
Message-Id: <20210225205448.10624-3-aladjev.andrew@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210225205448.10624-1-aladjev.andrew@gmail.com>
References: <20210225205448.10624-1-aladjev.andrew@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=aladjev.andrew@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Andrew Aladjev <aladjev.andrew@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Aladjev <aladjev.andrew@gmail.com>

---
 linux-user/syscall.c      |  12 ++--
 linux-user/syscall_proc.c | 113 +++++++++++++++++++++++++++++++-------
 linux-user/syscall_proc.h |   5 +-
 3 files changed, 101 insertions(+), 29 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 0ead34b..00ae823 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8067,18 +8067,18 @@ static int do_openat(void *cpu_env, int dirfd, const char *pathname, int flags,
         { "auxv", open_self_auxv, is_proc_myself },
         { "cmdline", open_self_cmdline, is_proc_myself },
 #if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN)
-        { "/proc/net/route", open_net_route, is_proc },
+        { "net/route", open_net_route, is_proc },
 #endif
 #if defined(TARGET_SPARC) || defined(TARGET_HPPA)
-        { "/proc/cpuinfo", open_cpuinfo, is_proc },
+        { "cpuinfo", open_cpuinfo, is_proc },
 #endif
 #if defined(TARGET_M68K)
-        { "/proc/hardware", open_hardware, is_proc },
+        { "hardware", open_hardware, is_proc },
 #endif
         { NULL, NULL, NULL }
     };
 
-    if (is_proc_myself(pathname, "exe")) {
+    if (is_proc_myself_exe(pathname)) {
         return execfd;
     }
 
@@ -9603,7 +9603,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             } else if (!arg3) {
                 /* Short circuit this for the magic exe check. */
                 ret = -TARGET_EINVAL;
-            } else if (is_proc_myself((const char *)p, "exe")) {
+            } else if (is_proc_myself_exe((const char *)p)) {
                 char real[PATH_MAX], *temp;
                 temp = realpath(exec_path, real);
                 /* Return value is # of bytes that we wrote to the buffer. */
@@ -9632,7 +9632,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             p2 = lock_user(VERIFY_WRITE, arg3, arg4, 0);
             if (!p || !p2) {
                 ret = -TARGET_EFAULT;
-            } else if (is_proc_myself((const char *)p, "exe")) {
+            } else if (is_proc_myself_exe((const char *)p)) {
                 char real[PATH_MAX], *temp;
                 temp = realpath(exec_path, real);
                 ret = temp == NULL ? get_errno(-1) : strlen(real) ;
diff --git a/linux-user/syscall_proc.c b/linux-user/syscall_proc.c
index 34051a8..3cf986b 100644
--- a/linux-user/syscall_proc.c
+++ b/linux-user/syscall_proc.c
@@ -1,32 +1,103 @@
 #include "qemu/osdep.h"
+#include "elf.h"
 
 #include "syscall_proc.h"
+#include "qemu.h"
 
-int is_proc_myself(const char *filename, const char *entry)
+#define PROC "/proc/"
+#define SELF "self/"
+#define FD   "fd/"
+
+#define STARTS_WITH(path, CONSTANT) (              \
+    strlen(path) >= strlen(CONSTANT) &&            \
+    strncmp(path, CONSTANT, strlen(CONSTANT)) == 0 \
+)
+
+static inline char *scope_to_proc(const char *path)
 {
-    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
-        filename += strlen("/proc/");
-        if (!strncmp(filename, "self/", strlen("self/"))) {
-            filename += strlen("self/");
-        } else if (*filename >= '1' && *filename <= '9') {
-            char myself[80];
-            snprintf(myself, sizeof(myself), "%d/", getpid());
-            if (!strncmp(filename, myself, strlen(myself))) {
-                filename += strlen(myself);
-            } else {
-                return 0;
-            }
-        } else {
-            return 0;
-        }
-        if (!strcmp(filename, entry)) {
-            return 1;
+    if (STARTS_WITH(path, PROC)) {
+        return (char *)path + strlen(PROC);
+    }
+
+    return NULL;
+}
+
+static inline char *scope_to_proc_myself(const char *path)
+{
+    char *scope_path = scope_to_proc(path);
+    if (scope_path == NULL) {
+        return NULL;
+    }
+
+    if (STARTS_WITH(scope_path, SELF)) {
+        return scope_path + strlen(SELF);
+    }
+
+    if (strlen(scope_path) >= 1 &&
+        *scope_path >= '1' && *scope_path <= '9') {
+        char pid_path[80];
+        snprintf(pid_path, sizeof(pid_path), "%d/", getpid());
+        if (STARTS_WITH(scope_path, pid_path)) {
+            return scope_path + strlen(pid_path);
         }
     }
-    return 0;
+
+    return NULL;
+}
+
+int is_proc(const char *path, const char *entry)
+{
+    char *scope_path = scope_to_proc(path);
+    if (scope_path == NULL) {
+        return 0;
+    }
+
+    return strcmp(scope_path, entry) == 0;
 }
 
-int is_proc(const char *filename, const char *entry)
+int is_proc_myself(const char *path, const char *entry)
 {
-    return strcmp(filename, entry) == 0;
+    char *scope_path = scope_to_proc_myself(path);
+    if (scope_path == NULL) {
+        return 0;
+    }
+
+    return strcmp(scope_path, entry) == 0;
+}
+
+/*
+ * Kernel creates "fd/#{number}" link after opening "exe" link.
+ * Both "exe" and "fd/#{number}" can be used by application.
+ *
+ * Kernel can provide infinite amount of fd numbers.
+ * QEMU is going to always return single global execfd.
+ *
+ * So we need to check "exe" and "fd/#{execfd}" only.
+ */
+
+int is_proc_myself_exe(const char *path)
+{
+    char *scope_path = scope_to_proc_myself(path);
+    if (scope_path == NULL) {
+        return 0;
+    }
+
+    if (strcmp(scope_path, "exe") == 0) {
+        return 1;
+    }
+
+    if (STARTS_WITH(scope_path, FD)) {
+        scope_path += strlen(FD);
+
+        if (strlen(scope_path) >= 1 &&
+            *scope_path >= '1' && *scope_path <= '9') {
+            char execfd_path[80];
+            snprintf(execfd_path, sizeof(execfd_path), "%d", execfd);
+            if (strcmp(scope_path, execfd_path) == 0) {
+                return 1;
+            }
+        }
+    }
+
+    return 0;
 }
diff --git a/linux-user/syscall_proc.h b/linux-user/syscall_proc.h
index 3098af9..f0e59c0 100644
--- a/linux-user/syscall_proc.h
+++ b/linux-user/syscall_proc.h
@@ -1,7 +1,8 @@
 #ifndef SYSCALL_PROC_H
 #define SYSCALL_PROC_H
 
-int is_proc(const char *filename, const char *entry);
-int is_proc_myself(const char *filename, const char *entry);
+int is_proc(const char *path, const char *entry);
+int is_proc_myself(const char *path, const char *entry);
+int is_proc_myself_exe(const char *path);
 
 #endif
-- 
2.26.2


