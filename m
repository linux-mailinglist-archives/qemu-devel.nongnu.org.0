Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F366F604B2D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:23:23 +0200 (CEST)
Received: from localhost ([::1]:45442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olAuh-0008VS-2q
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1olAoh-000457-1k
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:17:11 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:48773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1olAof-00022N-8m
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:17:10 -0400
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-OosLUMQFPBu7SCnqojLufQ-1; Wed, 19 Oct 2022 11:16:57 -0400
X-MC-Unique: OosLUMQFPBu7SCnqojLufQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 664B43802B82;
 Wed, 19 Oct 2022 15:16:56 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6263A9459C;
 Wed, 19 Oct 2022 15:16:55 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 2/2] util/log: Always send errors to logfile when daemonized
Date: Wed, 19 Oct 2022 17:16:51 +0200
Message-Id: <20221019151651.334334-3-groug@kaod.org>
In-Reply-To: <20221019151651.334334-1-groug@kaod.org>
References: <20221019151651.334334-1-groug@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When QEMU is started with `-daemonize`, all stdio descriptors get
redirected to `/dev/null`. This basically means that anything
printed with error_report() and friends is lost.

One could hope that passing `-D ${logfile}` would cause the messages
to go to `${logfile}`, as the documentation tends to suggest:

      -D logfile
              Output log in logfile instead of to stderr

Unfortunately, `-D` belongs to the logging framework and it only
does this redirection if some log item is also enabled with `-d`
or if QEMU was configured with `--enable-trace-backend=log`. A
typical production setup doesn't do tracing or fine-grain
debugging but it certainly needs to collect errors.

Ignore the check on enabled log items when QEMU is daemonized. Previous
behaviour is retained for the non-daemonized case. The logic is unrolled
as an `if` for better readability. Since qemu_set_log_internal() caches
the final log level and the per-thread property in global variables, it
seems more correct to check these instead of intermediary local variables.

Special care is needed for the `-D ${logfile} -d tid` case : `${logfile}`
is expected to be a template that contains exactly one `%d` that should be
expanded to a PID or TID. The logic in qemu_log_trylock() already takes
care of that for per-thread logs. Do it as well for the QEMU main thread
when opening the file.

Note that qemu_log_trylock() now must ensure that the main QEMU thread
only uses the global log file ; qemu_log_unlock() must be adapted as well
by checking thread_file which is always equal to NULL for the main thread.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 util/log.c | 49 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/util/log.c b/util/log.c
index e1c2535cfcd2..0fa23729c78c 100644
--- a/util/log.c
+++ b/util/log.c
@@ -82,6 +82,11 @@ static int log_thread_id(void)
 #endif
 }
 
+static bool is_main_log_thread(void)
+{
+    return log_thread_id() == getpid();
+}
+
 /* Lock/unlock output. */
 
 FILE *qemu_log_trylock(void)
@@ -90,7 +95,8 @@ FILE *qemu_log_trylock(void)
 
     logfile = thread_file;
     if (!logfile) {
-        if (log_per_thread) {
+        /* Main thread to use the global file only */
+        if (log_per_thread && !is_main_log_thread()) {
             g_autofree char *filename
                 = g_strdup_printf(global_filename, log_thread_id());
             logfile = fopen(filename, "w");
@@ -124,7 +130,7 @@ void qemu_log_unlock(FILE *logfile)
     if (logfile) {
         fflush(logfile);
         qemu_funlockfile(logfile);
-        if (!log_per_thread) {
+        if (!thread_file) {
             rcu_read_unlock();
         }
     }
@@ -253,16 +259,21 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
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
 
     if (logfile && (!need_to_open_file || changed_name)) {
         qatomic_rcu_set(&global_file, NULL);
@@ -276,10 +287,22 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
 
     if (!logfile && need_to_open_file) {
         if (filename) {
-            logfile = fopen(filename, log_append ? "a" : "w");
+            g_autofree char *fname = NULL;
+
+            /*
+             * If per-thread, filename contains a single %d that should be
+             * converted.
+             */
+            if (per_thread) {
+                fname = g_strdup_printf(filename, getpid());
+            } else {
+                fname = g_strdup(filename);
+            }
+
+            logfile = fopen(fname, log_append ? "a" : "w");
             if (!logfile) {
                 error_setg_errno(errp, errno, "Error opening logfile %s",
-                                 filename);
+                                 fname);
                 return false;
             }
             /* In case we are a daemon redirect stderr to logfile */
-- 
2.37.3


