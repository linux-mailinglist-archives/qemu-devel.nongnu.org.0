Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C122882CF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 08:40:42 +0200 (CEST)
Received: from localhost ([::1]:58468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQm53-0007Qk-KS
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 02:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQlzK-000246-NT
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 02:34:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQlzF-0008UI-8a
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 02:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602225280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pjxz44RxGj/Mj44Bi6b7vChuzYk9dhgB0xz2XcQ63gI=;
 b=PY9bFJWkBpXlPQ3lYSD0586vT/DdOneTTaE7stDkU5ILkNmInXl6Z2LBXmqJqVbLgZh3IG
 9ycaqtJaDDtI26z5dGUSf2U30mJRPv/NQqSBo1goLseHDWmKnD6JhGtr9ErEL+kenySAcv
 TY+2Jz0B96glLYu7R42pajALNwNg8EM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-f8haCST_POOo2Bz_nFkb0w-1; Fri, 09 Oct 2020 02:34:38 -0400
X-MC-Unique: f8haCST_POOo2Bz_nFkb0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF78380B70A
 for <qemu-devel@nongnu.org>; Fri,  9 Oct 2020 06:34:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BD1F10013C1;
 Fri,  9 Oct 2020 06:34:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0D4CB112CE16; Fri,  9 Oct 2020 08:34:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/14] monitor: Use getter/setter functions for cur_mon
Date: Fri,  9 Oct 2020 08:34:21 +0200
Message-Id: <20201009063432.303441-4-armbru@redhat.com>
In-Reply-To: <20201009063432.303441-1-armbru@redhat.com>
References: <20201009063432.303441-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kevin Wolf <kwolf@redhat.com>

cur_mon really needs to be coroutine-local as soon as we move monitor
command handlers to coroutines and let them yield. As a first step, just
remove all direct accesses to cur_mon so that we can implement this in
the getter function later.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20201005155855.256490-4-kwolf@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/monitor/monitor.h  |  3 ++-
 audio/wavcapture.c         |  8 ++++----
 dump/dump.c                |  2 +-
 hw/scsi/vhost-scsi.c       |  2 +-
 hw/virtio/vhost-vsock.c    |  2 +-
 migration/fd.c             |  4 ++--
 monitor/hmp.c              | 11 +++++------
 monitor/misc.c             | 13 +++++++------
 monitor/monitor.c          | 24 +++++++++++++++++++++++-
 monitor/qmp-cmds-control.c |  2 ++
 monitor/qmp-cmds.c         |  2 +-
 monitor/qmp.c              |  7 ++-----
 net/socket.c               |  2 +-
 net/tap.c                  |  6 +++---
 softmmu/cpus.c             |  2 +-
 stubs/monitor-core.c       |  5 ++++-
 tests/test-util-sockets.c  | 12 ++++++------
 trace/control.c            |  2 +-
 util/qemu-error.c          |  6 +++---
 util/qemu-print.c          |  3 ++-
 util/qemu-sockets.c        |  1 +
 21 files changed, 73 insertions(+), 46 deletions(-)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 93bedf0b75..543eafcb76 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -5,7 +5,6 @@
 #include "qapi/qapi-types-misc.h"
 #include "qemu/readline.h"
 
-extern __thread Monitor *cur_mon;
 typedef struct MonitorHMP MonitorHMP;
 typedef struct MonitorOptions MonitorOptions;
 
@@ -13,6 +12,8 @@ typedef struct MonitorOptions MonitorOptions;
 
 extern QemuOptsList qemu_mon_opts;
 
+Monitor *monitor_cur(void);
+Monitor *monitor_set_cur(Monitor *mon);
 bool monitor_cur_is_qmp(void);
 
 void monitor_init_globals(void);
diff --git a/audio/wavcapture.c b/audio/wavcapture.c
index 17e87ed6f4..c60286e162 100644
--- a/audio/wavcapture.c
+++ b/audio/wavcapture.c
@@ -1,5 +1,5 @@
 #include "qemu/osdep.h"
-#include "monitor/monitor.h"
+#include "qemu/qemu-print.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "audio.h"
@@ -94,9 +94,9 @@ static void wav_capture_info (void *opaque)
     WAVState *wav = opaque;
     char *path = wav->path;
 
