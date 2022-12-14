Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55BD64C4D8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 09:15:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5MUr-0003d1-LP; Wed, 14 Dec 2022 02:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUQ-0003Wi-5D
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUK-0003gJ-8n
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671004055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VvAI+TubrfaJLcfJF3p60r+TIYpfi9CqU834Nmk04yM=;
 b=ieObiuo3u4Ia8o1hZkvHEmSyAwrN+Go0dXwW/FaePSmSuwxRQv2Ega7+jyYZ9iozV205Wj
 RmXdBEiWX9gqYPwpHTkW1TD81kJqUCufE1zxJWUdgF8fEQZ1hlaci2Q0CeIUJqwGobNHbm
 vIV5VsZcUoF6+yUM/f9Wcbvydc60B18=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-Htoj4-mlME6conn54oiU6w-1; Wed, 14 Dec 2022 02:47:32 -0500
X-MC-Unique: Htoj4-mlME6conn54oiU6w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCF4A1C02D40;
 Wed, 14 Dec 2022 07:47:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 777E0C15BA0;
 Wed, 14 Dec 2022 07:47:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7B62F21E61AC; Wed, 14 Dec 2022 08:47:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 18/30] qapi net: Elide redundant has_FOO in generated C
Date: Wed, 14 Dec 2022 08:47:09 +0100
Message-Id: <20221214074721.731441-21-armbru@redhat.com>
In-Reply-To: <20221214074721.731441-1-armbru@redhat.com>
References: <20221214074721.731441-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/net.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Jason Wang <jasowang@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221104160712.3005652-19-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/virtio-net.c    |  3 +--
 monitor/hmp-cmds.c     |  1 -
 net/announce.c         |  8 +++----
 net/hub.c              |  2 +-
 net/l2tpv3.c           |  2 +-
 net/net.c              | 25 ++++++++++-----------
 net/slirp.c            |  4 ++--
 net/socket.c           | 18 +++++++--------
 net/tap-win32.c        |  2 +-
 net/tap.c              | 51 +++++++++++++++++++++---------------------
 net/vhost-vdpa.c       |  6 ++---
 scripts/qapi/schema.py |  1 -
 12 files changed, 59 insertions(+), 64 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index aba12759d5..d1ce744619 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -457,8 +457,7 @@ static void rxfilter_notify(NetClientState *nc)
 
     if (nc->rxfilter_notify_enabled) {
         char *path = object_get_canonical_path(OBJECT(n->qdev));
-        qapi_event_send_nic_rx_filter_changed(!!n->netclient_name,
-                                              n->netclient_name, path);
+        qapi_event_send_nic_rx_filter_changed(n->netclient_name, path);
         g_free(path);
 
         /* disable event notification to avoid events flooding */
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index c5c8cb593e..45d78ba257 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1104,7 +1104,6 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
     params->interfaces = strList_from_comma_list(interfaces_str);
     params->has_interfaces = params->interfaces != NULL;
     params->id = g_strdup(id);
-    params->has_id = !!params->id;
     qmp_announce_self(params, NULL);
     qapi_free_AnnounceParameters(params);
 }
diff --git a/net/announce.c b/net/announce.c
index 62c60192a3..9e99044422 100644
--- a/net/announce.c
+++ b/net/announce.c
@@ -46,7 +46,7 @@ void qemu_announce_timer_del(AnnounceTimer *timer, bool free_named)
     }
     qapi_free_strList(timer->params.interfaces);
     timer->params.interfaces = NULL;
