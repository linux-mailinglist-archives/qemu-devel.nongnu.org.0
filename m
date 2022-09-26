Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A315EB1E0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 22:12:17 +0200 (CEST)
Received: from localhost ([::1]:51500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocuSc-0003HG-A6
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 16:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu8H-0008Na-Vd
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:14 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:50847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu8F-0005xy-TL
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:13 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MIbzB-1oR8YE49sT-00Edfe; Mon, 26 Sep 2022 21:51:04 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v9 12/16] qemu-sockets: move and rename SocketAddress_to_str()
Date: Mon, 26 Sep 2022 21:50:44 +0200
Message-Id: <20220926195048.487915-13-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926195048.487915-1-lvivier@redhat.com>
References: <20220926195048.487915-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kvA6iAh7e5TOzUsEmkPTRpDjZaleDrD634YBx9lNApRGXiXPVGp
 4dhhJD/SQU+zWLYH2oXxm09t4sVzNTa3/9CrojRXRKqveCjDhcol+n7sX5CEnMvFYaEw+BL
 0LSNIfKlP+Em3QXTjBzoqx3B0VxJJLiWOaNsdRgSn1mmx7S9HThBem/9+x6Ed6BMH7W5A4y
 SjmGayjyFgnsdkMuAR33w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xhQ//rE73EI=:Rkk8QueZvYZNtDMyPIDeV9
 J+q8aIaO9PAJUGskbIfndx0lJcq5M/DizkW38Pq2eHcfDsoev7xPSs8r915k64lSmcdQyMFV/
 6HxXhe+wuFtt9QuNscBUBnr6KOuuJ0GZK8lLsQqtob4AMEusnwKwOiLGB2qH4VmeE3eEG/xdo
 K8WLovXQmBKFgw2iElK6ZBorVTtnvOD6Jv5EHo+eB0ZwW4Vz0g/pZRVbxqc+/sEtuwPxnjAcQ
 StuIChCyWcKGFzmsaCgO033dkPjdAfnZW2PZS77P9VpmhspgZGnv39WpgUGLiI4tx5vQezf16
 Ect3GMIKgu7+U52UQTNGNYtVDuEXR/7Eu5B8w54qHAQOXS1Ht02R9LwlaWt82P0HGPZ4fhcgT
 8Qlb5eUWJ9E9ToBYtPp/Bs7VgjgBPeCBL5zeks9pKU8+p/tezmXSrTwzCQStT8mt23MLO9Zaf
 Bw4/L5pTtdj7Dt4lQ9pkvihdlz7eb9iEU1TWQPNYb71fv6wAAT03OHZ9rGXRpCdjwUCKyfQlN
 RPWTPVZL0wn/1zV2QZx5ExBPm4voy5fXAcu98NPNJa//R8sD1a5v1WUMpfkNC95Buaa+jcdEe
 9Kix+7QkUVANFT/LdTTYjI7tAt1vfVsXOAQv2x5qPBvPvbyuRoD4RAJHm7m0uSXROP87gf1kj
 VlkfoaMTvJOrjCRbScZlaGkvK4NNQXB9BXNMjqsoT68wyRJAlGytyDZuwzGYFTeEoFkoWgeAr
 A9l7K/aGvI5Eckam3sGmz3g116AQPC6qP51VV/2V7v/Ik/VxqhnibXhBn/I7Dlq5SgwThcd5p
 s7aN4Eu
Received-SPF: permerror client-ip=212.227.126.135;
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


