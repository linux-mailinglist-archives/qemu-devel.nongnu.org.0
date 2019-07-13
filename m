Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2A367A99
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Jul 2019 16:34:55 +0200 (CEST)
Received: from localhost ([::1]:56588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmJ70-00026K-Gp
	for lists+qemu-devel@lfdr.de; Sat, 13 Jul 2019 10:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46779)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hmJ6b-0001Tk-28
 for qemu-devel@nongnu.org; Sat, 13 Jul 2019 10:34:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hmJ6Z-0007cJ-Lq
 for qemu-devel@nongnu.org; Sat, 13 Jul 2019 10:34:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55984)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1hmJ6Z-0007aW-Dz
 for qemu-devel@nongnu.org; Sat, 13 Jul 2019 10:34:27 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 819F5C057F4F;
 Sat, 13 Jul 2019 14:34:26 +0000 (UTC)
Received: from localhost (ovpn-112-50.ams2.redhat.com [10.36.112.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4603A5D968;
 Sat, 13 Jul 2019 14:34:17 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 13 Jul 2019 18:33:10 +0400
Message-Id: <20190713143311.17620-6-marcandre.lureau@redhat.com>
In-Reply-To: <20190713143311.17620-1-marcandre.lureau@redhat.com>
References: <20190713143311.17620-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Sat, 13 Jul 2019 14:34:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 5/6] test-char: skip tcp tests if ipv4 check
 failed
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
Cc: Fam Zheng <fam@euphon.net>, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 tests/Makefile.include |  2 +-
 tests/test-char.c      | 17 +++++++++++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index a983dd32da..2bddebaf4b 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -523,7 +523,7 @@ tests/check-qlit$(EXESUF): tests/check-qlit.o $(test-=
util-obj-y)
 tests/check-qom-interface$(EXESUF): tests/check-qom-interface.o $(test-q=
om-obj-y)
 tests/check-qom-proplist$(EXESUF): tests/check-qom-proplist.o $(test-qom=
-obj-y)
=20
-tests/test-char$(EXESUF): tests/test-char.o $(test-util-obj-y) $(qtest-o=
bj-y) $(test-io-obj-y) $(chardev-obj-y)
+tests/test-char$(EXESUF): tests/test-char.o $(test-util-obj-y) $(qtest-o=
bj-y) $(test-io-obj-y) $(chardev-obj-y) tests/socket-helpers.o
 tests/test-coroutine$(EXESUF): tests/test-coroutine.o $(test-block-obj-y=
)
 tests/test-aio$(EXESUF): tests/test-aio.o $(test-block-obj-y)
 tests/test-aio-multithread$(EXESUF): tests/test-aio-multithread.o $(test=
-block-obj-y)
diff --git a/tests/test-char.c b/tests/test-char.c
index f9440cdcfd..2dde620afc 100644
--- a/tests/test-char.c
+++ b/tests/test-char.c
@@ -15,6 +15,7 @@
 #include "io/channel-socket.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qapi-visit-sockets.h"
+#include "socket-helpers.h"
=20
 static bool quit;
=20
@@ -1356,11 +1357,17 @@ static void char_hotswap_test(void)
=20
 int main(int argc, char **argv)
 {
+    bool has_ipv4, has_ipv6;
+
     qemu_init_main_loop(&error_abort);
     socket_init();
=20
     g_test_init(&argc, &argv, NULL);
=20
+    if (socket_check_protocol_support(&has_ipv4, &has_ipv6) < 0) {
+        return -1;
+    }
+
     module_call_init(MODULE_INIT_QOM);
     qemu_add_opts(&qemu_chardev_opts);
=20
@@ -1438,10 +1445,12 @@ int main(int argc, char **argv)
     g_test_add_data_func("/char/socket/client/wait-conn-fdpass/" # name,=
 \
                          &client6 ##name, char_socket_client_test)
=20
-    SOCKET_SERVER_TEST(tcp, &tcpaddr);
-    SOCKET_CLIENT_TEST(tcp, &tcpaddr);
-    g_test_add_data_func("/char/socket/server/two-clients/tcp", &tcpaddr=
,
-                         char_socket_server_two_clients_test);
+    if (has_ipv4) {
+        SOCKET_SERVER_TEST(tcp, &tcpaddr);
+        SOCKET_CLIENT_TEST(tcp, &tcpaddr);
+        g_test_add_data_func("/char/socket/server/two-clients/tcp", &tcp=
addr,
+                             char_socket_server_two_clients_test);
+    }
 #ifndef WIN32
     SOCKET_SERVER_TEST(unix, &unixaddr);
     SOCKET_CLIENT_TEST(unix, &unixaddr);
--=20
2.22.0.428.g6d5b264208


