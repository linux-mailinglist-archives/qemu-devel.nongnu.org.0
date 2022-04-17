Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F53C50494F
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:29:20 +0200 (CEST)
Received: from localhost ([::1]:38046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAaF-0003sz-7a
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fo-0000Yn-K7
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:31:00 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:35660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fl-0001ri-Mk
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:31:00 -0400
Received: by mail-pl1-x62b.google.com with SMTP id b7so1134851plh.2
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fn+CbJP06y71kazZpVgJUGNoM8u0gdfQl47vBhG5p2I=;
 b=AGUI7rN0DEVkKQlb73Cih/fwlNin2ZEIoAIDq8fKMX/PdUbBk+ip7eWnUCpJEqoagf
 NuFj4Z0Mc5RNVUyLHhOLg93aR/M/JQ1HC9mJ/bZ1fHuUYqHyJM+inPS85h/g41TbZO6M
 hV7yn1qKHJ917ogBtsang5nusQwGHkjtkGd2X8HaoZQfd+7UWuPaRkh5yFcInRgXnJBm
 46FAICzEnUTILhECAkyjBxOAWEC0W8GsRggSLzWOtJy0XFkGBtYugsLdC5q2LXqBH6Tc
 iy6mxBfw7kCczzPKrsJ2jQYiMj6aBWf6F+hiojtfm7dz73RDYrFiyY7Y9OMUqvRfg9np
 4EDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fn+CbJP06y71kazZpVgJUGNoM8u0gdfQl47vBhG5p2I=;
 b=TK6P1macM/ydlXVEfrBnt6xNtypOv/n7fJmofa3+Q6SAI//ecwjYhOXQ6Fv45Mkgx2
 PTI4qPA3yZB4fEJyU4NngiVIoPIhfbrNpCtnf8ZqMsLSHSw3qYTcXmpk6gf/2//m+dWW
 5+fB9kHYdxZWAan8EOGAT77Ep1tR3PS3M4VzXmPOABUnhy1q0mgDGqv7hugh3NnIYleW
 uMTNFGF1xJzlCxp2t6BDI6yCPsBp9DplQNn6Xc/LJQ1wlo7jA6eHrHb8JGZ7gpWjPEQA
 3B0D5FFz0JaCOybJL+A4qP4i9D0HbW5Eae+yTsfkET199FLCfY2AZkoNv/nFAfxbh185
 oYkA==
X-Gm-Message-State: AOAM531cEfwdfUQb5R/mL2oejd+xsrpzZvb5/PoWKwKXZILnHC4DB11T
 DjILXk2Do022pXUhKCGzXCvaNQFZsKjrmg==
X-Google-Smtp-Source: ABdhPJwVFjrcaVsn8fhBltPBgCrQ3IFHVE5e2MWO/sK85DJN8Xikqb3BxEUT9bg1tEyaxmpce87uwQ==
X-Received: by 2002:a17:90a:70cf:b0:1cb:a31e:a2c1 with SMTP id
 a15-20020a17090a70cf00b001cba31ea2c1mr14774177pjm.94.1650220251657; 
 Sun, 17 Apr 2022 11:30:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 37/39] util/log: Rename QemuLogFile to RCUCloseFILE
Date: Sun, 17 Apr 2022 11:30:17 -0700
Message-Id: <20220417183019.755276-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

s/QemuLogFile/RCUCloseFILE/
s/qemu_logfile_free/rcu_close_file/

Emphasize that this is only a carrier for passing a pointer
to call_rcu for closing, and not the real logfile.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/util/log.c b/util/log.c
index 21da961d8d..eb6e85b2f0 100644
--- a/util/log.c
+++ b/util/log.c
@@ -29,15 +29,15 @@
 #include "qemu/rcu.h"
 
 
-typedef struct QemuLogFile {
+typedef struct RCUCloseFILE {
     struct rcu_head rcu;
     FILE *fd;
-} QemuLogFile;
+} RCUCloseFILE;
 
 /* Mutex covering the other global_* variables. */
 static QemuMutex global_mutex;
 static char *global_filename;
-static QemuLogFile *global_file;
+static RCUCloseFILE *global_file;
 
 int qemu_loglevel;
 static int log_append = 0;
@@ -52,7 +52,7 @@ bool qemu_log_enabled(void)
 /* Returns true if qemu_log() will write somewhere other than stderr. */
 bool qemu_log_separate(void)
 {
-    QemuLogFile *logfile;
+    RCUCloseFILE *logfile;
     bool res = false;
 
     rcu_read_lock();
@@ -68,7 +68,7 @@ bool qemu_log_separate(void)
 
 FILE *qemu_log_trylock(void)
 {
-    QemuLogFile *logfile;
+    RCUCloseFILE *logfile;
 
     rcu_read_lock();
     logfile = qatomic_rcu_read(&global_file);
@@ -108,14 +108,12 @@ static void __attribute__((__constructor__)) startup(void)
     qemu_mutex_init(&global_mutex);
 }
 
-static void qemu_logfile_free(QemuLogFile *logfile)
+static void rcu_close_file(RCUCloseFILE *r)
 {
-    g_assert(logfile);
-
-    if (logfile->fd != stderr) {
-        fclose(logfile->fd);
+    if (r->fd != stderr) {
+        fclose(r->fd);
     }
-    g_free(logfile);
+    g_free(r);
 }
 
 /* enable or disable low levels log */
@@ -124,7 +122,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
 {
     bool need_to_open_file;
     bool daemonized;
-    QemuLogFile *logfile;
+    RCUCloseFILE *logfile;
 
     QEMU_LOCK_GUARD(&global_mutex);
     logfile = global_file;
@@ -178,7 +176,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
 
     if (logfile && (!need_to_open_file || changed_name)) {
         qatomic_rcu_set(&global_file, NULL);
-        call_rcu(logfile, qemu_logfile_free, rcu);
+        call_rcu(logfile, rcu_close_file, rcu);
         logfile = NULL;
     }
 
@@ -196,7 +194,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
             if (daemonized) {
                 dup2(fileno(fd), STDERR_FILENO);
                 fclose(fd);
-                /* This will skip closing logfile in qemu_logfile_free. */
+                /* This will skip closing logfile in rcu_close_file. */
                 fd = stderr;
             }
         } else {
@@ -207,7 +205,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
 
         log_append = 1;
 
-        logfile = g_new0(QemuLogFile, 1);
+        logfile = g_new0(RCUCloseFILE, 1);
         logfile->fd = fd;
         qatomic_rcu_set(&global_file, logfile);
     }
-- 
2.25.1


