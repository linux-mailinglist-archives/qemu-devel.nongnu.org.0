Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA327607508
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:34:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpMD-00039U-TL
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:34:30 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo2c-0003uZ-Db
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2J-0003Mv-RU
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:09:54 -0400
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2H-0001ap-US
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:09:51 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MDgxt-1ovOxI0zPb-00AmPP; Fri, 21 Oct 2022 11:09:39 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v14 09/17] net: stream: add unix socket
Date: Fri, 21 Oct 2022 11:09:14 +0200
Message-Id: <20221021090922.170074-10-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021090922.170074-1-lvivier@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AV2lG9hA5qh6jdvV7vYHx4BwdiWeVyu1SsntwDCDTMWUkAJgckP
 0RP5ZhNCfXz/NO/1I4l2Wxn5kkHFc3nx0i0QhLkMFo7Io7anJjws9zS1kxXwhD2HSVPxq64
 PJnv13nvgwe/MFm0SpUJwr3d7YSX3xU8DOGlJMaDmH4QxLlaqpQLfwCb7oGMCu437tOT8uj
 SbBO50VMgJ+kA3O/aqusg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eKAce30NA6o=:P7ekYlHk/wHXznaJR1BW3U
 Y5Pj19NLWe5uCShE/HjsuoQ2mpZhCLFvoq7nD1PY+Jt4En7yU32KDAtfLf+o6E0T7nlLMed7d
 PW8rJoezqtrulLMawc/kEB652YrQJRW8S9JlWqnnUMYiAKTV/bw6cHmGZOc3jPeBY2kqnQ74f
 aZ3Jd5+yxdQnqDGxwrtV5vHAub6xQjipVL++tyxMuTRAhjWhsRs45avr+FukrC1fuXpvRIkc/
 rZ0p9560tYDMOBU22l3bVHmmHZxQdWrqvTXE3v293wScyHv8ipaDKMwugW/2PHxD2RYanQh7B
 NN2fHUDFt3PLj946P5RU7mjEMGJLHPnP2ROPC8HmAY0IiqTm8xDAKHDYm5IdMj9/FeVmyFa7A
 8NDif0WxWMGvZjXCNIWbCwrWRu0+A/H6Q/e75TGE+ywAg1BWsu0u6FZvlxJTiWKqFcctvzZew
 2x6Qds7cY7sfwiFxMESZjJ7cm9vwtYBCiKH/b9Lw/cXV7uUZUVpY9X9UrFYDGfgXakigV2zym
 zJcFwIsz2W8T72uUXPeQWy5GqQzwJYMjaDkN+PSFOsmSPDwKmh5NslLUdPEYAh2qHsSP8+2BL
 J5XJ3p1dc8Jlpx0wsvawSyEsrhJLmcG5XRL8iEiklijAWm4toKjU/2jWoES0RCPMYrPRGFCcO
 SZUCln8J5bylvga0YpXrS6nvn5ZOViZ0gmxlDeAmRaOMUMQ+DMR+DaD9Q5sct/88c3WRu/yvp
 jGXbG1OxhKIRzdFj08ZUxoMeZAuUvnn5at5szzusgf8I6cExB5YwOZd1kpcvq8BYKGEiyeelG
 Wot34X7
Received-SPF: permerror client-ip=212.227.17.13;
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


