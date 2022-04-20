Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B53508FA2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:42:43 +0200 (CEST)
Received: from localhost ([::1]:38284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFHm-0000mM-4m
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEjA-0006UJ-Pa
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:56 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj9-0001NI-66
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:56 -0400
Received: by mail-pf1-x434.google.com with SMTP id z16so2690854pfh.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wXQZPorOYiPb8USNYQC2Il4MeLE5umHkixP2P9sGTQU=;
 b=ZKttw674b1WA6JSU/S96TnKiSGV1KZbXKOdB26pr/v8PMB/cMd3zDhzXjge2QApLKj
 Ad6NAWLCK8i2mphc68gia8VrrpiWr+We2DLcNYDQNmViDmdM4wLoujd6oLe1kbXjxetL
 N8JAjXFo6ipHLh+USnyrfsLC+c+oPNnAF+7oH75cgdCS2yiHjY5PcmrCCO0nj/77c9m+
 chtaTr5et9HPYT3K4E3WoAjHEO4SrwY5QqIVGSudhRjqAjtpx5eoP5LivuNnnNLasMtq
 I2I+bv0vE0uPKgGndeKU5GZ2EMJQawW0EVQStaxJzObFC7jM4LzF82uKK4LEm3rBIYSv
 FAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wXQZPorOYiPb8USNYQC2Il4MeLE5umHkixP2P9sGTQU=;
 b=fr72lBtecZpePwXSmZ1I6Zjv6448T3DKAes7JWpzNePVe6eRhdyfNDVjdC3qJ/cxTm
 mOVtgpvqcrXmOhRLAm7ALyFBvTVYO3kUMAUAy2da6XTWvIqPslUjotC0JTm9k3dJ/sXS
 quRyfK6efv0UCKvNgLWUUfgachjAmgwaSECTLqMv7wV7AUzdk/sfPUgbQc0qs769E1o4
 /s+NOBAYJ3FArvsNehlLh525IRweBrYW99QpJBf6t5jpi+kF6t52JhM8wvKQAOnkHcXx
 SAWFW9whcinMWOBshLp3IFrLpVHV9gaUWSzrB21OJK2F8EUc04aVUSBj0qD9xAi6bBxD
 YqHw==
X-Gm-Message-State: AOAM533o0N6mxGFwlwWDfSp3Zx7s74uPWx1bhahCydLOPm9sTFGQJyPr
 LYYRCbxTNVpSMStlW+t4oOarG1Nigy5PRw==
X-Google-Smtp-Source: ABdhPJwqp7ZZX3qVQO04SX1YCC0HlD4a+OyFAK7GUE0YJ25066RSHGhcrGr/uR3iIWL7Ux52KdPmYA==
X-Received: by 2002:a63:fd43:0:b0:39c:d17a:62af with SMTP id
 m3-20020a63fd43000000b0039cd17a62afmr20380443pgj.450.1650478013920; 
 Wed, 20 Apr 2022 11:06:53 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/39] util/log: Rename qemu_logfile to global_file
Date: Wed, 20 Apr 2022 11:06:12 -0700
Message-Id: <20220420180618.1183855-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to emphasize this is the file-scope global variable.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-34-richard.henderson@linaro.org>
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
2.34.1


