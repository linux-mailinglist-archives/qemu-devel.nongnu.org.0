Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F9C47D146
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 12:50:02 +0100 (CET)
Received: from localhost ([::1]:59240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0089-00067Y-HV
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 06:50:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n000W-0004HR-AO
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:42:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n000U-00085K-Co
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:42:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640173325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=25ClTElQGIw4e8rtUX0wQOp5VN41Kck8og/x/WwCBmg=;
 b=Ip0hQvYZbuNmCAJojYohjPa8HwIC3cfk+lC9bxEd3LuY8oiirszNmahwmmkJoLs4ae196f
 XAgMgMtNWXADKCBHX26yXS5smoWfbPDyG+eTHk/X10fzd8oWZl40GuXQW6R6qUP/31PN92
 P3/hFrcoX+W0AhF3vKp1YKlw1zrMDMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-S_nSwqgrMduRdw867PTqlw-1; Wed, 22 Dec 2021 06:42:02 -0500
X-MC-Unique: S_nSwqgrMduRdw867PTqlw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81A848042A2;
 Wed, 22 Dec 2021 11:42:01 +0000 (UTC)
Received: from localhost (unknown [10.39.194.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D86D57B017;
 Wed, 22 Dec 2021 11:41:59 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/3] qsd: Add --daemonize
Date: Wed, 22 Dec 2021 12:41:52 +0100
Message-Id: <20211222114153.67721-3-hreitz@redhat.com>
In-Reply-To: <20211222114153.67721-1-hreitz@redhat.com>
References: <20211222114153.67721-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This option does basically the same as --fork does for qemu-nbd:
- We fork off a child process
- The child process is daemonized (closing its stdin and stdout)
- stderr of the child is routed through the parent, so the parent can
  see errors and adjust its exit code accordingly
- Once the child closes its end of this stderr pipe (done right after
  creating the PID file), the parent exits

It is not named --fork, because --fork was probably a name that few
programs but qemu-nbd ever used.  qemu (the system emulator) itself uses
-daemonize, too.  (Besides, QSD's interface is not compatible to
qemu-nbd anyway; compare --pidfile vs. --pid-file.)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 docs/tools/qemu-storage-daemon.rst   |   7 ++
 storage-daemon/qemu-storage-daemon.c | 151 +++++++++++++++++++++++++++
 2 files changed, 158 insertions(+)

diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index 3e5a9dc032..83905ad526 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -149,6 +149,13 @@ Standard options:
   created but before accepting connections. The daemon has started successfully
   when the pid file is written and clients may begin connecting.
 
+.. option:: --daemonize
+
+  Daemonize the process. The parent process will exit once startup is complete
+  (i.e., after the pid file has been or would have been written) or failure
+  occurs. Its exit code reflects whether the child has started up successfully
+  or failed to do so.
+
 Examples
 --------
 Launch the daemon with QMP monitor socket ``qmp.sock`` so clients can execute
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 42a52d3b1c..cc94240545 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -60,6 +60,7 @@
 #include "trace/control.h"
 
 static const char *pid_file;
+static bool daemonize_opt;
 static volatile bool exit_requested = false;
 
 void qemu_system_killed(int signal, pid_t pid)
@@ -124,6 +125,9 @@ static void help(void)
 "\n"
 "  --pidfile <path>       write process ID to a file after startup\n"
 "\n"
+"  --daemonize            daemonize the process, and have the parent exit\n"
+"                         once startup is complete\n"
+"\n"
 QEMU_HELP_BOTTOM "\n",
     error_get_progname());
 }
