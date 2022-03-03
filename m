Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD664CC347
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:53:02 +0100 (CET)
Received: from localhost ([::1]:44702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPohI-0000vq-DT
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:53:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPodD-0001ih-IO
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:48:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPodA-0000ln-U4
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:48:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646326124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tT8v2xkK8dE0AwH7hHwXA0EYqiVqL7bIVjBqluPDg4A=;
 b=FyL9019RfCnuZzzOjFBTe3RScHCc4YDHG9npAKns9UJ8VuGioXWZVid6Jwn69/diLRIZwu
 NMQ6bOT6mdfaEFvLQAu/nVTfsg9Lq0kJKqmeQ2fxDGIJAN+t6tuvUeN0EBpQKjVlrzBrh0
 4nDDlUwIhEbMRdJXW/Tl3rzeUr9diSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-1zffhKgvOZyJ3-61Zhc9lQ-1; Thu, 03 Mar 2022 11:48:42 -0500
X-MC-Unique: 1zffhKgvOZyJ3-61Zhc9lQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D5CC81CCF1;
 Thu,  3 Mar 2022 16:48:41 +0000 (UTC)
Received: from localhost (unknown [10.39.195.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C4457C04B;
 Thu,  3 Mar 2022 16:48:37 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 3/4] qsd: Add --daemonize
Date: Thu,  3 Mar 2022 17:48:13 +0100
Message-Id: <20220303164814.284974-4-hreitz@redhat.com>
In-Reply-To: <20220303164814.284974-1-hreitz@redhat.com>
References: <20220303164814.284974-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index b798954edb..9f2c3332bf 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -137,6 +137,9 @@ static void help(void)
 "\n"
 "  --pidfile <path>       write process ID to a file after startup\n"
 "\n"
+"  --daemonize            daemonize the process, and have the parent exit\n"
+"                         once startup is complete\n"
+"\n"
 QEMU_HELP_BOTTOM "\n",
     error_get_progname());
 }
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
2.34.1


