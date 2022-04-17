Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079F5504941
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:16:47 +0200 (CEST)
Received: from localhost ([::1]:35198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAO6-00089a-2q
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fg-0000UZ-1j
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:52 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:56145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fa-0001pc-95
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:48 -0400
Received: by mail-pj1-x1034.google.com with SMTP id ll10so11365742pjb.5
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=weAzEbOYWT6pn/rsG4fbAVbqxomesdIK5x2EPw6yBPM=;
 b=qlPNum5g5fvPmmQS4UBTe2sSmbyDI2u+HjD8mYuf+8gTvm4rrg+lsiNPGwtX18GKU8
 fHiOxI4J8a6RD/uixGn5+H6zt9S/MPZKFESa6tacuUX5q0Tbul696YibPRMvcyFyCHZs
 wozgVpAm01qZeDaPDeLKT3FNk3DTfguctevgAgA0BZDxzQRLr/iKV2SXj5R/UpMfsGBq
 bie+eSOM5ZyBuyBLgwyHtExCPjTzVbB1R0SmpKSvRLpWp49FhyC8FO02sj5R7ujrtBad
 ulBjJO7tM8i6vXNGZSiSgb25NBe9vtBlcwG+Z4Srhyzsq492xjGQ8anfclVDfRyrLysk
 TT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=weAzEbOYWT6pn/rsG4fbAVbqxomesdIK5x2EPw6yBPM=;
 b=jePmlk4dVr7+QtzeoI4+KWMbn0fUmFwlpFZbdcqcBLB/Y8zYNaHPcrfmyH7l+dH0//
 ELByqsM5x2BQV+mWjQuJKwQl9UCxwZiwJ+dqXPC0t2cxT+RbVGwbvTayCa6lp/P19xvu
 VFXkZGpeITFcxtTyE81pvPIplqpyyp7ihYKRwl6OmFWOkzCw1TfXXsPuCv4BaE8cHcxO
 jpHyHwA7r++M3xp8sGCOmZsGpAWK+kx97nFrUTpyWPwbbIeELDm3dgoMX1pdK9Fafcoc
 +Wp/DL08fUQuEJN0DVoN4YrL2Tpvdy9w+JVxbMDoVR4RqkZeQuIVqN/rBEuCuG9+8jgS
 llJg==
X-Gm-Message-State: AOAM53173BGd4est0Fy/k6inMUs5XC20JXbcr0r5hLJiMEedDiceYd2u
 K50bEAcCjDUSa9ORFvjLJ8WoaYljhOyllw==
X-Google-Smtp-Source: ABdhPJyBeG3h9e0FRk9daiUVKulODmPigctiDEm1Ydsv3QJvrOqHTviZkDtIjoZz/NhI0Svoy6Zkww==
X-Received: by 2002:a17:902:a5cc:b0:158:9a2b:480e with SMTP id
 t12-20020a170902a5cc00b001589a2b480emr7856836plq.19.1650220243671; 
 Sun, 17 Apr 2022 11:30:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/39] util/log: Introduce qemu_set_log_filename_flags
Date: Sun, 17 Apr 2022 11:30:07 -0700
Message-Id: <20220417183019.755276-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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


