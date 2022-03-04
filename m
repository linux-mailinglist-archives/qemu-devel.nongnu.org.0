Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8E04CD985
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 17:54:47 +0100 (CET)
Received: from localhost ([::1]:39798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBCY-0006tK-OI
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 11:54:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5e-00053r-VJ
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5d-0007MR-8K
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bJokEgsG01itwDXfYX2sZGwJCpdXJ/goaq24DA7vKug=;
 b=aQ7JByhqpO4ik514FQCwjJwCUBaJroh1puekeqkJrXpvy6C8fIqd0Md7lp6IU3jj1gUVj4
 3VWa3jNywYExlA6r1XsDLUiIL94nWdI96JS38T0N5vtm4UGCHx6aD3bKdLlMhV3ZkGrOGT
 BRN2LDNvwyczXlLUZ0arome/pVB2jBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-B77n3t5ePH-kprPNM46sbA-1; Fri, 04 Mar 2022 11:47:33 -0500
X-MC-Unique: B77n3t5ePH-kprPNM46sbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7431B180FD75;
 Fri,  4 Mar 2022 16:47:32 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7754D85473;
 Fri,  4 Mar 2022 16:47:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/50] qsd: Add --daemonize
Date: Fri,  4 Mar 2022 17:46:33 +0100
Message-Id: <20220304164711.474713-13-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

To implement this, we reuse the existing daemonizing functions from the
system emulator, which mainly do the following:
- Fork off a child process, and set up a pipe between parent and child
- The parent process waits until the child sends a status byte over the
  pipe (0 means that the child was set up successfully; anything else
  (including errors or EOF) means that the child was not set up
  successfully), and then exits with an appropriate exit status
- The child process enters a new session (forking off again), changes
  the umask, and will ignore terminal signals from then on
- Once set-up is complete, the child will chdir to /, redirect all
  standard I/O streams to /dev/null, and tell the parent that set-up has
  been completed successfully

In contrast to qemu-nbd's --fork implementation, during the set up
phase, error messages are not piped through the parent process.
qemu-nbd mainly does this to detect errors, though (while os_daemonize()
has the child explicitly signal success after set up); because we do not
redirect stderr after forking, error messages continue to appear on
whatever the parent's stderr was (until set up is complete).

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220303164814.284974-4-hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/tools/qemu-storage-daemon.rst   |  7 +++++++
 storage-daemon/qemu-storage-daemon.c | 15 +++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index 878e6a5c5c..8b97592663 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -154,6 +154,13 @@ Standard options:
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
index b798954edb..dd18b2cde8 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -93,6 +93,9 @@ static void help(void)
 "  --chardev <options>    configure a character device backend\n"
 "                         (see the qemu(1) man page for possible options)\n"
 "\n"
+"  --daemonize            daemonize the process, and have the parent exit\n"
+"                         once startup is complete\n"
+"\n"
 "  --export [type=]nbd,id=<id>,node-name=<node-name>[,name=<export-name>]\n"
 "           [,writable=on|off][,bitmap=<name>]\n"
 "                         export the specified block node over NBD\n"
@@ -144,6 +147,7 @@ QEMU_HELP_BOTTOM "\n",
 enum {
     OPTION_BLOCKDEV = 256,
     OPTION_CHARDEV,
+    OPTION_DAEMONIZE,
     OPTION_EXPORT,
     OPTION_MONITOR,
     OPTION_NBD_SERVER,
@@ -200,6 +204,7 @@ static void process_options(int argc, char *argv[], bool pre_init_pass)
     static const struct option long_options[] = {
         {"blockdev", required_argument, NULL, OPTION_BLOCKDEV},
         {"chardev", required_argument, NULL, OPTION_CHARDEV},
+        {"daemonize", no_argument, NULL, OPTION_DAEMONIZE},
         {"export", required_argument, NULL, OPTION_EXPORT},
         {"help", no_argument, NULL, 'h'},
         {"monitor", required_argument, NULL, OPTION_MONITOR},
@@ -225,6 +230,7 @@ static void process_options(int argc, char *argv[], bool pre_init_pass)
             c == '?' ||
             c == 'h' ||
             c == 'V' ||
+            c == OPTION_DAEMONIZE ||
             c == OPTION_PIDFILE;
 
         /* Process every option only in its respective pass */
@@ -277,6 +283,12 @@ static void process_options(int argc, char *argv[], bool pre_init_pass)
                 qemu_opts_del(opts);
                 break;
             }
+        case OPTION_DAEMONIZE:
+            if (os_set_daemonize(true) < 0) {
+                error_report("--daemonize not supported in this build");
+                exit(EXIT_FAILURE);
+            }
+            break;
         case OPTION_EXPORT:
             {
                 Visitor *v;
@@ -367,6 +379,8 @@ int main(int argc, char *argv[])
 
     process_options(argc, argv, true);
 
+    os_daemonize();
+
     module_call_init(MODULE_INIT_QOM);
     module_call_init(MODULE_INIT_TRACE);
     qemu_add_opts(&qemu_trace_opts);
@@ -389,6 +403,7 @@ int main(int argc, char *argv[])
      * it.
      */
     pid_file_init();
+    os_setup_post();
 
     while (!exit_requested) {
         main_loop_wait(false);
-- 
2.35.1


