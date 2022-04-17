Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1174A504944
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:18:49 +0200 (CEST)
Received: from localhost ([::1]:41350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAQ4-0003sb-5S
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fo-0000XN-2w
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:31:00 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9ff-0001qn-Nw
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:59 -0400
Received: by mail-pl1-x631.google.com with SMTP id c12so10789470plr.6
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h+yT2/MjJCx26TDMAi2TGagAsn9gW0LsB4wUZWDRCJ8=;
 b=wHU1PjLD1DhdFFl69F5s2tyEnphs18Fro4Upu9f1KjGLZZDsEMrruXrin2IcGdC0TS
 2erYlrYworgh22O3+F1I+Nv3lQhkDgTrgQCFgVRGfbwlk9eBuDW0ga86hxGrIKLfXKUo
 PhDInksv4HIWI/596UFuEnNWhqB1KAt9ozrbqcsOQgoTNBvCZWqR5zzs//HAc8OdQ7hC
 E4t40rIy9Jz071wgWsbK450awj1HBlI+plzbKfiJxg7cb7Eg+llzHttxMShwvz5UQg4a
 UgtW8U1od7TEho0EFtpKvcfpDaOn/mfxyh4qVH24K1dgfzPvf4QNu1l6WKhTxb9l9BWa
 vqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h+yT2/MjJCx26TDMAi2TGagAsn9gW0LsB4wUZWDRCJ8=;
 b=4tlF+Ntp1Rvy2tJim8Pfb2ntQ0Y/ie7Fr6lIUle+dfh5g3YD+lHIHf5dB6z++j35zn
 JdHXb9ggpUarC++kytvWt6azQ15ZYzQJ+h/aDuEccxzI/d+tMN+54jVWtB+XDWDm5x4w
 AESjM8uJSzr0H10SixzaWtLHJmpDWanwvrXNiT/gKA+x+Wj71DUuQa5agTqyqh/eZ8uY
 KM29xNm78Iujv76ouVI2eXOUqqxlGw4GxdPPC6WTzRiIk9sE3cSGTQ/QRhLLZ2zPmxwR
 7ORV/CsvBRKSdrMNGX68p25QdKD/hoK6Liw0KuKJjc2lj2XThOeeLEcZmVU769rWweOQ
 p3pQ==
X-Gm-Message-State: AOAM530a//ZbCZqYZMgDsogNw+0MKUaHg7D7ftXMNyZYg2Mlv5PDxQkn
 jJO/+oH3tWD7QHjDuqnpRUsid5rghtiSRA==
X-Google-Smtp-Source: ABdhPJzEFZZ4ywjejWEOZymB0NyiIwirkB0jjcskx2z7SxbULqqdKfXS6xPkD5qScI1GXumOlUXfIA==
X-Received: by 2002:a17:90b:4f4e:b0:1cd:49fa:911d with SMTP id
 pj14-20020a17090b4f4e00b001cd49fa911dmr9140774pjb.26.1650220248082; 
 Sun, 17 Apr 2022 11:30:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 33/39] util/log: Rename qemu_logfile to global_file
Date: Sun, 17 Apr 2022 11:30:13 -0700
Message-Id: <20220417183019.755276-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Rename to emphasize this is the file-scope global variable.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


