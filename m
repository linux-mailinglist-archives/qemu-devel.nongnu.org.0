Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FF762147D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 15:01:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osPAE-0006is-C6; Tue, 08 Nov 2022 09:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1osP9x-0006ZA-EI
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:01:05 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1osP9u-0005Rk-5S
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:01:00 -0500
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-8SA2lIVQML2qMxQiNpheQg-1; Tue, 08 Nov 2022 09:00:45 -0500
X-MC-Unique: 8SA2lIVQML2qMxQiNpheQg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE0EE811E81;
 Tue,  8 Nov 2022 14:00:44 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 831CAC15BB5;
 Tue,  8 Nov 2022 14:00:43 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>
Subject: [PATCH v3 2/2] util/log: Always send errors to logfile when daemonized
Date: Tue,  8 Nov 2022 15:00:32 +0100
Message-Id: <20221108140032.1460307-3-groug@kaod.org>
In-Reply-To: <20221108140032.1460307-1-groug@kaod.org>
References: <20221108140032.1460307-1-groug@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When QEMU is started with `-daemonize`, all stdio descriptors get
redirected to `/dev/null`. This basically means that anything
printed with error_report() and friends is lost.

Current logging code allows to redirect to a file with `-D` but
this requires to enable some logging item with `-d` as well to
be functional.

Relax the check on the log flags when QEMU is daemonized, so that
other users of stderr can benefit from the redirection, without the
need to enable unwanted debug logs. Previous behaviour is retained
for the non-daemonized case. The logic is unrolled as an `if` for
better readability. The qemu_log_level and log_per_thread globals
reflect the state we want to transition to at this point : use
them instead of the intermediary locals for correctness.

qemu_set_log_internal() is adapted to open a per-thread log file
when '-d tid' is passed. This is done by hijacking qemu_try_lock()
which seems simpler that refactoring the code.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 util/log.c | 72 ++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 19 deletions(-)

diff --git a/util/log.c b/util/log.c
index fb843453dd49..7837ff991769 100644
--- a/util/log.c
+++ b/util/log.c
@@ -79,13 +79,15 @@ static int log_thread_id(void)
 
 static void qemu_log_thread_cleanup(Notifier *n, void *unused)
 {
-    fclose(thread_file);
-    thread_file = NULL;
+    if (thread_file != stderr) {
+        fclose(thread_file);
+        thread_file = NULL;
+    }
 }
 
 /* Lock/unlock output. */
 
-FILE *qemu_log_trylock(void)
+static FILE *qemu_log_trylock_with_err(Error **errp)
 {
     FILE *logfile;
 
@@ -96,6 +98,9 @@ FILE *qemu_log_trylock(void)
                 = g_strdup_printf(global_filename, log_thread_id());
             logfile = fopen(filename, "w");
             if (!logfile) {
+                error_setg_errno(errp, errno,
+                                 "Error opening logfile %s for thread %d",
+                                 filename, log_thread_id());
                 return NULL;
             }
             thread_file = logfile;
@@ -122,6 +127,11 @@ FILE *qemu_log_trylock(void)
     return logfile;
 }
 
+FILE *qemu_log_trylock(void)
+{
+    return qemu_log_trylock_with_err(NULL);
+}
+
 void qemu_log_unlock(FILE *logfile)
 {
     if (logfile) {
@@ -265,16 +275,21 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
 #endif
     qemu_loglevel = log_flags;
 
-    /*
-     * In all cases we only log if qemu_loglevel is set.
-     * Also:
-     *   If per-thread, open the file for each thread in qemu_log_lock.
-     *   If not daemonized we will always log either to stderr
-     *     or to a file (if there is a filename).
-     *   If we are daemonized, we will only log if there is a filename.
-     */
     daemonized = is_daemonized();
-    need_to_open_file = log_flags && !per_thread && (!daemonized || filename);
+    need_to_open_file = false;
+    if (!daemonized) {
+        /*
+         * If not daemonized we only log if qemu_loglevel is set, either to
+         * stderr or to a file (if there is a filename).
+         * If per-thread, open the file for each thread in qemu_log_trylock().
+         */
+        need_to_open_file = qemu_loglevel && !log_per_thread;
+    } else {
+        /*
+         * If we are daemonized, we will only log if there is a filename.
+         */
+        need_to_open_file = filename != NULL;
+    }
 
     if (logfile) {
         fflush(logfile);
@@ -287,19 +302,34 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
         }
     }
 
+    if (log_per_thread && daemonized) {
+        logfile = thread_file;
+    }
+
     if (!logfile && need_to_open_file) {
         if (filename) {
-            logfile = fopen(filename, "w");
-            if (!logfile) {
-                error_setg_errno(errp, errno, "Error opening logfile %s",
-                                 filename);
-                return false;
+            if (log_per_thread) {
+                logfile = qemu_log_trylock_with_err(errp);
+                if (!logfile) {
+                    return false;
+                }
+                qemu_log_unlock(logfile);
+            } else {
+                logfile = fopen(filename, "w");
+                if (!logfile) {
+                    error_setg_errno(errp, errno, "Error opening logfile %s",
+                                     filename);
+                    return false;
+                }
             }
             /* In case we are a daemon redirect stderr to logfile */
             if (daemonized) {
                 dup2(fileno(logfile), STDERR_FILENO);
                 fclose(logfile);
-                /* This will skip closing logfile in rcu_close_file. */
+                /*
+                 * This will skip closing logfile in rcu_close_file()
+                 * or qemu_log_thread_cleanup().
+                 */
                 logfile = stderr;
             }
         } else {
@@ -308,7 +338,11 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
             logfile = stderr;
         }
 
-        qatomic_rcu_set(&global_file, logfile);
+        if (log_per_thread && daemonized) {
+            thread_file = logfile;
+        } else {
+            qatomic_rcu_set(&global_file, logfile);
+        }
     }
     return true;
 }
-- 
2.38.1


