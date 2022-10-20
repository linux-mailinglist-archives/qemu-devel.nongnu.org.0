Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D23F605B3C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 11:32:38 +0200 (CEST)
Received: from localhost ([::1]:59152 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olRue-0000ly-2z
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:32:33 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olRr4-0004ZP-D5
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfo-00031R-JI
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:17:08 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:37371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfi-0005KE-BN
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:17:08 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N1fei-1pEIGZ3Ki8-0121HK; Thu, 20 Oct 2022 11:16:52 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paul Durrant <paul@xen.org>, Stefan Weil <sw@weilnetz.de>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v12 13/17] qemu-sockets: move and rename SocketAddress_to_str()
Date: Thu, 20 Oct 2022 11:16:20 +0200
Message-Id: <20221020091624.48368-14-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020091624.48368-1-lvivier@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rJGWwU379FPxWHX7EKlwIFfPbLkhHTKDFEgfXOayClDd2gTEcT+
 oV6xW03waYXUS1VRFhF/AtZOp1mZnz3hUd37+lIOR7Qr2oZGWgQUzxlrm6/cyjn5JPWIP+n
 PDFkh1edn7Obqp2a7EWxqrkMv1K/2cm+xdBBcMVkMpXHom5qecAfmMyMsd5zR26gb0rTJcq
 viLWz4Hsxps4sKWjtKgPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BkZIJrYJi+4=:hJYjXXfKDz2YI2/FJmnl+r
 B4Q7xC4w29QhOGp9DkNCi5m//1zlh1DpafbSQT14LNiWE78h3SUjvBCVsIhRyiU9PzMVQXh2Z
 PKajA4HcnbItvbnTOTYIoEdTYL4MNCbMz+G1Ar+ps/kSIXY0fKQVw3yC5P+9TRCb80mS55q3E
 z1FL9sQOVJ7DF4aTv8aFevOiC72sQoDXi/p1mnVSWijUgs0uijar9pvetC5Jana0kvBulMVuI
 od6VXRjNpg5mBSOyOUxeYsuR96TwrSx2yslsVkviV1dD+esR7jP8zdqd1jRvnHSZamdgx8Uwq
 DIWbFqFyzuhEkqH9vpqOJEu9z1Oujy7g4AycLa3KiYwLlQ/VjjILCLpBqKOR6+IEHvRcbnC1T
 3/kL1o5Hhw6rBGcxI6Ltsw8sLxxDuSrTQk+b/1ntHGyA5b5iLQA6/AXIkrqJWV+Kp9WrFw4cH
 Unxc+yP8e7S9xmcvzAJCGErzCIhbEI6V9OHJsot0qpJ8EvxuGphzD3P2DUsbhRIAXT8b151VA
 A2tfWBUhilgvMx69t47d6WWrtAKkzXSNjnO/rpMiG13JUsdNKRaGaDZV+f+qVF5LvqSQLLqLR
 IZEGejpKiY/+doYZrM0FqRX3qkdZWrclz+7WUaOyejXfbcsb3Gc/sR111+o7h2JStLVnLa02w
 GGMv7W+o5MJWVd3bQRF6u7yzJJfh+HmfrsO6r0WZ5k1vxkuAe+y4djn2HYkDAIB5WfsGKzO4F
 vGPEjOntxeThuY5VfM3PP+1CiEUDKS/NjOmg9DONpXU3CXc3k8t5UVbEpgABSSycbH4ZBCdtP
 I2f7Cfe
Received-SPF: permerror client-ip=212.227.126.130;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/qemu/sockets.h |  2 +-
 monitor/hmp-cmds.c     | 23 +----------------------
 util/qemu-sockets.c    | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index db4bedb6fa20..214058d8e307 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -58,6 +58,7 @@ NetworkAddressFamily inet_netfamily(int family);
 int unix_listen(const char *path, Error **errp);
 int unix_connect(const char *path, Error **errp);
 
+char *socket_uri(SocketAddress *addr);
 SocketAddress *socket_parse(const char *str, Error **errp);
 int socket_connect(SocketAddress *addr, Error **errp);
 int socket_listen(SocketAddress *addr, int num, Error **errp);
@@ -141,5 +142,4 @@ SocketAddress *socket_address_flatten(SocketAddressLegacy *addr);
  * Return 0 on success.
  */
 int socket_address_parse_named_fd(SocketAddress *addr, Error **errp);
-
 #endif /* QEMU_SOCKETS_H */
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index bab86c5537e1..01b789a79e62 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -199,27 +199,6 @@ void hmp_info_mice(Monitor *mon, const QDict *qdict)
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
@@ -382,7 +361,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
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


