Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C6916A8AA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 15:43:04 +0100 (CET)
Received: from localhost ([::1]:37556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6Ewp-0007UZ-Pi
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 09:43:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50976)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j6ElT-0002Nc-Pe
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 09:31:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j6ElR-0002kr-OX
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 09:31:19 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59207
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j6ElP-0002es-T1
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 09:31:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582554675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RiMfids/sR91ZkiBpl2SU1m0+fSIaG59Kqm2zJ3hGLs=;
 b=JAQCce18vJzbBPj/K1ABgTV60SstESbEfBNmSsq6SJUXN2p75ZGLrmaEY0+lXyqHDEjmqd
 5xaR6up2zk1Hu/HWIRtocFKKYaBcSHy1YVD1LXX11EVcq13Jcd9renP4565Bg4pUNF8ea6
 OKUj9cH/yc99ki0mP1aPdkaM/gjO8Mk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-MBhRyV9kOXCk48Qq0IUcaQ-1; Mon, 24 Feb 2020 09:31:12 -0500
X-MC-Unique: MBhRyV9kOXCk48Qq0IUcaQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3668FDB60;
 Mon, 24 Feb 2020 14:31:11 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-134.ams2.redhat.com
 [10.36.117.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 874B95C114;
 Mon, 24 Feb 2020 14:31:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 17/20] qmp: Fail gracefully if chardev is already in use
Date: Mon, 24 Feb 2020 15:30:05 +0100
Message-Id: <20200224143008.13362-18-kwolf@redhat.com>
In-Reply-To: <20200224143008.13362-1-kwolf@redhat.com>
References: <20200224143008.13362-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 coiby.xu@gmail.com, mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trying to attach a QMP monitor to a chardev that is already in use
results in a crash because monitor_init_qmp() passes &error_abort to
qemu_chr_fe_init():

$ ./x86_64-softmmu/qemu-system-x86_64 --chardev stdio,id=3Dfoo --mon foo,mo=
de=3Dcontrol --mon foo,mode=3Dcontrol
Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:220:
qemu-system-x86_64: --mon foo,mode=3Dcontrol: Device 'foo' is in use
Abgebrochen (Speicherabzug geschrieben)

Fix this by allowing monitor_init_qmp() to return an error and passing
any error in qemu_chr_fe_init() to its caller instead of aborting.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/monitor/monitor.h |  2 +-
 monitor/monitor.c         |  7 ++++++-
 monitor/qmp.c             | 11 +++++++----
 stubs/monitor-core.c      |  2 +-
 tests/test-util-sockets.c |  2 +-
 5 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index db1112552c..e55a3b57e0 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -17,7 +17,7 @@ bool monitor_cur_is_qmp(void);
=20
 void monitor_init_globals(void);
 void monitor_init_globals_core(void);
-void monitor_init_qmp(Chardev *chr, bool pretty);
+void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp);
 void monitor_init_hmp(Chardev *chr, bool use_readline);
 int monitor_init(MonitorOptions *opts, Error **errp);
 int monitor_init_opts(QemuOpts *opts, Error **errp);
diff --git a/monitor/monitor.c b/monitor/monitor.c
index cc7ee812eb..af84f53dcd 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -614,6 +614,7 @@ void monitor_init_globals_core(void)
 int monitor_init(MonitorOptions *opts, Error **errp)
 {
     Chardev *chr;
+    Error *local_err =3D NULL;
=20
     chr =3D qemu_chr_find(opts->chardev);
     if (chr =3D=3D NULL) {
@@ -623,7 +624,7 @@ int monitor_init(MonitorOptions *opts, Error **errp)
=20
     switch(opts->mode) {
     case MONITOR_MODE_CONTROL:
-        monitor_init_qmp(chr, opts->pretty);
+        monitor_init_qmp(chr, opts->pretty, &local_err);
         break;
     case MONITOR_MODE_READLINE:
         if (opts->pretty) {
@@ -636,6 +637,10 @@ int monitor_init(MonitorOptions *opts, Error **errp)
         g_assert_not_reached();
     }
=20
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return -1;
+    }
     return 0;
 }
=20
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 8379c8f96e..f89e7daf27 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -395,10 +395,16 @@ static void monitor_qmp_setup_handlers_bh(void *opaqu=
e)
     monitor_list_append(&mon->common);
 }
=20
-void monitor_init_qmp(Chardev *chr, bool pretty)
+void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
 {
     MonitorQMP *mon =3D g_new0(MonitorQMP, 1);
=20
+    if (!qemu_chr_fe_init(&mon->common.chr, chr, errp)) {
+        g_free(mon);
+        return;
+    }
+    qemu_chr_fe_set_echo(&mon->common.chr, true);
+
     /* Note: we run QMP monitor in I/O thread when @chr supports that */
     monitor_data_init(&mon->common, true, false,
                       qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_GCONTEXT=
));
@@ -408,9 +414,6 @@ void monitor_init_qmp(Chardev *chr, bool pretty)
     qemu_mutex_init(&mon->qmp_queue_lock);
     mon->qmp_requests =3D g_queue_new();
=20
-    qemu_chr_fe_init(&mon->common.chr, chr, &error_abort);
-    qemu_chr_fe_set_echo(&mon->common.chr, true);
-
     json_message_parser_init(&mon->parser, handle_qmp_command, mon, NULL);
     if (mon->common.use_io_thread) {
         /*
diff --git a/stubs/monitor-core.c b/stubs/monitor-core.c
index 403c00a6d0..6cff1c4e1d 100644
--- a/stubs/monitor-core.c
+++ b/stubs/monitor-core.c
@@ -5,7 +5,7 @@
=20
 __thread Monitor *cur_mon;
=20
-void monitor_init_qmp(Chardev *chr, bool pretty)
+void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
 {
 }
=20
diff --git a/tests/test-util-sockets.c b/tests/test-util-sockets.c
index 8ce55efe70..2edb4c539d 100644
--- a/tests/test-util-sockets.c
+++ b/tests/test-util-sockets.c
@@ -71,7 +71,7 @@ int monitor_get_fd(Monitor *mon, const char *fdname, Erro=
r **errp)
  */
 __thread Monitor *cur_mon;
 int monitor_vprintf(Monitor *mon, const char *fmt, va_list ap) { abort(); =
}
-void monitor_init_qmp(Chardev *chr, bool pretty) {}
+void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp) {}
 void monitor_init_hmp(Chardev *chr, bool use_readline) {}
=20
=20
--=20
2.20.1


