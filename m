Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C3E100D8B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 22:19:09 +0100 (CET)
Received: from localhost ([::1]:39572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWoQO-0002B4-4l
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 16:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35828)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1iWoNG-0000CP-Qu
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 16:15:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1iWoNC-0005nI-So
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 16:15:54 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:41824)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1iWoNC-0005mz-L2
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 16:15:50 -0500
Received: by mail-pj1-x1044.google.com with SMTP id gc1so1855561pjb.8
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 13:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6zFafoqTW3uPdJsr8GKkTOXriqaT1mVv+FpYjpXcCxY=;
 b=JvEy/RpTQtWzjgIQHY/e+anPllqfckTZGIOdSunK+2/095mKfTOPQHfQ0xbp4RaulX
 q3G2DdIykajgMtMx2jY7aDRZMLmJd60RYW4k9oaS9ZIx5y50muVuqlqDMzyb4lkkWHeP
 /KkDFPhQu6wRNW6s5syj4H77al7g2J+v9e188b3o/nTNhYdTgX24Xdpbz2oHVuLQ+807
 oxfjiyjTSIf6pxlYLE18ughwTAJuWoAEaaYG/epqzhpoeRARxsttsvcU14BCXdk9eQNZ
 TfEyOkyIMBymXd9Pp5vz8Jk+667AbkGDciZTNmcR62o38xXOtPfPvCb45ipA5m2gFd5U
 oCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6zFafoqTW3uPdJsr8GKkTOXriqaT1mVv+FpYjpXcCxY=;
 b=RZ7JF3UJYn27UuOBuQIJW159OL/mGCtU6Kx7QZfEAGfgIQAQjtCo5hq17UATxbmI+P
 Uwii4k6QQWznANxuMEEVCVK7RgddIln5bGu/nC1gCix7BOd4U4tsQlc5QrUXHL659Gng
 xn9ypLHP4uwsHxV6QzyhQLAkUQjuCCBlNPWUXjfr0uOVMsx7Tbg05qa2fFcJpjNALimP
 1b1Etsnh1NcT4D0cnFSKQf/rVGvw13D+x6iL0BPnHHchwNYnbAjOX2M3Wn/OUsqe7885
 5Ns8iU4ywMhc8H4fBPDEndFZk/inY6oi9XLivlEfG8p7DofhUHpxmcl1+em+HmIpJ+vS
 EhpA==
X-Gm-Message-State: APjAAAVgNuvfo4wlOKBeV6k8lqRjDznIS8GuCkdDCplf69WYBytWVzYk
 z1bxMNDPROEOD6+o358NBU1TnlwOXdU=
X-Google-Smtp-Source: APXvYqxN9S695Iqu/fOnlrtofypDvmYZS8bmGudUr6G3b5RDHGxi+5EhoEEpsaTwQZHyUb8qOMR5QQ==
X-Received: by 2002:a17:90a:7188:: with SMTP id i8mr1397842pjk.6.1574111749238; 
 Mon, 18 Nov 2019 13:15:49 -0800 (PST)
Received: from Rfoley-MA01.usrd.futurewei.com ([12.111.81.71])
 by smtp.gmail.com with ESMTPSA id v15sm22301728pfe.44.2019.11.18.13.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 13:15:48 -0800 (PST)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] Add use of RCU for qemu_logfile.
Date: Mon, 18 Nov 2019 16:15:27 -0500
Message-Id: <20191118211528.3221-6-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118211528.3221-1-robert.foley@linaro.org>
References: <20191118211528.3221-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org,
 robert.foley@linaro.org, peter.puhov@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This now allows changing the logfile while logging is active,
and also solves the issue of a seg fault while changing the logfile.

Any read access to the qemu_logfile handle will use
the rcu_read_lock()/unlock() around the use of the handle.
To fetch the handle we will use atomic_rcu_read().
We also in many cases do a check for validity of the
logfile handle before using it to deal with the case where the
file is closed and set to NULL.

