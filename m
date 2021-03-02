Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F3832A90A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:12:36 +0100 (CET)
Received: from localhost ([::1]:46234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9VZ-0007ZN-CU
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1lH9MJ-0001gN-V1
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:03:01 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:36564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1lH9M9-0008Jv-BA
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:02:59 -0500
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 23B5C2E14F1;
 Tue,  2 Mar 2021 21:02:47 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 itqAQmwSu5-2jxqXt4S; Tue, 02 Mar 2021 21:02:47 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1614708167; bh=4dP4btjH/JUluQZrX9OiL/COvOORU8agWRC4rEjZ/cw=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=g4K6OptbJ9pfErgzapKX07gXk0MxSoJLFK8KxtTqMf8/YjaBa1ezWVYCMUzJ916ea
 TTWTEf/erLYHxnRieJigvi8MRr1v35kKFHxQlFsGwpI6BqYDO0wRmtU/asT7prATh7
 aeIrQWCSrAHtSsdzgRq/aMB1l7NSH4jZobn9XFOc=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8002::1:1a])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 onVeXhLyoo-2io0bRhB; Tue, 02 Mar 2021 21:02:45 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v6 3/5] net: Move NetClientState.info_str to dynamic
 allocations
Date: Tue,  2 Mar 2021 21:02:03 +0300
Message-Id: <20210302180205.5009-4-lekiravi@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302180205.5009-1-lekiravi@yandex-team.ru>
References: <20210302180205.5009-1-lekiravi@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=lekiravi@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org, Vincenzo Maffione <v.maffione@gmail.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The info_str field of the NetClientState structure is static and has a size
of 256 bytes. This amount is often unclaimed, and the field itself is used
exclusively for HMP "info network".

The patch translates info_str to dynamic memory allocation.

This action is also allows us to painlessly discard usage of this field
for backend devices.

Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
---
 hw/net/xen_nic.c  |  5 ++---
 include/net/net.h |  2 +-
 net/l2tpv3.c      |  3 +--
 net/net.c         | 14 ++++++++------
 net/slirp.c       |  5 ++---
 net/socket.c      | 43 ++++++++++++++++++++++++-------------------
 net/tap-win32.c   |  3 +--
 net/tap.c         | 13 +++++--------
 net/vde.c         |  3 +--
 net/vhost-user.c  |  3 +--
 net/vhost-vdpa.c  |  2 +-
 11 files changed, 47 insertions(+), 49 deletions(-)

diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index 5c815b4f0c..8431808ea0 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -296,9 +296,8 @@ static int net_init(struct XenLegacyDevice *xendev)
     netdev->nic = qemu_new_nic(&net_xen_info, &netdev->conf,
                                "xen", NULL, netdev);
 
-    snprintf(qemu_get_queue(netdev->nic)->info_str,
-             sizeof(qemu_get_queue(netdev->nic)->info_str),
-             "nic: xenbus vif macaddr=%s", netdev->mac);
+    qemu_get_queue(netdev->nic)->info_str = g_strdup_printf(
+        "nic: xenbus vif macaddr=%s", netdev->mac);
 
     /* fill info */
     xenstore_write_be_int(&netdev->xendev, "feature-rx-copy", 1);
diff --git a/include/net/net.h b/include/net/net.h
index 162fd3f1b5..7039eb280a 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -94,7 +94,7 @@ struct NetClientState {
     NetQueue *incoming_queue;
     char *model;
     char *name;
-    char info_str[256];
+    char *info_str;
     NetdevInfo *stored_config;
     unsigned receive_disabled : 1;
     NetClientDestructor *destructor;
diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index 8aa0a3e1a0..96611cb4af 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -730,8 +730,7 @@ int net_init_l2tpv3(const Netdev *netdev,
     QAPI_CLONE_MEMBERS(NetdevL2TPv3Options,
                        &nc->stored_config->u.l2tpv3, l2tpv3);
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "l2tpv3: connected");
+    s->nc.info_str = g_strdup_printf("l2tpv3: connected");
     return 0;
 outerr:
     qemu_del_net_client(nc);
diff --git a/net/net.c b/net/net.c
index 9b213f72d2..cc83918d80 100644
--- a/net/net.c
+++ b/net/net.c
@@ -128,11 +128,12 @@ char *qemu_mac_strdup_printf(const uint8_t *macaddr)
 
 void qemu_format_nic_info_str(NetClientState *nc, uint8_t macaddr[6])
 {
-    snprintf(nc->info_str, sizeof(nc->info_str),
-             "model=%s,macaddr=%02x:%02x:%02x:%02x:%02x:%02x",
-             nc->model,
-             macaddr[0], macaddr[1], macaddr[2],
-             macaddr[3], macaddr[4], macaddr[5]);
+    g_free(nc->info_str);
+    nc->info_str = g_strdup_printf(
+        "model=%s,macaddr=%02x:%02x:%02x:%02x:%02x:%02x",
+        nc->model,
+        macaddr[0], macaddr[1], macaddr[2],
+        macaddr[3], macaddr[4], macaddr[5]);
 }
 
 static int mac_table[256] = {0};
@@ -351,6 +352,7 @@ static void qemu_free_net_client(NetClientState *nc)
     }
     g_free(nc->name);
     g_free(nc->model);
