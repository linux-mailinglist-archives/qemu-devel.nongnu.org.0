Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4159D1790E8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 14:09:12 +0100 (CET)
Received: from localhost ([::1]:34058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9Tlv-0004rL-83
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 08:09:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37255)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lekiravi@yandex-team.ru>) id 1j9TkM-0002sg-RS
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 08:07:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lekiravi@yandex-team.ru>) id 1j9TkL-0001OF-5q
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 08:07:34 -0500
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:44946)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lekiravi@yandex-team.ru>)
 id 1j9TkH-00019i-HZ; Wed, 04 Mar 2020 08:07:29 -0500
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
 [IPv6:2a02:6b8:0:1402::301])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 13D102E1649;
 Wed,  4 Mar 2020 16:07:27 +0300 (MSK)
Received: from sas1-9998cec34266.qloud-c.yandex.net
 (sas1-9998cec34266.qloud-c.yandex.net [2a02:6b8:c14:3a0e:0:640:9998:cec3])
 by mxbackcorp1g.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 9Imv48VQsj-7NESTh5B; Wed, 04 Mar 2020 16:07:26 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1583327247; bh=tTDvuiSO8FFJBQlIbfJ4TO8Uc4zxjf0cSMuuGhZLZT0=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=AIsqSV/iOe/tcW44q8wqeElZn3bbSNMmxNGBUhstrIG49W+B1NH78k/azN61vuBAr
 9AX76wjxsiE0L/T7u7G4hh3bLZDdlCmMnw2SE8W4lf0VaM+aa+G9Ylpm70Nz1X/O9a
 sJwkvMkF9rCSCoGcm1q7v+acvjiUecXTeOnsU4EA=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red.dhcp.yndx.net (dynamic-red.dhcp.yndx.net
 [2a02:6b8:0:40c:b4f7:3f29:4fea:8822])
 by sas1-9998cec34266.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ujb0Gsh6CR-7NWOtUTS; Wed, 04 Mar 2020 16:07:23 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Eric Blake <eblake@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 3/4] hmp: Use QMP query-netdevs in hmp_info_network
Date: Wed,  4 Mar 2020 16:06:55 +0300
Message-Id: <20200304130656.16859-4-lekiravi@yandex-team.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200304130656.16859-1-lekiravi@yandex-team.ru>
References: <20200304130656.16859-1-lekiravi@yandex-team.ru>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a02:6b8:0:1472:2741:0:8b6:217
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Vincenzo Maffione <v.maffione@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 yc-core@yandex-team.ru, Stefan Weil <sw@weilnetz.de>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 xen-devel@lists.xenproject.org, Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
 Luigi Rizzo <rizzo@iet.unipi.it>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Alexey Kirillov <lekiravi@yandex-team.ru>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace legacy field info_str of NetClientState with
result of QMP command query-netdevs.

Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
---
 include/net/net.h |   3 +-
 net/clients.h     |   1 +
 net/hub.c         |   4 +-
 net/hub.h         |   2 +-
 net/net.c         | 175 ++++++++++++++++++++++++++++++++++++++++++++--
 net/vde.c         |  10 +++
 6 files changed, 186 insertions(+), 9 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 2c8956c0b3..9df4680937 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -171,7 +171,8 @@ void qemu_check_nic_model(NICInfo *nd, const char *model);
 int qemu_find_nic_model(NICInfo *nd, const char * const *models,
                         const char *default_model);
 
