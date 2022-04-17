Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70100504928
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:04:48 +0200 (CEST)
Received: from localhost ([::1]:55292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngACV-0008Vt-IJ
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fL-0000PX-LA
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:37 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fF-0001jt-MK
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:27 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so15573831pjn.3
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fkebT/LAE7REyAtIfeqmANwHWRp/aC2ry/0wfG2Z0R0=;
 b=AGxEk63cFQ6QijqHQTeA+pjEBOrd7V7sVfKsGw4xY3wqlW/3ToKIRYrin5BjG0HIup
 ry82OwybN8VIUsrHbCm8ZLRPMFqy6uhYhispu25QT9tuIxaVz4IVBNxuY0glb67X401V
 wtlCfrL28djULtjgv6bxynXBXjAeYGi4Z516wWmSp0ipoll5cJe2CnGzM/OYzir+3ugk
 bNhsOoMEHiqJj1EVGw7d1oVBJwYNdeJFCRAyb9hm9y+q15DpH54kuU97LFzVXKwma5CL
 EKuUriAXNhLXsYb+pueXK4tmp3L/B/VIxXP3E8SxmP43ZVgXw+b5je3MC5rv4hTExqM3
 +yQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fkebT/LAE7REyAtIfeqmANwHWRp/aC2ry/0wfG2Z0R0=;
 b=hl00ftJXb9k6Jy0+fbrejtzw3gwZCR92dxDnJOtw0RhQL6y0agomGitg/sgXpNZ1jg
 vK8zKv6oT5YphkH6QrELDzUctQKuaZBFe/LLiM7y8Df01+YVkiONXFCpXfiGQaRqP63z
 Rb0kUbFgCypw+N85TCSJzaP+NtOJBsdcXAQiSAeGXtN4QLbV8HFacVwYgz7cIZ4zXPyy
 ggjCgaZ3+lU6P2Mfy/uk3lJ9CejitPR/bjbgABQueQF3bDXI/GIhBa/OTJeQXSmzp4OZ
 kkQYKGIje2/LDNYGRohheSzBqoUGffr99VY/clwRU/e5+cr0OXeYhzEINzIcvtnH7pO1
 YhGQ==
X-Gm-Message-State: AOAM532+LuDC1J54ZEwHUZkz0PLcxPXNsxgijvNcCYpjfbHQ/YOVd538
 2rc95KUwbFrq9YTWG444RGzqDb7dSTcGMQ==
X-Google-Smtp-Source: ABdhPJzi8fSNv/Jo4cqeEkieq3Xs3opA7DXcGYkEqsKfwtEQ/A9A0X1vZjMIhpKGoR/QARAtX6pNqg==
X-Received: by 2002:a17:902:ea4f:b0:158:5013:1403 with SMTP id
 r15-20020a170902ea4f00b0015850131403mr7847837plg.75.1650220223881; 
 Sun, 17 Apr 2022 11:30:23 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/39] util/log: Pass Error pointer to qemu_set_log
Date: Sun, 17 Apr 2022 11:29:44 -0700
Message-Id: <20220417183019.755276-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Do not force exit within qemu_set_log; return bool and pass
an Error value back up the stack as per usual.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Return bool, per recommendations in qapi/error.h (phil).
---
 include/qemu/log.h                   |  2 +-
 bsd-user/main.c                      |  2 +-
 linux-user/main.c                    |  2 +-
 monitor/misc.c                       |  6 +++++-
 qemu-img.c                           |  2 +-
 qemu-io.c                            |  2 +-
 qemu-nbd.c                           |  2 +-
 scsi/qemu-pr-helper.c                |  2 +-
 softmmu/vl.c                         |  4 ++--
 storage-daemon/qemu-storage-daemon.c |  2 +-
 tests/unit/test-logging.c            |  2 +-
 util/log.c                           | 12 ++++++------
 12 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index fabfbe41da..0b892f5e90 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -147,7 +147,7 @@ typedef struct QEMULogItem {
 
 extern const QEMULogItem qemu_log_items[];
 
-void qemu_set_log(int log_flags);
+bool qemu_set_log(int log_flags, Error **errp);
 bool qemu_set_log_filename(const char *filename, Error **errp);
 void qemu_set_dfilter_ranges(const char *ranges, Error **errp);
 bool qemu_log_in_addr_range(uint64_t addr);
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 08f43af235..0c8aa1ae90 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -414,7 +414,7 @@ int main(int argc, char **argv)
             qemu_print_log_usage(stdout);
             exit(1);
         }