+    g_free(nc->info_str);
     qapi_free_NetdevInfo(nc->stored_config);
     if (nc->destructor) {
         nc->destructor(nc);
@@ -1197,7 +1199,7 @@ void print_net_client(Monitor *mon, NetClientState *nc)
     monitor_printf(mon, "%s: index=%d,type=%s,%s\n", nc->name,
                    nc->queue_index,
                    NetClientDriver_str(nc->info->type),
-                   nc->info_str);
+                   nc->info_str ? nc->info_str : "");
     if (!QTAILQ_EMPTY(&nc->filters)) {
         monitor_printf(mon, "filters:\n");
     }
diff --git a/net/slirp.c b/net/slirp.c
index 5f126d7cf5..f8b3636fcc 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -669,9 +669,8 @@ static int net_slirp_init(NetClientState *peer, const char *model,
         stored->tftp_server_name = g_strdup(tftp_server_name);
     }
 
-    snprintf(nc->info_str, sizeof(nc->info_str),
-             "net=%s,restrict=%s", inet_ntoa(net),
-             restricted ? "on" : "off");
+    nc->info_str = g_strdup_printf("net=%s,restrict=%s", inet_ntoa(net),
+                                   restricted ? "on" : "off");
 
     s = DO_UPCAST(SlirpState, nc, nc);
 
diff --git a/net/socket.c b/net/socket.c
index 1614523b82..98172347d7 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -180,7 +180,8 @@ static void net_socket_send(void *opaque)
         s->fd = -1;
         net_socket_rs_init(&s->rs, net_socket_rs_finalize, false);
         s->nc.link_down = true;
-        memset(s->nc.info_str, 0, sizeof(s->nc.info_str));
+        g_free(s->nc.info_str);
+        s->nc.info_str = g_new0(char, 1);
 
         return;
     }
@@ -400,16 +401,16 @@ static NetSocketState *net_socket_fd_init_dgram(NetClientState *peer,
         stored->mcast = g_strdup(mcast);
 
         s->dgram_dst = saddr;
-        snprintf(nc->info_str, sizeof(nc->info_str),
-                 "socket: fd=%d (cloned mcast=%s:%d)",
-                 fd, inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+        nc->info_str = g_strdup_printf("socket: fd=%d (cloned mcast=%s:%d)",
+                                       fd, inet_ntoa(saddr.sin_addr),
+                                       ntohs(saddr.sin_port));
     } else {
         if (sa_type == SOCKET_ADDRESS_TYPE_UNIX) {
             s->dgram_dst.sin_family = AF_UNIX;
         }
 
-        snprintf(nc->info_str, sizeof(nc->info_str),
-                 "socket: fd=%d %s", fd, SocketAddressType_str(sa_type));
+        nc->info_str = g_strdup_printf("socket: fd=%d %s",
+                                       fd, SocketAddressType_str(sa_type));
     }
 
     return s;
@@ -444,7 +445,7 @@ static NetSocketState *net_socket_fd_init_stream(NetClientState *peer,
 
     nc = qemu_new_net_client(&net_socket_info, peer, model, name);
 
-    snprintf(nc->info_str, sizeof(nc->info_str), "socket: fd=%d", fd);
+    nc->info_str = g_strdup_printf("socket: fd=%d", fd);
 
     s = DO_UPCAST(NetSocketState, nc, nc);
 
@@ -528,9 +529,10 @@ static void net_socket_accept(void *opaque)
     stored->has_fd = true;
     stored->fd = g_strdup_printf("%d", fd);
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "socket: connection from %s:%d",
-             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+    g_free(s->nc.info_str);
+    s->nc.info_str = g_strdup_printf("socket: connection from %s:%d",
+                                     inet_ntoa(saddr.sin_addr),
+                                     ntohs(saddr.sin_port));
 }
 
 static int net_socket_listen_init(NetClientState *peer,
@@ -645,9 +647,10 @@ static int net_socket_connect_init(NetClientState *peer,
     stored->has_connect = true;
     stored->connect = g_strdup(host_str);
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "socket: connect to %s:%d",
-             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+    g_free(s->nc.info_str);
+    s->nc.info_str = g_strdup_printf("socket: connect to %s:%d",
+                                     inet_ntoa(saddr.sin_addr),
+                                     ntohs(saddr.sin_port));
     return 0;
 }
 
@@ -704,9 +707,10 @@ static int net_socket_mcast_init(NetClientState *peer,
         stored->localaddr = g_strdup(localaddr_str);
     }
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "socket: mcast=%s:%d",
-             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+    g_free(s->nc.info_str);
+    s->nc.info_str = g_strdup_printf("socket: mcast=%s:%d",
+                                     inet_ntoa(saddr.sin_addr),
+                                     ntohs(saddr.sin_port));
     return 0;
 
 }
@@ -769,9 +773,10 @@ static int net_socket_udp_init(NetClientState *peer,
     stored->has_udp = true;
     stored->udp = g_strdup(rhost);
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "socket: udp=%s:%d",
-             inet_ntoa(raddr.sin_addr), ntohs(raddr.sin_port));
+    g_free(s->nc.info_str);
+    s->nc.info_str = g_strdup_printf("socket: udp=%s:%d",
+                                     inet_ntoa(raddr.sin_addr),
+                                     ntohs(raddr.sin_port));
     return 0;
 }
 
