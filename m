Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461024E8153
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:07:12 +0100 (CET)
Received: from localhost ([::1]:60872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY74R-0005Rm-96
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:07:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6R8-0007cj-Ii
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:39 -0400
Received: from [2001:4860:4864:20::36] (port=42193
 helo=mail-oa1-x36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6R6-0005Xt-OB
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:34 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso10717206fac.9
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=weAzEbOYWT6pn/rsG4fbAVbqxomesdIK5x2EPw6yBPM=;
 b=bgVWVn6ltPSxghTpyzxRfQz3NDuoCM8EYLaToOhKzB7mDUAlos29tDqNayXj9wwySG
 6fAKq0cDOQKd0uV+oed+OEbM4w+YtA0M8g/BnxlSgId9B2Y1GWVWB3Hi4m7vPD6sYFX/
 VLyJWw40D6YechiQ+v7yrADrivyjB4Lq3oD0JoENDjOI+mTtsEEK6bZow9YcNr1uyxk4
 0N3HOtMO0tnz8FSY/uNWDzgY+fiG6Hqjw1FYFQx6MDcbL31Yemo2sC3qgmmNLTh68mSv
 GOrCiH90Agqkp3xbuyfwYW3m0i5ALZjLDl6IjsCW4FqA+PBkZZJ89s9cEEPghbDczGRx
 BVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=weAzEbOYWT6pn/rsG4fbAVbqxomesdIK5x2EPw6yBPM=;
 b=Qg+wpZ1EPPQmy/1W9MBUyqcfJOVOsryhDrUKEt4BqqouZDchHhr8t/IsAeERtrntDZ
 +M3sqkFMCoLvwnwuUDxvjuTuIfbGl2B9JB3/dPwrwrLeI36ZCLtO8C1XRk9QHSuFDywv
 iB/71Y92RzGBJixUF4+nGp3Kx7ZM+53vvKN4W9LVjEOZOusWmp1XqdBmJObrIPianR1P
 MbXkhEm0vyqnQ5MVyex5fhcAmSnPSMZ+x8jNhW4oPsmBJfWHp+YbMRBmgjG/VlDKNhwG
 xL67CC6CLNeYLtvCUrvub539I858cCVMb3BBC8VAK4R+aKHsnImJaeyobai4ZVWvaeAS
 paqA==
X-Gm-Message-State: AOAM530ZSgKEa72q1CRsfotHPScMs0OQ8vZuUEpACujpLc8cK5tLAe1t
 nte6zPjWm+I/BBTFfYQYHAQolhAKHpqg9ybc
X-Google-Smtp-Source: ABdhPJzIVDdhwlSLsuB71cnCkK5GczcFjsVPqewnJuuyBa+/KavpVnuGtOaC9pPVaGLyCIX6Lkl/OA==
X-Received: by 2002:a05:6870:785:b0:da:ac31:3e04 with SMTP id
 en5-20020a056870078500b000daac313e04mr10691756oab.270.1648301191725; 
 Sat, 26 Mar 2022 06:26:31 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/39] util/log: Introduce qemu_set_log_filename_flags
Date: Sat, 26 Mar 2022 07:25:22 -0600
Message-Id: <20220326132534.543738-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::36
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
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

Provide a function to set both filename and flags at
the same time.  This is the common case at startup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Return bool, per recommendations in qapi/error.h (phil).
---
 include/qemu/log.h |   1 +
 util/log.c         | 122 ++++++++++++++++++++++++++++-----------------
 2 files changed, 77 insertions(+), 46 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 42d545f77a..b6c73376b5 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -82,6 +82,7 @@ extern const QEMULogItem qemu_log_items[];
 
 bool qemu_set_log(int log_flags, Error **errp);
 bool qemu_set_log_filename(const char *filename, Error **errp);
+bool qemu_set_log_filename_flags(const char *name, int flags, Error **errp);
 void qemu_set_dfilter_ranges(const char *ranges, Error **errp);
 bool qemu_log_in_addr_range(uint64_t addr);
 int qemu_str_to_log_mask(const char *str);
diff --git a/util/log.c b/util/log.c
index 8b8b6a5d83..2152d5591e 100644
--- a/util/log.c
+++ b/util/log.c
@@ -117,15 +117,58 @@ static void qemu_logfile_free(QemuLogFile *logfile)
 }
 
 /* enable or disable low levels log */
