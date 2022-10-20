Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B83F6066A3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:03:33 +0200 (CEST)
Received: from localhost ([::1]:58406 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYx6-0005uU-Aw
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:03:29 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYlw-000862-6G
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNT-0004vW-BF
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:47 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:58417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNH-0006za-Hi
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:30 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MN67J-1oUhwb2Rev-00J3Uk; Thu, 20 Oct 2022 18:26:16 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Brivio <sbrivio@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v13 09/17] net: stream: add unix socket
Date: Thu, 20 Oct 2022 18:25:50 +0200
Message-Id: <20221020162558.123284-10-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020162558.123284-1-lvivier@redhat.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HJoK/SQ4yecJoCPq7xEEawRQWKx3wSNpaZhs/VajKL27zjAYq5B
 K2RQsQyga8WfRInABglTV/mkFEiPhbcJvrwM/j78qyLWDb7/y2i9fDQy0dcipjesoZOu1rr
 JFOH1kOqbOyLk9DzN0sl4foEIqJFk8r9J5t+ogX1dw7qEPRuPnWBvcJR0keKxThNBFRg8YF
 Yh8slnv+lCW4PDZ/fXwlA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:g+W0XoDoc5o=:XufBL2ms4qLGCeaDzE4Vo6
 OwRjpzGd1F1fSAK28RIfVSmTfjP5zxBPMWdS+u44EdJ28RVKDl4dLGg1T5qGExABlaVVT13QA
 K5o57nHrPPUc+lWdzosVnWd9VyS2i7DT62RgTEauCYLHo5ntOBmn/VaZEmWwr3w6xpjAjSjpL
 PAh3XhnqgUyi/0HNFnsM6SdeLV0Ero4qWlKFcnJ+f8NCVUumPuolLMlUiHZ4jfIVRTgQo1O4Q
 jnnng/wrFFjtmHaOg2sLbUYCg2+DxUN4bx7SKwjM0bFA8EUy641811Kik0yY/RM+lbSK0XjIE
 G3W5+dEh5AJsVmOsSIuHSLPB68VXWqw3bXS3V48TKXg0FjpaSVTRCVo6IIqkL/173zm+5xZ5i
 5JMdi/06SJYDHK09o6GPQI5gMBUgB+ZSZIba6K1uMz2ecmhX6Q3rS5gwX8BfR/PKe/1GEwTkZ
 5Zy4E+3Uh3n6K6zYdpHOCwFLv0VMsqhvYnQax1HahdcnGkxjpMshkaW01vzBQ6Y/lvP6e980/
 /KNpHhFslkkE+Ex8XpqcQE3XvjSCJT6M3PFZu45jcLemaZV8fV9pmmq1ODPU6/KtcXX40J1Ka
 sEU0l0y6UQQ0rqBNJdld030OqUpF9z5c12+tqAHpR8pQldmpX3jx/eBM9crsfj3WPyxsQN0Ya
 vBZ2iadPqB1OHXssE7sHi/UaxM3NexI0bIFQ2WJkJvX0eS/inHz7V7z4qRJBRnHveQ2tmSySB
 vaStSIobUuw9qYPWB6rHgRuYF+FD88WqiZQ/zMC7fNuK8Yy6Rkf8B2n+oBAxj5UM/3FQ+i20o
 DMy1vlr
Received-SPF: permerror client-ip=212.227.126.134;
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
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com> (QAPI schema)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 net/stream.c    | 107 +++++++++++++++++++++++++++++++++++++++++++++---
 qapi/net.json   |   2 +-
 qemu-options.hx |   1 +
 3 files changed, 104 insertions(+), 6 deletions(-)

diff --git a/net/stream.c b/net/stream.c
index e4388fe7e45c..884f473018da 100644
--- a/net/stream.c
+++ b/net/stream.c
@@ -235,7 +235,7 @@ static NetStreamState *net_stream_fd_init(NetClientState *peer,
 static void net_stream_accept(void *opaque)
 {
     NetStreamState *s = opaque;
-    struct sockaddr_in saddr;
+    struct sockaddr_storage saddr;
     socklen_t len;
     int fd;
 
@@ -253,8 +253,26 @@ static void net_stream_accept(void *opaque)
     s->fd = fd;
     s->nc.link_down = false;
     net_stream_connect(s);
-    qemu_set_info_str(&s->nc, "connection from %s:%d",
-                      inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+    switch (saddr.ss_family) {
+    case AF_INET: {
+        struct sockaddr_in *saddr_in = (struct sockaddr_in *)&saddr;
+
+        qemu_set_info_str(&s->nc, "connection from %s:%d",
+                          inet_ntoa(saddr_in->sin_addr),
+                          ntohs(saddr_in->sin_port));
+        break;
+    }
+    case AF_UNIX: {
+        struct sockaddr_un saddr_un;
+
+        len = sizeof(saddr_un);
+        getsockname(s->listen_fd, (struct sockaddr *)&saddr_un, &len);
+        qemu_set_info_str(&s->nc, "connect from %s", saddr_un.sun_path);
+        break;
+    }
+    default:
+        g_assert_not_reached();
+    }
 }
 
 static int net_stream_server_init(NetClientState *peer,
@@ -294,6 +312,43 @@ static int net_stream_server_init(NetClientState *peer,
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
@@ -337,6 +392,7 @@ static int net_stream_client_init(NetClientState *peer,
 {
     NetStreamState *s;
     struct sockaddr_in saddr_in;
+    struct sockaddr_un saddr_un;
     int fd, connected, ret;
 
     switch (addr->type) {
@@ -373,6 +429,45 @@ static int net_stream_client_init(NetClientState *peer,
             }
         }
         break;
+    case SOCKET_ADDRESS_TYPE_UNIX:
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
+        break;
     case SOCKET_ADDRESS_TYPE_FD:
         fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
         if (fd == -1) {
@@ -387,7 +482,7 @@ static int net_stream_client_init(NetClientState *peer,
         connected = 1;
         break;
     default:
-        error_setg(errp, "only support inet or fd type");
+        error_setg(errp, "only support inet, unix or fd type");
         return -1;
     }
 
@@ -399,13 +494,15 @@ static int net_stream_client_init(NetClientState *peer,
                           inet_ntoa(saddr_in.sin_addr),
                           ntohs(saddr_in.sin_port));
         break;
+    case SOCKET_ADDRESS_TYPE_UNIX:
+        qemu_set_info_str(&s->nc, " connect to %s", saddr_un.sun_path);
+        break;
     case SOCKET_ADDRESS_TYPE_FD:
         qemu_set_info_str(&s->nc, "connect to fd %d", fd);
         break;
     default:
         g_assert_not_reached();
     }
-
     return 0;
 }
 
diff --git a/qapi/net.json b/qapi/net.json
index 185748cc6c6c..aed4ce1a97ff 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -583,7 +583,7 @@
 #        or connect to (server=false)
 # @server: create server socket (default: false)
 #
-# Only SocketAddress types 'inet' and 'fd' are supported.
+# Only SocketAddress types 'unix', 'inet' and 'fd' are supported.
 #
 # Since: 7.2
 ##
diff --git a/qemu-options.hx b/qemu-options.hx
index 396c1d11e1e2..98e2595df93b 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2773,6 +2773,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                configure a network backend to connect to another network\n"
     "                using an UDP tunnel\n"
     "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port\n"
+    "-netdev stream,id=str[,server=on|off],addr.type=unix,addr.path=path\n"
     "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=file-descriptor\n"
     "                configure a network backend to connect to another network\n"
     "                using a socket connection in stream mode.\n"
-- 
2.37.3


