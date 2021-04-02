Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230ED352758
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 10:19:35 +0200 (CEST)
Received: from localhost ([::1]:55186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSF1i-0008DX-7j
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 04:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lSEy6-0003B7-Cg
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:15:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lSExu-0003yH-6n
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617351336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N/Y6BdUbf+YR8jj5WJfl1vJcqg6WhTL0pOALarr0lkU=;
 b=AwNdvj4MZH0pRjwKXFKPEg5VeQwGVnT1s6RKVADHJmcCJ/c+sl2nSGOndcL/16aZ3UUHx7
 1hD3ZBWBNIfTTHC48DaYNFc3ATGhmdwJ6JQLRtaWN12iHiy3eB4PCXcim4saSfkrO7Izw6
 aA8SUJDrpsCmrWLw2kWNtYXAAtzvf6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-KZxcISrBNhC9eSt-3-D0Og-1; Fri, 02 Apr 2021 04:15:34 -0400
X-MC-Unique: KZxcISrBNhC9eSt-3-D0Og-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7FDD180FCA6;
 Fri,  2 Apr 2021 08:15:33 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-26.pek2.redhat.com [10.72.12.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5739361F20;
 Fri,  2 Apr 2021 08:15:32 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	lekiravi@yandex-team.ru
Subject: [PATCH 3/5] Revert "net: Move NetClientState.info_str to dynamic
 allocations"
Date: Fri,  2 Apr 2021 16:15:17 +0800
Message-Id: <20210402081519.78878-4-jasowang@redhat.com>
In-Reply-To: <20210402081519.78878-1-jasowang@redhat.com>
References: <20210402081519.78878-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Several issues has been reported for query-netdev info
series. Consider it's late in the rc, this reverts commitThis reverts
commit 59b5437eb732d6b103a9bc279c3482c834d1eff9.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/xen_nic.c  |  5 +++--
 include/net/net.h |  2 +-
 net/l2tpv3.c      |  3 ++-
 net/net.c         | 14 ++++++--------
 net/slirp.c       |  5 +++--
 net/socket.c      | 43 +++++++++++++++++++------------------------
 net/tap-win32.c   |  3 ++-
 net/tap.c         | 13 ++++++++-----
 net/vde.c         |  3 ++-
 net/vhost-user.c  |  3 ++-
 net/vhost-vdpa.c  |  2 +-
 11 files changed, 49 insertions(+), 47 deletions(-)

diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index 8431808ea0..5c815b4f0c 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -296,8 +296,9 @@ static int net_init(struct XenLegacyDevice *xendev)
     netdev->nic = qemu_new_nic(&net_xen_info, &netdev->conf,
                                "xen", NULL, netdev);
 
-    qemu_get_queue(netdev->nic)->info_str = g_strdup_printf(
-        "nic: xenbus vif macaddr=%s", netdev->mac);
+    snprintf(qemu_get_queue(netdev->nic)->info_str,
+             sizeof(qemu_get_queue(netdev->nic)->info_str),
+             "nic: xenbus vif macaddr=%s", netdev->mac);
 
     /* fill info */
     xenstore_write_be_int(&netdev->xendev, "feature-rx-copy", 1);
diff --git a/include/net/net.h b/include/net/net.h
index 3559f3ca19..e5ba61cf8d 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -94,7 +94,7 @@ struct NetClientState {
     NetQueue *incoming_queue;
     char *model;
     char *name;
-    char *info_str;
+    char info_str[256];
     NetdevInfo *stored_config;
     unsigned receive_disabled : 1;
     NetClientDestructor *destructor;
diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index 96611cb4af..8aa0a3e1a0 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -730,7 +730,8 @@ int net_init_l2tpv3(const Netdev *netdev,
     QAPI_CLONE_MEMBERS(NetdevL2TPv3Options,
                        &nc->stored_config->u.l2tpv3, l2tpv3);
 
-    s->nc.info_str = g_strdup_printf("l2tpv3: connected");
+    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
+             "l2tpv3: connected");
     return 0;
 outerr:
     qemu_del_net_client(nc);
diff --git a/net/net.c b/net/net.c
index 277da712eb..9a2a6ab155 100644
--- a/net/net.c
+++ b/net/net.c
@@ -129,12 +129,11 @@ char *qemu_mac_strdup_printf(const uint8_t *macaddr)
 
 void qemu_format_nic_info_str(NetClientState *nc, uint8_t macaddr[6])
 {
-    g_free(nc->info_str);
-    nc->info_str = g_strdup_printf(
-        "model=%s,macaddr=%02x:%02x:%02x:%02x:%02x:%02x",
-        nc->model,
-        macaddr[0], macaddr[1], macaddr[2],
-        macaddr[3], macaddr[4], macaddr[5]);
+    snprintf(nc->info_str, sizeof(nc->info_str),
+             "model=%s,macaddr=%02x:%02x:%02x:%02x:%02x:%02x",
+             nc->model,
+             macaddr[0], macaddr[1], macaddr[2],
+             macaddr[3], macaddr[4], macaddr[5]);
 }
 
 static int mac_table[256] = {0};
@@ -353,7 +352,6 @@ static void qemu_free_net_client(NetClientState *nc)
     }
     g_free(nc->name);
     g_free(nc->model);
-    g_free(nc->info_str);
     qapi_free_NetdevInfo(nc->stored_config);
     if (nc->destructor) {
         nc->destructor(nc);
@@ -1228,7 +1226,7 @@ void print_net_client(Monitor *mon, NetClientState *nc)
     monitor_printf(mon, "%s: index=%d,type=%s,%s\n", nc->name,
                    nc->queue_index,
                    NetClientDriver_str(nc->info->type),
-                   nc->info_str ? nc->info_str : "");
+                   nc->info_str);
     if (!QTAILQ_EMPTY(&nc->filters)) {
         monitor_printf(mon, "filters:\n");
     }
diff --git a/net/slirp.c b/net/slirp.c
index 67f0f1d925..b3b979845e 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -674,8 +674,9 @@ static int net_slirp_init(NetClientState *peer, const char *model,
         stored->tftp_server_name = g_strdup(tftp_server_name);
     }
 
-    nc->info_str = g_strdup_printf("net=%s,restrict=%s", inet_ntoa(net),
-                                   restricted ? "on" : "off");
+    snprintf(nc->info_str, sizeof(nc->info_str),
+             "net=%s,restrict=%s", inet_ntoa(net),
+             restricted ? "on" : "off");
 
     s = DO_UPCAST(SlirpState, nc, nc);
 
diff --git a/net/socket.c b/net/socket.c
index 98172347d7..1614523b82 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -180,8 +180,7 @@ static void net_socket_send(void *opaque)
         s->fd = -1;
         net_socket_rs_init(&s->rs, net_socket_rs_finalize, false);
         s->nc.link_down = true;
-        g_free(s->nc.info_str);
-        s->nc.info_str = g_new0(char, 1);
+        memset(s->nc.info_str, 0, sizeof(s->nc.info_str));
 
         return;
     }
@@ -401,16 +400,16 @@ static NetSocketState *net_socket_fd_init_dgram(NetClientState *peer,
         stored->mcast = g_strdup(mcast);
 
         s->dgram_dst = saddr;
-        nc->info_str = g_strdup_printf("socket: fd=%d (cloned mcast=%s:%d)",
-                                       fd, inet_ntoa(saddr.sin_addr),
-                                       ntohs(saddr.sin_port));
+        snprintf(nc->info_str, sizeof(nc->info_str),
+                 "socket: fd=%d (cloned mcast=%s:%d)",
+                 fd, inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
     } else {
         if (sa_type == SOCKET_ADDRESS_TYPE_UNIX) {
             s->dgram_dst.sin_family = AF_UNIX;
         }
 
-        nc->info_str = g_strdup_printf("socket: fd=%d %s",
-                                       fd, SocketAddressType_str(sa_type));
+        snprintf(nc->info_str, sizeof(nc->info_str),
+                 "socket: fd=%d %s", fd, SocketAddressType_str(sa_type));
     }
 
     return s;
@@ -445,7 +444,7 @@ static NetSocketState *net_socket_fd_init_stream(NetClientState *peer,
 
     nc = qemu_new_net_client(&net_socket_info, peer, model, name);
 
-    nc->info_str = g_strdup_printf("socket: fd=%d", fd);
+    snprintf(nc->info_str, sizeof(nc->info_str), "socket: fd=%d", fd);
 
     s = DO_UPCAST(NetSocketState, nc, nc);
 
@@ -529,10 +528,9 @@ static void net_socket_accept(void *opaque)
     stored->has_fd = true;
     stored->fd = g_strdup_printf("%d", fd);
 
-    g_free(s->nc.info_str);
-    s->nc.info_str = g_strdup_printf("socket: connection from %s:%d",
-                                     inet_ntoa(saddr.sin_addr),
-                                     ntohs(saddr.sin_port));
+    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
+             "socket: connection from %s:%d",
+             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
 }
 
 static int net_socket_listen_init(NetClientState *peer,
@@ -647,10 +645,9 @@ static int net_socket_connect_init(NetClientState *peer,
     stored->has_connect = true;
     stored->connect = g_strdup(host_str);
 
-    g_free(s->nc.info_str);
-    s->nc.info_str = g_strdup_printf("socket: connect to %s:%d",
-                                     inet_ntoa(saddr.sin_addr),
-                                     ntohs(saddr.sin_port));
+    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
+             "socket: connect to %s:%d",
+             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
     return 0;
 }
 
@@ -707,10 +704,9 @@ static int net_socket_mcast_init(NetClientState *peer,
         stored->localaddr = g_strdup(localaddr_str);
     }
 
-    g_free(s->nc.info_str);
-    s->nc.info_str = g_strdup_printf("socket: mcast=%s:%d",
-                                     inet_ntoa(saddr.sin_addr),
-                                     ntohs(saddr.sin_port));
+    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
+             "socket: mcast=%s:%d",
+             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
     return 0;
 
 }
@@ -773,10 +769,9 @@ static int net_socket_udp_init(NetClientState *peer,
     stored->has_udp = true;
     stored->udp = g_strdup(rhost);
 
-    g_free(s->nc.info_str);
-    s->nc.info_str = g_strdup_printf("socket: udp=%s:%d",
-                                     inet_ntoa(raddr.sin_addr),
-                                     ntohs(raddr.sin_port));
+    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
+             "socket: udp=%s:%d",
+             inet_ntoa(raddr.sin_addr), ntohs(raddr.sin_port));
     return 0;
 }
 
diff --git a/net/tap-win32.c b/net/tap-win32.c
index 959266c658..2a2ba4f527 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -797,7 +797,8 @@ static int tap_win32_init(NetClientState *peer, const char *model,
     stored->has_ifname = true;
     stored->ifname = g_strdup(ifname);
 
-    s->nc.info_str = g_strdup_printf("tap: ifname=%s", ifname);
+    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
+             "tap: ifname=%s", ifname);
 
     s->handle = handle;
 
diff --git a/net/tap.c b/net/tap.c
index 522ce7e487..35895192c5 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -635,7 +635,8 @@ int net_init_bridge(const Netdev *netdev, const char *name,
         stored->helper = g_strdup(helper);
     }
 
-    s->nc.info_str = g_strdup_printf("helper=%s,br=%s", helper, br);
+    snprintf(s->nc.info_str, sizeof(s->nc.info_str), "helper=%s,br=%s", helper,
+             br);
 
     return 0;
 }
