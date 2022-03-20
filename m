Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202A44E1D31
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:37:18 +0100 (CET)
Received: from localhost ([::1]:52578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzUT-0003jT-74
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:37:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz6B-0000Ur-Us
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:13 -0400
Received: from [2607:f8b0:4864:20::433] (port=38464
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz6A-0003X5-6c
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:11 -0400
Received: by mail-pf1-x433.google.com with SMTP id p5so7544160pfo.5
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v5msDAveF1p/6j9G29fbPZtpzPMOaY2gnc7JkYmq63w=;
 b=PiNw5nvllji+Qd62QygTkiMoibJbavRha09GzDnTFMCVjkSnoatM0plCq4vdNKV9dO
 oFtdZ0gP5unXBVkvSPlronwPnMAivDU+5/H1bu6Wh1ZbD3ztjC2spW7QYEtSQvrlvG5P
 e42XgmAhbz4H4y3cQusolSx9k92AUBSHDJ74NslLblnoOizs8QVFXSG4wIWaYgf2oGfY
 GYYymBVlnLAefORFOcMq2NHKFNgsDO58oChiHgKEwcg0G9NTnzWSDL9sEPtPbjRNGw0o
 cZmcpNp4950xBBILEBAzqH8svektpXhJsE5+9zIOSLV+Nnod4rWinmyKqSI1x6SdNBfY
 YkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v5msDAveF1p/6j9G29fbPZtpzPMOaY2gnc7JkYmq63w=;
 b=t56xEfiA2MLU0gELd+HJuTdVwZI2NuWpLQ4f2JSRKA9N/wFvlhcWln4eGFPCMdm8Bo
 xh0RBzIwLsJSXnWzyeft6BJRyKZ1xOSx+lSlB654UIMRseMi79GQZrrTFrFODWR9JObD
 3seze0bzBM4mXcnxh9oDOiVdaOK9rN9bHskIFt3fE8EGnoWHgv1gqUmIjQQ9i1u6PAeo
 use3//qJm9mgLhIRkRPOoR364Sk/t6gmfRhBxLaovsPItldCv8eggmuT7D1MEUlsKPuq
 EI48opR+1tti1C6T3lRRJlokQFQqamdcFS+RZppCOiRCxo56ghAmIIIKNqTv0sNwhHCf
 6wgg==
X-Gm-Message-State: AOAM533ZWRLzjEAy4BnEpN8mCWrI/EWENLppv7++RhcSpPI94O7h3NQf
 MER+MCwaKtg2divgXWRd5aKCZsGTNS2oiw==
X-Google-Smtp-Source: ABdhPJy9avJ8CPUjOBFIWPIJdnzOTaVo7Y48SKTVoBH31a00NSZ+DDSnhn8TafcIp8WEYVrRkf2gPg==
X-Received: by 2002:a05:6a00:140c:b0:4e1:530c:edc0 with SMTP id
 l12-20020a056a00140c00b004e1530cedc0mr19916610pfu.18.1647796328696; 
 Sun, 20 Mar 2022 10:12:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:12:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 35/36] util/log: Limit RCUCloseFILE to file closing
Date: Sun, 20 Mar 2022 10:11:34 -0700
Message-Id: <20220320171135.2704502-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

Use FILE* for global_file.  We can perform an rcu_read on that
just as easily as RCUCloseFILE*.  This simplifies a couple of
places, where previously we required taking the rcu_read_lock
simply to avoid racing to dereference RCUCloseFile->fd.

Only allocate the RCUCloseFile prior to call_rcu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 67 +++++++++++++++++++++++-------------------------------
 1 file changed, 28 insertions(+), 39 deletions(-)

diff --git a/util/log.c b/util/log.c
index e966d1091d..713a0744be 100644
--- a/util/log.c
+++ b/util/log.c
@@ -37,7 +37,7 @@ typedef struct RCUCloseFILE {
 /* Mutex covering the other global_* variables. */
 static QemuMutex global_mutex;
 static char *global_filename;
-static RCUCloseFILE *global_file;
+static FILE *global_file;
 
 int qemu_loglevel;
 static int log_append = 0;
@@ -46,46 +46,37 @@ static GArray *debug_regions;
 /* Returns true if qemu_log() will really write somewhere. */
 bool qemu_log_enabled(void)
 {
-    return global_file != NULL;
+    return qatomic_read(&global_file) != NULL;
 }
 
 /* Returns true if qemu_log() will write somewhere other than stderr. */
 bool qemu_log_separate(void)
 {
-    RCUCloseFILE *logfile;
-    bool res = false;
-
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&global_file);
-    if (logfile && logfile->fd != stderr) {
-        res = true;
-    }
-    rcu_read_unlock();
-    return res;
+    FILE *logfile = qatomic_read(&global_file);
+    return logfile && logfile != stderr;
 }
 
 /* Lock/unlock output. */
 
 FILE *qemu_log_lock(void)
 {
-    RCUCloseFILE *logfile;
+    FILE *logfile;
 
     rcu_read_lock();
     logfile = qatomic_rcu_read(&global_file);
     if (logfile) {
-        qemu_flockfile(logfile->fd);
-        return logfile->fd;
+        qemu_flockfile(logfile);
     } else {
         rcu_read_unlock();
-        return NULL;
     }
+    return logfile;
 }
 
-void qemu_log_unlock(FILE *fd)
+void qemu_log_unlock(FILE *logfile)
 {
-    if (fd) {
-        fflush(fd);
-        qemu_funlockfile(fd);
+    if (logfile) {
+        fflush(logfile);
+        qemu_funlockfile(logfile);
         rcu_read_unlock();
     }
 }
@@ -93,16 +84,16 @@ void qemu_log_unlock(FILE *fd)
 /* Return the number of characters emitted.  */
 int qemu_log(const char *fmt, ...)
 {
-    FILE *f = qemu_log_lock();
+    FILE *logfile = qemu_log_lock();
     int ret = 0;
 
-    if (f) {
+    if (logfile) {
         va_list ap;
 
         va_start(ap, fmt);
-        ret = vfprintf(f, fmt, ap);
+        ret = vfprintf(logfile, fmt, ap);
         va_end(ap);
-        qemu_log_unlock(f);
+        qemu_log_unlock(logfile);
 
         /* Don't pass back error results.  */
         if (ret < 0) {
@@ -119,9 +110,7 @@ static void __attribute__((__constructor__)) startup(void)
 
 static void rcu_close_file(RCUCloseFILE *r)
 {
-    if (r->fd != stderr) {
-        fclose(r->fd);
-    }
+    fclose(r->fd);
     g_free(r);
 }
 
@@ -131,7 +120,7 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
 {
     bool need_to_open_file;
     bool daemonized;
-    RCUCloseFILE *logfile;
+    FILE *logfile;
 
     QEMU_LOCK_GUARD(&global_mutex);
     logfile = global_file;
@@ -185,37 +174,37 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
 
     if (logfile && (!need_to_open_file || changed_name)) {
         qatomic_rcu_set(&global_file, NULL);
-        call_rcu(logfile, rcu_close_file, rcu);
+        if (logfile != stderr) {
+            RCUCloseFILE *r = g_new0(RCUCloseFILE, 1);
+            r->fd = logfile;
+            call_rcu(r, rcu_close_file, rcu);
+        }
         logfile = NULL;
     }
 
     if (!logfile && need_to_open_file) {
-        FILE *fd;
-
         if (filename) {
-            fd = fopen(filename, log_append ? "a" : "w");
-            if (!fd) {
+            logfile = fopen(filename, log_append ? "a" : "w");
+            if (!logfile) {
                 error_setg_errno(errp, errno, "Error opening logfile %s",
                                  filename);
                 return;
             }
             /* In case we are a daemon redirect stderr to logfile */
             if (daemonized) {
-                dup2(fileno(fd), STDERR_FILENO);
-                fclose(fd);
+                dup2(fileno(logfile), STDERR_FILENO);
+                fclose(logfile);
                 /* This will skip closing logfile in rcu_close_file. */
-                fd = stderr;
+                logfile = stderr;
             }
         } else {
             /* Default to stderr if no log file specified */
             assert(!daemonized);
-            fd = stderr;
+            logfile = stderr;
         }
 
         log_append = 1;
 
-        logfile = g_new0(RCUCloseFILE, 1);
-        logfile->fd = fd;
         qatomic_rcu_set(&global_file, logfile);
     }
 }
-- 
2.25.1


