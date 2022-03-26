Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027B04E813E
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:59:31 +0100 (CET)
Received: from localhost ([::1]:43470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6x0-0001r5-2i
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:59:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6UG-0002yt-Ev
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:29:49 -0400
Received: from [2001:4860:4864:20::2b] (port=43761
 helo=mail-oa1-x2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6UE-0005zS-TC
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:29:48 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-de2cb87f6aso10708639fac.10
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aXHC8lLdzIN7Te/CRAft3NVYbrUQIuuG52xMXpJ9gWU=;
 b=LunsatfujAtg43ZGgevckQNX/CqHKuYL6aBGWGKcvEyz+MoX5JaM7kUf+WTkIj5gx2
 PE55uFgHMsL81mjt34cdgzxKJobhvCrDo0qUwjDMdPXG+MHW+gkVQintXOCF4eM7X8Rx
 VE/WJ84uGfAtPG92LUqP2+P59n33MgcyKIy45jfQn02ITZMQ6/BiEtbE79uorvH1r7CV
 naxJDtz78LKu+ksFWSWB5T7AeULZ++LgEfw3hkOKnbpoil6yarqW0KbhRcci1VsP1fI/
 /oLHLAOqhjjZqvAWbta8A0tInF191bcnOva7lT03gawAWwJt9sjzDExj1lFMh0Sqo6r7
 w5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aXHC8lLdzIN7Te/CRAft3NVYbrUQIuuG52xMXpJ9gWU=;
 b=5aH8eP0frvlQytiAA8Vgoe0z69PJ0EW6NxJufK8egGDpdqbimf7rlezH9PP9hla2cg
 SSy9ZVXvnOqFvNHjwvR0e4T4EwrMfRaUITgNW6MBSV/pxxV/9IKrkkauCSvDnyLKuCeK
 aMZGyYaIHxa/OgC4Cs5IyobHcwFnGFMgJfVfyYs8f8WE48wVlwx/Fy1ORvNOzNLoPUmS
 YXALvbQw84bwrj9WOZcSipnxyLx0JsGhl3ARmU3+JsqVhaA3Rh3xt9cNv1CFcypFj5ps
 Uu99ZzmESL7dpMWWOeEvTnXGYTZJgzGP45ObcBAfweYliygT0/aI4bJUpahYBImwhVTX
 zkrg==
X-Gm-Message-State: AOAM532dYJ8F+xjm3PEkFenP54FkRlBXNPIacp2wmZGM2BSVTdSBINpe
 82N26aQ99063HfAs0NxPSyMF5tV4LZ2KrB2m
X-Google-Smtp-Source: ABdhPJzRXnYZCQO403uBAwAvgNUDwavbMMWRN+XU4VSKbFiJW+brE2v834P4tWZuLd7cQS+BklUraw==
X-Received: by 2002:a05:6871:28b:b0:de:282:34ef with SMTP id
 i11-20020a056871028b00b000de028234efmr7076648oae.287.1648301385957; 
 Sat, 26 Mar 2022 06:29:45 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 s24-20020a056808209800b002da3b9bf8e0sm4394509oiw.32.2022.03.26.06.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:29:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 38/39] util/log: Limit RCUCloseFILE to file closing
Date: Sat, 26 Mar 2022 07:25:33 -0600
Message-Id: <20220326132534.543738-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2b
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