The cases where we write to the qemu_logfile will use atomic_rcu_set().
Writers will also use call_rcu() with a newly added qemu_logfile_free
function for freeing/closing when readers have finished.

Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
v3
    - Changes for qemu_log_lock() to unconditionally  
      hold the rcu_read_lock() until qemu_log_unlock()
    - Changed qemu_log_unlock() to unconditionally rcu_read_unlock()
---
v2
    - No specific changes, just merging in cleanup changes in qemu_set_log().
---
v1
    - Changes for review comments.
    - Minor changes to definition of QemuLogFile.
    - Changed qemu_log_separate() to fix unbalanced and 
      remove qemu_log_enabled() check.
    - changed qemu_log_lock() to include else.
    - make qemu_logfile_free static.
    - use g_assert(logfile) in qemu_logfile_free.
    - Relocated unlock out of if/else in qemu_log_close(), and
      in qemu_set_log().
---
 include/qemu/log.h | 41 ++++++++++++++++++++++----
 util/log.c         | 72 ++++++++++++++++++++++++++++++++--------------
 include/exec/log.h | 33 ++++++++++++++++++---
 tcg/tcg.c          | 12 ++++++--
 4 files changed, 125 insertions(+), 33 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index a7c5b01571..e0f4e40628 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -3,9 +3,16 @@
 
 /* A small part of this API is split into its own header */
 #include "qemu/log-for-trace.h"
+#include "qemu/rcu.h"
+
+typedef struct QemuLogFile {
+    struct rcu_head rcu;
+    FILE *fd;
+} QemuLogFile;
 
 /* Private global variable, don't use */
-extern FILE *qemu_logfile;
+extern QemuLogFile *qemu_logfile;
+
 
 /* 
  * The new API:
@@ -25,7 +32,16 @@ static inline bool qemu_log_enabled(void)
  */
 static inline bool qemu_log_separate(void)
 {
-    return qemu_logfile != NULL && qemu_logfile != stderr;
+    QemuLogFile *logfile;
+    bool res = false;
+
+    rcu_read_lock();
+    logfile = atomic_rcu_read(&qemu_logfile);
+    if (logfile && logfile->fd != stderr) {
+        res = true;
+    }
+    rcu_read_unlock();
+    return res;
 }
 
 #define CPU_LOG_TB_OUT_ASM (1 << 0)
@@ -55,8 +71,15 @@ static inline bool qemu_log_separate(void)
 
 static inline FILE *qemu_log_lock(void)
 {
-    qemu_flockfile(qemu_logfile);
-    return logfile->fd;
+    QemuLogFile *logfile;
+    rcu_read_lock();
+    logfile = atomic_rcu_read(&qemu_logfile);
+    if (logfile) {
+        qemu_flockfile(logfile->fd);
+        return logfile->fd;
+    } else {
+        return NULL;
+    }
 }
 
 static inline void qemu_log_unlock(FILE *fd)
@@ -64,6 +87,7 @@ static inline void qemu_log_unlock(FILE *fd)
     if (fd) {
         qemu_funlockfile(fd);
     }
+    rcu_read_unlock();
 }
 
 /* Logging functions: */
@@ -73,9 +97,14 @@ static inline void qemu_log_unlock(FILE *fd)
 static inline void GCC_FMT_ATTR(1, 0)
 qemu_log_vprintf(const char *fmt, va_list va)
 {
-    if (qemu_logfile) {
-        vfprintf(qemu_logfile, fmt, va);
+    QemuLogFile *logfile;
+
+    rcu_read_lock();
+    logfile = atomic_rcu_read(&qemu_logfile);
+    if (logfile) {
+        vfprintf(logfile->fd, fmt, va);
     }
+    rcu_read_unlock();
 }
 
 /* log only if a bit is set on the current loglevel mask:
diff --git a/util/log.c b/util/log.c
index 953a66b5a8..867264da8d 100644
--- a/util/log.c
+++ b/util/log.c
@@ -28,7 +28,7 @@
 
 static char *logfilename;
 static QemuMutex qemu_logfile_mutex;
-FILE *qemu_logfile;
+QemuLogFile *qemu_logfile;
 int qemu_loglevel;
 static int log_append = 0;
 static GArray *debug_regions;
@@ -37,10 +37,14 @@ static GArray *debug_regions;
 int qemu_log(const char *fmt, ...)
 {
     int ret = 0;
-    if (qemu_logfile) {
+    QemuLogFile *logfile;
+
+    rcu_read_lock();
+    logfile = atomic_rcu_read(&qemu_logfile);
+    if (logfile) {
         va_list ap;
         va_start(ap, fmt);
-        ret = vfprintf(qemu_logfile, fmt, ap);
+        ret = vfprintf(logfile->fd, fmt, ap);
         va_end(ap);
 
         /* Don't pass back error results.  */
@@ -48,6 +52,7 @@ int qemu_log(const char *fmt, ...)
             ret = 0;
         }
     }
