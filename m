Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C333457E747
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 21:22:14 +0200 (CEST)
Received: from localhost ([::1]:37492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEyE0-0002yK-RD
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 15:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExy1-00075c-V9
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:43 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:51485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExxz-0005Jy-V2
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:41 -0400
Received: from thinkpad.redhat.com ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mwfn8-1nGo3T0BVi-00yBWQ; Fri, 22 Jul 2022 21:04:53 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v7 07/14] net: stream: add unix socket
Date: Fri, 22 Jul 2022 21:04:35 +0200
Message-Id: <20220722190442.301310-8-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722190442.301310-1-lvivier@redhat.com>
References: <20220722190442.301310-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:p+qY4YgTwZ9Bnznc88dBTc67dioIYx3XtvVNnctEjmqnif/lT7U
 3cEJKkrex8knHm8wF/TwMnHvf5bAWd1PfblXEmlz7MGdnNKfxNlfM8AkZqvfgeb0nkkLypU
 rhhhsVTZOT+LwTYdmYFaPP4N5HrwGnIe0zwA+Qw5MlFpH+yiNEV+Ow+z8b/MsBe1q36zuij
 N+Je5Muj8F1eBShG3MXeQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sYeHBZ0J7ng=:/+vNc7uvX4K2HR0yFscjN3
 TDNyK26VU3OF6puDtMsgSgPvDMDk2633Wjmd2xVecnERFQ5vv3snFjWXnOzpuJAPfgYTdoqGC
 nYK58oXARluhFW9c2W5d20zOoTXB7MeabDGbX4QWanp3qcfABF7iXT8MTdD7bhqhG49WWp9ZT
 EBEITveQ3cD4YFH5a4qSD3AcLotyDIxD+tQTww8OqFE4LEBA+0LMUkkmuFPxE9FFktpL4cQqB
 F4RpXJ/roNiTr1uDvpzRzl2CANfVbaeIXW5ucdx7YMUgHOqwALWmNxSAU4Z6n7wbHKIIbpq+S
 mpBiRnGtKsd/uuUZnHkV+jQgf51DiHd/q1V95suQl0OdKplfLFk44HoyV0De0qT4d2eU640i3
 jhizzbLKfA8Rnbb38+5ERcmzG/EfhKvhRCW10hOJB1BZGw0bII0eJ/3TVfjWp18phfjSBucBE
 qdFbXsi4/H+8RZh0SV65gxGXhl+8pB7Bwl3Gu/pAVMtNp+npbZmSoiIxEd5N81EIpnSSUNOXe
 AqveGTQEYDLWNkV4a92n1jTk4xqIeB97eHtdXJe6NVyERI6vU1bjaXpZ5+1v6vfHbsLgOqSPb
 auaM5+vmyw+GiuAdEbZHH3PkCVzVwwjCq+I+Vu7gMEUHqAkOlfTtcXeqR+230YnbJV/RUN/Cd
 /wRFQdYdWL7P7WB0mwDB9BwZAue8j2DryCDCM2f+LpSp8lkzbP4JAl9u/2NOsOJXwjBLSU1BF
 o9PCi507capuAcL/PDq0iT+tEoLJzUOMwruJ6A==
Received-SPF: permerror client-ip=212.227.126.130;
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

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
---
 net/stream.c    | 108 +++++++++++++++++++++++++++++++++++++++++++++---
 qapi/net.json   |   2 +-
 qemu-options.hx |   1 +
 3 files changed, 105 insertions(+), 6 deletions(-)

diff --git a/net/stream.c b/net/stream.c
index e8afbaca50b6..0f91ff20df61 100644
--- a/net/stream.c
+++ b/net/stream.c
@@ -235,7 +235,7 @@ static NetStreamState *net_stream_fd_init_stream(NetClientState *peer,
 static void net_stream_accept(void *opaque)
 {
     NetStreamState *s = opaque;
-    struct sockaddr_in saddr;
+    struct sockaddr_storage saddr;
     socklen_t len;
     int fd;
 
@@ -253,9 +253,27 @@ static void net_stream_accept(void *opaque)
     s->fd = fd;
     s->nc.link_down = false;
     net_stream_connect(s);
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "connection from %s:%d",
-             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+    switch (saddr.ss_family) {
+    case AF_INET: {
+        struct sockaddr_in *saddr_in = (struct sockaddr_in *)&saddr;
+
+        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
+                 "connection from %s:%d",
+                 inet_ntoa(saddr_in->sin_addr), ntohs(saddr_in->sin_port));
+        break;
+    }
+    case AF_UNIX: {
+        struct sockaddr_un saddr_un;
+
+        len = sizeof(saddr_un);
+        getsockname(s->listen_fd, (struct sockaddr *)&saddr_un, &len);
+        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
+                 "connect from %s", saddr_un.sun_path);
+        break;
+    }
+    default:
+        g_assert_not_reached();
+    }
 }
 
 static int net_stream_server_init(NetClientState *peer,
@@ -295,6 +313,43 @@ static int net_stream_server_init(NetClientState *peer,
         }
         break;
     }
