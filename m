Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F434CD992
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 17:57:26 +0100 (CET)
Received: from localhost ([::1]:47644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBF7-0003uC-AQ
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 11:57:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5c-0004xk-Mv
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5a-0007Lc-3T
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OCxJ1gMAdPRrOXsEvyMm2YmWrjnjfgVB1jsnjj7cTpM=;
 b=MbZgJN1c1hNFre+AKksanNztkrzWEv4VxHg1usLw++bN5WcwVg4PCwpFcr5vi5luul14Ao
 xXM4sJTzgZga6dz/0LtXHNhMjv3/VUFZ2XGjnSKVkE3u4w9WiGSMfnReyYokOlf/qjo+Vz
 L19D15Cl1ilK1FaX2gYhhQhJ+BxVysM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-zH1Wmcd5MYuWWaGmamacLA-1; Fri, 04 Mar 2022 11:47:32 -0500
X-MC-Unique: zH1Wmcd5MYuWWaGmamacLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C90A1006AB0;
 Fri,  4 Mar 2022 16:47:31 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3069F83BF9;
 Fri,  4 Mar 2022 16:47:30 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/50] qsd: Add pre-init argument parsing pass
Date: Fri,  4 Mar 2022 17:46:32 +0100
Message-Id: <20220304164711.474713-12-kwolf@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

In contrast to qemu-nbd (where it is called --fork) and the system
emulator, QSD does not have a --daemonize switch yet.  Just like them,
QSD allows setting up block devices and exports on the command line.
When doing so, it is often necessary for whoever invoked the QSD to wait
until these exports are fully set up.  A --daemonize switch allows
precisely this, by virtue of the parent process exiting once everything
is set up.

Note that there are alternative ways of waiting for all exports to be
set up, for example:
- Passing the --pidfile option and waiting until the respective file
  exists (but I do not know if there is a way of implementing this
  without a busy wait loop)
- Set up some network server (e.g. on a Unix socket) and have the QSD
  connect to it after all arguments have been processed by appending
  corresponding --chardev and --monitor options to the command line,
  and then wait until the QSD connects

Having a --daemonize option would make this simpler, though, without
having to rely on additional tools (to set up a network server) or busy
waiting.

Implementing a --daemonize switch means having to fork the QSD process.
Ideally, we should do this as early as possible: All the parent process
has to do is to wait for the child process to signal completion of its
set-up phase, and therefore there is basically no initialization that
needs to be done before the fork.  On the other hand, forking after
initialization steps means having to consider how those steps (like
setting up the block layer or QMP) interact with a later fork, which is
often not trivial.

In order to fork this early, we must scan the command line for
--daemonize long before our current process_options() call.  Instead of
adding custom new code to do so, just reuse process_options() and give
it a @pre_init_pass argument to distinguish the two passes.  I believe
there are some other switches but --daemonize that deserve parsing in
the first pass:

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

This patch does make some references to --daemonize without having
implemented it yet, but that will happen in the next patch.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20220303164814.284974-3-hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 43 ++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 504d33aa91..b798954edb 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -177,7 +177,23 @@ static int getopt_set_loc(int argc, char **argv, const char *optstring,
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
 
@@ -196,11 +212,26 @@ static void process_options(int argc, char *argv[])
     };
 
     /*
-     * In contrast to the system emulator, options are processed in the order
-     * they are given on the command lines. This means that things must be
-     * defined first before they can be referenced in another option.
+     * In contrast to the system emulator, QEMU-specific options are processed
+     * in the order they are given on the command lines. This means that things
+     * must be defined first before they can be referenced in another option.
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
@@ -334,6 +365,8 @@ int main(int argc, char *argv[])
     qemu_init_exec_dir(argv[0]);
     os_setup_signal_handling();
 
+    process_options(argc, argv, true);
+
     module_call_init(MODULE_INIT_QOM);
     module_call_init(MODULE_INIT_TRACE);
     qemu_add_opts(&qemu_trace_opts);
@@ -348,7 +381,7 @@ int main(int argc, char *argv[])
     qemu_set_log(LOG_TRACE);
 
     qemu_init_main_loop(&error_fatal);
-    process_options(argc, argv);
+    process_options(argc, argv, false);
 
     /*
      * Write the pid file after creating chardevs, exports, and NBD servers but
-- 
2.35.1


