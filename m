Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FE732A974
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:31:12 +0100 (CET)
Received: from localhost ([::1]:53564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9na-0000BR-Ca
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:31:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1lH9MN-0001lm-57
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:03:04 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:44966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1lH9MI-0008Lo-JF
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:03:02 -0500
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 609922E15C8;
 Tue,  2 Mar 2021 21:02:54 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 dc59eICpro-2rxe1tLf; Tue, 02 Mar 2021 21:02:54 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1614708174; bh=tqGbJUwXT9DHQMSmXyvwWHdwuWsscb7aSpvdvrgvkFc=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=tJHNcdp7lAAUX0AacvMrTOVv7Bgbf+8vbCMnjT8jKSjl/FsqnvxfC90R3EpWsEEWq
 FpuT/Lqk+XeM124B5pkdQI4+T6vtiZYabyl9MDlinCyGQafAiIyCFo1f5/GQzGmmU+
 EDOwjOtbN+UwIs3FGjz2N5ldAYI+QZSc2KtzOlqQ=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8002::1:1a])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 onVeXhLyoo-2qo0XYka; Tue, 02 Mar 2021 21:02:53 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v6 5/5] net: Do not fill legacy info_str for backends
Date: Tue,  2 Mar 2021 21:02:05 +0300
Message-Id: <20210302180205.5009-6-lekiravi@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302180205.5009-1-lekiravi@yandex-team.ru>
References: <20210302180205.5009-1-lekiravi@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=lekiravi@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

As we use QAPI NetClientState->stored_config to store and get information
about backend network devices, we can drop fill of legacy field info_str
for them.

We still use info_str field for NIC and hubports, so we can not completely
remove it.

Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
---
 net/l2tpv3.c     |  2 --
 net/slirp.c      |  3 ---
 net/socket.c     | 28 ----------------------------
 net/tap-win32.c  |  2 --
 net/tap.c        |  9 ---------
 net/vde.c        |  2 --
 net/vhost-user.c |  1 -
 net/vhost-vdpa.c |  1 -
 8 files changed, 48 deletions(-)

diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index 96611cb4af..b7e1d84674 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -729,8 +729,6 @@ int net_init_l2tpv3(const Netdev *netdev,
 
     QAPI_CLONE_MEMBERS(NetdevL2TPv3Options,
                        &nc->stored_config->u.l2tpv3, l2tpv3);
-
-    s->nc.info_str = g_strdup_printf("l2tpv3: connected");
     return 0;
 outerr:
     qemu_del_net_client(nc);
diff --git a/net/slirp.c b/net/slirp.c
index f8b3636fcc..99b131a3b0 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -669,9 +669,6 @@ static int net_slirp_init(NetClientState *peer, const char *model,
         stored->tftp_server_name = g_strdup(tftp_server_name);
     }
 
-    nc->info_str = g_strdup_printf("net=%s,restrict=%s", inet_ntoa(net),
-                                   restricted ? "on" : "off");
-
     s = DO_UPCAST(SlirpState, nc, nc);
 
     s->slirp = slirp_init(restricted, ipv4, net, mask, host,
diff --git a/net/socket.c b/net/socket.c
index 98172347d7..c0de10c0c0 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -180,8 +180,6 @@ static void net_socket_send(void *opaque)
         s->fd = -1;
         net_socket_rs_init(&s->rs, net_socket_rs_finalize, false);
         s->nc.link_down = true;
-        g_free(s->nc.info_str);
-        s->nc.info_str = g_new0(char, 1);
 
         return;
     }
@@ -401,16 +399,10 @@ static NetSocketState *net_socket_fd_init_dgram(NetClientState *peer,
         stored->mcast = g_strdup(mcast);
 
         s->dgram_dst = saddr;
-        nc->info_str = g_strdup_printf("socket: fd=%d (cloned mcast=%s:%d)",
-                                       fd, inet_ntoa(saddr.sin_addr),
-                                       ntohs(saddr.sin_port));
     } else {
         if (sa_type == SOCKET_ADDRESS_TYPE_UNIX) {
             s->dgram_dst.sin_family = AF_UNIX;
         }
-
-        nc->info_str = g_strdup_printf("socket: fd=%d %s",
-                                       fd, SocketAddressType_str(sa_type));
     }
 
     return s;
@@ -445,8 +437,6 @@ static NetSocketState *net_socket_fd_init_stream(NetClientState *peer,
 
     nc = qemu_new_net_client(&net_socket_info, peer, model, name);
 
-    nc->info_str = g_strdup_printf("socket: fd=%d", fd);
-
     s = DO_UPCAST(NetSocketState, nc, nc);
 
     s->fd = fd;
@@ -528,11 +518,6 @@ static void net_socket_accept(void *opaque)
 
     stored->has_fd = true;
     stored->fd = g_strdup_printf("%d", fd);
-
-    g_free(s->nc.info_str);
-    s->nc.info_str = g_strdup_printf("socket: connection from %s:%d",
-                                     inet_ntoa(saddr.sin_addr),
-                                     ntohs(saddr.sin_port));
 }
 
 static int net_socket_listen_init(NetClientState *peer,
@@ -647,10 +632,6 @@ static int net_socket_connect_init(NetClientState *peer,
     stored->has_connect = true;
     stored->connect = g_strdup(host_str);
 
-    g_free(s->nc.info_str);
-    s->nc.info_str = g_strdup_printf("socket: connect to %s:%d",
-                                     inet_ntoa(saddr.sin_addr),
-                                     ntohs(saddr.sin_port));
     return 0;
 }
 
@@ -707,12 +688,7 @@ static int net_socket_mcast_init(NetClientState *peer,
         stored->localaddr = g_strdup(localaddr_str);
     }
 
-    g_free(s->nc.info_str);
-    s->nc.info_str = g_strdup_printf("socket: mcast=%s:%d",
-                                     inet_ntoa(saddr.sin_addr),
-                                     ntohs(saddr.sin_port));
     return 0;
-
 }
 
 static int net_socket_udp_init(NetClientState *peer,
@@ -773,10 +749,6 @@ static int net_socket_udp_init(NetClientState *peer,
     stored->has_udp = true;
     stored->udp = g_strdup(rhost);
 
-    g_free(s->nc.info_str);
-    s->nc.info_str = g_strdup_printf("socket: udp=%s:%d",
-                                     inet_ntoa(raddr.sin_addr),
-                                     ntohs(raddr.sin_port));
     return 0;
 }
 
diff --git a/net/tap-win32.c b/net/tap-win32.c
index 0888db8cce..21e451107b 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -787,8 +787,6 @@ static int tap_win32_init(NetClientState *peer, const char *model,
     stored->has_ifname = true;
     stored->ifname = g_strdup(ifname);
 
-    s->nc.info_str = g_strdup_printf("tap: ifname=%s", ifname);
-
     s->handle = handle;
 
     qemu_add_wait_object(s->handle->tap_semaphore, tap_win32_send, s);
diff --git a/net/tap.c b/net/tap.c
index f864f434b2..12a08d54fe 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -625,8 +625,6 @@ int net_init_bridge(const Netdev *netdev, const char *name,
         stored->helper = g_strdup(helper);
     }
 
-    s->nc.info_str = g_strdup_printf("helper=%s,br=%s", helper, br);
-
     return 0;
 }
 
@@ -712,8 +710,6 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             stored->fds = g_strdup_printf("%s:%d", stored->fds, fd);
             g_free(tmp_s);
         }
-
-        s->nc.info_str = g_strdup_printf("fd=%d", fd);
     } else if (tap->has_helper) {
         if (!stored->has_helper) {
             stored->has_helper = true;
@@ -725,8 +721,6 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             stored->br = tap->has_br ? g_strdup(tap->br) :
                                        g_strdup(DEFAULT_BRIDGE_INTERFACE);
         }
-
-        s->nc.info_str = g_strdup_printf("helper=%s", tap->helper);
     } else {
         if (ifname && !stored->has_ifname) {
             stored->has_ifname = true;
@@ -743,9 +737,6 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             stored->downscript = g_strdup(downscript);
         }
 
-        s->nc.info_str = g_strdup_printf("ifname=%s,script=%s,downscript=%s",
-                                         ifname, script, downscript);
-
         if (strcmp(downscript, "no") != 0) {
             snprintf(s->down_script, sizeof(s->down_script), "%s", downscript);
             snprintf(s->down_script_arg, sizeof(s->down_script_arg),
diff --git a/net/vde.c b/net/vde.c
index 67de6eb0c5..64bdb937ca 100644
--- a/net/vde.c
+++ b/net/vde.c
@@ -100,8 +100,6 @@ static int net_vde_init(NetClientState *peer, const char *model,
 
     nc = qemu_new_net_client(&net_vde_info, peer, model, name);
 
-    nc->info_str = g_strdup_printf("sock=%s,fd=%d", sock, vde_datafd(vde));
-
     s = DO_UPCAST(VDEState, nc, nc);
 
     s->vde = vde;
diff --git a/net/vhost-user.c b/net/vhost-user.c
index 49c9a740c2..e443c4b2b5 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -327,7 +327,6 @@ static int net_vhost_user_init(NetClientState *peer, const char *device,
     user = g_new0(struct VhostUserState, 1);
     for (i = 0; i < queues; i++) {
         nc = qemu_new_net_client(&net_vhost_user_info, peer, device, name);
-        nc->info_str = g_strdup_printf("vhost-user%d to %s", i, chr->label);
         nc->queue_index = i;
         if (!nc0) {
             nc0 = nc;
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 423d71770d..5a28bbcd7b 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -200,7 +200,6 @@ static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
     stored->has_queues = true;
     stored->queues = 1; /* TODO: change when support multiqueue */
 
-    nc->info_str = g_strdup_printf(TYPE_VHOST_VDPA);
     nc->queue_index = 0;
     s = DO_UPCAST(VhostVDPAState, nc, nc);
     vdpa_device_fd = qemu_open_old(vhostdev, O_RDWR);
-- 
2.25.1


