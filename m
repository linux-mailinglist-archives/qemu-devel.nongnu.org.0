Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41DA4E1D35
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:39:49 +0100 (CET)
Received: from localhost ([::1]:55322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzWu-0005ZW-OS
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:39:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz67-0000OO-3m
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:07 -0400
Received: from [2607:f8b0:4864:20::631] (port=35668
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz65-0003Vu-Er
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:06 -0400
Received: by mail-pl1-x631.google.com with SMTP id n15so10901626plh.2
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JKSI3UGozDJNBAh+QUx3PhImAK1Aw8+e6IP7+9yTeH4=;
 b=euGRNYuMu54gk93H0zl0aTUrj12Yy4p3/eCuCwxBUmSOJq2DsMFW6j7tLtHn8jUQ+u
 g4NOxa1yLlcLYC1H8fMA5WKBG6A3jlDjOYQe7clx0uV2yJi7CvJ2gEgGmnG3TLYqXk8Z
 CKYrxpVPsIBKi7SQtJEs5fNLjp7Tk3sNRjimJh+hUYVxkwyOwwBdKCJwiFTORI40kXod
 cgzAB5hvegQVapxdcZwXMcMtm9JDhnFW7A9+UbwTp5zCFaBDLvUgvfaMq+x1aS0imjhe
 rxQYbNrMi7MkIybqPs9hZHa41f/eFZjJWu9zVMknbX1AkBmJ6SVc+tFl4qimtx8p5tou
 wc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JKSI3UGozDJNBAh+QUx3PhImAK1Aw8+e6IP7+9yTeH4=;
 b=eIWJhXNUt0QIPaHndkAzsLbB3QeMvdDCIp9V/Oo2J44P77tXp4RnWACDbb1O+sx4hG
 +qXk2yD2vNPkT1v9Lm8w2NKUnAOo1wMAZApwtZjkw49twTihuOcQbuDiFk1ClwaTpuQW
 HSmP8CW7mWfjMBrlNC0yZY5WvQlvT/ZhxcA334jvj9Ik4qZ3cCrNN7mUPl2WgBO7LUwt
 kmrpNPiE7kvSenM1o2eCGO3SIFe6A73v4HqzdeOmrpXOJrs2/CNGkBsw+C0HMzhG0Wjw
 ez0NeFlIqwBOLp8SMefrFJPY0EMxIzMvM7iExarNOCd/nZiWVOF+VdN572WZI8yo7xiQ
 HlOQ==
X-Gm-Message-State: AOAM530hTdhdFaO7ch1pyNfXThKcuPUxE+OxBY7J8NqZD9wmfsu810aa
 9lkt+/7fuh9us49S3NNEWh3Mgr2oxBhB7A==
X-Google-Smtp-Source: ABdhPJwZ1Nyqjn6FFXs/RKAs/2HVSy/Lv7+ZS8lYcP4OKeSJ/TZTut2F4oBkUM/xZ08h25TeentQ9A==
X-Received: by 2002:a17:90b:390c:b0:1c6:259f:a4cd with SMTP id
 ob12-20020a17090b390c00b001c6259fa4cdmr32078135pjb.73.1647796324163; 
 Sun, 20 Mar 2022 10:12:04 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:12:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 30/36] util/log: Rename qemu_logfile to global_file
Date: Sun, 20 Mar 2022 10:11:29 -0700
Message-Id: <20220320171135.2704502-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Rename to emphasize this is the file-scope global variable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/util/log.c b/util/log.c
index e559d37369..0676ce5bd6 100644
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
@@ -69,7 +69,7 @@ FILE *qemu_log_lock(void)
     QemuLogFile *logfile;
 
     rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
+    logfile = qatomic_rcu_read(&global_file);
     if (logfile) {
         qemu_flockfile(logfile->fd);
         return logfile->fd;
@@ -133,7 +133,7 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
     QemuLogFile *logfile;
 
     QEMU_LOCK_GUARD(&qemu_logfile_mutex);
-    logfile = qemu_logfile;
+    logfile = global_file;
 
     if (changed_name) {
         char *newname = NULL;
@@ -165,7 +165,7 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
         filename = newname;
 
         if (logfile) {
-            qatomic_rcu_set(&qemu_logfile, NULL);
+            qatomic_rcu_set(&global_file, NULL);
             call_rcu(logfile, qemu_logfile_free, rcu);
             logfile = NULL;
         }
@@ -188,7 +188,7 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
     need_to_open_file = log_flags && (!is_daemonized() || filename);
 
     if (logfile && !need_to_open_file) {
-        qatomic_rcu_set(&qemu_logfile, NULL);
+        qatomic_rcu_set(&global_file, NULL);
         call_rcu(logfile, qemu_logfile_free, rcu);
         return;
     }
@@ -219,7 +219,7 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
 
         logfile = g_new0(QemuLogFile, 1);
         logfile->fd = fd;
-        qatomic_rcu_set(&qemu_logfile, logfile);
+        qatomic_rcu_set(&global_file, logfile);
     }
 }
 
-- 
2.25.1