diff --git a/net/tap-win32.c b/net/tap-win32.c
index b60933bd1a..0888db8cce 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -787,8 +787,7 @@ static int tap_win32_init(NetClientState *peer, const char *model,
     stored->has_ifname = true;
     stored->ifname = g_strdup(ifname);
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "tap: ifname=%s", ifname);
+    s->nc.info_str = g_strdup_printf("tap: ifname=%s", ifname);
 
     s->handle = handle;
 
diff --git a/net/tap.c b/net/tap.c
index 8041245ba7..f864f434b2 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -625,8 +625,7 @@ int net_init_bridge(const Netdev *netdev, const char *name,
         stored->helper = g_strdup(helper);
     }
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str), "helper=%s,br=%s", helper,
-             br);
+    s->nc.info_str = g_strdup_printf("helper=%s,br=%s", helper, br);
 
     return 0;
 }
@@ -714,7 +713,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             g_free(tmp_s);
         }
 
-        snprintf(s->nc.info_str, sizeof(s->nc.info_str), "fd=%d", fd);
+        s->nc.info_str = g_strdup_printf("fd=%d", fd);
     } else if (tap->has_helper) {
         if (!stored->has_helper) {
             stored->has_helper = true;
@@ -727,8 +726,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
                                        g_strdup(DEFAULT_BRIDGE_INTERFACE);
         }
 
-        snprintf(s->nc.info_str, sizeof(s->nc.info_str), "helper=%s",
-                 tap->helper);
+        s->nc.info_str = g_strdup_printf("helper=%s", tap->helper);
     } else {
         if (ifname && !stored->has_ifname) {
             stored->has_ifname = true;
@@ -745,9 +743,8 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             stored->downscript = g_strdup(downscript);
         }
 
-        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-                 "ifname=%s,script=%s,downscript=%s", ifname, script,
-                 downscript);
+        s->nc.info_str = g_strdup_printf("ifname=%s,script=%s,downscript=%s",
+                                         ifname, script, downscript);
 
         if (strcmp(downscript, "no") != 0) {
             snprintf(s->down_script, sizeof(s->down_script), "%s", downscript);
diff --git a/net/vde.c b/net/vde.c
index b0b8800571..67de6eb0c5 100644
--- a/net/vde.c
+++ b/net/vde.c
@@ -100,8 +100,7 @@ static int net_vde_init(NetClientState *peer, const char *model,
 
     nc = qemu_new_net_client(&net_vde_info, peer, model, name);
 
-    snprintf(nc->info_str, sizeof(nc->info_str), "sock=%s,fd=%d",
-             sock, vde_datafd(vde));
+    nc->info_str = g_strdup_printf("sock=%s,fd=%d", sock, vde_datafd(vde));
 
     s = DO_UPCAST(VDEState, nc, nc);
 
diff --git a/net/vhost-user.c b/net/vhost-user.c
index 5b7056be25..49c9a740c2 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -327,8 +327,7 @@ static int net_vhost_user_init(NetClientState *peer, const char *device,
     user = g_new0(struct VhostUserState, 1);
     for (i = 0; i < queues; i++) {
         nc = qemu_new_net_client(&net_vhost_user_info, peer, device, name);
-        snprintf(nc->info_str, sizeof(nc->info_str), "vhost-user%d to %s",
-                 i, chr->label);
+        nc->info_str = g_strdup_printf("vhost-user%d to %s", i, chr->label);
         nc->queue_index = i;
         if (!nc0) {
             nc0 = nc;
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 8c27ea0142..423d71770d 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -200,7 +200,7 @@ static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
     stored->has_queues = true;
     stored->queues = 1; /* TODO: change when support multiqueue */
 
-    snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
+    nc->info_str = g_strdup_printf(TYPE_VHOST_VDPA);
     nc->queue_index = 0;
     s = DO_UPCAST(VhostVDPAState, nc, nc);
     vdpa_device_fd = qemu_open_old(vhostdev, O_RDWR);
-- 
2.25.1


