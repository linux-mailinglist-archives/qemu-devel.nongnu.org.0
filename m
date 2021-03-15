Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C719C33AEE3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:32:35 +0100 (CET)
Received: from localhost ([::1]:46828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjaU-0003Qc-Pa
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjKa-0000Rx-0U
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:16:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjKN-0008F7-1F
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615799753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=E+VgJlvCIJSqdxoF3v8V8EV1mu/+683LeE+XvfdyiPg=;
 b=B9HL72+feZoDh+P5Kqj8A+K9LVWApFI4KjSFM1Ds4Fnt+PUW7GYlXQEMT6ou5+h/+Mdemg
 SiAUyexYNT8Fcuk3lyhXOC/4ANKuCedVLsOR3eRB/P0fiQKtLozFcZE5XroKmIzx6gqPF/
 QSEd7VTEckX1IqYoE9czAqjtL5iV3qk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-NZRAedaHNkyNCdVrTpwRAw-1; Mon, 15 Mar 2021 05:15:51 -0400
X-MC-Unique: NZRAedaHNkyNCdVrTpwRAw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCDFE80006E;
 Mon, 15 Mar 2021 09:15:49 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-105.pek2.redhat.com
 [10.72.13.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D3FF100164C;
 Mon, 15 Mar 2021 09:15:47 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 20/20] net: Do not fill legacy info_str for backends
Date: Mon, 15 Mar 2021 17:14:33 +0800
Message-Id: <1615799673-31549-21-git-send-email-jasowang@redhat.com>
In-Reply-To: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
References: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alexey Kirillov <lekiravi@yandex-team.ru>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Kirillov <lekiravi@yandex-team.ru>

As we use QAPI NetClientState->stored_config to store and get information
about backend network devices, we can drop fill of legacy field info_str
for them.

We still use info_str field for NIC and hubports, so we can not completely
remove it.

Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
Signed-off-by: Jason Wang <jasowang@redhat.com>
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
index 96611cb..b7e1d84 100644
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
index bfa07e3..9454a67 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -664,9 +664,6 @@ static int net_slirp_init(NetClientState *peer, const char *model,
         stored->tftp_server_name = g_strdup(tftp_server_name);
     }
 
-    nc->info_str = g_strdup_printf("net=%s,restrict=%s", inet_ntoa(net),
-                                   restricted ? "on" : "off");
-
     s = DO_UPCAST(SlirpState, nc, nc);
 
     s->slirp = slirp_init(restricted, ipv4, net, mask, host,
diff --git a/net/socket.c b/net/socket.c
index 9817234..c0de10c 100644
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
index 0888db8..21e4511 100644
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
index f864f43..12a08d5 100644
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
index 67de6eb..64bdb93 100644
--- a/net/vde.c
+++ b/net/vde.c
@@ -100,8 +100,6 @@ static int net_vde_init(NetClientState *peer, const char *model,
 
     nc = qemu_new_net_client(&net_vde_info, peer, model, name);
 
-    nc->info_str = g_strdup_printf("sock=%s,fd=%d", sock, vde_datafd(vde));
-
     s = DO_UPCAST(VDEState, nc, nc);
 
     s->vde = vde;
diff --git a/net/vhost-user.c b/net/vhost-user.c
index 49c9a74..e443c4b 100644
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
index 423d717..5a28bbc 100644
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
2.7.4