@@ -723,7 +724,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             g_free(tmp_s);
         }
 
-        s->nc.info_str = g_strdup_printf("fd=%d", fd);
+        snprintf(s->nc.info_str, sizeof(s->nc.info_str), "fd=%d", fd);
     } else if (tap->has_helper) {
         if (!stored->has_helper) {
             stored->has_helper = true;
@@ -736,7 +737,8 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
                                        g_strdup(DEFAULT_BRIDGE_INTERFACE);
         }
 
-        s->nc.info_str = g_strdup_printf("helper=%s", tap->helper);
+        snprintf(s->nc.info_str, sizeof(s->nc.info_str), "helper=%s",
+                 tap->helper);
     } else {
         if (ifname && !stored->has_ifname) {
             stored->has_ifname = true;
@@ -753,8 +755,9 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             stored->downscript = g_strdup(downscript);
         }
 
-        s->nc.info_str = g_strdup_printf("ifname=%s,script=%s,downscript=%s",
-                                         ifname, script, downscript);
+        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
+                 "ifname=%s,script=%s,downscript=%s", ifname, script,
+                 downscript);
 
         if (strcmp(downscript, "no") != 0) {
             snprintf(s->down_script, sizeof(s->down_script), "%s", downscript);
diff --git a/net/vde.c b/net/vde.c
index 67de6eb0c5..b0b8800571 100644
--- a/net/vde.c
+++ b/net/vde.c
@@ -100,7 +100,8 @@ static int net_vde_init(NetClientState *peer, const char *model,
 
     nc = qemu_new_net_client(&net_vde_info, peer, model, name);
 
-    nc->info_str = g_strdup_printf("sock=%s,fd=%d", sock, vde_datafd(vde));
+    snprintf(nc->info_str, sizeof(nc->info_str), "sock=%s,fd=%d",
+             sock, vde_datafd(vde));
 
     s = DO_UPCAST(VDEState, nc, nc);
 
diff --git a/net/vhost-user.c b/net/vhost-user.c
index 49c9a740c2..5b7056be25 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -327,7 +327,8 @@ static int net_vhost_user_init(NetClientState *peer, const char *device,
     user = g_new0(struct VhostUserState, 1);
     for (i = 0; i < queues; i++) {
         nc = qemu_new_net_client(&net_vhost_user_info, peer, device, name);
-        nc->info_str = g_strdup_printf("vhost-user%d to %s", i, chr->label);
+        snprintf(nc->info_str, sizeof(nc->info_str), "vhost-user%d to %s",
+                 i, chr->label);
         nc->queue_index = i;
         if (!nc0) {
             nc0 = nc;
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 423d71770d..8c27ea0142 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -200,7 +200,7 @@ static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
     stored->has_queues = true;
     stored->queues = 1; /* TODO: change when support multiqueue */
 
-    nc->info_str = g_strdup_printf(TYPE_VHOST_VDPA);
+    snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
     nc->queue_index = 0;
     s = DO_UPCAST(VhostVDPAState, nc, nc);
     vdpa_device_fd = qemu_open_old(vhostdev, O_RDWR);
-- 
2.24.3 (Apple Git-128)


