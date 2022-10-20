Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C4C605B8A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 11:53:40 +0200 (CEST)
Received: from localhost ([::1]:34158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSF9-0005h8-9A
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:53:39 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olS0q-000150-Bg
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfk-000307-Aa
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:17:04 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:60183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfi-0005K8-AP
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:17:04 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MMGZS-1oVZFE1lEk-00JNv6; Thu, 20 Oct 2022 11:16:50 +0200
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
 Markus Armbruster <armbru@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v12 12/17] net: dgram: add unix socket
Date: Thu, 20 Oct 2022 11:16:19 +0200
Message-Id: <20221020091624.48368-13-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020091624.48368-1-lvivier@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BVZEx5zvFGBOysZ1DDE1pAa5ophVRfiUasBIqXl9s0Eso95KI5c
 P1qLV0nQ6xqpZgLe+bFJ41uUJxk/1gu1rq6fQbaJISXUwsgNDhtD0Jlu3+o8ktyvqeWxjtM
 N/WtShaYg09S9N+AFDB2pRfSBUPtPsOawMZdffykNOijJRmZLf+zbEOkxWhRxlUwa14DeCi
 8hdBZWoVo4RTLK4UQQEPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PyQrMzdLpxs=:tfWoNznLtpDAoxYGj9QDcu
 kJ3KjYTfFxe/hY6YjwJr9OYHc+IpcTDsagRzYPoH3VWNmb5Ff+PtHvvoAU79Wb8JnficAuieJ
 aXUBrcS70CYHBdNO0TSn/yC4rZiz+lLbpNj3bZkOX2hcrdX3MTdJsL2FAQPC4hxcOmSmcDpmz
 EPIcwLTFB8bkjrfWX2oLsqdjGeMrOhBmqXBnJsoo8NZ1C8HDsRo7C07IEd+OlipKBP4CsbsiK
 mOJy3hRxoeO40vL8GkiQexUtIMWHmx0N9i2xytgH//AsymdC8vP0xGujP0pTot1UQIvdTL107
 AeAyZliftb50BhCHkQ9o4gujcT8E69Ul+zR8G5RU5nIHl6X/BkUtP4oUZv/TxerL04aX0PpPq
 LyWPctknmuwGVVRn1Gzm+5y6StciJbAqV3SwwkJw/WJ2QHBqhNzFK2VA2x1+1880d2IOJ6Gt2
 QFX7r8NjVygVI9HBiNoW7vXWAoEH6ksXfjU6JxYrX1+vXJEpro/fAcSI4vcPjLYWvIyGtaXTY
 p1Q1oI+yZ61sNoxYXSPvZTi4an3RftZy7pjD6yrnpIYLRZ8z6mkUGte4dOVl1EOSrwAnvqpyE
 E38X0yyPK///63k8sdYp8r9FOyHg5INB7iP8j0PCBrKs29QaPbKIw3alTVPgS2tNMrFHqvOQ1
 wWtxzfwxPRdEUdVzfc/X+175M52jIGUeL8WPqc7spKCqj8HRqQ9TAZGHznN0Pe752IcbbO8dv
 KxrafO9A9+fklzckOutBE7HYPgWqJZgVkcijRfl/VMEVF1JQrhC3Pt8UUTvNvl8ZQwOAhr7+v
 pJYpLqz
Received-SPF: permerror client-ip=212.227.126.187;
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

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>
---
 net/dgram.c     | 54 ++++++++++++++++++++++++++++++++++++++++++++++++-
 qapi/net.json   |  2 +-
 qemu-options.hx |  1 +
 3 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/net/dgram.c b/net/dgram.c
index e581cc62f39f..02a189e36358 100644
--- a/net/dgram.c
+++ b/net/dgram.c
@@ -426,6 +426,7 @@ int net_init_dgram(const Netdev *netdev, const char *name,
     SocketAddress *remote, *local;
     struct sockaddr *dest_addr;
     struct sockaddr_in laddr_in, raddr_in;
+    struct sockaddr_un laddr_un, raddr_un;
     socklen_t dest_len;
 
     assert(netdev->type == NET_CLIENT_DRIVER_DGRAM);
@@ -465,7 +466,7 @@ int net_init_dgram(const Netdev *netdev, const char *name,
         }
     } else {
         if (local->type != SOCKET_ADDRESS_TYPE_FD) {
-            error_setg(errp, "type=inet requires remote parameter");
+            error_setg(errp, "type=inet or unix require remote parameter");
             return -1;
         }
     }
