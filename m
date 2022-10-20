Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312936066A5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:03:49 +0200 (CEST)
Received: from localhost ([::1]:52572 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYxH-0007k5-LU
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:03:40 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYry-0003KU-8S
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNY-0004vi-C6
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:49 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:49405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNG-0006zN-4S
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:39 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N7QM9-1pAbCW41Cn-017peA; Thu, 20 Oct 2022 18:26:10 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v13 05/17] net: introduce qemu_set_info_str() function
Date: Thu, 20 Oct 2022 18:25:46 +0200
Message-Id: <20221020162558.123284-6-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020162558.123284-1-lvivier@redhat.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:J9EQXLqtWLORmJOCxSzN+R8yrwnijhrnrCOlKNRnxq4VuYdYXgA
 rZuBKDqFmWp56pQS62xC0CgiuQOd7hC28/FpKqoVz2YCHjxKmFdnD3Rqm/xh2obHchwLxr7
 5UGEKQ+EvlqceoEMpMbApgRgyOk0F5BGbFE1b8dBqJcRsd4q8dyk4y4qXphuEmnbIu0VUR+
 +RttfA1moZHsbc61HyupA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qVJQ3vATfcQ=:/pFG3MK9dc0fpZOPJqamA8
 em9k0miUexkkDhrjbkySBIsTpWAxvOhVF5aTXobVWSx7sP2CPA2CI9QV+OxydH8X/dTt95eyj
 qanl9YK8Y6yIoPuVWvl9hc/3Gr1/lAdz2EOqpboRI9Y8HzblzFNSj23eFvHTxjExCoJ0HFUsE
 rPgs1coMBzRg5sqm8ilH2VYViQp9wrAP1OnvHLdc/ZLq6l4eUfgFsBS+g4VATEEkREapDOtBz
 R85icdvHZCya6+owHNLYWVp71b2rK0GPMVUBtsQm8paiMgMjDIU+6167AHo5E9IejVEmFsuqJ
 QShsofPOMxwnSniw3T7j4kkSJfL2o0K1Fl3uDMqwYQ9p3K6snb0FfwvyxZC0Vz7Ioatk8m9y8
 XXvJZkoRKx02xZybbolFfzKbpIqMcTUEq2cWo6BRRmDvwZ3WRUJYW/viXZ83lKuh1UGdMft+B
 uH0Px0gCBpfp+hk4t30bBmyBbbo+vs3PIht9Rq+sIt6hcQ+8Da1vff8PdwvujOQozS/PDXS2G
 pZEgirXh6QCuPsRaFuRdLLTORcQE1XII+arJrVNvL+yZ0NBpHltP6KkJB7rI9McF5Bl0JV7b2
 aB044fXJ1A+4Mju5IT3TefEHkaX4NIZEJzHH6k1n+QUkG54L/wr5nB56w261Ma0c7w6TqThKl
 YfPXcUsiy1XUks1r71BIEIiPo0xmiAcG1xE97LDmPPjmE4Ja7EJcwpirGOfCSaNfvjfNHXlEG
 1r7Vn5VoFoRDtZRmptRGP4O0+cq+2AseU5QYxNuqxinPOnJETGX+/MFgDCdGLTziqFlu8V5o/
 Q1wz+15
Received-SPF: permerror client-ip=212.227.126.134;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_FAIL=0.001,
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

Embed the setting of info_str in a function.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xen_nic.c  |  5 ++---
 include/net/net.h |  1 +
 net/l2tpv3.c      |  3 +--
 net/net.c         | 17 ++++++++++++-----
 net/slirp.c       |  5 ++---
 net/socket.c      | 33 ++++++++++++++-------------------
 net/tap-win32.c   |  3 +--
 net/tap.c         | 13 +++++--------
 net/vde.c         |  3 +--
 net/vhost-user.c  |  3 +--
 net/vhost-vdpa.c  |  2 +-
 11 files changed, 41 insertions(+), 47 deletions(-)

diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index 5c815b4f0c52..7d92c2d022b0 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -296,9 +296,8 @@ static int net_init(struct XenLegacyDevice *xendev)
     netdev->nic = qemu_new_nic(&net_xen_info, &netdev->conf,
                                "xen", NULL, netdev);
 
-    snprintf(qemu_get_queue(netdev->nic)->info_str,
-             sizeof(qemu_get_queue(netdev->nic)->info_str),
-             "nic: xenbus vif macaddr=%s", netdev->mac);
+    qemu_set_info_str(qemu_get_queue(netdev->nic),
+                      "nic: xenbus vif macaddr=%s", netdev->mac);
 
     /* fill info */
     xenstore_write_be_int(&netdev->xendev, "feature-rx-copy", 1);