-bool qemu_set_log(int log_flags, Error **errp)
+static bool qemu_set_log_internal(const char *filename, bool changed_name,
+                                  int log_flags, Error **errp)
 {
-    bool need_to_open_file = false;
+    bool need_to_open_file;
     QemuLogFile *logfile;
 
-    qemu_loglevel = log_flags;
+    QEMU_LOCK_GUARD(&qemu_logfile_mutex);
+    logfile = qemu_logfile;
+
+    if (changed_name) {
+        char *newname = NULL;
+
+        /*
+         * Allow the user to include %d in their logfile which will be
+         * substituted with the current PID. This is useful for debugging many
+         * nested linux-user tasks but will result in lots of logs.
+         *
+         * filename may be NULL. In that case, log output is sent to stderr
+         */
+        if (filename) {
+            char *pidstr = strstr(filename, "%");
+
+            if (pidstr) {
+                /* We only accept one %d, no other format strings */
+                if (pidstr[1] != 'd' || strchr(pidstr + 2, '%')) {
+                    error_setg(errp, "Bad logfile format: %s", filename);
+                    return false;
+                }
+                newname = g_strdup_printf(filename, getpid());
+            } else {
+                newname = g_strdup(filename);
+            }
+        }
+
+        g_free(logfilename);
+        logfilename = newname;
+        filename = newname;
+
+        if (logfile) {
+            qatomic_rcu_set(&qemu_logfile, NULL);
+            call_rcu(logfile, qemu_logfile_free, rcu);
+            logfile = NULL;
+        }
+    } else {
+        filename = logfilename;
+    }
+
 #ifdef CONFIG_TRACE_LOG
-    qemu_loglevel |= LOG_TRACE;
+    log_flags |= LOG_TRACE;
 #endif
+    qemu_loglevel = log_flags;
+
     /*
      * In all cases we only log if qemu_loglevel is set.
      * Also:
@@ -134,71 +177,58 @@ bool qemu_set_log(int log_flags, Error **errp)
      *   If we are daemonized,
      *     we will only log if there is a logfilename.
      */
-    if (qemu_loglevel && (!is_daemonized() || logfilename)) {
-        need_to_open_file = true;
-    }
-    QEMU_LOCK_GUARD(&qemu_logfile_mutex);
-    if (qemu_logfile && !need_to_open_file) {
-        logfile = qemu_logfile;
+    need_to_open_file = log_flags && (!is_daemonized() || filename);
+
+    if (logfile && !need_to_open_file) {
         qatomic_rcu_set(&qemu_logfile, NULL);
         call_rcu(logfile, qemu_logfile_free, rcu);
-    } else if (!qemu_logfile && need_to_open_file) {
-        logfile = g_new0(QemuLogFile, 1);
-        if (logfilename) {
-            logfile->fd = fopen(logfilename, log_append ? "a" : "w");
-            if (!logfile->fd) {
+        return true;
+    }
+    if (!logfile && need_to_open_file) {
+        FILE *fd;
+
+        if (filename) {
+            fd = fopen(filename, log_append ? "a" : "w");
+            if (!fd) {
                 error_setg_errno(errp, errno, "Error opening logfile %s",
-                                 logfilename);
+                                 filename);
                 return false;
             }
             /* In case we are a daemon redirect stderr to logfile */
             if (is_daemonized()) {
-                dup2(fileno(logfile->fd), STDERR_FILENO);
-                fclose(logfile->fd);
+                dup2(fileno(fd), STDERR_FILENO);
+                fclose(fd);
                 /* This will skip closing logfile in qemu_log_close() */
-                logfile->fd = stderr;
+                fd = stderr;
             }
         } else {
             /* Default to stderr if no log file specified */
             assert(!is_daemonized());
-            logfile->fd = stderr;
+            fd = stderr;
         }
 
         log_append = 1;
+
+        logfile = g_new0(QemuLogFile, 1);
+        logfile->fd = fd;
         qatomic_rcu_set(&qemu_logfile, logfile);
     }
     return true;
 }
 
-/*
- * Allow the user to include %d in their logfile which will be
- * substituted with the current PID. This is useful for debugging many
- * nested linux-user tasks but will result in lots of logs.
- *
- * filename may be NULL. In that case, log output is sent to stderr
- */
+bool qemu_set_log(int log_flags, Error **errp)
+{
+    return qemu_set_log_internal(NULL, false, log_flags, errp);
+}
+
 bool qemu_set_log_filename(const char *filename, Error **errp)
 {
-    g_free(logfilename);
-    logfilename = NULL;
+    return qemu_set_log_internal(filename, true, qemu_loglevel, errp);
+}
 
-    if (filename) {
-            char *pidstr = strstr(filename, "%");
-            if (pidstr) {
-                /* We only accept one %d, no other format strings */
-                if (pidstr[1] != 'd' || strchr(pidstr + 2, '%')) {
-                    error_setg(errp, "Bad logfile format: %s", filename);
-                    return false;
-                } else {
-                    logfilename = g_strdup_printf(filename, getpid());
-                }
-            } else {
-                logfilename = g_strdup(filename);
-            }
-    }
-
-    qemu_log_close();
-    return qemu_set_log(qemu_loglevel, errp);
+bool qemu_set_log_filename_flags(const char *name, int flags, Error **errp)
+{
+    return qemu_set_log_internal(name, true, flags, errp);
 }
 
 /* Returns true if addr is in our debug filter or no filter defined
-- 
2.25.1


