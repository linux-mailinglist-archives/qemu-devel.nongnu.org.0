Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9F9504952
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:34:04 +0200 (CEST)
Received: from localhost ([::1]:47886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAep-0002NN-Ej
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fp-0000ci-Ir
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:31:01 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fl-0001rq-O8
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:31:01 -0400
Received: by mail-pg1-x529.google.com with SMTP id u2so15065244pgq.10
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WkPO7O3SH+mqM1LpQF27rJkG3zYmP1ZHzvw0E2vUPQ8=;
 b=hUsJBNRtyg50OrA57COr3YWZiOp87mF7emQpbnL595olmO/cGg11++g7xbYeiNNCjo
 t+hOMqexUTF6bdhFbtYgv0inGhdHAdBo2tEW8pXFLU32OqXCKqWwgN1IG5LJH0HlmJss
 kLf9s2SBN6fnkQY96vPl1zeVB6NJszwCZ6o2t1M2sWOX4OZvpQNb6v2FxIZSThQu3l7h
 XIVlc7uCTvc0UwHPsgsoLqDy665miqxvq0Br5qKmbDsGB6LORChVijqjwRJhP1NF8sCo
 OdrQEMKB2KStZKLFF334U5ibaj999iZ0TEiH5vYJ6chhVMEk7Vcll+bc/pQMSc6YIU4O
 30nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WkPO7O3SH+mqM1LpQF27rJkG3zYmP1ZHzvw0E2vUPQ8=;
 b=QMyQ2XB3huMPnAIvFyguuB/CheAAdhl9iGItZ30Nli43zWh/c6oC7LFqUirh7+vuLa
 ffQxonHfZbLooNFAGAHWABGhFAwCuxgmOpWyL8xHJXevTRW8HRJLMFpuWuIhM1de2t8B
 QoDjWiyeITzHM+bDqqkhCbuCf31+1j7jMDyLHFHWDSWLoPhR+tZeCwMYe7lT74H2Wth9
 nQ6Fawti/yv6QqYgPizzKPVeox4xYmhF95hK5qud9539IHBlCs4abOVhUwM0Ehs/kLW+
 X/E971FF7g1PWGo/uYrR/0AYZ7F6MmctlLQbxRL4xz6kiopo4ydftRcfy8NQGHAeJYXl
 uW7Q==
X-Gm-Message-State: AOAM533U+pnZWQ379xGMfophsrqCCC6VNKMtXSK7r3sMkPziFY585/NS
 VX1PGojiYUFjEmctlOhBVqLn7LjbFDTe4g==
X-Google-Smtp-Source: ABdhPJzd4bOBuw/xFTCC/uKFCpLXCXWW+Ug9YhEFYzpayMRQBr7rfZ7wWjRjx9FePw+xexMu5sR2CQ==
X-Received: by 2002:a65:6956:0:b0:399:1f0e:6172 with SMTP id
 w22-20020a656956000000b003991f0e6172mr7146074pgq.286.1650220252559; 
 Sun, 17 Apr 2022 11:30:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 38/39] util/log: Limit RCUCloseFILE to file closing
Date: Sun, 17 Apr 2022 11:30:18 -0700
Message-Id: <20220417183019.755276-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

Use FILE* for global_file.  We can perform an rcu_read on that
just as easily as RCUCloseFILE*.  This simplifies a couple of
places, where previously we required taking the rcu_read_lock
simply to avoid racing to dereference RCUCloseFile->fd.

Only allocate the RCUCloseFile prior to call_rcu.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Work around problem with qatomic_rcu_read vs struct _IO_FILE on musl.
---
 util/log.c | 68 +++++++++++++++++++++++++-----------------------------
 1 file changed, 32 insertions(+), 36 deletions(-)

diff --git a/util/log.c b/util/log.c
index eb6e85b2f0..df0710720f 100644
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
@@ -46,46 +46,44 @@ static GArray *debug_regions;
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
 
 FILE *qemu_log_trylock(void)
 {
-    RCUCloseFILE *logfile;
+    FILE *logfile;
 
     rcu_read_lock();
-    logfile = qatomic_rcu_read(&global_file);
+    /*
+     * FIXME: typeof_strip_qual, as used by qatomic_rcu_read,
+     * does not work with pointers to undefined structures,
+     * such as we have with struct _IO_FILE and musl libc.
+     * Since all we want is a read of a pointer, cast to void**,
+     * which does work with typeof_strip_qual.
+     */
+    logfile = qatomic_rcu_read((void **)&global_file);
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
@@ -110,9 +108,7 @@ static void __attribute__((__constructor__)) startup(void)
 
 static void rcu_close_file(RCUCloseFILE *r)
 {
-    if (r->fd != stderr) {
-        fclose(r->fd);
-    }
+    fclose(r->fd);
     g_free(r);
 }
 
@@ -122,7 +118,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
 {
     bool need_to_open_file;
     bool daemonized;
-    RCUCloseFILE *logfile;
+    FILE *logfile;
 
     QEMU_LOCK_GUARD(&global_mutex);
     logfile = global_file;
@@ -176,37 +172,37 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
 
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
                 return false;
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
     return true;
-- 
2.25.1


