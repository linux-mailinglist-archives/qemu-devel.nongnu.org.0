Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6425B6851
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 09:02:21 +0200 (CEST)
Received: from localhost ([::1]:48242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXzw1-0004FG-2w
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 03:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzg0-0000g2-Lr
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:48 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:49601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzfq-0004D8-DD
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:41 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MJWgK-1orrt62jVY-00JtCg; Tue, 13 Sep 2022 08:40:12 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gregory Kurz <gregory.kurz@free.fr>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v8 07/14] net: stream: add unix socket
Date: Tue, 13 Sep 2022 08:39:53 +0200
Message-Id: <20220913064000.79353-8-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913064000.79353-1-lvivier@redhat.com>
References: <20220913064000.79353-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:I6GDG0TuDBfyuBf+9oWyV3ZNoAjApfJ/kjMOgKHr2Szu3PCI3MU
 wANnsCAo9hNv/2Uo4ZhVnfA25egRndjNtaRPl7aEF4Y+ck1C5yfMJ6gCic3BQBic4qTnu82
 RANExhZk7d1q7/WbvcSXadKEiQxsUMBwVcuUtFFPoiz4bnbWJARzpCyc37p3WnL+7ImsXZp
 uTrL/j1BRBk5++SiFyEPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2URYhyQEt4w=:CZbZ7LGlx3ULbcNxwRoRZI
 8PX/iBVH3DlLEPrFqiL76b52DUHFIvi/fVPKtVucha0bOVugEJw/zVytso0sghW26R+549ikG
 tcZGVmOdvc31ekieElOAROYoAxRC3OCsVKhYBhI/4WJAuS+4oV9g3GLMn73AGkRHl7HkpbomB
 sohlGW1EguqG6hh7sXcA2XHSfiHw0W5Dku+h7BZOAGeG2yWdwd7aCilo5gIMNJPJI6XiEPw5Q
 4ayxYn/hf1UmkBOdP9kcooMbjxRcSEUhwb19BwbaHVO7buTUKGQLkgVHWZ0oe47kg/uBfHAVG
 srcqC0NUo0jl63b+ZT8DAQ29nMZYR5sMQUrXSo9dM5CrTl8r0eU3SngRK0efnT1d/zAInIS11
 /WJyTDBYH49l9FOON6BFw0cKf52olsSyYcGnh7S1leNfA16YDf/1UIVVq7nf6ZguaXCkMM0RP
 5EMPoYdcwsVCFakXjZ+BZSJDF6wMnuiuPSyJbMMZSm/pCrMa2vApNawRvAHYxHj3TkWzWoTV7
 n4TQ4cixhGTMc25QIgCBElwCMbzs5vIxJ6EF+VIlsezIHLoya7tTmvsFUgeQJoDSMPmY/1B9k
 BnZ1JE+/3MOm/O+kGi4msrij63uPMcY7OakaOAosKJdv+2FB7KIsZMhaNSNfC4p4zguP0S4s1
 x57U4DRe6q+Ch8jdnlQfCaoQY+Z8mG9eMfRfRuPfXUYACJ+Wm8HWWLlYTW1dLWokPCWRQ7e6a
 /3bDyQZoJt8EKeEFBxE2iUvp+K/N4HzhmGvfTW6xRyH7Fyo4c7RlP32GyAacPL7dzXNqflZAQ
 qTZ8+RV
Received-SPF: permerror client-ip=212.227.126.134;
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
index e02e8001a000..bb96701a49a7 100644
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
index bb16a61bae8e..8870bcce6bcd 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2733,6 +2733,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                configure a network backend to connect to another network\n"
     "                using an UDP tunnel\n"
     "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port\n"
+    "-netdev stream,id=str[,server=on|off],addr.type=unix,addr.path=path\n"
     "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=h\n"
     "                configure a network backend to connect to another network\n"
     "                using a socket connection in stream mode.\n"
-- 
2.37.3


