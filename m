Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA3C4E8164
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:18:48 +0100 (CET)
Received: from localhost ([::1]:60016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY7Ff-000743-DE
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:18:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6UI-00030M-DE
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:29:51 -0400
Received: from [2001:4860:4864:20::2d] (port=32816
 helo=mail-oa1-x2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6UF-0005zb-Vy
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:29:49 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso10779801fac.0
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kcCuxlkVT075lpymlA6JruiT9pScLcSGcIoU5KgWuJw=;
 b=u4ZSZkxsqAG1mYUX8YiHStfuMI9U7Bs+FMvrw/WlD5GAzWOp+5Q05v426CuKBZcyfJ
 uFl546MqcuAzz+eezB/HN5Y5Qfh0xGJUIdIYE/TGgcam8ncXXTGHeGlZO7sRShw9XZSR
 pBD43dnXthI9QrdRhz9fjeBPTFB9jTr18j7X2aaKC+5h2WRZ1Ca/LveXukY2liQ/aWQj
 dWdNtix2Dme7B/8Ld8jCPvcJEMuKNQ1v8Hb3vtkxUGdNjt257YBelC4yMt0tdOZJBzk0
 lPwnN6S+nclZVNemy2nTSQcGniG6DA6EgvWpq+Dk5fhjeGOrpBENv1Gra7ewHXzzZvQE
 v8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kcCuxlkVT075lpymlA6JruiT9pScLcSGcIoU5KgWuJw=;
 b=CkS3n6A4+2tuNtCoZAg3urOqsjeCmHsQbxTD2GGXfwGsi7Rm4o2ULIVtgDpg6W5aU8
 HU6vW0PNuKIo+Ugj8Wejmi2HiqeZy6/Sx5giQkzt07wb03HPP0d/iXwfzYvhx023wvUP
 1AvuNIt/97Px4MjxvPGCxjpH/lkGw9G1Dg9cTWTO0F+H29K+pZzHfPUm7wCS7kp6d0SJ
 yjFaTGgbRGBPwt9K325OI9SAD9BYjfbMtpK5vQrfi+7VKoCDxk7n+Mub6mSEeH1tRFyg
 SnTxAZOrk42zrSolod7YZwuliFomWJ+Wd5oOIvtVNu1ww1XAtYjfTvnH46/DL4dsRSI7
 nUAw==
X-Gm-Message-State: AOAM532KIk3Kz4RUeThFP0XXIsDLsRLDNoApKMKQ7aaCEvX3M5F2GpEI
 mQcy2NQ4ahnqTQDjsJ0dX91CGVAx8/ZO4j7/
X-Google-Smtp-Source: ABdhPJxNKOvJihQWBa7yc33j0u+TShzDrDgmjKnmNxPhWzJbiW/rQDsd+3obVTGjAMKSoCkbIKixUg==
X-Received: by 2002:a05:6870:6108:b0:dd:ca26:f135 with SMTP id
 s8-20020a056870610800b000ddca26f135mr6978707oae.22.1648301386934; 
 Sat, 26 Mar 2022 06:29:46 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 s24-20020a056808209800b002da3b9bf8e0sm4394509oiw.32.2022.03.26.06.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:29:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 39/39] util/log: Support per-thread log files
Date: Sat, 26 Mar 2022 07:25:34 -0600
Message-Id: <20220326132534.543738-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2d
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new log flag, tid, to turn this feature on.
Require the log filename to be set, and to contain %d.

Do not allow tid to be turned off once it is on, nor let
the filename be change thereafter.  This avoids the need
for signalling each thread to re-open on a name change.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Make use of CONFIG_GETTID, and fallback to SYS_gettid.
---
 include/qemu/log.h |   1 +
 util/log.c         | 149 ++++++++++++++++++++++++++++++++++-----------
 2 files changed, 115 insertions(+), 35 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index a325bca661..c5643d8dd5 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -34,6 +34,7 @@ bool qemu_log_separate(void);
 #define CPU_LOG_PLUGIN     (1 << 18)
 /* LOG_STRACE is used for user-mode strace logging. */
 #define LOG_STRACE         (1 << 19)
+#define LOG_PER_THREAD     (1 << 20)
 
 /* Lock/unlock output. */
 
diff --git a/util/log.c b/util/log.c
index df0710720f..0bb2233788 100644
--- a/util/log.c
+++ b/util/log.c
@@ -27,6 +27,9 @@
 #include "qemu/thread.h"
 #include "qemu/lockable.h"
 #include "qemu/rcu.h"
+#ifdef CONFIG_LINUX
+#include <sys/syscall.h>
+#endif
 
 
 typedef struct RCUCloseFILE {
@@ -38,22 +41,36 @@ typedef struct RCUCloseFILE {
 static QemuMutex global_mutex;
 static char *global_filename;
 static FILE *global_file;
+static __thread FILE *thread_file;
 
 int qemu_loglevel;
-static int log_append = 0;
+static bool log_append;
+static bool log_per_thread;
 static GArray *debug_regions;
 
 /* Returns true if qemu_log() will really write somewhere. */
 bool qemu_log_enabled(void)
 {
-    return qatomic_read(&global_file) != NULL;
+    return log_per_thread || qatomic_read(&global_file) != NULL;
 }
 
 /* Returns true if qemu_log() will write somewhere other than stderr. */
 bool qemu_log_separate(void)
 {
     FILE *logfile = qatomic_read(&global_file);
-    return logfile && logfile != stderr;
+    return log_per_thread || (logfile && logfile != stderr);
+}
+
+static int log_thread_id(void)
+{
+#ifdef CONFIG_GETTID
+    return gettid();
+#elif defined(SYS_gettid)
+    return syscall(SYS_gettid);
+#else
+    static int counter;
+    return qatomic_fetch_inc(&counter);
+#endif
 }
 
 /* Lock/unlock output. */
@@ -62,20 +79,34 @@ FILE *qemu_log_trylock(void)
 {
     FILE *logfile;
 
-    rcu_read_lock();
-    /*
-     * FIXME: typeof_strip_qual, as used by qatomic_rcu_read,
-     * does not work with pointers to undefined structures,
-     * such as we have with struct _IO_FILE and musl libc.
-     * Since all we want is a read of a pointer, cast to void**,
-     * which does work with typeof_strip_qual.
-     */
-    logfile = qatomic_rcu_read((void **)&global_file);
-    if (logfile) {
-        qemu_flockfile(logfile);
-    } else {
-        rcu_read_unlock();
+    logfile = thread_file;
+    if (!logfile) {
+        if (log_per_thread) {
+            g_autofree char *filename
+                = g_strdup_printf(global_filename, log_thread_id());
+            logfile = fopen(filename, "w");
+            if (!logfile) {
+                return NULL;
+            }
+            thread_file = logfile;
+        } else {
+            rcu_read_lock();
+            /*
+             * FIXME: typeof_strip_qual, as used by qatomic_rcu_read,
+             * does not work with pointers to undefined structures,
+             * such as we have with struct _IO_FILE and musl libc.
+             * Since all we want is a read of a pointer, cast to void**,
+             * which does work with typeof_strip_qual.
+             */
+            logfile = qatomic_rcu_read((void **)&global_file);
+            if (!logfile) {
+                rcu_read_unlock();
+                return NULL;
+            }
+        }
     }
+
+    qemu_flockfile(logfile);
     return logfile;
 }
 
@@ -84,7 +115,9 @@ void qemu_log_unlock(FILE *logfile)
     if (logfile) {
         fflush(logfile);
         qemu_funlockfile(logfile);
-        rcu_read_unlock();
+        if (!log_per_thread) {
+            rcu_read_unlock();
+        }
     }
 }
 
@@ -112,40 +145,74 @@ static void rcu_close_file(RCUCloseFILE *r)
     g_free(r);
 }
 
+/**
+ * valid_filename_template:
+ *
+ * Validate the filename template.  Require %d if per_thread, allow it
+ * otherwise; require no other % within the template.
+ * Return 0 if invalid, 1 if stderr, 2 if strdup, 3 if pid printf.
+ */
+static int valid_filename_template(const char *filename,
+                                   bool per_thread, Error **errp)
+{
+    if (filename) {
+        char *pidstr = strstr(filename, "%");
+
+        if (pidstr) {
+            /* We only accept one %d, no other format strings */
+            if (pidstr[1] != 'd' || strchr(pidstr + 2, '%')) {
+                error_setg(errp, "Bad logfile template: %s", filename);
+                return 0;
+            }
+            return per_thread ? 2 : 3;
+        }
+    }
+    if (per_thread) {
+        error_setg(errp, "Filename template with '%%d' required for 'tid'");
+        return 0;
+    }
+    return filename ? 2 : 1;
+}
+
 /* enable or disable low levels log */
 static bool qemu_set_log_internal(const char *filename, bool changed_name,
                                   int log_flags, Error **errp)
 {
     bool need_to_open_file;
     bool daemonized;
+    bool per_thread;
     FILE *logfile;
 
     QEMU_LOCK_GUARD(&global_mutex);
     logfile = global_file;
 
+    per_thread = log_flags & LOG_PER_THREAD;
+
     if (changed_name) {
         char *newname = NULL;
 
         /*
-         * Allow the user to include %d in their logfile which will be
-         * substituted with the current PID. This is useful for debugging many
-         * nested linux-user tasks but will result in lots of logs.
-         *
-         * filename may be NULL. In that case, log output is sent to stderr
+         * Once threads start opening their own log files, we have no
+         * easy mechanism to tell them all to close and re-open.
+         * There seems little cause to do so either -- this option
+         * will most often be used at user-only startup.
          */
-        if (filename) {
-            char *pidstr = strstr(filename, "%");
+        if (log_per_thread) {
+            error_setg(errp, "Cannot change log filename after setting 'tid'");
+            return false;
+        }
 
-            if (pidstr) {
-                /* We only accept one %d, no other format strings */
-                if (pidstr[1] != 'd' || strchr(pidstr + 2, '%')) {
-                    error_setg(errp, "Bad logfile format: %s", filename);
-                    return false;
-                }
-                newname = g_strdup_printf(filename, getpid());
-            } else {
-                newname = g_strdup(filename);
-            }
+        switch (valid_filename_template(filename, per_thread, errp)) {
+        case 0:
+            return false; /* error */
+        case 1:
+            break;  /* stderr */
+        case 2:
+            newname = g_strdup(filename);
+            break;
+        case 3:
+            newname = g_strdup_printf(filename, getpid());
+            break;
         }
 
         g_free(global_filename);
@@ -153,8 +220,17 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
         filename = newname;
     } else {
         filename = global_filename;
+        if (per_thread && !valid_filename_template(filename, true, errp)) {
+            return false; /* error */
+        }
     }
 
+    /* Once the per-thread flag is set, it cannot be unset. */
+    if (per_thread) {
+        log_per_thread = true;
+    }
+    /* The flag itself is not relevant for need_to_open_file. */
+    log_flags &= ~LOG_PER_THREAD;
 #ifdef CONFIG_TRACE_LOG
     log_flags |= LOG_TRACE;
 #endif
@@ -163,12 +239,13 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
     /*
      * In all cases we only log if qemu_loglevel is set.
      * Also:
+     *   If per-thread, open the file for each thread in qemu_log_lock.
      *   If not daemonized we will always log either to stderr
      *     or to a file (if there is a filename).
      *   If we are daemonized, we will only log if there is a filename.
      */
     daemonized = is_daemonized();
-    need_to_open_file = log_flags && (!daemonized || filename);
+    need_to_open_file = log_flags && !per_thread && (!daemonized || filename);
 
     if (logfile && (!need_to_open_file || changed_name)) {
         qatomic_rcu_set(&global_file, NULL);
@@ -354,6 +431,8 @@ const QEMULogItem qemu_log_items[] = {
 #endif
     { LOG_STRACE, "strace",
       "log every user-mode syscall, its input, and its result" },
+    { LOG_PER_THREAD, "tid",
+      "open a separate log file per thread; filename must contain '%d'" },
     { 0, NULL, NULL },
 };
 
-- 
2.25.1