diff --git a/include/net/net.h b/include/net/net.h
index 025dbf1e143b..3db75ff841ff 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -177,6 +177,7 @@ ssize_t qemu_send_packet_async(NetClientState *nc, const uint8_t *buf,
 void qemu_purge_queued_packets(NetClientState *nc);
 void qemu_flush_queued_packets(NetClientState *nc);
 void qemu_flush_or_purge_queued_packets(NetClientState *nc, bool purge);
+void qemu_set_info_str(NetClientState *nc, const char *fmt, ...);
 void qemu_format_nic_info_str(NetClientState *nc, uint8_t macaddr[6]);
 bool qemu_has_ufo(NetClientState *nc);
 bool qemu_has_vnet_hdr(NetClientState *nc);
diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index af373e5c300c..350041a0d6c0 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -723,8 +723,7 @@ int net_init_l2tpv3(const Netdev *netdev,
 
     l2tpv3_read_poll(s, true);
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "l2tpv3: connected");
+    qemu_set_info_str(&s->nc, "l2tpv3: connected");
     return 0;
 outerr:
     qemu_del_net_client(nc);
diff --git a/net/net.c b/net/net.c
index ffe3e5a2cf1d..41e05137d431 100644
--- a/net/net.c
+++ b/net/net.c
@@ -141,13 +141,20 @@ char *qemu_mac_strdup_printf(const uint8_t *macaddr)
                            macaddr[3], macaddr[4], macaddr[5]);
 }
 
+void qemu_set_info_str(NetClientState *nc, const char *fmt, ...)
+{
+    va_list ap;
+
+    va_start(ap, fmt);
+    vsnprintf(nc->info_str, sizeof(nc->info_str), fmt, ap);
+    va_end(ap);
+}
+
 void qemu_format_nic_info_str(NetClientState *nc, uint8_t macaddr[6])
 {
-    snprintf(nc->info_str, sizeof(nc->info_str),
-             "model=%s,macaddr=%02x:%02x:%02x:%02x:%02x:%02x",
-             nc->model,
-             macaddr[0], macaddr[1], macaddr[2],
-             macaddr[3], macaddr[4], macaddr[5]);
+    qemu_set_info_str(nc, "model=%s,macaddr=%02x:%02x:%02x:%02x:%02x:%02x",
+                      nc->model, macaddr[0], macaddr[1], macaddr[2],
+                      macaddr[3], macaddr[4], macaddr[5]);
 }
 
 static int mac_table[256] = {0};
diff --git a/net/slirp.c b/net/slirp.c
index 8679be644420..14a8d592774c 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -611,9 +611,8 @@ static int net_slirp_init(NetClientState *peer, const char *model,
 
     nc = qemu_new_net_client(&net_slirp_info, peer, model, name);
 
-    snprintf(nc->info_str, sizeof(nc->info_str),
-             "net=%s,restrict=%s", inet_ntoa(net),
-             restricted ? "on" : "off");
+    qemu_set_info_str(nc, "net=%s,restrict=%s", inet_ntoa(net),
+                      restricted ? "on" : "off");
 
     s = DO_UPCAST(SlirpState, nc, nc);
 
diff --git a/net/socket.c b/net/socket.c
index bfd8596250c4..ade1ecf38b87 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -179,7 +179,7 @@ static void net_socket_send(void *opaque)
         s->fd = -1;
         net_socket_rs_init(&s->rs, net_socket_rs_finalize, false);
         s->nc.link_down = true;
-        memset(s->nc.info_str, 0, sizeof(s->nc.info_str));
+        qemu_set_info_str(&s->nc, "");
 
         return;
     }
