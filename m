Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD715FE8B9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 08:10:54 +0200 (CEST)
Received: from localhost ([::1]:36770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojDuH-00009Z-53
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 02:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ojDrv-0006R9-5d
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 02:08:27 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:30013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ojDrt-0002CK-4k
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 02:08:26 -0400
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-1Q4qSoTdMl-1qg5pM6wHgQ-1; Fri, 14 Oct 2022 02:08:09 -0400
X-MC-Unique: 1Q4qSoTdMl-1qg5pM6wHgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E36303800C25;
 Fri, 14 Oct 2022 06:08:08 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24455140215F;
 Fri, 14 Oct 2022 06:08:07 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Greg Kurz <groug@kaod.org>
Subject: [PATCH] util/log: Always send errors to logfile when daemonized
Date: Fri, 14 Oct 2022 08:08:07 +0200
Message-Id: <20221014060807.660587-1-groug@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
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
printed with `error_report()` and friends is lost.

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
as a series of `if` for better readability.

Special care is needed for the `-D ${logfile} -d tid` case : `${logfile}`
is expected to be a template that contains exactly one `%d` that should be
expanded to a PID or TID. The logic in `qemu_log_trylock()` already takes
care of that for per-thread logs. Do it as well for the QEMU main thread
when opening the file.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 util/log.c | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/util/log.c b/util/log.c
index d6eb0378c3a3..a4592fa9bb70 100644
--- a/util/log.c
+++ b/util/log.c
@@ -248,16 +248,21 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
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
+        need_to_open_file = log_flags && !per_thread;
+    } else if (filename) {
+        /*
+         * If we are daemonized, we will only log if there is a filename.
+         */
+        need_to_open_file = true;
+    }
 
     if (logfile && (!need_to_open_file || changed_name)) {
         qatomic_rcu_set(&global_file, NULL);
@@ -271,10 +276,22 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
 
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