+    case SOCKET_ADDRESS_TYPE_UNIX: {
+        struct sockaddr_un saddr_un;
+
+        ret = unlink(addr->u.q_unix.path);
+        if (ret < 0 && errno != ENOENT) {
+            error_setg_errno(errp, errno, "failed to unlink socket %s",
+                             addr->u.q_unix.path);
+            return -1;
+        }
+
+        saddr_un.sun_family = PF_UNIX;
+        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
+                       addr->u.q_unix.path);
+        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
+            error_setg(errp, "UNIX socket path '%s' is too long",
+                       addr->u.q_unix.path);
+            error_append_hint(errp, "Path must be less than %zu bytes\n",
+                              sizeof(saddr_un.sun_path));
+            return -1;
+        }
+
+        fd = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
+        if (fd < 0) {
+            error_setg_errno(errp, errno, "can't create stream socket");
+            return -1;
+        }
+        qemu_socket_set_nonblock(fd);
+
+        ret = bind(fd, (struct sockaddr *)&saddr_un, sizeof(saddr_un));
+        if (ret < 0) {
+            error_setg_errno(errp, errno, "can't create socket with path: %s",
+                             saddr_un.sun_path);
+            closesocket(fd);
+            return -1;
+        }
+        break;
+    }
     case SOCKET_ADDRESS_TYPE_FD:
         fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
         if (fd == -1) {
@@ -380,6 +435,49 @@ static int net_stream_client_init(NetClientState *peer,
                                    ntohs(saddr_in.sin_port));
         break;
     }
+    case SOCKET_ADDRESS_TYPE_UNIX: {
+        struct sockaddr_un saddr_un;
+
+        saddr_un.sun_family = PF_UNIX;
+        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
+                       addr->u.q_unix.path);
+        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
+            error_setg(errp, "UNIX socket path '%s' is too long",
+                       addr->u.q_unix.path);
+            error_append_hint(errp, "Path must be less than %zu bytes\n",
+                              sizeof(saddr_un.sun_path));
+            return -1;
+        }
+
+        fd = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
+        if (fd < 0) {
+            error_setg_errno(errp, errno, "can't create stream socket");
+            return -1;
+        }
+        qemu_socket_set_nonblock(fd);
+
+        connected = 0;
+        for (;;) {
+            ret = connect(fd, (struct sockaddr *)&saddr_un, sizeof(saddr_un));
+            if (ret < 0) {
+                if (errno == EINTR || errno == EWOULDBLOCK) {
+                    /* continue */
+                } else if (errno == EAGAIN ||
+                           errno == EALREADY) {
+                    break;
+                } else {
+                    error_setg_errno(errp, errno, "can't connect socket");
+                    closesocket(fd);
+                    return -1;
+                }
+            } else {
+                connected = 1;
+                break;
+            }
+        }
+        info_str = g_strdup_printf(" connect to %s", saddr_un.sun_path);
+        break;
+    }
     case SOCKET_ADDRESS_TYPE_FD:
         fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
         if (fd == -1) {
@@ -395,7 +493,7 @@ static int net_stream_client_init(NetClientState *peer,
         info_str = g_strdup_printf("connect to fd %d", fd);
         break;
     default:
-        error_setg(errp, "only support inet or fd type");
+        error_setg(errp, "only support inet, unix or fd type");
         return -1;
     }
 
diff --git a/qapi/net.json b/qapi/net.json
index a7506a40ff12..518f288758b0 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -583,7 +583,7 @@
 #        or connect to (server=false)
 # @server: create server socket (default: true)
 #
-# Only SocketAddress types 'inet' and 'fd' are supported.
+# Only SocketAddress types 'unix', 'inet' and 'fd' are supported.
 #
 # Since: 7.1
 ##
diff --git a/qemu-options.hx b/qemu-options.hx
index 170117e1adf0..827a951a9ef2 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2727,6 +2727,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                configure a network backend to connect to another network\n"
     "                using an UDP tunnel\n"
     "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port\n"
+    "-netdev stream,id=str[,server=on|off],addr.type=unix,addr.path=path\n"
     "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=h\n"
     "                configure a network backend to connect to another network\n"
     "                using a socket connection in stream mode.\n"
-- 
2.37.1


