Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366F74E8165
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:20:05 +0100 (CET)
Received: from localhost ([::1]:35066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY7Gu-0000oC-AR
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:20:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6UF-0002yS-GT
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:29:49 -0400
Received: from [2607:f8b0:4864:20::22c] (port=33769
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6UD-0005zH-VU
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:29:47 -0400
Received: by mail-oi1-x22c.google.com with SMTP id k10so11121997oia.0
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7gCOVHpiUyMRDpJzcLkdT+SsxIqZ0YBDWLphLP/PUG0=;
 b=peStyffkPKLqPkMkPjdm7qjkhZ7J5paLvW4tPuX1EREkbJUD+JMsMPFc+S2ENBlV52
 TZCuTfPo+s7u2d8vlTtuVKQzgmxibuX1Ma6i2nk3Ss9PaBzfr6gJXsKkqRZyx+ssWWDw
 kZb23B3o851ZuDV1aiA9dHwzh3I2O9o5zYnRHPTqDee/yo9S6+DyZ0LNFF230dmGhAwL
 8jggsj3d7FxWAqwVBaiyhZANgyu/NX7rZcrEurcjgEApDCFrgmmhf/SRATxhheoX2vAP
 AqJljjcKTZl/SkKp4dc9EpTRY+9kpJup9Bb2BORF8Zvtnp+ZDVceHpbVIpgcRLZRSR7o
 L2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7gCOVHpiUyMRDpJzcLkdT+SsxIqZ0YBDWLphLP/PUG0=;
 b=YnDMs+x04XLFYeAuJobb8J7kJH4JrhY6SeRxtnXY51BC1ejdPb+fEwAr0gS1nM5oLz
 p1pRwnVrQ7bSz04XwYzoayzPYs9e3mlpg2rh6nJuAxj6RaWz8sbHtszKUGmWgYRcwIdd
 xSp0aDc86ld2Bq5TJrzmwNkzHPqWpZ2wPwqPvaf5uZuEPqwO0WGVLA+n8nm/3C0Xz3c5
 fGvOJ9Gn2qgiIFwnH15UhxE/xXUgeBvcs0SBmhzNT9luysuC8obO7CDKmwm0n0dClzxF
 HgHKDR3NJDc8K2algOf7K6wOUxemXQg8XHTP7dkDix8fuZ3UOwAu4lFIWv6OrLIzkyoU
 Yw4g==
X-Gm-Message-State: AOAM5319VoWEL0Xa+Cp2nTDjYv+aAi/DwYPr1gNvEWxVPHyfFnpBvSdl
 bW/J6100pkdB+JZTsx+0dc61peW7EjBw4442
X-Google-Smtp-Source: ABdhPJwadsXK3+gHo992BQ3PcIOtFkoxWSqWP2PYNS8rNaDK1CiqPs13cb72yudgvnvmtk9qE6wQmA==
X-Received: by 2002:aca:aa55:0:b0:2ee:e8e8:cf80 with SMTP id
 t82-20020acaaa55000000b002eee8e8cf80mr12641473oie.64.1648301384947; 
 Sat, 26 Mar 2022 06:29:44 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 s24-20020a056808209800b002da3b9bf8e0sm4394509oiw.32.2022.03.26.06.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:29:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 37/39] util/log: Rename QemuLogFile to RCUCloseFILE
Date: Sat, 26 Mar 2022 07:25:32 -0600
Message-Id: <20220326132534.543738-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

s/QemuLogFile/RCUCloseFILE/
s/qemu_logfile_free/rcu_close_file/

Emphasize that this is only a carrier for passing a pointer
to call_rcu for closing, and not the real logfile.

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


