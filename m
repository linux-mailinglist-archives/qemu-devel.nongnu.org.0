Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C53C5F586D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 18:39:04 +0200 (CEST)
Received: from localhost ([::1]:42324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og7QF-0006Jk-LQ
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 12:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og794-0007Q1-RN
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:18 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:40531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og78z-0002oc-OX
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:18 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MUXlG-1oowoZ0amm-00QPd4; Wed, 05 Oct 2022 18:21:11 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v10 13/17] qemu-sockets: move and rename SocketAddress_to_str()
Date: Wed,  5 Oct 2022 18:20:47 +0200
Message-Id: <20221005162051.1120041-14-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005162051.1120041-1-lvivier@redhat.com>
References: <20221005162051.1120041-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1jrF0lL6Ohw0YL2pOK3R/rMugbDpDLwEW4OfibX+WkjEqLXnTPW
 8NJr08YJ8OUo5nKwpSmigx2qUOeS5qbsQ/TTpOtpU64Frz9qcwlTgLd10EcxjrxpzljkS/j
 PaQvnPEKs1RKmKjdAl3R2NIL4bl4nGMWRHBM25Y6GLdBB0n5Z4ZwAhTI2RhnwdEuKvDHrCA
 J7I17NNrG1dqLYl6+yCkw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qGaD+3oiPTw=:n+lL7NEbGLu5OoWogHacfv
 4a21LmklN12v/l1MoXCF07Z0E7TtwaQmcBKbS8RZDYdfpCqMgIDQCwbWlGUdCLUQ5jQXam3GO
 z2grcd7OtbYH5YoOeDVV3lUCwTv3jWlto8ad17/YeVU08cGbXmWE06v3zsVbGHrX/vUUnKXi9
 5VWPOLWLAbxaznSlwV2YlD6lFJ9/fqN+5dbfv4RtPpXLsBL2VUQ8GiJH/p2L0dI/JYkcAkcbD
 9WZbUK3pO95XKDbzzvsLKFGD5DVwuMlF9Lb4ipJnq5lqLdXrSYhvgWm2bx2ecCaPUs7TbsS8g
 bFI1AMLPxqgbZSmRADos9JMc4jciHUR0CDgW/zauFuoGG4fbfusg6PSKCAxJcjQ3YdrSVfYD+
 qdsnwe30qB3KzIHiNYdFlyuD+fiwpBr5xwr1LWdGKlgSS3oudxPpyeIk+b3260vU/7elAwLvn
 SPk3FcQ5Fr3443OQ5W335Z5RtFKGMAmoZJPk4Mk6WJDgSYgXWBl17ACgpdd878egks1TL5fRp
 x6yREDt261szj0jCotDrowHyW+vK2vJXBPpT7ZGUo1WnefHc3ZwRxQxITFK9ZMaH7ahG5hs8R
 DWvPNng7gaRMbT5pT8LIi7mw4VUsaW+jgR9UFWq7SoK+8tfvKLSfcpPyLtQZJqhLshi0iR9fA
 cQvbZkl1gJBf96IE+pLF0UYHMOfITF1hVWyk01NKa5uItMv2MteaK/HIUDQDkO3bYfFFMug/e
 E261NuOHm398WwOeBZVGHo/V0G8VIz1R/k6lXNGTULSYQfPNf+uShU8HF6cWo45dBaL6xjIaQ
 Hv6rCmb
Received-SPF: permerror client-ip=212.227.17.10;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_FAIL=0.001, SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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