-        qemu_set_log(mask);
+        qemu_set_log(mask, &error_fatal);
     }
 
     if (optind >= argc) {
diff --git a/linux-user/main.c b/linux-user/main.c
index 2b06350688..6aed4929ab 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -679,7 +679,7 @@ int main(int argc, char **argv, char **envp)
 
     log_mask = last_log_mask | (enable_strace ? LOG_STRACE : 0);
     if (log_mask) {
-        qemu_set_log(log_mask);
+        qemu_set_log(log_mask, &error_fatal);
     }
 
     if (!trace_init_backends()) {
diff --git a/monitor/misc.c b/monitor/misc.c
index 04ec0711da..b16334b75a 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -428,6 +428,7 @@ static void hmp_log(Monitor *mon, const QDict *qdict)
 {
     int mask;
     const char *items = qdict_get_str(qdict, "items");
+    Error *err = NULL;
 
     if (!strcmp(items, "none")) {
         mask = 0;
@@ -438,7 +439,10 @@ static void hmp_log(Monitor *mon, const QDict *qdict)
             return;
         }
     }
-    qemu_set_log(mask);
+
+    if (!qemu_set_log(mask, &err)) {
+        error_report_err(err);
+    }
 }
 
 static void hmp_singlestep(Monitor *mon, const QDict *qdict)
diff --git a/qemu-img.c b/qemu-img.c
index 1caddfb23a..9c05c6275d 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -5442,7 +5442,7 @@ int main(int argc, char **argv)
         exit(1);
     }
     trace_init_file();
-    qemu_set_log(LOG_TRACE);
+    qemu_set_log(LOG_TRACE, &error_fatal);
 
     /* find the command */
     for (cmd = img_cmds; cmd->name != NULL; cmd++) {
diff --git a/qemu-io.c b/qemu-io.c
index eb8afc8b41..38321a27a3 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -634,7 +634,7 @@ int main(int argc, char **argv)
         exit(1);
     }
     trace_init_file();
-    qemu_set_log(LOG_TRACE);
+    qemu_set_log(LOG_TRACE, &error_fatal);
 
     /* initialize commands */
     qemuio_add_command(&quit_cmd);
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 713e7557a9..bf9c5fedce 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -804,7 +804,7 @@ int main(int argc, char **argv)
         exit(1);
     }
     trace_init_file();
-    qemu_set_log(LOG_TRACE);
+    qemu_set_log(LOG_TRACE, &error_fatal);
 
     socket_activation = check_socket_activation();
     if (socket_activation == 0) {
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index f281daeced..1f2a84c534 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -1001,7 +1001,7 @@ int main(int argc, char **argv)
         exit(EXIT_FAILURE);
     }
     trace_init_file();
-    qemu_set_log(LOG_TRACE);
+    qemu_set_log(LOG_TRACE, &error_fatal);
 
 #ifdef CONFIG_MPATH
     dm_init();
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 6f646531a0..a74d0a44a2 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2569,9 +2569,9 @@ static void qemu_process_early_options(void)
             qemu_print_log_usage(stdout);
             exit(1);
         }
-        qemu_set_log(mask);
+        qemu_set_log(mask, &error_fatal);
     } else {
-        qemu_set_log(0);
+        qemu_set_log(0, &error_fatal);
     }
 
     qemu_add_default_firmwarepath();
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index eb72407257..1398f0443d 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -392,7 +392,7 @@ int main(int argc, char *argv[])
     if (!trace_init_backends()) {
         return EXIT_FAILURE;
     }
-    qemu_set_log(LOG_TRACE);
+    qemu_set_log(LOG_TRACE, &error_fatal);
 
     qemu_init_main_loop(&error_fatal);
     process_options(argc, argv, false);
diff --git a/tests/unit/test-logging.c b/tests/unit/test-logging.c
index ccb819f193..93c6d666e8 100644
--- a/tests/unit/test-logging.c
+++ b/tests/unit/test-logging.c
@@ -123,7 +123,7 @@ static void test_logfile_write(gconstpointer data)
      * In cases where a logging backend other than log is used,
      * this is needed.
      */
-    qemu_set_log(CPU_LOG_TB_OUT_ASM);
+    qemu_set_log(CPU_LOG_TB_OUT_ASM, &error_abort);
     file_path = g_build_filename(dir, "qemu_test_log_write0.log", NULL);
     file_path1 = g_build_filename(dir, "qemu_test_log_write1.log", NULL);
 
diff --git a/util/log.c b/util/log.c
index a838686a18..bab4d29ecb 100644
--- a/util/log.c
+++ b/util/log.c
@@ -73,7 +73,7 @@ static void qemu_logfile_free(QemuLogFile *logfile)
 }
 
 /* enable or disable low levels log */
-void qemu_set_log(int log_flags)
+bool qemu_set_log(int log_flags, Error **errp)
 {
     bool need_to_open_file = false;
     QemuLogFile *logfile;
@@ -103,9 +103,9 @@ void qemu_set_log(int log_flags)
         if (logfilename) {
             logfile->fd = fopen(logfilename, log_append ? "a" : "w");
             if (!logfile->fd) {
-                g_free(logfile);
-                perror(logfilename);
-                _exit(1);
+                error_setg_errno(errp, errno, "Error opening logfile %s",
+                                 logfilename);
+                return false;
             }
             /* In case we are a daemon redirect stderr to logfile */
             if (is_daemonized()) {
@@ -129,6 +129,7 @@ void qemu_set_log(int log_flags)
         log_append = 1;
         qatomic_rcu_set(&qemu_logfile, logfile);
     }
+    return true;
 }
 
 /*
@@ -159,8 +160,7 @@ bool qemu_set_log_filename(const char *filename, Error **errp)
     }
 
     qemu_log_close();
-    qemu_set_log(qemu_loglevel);
-    return true;
+    return qemu_set_log(qemu_loglevel, errp);
 }
 
 /* Returns true if addr is in our debug filter or no filter defined
-- 
2.25.1


