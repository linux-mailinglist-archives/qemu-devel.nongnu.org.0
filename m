Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FA8504951
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:32:10 +0200 (CEST)
Received: from localhost ([::1]:43380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAcz-0007Vs-71
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fo-0000Zt-Sj
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:31:00 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fl-0001rv-Nf
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:31:00 -0400
Received: by mail-pl1-x634.google.com with SMTP id p10so10786208plf.9
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b3Menp0kqYZFAQFod9OpPtlki+3BWJBWWUmxTLO1mtY=;
 b=QTOYny1cm665eLVaCqCzvUy1jmBvBs6lYcHT70acgWCjFk2wr47pQXqkLo6ovnJQEe
 B33W1zgXN8UwR1jc2ExiI7VFK33p3crdXnWH4Vceyq6Rku0J8sgT7tK5DiFxArhAafar
 /xeYOx9ESMpahRl+ADR9ranwjyHh6ALEVKXUQsikL8A0+ExmDsPe4D9N4KlWO2IDg40a
 QlDSKnoUrSheLpMkBy4lYSEItz2UshlLr1LbAOTSlG7DzMXqRVI/7DQ0/VDqWCqmF21y
 DElzUhqyh+9iC6UwGSrqbMqSwXFcvLXKs7ogwax0MtfYBCIlu5UcozfYeEbEN3fHMDGL
 OGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b3Menp0kqYZFAQFod9OpPtlki+3BWJBWWUmxTLO1mtY=;
 b=KdIWCbwe3sjA8X6/FH9HZAVxoVVydUF9F6nOOvSwwaAwqZLYHtxPPbLD9Kv5lQzNj8
 NwNxPZb8FSPy3AqGYvFPibgr8wHkgZhIprA8RryiQEVCqaHU2nu3BX4Dgb4+Z3HErsNM
 9A7DCyhtEk9XJsv1jMHgh0ew9suC2gAgZXWftt1JK6/fJzVALz1i07TPlooPrVlfB796
 qeo/stDfqlkln3g7oQ9F9Pv4594aLDV71Y3vPvDh5ADBensdnF9jQX5Y0VxXwAVhYS3G
 WF/JjAGIDPCJaNTK6eYVkQorHc2oDQo7F1xmNHsij+U4rE2ngsaQvSqVikHfxC2R1YBR
 Omkw==
X-Gm-Message-State: AOAM533fmhnB0tQR2okKZh0OBzeTQQmw3az/GdTgPjTBYLuRlxckYJY/
 squC6D0ST/xb3oSkHP5v9STimCfF0V5rBQ==
X-Google-Smtp-Source: ABdhPJwq4GnOPXOzRkoOLtlXWq4Mj1ZXR2nT+7xoamk1ztytpOEV2HhNFfj+k9J5XiexR4/BHskx/g==
X-Received: by 2002:a17:902:bf04:b0:149:c5a5:5323 with SMTP id
 bi4-20020a170902bf0400b00149c5a55323mr7913109plb.97.1650220253296; 
 Sun, 17 Apr 2022 11:30:53 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 39/39] util/log: Support per-thread log files
Date: Sun, 17 Apr 2022 11:30:19 -0700
Message-Id: <20220417183019.755276-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new log flag, tid, to turn this feature on.
Require the log filename to be set, and to contain %d.

Do not allow tid to be turned off once it is on, nor let
the filename be change thereafter.  This avoids the need
for signalling each thread to re-open on a name change.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Make use of CONFIG_GETTID, and fallback to SYS_gettid.
v3: Use enum for valid_filename_template (ajb).
---
 include/qemu/log.h |   1 +
 util/log.c         | 163 +++++++++++++++++++++++++++++++++++----------
 2 files changed, 128 insertions(+), 36 deletions(-)

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
index df0710720f..d6eb0378c3 100644
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
@@ -38,22 +41,40 @@ typedef struct RCUCloseFILE {
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
-    FILE *logfile = qatomic_read(&global_file);
-    return logfile && logfile != stderr;
+    if (log_per_thread) {
+        return true;
+    } else {
+        FILE *logfile = qatomic_read(&global_file);
+        return logfile && logfile != stderr;
+    }
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
@@ -62,20 +83,34 @@ FILE *qemu_log_trylock(void)
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
 
@@ -84,7 +119,9 @@ void qemu_log_unlock(FILE *logfile)
     if (logfile) {
         fflush(logfile);
         qemu_funlockfile(logfile);
-        rcu_read_unlock();
+        if (!log_per_thread) {
+            rcu_read_unlock();
+        }
     }
 }
 
@@ -112,40 +149,81 @@ static void rcu_close_file(RCUCloseFILE *r)
     g_free(r);
 }
 
+/**
+ * valid_filename_template:
+ *
+ * Validate the filename template.  Require %d if per_thread, allow it
+ * otherwise; require no other % within the template.
+ */
+
+typedef enum {
+    vft_error,
+    vft_stderr,
+    vft_strdup,
+    vft_pid_printf,
+} ValidFilenameTemplateResult;
+
+static ValidFilenameTemplateResult
+valid_filename_template(const char *filename, bool per_thread, Error **errp)
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
+            return per_thread ? vft_strdup : vft_pid_printf;
+        }
+    }
+    if (per_thread) {
+        error_setg(errp, "Filename template with '%%d' required for 'tid'");
+        return vft_error;
+    }
+    return filename ? vft_strdup : vft_stderr;
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
+        case vft_error:
+            return false;
+        case vft_stderr:
+            break;
+        case vft_strdup:
+            newname = g_strdup(filename);
+            break;
+        case vft_pid_printf:
+            newname = g_strdup_printf(filename, getpid());
+            break;
         }
 
         g_free(global_filename);
@@ -153,8 +231,18 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
         filename = newname;
     } else {
         filename = global_filename;
+        if (per_thread &&
+            valid_filename_template(filename, true, errp) == vft_error) {
+            return false;
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
@@ -163,12 +251,13 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
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
@@ -354,6 +443,8 @@ const QEMULogItem qemu_log_items[] = {
 #endif
     { LOG_STRACE, "strace",
       "log every user-mode syscall, its input, and its result" },
+    { LOG_PER_THREAD, "tid",
+      "open a separate log file per thread; filename must contain '%d'" },
     { 0, NULL, NULL },
 };
 
-- 
2.25.1


