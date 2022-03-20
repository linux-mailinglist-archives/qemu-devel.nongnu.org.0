Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9554E1D3F
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:52:47 +0100 (CET)
Received: from localhost ([::1]:41410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzjS-0007JF-Gj
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:52:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz6C-0000V9-Sc
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:13 -0400
Received: from [2607:f8b0:4864:20::430] (port=43708
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz6A-0003XL-Vv
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:12 -0400
Received: by mail-pf1-x430.google.com with SMTP id t2so13637259pfj.10
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6BKjhVe9YK8zHmub6rTwH9wtPi9i652/xRGlwJ2BHBo=;
 b=ErDUB/8ZqoTuLoh6+Jm8ZdyvPbPilwgCSxkF/IhrBrQ968LwARoP0Zeo4drZqKwIns
 6vKAF1b5xlC1Vr2o4LCEmIo9lDCo0R2+UgWwmWqYxISiM0qy1KPNv9XUkf5UO5eltFAa
 aqsUMLbSWEZSrW5bwP/j9SX53Xbzh03q2cZQ5BAJfoxkLYfpcd3nv/tHQfXDSAhyluNV
 REF3UUyWCKoprsXYBTfUc0bILcdTH/4PdcbEJ/BjmbKtnuU3LFxwMhedgNuawi9gJpQE
 V4j2xfDZHDPaXGkO7xO6SQ5hN+ZLoeczCYlW5UhI+83/9nHqqzBnQ5wEG8/o34Vw6InT
 I/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6BKjhVe9YK8zHmub6rTwH9wtPi9i652/xRGlwJ2BHBo=;
 b=sDZrvs3tcIeatUjGifzR6aMPbnDKnpOmg1YhgIqIMIyjqHwkBL9shwSXdYSniFSVCu
 +O/O3Rd2AikoITRNe3QRhfPPiZOcq6p2leBH6CnUxQ0aIcmtdCU9XBAM6fULYOhQj0RU
 VsYik0ezlh/ap+2ZV5Q315caGRjMx9jCUrY3a7yz0oKUty+iIIrIlEewBMSOnR1Ee+4c
 aXuTY3miarRt/zXVEDKST6ZJg1DbOQF8WggTLIH5NKPlGtSBJl5Lugz2XPKGfX/hv55t
 yB/0w0XJhrKT4JyPbi7G1xmEMxh3z2y8hkALZZmvpB26r2YmuAjfhvUp2VPiUtr/FpYZ
 HdzQ==
X-Gm-Message-State: AOAM533fqoZQUZWN0FN3eoa88IBkzMyYYP2KHXfiWHNK00ACB1Lv0ttH
 9De0lCEEM7gv5qbtoUYxMlfHo5VfUeA76g==
X-Google-Smtp-Source: ABdhPJx4+yEdiODJI3HSaTOiLoO+EyKPXCL5pnmRbCyZFlkgqU0vhCzP35iEJzw0pJIgy6I1bcRBeg==
X-Received: by 2002:a63:1620:0:b0:375:948e:65bf with SMTP id
 w32-20020a631620000000b00375948e65bfmr15541465pgl.49.1647796329664; 
 Sun, 20 Mar 2022 10:12:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:12:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 36/36] util/log: Support per-thread log files
Date: Sun, 20 Mar 2022 10:11:35 -0700
Message-Id: <20220320171135.2704502-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
 include/qemu/log.h |   1 +
 util/log.c         | 130 +++++++++++++++++++++++++++++++++++----------
 2 files changed, 103 insertions(+), 28 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 783faec309..6455e47010 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -34,6 +34,7 @@ bool qemu_log_separate(void);
 #define CPU_LOG_PLUGIN     (1 << 18)
 /* LOG_STRACE is used for user-mode strace logging. */
 #define LOG_STRACE         (1 << 19)
+#define LOG_PER_THREAD     (1 << 20)
 
 /* Lock/unlock output. */
 
diff --git a/util/log.c b/util/log.c
index 713a0744be..0da67c55de 100644
--- a/util/log.c
+++ b/util/log.c
@@ -38,22 +38,34 @@ typedef struct RCUCloseFILE {
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
+#ifdef __linux__
+    return gettid(); /* ??? need syscall before glibc 2.30 */
+#else
+    static int counter;
+    return qatomic_fetch_inc(&counter);
+#endif
 }
 
 /* Lock/unlock output. */
@@ -62,13 +74,27 @@ FILE *qemu_log_lock(void)
 {
     FILE *logfile;
 
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&global_file);
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
+            logfile = qatomic_rcu_read(&global_file);
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
 
@@ -77,7 +103,9 @@ void qemu_log_unlock(FILE *logfile)
     if (logfile) {
         fflush(logfile);
         qemu_funlockfile(logfile);
-        rcu_read_unlock();
+        if (!log_per_thread) {
+            rcu_read_unlock();
+        }
     }
 }
 
@@ -114,40 +142,74 @@ static void rcu_close_file(RCUCloseFILE *r)
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
 static void qemu_set_log_internal(const char *filename, bool changed_name,
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
+            return;
+        }
 
-            if (pidstr) {
-                /* We only accept one %d, no other format strings */
-                if (pidstr[1] != 'd' || strchr(pidstr + 2, '%')) {
-                    error_setg(errp, "Bad logfile format: %s", filename);
-                    return;
-                }
-                newname = g_strdup_printf(filename, getpid());
-            } else {
-                newname = g_strdup(filename);
-            }
+        switch (valid_filename_template(filename, per_thread, errp)) {
+        case 0:
+            return; /* error */
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
@@ -155,8 +217,17 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
         filename = newname;
     } else {
         filename = global_filename;
+        if (per_thread && !valid_filename_template(filename, true, errp)) {
+            return; /* error */
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
@@ -165,12 +236,13 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
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
@@ -355,6 +427,8 @@ const QEMULogItem qemu_log_items[] = {
 #endif
     { LOG_STRACE, "strace",
       "log every user-mode syscall, its input, and its result" },
+    { LOG_PER_THREAD, "tid",
+      "open a separate log file per thread; filename must contain '%d'" },
     { 0, NULL, NULL },
 };
 
-- 
2.25.1


