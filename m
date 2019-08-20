Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF21B95969
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 10:27:19 +0200 (CEST)
Received: from localhost ([::1]:34644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzzU5-0001ci-52
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 04:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54312)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1hzzSF-0000Dy-Eb
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 04:25:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hzzSE-0004kq-0y
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 04:25:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54878)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>)
 id 1hzzSA-0004jR-Oq; Tue, 20 Aug 2019 04:25:18 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0B3DA7BDB0;
 Tue, 20 Aug 2019 08:25:18 +0000 (UTC)
Received: from secure.mitica (unknown [10.36.118.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CCAA9F7C;
 Tue, 20 Aug 2019 08:25:14 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 10:24:56 +0200
Message-Id: <20190820082459.2101-3-quintela@redhat.com>
In-Reply-To: <20190820082459.2101-1-quintela@redhat.com>
References: <20190820082459.2101-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 20 Aug 2019 08:25:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 2/5] socket: Add num connections to
 qio_channel_socket_sync()
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
 include/io/channel-socket.h    | 2 ++
 io/channel-socket.c            | 7 ++++---
 io/net-listener.c              | 2 +-
 io/trace-events                | 2 +-
 scsi/qemu-pr-helper.c          | 2 +-
 tests/test-char.c              | 4 ++--
 tests/test-io-channel-socket.c | 2 +-
 tests/tpm-emu.c                | 2 +-
 8 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
index d7134d2cd6..ed88e5b8c1 100644
--- a/include/io/channel-socket.h
+++ b/include/io/channel-socket.h
@@ -123,6 +123,7 @@ void qio_channel_socket_connect_async(QIOChannelSocke=
t *ioc,
  * qio_channel_socket_listen_sync:
  * @ioc: the socket channel object
  * @addr: the address to listen to
+ * @num: the expected ammount of connections
  * @errp: pointer to a NULL-initialized error object
  *
  * Attempt to listen to the address @addr. This method
@@ -132,6 +133,7 @@ void qio_channel_socket_connect_async(QIOChannelSocke=
t *ioc,
  */
 int qio_channel_socket_listen_sync(QIOChannelSocket *ioc,
                                    SocketAddress *addr,
+                                   int num,
                                    Error **errp);
=20
 /**
diff --git a/io/channel-socket.c b/io/channel-socket.c
index a533c8bc11..6258c25983 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -197,12 +197,13 @@ void qio_channel_socket_connect_async(QIOChannelSoc=
ket *ioc,
=20
 int qio_channel_socket_listen_sync(QIOChannelSocket *ioc,
                                    SocketAddress *addr,
+                                   int num,
                                    Error **errp)
 {
     int fd;
=20
-    trace_qio_channel_socket_listen_sync(ioc, addr);
-    fd =3D socket_listen(addr, 1, errp);
+    trace_qio_channel_socket_listen_sync(ioc, addr, num);
+    fd =3D socket_listen(addr, num, errp);
     if (fd < 0) {
         trace_qio_channel_socket_listen_fail(ioc);
         return -1;
@@ -226,7 +227,7 @@ static void qio_channel_socket_listen_worker(QIOTask =
*task,
     SocketAddress *addr =3D opaque;
     Error *err =3D NULL;
=20
-    qio_channel_socket_listen_sync(ioc, addr, &err);
+    qio_channel_socket_listen_sync(ioc, addr, 1, &err);
=20
     qio_task_set_error(task, err);
 }
diff --git a/io/net-listener.c b/io/net-listener.c
index d8cfe52673..dc81150318 100644
--- a/io/net-listener.c
+++ b/io/net-listener.c
@@ -82,7 +82,7 @@ int qio_net_listener_open_sync(QIONetListener *listener=
,
     for (i =3D 0; i < nresaddrs; i++) {
         QIOChannelSocket *sioc =3D qio_channel_socket_new();
=20
-        if (qio_channel_socket_listen_sync(sioc, resaddrs[i],
+        if (qio_channel_socket_listen_sync(sioc, resaddrs[i], 1,
                                            err ? NULL : &err) =3D=3D 0) =
{
             success =3D true;
=20
diff --git a/io/trace-events b/io/trace-events
index 378390521e..2e6aa1d749 100644
--- a/io/trace-events
+++ b/io/trace-events
@@ -17,7 +17,7 @@ qio_channel_socket_connect_sync(void *ioc, void *addr) =
"Socket connect sync ioc=3D
 qio_channel_socket_connect_async(void *ioc, void *addr) "Socket connect =
async ioc=3D%p addr=3D%p"
 qio_channel_socket_connect_fail(void *ioc) "Socket connect fail ioc=3D%p=
"
 qio_channel_socket_connect_complete(void *ioc, int fd) "Socket connect c=
omplete ioc=3D%p fd=3D%d"
-qio_channel_socket_listen_sync(void *ioc, void *addr) "Socket listen syn=
c ioc=3D%p addr=3D%p"
+qio_channel_socket_listen_sync(void *ioc, void *addr, int num) "Socket l=
isten sync ioc=3D%p addr=3D%p num=3D%d"
 qio_channel_socket_listen_async(void *ioc, void *addr) "Socket listen as=
ync ioc=3D%p addr=3D%p"
 qio_channel_socket_listen_fail(void *ioc) "Socket listen fail ioc=3D%p"
 qio_channel_socket_listen_complete(void *ioc, int fd) "Socket listen com=
plete ioc=3D%p fd=3D%d"
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index a256ce490b..f960d8303b 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -1005,7 +1005,7 @@ int main(int argc, char **argv)
             .u.q_unix.path =3D socket_path,
         };
         server_ioc =3D qio_channel_socket_new();
-        if (qio_channel_socket_listen_sync(server_ioc, &saddr, &local_er=
r) < 0) {
+        if (qio_channel_socket_listen_sync(server_ioc, &saddr, 1, &local=
_err) < 0) {
             object_unref(OBJECT(server_ioc));
             error_report_err(local_err);
             return 1;
diff --git a/tests/test-char.c b/tests/test-char.c
index f9440cdcfd..af131fc850 100644
--- a/tests/test-char.c
+++ b/tests/test-char.c
@@ -666,7 +666,7 @@ char_socket_addr_to_opt_str(SocketAddress *addr, bool=
 fd_pass,
         char *optstr;
         g_assert(!reconnect);
         if (is_listen) {
-            qio_channel_socket_listen_sync(ioc, addr, &error_abort);
+            qio_channel_socket_listen_sync(ioc, addr, 1, &error_abort);
         } else {
             qio_channel_socket_connect_sync(ioc, addr, &error_abort);
         }
@@ -891,7 +891,7 @@ static void char_socket_client_test(gconstpointer opa=
que)
      */
     ioc =3D qio_channel_socket_new();
     g_assert_nonnull(ioc);
-    qio_channel_socket_listen_sync(ioc, config->addr, &error_abort);
+    qio_channel_socket_listen_sync(ioc, config->addr, 1, &error_abort);
     addr =3D qio_channel_socket_get_local_address(ioc, &error_abort);
     g_assert_nonnull(addr);
=20
diff --git a/tests/test-io-channel-socket.c b/tests/test-io-channel-socke=
t.c
index d2053c464c..6eebcee115 100644
--- a/tests/test-io-channel-socket.c
+++ b/tests/test-io-channel-socket.c
@@ -57,7 +57,7 @@ static void test_io_channel_setup_sync(SocketAddress *l=
isten_addr,
     QIOChannelSocket *lioc;
=20
     lioc =3D qio_channel_socket_new();
-    qio_channel_socket_listen_sync(lioc, listen_addr, &error_abort);
+    qio_channel_socket_listen_sync(lioc, listen_addr, 1, &error_abort);
=20
     if (listen_addr->type =3D=3D SOCKET_ADDRESS_TYPE_INET) {
         SocketAddress *laddr =3D qio_channel_socket_get_local_address(
diff --git a/tests/tpm-emu.c b/tests/tpm-emu.c
index 125e697181..c43ac4aef8 100644
--- a/tests/tpm-emu.c
+++ b/tests/tpm-emu.c
@@ -76,7 +76,7 @@ void *tpm_emu_ctrl_thread(void *data)
     QIOChannelSocket *lioc =3D qio_channel_socket_new();
     QIOChannel *ioc;
=20
-    qio_channel_socket_listen_sync(lioc, s->addr, &error_abort);
+    qio_channel_socket_listen_sync(lioc, s->addr, 1, &error_abort);
=20
     g_mutex_lock(&s->data_mutex);
     s->data_cond_signal =3D true;
--=20
2.21.0


