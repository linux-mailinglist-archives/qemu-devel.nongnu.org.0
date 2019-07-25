Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF34B74A53
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 11:49:57 +0200 (CEST)
Received: from localhost ([::1]:57742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqaNo-0001sk-6U
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 05:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43491)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hqaNc-0001UY-PW
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 05:49:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hqaNb-00076L-NH
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 05:49:44 -0400
Received: from relay.sw.ru ([185.231.240.75]:45328)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hqaNb-00075I-Fw
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 05:49:43 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hqaNX-0001kf-CU; Thu, 25 Jul 2019 12:49:39 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Thu, 25 Jul 2019 12:49:37 +0300
Message-Id: <20190725094937.32454-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v4] qapi: Add InetSocketAddress member
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

Notes:
    v4; [by Markus's comments]
    
    - use "passive socket" term
    - move check for not enabled keep_alive to inet_listen_saddr()
    
    v3: [by Markus's comments]
    
    - Fix commit subject
    - Add comment to qapi and restrict server-side connections
    - Fix s/"keep-alive="/",keep-alive"/

 qapi/sockets.json   |  6 +++++-
 util/qemu-sockets.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/qapi/sockets.json b/qapi/sockets.json
index fc81d8d5e8..32375f3a36 100644
--- a/qapi/sockets.json
+++ b/qapi/sockets.json
@@ -53,6 +53,9 @@
 #
 # @ipv6: whether to accept IPv6 addresses, default try both IPv4 and IPv6
 #
+# @keep-alive: enable keep-alive when connecting to this socket. Not supported
+#              for passive sockets. (Since 4.2)
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
index a5092dbd12..35d2b7f773 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -219,6 +219,12 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
     bool socket_created = false;
     Error *err = NULL;
 
+    if (saddr->keep_alive) {
+        error_setg(errp, "keep-alive options is not supported for passive "
+                   "sockets");
+        return -1;
+    }
+
     memset(&ai,0, sizeof(ai));
     ai.ai_flags = AI_PASSIVE;
     if (saddr->has_numeric && saddr->numeric) {
@@ -458,6 +464,19 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
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
 
@@ -653,6 +672,15 @@ int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
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