@@ -131,6 +135,7 @@ QEMU_HELP_BOTTOM "\n",
 enum {
     OPTION_BLOCKDEV = 256,
     OPTION_CHARDEV,
+    OPTION_DAEMONIZE,
     OPTION_EXPORT,
     OPTION_MONITOR,
     OPTION_NBD_SERVER,
@@ -187,6 +192,7 @@ static void process_options(int argc, char *argv[], bool pre_init_pass)
     static const struct option long_options[] = {
         {"blockdev", required_argument, NULL, OPTION_BLOCKDEV},
         {"chardev", required_argument, NULL, OPTION_CHARDEV},
+        {"daemonize", no_argument, NULL, OPTION_DAEMONIZE},
         {"export", required_argument, NULL, OPTION_EXPORT},
         {"help", no_argument, NULL, 'h'},
         {"monitor", required_argument, NULL, OPTION_MONITOR},
@@ -212,6 +218,7 @@ static void process_options(int argc, char *argv[], bool pre_init_pass)
             c == '?' ||
             c == 'h' ||
             c == 'V' ||
+            c == OPTION_DAEMONIZE ||
             c == OPTION_PIDFILE;
 
         /* Process every option only in its respective pass */
@@ -264,6 +271,9 @@ static void process_options(int argc, char *argv[], bool pre_init_pass)
                 qemu_opts_del(opts);
                 break;
             }
+        case OPTION_DAEMONIZE:
+            daemonize_opt = true;
+            break;
         case OPTION_EXPORT:
             {
                 Visitor *v;
@@ -342,8 +352,137 @@ static void pid_file_init(void)
     atexit(pid_file_cleanup);
 }
 
+/**
+ * Handle daemonizing.
+ *
+ * Return false on error, and true if and only if daemonizing was
+ * successful and we are in the child process.  (The parent process will
+ * never return true, but instead rather exit() if there was no error.)
+ *
+ * When returning true, *old_stderr is set to an FD representing the
+ * original stderr.  Once the child is set up (after creating the PID
+ * file, and before entering the main loop), it should invoke
+ * `daemon_detach(old_stderr)` to have the parent process exit and
+ * restore the original stderr.
+ */
+static bool daemonize(int *old_stderr, Error **errp)
+{
+    int stderr_fd[2];
+    pid_t pid;
+    int ret;
+
+    if (qemu_pipe(stderr_fd) < 0) {
+        error_setg_errno(errp, errno, "Error setting up communication pipe");
+        return false;
+    }
+
+    pid = fork();
+    if (pid < 0) {
+        error_setg_errno(errp, errno, "Failed to fork");
+        return false;
+    }
+
+    if (pid == 0) { /* Child process */
+        close(stderr_fd[0]); /* Close pipe's read end */
+
+        /* Keep the old stderr so we can reuse it after the parent has quit */
+        *old_stderr = dup(STDERR_FILENO);
+        if (*old_stderr < 0) {
+            /*
+             * Cannot return an error without having our stderr point to the
+             * pipe: Otherwise, the parent process would not see the error
+             * message and so not exit with EXIT_FAILURE.
+             */
+            error_setg_errno(errp, errno, "Failed to duplicate stderr FD");
+            dup2(stderr_fd[1], STDERR_FILENO);
+            close(stderr_fd[1]);
+            return false;
+        }
+
+        /*
+         * Daemonize, redirecting all std streams to /dev/null; then
+         * (even on error) redirect stderr to the pipe's write end
+         */
+        ret = qemu_daemon(1, 0);
+
+        /*
+         * Unconditionally redirect stderr to the pipe's write end (and
+         * close the then-unused write end FD, because now stderr points
+         * to it)
+         */
+        dup2(stderr_fd[1], STDERR_FILENO);
+        close(stderr_fd[1]);
+
+        if (ret < 0) {
+            error_setg_errno(errp, errno, "Failed to daemonize");
+            close(*old_stderr);
+            *old_stderr = -1;
+            return false;
+        }
+
+        return true;
+    } else { /* Parent process */
+        bool errors = false;
+        g_autofree char *buf = g_malloc(1024);
+
+        close(stderr_fd[1]); /* Close pipe's write end */
+
+        /* Print error messages from the child until it closes the pipe */
+        while ((ret = read(stderr_fd[0], buf, 1024)) > 0) {
+            errors = true;
+            ret = qemu_write_full(STDERR_FILENO, buf, ret);
+            if (ret < 0) {
+                error_setg_errno(errp, -ret,
+                                 "Failed to print error received from the "
+                                 "daemonized child to stderr");
+                close(stderr_fd[0]);
+                return false;
+            }
+        }
+
+        close(stderr_fd[0]); /* Close read end, it is unused now */
+
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "Cannot read from daemon");
+            return false;
+        }
+
+        /*
+         * Child is either detached and running (in which case it should
+         * not have printed any errors, and @errors should be false), or
+         * has encountered an error (which it should have printed, so
+         * @errors should be true) and has exited.
+         *
+         * Exit with the appropriate exit code.
+         */
+        exit(errors ? EXIT_FAILURE : EXIT_SUCCESS);
+    }
+}
+
+/**
+ * After daemonize(): Let the parent process exit by closing the pipe
+ * connected to it.  The original stderr is restored from *old_stderr.
+ *
+ * This function should be called after creating the PID file and before
+ * entering the main loop.
+ */
+static void daemon_detach(int *old_stderr)
+{
+    /*
+     * Ignore errors; closing the old stderr should not fail, and if
+     * dup-ing fails, then we cannot print anything to stderr anyway
+     */
+    dup2(*old_stderr, STDERR_FILENO);
+
+    close(*old_stderr);
+    *old_stderr = -1;
+}
+
 int main(int argc, char *argv[])
 {
+    Error *local_err = NULL;
+    int old_stderr = -1;
+
 #ifdef CONFIG_POSIX
     signal(SIGPIPE, SIG_IGN);
 #endif
@@ -354,6 +493,14 @@ int main(int argc, char *argv[])
 
     process_options(argc, argv, true);
 
+    if (daemonize_opt) {
+        if (!daemonize(&old_stderr, &local_err)) {
+            error_report_err(local_err);
+            return EXIT_FAILURE;
+        }
+        assert(old_stderr >= 0);
+    }
+
     module_call_init(MODULE_INIT_QOM);
     module_call_init(MODULE_INIT_TRACE);
     qemu_add_opts(&qemu_trace_opts);
@@ -377,6 +524,10 @@ int main(int argc, char *argv[])
      */
     pid_file_init();
 
+    if (daemonize_opt) {
+        daemon_detach(&old_stderr);
+    }
+
     while (!exit_requested) {
         main_loop_wait(false);
     }
-- 
2.33.1


