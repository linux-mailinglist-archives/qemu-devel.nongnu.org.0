Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647CC5B6848
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 09:00:28 +0200 (CEST)
Received: from localhost ([::1]:50504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXzuF-00030F-F6
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 03:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzfu-0000fg-5b
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:48 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:42359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzfm-0004A6-Gs
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:36 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M3Eqr-1obZQI3CSj-003ahn; Tue, 13 Sep 2022 08:40:15 +0200
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
Subject: [PATCH v8 10/14] net: dgram: add unix socket
Date: Tue, 13 Sep 2022 08:39:56 +0200
Message-Id: <20220913064000.79353-11-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913064000.79353-1-lvivier@redhat.com>
References: <20220913064000.79353-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3NlENlUt21lZDDp5bO2KwFS6OjNH4eaN2cy+wMmRd8M5NWDVx8s
 KzG2Ru/XtQGEmtwRSZMvImpggWN4gfOre5PeV7JWTvJC43zA8IYThQ7pkRJrCKYI24p/vuH
 Ps5BCFRmFTOD/HPt6fO1Nbllz2yNreXzBziiG1Cd/y1hTCBytlMbypOPL/c0L1HbLA4ax8R
 Y8I46wtlya43M00qWf3XA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tzWcNqmAP1Y=:CMnmk6nupdAv8yksUk//vI
 UAmVa+/JK+YUL/C/KAWtu9eI1YWhkDv/dHiIZEQXHzeHluxiSTGwMlo5x0B7Nb2PFmAxS6yyR
 XAKaHL+HggidwAwntHiB+bvkyIIDEo7tIEHE7ePpqUA7cKfA4YsLEcwK9YEDOSk7q7g9DNA4r
 tyrv+VYmHT4CEm+uQs0Kyx9F+3L77e9pPIf2XA5L5KkT7Pfjl4d2c5J27TtVI81f2kaV0MH9q
 IlzP0ooclUQE0Oj2JMJpt1KQx1ygsK1Wzn5tyfQi3ViLAWiddcnU+K92gL4b0dvbVbBpLvoiu
 hnmRgSz9tUu/6moq/Hjk3GHA6y12MwJ0mHBeAWAoAYgXxXbF015QhkvlnreSHHjfo9vde50mk
 8VjCBhbLh2PEdiULvjuX3AOvcOKiJn5R4nEjqQBvd+0/GWYa1aW2R3/r5j54KptAHLjr6YQpf
 JP0HauaUvnfiPNkhO3Q1INlIkXr18siLfP7wqeo13a5/P2k4TzqdNq/EYAWxNYeliCm2G2tir
 qdyluW/Xhk36tOEnoMuq6xQpZ2YZO8HrSDU1UPQ4A+thpioOJg2rl7GQmk4SG0fCi7WKAblXg
 jXqRVFaMElVbR/A9ghroRHV1yooxdX12ZdKs1Vm/mzyCs70kfedFxTggY7+/De39nBzlB0eO5
 ryyU3eW76UM2mFKKPukIpCbx9Z5Bf8h7lFwehAcDQ2BU1jV2nnfwqknCUNUCYW1gbNLvmg/uD
 DmVDtztw3HPHQaiDDiFc0X+t/p0mrmdhF1/jgTpKxncHOY1jzN6hn2Fd2Xkg2AHgd15kZ7HE8
 WQcwN8m
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
 net/dgram.c     | 65 ++++++++++++++++++++++++++++++++++++++++++++++---
 qapi/net.json   |  2 +-
 qemu-options.hx |  1 +
 3 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/net/dgram.c b/net/dgram.c
index 16e2d909755c..9f3eafee3b67 100644
--- a/net/dgram.c
+++ b/net/dgram.c
@@ -86,8 +86,15 @@ static ssize_t net_dgram_receive_dgram(NetClientState *nc,
 
     do {
         if (s->dgram_dst) {
-            ret = sendto(s->fd, buf, size, 0, s->dgram_dst,
-                         sizeof(struct sockaddr_in));
+            socklen_t len;
+
+            if (s->dgram_dst->sa_family == AF_INET) {
+                len = sizeof(struct sockaddr_in);
+            } else {
+                len = sizeof(struct sockaddr_un);
+            }
+
+            ret = sendto(s->fd, buf, size, 0, s->dgram_dst, len);
         } else {
             ret = send(s->fd, buf, size, 0);
         }
@@ -509,7 +516,7 @@ static int net_dgram_udp_init(NetClientState *peer,
         }
     } else {
         if (local->type != SOCKET_ADDRESS_TYPE_FD) {
-            error_setg(errp, "type=inet requires remote parameter");
+            error_setg(errp, "type=inet or unix require remote parameter");
             return -1;
         }
     }
@@ -559,6 +566,58 @@ static int net_dgram_udp_init(NetClientState *peer,
 
         break;
     }
+    case SOCKET_ADDRESS_TYPE_UNIX: {
+        struct sockaddr_un laddr_un, raddr_un;
+
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
+        dgram_dst = g_malloc(sizeof(raddr_un));
+        memcpy(dgram_dst, &raddr_un, sizeof(raddr_un));
+
+        info_str = g_strdup_printf("udp=%s:%s",
+                                   laddr_un.sun_path, raddr_un.sun_path);
+        break;
+    }
     case SOCKET_ADDRESS_TYPE_FD: {
         SocketAddress *sa;
         SocketAddressType sa_type;
diff --git a/qapi/net.json b/qapi/net.json
index bb96701a49a7..9cc4be7535bb 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -600,7 +600,7 @@
 # @remote: remote address
 # @local: local address
 #
-# Only SocketAddress types 'inet' and 'fd' are supported.
+# Only SocketAddress types 'unix', 'inet' and 'fd' are supported.
 #
 # The code checks there is at least one of these options and reports an error
 # if not. If remote address is present and it's a multicast address, local
diff --git a/qemu-options.hx b/qemu-options.hx
index 8870bcce6bcd..ee2436ae14a7 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2742,6 +2742,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                configure a network backend to connect to a multicast maddr and port\n"
     "                use ``local.host=addr`` to specify the host address to send packets from\n"
     "-netdev dgram,id=str,local.type=inet,local.host=addr,local.port=port[,remote.type=inet,remote.host=addr,remote.port=port]\n"
+    "-netdev dgram,id=str,local.type=unix,local.path=path[,remote.type=unix,remote.path=path]\n"
     "-netdev dgram,id=str,local.type=fd,local.str=h\n"
     "                configure a network backend to connect to another network\n"
     "                using an UDP tunnel\n"
-- 
2.37.3


