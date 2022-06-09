Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02238544EE0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:24:37 +0200 (CEST)
Received: from localhost ([::1]:40402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJ5P-0004p6-R4
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nzHFq-0003vc-3S
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:27:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nzHFo-0007mE-FH
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:27:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654777631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iAWVzsa0z1Sj3mziMZiAUPBnAdjatXfpmaGaZ2ZUy5U=;
 b=QqYL4hfd1s+7kyd3xABSatOuiTvA1VV8rV+Pu4wiRIB3xIk9DtdNbhpICdq/Mp+4Y4Eu+e
 hsj75UhBTWMSOZlxiwmuiWwpM7Ltwmgj5aDUj6qzFgbDQ8I0HXkkIU60pgbrUJ68BBT4Xo
 6tAct0f4hVF/VP3b5/pKuVcUJydxliY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-E-21kFDONRmcjUQXdoZpGw-1; Thu, 09 Jun 2022 08:27:08 -0400
X-MC-Unique: E-21kFDONRmcjUQXdoZpGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A1A9803B22;
 Thu,  9 Jun 2022 12:27:08 +0000 (UTC)
Received: from localhost (unknown [10.39.193.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1616B2166B26;
 Thu,  9 Jun 2022 12:27:07 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 3/3] vl: Unlink absolute PID file path
Date: Thu,  9 Jun 2022 14:27:01 +0200
Message-Id: <20220609122701.17172-4-hreitz@redhat.com>
In-Reply-To: <20220609122701.17172-1-hreitz@redhat.com>
References: <20220609122701.17172-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After writing the PID file, we register an exit notifier to unlink it
when the process terminates.  However, if the process has changed its
working directory in the meantime (e.g. in os_setup_post() when
daemonizing), this will not work when the PID file path was relative.
Therefore, pass the absolute path (created with realpath()) to the
unlink() call in the exit notifier.

(realpath() needs a path pointing to an existing file, so we cannot use
it before qemu_write_pidfile().)

Reproducer:
$ cd /tmp
$ qemu-system-x86_64 --daemonize --pidfile qemu.pid
$ file qemu.pid
qemu.pid: ASCII text
$ kill $(cat qemu.pid)
$ file qemu.pid
qemu.pid: ASCII text

(qemu.pid should be gone after the process has terminated.)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 softmmu/vl.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index f0074845b7..a97af525d1 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1548,11 +1548,18 @@ machine_parse_property_opt(QemuOptsList *opts_list, const char *propname,
 }
 
 static const char *pid_file;
-static Notifier qemu_unlink_pidfile_notifier;
+struct UnlinkPidfileNotifier {
+    Notifier notifier;
+    char *pid_file_realpath;
+};
+static struct UnlinkPidfileNotifier qemu_unlink_pidfile_notifier;
 
 static void qemu_unlink_pidfile(Notifier *n, void *data)
 {
-    unlink(pid_file);
+    struct UnlinkPidfileNotifier *upn;
+
+    upn = DO_UPCAST(struct UnlinkPidfileNotifier, notifier, n);
+    unlink(upn->pid_file_realpath);
 }
 
 static const QEMUOption *lookup_opt(int argc, char **argv,
@@ -2472,13 +2479,28 @@ static void qemu_maybe_daemonize(const char *pid_file)
     rcu_disable_atfork();
 
     if (pid_file) {
+        char *pid_file_realpath = NULL;
+
         if (!qemu_write_pidfile(pid_file, &err)) {
             error_reportf_err(err, "cannot create PID file: ");
             exit(1);
         }
 
-        qemu_unlink_pidfile_notifier.notify = qemu_unlink_pidfile;
-        qemu_add_exit_notifier(&qemu_unlink_pidfile_notifier);
+        pid_file_realpath = g_malloc0(PATH_MAX);
+        if (!realpath(pid_file, pid_file_realpath)) {
+            error_report("cannot resolve PID file path: %s: %s",
+                         pid_file, strerror(errno));
+            unlink(pid_file);
+            exit(1);
+        }
+
+        qemu_unlink_pidfile_notifier = (struct UnlinkPidfileNotifier) {
+            .notifier = {
+                .notify = qemu_unlink_pidfile,
+            },
+            .pid_file_realpath = pid_file_realpath,
+        };
+        qemu_add_exit_notifier(&qemu_unlink_pidfile_notifier.notifier);
     }
 }
 
-- 
2.35.3