-void print_net_client(Monitor *mon, NetClientState *nc);
+void print_net_client(Monitor *mon, NetClientState *nc,
+                      NetdevInfoList *ni_list);
 void hmp_info_network(Monitor *mon, const QDict *qdict);
 void net_socket_rs_init(SocketReadState *rs,
                         SocketReadStateFinalize *finalize,
diff --git a/net/clients.h b/net/clients.h
index a6ef267e19..f439933522 100644
--- a/net/clients.h
+++ b/net/clients.h
@@ -51,6 +51,7 @@ int net_init_l2tpv3(const Netdev *netdev, const char *name,
 #ifdef CONFIG_VDE
 int net_init_vde(const Netdev *netdev, const char *name,
                  NetClientState *peer, Error **errp);
+int net_vde_get_fd(const NetClientState *nc);
 #endif
 
 #ifdef CONFIG_NETMAP
diff --git a/net/hub.c b/net/hub.c
index 37995b5517..cce970b59d 100644
--- a/net/hub.c
+++ b/net/hub.c
@@ -252,7 +252,7 @@ NetClientState *net_hub_port_find(int hub_id)
 /**
  * Print hub configuration
  */
-void net_hub_info(Monitor *mon)
+void net_hub_info(Monitor *mon, NetdevInfoList *ni_list)
 {
     NetHub *hub;
     NetHubPort *port;
@@ -263,7 +263,7 @@ void net_hub_info(Monitor *mon)
             monitor_printf(mon, " \\ %s", port->nc.name);
             if (port->nc.peer) {
                 monitor_printf(mon, ": ");
-                print_net_client(mon, port->nc.peer);
+                print_net_client(mon, port->nc.peer, ni_list);
             } else {
                 monitor_printf(mon, "\n");
             }
diff --git a/net/hub.h b/net/hub.h
index 66d3322fac..424658a4a2 100644
--- a/net/hub.h
+++ b/net/hub.h
@@ -19,7 +19,7 @@
 NetClientState *net_hub_add_port(int hub_id, const char *name,
                                  NetClientState *hubpeer);
 NetClientState *net_hub_find_client_by_name(int hub_id, const char *name);
-void net_hub_info(Monitor *mon);
+void net_hub_info(Monitor *mon, NetdevInfoList *ninfo);
 void net_hub_check_clients(void);
 bool net_hub_flush(NetClientState *nc);
 
diff --git a/net/net.c b/net/net.c
index 01e0548295..1a8153dbf7 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1271,14 +1271,176 @@ static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
     monitor_printf(mon, "\n");
 }
 
-void print_net_client(Monitor *mon, NetClientState *nc)
+static NetdevInfo *get_netdev_info(NetdevInfoList *ni_list, char *name)
+{
+    NetdevInfo *ni;
+
+    while (ni_list) {
+        ni = ni_list->value;
+        if (g_str_equal(ni->id, name)) {
+            return ni;
+        }
+        ni_list = ni_list->next;
+    }
+
+    return NULL;
+}
+
+static char *generate_info_str(NetdevInfo *ni, NetClientState *nc)
+{
+    char *info_str;
+
+    if (!ni) {
+        return g_malloc0(1);
+    }
+
+    switch (ni->type) {
+        case NET_CLIENT_DRIVER_NIC: {
+            info_str = g_strdup_printf("model=%s,macaddr=%s",
+                                       ni->u.nic.model,
+                                       ni->u.nic.macaddr);
+            break;
+        }
+#ifdef CONFIG_SLIRP
+        case NET_CLIENT_DRIVER_USER: {
+            size_t len = strchr(ni->u.user.net, '/') - ni->u.user.net;
+            char *net = g_strndup(ni->u.user.net, len);
+
+            info_str = g_strdup_printf("net=%s,restrict=%s",
+                                       net,
+                                       ni->u.user.q_restrict ? "on" : "off");
+            g_free(net);
+            break;
+        }
+#endif /* CONFIG_SLIRP */
+        case NET_CLIENT_DRIVER_TAP: {
+#ifndef _WIN32
+            if (ni->u.tap.has_fds) {
+                char **fds = g_strsplit(ni->u.tap.fds, ":", -1);
+
+                info_str = g_strdup_printf("fd=%s", fds[nc->queue_index]);
+                g_strfreev(fds);
+            } else if (ni->u.tap.has_helper) {
+                info_str = g_strdup_printf("helper=%s", ni->u.tap.helper);
+            } else {
+                info_str = g_strdup_printf("ifname=%s,script=%s,downscript=%s",
+                    ni->u.tap.ifname,
+                    nc->queue_index == 0 ? ni->u.tap.script : "no",
+                    nc->queue_index == 0 ? ni->u.tap.downscript : "no");
+            }
+#else
+            info_str = g_strdup_printf("tap: ifname=%s", ni->u.tap.ifname);
+#endif /* _WIN32 */
+            break;
+        }
+#ifdef CONFIG_L2TPV3
+        case NET_CLIENT_DRIVER_L2TPV3: {
+            info_str = g_strdup_printf("l2tpv3: connected");
+            break;
+        }
+#endif /* CONFIG_L2TPV3 */
+        case NET_CLIENT_DRIVER_SOCKET: {
+            if (ni->u.socket.has_listen) {
+                if (ni->u.socket.has_fd) {
+                    info_str = g_strdup_printf("socket: connection from %s",
+                                               ni->u.socket.listen);
+                } else {
+                    info_str = g_strdup_printf("socket: wait from %s",
+                                               ni->u.socket.listen);
+                }
+            } else if (ni->u.socket.has_connect && ni->u.socket.has_fd) {
+                info_str = g_strdup_printf("socket: connect to %s",
+                                           ni->u.socket.connect);
+            } else if (ni->u.socket.has_mcast && ni->u.socket.has_fd) {
+                info_str = g_strdup_printf("socket: mcast=%s",
+                                           ni->u.socket.mcast);
+            } else if (ni->u.socket.has_udp && ni->u.socket.has_fd) {
+                info_str = g_strdup_printf("socket: udp=%s", ni->u.socket.udp);
+            } else {
+                g_assert(ni->u.socket.has_fd);
+                int so_type = -1;
+                int optlen = sizeof(so_type);
+                int fd = atoi(ni->u.socket.fd);
+
+                getsockopt(fd, SOL_SOCKET, SO_TYPE, (char *)&so_type,
+                           (socklen_t *)&optlen);
+                if (so_type == SOCK_STREAM) {
+                    info_str = g_strdup_printf("socket: fd=%s",
+                                               ni->u.socket.fd);
+                } else {
+                    if (ni->u.socket.has_mcast) {
+                        /*
+                         * This branch is unreachable, according to how it is in
+                         * net/socket.c at this moment
+                         */
+                        info_str = g_strdup_printf("socket: fd=%s "
+                                                   "(cloned mcast=%s)",
+                                                   ni->u.socket.fd,
+                                                   ni->u.socket.mcast);
+                    } else {
+                        SocketAddress *sa = socket_local_address(fd, NULL);
+
+                        info_str = g_strdup_printf("socket: fd=%s %s",
+                            ni->u.socket.fd,
+                            SocketAddressType_str(sa->type));
+                        qapi_free_SocketAddress(sa);
+                    }
+                }
+            }
+            break;
+        }
+#ifdef CONFIG_VDE
+        case NET_CLIENT_DRIVER_VDE: {
+            info_str = g_strdup_printf("sock=%s,fd=%d",
+                                       ni->u.vde.sock,
+                                       net_vde_get_fd(nc));
+            break;
+        }
+#endif /* CONFIG_VDE */
+#ifdef CONFIG_NET_BRIDGE
+        case NET_CLIENT_DRIVER_BRIDGE: {
+            info_str = g_strdup_printf("helper=%s,br=%s",
+                                       ni->u.bridge.helper,
+                                       ni->u.bridge.br);
+            break;
+        }
+#endif /* CONFIG_NET_BRIDGE */
+#ifdef CONFIG_NETMAP
+        case NET_CLIENT_DRIVER_NETMAP: {
+            info_str = g_strdup_printf("netmap: ifname=%s",
+                                       ni->u.netmap.ifname);
+            break;
+        }
+#endif /* CONFIG_NETMAP */
+#ifdef CONFIG_VHOST_NET_USER
+        case NET_CLIENT_DRIVER_VHOST_USER: {
+            info_str = g_strdup_printf("vhost-user%d to %s",
+                                       nc->queue_index,
+                                       ni->u.vhost_user.chardev);
+            break;
+        }
+#endif /* CONFIG_VHOST_NET_USER */
+        default: {
+            info_str = g_malloc0(1);
+            break;
+        }
+    }
+
+    return info_str;
+}
+
+void print_net_client(Monitor *mon, NetClientState *nc, NetdevInfoList *ni_list)
 {
     NetFilterState *nf;
+    NetdevInfo *ni = get_netdev_info(ni_list, nc->name);
+    char *info_str = generate_info_str(ni, nc);
 
     monitor_printf(mon, "%s: index=%d,type=%s,%s\n", nc->name,
                    nc->queue_index,
                    NetClientDriver_str(nc->info->type),
-                   nc->info_str);
+                   info_str);
+    g_free(info_str);
+
     if (!QTAILQ_EMPTY(&nc->filters)) {
         monitor_printf(mon, "filters:\n");
     }
@@ -1415,8 +1577,9 @@ void hmp_info_network(Monitor *mon, const QDict *qdict)
 {
     NetClientState *nc, *peer;
     NetClientDriver type;
+    NetdevInfoList *ni_list = qmp_query_netdevs(NULL);
 
-    net_hub_info(mon);
+    net_hub_info(mon, ni_list);
 
     QTAILQ_FOREACH(nc, &net_clients, next) {
         peer = nc->peer;
@@ -1428,13 +1591,15 @@ void hmp_info_network(Monitor *mon, const QDict *qdict)
         }
 
         if (!peer || type == NET_CLIENT_DRIVER_NIC) {
-            print_net_client(mon, nc);
+            print_net_client(mon, nc, ni_list);
         } /* else it's a netdev connected to a NIC, printed with the NIC */
         if (peer && type == NET_CLIENT_DRIVER_NIC) {
             monitor_printf(mon, " \\ ");
-            print_net_client(mon, peer);
+            print_net_client(mon, peer, ni_list);
         }
     }
+
+    qapi_free_NetdevInfoList(ni_list);
 }
 
 void colo_notify_filters_event(int event, Error **errp)
diff --git a/net/vde.c b/net/vde.c
index c0ab2bb65c..c4edf5cba1 100644
--- a/net/vde.c
+++ b/net/vde.c
@@ -153,3 +153,13 @@ int net_init_vde(const Netdev *netdev, const char *name,
 
     return 0;
 }
+
+int net_vde_get_fd(const NetClientState *nc)
+{
+    VDEState *s;
+    assert(nc->info->type == NET_CLIENT_DRIVER_VDE);
+
+    s = DO_UPCAST(VDEState, nc, nc);
+
+    return vde_datafd(s->vde);
+}
-- 
2.17.1


