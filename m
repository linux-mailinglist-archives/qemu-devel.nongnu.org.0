Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B2295974
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 10:28:56 +0200 (CEST)
Received: from localhost ([::1]:34666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzzVf-0003aU-5n
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 04:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54377)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1hzzSR-0000Xv-7i
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 04:25:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hzzSP-0004tQ-Sa
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 04:25:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54918)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>)
 id 1hzzSM-0004rb-Rf; Tue, 20 Aug 2019 04:25:31 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 20BF57BDAE;
 Tue, 20 Aug 2019 08:25:30 +0000 (UTC)
Received: from secure.mitica (unknown [10.36.118.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF1D09F7C;
 Tue, 20 Aug 2019 08:25:21 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 10:24:58 +0200
Message-Id: <20190820082459.2101-5-quintela@redhat.com>
In-Reply-To: <20190820082459.2101-1-quintela@redhat.com>
References: <20190820082459.2101-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 20 Aug 2019 08:25:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 4/5] socket: Add num connections to
 qio_net_listener_open_sync()
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 blockdev-nbd.c            | 2 +-
 chardev/char-socket.c     | 2 +-
 include/io/net-listener.h | 2 ++
 io/net-listener.c         | 3 ++-
 migration/socket.c        | 2 +-
 qemu-nbd.c                | 2 +-
 scsi/qemu-pr-helper.c     | 3 ++-
 ui/vnc.c                  | 4 ++--
 8 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 7a71da447f..c621686131 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -101,7 +101,7 @@ void nbd_server_start(SocketAddress *addr, const char=
 *tls_creds,
     qio_net_listener_set_name(nbd_server->listener,
                               "nbd-listener");
=20
-    if (qio_net_listener_open_sync(nbd_server->listener, addr, errp) < 0=
) {
+    if (qio_net_listener_open_sync(nbd_server->listener, addr, 1, errp) =
< 0) {
         goto error;
     }
=20
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 7ca5d97af3..8c7c9da567 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1160,7 +1160,7 @@ static int qmp_chardev_open_socket_server(Chardev *=
chr,
     qio_net_listener_set_name(s->listener, name);
     g_free(name);
=20
-    if (qio_net_listener_open_sync(s->listener, s->addr, errp) < 0) {
+    if (qio_net_listener_open_sync(s->listener, s->addr, 1, errp) < 0) {
         object_unref(OBJECT(s->listener));
         s->listener =3D NULL;
         return -1;
diff --git a/include/io/net-listener.h b/include/io/net-listener.h
index 8081ac58a2..fb101703e3 100644
--- a/include/io/net-listener.h
+++ b/include/io/net-listener.h
@@ -95,6 +95,7 @@ void qio_net_listener_set_name(QIONetListener *listener=
,
  * qio_net_listener_open_sync:
  * @listener: the network listener object
  * @addr: the address to listen on
+ * @num: the amount of expected connections
  * @errp: pointer to a NULL initialized error object
  *
  * Synchronously open a listening connection on all
@@ -104,6 +105,7 @@ void qio_net_listener_set_name(QIONetListener *listen=
er,
  */
 int qio_net_listener_open_sync(QIONetListener *listener,
                                SocketAddress *addr,
+                               int num,
                                Error **errp);
=20
 /**
diff --git a/io/net-listener.c b/io/net-listener.c
index dc81150318..5d8a226872 100644
--- a/io/net-listener.c
+++ b/io/net-listener.c
@@ -62,6 +62,7 @@ static gboolean qio_net_listener_channel_func(QIOChanne=
l *ioc,
=20
 int qio_net_listener_open_sync(QIONetListener *listener,
                                SocketAddress *addr,
+                               int num,
                                Error **errp)
 {
     QIODNSResolver *resolver =3D qio_dns_resolver_get_instance();
@@ -82,7 +83,7 @@ int qio_net_listener_open_sync(QIONetListener *listener=
,
     for (i =3D 0; i < nresaddrs; i++) {
         QIOChannelSocket *sioc =3D qio_channel_socket_new();
=20
-        if (qio_channel_socket_listen_sync(sioc, resaddrs[i], 1,
+        if (qio_channel_socket_listen_sync(sioc, resaddrs[i], num,
                                            err ? NULL : &err) =3D=3D 0) =
{
             success =3D true;
=20
diff --git a/migration/socket.c b/migration/socket.c
index 98efdc0286..e63f5e1612 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -181,7 +181,7 @@ static void socket_start_incoming_migration(SocketAdd=
ress *saddr,
=20
     qio_net_listener_set_name(listener, "migration-socket-listener");
=20
-    if (qio_net_listener_open_sync(listener, saddr, errp) < 0) {
+    if (qio_net_listener_open_sync(listener, saddr, 1, errp) < 0) {
         object_unref(OBJECT(listener));
         return;
     }
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 049645491d..83b6c32d73 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -1054,7 +1054,7 @@ int main(int argc, char **argv)
     server =3D qio_net_listener_new();
     if (socket_activation =3D=3D 0) {
         saddr =3D nbd_build_socket_address(sockpath, bindto, port);
-        if (qio_net_listener_open_sync(server, saddr, &local_err) < 0) {
+        if (qio_net_listener_open_sync(server, saddr, 1, &local_err) < 0=
) {
             object_unref(OBJECT(server));
             error_report_err(local_err);
             exit(EXIT_FAILURE);
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index f960d8303b..2d2edded69 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -1005,7 +1005,8 @@ int main(int argc, char **argv)
             .u.q_unix.path =3D socket_path,
         };
         server_ioc =3D qio_channel_socket_new();
-        if (qio_channel_socket_listen_sync(server_ioc, &saddr, 1, &local=
_err) < 0) {
+        if (qio_channel_socket_listen_sync(server_ioc, &saddr, 1,
+                                           &local_err) < 0) {
             object_unref(OBJECT(server_ioc));
             error_report_err(local_err);
             return 1;
diff --git a/ui/vnc.c b/ui/vnc.c
index 4812ed29d0..258461f814 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3762,7 +3762,7 @@ static int vnc_display_listen(VncDisplay *vd,
         qio_net_listener_set_name(vd->listener, "vnc-listen");
         for (i =3D 0; i < nsaddr; i++) {
             if (qio_net_listener_open_sync(vd->listener,
-                                           saddr[i],
+                                           saddr[i], 1,
                                            errp) < 0)  {
                 return -1;
             }
@@ -3777,7 +3777,7 @@ static int vnc_display_listen(VncDisplay *vd,
         qio_net_listener_set_name(vd->wslistener, "vnc-ws-listen");
         for (i =3D 0; i < nwsaddr; i++) {
             if (qio_net_listener_open_sync(vd->wslistener,
-                                           wsaddr[i],
+                                           wsaddr[i], 1,
                                            errp) < 0)  {
                 return -1;
             }
--=20
2.21.0