-    monitor_printf (cur_mon, "Capturing audio(%d,%d,%d) to %s: %d bytes\n",
-                    wav->freq, wav->bits, wav->nchannels,
-                    path ? path : "<not available>", wav->bytes);
+    qemu_printf("Capturing audio(%d,%d,%d) to %s: %d bytes\n",
+                wav->freq, wav->bits, wav->nchannels,
+                path ? path : "<not available>", wav->bytes);
 }
 
 static struct capture_ops wav_capture_ops = {
diff --git a/dump/dump.c b/dump/dump.c
index 45da46a952..dec32468d9 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1986,7 +1986,7 @@ void qmp_dump_guest_memory(bool paging, const char *file,
 
 #if !defined(WIN32)
     if (strstart(file, "fd:", &p)) {
-        fd = monitor_get_fd(cur_mon, p, errp);
+        fd = monitor_get_fd(monitor_cur(), p, errp);
         if (fd == -1) {
             return;
         }
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index a83ffeefc8..4d70fa036b 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -177,7 +177,7 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     }
 
     if (vs->conf.vhostfd) {
-        vhostfd = monitor_fd_param(cur_mon, vs->conf.vhostfd, errp);
+        vhostfd = monitor_fd_param(monitor_cur(), vs->conf.vhostfd, errp);
         if (vhostfd == -1) {
             error_prepend(errp, "vhost-scsi: unable to parse vhostfd: ");
             return;
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index c8f0699b4f..f9db4beb47 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -143,7 +143,7 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
     }
 
     if (vsock->conf.vhostfd) {
-        vhostfd = monitor_fd_param(cur_mon, vsock->conf.vhostfd, errp);
+        vhostfd = monitor_fd_param(monitor_cur(), vsock->conf.vhostfd, errp);
         if (vhostfd == -1) {
             error_prepend(errp, "vhost-vsock: unable to parse vhostfd: ");
             return;
diff --git a/migration/fd.c b/migration/fd.c
index 0a29ecdebf..6f2f50475f 100644
--- a/migration/fd.c
+++ b/migration/fd.c
@@ -26,7 +26,7 @@
 void fd_start_outgoing_migration(MigrationState *s, const char *fdname, Error **errp)
 {
     QIOChannel *ioc;
-    int fd = monitor_get_fd(cur_mon, fdname, errp);
+    int fd = monitor_get_fd(monitor_cur(), fdname, errp);
     if (fd == -1) {
         return;
     }
@@ -55,7 +55,7 @@ static gboolean fd_accept_incoming_migration(QIOChannel *ioc,
 void fd_start_incoming_migration(const char *fdname, Error **errp)
 {
     QIOChannel *ioc;
-    int fd = monitor_fd_param(cur_mon, fdname, errp);
+    int fd = monitor_fd_param(monitor_cur(), fdname, errp);
     if (fd == -1) {
         return;
     }
diff --git a/monitor/hmp.c b/monitor/hmp.c
index 4ecdefd705..e0cc9e65dd 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1300,12 +1300,11 @@ cleanup:
 
 static void monitor_read(void *opaque, const uint8_t *buf, int size)
 {
-    MonitorHMP *mon;
-    Monitor *old_mon = cur_mon;
+    MonitorHMP *mon = container_of(opaque, MonitorHMP, common);
+    Monitor *old_mon;
     int i;
 
-    cur_mon = opaque;
-    mon = container_of(cur_mon, MonitorHMP, common);
+    old_mon = monitor_set_cur(&mon->common);
 
     if (mon->rs) {
         for (i = 0; i < size; i++) {
@@ -1313,13 +1312,13 @@ static void monitor_read(void *opaque, const uint8_t *buf, int size)
         }
     } else {
         if (size == 0 || buf[size - 1] != 0) {
-            monitor_printf(cur_mon, "corrupted command\n");
+            monitor_printf(&mon->common, "corrupted command\n");
         } else {
             handle_hmp_command(mon, (char *)buf);
         }
     }
 
-    cur_mon = old_mon;
+    monitor_set_cur(old_mon);
 }
 
 static void monitor_event(void *opaque, QEMUChrEvent event)
diff --git a/monitor/misc.c b/monitor/misc.c
index 4ea575eea8..ee8db45094 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -125,13 +125,12 @@ char *qmp_human_monitor_command(const char *command_line, bool has_cpu_index,
 
     monitor_data_init(&hmp.common, false, true, false);
 
-    old_mon = cur_mon;
-    cur_mon = &hmp.common;
+    old_mon = monitor_set_cur(&hmp.common);
 
     if (has_cpu_index) {
         int ret = monitor_set_cpu(&hmp.common, cpu_index);
         if (ret < 0) {
-            cur_mon = old_mon;
+            monitor_set_cur(old_mon);
             error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cpu-index",
                        "a CPU number");
             goto out;
@@ -139,7 +138,7 @@ char *qmp_human_monitor_command(const char *command_line, bool has_cpu_index,
     }
 
     handle_hmp_command(&hmp, command_line);
-    cur_mon = old_mon;
+    monitor_set_cur(old_mon);
 
     WITH_QEMU_LOCK_GUARD(&hmp.common.mon_lock) {
         if (qstring_get_length(hmp.common.outbuf) > 0) {
@@ -297,7 +296,7 @@ static CPUState *mon_get_cpu_sync(Monitor *mon, bool synchronize)
 
 CPUState *mon_get_cpu(void)
 {
-    return mon_get_cpu_sync(cur_mon, true);
+    return mon_get_cpu_sync(monitor_cur(), true);
 }
 
 CPUArchState *mon_get_cpu_env(void)
@@ -1232,6 +1231,7 @@ static void hmp_acl_remove(Monitor *mon, const QDict *qdict)
 
 void qmp_getfd(const char *fdname, Error **errp)
 {
+    Monitor *cur_mon = monitor_cur();
     mon_fd_t *monfd;
     int fd, tmp_fd;
 
@@ -1270,6 +1270,7 @@ void qmp_getfd(const char *fdname, Error **errp)
 
 void qmp_closefd(const char *fdname, Error **errp)
 {
+    Monitor *cur_mon = monitor_cur();
     mon_fd_t *monfd;
     int tmp_fd;
 
@@ -1356,7 +1357,7 @@ AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id, bool has_opaque,
                       const char *opaque, Error **errp)
 {
     int fd;
-    Monitor *mon = cur_mon;
+    Monitor *mon = monitor_cur();
     AddfdInfo *fdinfo;
 
     fd = qemu_chr_fe_get_msgfd(&mon->chr);
diff --git a/monitor/monitor.c b/monitor/monitor.c
index 0f32892ad4..099c164c6d 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -66,13 +66,31 @@ MonitorList mon_list;
 int mon_refcount;
 static bool monitor_destroyed;
 
-__thread Monitor *cur_mon;
+static __thread Monitor *cur_monitor;
+
+Monitor *monitor_cur(void)
+{
+    return cur_monitor;
+}
+
+/**
+ * Sets a new current monitor and returns the old one.
+ */
+Monitor *monitor_set_cur(Monitor *mon)
+{
+    Monitor *old_monitor = cur_monitor;
+
+    cur_monitor = mon;
+    return old_monitor;
+}
 
 /**
  * Is the current monitor, if any, a QMP monitor?
  */
 bool monitor_cur_is_qmp(void)
 {
+    Monitor *cur_mon = monitor_cur();
+
     return cur_mon && monitor_is_qmp(cur_mon);
 }
 
@@ -209,6 +227,8 @@ int monitor_printf(Monitor *mon, const char *fmt, ...)
  */
 int error_vprintf(const char *fmt, va_list ap)
 {
+    Monitor *cur_mon = monitor_cur();
+
     if (cur_mon && !monitor_cur_is_qmp()) {
         return monitor_vprintf(cur_mon, fmt, ap);
     }
@@ -217,6 +237,8 @@ int error_vprintf(const char *fmt, va_list ap)
 
 int error_vprintf_unless_qmp(const char *fmt, va_list ap)
 {
+    Monitor *cur_mon = monitor_cur();
+
     if (!cur_mon) {
         return vfprintf(stderr, fmt, ap);
     }
diff --git a/monitor/qmp-cmds-control.c b/monitor/qmp-cmds-control.c
index 8f04cfa6e6..a456762f6a 100644
--- a/monitor/qmp-cmds-control.c
+++ b/monitor/qmp-cmds-control.c
@@ -69,6 +69,7 @@ static bool qmp_caps_accept(MonitorQMP *mon, QMPCapabilityList *list,
 void qmp_qmp_capabilities(bool has_enable, QMPCapabilityList *enable,
                           Error **errp)
 {
+    Monitor *cur_mon = monitor_cur();
     MonitorQMP *mon;
 
     assert(monitor_is_qmp(cur_mon));
@@ -119,6 +120,7 @@ static void query_commands_cb(const QmpCommand *cmd, void *opaque)
 CommandInfoList *qmp_query_commands(Error **errp)
 {
     CommandInfoList *list = NULL;
+    Monitor *cur_mon = monitor_cur();
     MonitorQMP *mon;
 
     assert(monitor_is_qmp(cur_mon));
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 0ab5b78580..1abef70a89 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -328,7 +328,7 @@ void qmp_add_client(const char *protocol, const char *fdname,
     Chardev *s;
     int fd;
 
-    fd = monitor_get_fd(cur_mon, fdname, errp);
+    fd = monitor_get_fd(monitor_cur(), fdname, errp);
     if (fd < 0) {
         return;
     }
diff --git a/monitor/qmp.c b/monitor/qmp.c
index d433ceae5b..bb2d9d0cc7 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -139,12 +139,9 @@ static void monitor_qmp_dispatch(MonitorQMP *mon, QObject *req)
     QDict *rsp;
     QDict *error;
 
-    old_mon = cur_mon;
-    cur_mon = &mon->common;
-
+    old_mon = monitor_set_cur(&mon->common);
     rsp = qmp_dispatch(mon->commands, req, qmp_oob_enabled(mon));
-
-    cur_mon = old_mon;
+    monitor_set_cur(old_mon);
 
     if (mon->commands == &qmp_cap_negotiation_commands) {
         error = qdict_get_qdict(rsp, "error");
diff --git a/net/socket.c b/net/socket.c
index 2d21fddd9c..15b410e8d8 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -727,7 +727,7 @@ int net_init_socket(const Netdev *netdev, const char *name,
     if (sock->has_fd) {
         int fd, ret;
 
-        fd = monitor_fd_param(cur_mon, sock->fd, errp);
+        fd = monitor_fd_param(monitor_cur(), sock->fd, errp);
         if (fd == -1) {
             return -1;
         }
diff --git a/net/tap.c b/net/tap.c
index 04ce72dd2f..c46ff66184 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -700,7 +700,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
         if (vhostfdname) {
             int ret;
 
-            vhostfd = monitor_fd_param(cur_mon, vhostfdname, &err);
+            vhostfd = monitor_fd_param(monitor_cur(), vhostfdname, &err);
             if (vhostfd == -1) {
                 if (tap->has_vhostforce && tap->vhostforce) {
                     error_propagate(errp, err);
@@ -808,7 +808,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
             return -1;
         }
 
-        fd = monitor_fd_param(cur_mon, tap->fd, errp);
+        fd = monitor_fd_param(monitor_cur(), tap->fd, errp);
         if (fd == -1) {
             return -1;
         }
@@ -862,7 +862,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
         }
 
         for (i = 0; i < nfds; i++) {
-            fd = monitor_fd_param(cur_mon, fds[i], errp);
+            fd = monitor_fd_param(monitor_cur(), fds[i], errp);
             if (fd == -1) {
                 ret = -1;
                 goto free_fail;
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index e9d4a44fcc..47cceddd80 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -793,6 +793,6 @@ exit:
 
 void qmp_inject_nmi(Error **errp)
 {
-    nmi_monitor_handle(monitor_get_cpu_index(cur_mon), errp);
+    nmi_monitor_handle(monitor_get_cpu_index(monitor_cur()), errp);
 }
 
diff --git a/stubs/monitor-core.c b/stubs/monitor-core.c
index 6cff1c4e1d..0cd2d864b2 100644
--- a/stubs/monitor-core.c
+++ b/stubs/monitor-core.c
@@ -3,7 +3,10 @@
 #include "qemu-common.h"
 #include "qapi/qapi-emit-events.h"
 
-__thread Monitor *cur_mon;
+Monitor *monitor_cur(void)
+{
+    return NULL;
+}
 
 void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
 {
diff --git a/tests/test-util-sockets.c b/tests/test-util-sockets.c
index 1bbb16d9b1..f6336e0f91 100644
--- a/tests/test-util-sockets.c
+++ b/tests/test-util-sockets.c
@@ -52,6 +52,7 @@ static void test_fd_is_socket_good(void)
 
 static int mon_fd = -1;
 static const char *mon_fdname;
+__thread Monitor *cur_mon;
 
 int monitor_get_fd(Monitor *mon, const char *fdname, Error **errp)
 {
@@ -65,15 +66,14 @@ int monitor_get_fd(Monitor *mon, const char *fdname, Error **errp)
 }
 
 /*
- * Syms of stubs in libqemuutil.a are discarded at .o file granularity.
- * To replace monitor_get_fd() we must ensure everything in
- * stubs/monitor.c is defined, to make sure monitor.o is discarded
+ * Syms of stubs in libqemuutil.a are discarded at .o file
+ * granularity.  To replace monitor_get_fd() and monitor_cur(), we
+ * must ensure that we also replace any other symbol that is used in
+ * the binary and would be taken from the same stub object file,
  * otherwise we get duplicate syms at link time.
  */
-__thread Monitor *cur_mon;
+Monitor *monitor_cur(void) { return cur_mon; }
 int monitor_vprintf(Monitor *mon, const char *fmt, va_list ap) { abort(); }
-void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp) {}
-void monitor_init_hmp(Chardev *chr, bool use_readline, Error **errp) {}
 
 #ifndef _WIN32
 static void test_socket_fd_pass_name_good(void)
diff --git a/trace/control.c b/trace/control.c
index c63a4de732..b35e512dce 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -176,7 +176,7 @@ void trace_enable_events(const char *line_buf)
 {
     if (is_help_option(line_buf)) {
         trace_list_events();
-        if (cur_mon == NULL) {
+        if (monitor_cur() == NULL) {
             exit(0);
         }
     } else {
diff --git a/util/qemu-error.c b/util/qemu-error.c
index 3ee41438e9..aa30f03564 100644
--- a/util/qemu-error.c
+++ b/util/qemu-error.c
@@ -171,7 +171,7 @@ static void print_loc(void)
     int i;
     const char *const *argp;
 
-    if (!cur_mon && progname) {
+    if (!monitor_cur() && progname) {
         fprintf(stderr, "%s:", progname);
         sep = " ";
     }
@@ -208,7 +208,7 @@ static void vreport(report_type type, const char *fmt, va_list ap)
     GTimeVal tv;
     gchar *timestr;
 
-    if (error_with_timestamp && !cur_mon) {
+    if (error_with_timestamp && !monitor_cur()) {
         g_get_current_time(&tv);
         timestr = g_time_val_to_iso8601(&tv);
         error_printf("%s ", timestr);
@@ -216,7 +216,7 @@ static void vreport(report_type type, const char *fmt, va_list ap)
     }
 
     /* Only prepend guest name if -msg guest-name and -name guest=... are set */
-    if (error_with_guestname && error_guest_name && !cur_mon) {
+    if (error_with_guestname && error_guest_name && !monitor_cur()) {
         error_printf("%s ", error_guest_name);
     }
 
diff --git a/util/qemu-print.c b/util/qemu-print.c
index e79d6b8396..69ba612f56 100644
--- a/util/qemu-print.c
+++ b/util/qemu-print.c
@@ -20,6 +20,7 @@
  */
 int qemu_vprintf(const char *fmt, va_list ap)
 {
+    Monitor *cur_mon = monitor_cur();
     if (cur_mon) {
         return monitor_vprintf(cur_mon, fmt, ap);
     }
@@ -48,7 +49,7 @@ int qemu_printf(const char *fmt, ...)
 int qemu_vfprintf(FILE *stream, const char *fmt, va_list ap)
 {
     if (!stream) {
-        return monitor_vprintf(cur_mon, fmt, ap);
+        return monitor_vprintf(monitor_cur(), fmt, ap);
     }
     return vfprintf(stream, fmt, ap);
 }
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index de4bf7616e..05e5c73f9d 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1092,6 +1092,7 @@ fail:
 
 static int socket_get_fd(const char *fdstr, int num, Error **errp)
 {
+    Monitor *cur_mon = monitor_cur();
     int fd;
     if (num != 1) {
         error_setg_errno(errp, EINVAL, "socket_get_fd: too many connections");
-- 
2.26.2


