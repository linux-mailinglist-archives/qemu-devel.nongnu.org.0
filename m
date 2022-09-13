Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B915B68A2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 09:26:52 +0200 (CEST)
Received: from localhost ([::1]:33786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY0Jm-0006kN-3P
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 03:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzg7-0000hE-PV
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:53 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:33923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzfm-0004AI-W2
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:51 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MQPVR-1ouLnF2oN7-00MM2h; Tue, 13 Sep 2022 08:40:16 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gregory Kurz <gregory.kurz@free.fr>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v8 11/14] qemu-sockets: move and rename SocketAddress_to_str()
Date: Tue, 13 Sep 2022 08:39:57 +0200
Message-Id: <20220913064000.79353-12-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913064000.79353-1-lvivier@redhat.com>
References: <20220913064000.79353-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DNjYddwSbONGQFpyaMlLeHxgGJdDI2sugY+AGfWT2WOTTTC+oJo
 JK78Pe/siYt7O6sJQI/vUADKxgr6Q3tWMtEV193Wtg0ddaAseehUETI5OqN7Ther5X34ljt
 aYyiAItRqo9jh9rnX1jdx9RK0WNpuaRaHBsHLsL4ATqINITtOOf8Nul/EBbT4Whj1peK/EK
 6smRL6IluphEj3/OuFCWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KkPdGoYcQSo=:nHS3+p+nYY0X11lzZ9DLU+
 22ZAbsOpCJjdbGgbMJtCYx2BfrnF9Biwwn+U7GKNtjOS8LgvAs/l2MaNAprO528vUUSi+6qCY
 S1uT5J3aG0R1va7PQcUGgCeXSNbxRjC0zBo1V3jICmppJHNo3xKdA2bkyKhKNie8bKTzesSCe
 UWiT8VuaufI1yt+Vu0JNEnE9HXWMo5ZMTw0uELr7AW/ipv52pf3WPpo+x4WuJleWUHhQv0Nif
 uRMsWJB2Mj8NkteLT4Y/XMWV3I0FOaDhPREiGWJmlWcAWHcZWvlwkCgwAP0GhacLDHoAJWMgO
 M+5htPfP7KZm/9DYZ8Jqz6OetwW+rgKdJQteWb7KY05G+Pqabw4OigXf64V0JhQatP0GBYa2P
 Lg11sT+ioXTSN2QrfCDZKWPoH9s9zyQTi/bxVulV6uyGTi/wrUgvu6G95AwiV14/TGQA/ik/x
 U2VCvcpRxSUTFu99yvUl5oVfXXhWsL5YH3DXbh5J14phiX/LUsyEZsr5ty4hiY7KbwsXTaXTt
 /AfquLAJLOE+2CIHVhWez980AQhoRP1EqeqQe382i5Pr3KZWBrVEjDNMTr+lUAuDfcDK0+2Un
 ptK+B525iP2UkjXkc8herAHiDgx3y4oPLObgM1aU59gIriBcKqXsoWqMoOpZ/e5VylRD1YgRv
 vodlqtr8hykqr8EgNMw5JtX0A35dpgEOmeQ2rdYLIBHWBzcCSHeW8qIyPLKwyVrmuEf02eH+A
 C/sp1X2yt1QqlHkx1uUaBgr1alj2sUDveXZsVlKEl/CXwJYq2vk9DGxOERGKF8W9sGiOI5ghi
 Cr2CYcb
Received-SPF: permerror client-ip=212.227.126.131;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Rename SocketAddress_to_str() to socket_uri() and move it to
util/qemu-sockets.c close to socket_parse().

socket_uri() generates a string from a SocketAddress while
socket_parse() generates a SocketAddress from a string.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 include/qemu/sockets.h |  2 +-
 monitor/hmp-cmds.c     | 23 +----------------------
 util/qemu-sockets.c    | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 47194b9732f8..e5a06d2e3729 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -40,6 +40,7 @@ NetworkAddressFamily inet_netfamily(int family);
 int unix_listen(const char *path, Error **errp);
 int unix_connect(const char *path, Error **errp);
 
+char *socket_uri(SocketAddress *addr);
 SocketAddress *socket_parse(const char *str, Error **errp);
 int socket_connect(SocketAddress *addr, Error **errp);
 int socket_listen(SocketAddress *addr, int num, Error **errp);
@@ -123,5 +124,4 @@ SocketAddress *socket_address_flatten(SocketAddressLegacy *addr);
  * Return 0 on success.
  */
 int socket_address_parse_named_fd(SocketAddress *addr, Error **errp);
-
 #endif /* QEMU_SOCKETS_H */
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index c6cd6f91dde6..cb35059c2d45 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -197,27 +197,6 @@ void hmp_info_mice(Monitor *mon, const QDict *qdict)
     qapi_free_MouseInfoList(mice_list);
 }
 
-static char *SocketAddress_to_str(SocketAddress *addr)
-{
-    switch (addr->type) {
-    case SOCKET_ADDRESS_TYPE_INET:
-        return g_strdup_printf("tcp:%s:%s",
-                               addr->u.inet.host,
-                               addr->u.inet.port);
-    case SOCKET_ADDRESS_TYPE_UNIX:
-        return g_strdup_printf("unix:%s",
-                               addr->u.q_unix.path);
-    case SOCKET_ADDRESS_TYPE_FD:
-        return g_strdup_printf("fd:%s", addr->u.fd.str);
-    case SOCKET_ADDRESS_TYPE_VSOCK:
-        return g_strdup_printf("tcp:%s:%s",
-                               addr->u.vsock.cid,
-                               addr->u.vsock.port);
-    default:
-        return g_strdup("unknown address type");
-    }
-}
-
 void hmp_info_migrate(Monitor *mon, const QDict *qdict)
 {
     MigrationInfo *info;
@@ -380,7 +359,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "socket address: [\n");
 
         for (addr = info->socket_address; addr; addr = addr->next) {
-            char *s = SocketAddress_to_str(addr->value);
+            char *s = socket_uri(addr->value);
             monitor_printf(mon, "\t%s\n", s);
             g_free(s);
         }
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 83f4bd6fd211..9f6f655fd526 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1077,6 +1077,26 @@ int unix_connect(const char *path, Error **errp)
     return sock;
 }
 
+char *socket_uri(SocketAddress *addr)
+{
+    switch (addr->type) {
+    case SOCKET_ADDRESS_TYPE_INET:
+        return g_strdup_printf("tcp:%s:%s",
+                               addr->u.inet.host,
+                               addr->u.inet.port);
+    case SOCKET_ADDRESS_TYPE_UNIX:
+        return g_strdup_printf("unix:%s",
+                               addr->u.q_unix.path);
+    case SOCKET_ADDRESS_TYPE_FD:
+        return g_strdup_printf("fd:%s", addr->u.fd.str);
+    case SOCKET_ADDRESS_TYPE_VSOCK:
+        return g_strdup_printf("tcp:%s:%s",
+                               addr->u.vsock.cid,
+                               addr->u.vsock.port);
+    default:
+        return g_strdup("unknown address type");
+    }
+}
 
 SocketAddress *socket_parse(const char *str, Error **errp)
 {
-- 
2.37.3


