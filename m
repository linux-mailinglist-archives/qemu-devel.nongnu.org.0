Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3994508FD2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:52:48 +0200 (CEST)
Received: from localhost ([::1]:60310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFRX-0007kO-Tp
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEjH-0006h2-S1
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:07:03 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:55846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEjF-0001OT-Qe
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:07:03 -0400
Received: by mail-pj1-x1036.google.com with SMTP id ll10so2656211pjb.5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mQhWQ76a/TrHDYsD63ke8s7ervjjWME9wTXb7YGDbfo=;
 b=bxiu52lk7inKHZmg4hGYeiPfJmW54c4me4qWuW/hxU7VOuDD6/b8eoo4hUlkKsliiH
 w6apNV9oO2cGOIDm1r+eDuNN0sq0zcE4stv1bC6aWRkrwjouOZgquwYsx7dBPxppaeQ7
 Xdayxm46Xu1CVUgxaHKT1ODjxkzweYqohHn0ppfxxBxbkxh/QiSPfo85O/5O/rr2r/Fg
 uyE8AsJD3U/hmdKe6o56huqzPTXpEaDI8nDfatx6dG5RRaQ9IL/fbo0bAUw2ca7flmyz
 aqOE749B2xwuO20ZlgfgDTI1vRJ8BpN52BIvxBoDqlIwNoRyNsspcx44ycjgF/CMku4g
 S/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mQhWQ76a/TrHDYsD63ke8s7ervjjWME9wTXb7YGDbfo=;
 b=sPKPrikOTE6P1hdj/LI3hSaageG018kuWtiujfrCm7MBHZ7EzygurKmCU5Koyc2/qE
 4SUg9w1QQpRCR4p+IMAstUx8sViPqrm5GVsX+89/xfBbOobKjUnWiq1p9SzVBG91exu1
 hNBOCq4AEQXQ17OFI/Ggzqsz9XDovWWJRovHp+EjImN8NWvNgC9VPbuP8UCdyoF4BOCU
 q55XB/fG/NKzjuTfoi/nSnXnmmt8Nk/h0nYrCVwMPkXoRGBvuEzpwC5ViO+8xPqkyEFt
 nnn/aMRzi2KBRZC0LxZltakpigwkm63BtiU7jrt2razIl94bO/5QkCx+BoqP7xaKJJoD
 Wllg==
X-Gm-Message-State: AOAM533dPeefRn2U55W1uDFedRa+L4EPYXi0VcXR6i4UagApqNm1gjmZ
 hnaDYUpGb1I/Uxj+uYk29oHNpK5O/LvJvA==
X-Google-Smtp-Source: ABdhPJwAhlkAkpitwC4EN4E1D8qSwKPPF28P/GS3pQaDWQ9TRxqG8bsQfZX/AVOHhAfE5GeVMruBmA==
X-Received: by 2002:a17:902:d64a:b0:158:9521:2d1a with SMTP id
 y10-20020a170902d64a00b0015895212d1amr21727515plh.80.1650478020299; 
 Wed, 20 Apr 2022 11:07:00 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/39] util/log: Support per-thread log files
Date: Wed, 20 Apr 2022 11:06:18 -0700
Message-Id: <20220420180618.1183855-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new log flag, tid, to turn this feature on.
Require the log filename to be set, and to contain %d.

Do not allow tid to be turned off once it is on, nor let
the filename be change thereafter.  This avoids the need
for signalling each thread to re-open on a name change.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-40-richard.henderson@linaro.org>
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
2.34.1


