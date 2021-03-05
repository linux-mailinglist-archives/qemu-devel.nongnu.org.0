Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11C932F0E3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:12:35 +0100 (CET)
Received: from localhost ([::1]:59750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIE0A-0002F3-UM
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkI-0006vY-Ns
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDk5-0007Cr-BL
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iKcXNqoKQ9PlHlaamZu7e42WXZCYcY/ba4R23Tc+J70=;
 b=MmU7ZnyoIQMUDdWlgqh8fNe62kulVDbO9J1ZLfBs/83p+xFgSgqMaNotgCqiS8ufp6SAek
 /kKHV8Ej3wU0MohKXDtcOoTgR4SHwLtqCQakUZg77H7jEDyTnG6bmAFO0DD0Hs8wBd5HH0
 toDZgbLv0RIkmI8n0rXXxNf1BD1wAb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-2hsxdQ4uPEWemRyYOyPVRw-1; Fri, 05 Mar 2021 11:55:54 -0500
X-MC-Unique: 2hsxdQ4uPEWemRyYOyPVRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0DFCDF8C4;
 Fri,  5 Mar 2021 16:55:19 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A447460BF3;
 Fri,  5 Mar 2021 16:55:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/31] qemu-storage-daemon: add --pidfile option
Date: Fri,  5 Mar 2021 17:54:32 +0100
Message-Id: <20210305165454.356840-10-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Stefan Hajnoczi <stefanha@redhat.com>

Daemons often have a --pidfile option where the pid is written to a file
so that scripts can stop the daemon by sending a signal.

The pid file also acts as a lock to prevent multiple instances of the
daemon from launching for a given pid file.

QEMU, qemu-nbd, qemu-ga, virtiofsd, and qemu-pr-helper all support the
--pidfile option. Add it to qemu-storage-daemon too.

Reported-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210302142746.170535-1-stefanha@redhat.com>
Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/tools/qemu-storage-daemon.rst   | 14 +++++++++++
 storage-daemon/qemu-storage-daemon.c | 36 ++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index c05b3d3811..6ce85f2f7d 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -118,6 +118,20 @@ Standard options:
   List object properties with ``<type>,help``. See the :manpage:`qemu(1)`
   manual page for a description of the object properties.
 
+.. option:: --pidfile PATH
+
+  is the path to a file where the daemon writes its pid. This allows scripts to
+  stop the daemon by sending a signal::
+
+    $ kill -SIGTERM $(<path/to/qsd.pid)
+
+  A file lock is applied to the file so only one instance of the daemon can run
+  with a given pid file path. The daemon unlinks its pid file when terminating.
+
+  The pid file is written after chardevs, exports, and NBD servers have been
+  created but before accepting connections. The daemon has started successfully
+  when the pid file is written and clients may begin connecting.
+
 Examples
 --------
 Launch the daemon with QMP monitor socket ``qmp.sock`` so clients can execute
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 78ddf619d4..23756fc8e5 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -59,6 +59,7 @@
 #include "sysemu/runstate.h"
 #include "trace/control.h"
 
+static const char *pid_file;
 static volatile bool exit_requested = false;
 
 void qemu_system_killed(int signal, pid_t pid)
@@ -115,6 +116,8 @@ static void help(void)
 "                         See the qemu(1) man page for documentation of the\n"
 "                         objects that can be added.\n"
 "\n"
+"  --pidfile <path>       write process ID to a file after startup\n"
+"\n"
 QEMU_HELP_BOTTOM "\n",
     error_get_progname());
 }
@@ -126,6 +129,7 @@ enum {
     OPTION_MONITOR,
     OPTION_NBD_SERVER,
     OPTION_OBJECT,
+    OPTION_PIDFILE,
 };
 
 extern QemuOptsList qemu_chardev_opts;
@@ -178,6 +182,7 @@ static void process_options(int argc, char *argv[])
         {"monitor", required_argument, NULL, OPTION_MONITOR},
         {"nbd-server", required_argument, NULL, OPTION_NBD_SERVER},
         {"object", required_argument, NULL, OPTION_OBJECT},
+        {"pidfile", required_argument, NULL, OPTION_PIDFILE},
         {"trace", required_argument, NULL, 'T'},
         {"version", no_argument, NULL, 'V'},
         {0, 0, 0, 0}
@@ -289,6 +294,9 @@ static void process_options(int argc, char *argv[])
                 qobject_unref(args);
                 break;
             }
+        case OPTION_PIDFILE:
+            pid_file = optarg;
+            break;
         case 1:
             error_report("Unexpected argument");
             exit(EXIT_FAILURE);
@@ -299,6 +307,27 @@ static void process_options(int argc, char *argv[])
     loc_set_none();
 }
 
+static void pid_file_cleanup(void)
+{
+    unlink(pid_file);
+}
+
+static void pid_file_init(void)
+{
+    Error *err = NULL;
+
+    if (!pid_file) {
+        return;
+    }
+
+    if (!qemu_write_pidfile(pid_file, &err)) {
+        error_reportf_err(err, "cannot create PID file: ");
+        exit(EXIT_FAILURE);
+    }
+
+    atexit(pid_file_cleanup);
+}
+
 int main(int argc, char *argv[])
 {
 #ifdef CONFIG_POSIX
@@ -326,6 +355,13 @@ int main(int argc, char *argv[])
     qemu_init_main_loop(&error_fatal);
     process_options(argc, argv);
 
+    /*
+     * Write the pid file after creating chardevs, exports, and NBD servers but
+     * before accepting connections. This ordering is documented. Do not change
+     * it.
+     */
+    pid_file_init();
+
     while (!exit_requested) {
         main_loop_wait(false);
     }
-- 
2.29.2


