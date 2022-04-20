Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F709508F2F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:13:22 +0200 (CEST)
Received: from localhost ([::1]:43408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhEpN-00020N-61
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEih-0005Kc-Ee
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:30 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:39774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEif-0001Ay-G9
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:27 -0400
Received: by mail-pf1-x429.google.com with SMTP id l127so2683577pfl.6
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WCPmwypoKHZcoHiWNjxrenUSP19FCOQHDS6/A6+BTTo=;
 b=lJceh7h/srxWqWfJp4f/1LbAq/uJSkd94hV4837avBTWStmv9NMHy9Lrqfr1nDIKJ3
 pyHZsfyNLPj3XT/4SXhrxLe5o/3ZZoU0ysz9o+L4zMwsOhJ3b/0vZ0JOT47FV6NhqZTS
 x50d+A2AgH19uMP2dkGx8ombc952OaDoITaBx0uviKpJcPSzDH02eUJSAGYN6dbBMBoE
 GvivpKbRnj4InzRB47cqtSc71uqQ7DyZ/f5mqaC3fAOub9QjZzfhJDKhIXe/Uuj+A/lb
 /eMUQX3EdO4SW7cR+IggCrfNCPPZ4F55lsopNZRDYY5gRE5goZszVYD1c10A2kqJz04F
 REZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WCPmwypoKHZcoHiWNjxrenUSP19FCOQHDS6/A6+BTTo=;
 b=n0qEEHe2tyuQvra1FBWkYgPpQQUNPvbVULnbOxog7UFSPNYoCfMjuCJT2JJhnbhFsX
 ncAyjbFWFOgwPhpu51+dWQEVeKoWUFGTUId7ht4uw922OzKCWV9hzHUbwgAbicvquEAF
 dcp/TPifLq1WAsgz+OnL5kchzHDbU9Rz3I0ptXJ764OtiJI+A37c9HLhkEuZKIYO7/u+
 Dzp2WWo1Kl91JMthoVPx8+/Aw5ja9EyOkAyibVYePZO7C30duCazHyRAvQQCRwfBu09f
 mkcMVqo202tXQlNwoGdF3/i9oFdFC6SsJi0vrGBR1B9nJC1sWH2x6HJKaiLLUT+Ie6Jw
 trcA==
X-Gm-Message-State: AOAM533r/NdWrDY1e7nLiDLMK8qkC70ZH/nMSktS+AaoYJTF3AV2W+yB
 eR4pwpbdjhQtAYyKOB1T6tVx5GeZx2KAHA==
X-Google-Smtp-Source: ABdhPJwpfaLarj+MWw0aIn1yA98yA2LKdFfLZKDIq41cUlJqZh4dBcTTNEcPOz1LlwNAgdHYitHlXw==
X-Received: by 2002:a63:d50d:0:b0:3aa:45e3:345f with SMTP id
 c13-20020a63d50d000000b003aa45e3345fmr7287651pgg.621.1650477984001; 
 Wed, 20 Apr 2022 11:06:24 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/39] util/log: Pass Error pointer to qemu_set_log
Date: Wed, 20 Apr 2022 11:05:43 -0700
Message-Id: <20220420180618.1183855-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Do not force exit within qemu_set_log; return bool and pass
an Error value back up the stack as per usual.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-5-richard.henderson@linaro.org>
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
index 4b68fcd346..33372b93cc 100644
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
index 116e058675..ef3224a9d4 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -5443,7 +5443,7 @@ int main(int argc, char **argv)
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
index 46aba6a039..fe9de2f896 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2570,9 +2570,9 @@ static void qemu_process_early_options(void)
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
index 05703a4e51..d071400ebc 100644
--- a/tests/unit/test-logging.c
+++ b/tests/unit/test-logging.c
@@ -122,7 +122,7 @@ static void test_logfile_write(gconstpointer data)
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
2.34.1


