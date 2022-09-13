Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8AF5B6852
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 09:02:42 +0200 (CEST)
Received: from localhost ([::1]:48244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXzwP-0004PC-0I
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 03:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzg2-0000gK-LM
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:48 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:43605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzft-0004D2-Bt
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:46 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MzCMN-1pUEmb33ad-00wF5h; Tue, 13 Sep 2022 08:40:15 +0200
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
Subject: [PATCH v8 09/14] net: dgram: move mcast specific code from
 net_socket_fd_init_dgram()
Date: Tue, 13 Sep 2022 08:39:55 +0200
Message-Id: <20220913064000.79353-10-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913064000.79353-1-lvivier@redhat.com>
References: <20220913064000.79353-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LwS/Ull+j36yEHiEjALxOVijlBJg6y970acnO3MwZkjMzoNWyM9
 9IlYyXucDrUiP6wHkJcs3KbQPVf0b8SUzE9SCD4MLmwiLDCIMyqVHCy11FBKAtgZJc7fCR4
 bEbb8j/9rRBJaiGQQsHchXE2mq2Jx++nBeek6Ekj/CVmBZF1Glpex2MlsTwKyP0vpMD52L3
 O0Qv3pLOws8B38GJQTjoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mn7yMCJDzWc=:xgUZRFsjJtvxa33d3a+2Cj
 iPsSqSoZVT5mHFqLe6JPiCXCZStnZ7OvUwdmUmdlhvNhCEzD3KV/eKTiBWW+WLHUsBbW2mcKE
 /ocfNhW+eU4NpL65ECZqx08a0HzmXKb1v/2V6fO9PvxmpPflQARG6atmRw91w5SMmViD34w+V
 QrU0zdxhSalYmZQp8x/S4ZYKeBYdvJ7ippAX1ukevJFVqlmBmSfoI3zIyZoe6M2iq3sXNou3D
 fXVmuAPVS+frV0kNWbCRehqCN8I3zwt5F7FWbr4/rX9LyCc0mNUuS0i015eTBi+jhYRN3CNR1
 RW52/VPdwb9DU863Tb+uNb6mI1/FxKnvgNswwGYiQxfuQrTGtqyeIZy2eB3fViSlYc/SgkpP2
 tOX06OYSc3MEsWBkOSxa3H+CBOxwa6ZXoXOzAV+47oBFotUGEIAKGhKtJdSn00/j++hMRrEYt
 nIxtsRxXGtgPceLzeJhI7b7YCRVI29c5nS6qgqzX4wnrZzSyMIgrYav7cAlgatKPP0aoOFaZg
 tN2D2g4Ydvlqw5BT2p5BEwzKc0B5n5hISN/Vu8hKsgk2pkwcVd7PxH6SEq1GntbP03idLu04T
 hQP9SgMAY4vAeboTrvhz6l8mHQixrUMAXlzX0lKf0pcZifyuoDzrfdaOT2nzz9vmdzBnyHoeE
 ZL64LDj764RDi2CB7IHqVsV2rNNpqwOR6O+ldMV7NQzqbSxiTUdrmT8Yh+WbaGdDaBZlWbZxr
 GQZm5roRw8Eg0RSpiarpngQaQblQv8dvUmExfgIGJPUL1dAcb1Ivc0IZDy7YTHegSB+jPJ5SO
 ebbC6uQ
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

It is less complex to manage special cases directly in
net_dgram_mcast_init() and net_dgram_udp_init().

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
---
 net/dgram.c | 143 +++++++++++++++++++++++++++-------------------------
 1 file changed, 73 insertions(+), 70 deletions(-)

diff --git a/net/dgram.c b/net/dgram.c
index dcc2205305c5..16e2d909755c 100644
--- a/net/dgram.c
+++ b/net/dgram.c
@@ -302,52 +302,11 @@ static NetClientInfo net_dgram_socket_info = {
 static NetDgramState *net_dgram_fd_init_dgram(NetClientState *peer,
                                               const char *model,
                                               const char *name,
-                                              int fd, int is_fd,
-                                              SocketAddress *mcast,
+                                              int fd,
                                               Error **errp)
 {
-    struct sockaddr_in *saddr = NULL;
-    int newfd;
     NetClientState *nc;
     NetDgramState *s;
-    SocketAddress *sa;
-    SocketAddressType sa_type;
-
-    sa = socket_local_address(fd, errp);
-    if (!sa) {
-        return NULL;
-    }
-    sa_type = sa->type;
-    qapi_free_SocketAddress(sa);
-
-    /*
-     * fd passed: multicast: "learn" dgram_dst address from bound address and
-     * save it. Because this may be "shared" socket from a "master" process,
-     * datagrams would be recv() by ONLY ONE process: we must "clone" this
-     * dgram socket --jjo
-     */
-
-    if (is_fd && mcast != NULL) {
-            saddr = g_new(struct sockaddr_in, 1);
-
-            if (convert_host_port(saddr, mcast->u.inet.host, mcast->u.inet.port,
-                                  errp) < 0) {
-                goto err;
-            }
-            /* must be bound */
-            if (saddr->sin_addr.s_addr == 0) {
-                error_setg(errp, "can't setup multicast destination address");
-                goto err;
-            }
-            /* clone dgram socket */
-            newfd = net_dgram_mcast_create(saddr, NULL, errp);
-            if (newfd < 0) {
-                goto err;
-            }
-            /* clone newfd to fd, close newfd */
-            dup2(newfd, fd);
-            close(newfd);
-    }
 
     nc = qemu_new_net_client(&net_dgram_socket_info, peer, model, name);
 
@@ -359,24 +318,7 @@ static NetDgramState *net_dgram_fd_init_dgram(NetClientState *peer,
     net_socket_rs_init(&s->rs, net_dgram_rs_finalize, false);
     net_dgram_read_poll(s, true);
 
-    /* mcast: save bound address as dst */
-    if (saddr) {
-        g_assert(s->dgram_dst == NULL);
-        s->dgram_dst = (struct sockaddr *)saddr;
-        snprintf(nc->info_str, sizeof(nc->info_str),
-                 "fd=%d (cloned mcast=%s:%d)",
-                 fd, inet_ntoa(saddr->sin_addr), ntohs(saddr->sin_port));
-    } else {
-        snprintf(nc->info_str, sizeof(nc->info_str), "fd=%d %s", fd,
-                 SocketAddressType_str(sa_type));
-    }
-
     return s;
-
-err:
-    g_free(saddr);
-    closesocket(fd);
-    return NULL;
 }
 
 static void net_dgram_connect(void *opaque)
@@ -421,6 +363,7 @@ static int net_dgram_mcast_init(NetClientState *peer,
     NetDgramState *s;
     int fd, ret;
     struct sockaddr_in *saddr;
+    gchar *info_str;
 
     if (remote->type != SOCKET_ADDRESS_TYPE_INET) {
         error_setg(errp, "multicast only support inet type");
@@ -440,6 +383,9 @@ static int net_dgram_mcast_init(NetClientState *peer,
             g_free(saddr);
             return -1;
         }
+        info_str = g_strdup_printf("mcast=%s:%d",
+                                   inet_ntoa(saddr->sin_addr),
+                                   ntohs(saddr->sin_port));
     } else {
         switch (local->type) {
         case SOCKET_ADDRESS_TYPE_INET: {
@@ -457,9 +403,14 @@ static int net_dgram_mcast_init(NetClientState *peer,
                 g_free(saddr);
                 return -1;
             }
+            info_str = g_strdup_printf("mcast=%s:%d",
+                                       inet_ntoa(saddr->sin_addr),
+                                       ntohs(saddr->sin_port));
             break;
         }
-        case SOCKET_ADDRESS_TYPE_FD:
+        case SOCKET_ADDRESS_TYPE_FD: {
+            int newfd;
+
             fd = monitor_fd_param(monitor_cur(), local->u.fd.str, errp);
             if (fd == -1) {
                 g_free(saddr);
@@ -472,7 +423,46 @@ static int net_dgram_mcast_init(NetClientState *peer,
                                  name, fd);
                 return -1;
             }
+
+            /*
+             * fd passed: multicast: "learn" dgram_dst address from bound
+             * address and save it. Because this may be "shared" socket from a
+             * "master" process, datagrams would be recv() by ONLY ONE process:
+             * we must "clone" this dgram socket --jjo
+             */
+
+            saddr = g_new(struct sockaddr_in, 1);
+
+            if (convert_host_port(saddr, local->u.inet.host, local->u.inet.port,
+                                  errp) < 0) {
+                g_free(saddr);
+                closesocket(fd);
+                return -1;
+            }
+
+            /* must be bound */
+            if (saddr->sin_addr.s_addr == 0) {
+                error_setg(errp, "can't setup multicast destination address");
+                g_free(saddr);
+                closesocket(fd);
+                return -1;
+            }
+            /* clone dgram socket */
+            newfd = net_dgram_mcast_create(saddr, NULL, errp);
+            if (newfd < 0) {
+                g_free(saddr);
+                closesocket(fd);
+                return -1;
+            }
+            /* clone newfd to fd, close newfd */
+            dup2(newfd, fd);
+            close(newfd);
+
+            info_str = g_strdup_printf("fd=%d (cloned mcast=%s:%d)",
+                                       fd, inet_ntoa(saddr->sin_addr),
+                                       ntohs(saddr->sin_port));
             break;
+        }
         default:
             g_free(saddr);
             error_setg(errp, "only support inet or fd type for local");
@@ -480,9 +470,7 @@ static int net_dgram_mcast_init(NetClientState *peer,
         }
     }
 
-    s = net_dgram_fd_init_dgram(peer, model, name, fd,
-                                 local->type == SOCKET_ADDRESS_TYPE_FD,
-                                 remote, errp);
+    s = net_dgram_fd_init_dgram(peer, model, name, fd, errp);
     if (!s) {
         g_free(saddr);
         return -1;
@@ -491,8 +479,8 @@ static int net_dgram_mcast_init(NetClientState *peer,
     g_assert(s->dgram_dst == NULL);
     s->dgram_dst = (struct sockaddr *)saddr;
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str), "mcast=%s:%d",
-             inet_ntoa(saddr->sin_addr), ntohs(saddr->sin_port));
+    pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), info_str);
+    g_free(info_str);
 
     return 0;
 
@@ -571,7 +559,10 @@ static int net_dgram_udp_init(NetClientState *peer,
 
         break;
     }
-    case SOCKET_ADDRESS_TYPE_FD:
+    case SOCKET_ADDRESS_TYPE_FD: {
+        SocketAddress *sa;
+        SocketAddressType sa_type;
+
         fd = monitor_fd_param(monitor_cur(), local->u.fd.str, errp);
         if (fd == -1) {
             return -1;
@@ -582,23 +573,35 @@ static int net_dgram_udp_init(NetClientState *peer,
                              name, fd);
             return -1;
         }
+
+        sa = socket_local_address(fd, errp);
+        if (sa) {
+            sa_type = sa->type;
+            qapi_free_SocketAddress(sa);
+
+            info_str = g_strdup_printf("fd=%d %s", fd,
+                                       SocketAddressType_str(sa_type));
+        } else {
+            info_str = g_strdup_printf("fd=%d", fd);
+        }
         break;
+    }
     default:
         error_setg(errp, "only support inet or fd type for local");
         return -1;
     }
 
-    s = net_dgram_fd_init_dgram(peer, model, name, fd, 0, NULL, errp);
+    s = net_dgram_fd_init_dgram(peer, model, name, fd, errp);
     if (!s) {
         return -1;
     }
 
+    pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), info_str);
+    g_free(info_str);
+
     if (remote) {
         g_assert(s->dgram_dst == NULL);
         s->dgram_dst = dgram_dst;
-
-        pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), info_str);
-        g_free(info_str);
     }
     return 0;
 }
-- 
2.37.3