-    if (free_named && timer->params.has_id) {
+    if (free_named && timer->params.id) {
         AnnounceTimer *list_timer;
         /*
          * Sanity check: There should only be one timer on the list with
@@ -157,7 +157,7 @@ static void qemu_announce_self_iter(NICState *nic, void *opaque)
         skip = false;
     }
 
-    trace_qemu_announce_self_iter(timer->params.has_id ? timer->params.id : "_",
+    trace_qemu_announce_self_iter(timer->params.id ?: "_",
                                   nic->ncs->name,
                                   qemu_ether_ntoa(&nic->conf->macaddr), skip);
 
@@ -199,9 +199,9 @@ void qemu_announce_self(AnnounceTimer *timer, AnnounceParameters *params)
 void qmp_announce_self(AnnounceParameters *params, Error **errp)
 {
     AnnounceTimer *named_timer;
-    if (!params->has_id) {
+
+    if (!params->id) {
         params->id = g_strdup("");
-        params->has_id = true;
     }
 
     named_timer = g_datalist_get_data(&named_timers, params->id);
diff --git a/net/hub.c b/net/hub.c
index 67ca534856..4c8a469a50 100644
--- a/net/hub.c
+++ b/net/hub.c
@@ -274,7 +274,7 @@ int net_init_hubport(const Netdev *netdev, const char *name,
     assert(!peer);
     hubport = &netdev->u.hubport;
 
-    if (hubport->has_netdev) {
+    if (hubport->netdev) {
         hubpeer = qemu_find_netdev(hubport->netdev);
         if (!hubpeer) {
             error_setg(errp, "netdev '%s' not found", hubport->netdev);
diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index 350041a0d6..5852e42738 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -578,7 +578,7 @@ int net_init_l2tpv3(const Netdev *netdev,
 
     if (l2tpv3->has_udp && l2tpv3->udp) {
         s->udp = true;
-        if (!(l2tpv3->has_srcport && l2tpv3->has_dstport)) {
+        if (!(l2tpv3->srcport && l2tpv3->dstport)) {
             error_setg(errp, "need both src and dst port for udp");
             goto outerr;
         } else {
diff --git a/net/net.c b/net/net.c
index 840ad9dca5..2d01472998 100644
--- a/net/net.c
+++ b/net/net.c
@@ -964,7 +964,7 @@ static int net_init_nic(const Netdev *netdev, const char *name,
 
     memset(nd, 0, sizeof(*nd));
 
-    if (nic->has_netdev) {
+    if (nic->netdev) {
         nd->netdev = qemu_find_netdev(nic->netdev);
         if (!nd->netdev) {
             error_setg(errp, "netdev '%s' not found", nic->netdev);
@@ -975,19 +975,19 @@ static int net_init_nic(const Netdev *netdev, const char *name,
         nd->netdev = peer;
     }
     nd->name = g_strdup(name);
-    if (nic->has_model) {
+    if (nic->model) {
         nd->model = g_strdup(nic->model);
     }
-    if (nic->has_addr) {
+    if (nic->addr) {
         nd->devaddr = g_strdup(nic->addr);
     }
 
-    if (nic->has_macaddr &&
+    if (nic->macaddr &&
         net_parse_macaddr(nd->macaddr.a, nic->macaddr) < 0) {
         error_setg(errp, "invalid syntax for ethernet address");
         return -1;
     }
-    if (nic->has_macaddr &&
+    if (nic->macaddr &&
         is_multicast_ether_addr(nd->macaddr.a)) {
         error_setg(errp,
                    "NIC cannot have multicast MAC address (odd 1st byte)");
@@ -1081,7 +1081,7 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
 
         /* Do not add to a hub if it's a nic with a netdev= parameter. */
         if (netdev->type != NET_CLIENT_DRIVER_NIC ||
-            !netdev->u.nic.has_netdev) {
+            !netdev->u.nic.netdev) {
             peer = net_hub_add_port(0, NULL, NULL);
         }
     }
@@ -1295,8 +1295,7 @@ void print_net_client(Monitor *mon, NetClientState *nc)
     }
 }
 
-RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
-                                      Error **errp)
+RxFilterInfoList *qmp_query_rx_filter(const char *name, Error **errp)
 {
     NetClientState *nc;
     RxFilterInfoList *filter_list = NULL, **tail = &filter_list;
@@ -1304,13 +1303,13 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
     QTAILQ_FOREACH(nc, &net_clients, next) {
         RxFilterInfo *info;
 
-        if (has_name && strcmp(nc->name, name) != 0) {
+        if (name && strcmp(nc->name, name) != 0) {
             continue;
         }
 
         /* only query rx-filter information of NIC */
         if (nc->info->type != NET_CLIENT_DRIVER_NIC) {
-            if (has_name) {
+            if (name) {
                 error_setg(errp, "net client(%s) isn't a NIC", name);
                 assert(!filter_list);
                 return NULL;
@@ -1327,19 +1326,19 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
         if (nc->info->query_rx_filter) {
             info = nc->info->query_rx_filter(nc);
             QAPI_LIST_APPEND(tail, info);
-        } else if (has_name) {
+        } else if (name) {
             error_setg(errp, "net client(%s) doesn't support"
                        " rx-filter querying", name);
             assert(!filter_list);
             return NULL;
         }
 
-        if (has_name) {
+        if (name) {
             break;
         }
     }
 
-    if (filter_list == NULL && has_name) {
+    if (filter_list == NULL && name) {
         error_setg(errp, "invalid net client name: %s", name);
     }
 
diff --git a/net/slirp.c b/net/slirp.c
index 14a8d59277..2ee3f1a0d7 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -1153,8 +1153,8 @@ int net_init_slirp(const Netdev *netdev, const char *name,
         ipv6 = 0;
     }
 
-    vnet = user->has_net ? g_strdup(user->net) :
-           user->has_ip  ? g_strdup_printf("%s/24", user->ip) :
+    vnet = user->net ? g_strdup(user->net) :
+           user->ip  ? g_strdup_printf("%s/24", user->ip) :
            NULL;
 
     dnssearch = slirp_dnssearch(user->dnssearch);
diff --git a/net/socket.c b/net/socket.c
index e62137c839..b67437a1f0 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -705,19 +705,19 @@ int net_init_socket(const Netdev *netdev, const char *name,
     assert(netdev->type == NET_CLIENT_DRIVER_SOCKET);
     sock = &netdev->u.socket;
 
-    if (sock->has_fd + sock->has_listen + sock->has_connect + sock->has_mcast +
-        sock->has_udp != 1) {
+    if (!!sock->fd + !!sock->listen + !!sock->connect + !!sock->mcast +
+        !!sock->udp != 1) {
         error_setg(errp, "exactly one of listen=, connect=, mcast= or udp="
                    " is required");
         return -1;
     }
 
-    if (sock->has_localaddr && !sock->has_mcast && !sock->has_udp) {
+    if (sock->localaddr && !sock->mcast && !sock->udp) {
         error_setg(errp, "localaddr= is only valid with mcast= or udp=");
         return -1;
     }
 
-    if (sock->has_fd) {
+    if (sock->fd) {
         int fd, ret;
 
         fd = monitor_fd_param(monitor_cur(), sock->fd, errp);
@@ -737,7 +737,7 @@ int net_init_socket(const Netdev *netdev, const char *name,
         return 0;
     }
 
-    if (sock->has_listen) {
+    if (sock->listen) {
         if (net_socket_listen_init(peer, "socket", name, sock->listen, errp)
             < 0) {
             return -1;
@@ -745,7 +745,7 @@ int net_init_socket(const Netdev *netdev, const char *name,
         return 0;
     }
 
-    if (sock->has_connect) {
+    if (sock->connect) {
         if (net_socket_connect_init(peer, "socket", name, sock->connect, errp)
             < 0) {
             return -1;
@@ -753,7 +753,7 @@ int net_init_socket(const Netdev *netdev, const char *name,
         return 0;
     }
 
-    if (sock->has_mcast) {
+    if (sock->mcast) {
         /* if sock->localaddr is missing, it has been initialized to "all bits
          * zero" */
         if (net_socket_mcast_init(peer, "socket", name, sock->mcast,
@@ -763,8 +763,8 @@ int net_init_socket(const Netdev *netdev, const char *name,
         return 0;
     }
 
-    assert(sock->has_udp);
-    if (!sock->has_localaddr) {
+    assert(sock->udp);
+    if (!sock->localaddr) {
         error_setg(errp, "localaddr= is mandatory with udp=");
         return -1;
     }
diff --git a/net/tap-win32.c b/net/tap-win32.c
index a49c28ba5d..f327d62ab0 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -807,7 +807,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
     assert(netdev->type == NET_CLIENT_DRIVER_TAP);
     tap = &netdev->u.tap;
 
-    if (!tap->has_ifname) {
+    if (!tap->ifname) {
         error_report("tap: no interface name");
         return -1;
     }
diff --git a/net/tap.c b/net/tap.c
index 1210a0436d..e28ceb078f 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -611,8 +611,8 @@ int net_init_bridge(const Netdev *netdev, const char *name,
 
     assert(netdev->type == NET_CLIENT_DRIVER_BRIDGE);
     bridge = &netdev->u.bridge;
-    helper = bridge->has_helper ? bridge->helper : NULL;
-    br     = bridge->has_br     ? bridge->br     : DEFAULT_BRIDGE_INTERFACE;
+    helper = bridge->helper;
+    br     = bridge->br ?: DEFAULT_BRIDGE_INTERFACE;
 
     fd = net_bridge_run_helper(helper, br, errp);
     if (fd == -1) {
@@ -688,9 +688,9 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
         goto failed;
     }
 
-    if (tap->has_fd || tap->has_fds) {
+    if (tap->fd || tap->fds) {
         qemu_set_info_str(&s->nc, "fd=%d", fd);
-    } else if (tap->has_helper) {
+    } else if (tap->helper) {
         qemu_set_info_str(&s->nc, "helper=%s", tap->helper);
     } else {
         qemu_set_info_str(&s->nc, "ifname=%s,script=%s,downscript=%s", ifname,
@@ -812,21 +812,21 @@ int net_init_tap(const Netdev *netdev, const char *name,
     assert(netdev->type == NET_CLIENT_DRIVER_TAP);
     tap = &netdev->u.tap;
     queues = tap->has_queues ? tap->queues : 1;
-    vhostfdname = tap->has_vhostfd ? tap->vhostfd : NULL;
-    script = tap->has_script ? tap->script : NULL;
-    downscript = tap->has_downscript ? tap->downscript : NULL;
+    vhostfdname = tap->vhostfd;
+    script = tap->script;
+    downscript = tap->downscript;
 
     /* QEMU hubs do not support multiqueue tap, in this case peer is set.
      * For -netdev, peer is always NULL. */
-    if (peer && (tap->has_queues || tap->has_fds || tap->has_vhostfds)) {
+    if (peer && (tap->has_queues || tap->fds || tap->vhostfds)) {
         error_setg(errp, "Multiqueue tap cannot be used with hubs");
         return -1;
     }
 
-    if (tap->has_fd) {
-        if (tap->has_ifname || tap->has_script || tap->has_downscript ||
-            tap->has_vnet_hdr || tap->has_helper || tap->has_queues ||
-            tap->has_fds || tap->has_vhostfds) {
+    if (tap->fd) {
+        if (tap->ifname || tap->script || tap->downscript ||
+            tap->has_vnet_hdr || tap->helper || tap->has_queues ||
+            tap->fds || tap->vhostfds) {
             error_setg(errp, "ifname=, script=, downscript=, vnet_hdr=, "
                        "helper=, queues=, fds=, and vhostfds= "
                        "are invalid with fd=");
@@ -859,14 +859,14 @@ int net_init_tap(const Netdev *netdev, const char *name,
             close(fd);
             return -1;
         }
-    } else if (tap->has_fds) {
+    } else if (tap->fds) {
         char **fds;
         char **vhost_fds;
         int nfds = 0, nvhosts = 0;
 
-        if (tap->has_ifname || tap->has_script || tap->has_downscript ||
-            tap->has_vnet_hdr || tap->has_helper || tap->has_queues ||
-            tap->has_vhostfd) {
+        if (tap->ifname || tap->script || tap->downscript ||
+            tap->has_vnet_hdr || tap->helper || tap->has_queues ||
+            tap->vhostfd) {
             error_setg(errp, "ifname=, script=, downscript=, vnet_hdr=, "
                        "helper=, queues=, and vhostfd= "
                        "are invalid with fds=");
@@ -877,7 +877,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
         vhost_fds = g_new0(char *, MAX_TAP_QUEUES);
 
         nfds = get_fds(tap->fds, fds, MAX_TAP_QUEUES);
-        if (tap->has_vhostfds) {
+        if (tap->vhostfds) {
             nvhosts = get_fds(tap->vhostfds, vhost_fds, MAX_TAP_QUEUES);
             if (nfds != nvhosts) {
                 error_setg(errp, "The number of fds passed does not match "
@@ -916,7 +916,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
 
             net_init_tap_one(tap, peer, "tap", name, ifname,
                              script, downscript,
-                             tap->has_vhostfds ? vhost_fds[i] : NULL,
+                             tap->vhostfds ? vhost_fds[i] : NULL,
                              vnet_hdr, fd, &err);
             if (err) {
                 error_propagate(errp, err);
@@ -935,17 +935,16 @@ free_fail:
         g_free(fds);
         g_free(vhost_fds);
         return ret;
-    } else if (tap->has_helper) {
-        if (tap->has_ifname || tap->has_script || tap->has_downscript ||
-            tap->has_vnet_hdr || tap->has_queues || tap->has_vhostfds) {
+    } else if (tap->helper) {
+        if (tap->ifname || tap->script || tap->downscript ||
+            tap->has_vnet_hdr || tap->has_queues || tap->vhostfds) {
             error_setg(errp, "ifname=, script=, downscript=, vnet_hdr=, "
                        "queues=, and vhostfds= are invalid with helper=");
             return -1;
         }
 
         fd = net_bridge_run_helper(tap->helper,
-                                   tap->has_br ?
-                                   tap->br : DEFAULT_BRIDGE_INTERFACE,
+                                   tap->br ?: DEFAULT_BRIDGE_INTERFACE,
                                    errp);
         if (fd == -1) {
             return -1;
@@ -972,7 +971,7 @@ free_fail:
     } else {
         g_autofree char *default_script = NULL;
         g_autofree char *default_downscript = NULL;
-        if (tap->has_vhostfds) {
+        if (tap->vhostfds) {
             error_setg(errp, "vhostfds= is invalid if fds= wasn't specified");
             return -1;
         }
@@ -985,7 +984,7 @@ free_fail:
                                  get_relocated_path(DEFAULT_NETWORK_DOWN_SCRIPT);
         }
 
-        if (tap->has_ifname) {
+        if (tap->ifname) {
             pstrcpy(ifname, sizeof ifname, tap->ifname);
         } else {
             ifname[0] = '\0';
@@ -998,7 +997,7 @@ free_fail:
                 return -1;
             }
 
-            if (queues > 1 && i == 0 && !tap->has_ifname) {
+            if (queues > 1 && i == 0 && !tap->ifname) {
                 if (tap_fd_get_ifname(fd, ifname)) {
                     error_setg(errp, "Fail to get ifname");
                     close(fd);
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 2b4b85d8f8..260e474863 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -635,19 +635,19 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
-    if (!opts->has_vhostdev && !opts->has_vhostfd) {
+    if (!opts->vhostdev && !opts->vhostfd) {
         error_setg(errp,
                    "vhost-vdpa: neither vhostdev= nor vhostfd= was specified");
         return -1;
     }
 
-    if (opts->has_vhostdev && opts->has_vhostfd) {
+    if (opts->vhostdev && opts->vhostfd) {
         error_setg(errp,
                    "vhost-vdpa: vhostdev= and vhostfd= are mutually exclusive");
         return -1;
     }
 
-    if (opts->has_vhostdev) {
+    if (opts->vhostdev) {
         vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
         if (vdpa_device_fd == -1) {
             return -errno;
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index a34e25fdd7..930dffd780 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/net.json',
             'qapi/pci.json',
             'qapi/qdev.json',
             'qapi/qom.json',
-- 
2.37.3