+    rcu_read_unlock();
     return ret;
 }
 
@@ -56,12 +61,24 @@ static void __attribute__((__constructor__)) qemu_logfile_init(void)
     qemu_mutex_init(&qemu_logfile_mutex);
 }
 
+static void qemu_logfile_free(QemuLogFile *logfile)
+{
+    g_assert(logfile);
+
+    if (logfile->fd != stderr) {
+        fclose(logfile->fd);
+    }
+    g_free(logfile);
+}
+
 static bool log_uses_own_buffers;
 
 /* enable or disable low levels log */
 void qemu_set_log(int log_flags)
 {
     bool need_to_open_file = false;
+    QemuLogFile *logfile;
+
     qemu_loglevel = log_flags;
 #ifdef CONFIG_TRACE_LOG
     qemu_loglevel |= LOG_TRACE;
@@ -79,43 +96,47 @@ void qemu_set_log(int log_flags)
     }
     qemu_mutex_lock(&qemu_logfile_mutex);
     if (qemu_logfile && !need_to_open_file) {
-        qemu_mutex_unlock(&qemu_logfile_mutex);
-        qemu_log_close();
+        logfile = qemu_logfile;
+        atomic_rcu_set(&qemu_logfile, NULL);
+        call_rcu(logfile, qemu_logfile_free, rcu);
     } else if (!qemu_logfile && need_to_open_file) {
+        logfile = g_new0(QemuLogFile, 1);
         if (logfilename) {
-            qemu_logfile = fopen(logfilename, log_append ? "a" : "w");
-            if (!qemu_logfile) {
+            logfile->fd = fopen(logfilename, log_append ? "a" : "w");
+            if (!logfile->fd) {
+                g_free(logfile);
                 perror(logfilename);
                 _exit(1);
             }
             /* In case we are a daemon redirect stderr to logfile */
             if (is_daemonized()) {
-                dup2(fileno(qemu_logfile), STDERR_FILENO);
-                fclose(qemu_logfile);
+                dup2(fileno(logfile->fd), STDERR_FILENO);
+                fclose(logfile->fd);
                 /* This will skip closing logfile in qemu_log_close() */
-                qemu_logfile = stderr;
+                logfile->fd = stderr;
             }
         } else {
             /* Default to stderr if no log file specified */
             assert(!is_daemonized());
-            qemu_logfile = stderr;
+            logfile->fd = stderr;
         }
         /* must avoid mmap() usage of glibc by setting a buffer "by hand" */
         if (log_uses_own_buffers) {
             static char logfile_buf[4096];
 
-            setvbuf(qemu_logfile, logfile_buf, _IOLBF, sizeof(logfile_buf));
+            setvbuf(logfile->fd, logfile_buf, _IOLBF, sizeof(logfile_buf));
         } else {
 #if defined(_WIN32)
             /* Win32 doesn't support line-buffering, so use unbuffered output. */
-            setvbuf(qemu_logfile, NULL, _IONBF, 0);
+            setvbuf(logfile->fd, NULL, _IONBF, 0);
 #else
-            setvbuf(qemu_logfile, NULL, _IOLBF, 0);
+            setvbuf(logfile->fd, NULL, _IOLBF, 0);
 #endif
             log_append = 1;
         }
-        qemu_mutex_unlock(&qemu_logfile_mutex);
+        atomic_rcu_set(&qemu_logfile, logfile);
     }
+    qemu_mutex_unlock(&qemu_logfile_mutex);
 }
 
 void qemu_log_needs_buffers(void)
