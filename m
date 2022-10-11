Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E785FBC38
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 22:38:20 +0200 (CEST)
Received: from localhost ([::1]:43218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiM15-00028f-PS
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 16:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLW4-0006Qi-RI
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:21 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:47915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLW2-0003m6-V2
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:16 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MTRAS-1oabDc13xU-00TjMO; Tue, 11 Oct 2022 22:06:04 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Greg Kurz <groug@kaod.org>,
 Eric Blake <eblake@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>, Paul Durrant <paul@xen.org>,
 David Gibson <david@gibson.dropbear.id.au>, xen-devel@lists.xenproject.org
Subject: [PATCH v11 13/17] qemu-sockets: move and rename SocketAddress_to_str()
Date: Tue, 11 Oct 2022 22:05:35 +0200
Message-Id: <20221011200539.1486809-14-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011200539.1486809-1-lvivier@redhat.com>
References: <20221011200539.1486809-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hUbb5jIwSKgK+St/SNdQdxrOCLG2qz2KV1mFxYpohHUQ+jMosg+
 /HKFutYpgagnW/am+mHnu3RmkjMsfIuCe/IxM+S1ZR3Q+JbKxF7+jV6//HGRE/lEOpsqOy+
 63lfkFOZAfQUA3XvVa6rO7MRcpD3VG4Zs3OCp2PQHuWhqKiPAGUDxGcGG5dy6zKc05Vzrkm
 JKcp0NVOePxWqhJy1cTRw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EdrdNw6kAng=:zUwUpnsZ9dtTDBann7xlY+
 NabQ9aeQyi8QsRjB/y76X5TCg7K0qLZoNLpz8mM7Zo3ZQhJIApD9C9aDC1EolJWBYxQJ/V1/H
 RlLNm9gPN5Rn4dO8CSVnwdV2b3LDbhLTeKCyJKbEibC4HvRc0HaE8TAUgUY5xpUdG9yJOHLW1
 Gfhx2pPGT+flDO3jwk1pFyMfGuMTzVWbPPM7c/iDUT8r6eWtdJirZIbUcS9DDHEUhB7ESnh10
 UhI3QS7Gr11Pc20zN2giyZfDyGJt2wph3fxrNF+yzoc452MPrsL2/h4U7sOdFJW921dBGIaa7
 cpNKJIUPPhWwDPtfkNsIuF2pmYOI5ogd4pH6eCDtd8NVZ2OduTDLK2aXbBwPMtgrphC8RAzXa
 Ntc5WAY4xN4aaGZaOpFqX1uPnleaIuddr33+CPN4vcU1MRz1slITSloFcwwbRo1ttNpbzotXY
 g/zlOTwnzWifk3cajdYCNo6jzJu3kxNLQDWTHzsUXwJsbjpC/romBLDSCL34Y6TM/NqpeqYDH
 fBvxJ3/Vo5I3YdBg2ApkLlhZj5gl8NucvlsLvBNbPFOUoHA3ZMCQmMn0pt/vNyfvDKeQCor60
 erildVWMVQuyM1uJpz3AgOrJixYQ9vh1sSHRonDC60IP3U+kTY8gSkbm06xGArDYjJeja3KMg
 iZYkjYLYLmbNQUIxOCmo3MuXRHGCmOR/mMUE/YymNFzbag+G5eM7jZRPDYj4Lm+LrLe9Z5gm5
 EVigbZXKRYei88JPcpvgXDhNGXLb9ejh1ozMaBvJnTkCAAET4wtmOzonmvk8QNpB0V2Arxwvp
 zS8qlj5
Received-SPF: permerror client-ip=212.227.126.130;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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
index f90eea8d01c6..edf7068a9224 100644
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


