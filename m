Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0566C47D145
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 12:50:01 +0100 (CET)
Received: from localhost ([::1]:59148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0088-00063Q-49
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 06:50:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n000R-0003zX-TC
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:42:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n000P-00084V-MH
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:42:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640173320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tSJ9vSO0gIHiab6OAzS366kG+J4yuioaCZuj71rBH28=;
 b=c4TkyLnwpBC2xJ5b0OvObw3ihSGPLM/YqncqiOTV1p2neTDoLb+I9Pajq4CeBF5TRU6XeO
 IQ7qawc1bD/vgwg0ud0JDsUVE+GvvgJ1yuf5447IBePJlk08Q4Fw2Z0GdbUbdQLtckGkX7
 C2S8vQCBMGfzHyUf3A5jYd0aIYTVvrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-dWVc8K8bMzizLG8PLN9-Zg-1; Wed, 22 Dec 2021 06:41:58 -0500
X-MC-Unique: dWVc8K8bMzizLG8PLN9-Zg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE5691006AA6;
 Wed, 22 Dec 2021 11:41:57 +0000 (UTC)
Received: from localhost (unknown [10.39.194.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82318E2F4;
 Wed, 22 Dec 2021 11:41:57 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/3] qsd: Add pre-init argument parsing pass
Date: Wed, 22 Dec 2021 12:41:51 +0100
Message-Id: <20211222114153.67721-2-hreitz@redhat.com>
In-Reply-To: <20211222114153.67721-1-hreitz@redhat.com>
References: <20211222114153.67721-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We want to add a --daemonize argument to QSD's command line.  This will
require forking the process before we do any complex initialization
steps, like setting up the block layer or QMP.  Therefore, we must scan
the command line for it long before our current process_options() call.

Instead of adding custom new code to do so, just reuse process_options()
and give it a @pre_init_pass argument to distinguish the two passes.  I
believe there are some other switches but --daemonize that deserve
parsing in the first pass:

- --help and --version are supposed to only print some text and then
  immediately exit (so any initialization we do would be for naught).
  This changes behavior, because now "--blockdev inv-drv --help" will
  print a help text instead of complaining about the --blockdev
  argument.
  Note that this is similar in behavior to other tools, though: "--help"
  is generally immediately acted upon when finding it in the argument
  list, potentially before other arguments (even ones before it) are
  acted on.  For example, "ls /does-not-exist --help" prints a help text
  and does not complain about ENOENT.

- --pidfile does not need initialization, and is already exempted from
  the sequential order that process_options() claims to strictly follow
  (the PID file is only created after all arguments are processed, not
  at the time the --pidfile argument appears), so it makes sense to
  include it in the same category as --daemonize.

- Invalid arguments should always be reported as soon as possible.  (The
  same caveat with --help applies: That means that "--blockdev inv-drv
  --inv-arg" will now complain about --inv-arg, not inv-drv.)

Note that we could decide to check only for --daemonize in the first
pass, and defer --help, --version, and checking for invalid arguments to
the second one, thus largely keeping our current behavior.  However,
this would break "--help --daemonize": The child would print the help
text to stdout, which is redirected to /dev/null, and so the text would
disappear.  We would need to have the text be printed to stderr instead,
and this would then make the parent process exit with EXIT_FAILURE,
which is probably not what we want for --help.

This patch does make some references to --daemonize without having
implemented it yet, but that will happen in the next patch.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 37 ++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 52cf17e8ac..42a52d3b1c 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -164,7 +164,23 @@ static int getopt_set_loc(int argc, char **argv, const char *optstring,
     return c;
 }
 
-static void process_options(int argc, char *argv[])
+/**
+ * Process QSD command-line arguments.
+ *
+ * This is done in two passes:
+ *
+ * First (@pre_init_pass is true), we do a pass where all global
+ * arguments pertaining to the QSD process (like --help or --daemonize)
+ * are processed.  This pass is done before most of the QEMU-specific
+ * initialization steps (e.g. initializing the block layer or QMP), and
+ * so must only process arguments that are not really QEMU-specific.
+ *
+ * Second (@pre_init_pass is false), we (sequentially) process all
+ * QEMU/QSD-specific arguments.  Many of these arguments are effectively
+ * translated to QMP commands (like --blockdev for blockdev-add, or
+ * --export for block-export-add).
+ */
+static void process_options(int argc, char *argv[], bool pre_init_pass)
 {
     int c;
 
@@ -187,7 +203,22 @@ static void process_options(int argc, char *argv[])
      * they are given on the command lines. This means that things must be
      * defined first before they can be referenced in another option.
      */
+    optind = 1;
     while ((c = getopt_set_loc(argc, argv, "-hT:V", long_options)) != -1) {
+        bool handle_option_pre_init;
+
+        /* Should this argument be processed in the pre-init pass? */
+        handle_option_pre_init =
+            c == '?' ||
+            c == 'h' ||
+            c == 'V' ||
+            c == OPTION_PIDFILE;
+
+        /* Process every option only in its respective pass */
+        if (pre_init_pass != handle_option_pre_init) {
+            continue;
+        }
+
         switch (c) {
         case '?':
             exit(EXIT_FAILURE);
@@ -321,6 +352,8 @@ int main(int argc, char *argv[])
     qemu_init_exec_dir(argv[0]);
     os_setup_signal_handling();
 
+    process_options(argc, argv, true);
+
     module_call_init(MODULE_INIT_QOM);
     module_call_init(MODULE_INIT_TRACE);
     qemu_add_opts(&qemu_trace_opts);
@@ -335,7 +368,7 @@ int main(int argc, char *argv[])
     qemu_set_log(LOG_TRACE);
 
     qemu_init_main_loop(&error_fatal);
-    process_options(argc, argv);
+    process_options(argc, argv, false);
 
     /*
      * Write the pid file after creating chardevs, exports, and NBD servers but
-- 
2.33.1


