Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC9737172
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 12:17:23 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYpSU-0002Qe-Jk
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 06:17:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYpR4-0001u7-RU
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 06:15:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYpQz-0007OW-ND
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 06:15:51 -0400
Received: from relay.sw.ru ([185.231.240.75]:38212)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hYpQx-0006sf-86
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 06:15:48 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hYpQj-0007Qy-Uc; Thu, 06 Jun 2019 13:15:34 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 13:15:33 +0300
Message-Id: <20190606101533.20228-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH] qapi: InitSocketAddress: add keepalive option
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, armbru@redhat.com,
	kraxel@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hi all!

This is a continuation of "[PATCH v2 0/2] nbd: enable keepalive", but
it's a try from another side, so almost nothing common with v2.


 qapi/sockets.json   |  5 ++++-
 util/qemu-sockets.c | 13 +++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/qapi/sockets.json b/qapi/sockets.json
index fc81d8d5e8..aefa024051 100644
--- a/qapi/sockets.json
+++ b/qapi/sockets.json
@@ -53,6 +53,8 @@
 #
 # @ipv6: whether to accept IPv6 addresses, default try both IPv4 and IPv6
 #
+# @keepalive: enable keepalive when connecting to this socket (Since 4.1)
+#
 # Since: 1.3
 ##
 { 'struct': 'InetSocketAddress',
@@ -61,7 +63,8 @@
     '*numeric':  'bool',
     '*to': 'uint16',
     '*ipv4': 'bool',
-    '*ipv6': 'bool' } }
+    '*ipv6': 'bool',
+    '*keepalive': 'bool' } }
 
 ##
 # @UnixSocketAddress:
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 8850a280a8..d2cd2a9d4f 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -457,6 +457,19 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
     }
 
     freeaddrinfo(res);
+
+    if (saddr->keepalive) {
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
 
-- 
2.18.0