@@ -387,16 +387,15 @@ static NetSocketState *net_socket_fd_init_dgram(NetClientState *peer,
     /* mcast: save bound address as dst */
     if (is_connected && mcast != NULL) {
         s->dgram_dst = saddr;
-        snprintf(nc->info_str, sizeof(nc->info_str),
-                 "socket: fd=%d (cloned mcast=%s:%d)",
-                 fd, inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+        qemu_set_info_str(nc, "socket: fd=%d (cloned mcast=%s:%d)", fd,
+                          inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
     } else {
         if (sa_type == SOCKET_ADDRESS_TYPE_UNIX) {
             s->dgram_dst.sin_family = AF_UNIX;
         }
 
-        snprintf(nc->info_str, sizeof(nc->info_str),
-                 "socket: fd=%d %s", fd, SocketAddressType_str(sa_type));
+        qemu_set_info_str(nc, "socket: fd=%d %s", fd,
+                          SocketAddressType_str(sa_type));
     }
 
     return s;
@@ -430,7 +429,7 @@ static NetSocketState *net_socket_fd_init_stream(NetClientState *peer,
 
     nc = qemu_new_net_client(&net_socket_info, peer, model, name);
 
-    snprintf(nc->info_str, sizeof(nc->info_str), "socket: fd=%d", fd);
+    qemu_set_info_str(nc, "socket: fd=%d", fd);
 
     s = DO_UPCAST(NetSocketState, nc, nc);
 
@@ -497,9 +496,8 @@ static void net_socket_accept(void *opaque)
     s->fd = fd;
     s->nc.link_down = false;
     net_socket_connect(s);
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "socket: connection from %s:%d",
-             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+    qemu_set_info_str(&s->nc, "socket: connection from %s:%d",
+                      inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
 }
 
 static int net_socket_listen_init(NetClientState *peer,
@@ -597,9 +595,8 @@ static int net_socket_connect_init(NetClientState *peer,
         return -1;
     }
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "socket: connect to %s:%d",
-             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+    qemu_set_info_str(&s->nc, "socket: connect to %s:%d",
+                      inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
     return 0;
 }
 
@@ -642,9 +639,8 @@ static int net_socket_mcast_init(NetClientState *peer,
 
     s->dgram_dst = saddr;
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "socket: mcast=%s:%d",
-             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+    qemu_set_info_str(&s->nc, "socket: mcast=%s:%d",
+                      inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
     return 0;
 
 }
@@ -697,9 +693,8 @@ static int net_socket_udp_init(NetClientState *peer,
 
     s->dgram_dst = raddr;
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "socket: udp=%s:%d",
-             inet_ntoa(raddr.sin_addr), ntohs(raddr.sin_port));
+    qemu_set_info_str(&s->nc, "socket: udp=%s:%d", inet_ntoa(raddr.sin_addr),
+                      ntohs(raddr.sin_port));
     return 0;
 }
 
diff --git a/net/tap-win32.c b/net/tap-win32.c
index 7466f22e77a4..a49c28ba5dc5 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -789,8 +789,7 @@ static int tap_win32_init(NetClientState *peer, const char *model,
 
     s = DO_UPCAST(TAPState, nc, nc);
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "tap: ifname=%s", ifname);
+    qemu_set_info_str(&s->nc, "tap: ifname=%s", ifname);
 
     s->handle = handle;
 
diff --git a/net/tap.c b/net/tap.c
index e203d07a1216..1210a0436de8 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -630,8 +630,7 @@ int net_init_bridge(const Netdev *netdev, const char *name,
     }
     s = net_tap_fd_init(peer, "bridge", name, fd, vnet_hdr);
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str), "helper=%s,br=%s", helper,
-             br);
+    qemu_set_info_str(&s->nc, "helper=%s,br=%s", helper, br);
 
     return 0;
 }
@@ -690,14 +689,12 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
     }
 
     if (tap->has_fd || tap->has_fds) {
-        snprintf(s->nc.info_str, sizeof(s->nc.info_str), "fd=%d", fd);
+        qemu_set_info_str(&s->nc, "fd=%d", fd);
     } else if (tap->has_helper) {
-        snprintf(s->nc.info_str, sizeof(s->nc.info_str), "helper=%s",
-                 tap->helper);
+        qemu_set_info_str(&s->nc, "helper=%s", tap->helper);
     } else {
-        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-                 "ifname=%s,script=%s,downscript=%s", ifname, script,
-                 downscript);
+        qemu_set_info_str(&s->nc, "ifname=%s,script=%s,downscript=%s", ifname,
+                          script, downscript);
 
         if (strcmp(downscript, "no") != 0) {
             snprintf(s->down_script, sizeof(s->down_script), "%s", downscript);
diff --git a/net/vde.c b/net/vde.c
index 1083916bcf52..c0a08662cc30 100644
--- a/net/vde.c
+++ b/net/vde.c
@@ -98,8 +98,7 @@ static int net_vde_init(NetClientState *peer, const char *model,
 
     nc = qemu_new_net_client(&net_vde_info, peer, model, name);
 
-    snprintf(nc->info_str, sizeof(nc->info_str), "sock=%s,fd=%d",
-             sock, vde_datafd(vde));
+    qemu_set_info_str(nc, "sock=%s,fd=%d", sock, vde_datafd(vde));
 
     s = DO_UPCAST(VDEState, nc, nc);
 
diff --git a/net/vhost-user.c b/net/vhost-user.c
index b1a0247b5981..3a6b90da8661 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -341,8 +341,7 @@ static int net_vhost_user_init(NetClientState *peer, const char *device,
     user = g_new0(struct VhostUserState, 1);
     for (i = 0; i < queues; i++) {
         nc = qemu_new_net_client(&net_vhost_user_info, peer, device, name);
-        snprintf(nc->info_str, sizeof(nc->info_str), "vhost-user%d to %s",
-                 i, chr->label);
+        qemu_set_info_str(nc, "vhost-user%d to %s", i, chr->label);
         nc->queue_index = i;
         if (!nc0) {
             nc0 = nc;
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 4bc3fd01a878..e1865bea6aa3 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -593,7 +593,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
         nc = qemu_new_net_control_client(&net_vhost_vdpa_cvq_info, peer,
                                          device, name);
     }
-    snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
+    qemu_set_info_str(nc, TYPE_VHOST_VDPA);
     s = DO_UPCAST(VhostVDPAState, nc, nc);
 
     s->vhost_vdpa.device_fd = vdpa_device_fd;
-- 
2.37.3