@@ -508,6 +509,53 @@ int net_init_dgram(const Netdev *netdev, const char *name,
         dest_addr = g_malloc(dest_len);
         memcpy(dest_addr, &raddr_in, dest_len);
         break;
+    case SOCKET_ADDRESS_TYPE_UNIX:
+        ret = unlink(local->u.q_unix.path);
+        if (ret < 0 && errno != ENOENT) {
+            error_setg_errno(errp, errno, "failed to unlink socket %s",
+                             local->u.q_unix.path);
+            return -1;
+        }
+
+        laddr_un.sun_family = PF_UNIX;
+        ret = snprintf(laddr_un.sun_path, sizeof(laddr_un.sun_path), "%s",
+                       local->u.q_unix.path);
+        if (ret < 0 || ret >= sizeof(laddr_un.sun_path)) {
+            error_setg(errp, "UNIX socket path '%s' is too long",
+                       local->u.q_unix.path);
+            error_append_hint(errp, "Path must be less than %zu bytes\n",
+                              sizeof(laddr_un.sun_path));
+        }
+
+        raddr_un.sun_family = PF_UNIX;
+        ret = snprintf(raddr_un.sun_path, sizeof(raddr_un.sun_path), "%s",
+                       remote->u.q_unix.path);
+        if (ret < 0 || ret >= sizeof(raddr_un.sun_path)) {
+            error_setg(errp, "UNIX socket path '%s' is too long",
+                       remote->u.q_unix.path);
+            error_append_hint(errp, "Path must be less than %zu bytes\n",
+                              sizeof(raddr_un.sun_path));
+        }
+
+        fd = qemu_socket(PF_UNIX, SOCK_DGRAM, 0);
+        if (fd < 0) {
+            error_setg_errno(errp, errno, "can't create datagram socket");
+            return -1;
+        }
+
+        ret = bind(fd, (struct sockaddr *)&laddr_un, sizeof(laddr_un));
+        if (ret < 0) {
+            error_setg_errno(errp, errno, "can't bind unix=%s to socket",
+                             laddr_un.sun_path);
+            closesocket(fd);
+            return -1;
+        }
+        qemu_socket_set_nonblock(fd);
+
+        dest_len = sizeof(raddr_un);
+        dest_addr = g_malloc(dest_len);
+        memcpy(dest_addr, &raddr_un, dest_len);
+        break;
     case SOCKET_ADDRESS_TYPE_FD:
         fd = monitor_fd_param(monitor_cur(), local->u.fd.str, errp);
         if (fd == -1) {
@@ -546,6 +594,10 @@ int net_init_dgram(const Netdev *netdev, const char *name,
                           inet_ntoa(raddr_in.sin_addr),
                           ntohs(raddr_in.sin_port));
         break;
+    case SOCKET_ADDRESS_TYPE_UNIX:
+        qemu_set_info_str(&s->nc, "udp=%s:%s",
+                          laddr_un.sun_path, raddr_un.sun_path);
+        break;
     case SOCKET_ADDRESS_TYPE_FD: {
         SocketAddress *sa;
         SocketAddressType sa_type;
diff --git a/qapi/net.json b/qapi/net.json
index aed4ce1a97ff..39388b1b6c41 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -600,7 +600,7 @@
 # @remote: remote address
 # @local: local address
 #
-# Only SocketAddress types 'inet' and 'fd' are supported.
+# Only SocketAddress types 'unix', 'inet' and 'fd' are supported.
 #
 # If remote address is present and it's a multicast address, local address
 # is optional. Otherwise local address is required and remote address is
diff --git a/qemu-options.hx b/qemu-options.hx
index 98e2595df93b..fafb214cb89f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2782,6 +2782,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                configure a network backend to connect to a multicast maddr and port\n"
     "                use ``local.host=addr`` to specify the host address to send packets from\n"
     "-netdev dgram,id=str,local.type=inet,local.host=addr,local.port=port[,remote.type=inet,remote.host=addr,remote.port=port]\n"
+    "-netdev dgram,id=str,local.type=unix,local.path=path[,remote.type=unix,remote.path=path]\n"
     "-netdev dgram,id=str,local.type=fd,local.str=file-descriptor\n"
     "                configure a network backend to connect to another network\n"
     "                using an UDP tunnel\n"
-- 
2.37.3


