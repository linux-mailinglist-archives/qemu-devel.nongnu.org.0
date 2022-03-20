Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842794E1D24
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:30:04 +0100 (CET)
Received: from localhost ([::1]:35560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzNT-0000eY-HM
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:30:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz62-0000BV-Oh
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:02 -0400
Received: from [2607:f8b0:4864:20::62e] (port=45648
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz60-0003UW-T4
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:02 -0400
Received: by mail-pl1-x62e.google.com with SMTP id k6so3717141plg.12
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h0xc9BI1YGSLEUvZQaFfOPBOYlCXbsk+XY8xxzjyhJU=;
 b=m8jE1oJfEWsYEp9Ty2SzzXR/6cSsKE20/7fg9BGdQPoCTv6n2e8abW0VvOdOFU7EVP
 ueZlsH0GTKVnhZzGLCgMKtE0cUyM5D3FNctQL+/KRqJEQohToNGNK5chg+Tt7XoJA7lq
 El3DMy6unormZGUgymlRauav4eUoE2eNr1r9haO8LIPD4vJ5BfbUv5XPYFHqn1nUZgkg
 3oJqXKShstv/YyD+wzmYVUaW/k0rJn7jdBXP/Ww6hfWu4xR0HSZAvJknXiwLR1drR8Vm
 QZAGvMKKRGEDL6iJ4ax7daWgpfMHcovYoczhRIWzusHkh3aFn1+IM+FJbozsX0SvcrKE
 lxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h0xc9BI1YGSLEUvZQaFfOPBOYlCXbsk+XY8xxzjyhJU=;
 b=GjGCMj8LbBAvFbXXQCS7TYAnf3Zu4UehOBTemOYanGX+iF2R04ZyiKrGQk5+Iw1obB
 jtYWVKCG+OxWpQslIB8UKBUzyToVnZnvT23cJ2hnCikyzJbQyRC/Ctu2VCwkiV88pZZk
 ff3g0WKBwusILTv5ZygkB9ASH9T2bd1+2SxwOFGvG6tUgdPjnS+fYteBbek0IyohkBD7
 0GbosPuMB2BL+VSKVe9rVBKykBn0CL+i6qGEfRH3MhTcUv9V1XPw4JPO9Ze3TJXYYKy+
 coF+3Vc/J37zHef/+iKtZx6jxVfhwphLhGCvbEGdtLr0xVMg3xptbEErpZn/GkVvM+P2
 Ksfg==
X-Gm-Message-State: AOAM532FuMbGuQ6Img36PeucXX8MMs2t7P5OkmaQavTbPv0usDm5XYgU
 +hrs9Qx7mbaifYoZpMHla460qv+HnNgzjw==
X-Google-Smtp-Source: ABdhPJzIpQpFV/61vG4MMcczKYq3ueKUgLOXXwcpQX1x4jaVZ3OFMaN6FFgQJgH1f7yKf5EiXhEkXw==
X-Received: by 2002:a17:90a:4bc2:b0:1b8:cdd3:53e2 with SMTP id
 u2-20020a17090a4bc200b001b8cdd353e2mr32318943pjl.219.1647796318691; 
 Sun, 20 Mar 2022 10:11:58 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 24/36] util/log: Introduce qemu_set_log_filename_flags
Date: Sun, 20 Mar 2022 10:11:23 -0700
Message-Id: <20220320171135.2704502-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Provide a function to set both filename and flags at
the same time.  This is the common case at startup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log.h |   1 +
 util/log.c         | 122 ++++++++++++++++++++++++++++-----------------
 2 files changed, 77 insertions(+), 46 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index c63416c9e0..ef247776cf 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -82,6 +82,7 @@ extern const QEMULogItem qemu_log_items[];
 
 void qemu_set_log(int log_flags, Error **errp);
 void qemu_set_log_filename(const char *filename, Error **errp);
+void qemu_set_log_filename_flags(const char *name, int flags, Error **errp);
 void qemu_set_dfilter_ranges(const char *ranges, Error **errp);
 bool qemu_log_in_addr_range(uint64_t addr);
 int qemu_str_to_log_mask(const char *str);
diff --git a/util/log.c b/util/log.c
index 7e8b152742..46a0d38d41 100644
--- a/util/log.c
+++ b/util/log.c
@@ -126,15 +126,58 @@ static void qemu_logfile_free(QemuLogFile *logfile)
 }
 
 /* enable or disable low levels log */
-void qemu_set_log(int log_flags, Error **errp)
+static void qemu_set_log_internal(const char *filename, bool changed_name,
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
+                    return;
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
@@ -143,70 +186,57 @@ void qemu_set_log(int log_flags, Error **errp)
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
+        return;
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
                 return;
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
 }
 
-/*
- * Allow the user to include %d in their logfile which will be
- * substituted with the current PID. This is useful for debugging many
- * nested linux-user tasks but will result in lots of logs.
- *
- * filename may be NULL. In that case, log output is sent to stderr
- */
+void qemu_set_log(int log_flags, Error **errp)
+{
+    qemu_set_log_internal(NULL, false, log_flags, errp);
+}
+
 void qemu_set_log_filename(const char *filename, Error **errp)
 {
-    g_free(logfilename);
-    logfilename = NULL;
+    qemu_set_log_internal(filename, true, qemu_loglevel, errp);
+}
 
-    if (filename) {
-            char *pidstr = strstr(filename, "%");
-            if (pidstr) {
-                /* We only accept one %d, no other format strings */
-                if (pidstr[1] != 'd' || strchr(pidstr + 2, '%')) {
-                    error_setg(errp, "Bad logfile format: %s", filename);
-                    return;
-                } else {
-                    logfilename = g_strdup_printf(filename, getpid());
-                }
-            } else {
-                logfilename = g_strdup(filename);
-            }
-    }
-
-    qemu_log_close();
-    qemu_set_log(qemu_loglevel, errp);
+void qemu_set_log_filename_flags(const char *name, int flags, Error **errp)
+{
+    qemu_set_log_internal(name, true, flags, errp);
 }
 
 /* Returns true if addr is in our debug filter or no filter defined
-- 
2.25.1


