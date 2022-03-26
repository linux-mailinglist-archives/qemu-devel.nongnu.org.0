Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D464E8118
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:34:46 +0100 (CET)
Received: from localhost ([::1]:49554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6Z3-00017I-IP
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:34:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QV-0006xt-5v
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:55 -0400
Received: from [2607:f8b0:4864:20::22b] (port=37466
 helo=mail-oi1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QS-0005LQ-0s
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:54 -0400
Received: by mail-oi1-x22b.google.com with SMTP id q129so11100925oif.4
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oaXwga+g5R/JKjoHtndVsrz+M2TVRW+szFU+P0fXIFc=;
 b=V9c4NHPyoeBOrKygROSsXVdzPuEEw2FgIlMqVXx7Yszdm047Kj+8oeJsbpkqiNjgh9
 /6uXSCI+emLxu8NZFdxx1nTaq650gu2rYNgd754mQTzMcx+9iSOJYAAmAhU3D78JxFqu
 +hm1hEXjdAZJ7mY6FeVapbH0TRr/JIZm2WANEFpaDvd6qyNTk2boJI6jp3crNMexEEpm
 Li0HOkoOSbUKd97koxcPfg6WQGGIdECCZCb9FWP6YTMMTmqdqkYI67iYQXshZE/g7Z9n
 kNGBDHs7tJyOPkcjc1ErdNASGlRB1VHI/V2y5zOFbl4jVQ6S+hcrj9lLcb75o5FSL91Q
 ephw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oaXwga+g5R/JKjoHtndVsrz+M2TVRW+szFU+P0fXIFc=;
 b=YdbLNeJw+430Zov64GeH9SUOoOzDkujx78MdILgak8IEguYFzWFfvDA/qt8r2yOJk2
 ZHt80HZnELGpJg/X+HZvQIR3zJIkMTAtIjTg3jxVd/L0AXJE129YtDOF64JdDOFezZjQ
 o72jJPf8bw7s8bfWLQPJ2YP4NyjeZGkcGPFXvK6QlHjc7dWpe9Iscv4FwadcLxpdF5+/
 ziqMdp5FmXqplb/yo1g+81CPIwbFMpxgY8PCYDPrOTdPCgpWNO3rxtVyeEPdw5GEAs81
 6UTOP+jyKUcbYEMwlhrcOTcxD8/HVuQFQrQwN/0KJc5XU9WQ4HdNvvBDGwc9j9ssxZQ1
 67TQ==
X-Gm-Message-State: AOAM531o+S8YE58aym/pVdJ1KklryyLKmHf7P4mBXYz7FJ0nQ4ZVbK9W
 2mTqrc8zWe/GYEzWtuFYn/SerZJGq5UEB9FG
X-Google-Smtp-Source: ABdhPJzsmviFVExBAso0U7bIh/KKqnIrZ39v8n6PI0JZdsrceJBP8QotPaa9DGEI3++YLFijiZYn7w==
X-Received: by 2002:a05:6808:1a93:b0:2da:59cc:7aff with SMTP id
 bm19-20020a0568081a9300b002da59cc7affmr7996244oib.142.1648301148631; 
 Sat, 26 Mar 2022 06:25:48 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:25:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/39] util/log: Pass Error pointer to qemu_set_log
Date: Sat, 26 Mar 2022 07:24:55 -0600
Message-Id: <20220326132534.543738-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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

Do not force exit within qemu_set_log; return bool and pass
an Error value back up the stack as per usual.

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


