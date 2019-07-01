Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2292467BE
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 20:43:23 +0200 (CEST)
Received: from localhost ([::1]:54214 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbrAY-0001Of-RZ
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 14:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34972)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hbq3I-0000cK-Hp
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:31:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hbq3G-0006b8-NW
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:31:48 -0400
Received: from relay.sw.ru ([185.231.240.75]:56110)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hbq3G-0006Y1-Fl
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:31:46 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hbq3C-0007hu-4n; Fri, 14 Jun 2019 20:31:42 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 20:31:40 +0300
Message-Id: <20190614173140.19159-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v3] qapi: Add InetSocketAddress member
 keep-alive
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, armbru@redhat.com,
 kraxel@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's needed to provide keepalive for nbd client to track server
availability.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

v3: [by Markus's comments]

- Fix commit subject
- Add comment to qapi and restrict server-side connections
- Fix s/"keep-alive="/",keep-alive"/


 qapi/sockets.json   |  6 +++++-
 util/qemu-sockets.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/qapi/sockets.json b/qapi/sockets.json
index fc81d8d5e8..c44af481a1 100644
--- a/qapi/sockets.json
+++ b/qapi/sockets.json
@@ -53,6 +53,9 @@
 #
 # @ipv6: whether to accept IPv6 addresses, default try both IPv4 and IPv6
 #
+# @keep-alive: enable keep-alive when connecting to this socket. Not supported
+#              for server-side connections. (Since 4.1)
+#
 # Since: 1.3
 ##
 { 'struct': 'InetSocketAddress',
@@ -61,7 +64,8 @@
     '*numeric':  'bool',
     '*to': 'uint16',
     '*ipv4': 'bool',
-    '*ipv6': 'bool' } }
+    '*ipv6': 'bool',
+    '*keep-alive': 'bool' } }
 
 ##
 # @UnixSocketAddress:
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 8850a280a8..813063761b 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -438,6 +438,12 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
     struct addrinfo *res, *e;
     int sock = -1;
 
+    if (saddr->keep_alive) {
+        error_setg(errp, "keep-alive options is not supported for server-side "
+                   "connection");
+        return -1;
+    }
+
     res = inet_parse_connect_saddr(saddr, errp);
     if (!res) {
         return -1;
@@ -457,6 +463,19 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
     }
 
     freeaddrinfo(res);
+
+    if (saddr->keep_alive) {
+        int val = 1;
+        int ret = qemu_setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE,
+                                  &val, sizeof(val));
+
+        if (ret < 0) {
+            error_setg_errno(errp, errno, "Unable to set KEEPALIVE");
+            close(sock);
+            return -1;
+        }
+    }
+
     return sock;
 }
 
@@ -652,6 +671,15 @@ int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
         }
         addr->has_ipv6 = true;
     }
+    begin = strstr(optstr, ",keep-alive");
+    if (begin) {
+        if (inet_parse_flag("keep-alive", begin + strlen(",keep-alive"),
+                            &addr->keep_alive, errp) < 0)
+        {
+            return -1;
+        }
+        addr->has_keep_alive = true;
+    }
     return 0;
 }
 
-- 
2.18.0