@@ -244,18 +265,27 @@ out:
 /* fflush() the log file */
 void qemu_log_flush(void)
 {
-    fflush(qemu_logfile);
+    QemuLogFile *logfile;
+
+    rcu_read_lock();
+    logfile = atomic_rcu_read(&qemu_logfile);
+    if (logfile) {
+        fflush(logfile->fd);
+    }
+    rcu_read_unlock();
 }
 
 /* Close the log file */
 void qemu_log_close(void)
 {
+    QemuLogFile *logfile;
+
     qemu_mutex_lock(&qemu_logfile_mutex);
-    if (qemu_logfile) {
-        if (qemu_logfile != stderr) {
-            fclose(qemu_logfile);
-        }
-        qemu_logfile = NULL;
+    logfile = qemu_logfile;
+
+    if (logfile) {
+        atomic_rcu_set(&qemu_logfile, NULL);
+        call_rcu(logfile, qemu_logfile_free, rcu);
     }
     qemu_mutex_unlock(&qemu_logfile_mutex);
 }
diff --git a/include/exec/log.h b/include/exec/log.h
index e2cfd436e6..9bd1e4aa20 100644
--- a/include/exec/log.h
+++ b/include/exec/log.h
@@ -15,8 +15,15 @@
  */
 static inline void log_cpu_state(CPUState *cpu, int flags)
 {
+    QemuLogFile *logfile;
+
     if (qemu_log_enabled()) {
-        cpu_dump_state(cpu, qemu_logfile, flags);
+        rcu_read_lock();
+        logfile = atomic_rcu_read(&qemu_logfile);
+        if (logfile) {
+            cpu_dump_state(cpu, logfile->fd, flags);
+        }
+        rcu_read_unlock();
     }
 }
 
@@ -40,19 +47,37 @@ static inline void log_cpu_state_mask(int mask, CPUState *cpu, int flags)
 static inline void log_target_disas(CPUState *cpu, target_ulong start,
                                     target_ulong len)
 {
-    target_disas(qemu_logfile, cpu, start, len);
+    QemuLogFile *logfile;
+    rcu_read_lock();
+    logfile = atomic_rcu_read(&qemu_logfile);
+    if (logfile) {
+        target_disas(logfile->fd, cpu, start, len);
+    }
+    rcu_read_unlock();
 }
 
 static inline void log_disas(void *code, unsigned long size)
 {
-    disas(qemu_logfile, code, size);
+    QemuLogFile *logfile;
+    rcu_read_lock();
+    logfile = atomic_rcu_read(&qemu_logfile);
+    if (logfile) {
+        disas(logfile->fd, code, size);
+    }
+    rcu_read_unlock();
 }
 
 #if defined(CONFIG_USER_ONLY)
 /* page_dump() output to the log file: */
 static inline void log_page_dump(void)
 {
-    page_dump(qemu_logfile);
+    QemuLogFile *logfile;
+    rcu_read_lock();
+    logfile = atomic_rcu_read(&qemu_logfile);
+    if (logfile) {
+        page_dump(logfile->fd);
+    }
+    rcu_read_unlock();
 }
 #endif
 #endif
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0511266d85..4f616ba38b 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2114,9 +2114,17 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
         }
 
         if (have_prefs || op->life) {
-            for (; col < 40; ++col) {
-                putc(' ', qemu_logfile);
+
+            QemuLogFile *logfile;
+
+            rcu_read_lock();
+            logfile = atomic_rcu_read(&qemu_logfile);
+            if (logfile) {
+                for (; col < 40; ++col) {
+                    putc(' ', logfile->fd);
+                }
             }
+            rcu_read_unlock();
         }
 
         if (op->life) {
-- 
2.17.1


