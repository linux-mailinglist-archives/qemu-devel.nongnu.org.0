Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2497C4E815C
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:12:51 +0100 (CET)
Received: from localhost ([::1]:46936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY79u-0006aF-7v
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:12:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6UA-0002qf-T2
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:29:43 -0400
Received: from [2607:f8b0:4864:20::22e] (port=34598
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6U9-0005yX-FA
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:29:42 -0400
Received: by mail-oi1-x22e.google.com with SMTP id v75so11121451oie.1
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a5VbL0aLAFbBvi7mnSV6DMzP+5DCyDQb6KaEjRaA8Sc=;
 b=t/wnCmSsPWixkZqh01op/f9tlACDvGRWYzrDg6QTXXiGRNVTMIuaAawuxuStGWix12
 C5RH9fdh7EsQ2NNqFc6+ugp5gko0JrtNbPCnMkt229NNfCVRteDcDt/xbbFoUfBbfzjt
 KnG4s6G+qJkGJZ99UW/F1EwAnX4eIPY2N1lBV2bsjItG5y2koE4AyGVYFvjFQGESv2sT
 RwAHOC/e1+TnpImPadqPFEdcZ2nAgnXjRjIIaO1ZCRZZ0v12+JqcCS9Qao0P03uYvGEa
 2fhSKvGcDTU9b7M9n8ADZvFlEF/BgO84okuhnEgNn9+Tn4Rbx9lw/bbLgoBPstsJtIb3
 7iIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a5VbL0aLAFbBvi7mnSV6DMzP+5DCyDQb6KaEjRaA8Sc=;
 b=LuwsVd4JhjWwDD/0T2mOUlr+Rx2qyfVLWZKrXc+hLD+7RHIwcHKzPZUnRn8v2m1Zax
 B7U7qg1xiTd0cGquqTPZf/PPbDkwjgzuePqiZCuP1WykOOT4+lhh3JvQzV+uwSGOsJav
 g+yqJ8nFWNX7DpOxKapTY/08iXSxOUCT49OJ2Z61dNepWdg9e90UXR5Hg/VjgoHpB21C
 l9BqRbtBd/sMZDOVwhaXQLBGFg5poRXTc7lgiB7vVjScsiQfD4C1vetpyC8qJ2u1vRTh
 PYCs5Q2f1ve4MwdDjcjm+iRcIflBxfQBAyhK7BJ4rfprHxn29UPeXizC7541pagbTZmR
 iUig==
X-Gm-Message-State: AOAM5334qNOUsZM6uGwXcWocZvWXjQA8ypHyZUxaIPwcrfAVDrOUk0EX
 qi9WRFSSX6PIkb//Kwo+TIz7fDxShEWfCpno
X-Google-Smtp-Source: ABdhPJyZ18WHl0XuUbTMTaPv6gQcC8PcQdxQJM/Jrer9D+xOm+MsDK2FsqJAz/hi+N0qa4iQ06BZtA==
X-Received: by 2002:a05:6808:14ca:b0:2da:2fbd:ebad with SMTP id
 f10-20020a05680814ca00b002da2fbdebadmr12102815oiw.24.1648301380533; 
 Sat, 26 Mar 2022 06:29:40 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 s24-20020a056808209800b002da3b9bf8e0sm4394509oiw.32.2022.03.26.06.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:29:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 33/39] util/log: Rename qemu_logfile to global_file
Date: Sat, 26 Mar 2022 07:25:28 -0600
Message-Id: <20220326132534.543738-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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

Rename to emphasize this is the file-scope global variable.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/util/log.c b/util/log.c
index b3f79deb6c..425f0064b0 100644
--- a/util/log.c
+++ b/util/log.c
@@ -36,7 +36,7 @@ typedef struct QemuLogFile {
 
 static char *global_filename;
 static QemuMutex qemu_logfile_mutex;
-static QemuLogFile *qemu_logfile;
+static QemuLogFile *global_file;
 int qemu_loglevel;
 static int log_append = 0;
 static GArray *debug_regions;
@@ -44,7 +44,7 @@ static GArray *debug_regions;
 /* Returns true if qemu_log() will really write somewhere. */
 bool qemu_log_enabled(void)
 {
-    return qemu_logfile != NULL;
+    return global_file != NULL;
 }
 
 /* Returns true if qemu_log() will write somewhere other than stderr. */
@@ -54,7 +54,7 @@ bool qemu_log_separate(void)
     bool res = false;
 
     rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
+    logfile = qatomic_rcu_read(&global_file);
     if (logfile && logfile->fd != stderr) {
         res = true;
     }
@@ -69,7 +69,7 @@ FILE *qemu_log_trylock(void)
     QemuLogFile *logfile;
 
     rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
+    logfile = qatomic_rcu_read(&global_file);
     if (logfile) {
         qemu_flockfile(logfile->fd);
         return logfile->fd;
@@ -124,7 +124,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
     QemuLogFile *logfile;
 
     QEMU_LOCK_GUARD(&qemu_logfile_mutex);
-    logfile = qemu_logfile;
+    logfile = global_file;
 
     if (changed_name) {
         char *newname = NULL;
@@ -156,7 +156,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
         filename = newname;
 
         if (logfile) {
-            qatomic_rcu_set(&qemu_logfile, NULL);
+            qatomic_rcu_set(&global_file, NULL);
             call_rcu(logfile, qemu_logfile_free, rcu);
             logfile = NULL;
         }
@@ -179,7 +179,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
     need_to_open_file = log_flags && (!is_daemonized() || filename);
 
     if (logfile && !need_to_open_file) {
-        qatomic_rcu_set(&qemu_logfile, NULL);
+        qatomic_rcu_set(&global_file, NULL);
         call_rcu(logfile, qemu_logfile_free, rcu);
         return true;
     }
@@ -210,7 +210,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
 
         logfile = g_new0(QemuLogFile, 1);
         logfile->fd = fd;
-        qatomic_rcu_set(&qemu_logfile, logfile);
+        qatomic_rcu_set(&global_file, logfile);
     }
     return true;
 }
-- 
2.25.1


