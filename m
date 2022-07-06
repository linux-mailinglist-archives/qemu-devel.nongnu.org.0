Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD848567F4E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 09:04:25 +0200 (CEST)
Received: from localhost ([::1]:47988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8z5E-0003uI-RP
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 03:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o8yue-0005W9-KQ
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 02:53:28 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:41467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o8yuc-0004kn-9I
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 02:53:28 -0400
Received: from thinkpad.redhat.com ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Moewz-1np0AK1sG9-00p8Gr; Wed, 06 Jul 2022 08:53:21 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v6 11/13] qemu-sockets: move and rename SocketAddress_to_str()
Date: Wed,  6 Jul 2022 08:53:06 +0200
Message-Id: <20220706065306.1398103-1-lvivier@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706062847.1396719-1-lvivier@redhat.com>
References: <20220706062847.1396719-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FpPGMnJWR4rOQqoMb+k+vyVMa0QK3PDUrg4HNpPYykNpCRoj8JT
 XQcJ9r1UWYYHgG4JTaouV4pzsiabnnEuHDiYlEmx9zK81NsjzzLwYwG5dIaxEx7iSsJcoOm
 3U6pG42mLA7LdiPsq+jkFeFoPtt17jhquRrdVC9FFKEZdktXLyOoplfL3frN1u715XrSjT6
 DyI0xiQvF/G8vzpJcVzEA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r1kyfo+il4E=:D8Xdw4/6QR370UDA0/diGp
 eiHR1FIdI/8Q4zx7iSZvUrjsVC6nJDPICh+1X/6dwI4oECqxWxgkDybsSRL3QvFeUH7e+CJFS
 7uv7D5ah9uQ9u88k8quYdI24ZvuTTh4kKCNjB8soc9rw+MivTCUgaHCLJOZcFe2pACNtQyK9j
 rS9LgwgEbyvmLogklKVkOdueSr/7T66FJoVEsUQdlP+LBCHPAkkB7SabcIbOU+XmxGrAfdArP
 awk5FUUqjIL3nYkZ708z3i8JeL3nblBVNubCQ0dhKVjGH52jZVDogs037AwYNGfO30/pWDI3u
 DC0HCvoB68DdDSX8rAipYrOD5URzV31kY+A7rRBlfrWTtaqAHMEJdL9FHB3nFNfOWAb+e1MMa
 M2jv/2gp+ZKboTECNwvaEMIGGK4ts/Pj4VoMONj5lRA4SFOfZ0Zrl9v34RAw1eCfMAmNjUyce
 GH38GnCGVMNaRL/8al/nSUVFfxEEw6ZmuuK11MlRwMv3djud/ZHpILn9eiWbl7VSZNwSptlPz
 /u3GVx42sNlahX6PdwJrgmtpsbkmz2y+DlklGwR5GFEB6L/LhobLknUYQ13gtt3BhSQb62jo/
 Yn7SoWRizWePQNY2XdWloUj844WtGa66kc1nqh0Q7k0ojjYOJztbPIWGbWTasiBCzPZTTY1Ak
 NbGkpN3h3pPRp0GNxPLSghL4nynVWxdOJ1sK9mp58nc/RO1lJFB7rrGdPZC/9bRhdI65fbyxa
 bJyBNLAJObLVEM83fJKSdkTu0EP3XF9rqnScgg==
Received-SPF: permerror client-ip=212.227.126.187;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
index ca98df04952b..8ebb437d1b6a 100644
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
@@ -375,7 +354,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "socket address: [\n");
 
         for (addr = info->socket_address; addr; addr = addr->next) {
-            char *s = SocketAddress_to_str(addr->value);
+            char *s = socket_uri(addr->value);
             monitor_printf(mon, "\t%s\n", s);
             g_free(s);
         }
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 13b5b197f9ea..870a36eb0e93 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1098,6 +1098,26 @@ int unix_connect(const char *path, Error **errp)
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
2.36.1


