Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB335203B0
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 19:42:19 +0200 (CEST)
Received: from localhost ([::1]:43428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no7Ok-0001KP-1t
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 13:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1no7J8-00071i-2W
 for qemu-devel@nongnu.org; Mon, 09 May 2022 13:36:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1no7J4-00012K-MG
 for qemu-devel@nongnu.org; Mon, 09 May 2022 13:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652117785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9pVggCBV3OVKkoA52Ik1NjlSVuPLUX1uWrVT+/bJuc0=;
 b=hb7aLJ+9uvoBLyCj+h2mxjIwuMjMy90Jr/sDD0Nc36502XC44Nf32e1A87ZX+iW0WwVKjp
 OSSeKGuf6CBIFB03r5lcZjZ2g98c86PNrEWwAuZmzcHPvzwNoDYem+Pk9K2Uo2a7y7h62m
 4NgAK6OcmslC2SpOt3nKlAt/M0KCn/c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-M3M5NcS5MPavbS8NfzdYbA-1; Mon, 09 May 2022 13:36:24 -0400
X-MC-Unique: M3M5NcS5MPavbS8NfzdYbA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E541A3C1902A
 for <qemu-devel@nongnu.org>; Mon,  9 May 2022 17:36:23 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B76240CF8EC;
 Mon,  9 May 2022 17:36:22 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH 2/6] qapi: net: add socket-ng netdev
Date: Mon,  9 May 2022 19:36:14 +0200
Message-Id: <20220509173618.467207-3-lvivier@redhat.com>
In-Reply-To: <20220509173618.467207-1-lvivier@redhat.com>
References: <20220509173618.467207-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Copied from socket netdev file and modified to use SocketAddress
to be able to introduce new features like unix socket.

"udp" and "mcast" are squashed into dgram, multicast is detected
according to the IP address type.
"listen" and "connect" modes are changed to "server" and "client".

As qemu_opts_parse_noisily() flattens the QAPI structures ("type" field
of Netdev structure collides with "type" field of SocketAddress),
we detect socket-ng backend and use directly visit_type_Netdev() to
parse the backend parameters.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>

net: socket-ng: replace mode=unicast/multicast by mode=dgram

The multicast mode is detected according to the remote
address type.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hmp-commands.hx |   2 +-
 net/clients.h   |   3 +
 net/hub.c       |   1 +
 net/meson.build |   1 +
 net/net.c       |  61 ++++
 net/socket-ng.c | 890 ++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/net.json   |  41 ++-
 7 files changed, 996 insertions(+), 3 deletions(-)
 create mode 100644 net/socket-ng.c

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 03e6a73d1f55..74f7c9585ac3 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1269,7 +1269,7 @@ ERST
     {
         .name       = "netdev_add",
         .args_type  = "netdev:O",
-        .params     = "[user|tap|socket|vde|bridge|hubport|netmap|vhost-user],id=str[,prop=value][,...]",
+        .params     = "[user|tap|socket|socket-ng|vde|bridge|hubport|netmap|vhost-user],id=str[,prop=value][,...]",
         .help       = "add host network device",
         .cmd        = hmp_netdev_add,
         .command_completion = netdev_add_completion,
diff --git a/net/clients.h b/net/clients.h
index 92f9b59aedce..8c71a3ba8e97 100644
--- a/net/clients.h
+++ b/net/clients.h
@@ -40,6 +40,9 @@ int net_init_hubport(const Netdev *netdev, const char *name,
 int net_init_socket(const Netdev *netdev, const char *name,
                     NetClientState *peer, Error **errp);
 
+int net_init_socket_ng(const Netdev *netdev, const char *name,
+                       NetClientState *peer, Error **errp);
+
 int net_init_tap(const Netdev *netdev, const char *name,
                  NetClientState *peer, Error **errp);
 
diff --git a/net/hub.c b/net/hub.c
index 1375738bf121..8f9607bfe3dc 100644
--- a/net/hub.c
+++ b/net/hub.c
@@ -313,6 +313,7 @@ void net_hub_check_clients(void)
             case NET_CLIENT_DRIVER_USER:
             case NET_CLIENT_DRIVER_TAP:
             case NET_CLIENT_DRIVER_SOCKET:
+            case NET_CLIENT_DRIVER_SOCKET_NG:
             case NET_CLIENT_DRIVER_VDE:
             case NET_CLIENT_DRIVER_VHOST_USER:
                 has_host_dev = 1;
diff --git a/net/meson.build b/net/meson.build
index c965e83b264b..92a8cde119d2 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -13,6 +13,7 @@ softmmu_ss.add(files(
   'net.c',
   'queue.c',
   'socket.c',
+  'socket-ng.c',
   'util.c',
 ))
 
diff --git a/net/net.c b/net/net.c
index 58c05c200622..cbc0ff3784b7 100644
--- a/net/net.c
+++ b/net/net.c
@@ -54,6 +54,7 @@
 #include "net/colo-compare.h"
 #include "net/filter.h"
 #include "qapi/string-output-visitor.h"
+#include "qapi/qobject-input-visitor.h"
 
 /* Net bridge is currently not supported for W32. */
 #if !defined(_WIN32)
@@ -63,6 +64,16 @@
 static VMChangeStateEntry *net_change_state_entry;
 static QTAILQ_HEAD(, NetClientState) net_clients;
 
+typedef struct NetdevQueueEntry {
+    Netdev *nd;
+    Location loc;
+    QSIMPLEQ_ENTRY(NetdevQueueEntry) entry;
+} NetdevQueueEntry;
+
+typedef QSIMPLEQ_HEAD(, NetdevQueueEntry) NetdevQueue;
+
+static NetdevQueue nd_queue = QSIMPLEQ_HEAD_INITIALIZER(nd_queue);
+
 /***********************************************************/
 /* network device redirectors */
 
@@ -1003,6 +1014,7 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
 #endif
         [NET_CLIENT_DRIVER_TAP]       = net_init_tap,
         [NET_CLIENT_DRIVER_SOCKET]    = net_init_socket,
+        [NET_CLIENT_DRIVER_SOCKET_NG]  = net_init_socket_ng,
 #ifdef CONFIG_VDE
         [NET_CLIENT_DRIVER_VDE]       = net_init_vde,
 #endif
@@ -1085,6 +1097,7 @@ void show_netdevs(void)
     int idx;
     const char *available_netdevs[] = {
         "socket",
+        "socket-ng",
         "hubport",
         "tap",
 #ifdef CONFIG_SLIRP
@@ -1559,6 +1572,19 @@ int net_init_clients(Error **errp)
 
     QTAILQ_INIT(&net_clients);
 
+    while (!QSIMPLEQ_EMPTY(&nd_queue)) {
+        NetdevQueueEntry *nd = QSIMPLEQ_FIRST(&nd_queue);
+
+        QSIMPLEQ_REMOVE_HEAD(&nd_queue, entry);
+        loc_push_restore(&nd->loc);
+        if (net_client_init1(nd->nd, true, errp) < 0) {
+            return -1;
+        }
+        loc_pop(&nd->loc);
+        qapi_free_Netdev(nd->nd);
+        g_free(nd);
+    }
+
     if (qemu_opts_foreach(qemu_find_opts("netdev"),
                           net_init_netdev, NULL, errp)) {
         return -1;
@@ -1575,8 +1601,43 @@ int net_init_clients(Error **errp)
     return 0;
 }
 
+static bool netdev_is_socket_ng(const char *optarg)
+{
+    static QemuOptsList dummy_opts = {
+        .name = "netdev",
+        .implied_opt_name = "type",
+        .head = QTAILQ_HEAD_INITIALIZER(dummy_opts.head),
+        .desc = { { } },
+    };
+    QemuOpts *opts = qemu_opts_parse(&dummy_opts, optarg, true, &error_fatal);
+    bool is_socket_ng = strcmp(qemu_opt_get(opts, "type"), "socket-ng") == 0;
+
+    qemu_opts_reset(&dummy_opts);
+
+    return is_socket_ng;
+}
+
 int net_client_parse(QemuOptsList *opts_list, const char *optarg)
 {
+    if (netdev_is_socket_ng(optarg)) {
+            /*
+             * socket-ng must accept new style object SocketAddress
+             * like addr.type=inet, ...
+             */
+            Visitor *v;
+            NetdevQueueEntry *nd;
+
+            v = qobject_input_visitor_new_str(optarg, "type",
+                                              &error_fatal);
+            nd = g_new(NetdevQueueEntry, 1);
+            visit_type_Netdev(v, NULL, &nd->nd, &error_fatal);
+            visit_free(v);
+            loc_save(&nd->loc);
+
+            QSIMPLEQ_INSERT_TAIL(&nd_queue, nd, entry);
+            return 0;
+    }
+
     if (!qemu_opts_parse_noisily(opts_list, optarg, true)) {
         return -1;
     }
diff --git a/net/socket-ng.c b/net/socket-ng.c
new file mode 100644
index 000000000000..0876a4930389
--- /dev/null
+++ b/net/socket-ng.c
@@ -0,0 +1,890 @@
+/*
+ * QEMU System Emulator
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+#include "qemu/osdep.h"
+
+#include "net/net.h"
+#include "clients.h"
+#include "monitor/monitor.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/option.h"
+#include "qemu/sockets.h"
+#include "qemu/iov.h"
+#include "qemu/main-loop.h"
+#include "qemu/cutils.h"
+
+typedef struct NetSocketNGState {
+    NetClientState nc;
+    int listen_fd;
+    int fd;
+    SocketReadState rs;
+    unsigned int send_index;      /* number of bytes sent (only SOCK_STREAM) */
+  /* contains inet host and port destination iff connectionless (SOCK_DGRAM) */
+    struct sockaddr_in dgram_dst;
+    IOHandler *send_fn;           /* differs between SOCK_STREAM/SOCK_DGRAM */
+    bool read_poll;               /* waiting to receive data? */
+    bool write_poll;              /* waiting to transmit data? */
+} NetSocketNGState;
+
+static void net_socket_accept(void *opaque);
+static void net_socket_writable(void *opaque);
+
+static void net_socket_update_fd_handler(NetSocketNGState *s)
+{
+    qemu_set_fd_handler(s->fd,
+                        s->read_poll ? s->send_fn : NULL,
+                        s->write_poll ? net_socket_writable : NULL,
+                        s);
+}
+
+static void net_socket_read_poll(NetSocketNGState *s, bool enable)
+{
+    s->read_poll = enable;
+    net_socket_update_fd_handler(s);
+}
+
+static void net_socket_write_poll(NetSocketNGState *s, bool enable)
+{
+    s->write_poll = enable;
+    net_socket_update_fd_handler(s);
+}
+
+static void net_socket_writable(void *opaque)
+{
+    NetSocketNGState *s = opaque;
+
+    net_socket_write_poll(s, false);
+
+    qemu_flush_queued_packets(&s->nc);
+}
+
+static ssize_t net_socket_receive(NetClientState *nc, const uint8_t *buf,
+                                  size_t size)
+{
+    NetSocketNGState *s = DO_UPCAST(NetSocketNGState, nc, nc);
+    uint32_t len = htonl(size);
+    struct iovec iov[] = {
+        {
+            .iov_base = &len,
+            .iov_len  = sizeof(len),
+        }, {
+            .iov_base = (void *)buf,
+            .iov_len  = size,
+        },
+    };
+    size_t remaining;
+    ssize_t ret;
+
+    remaining = iov_size(iov, 2) - s->send_index;
+    ret = iov_send(s->fd, iov, 2, s->send_index, remaining);
+
+    if (ret == -1 && errno == EAGAIN) {
+        ret = 0; /* handled further down */
+    }
+    if (ret == -1) {
+        s->send_index = 0;
+        return -errno;
+    }
+    if (ret < (ssize_t)remaining) {
+        s->send_index += ret;
+        net_socket_write_poll(s, true);
+        return 0;
+    }
+    s->send_index = 0;
+    return size;
+}
+
+static ssize_t net_socket_receive_dgram(NetClientState *nc,
+                                        const uint8_t *buf, size_t size)
+{
+    NetSocketNGState *s = DO_UPCAST(NetSocketNGState, nc, nc);
+    ssize_t ret;
+
+    do {
+        if (s->dgram_dst.sin_family != AF_UNIX) {
+            ret = sendto(s->fd, buf, size, 0,
+                         (struct sockaddr *)&s->dgram_dst,
+                         sizeof(s->dgram_dst));
+        } else {
+            ret = send(s->fd, buf, size, 0);
+        }
+    } while (ret == -1 && errno == EINTR);
+
+    if (ret == -1 && errno == EAGAIN) {
+        net_socket_write_poll(s, true);
+        return 0;
+    }
+    return ret;
+}
+
+static void net_socket_send_completed(NetClientState *nc, ssize_t len)
+{
+    NetSocketNGState *s = DO_UPCAST(NetSocketNGState, nc, nc);
+
+    if (!s->read_poll) {
+        net_socket_read_poll(s, true);
+    }
+}
+
+static void net_socket_rs_finalize(SocketReadState *rs)
+{
+    NetSocketNGState *s = container_of(rs, NetSocketNGState, rs);
+
+    if (qemu_send_packet_async(&s->nc, rs->buf,
+                               rs->packet_len,
+                               net_socket_send_completed) == 0) {
+        net_socket_read_poll(s, false);
+    }
+}
+
+static void net_socket_send(void *opaque)
+{
+    NetSocketNGState *s = opaque;
+    int size;
+    int ret;
+    uint8_t buf1[NET_BUFSIZE];
+    const uint8_t *buf;
+
+    size = recv(s->fd, buf1, sizeof(buf1), 0);
+    if (size < 0) {
+        if (errno != EWOULDBLOCK) {
+            goto eoc;
+        }
+    } else if (size == 0) {
+        /* end of connection */
+    eoc:
+        net_socket_read_poll(s, false);
+        net_socket_write_poll(s, false);
+        if (s->listen_fd != -1) {
+            qemu_set_fd_handler(s->listen_fd, net_socket_accept, NULL, s);
+        }
+        closesocket(s->fd);
+
+        s->fd = -1;
+        net_socket_rs_init(&s->rs, net_socket_rs_finalize, false);
+        s->nc.link_down = true;
+        memset(s->nc.info_str, 0, sizeof(s->nc.info_str));
+
+        return;
+    }
+    buf = buf1;
+
+    ret = net_fill_rstate(&s->rs, buf, size);
+
+    if (ret == -1) {
+        goto eoc;
+    }
+}
+
+static void net_socket_send_dgram(void *opaque)
+{
+    NetSocketNGState *s = opaque;
+    int size;
+
+    size = recv(s->fd, s->rs.buf, sizeof(s->rs.buf), 0);
+    if (size < 0) {
+        return;
+    }
+    if (size == 0) {
+        /* end of connection */
+        net_socket_read_poll(s, false);
+        net_socket_write_poll(s, false);
+        return;
+    }
+    if (qemu_send_packet_async(&s->nc, s->rs.buf, size,
+                               net_socket_send_completed) == 0) {
+        net_socket_read_poll(s, false);
+    }
+}
+
+static int net_socket_mcast_create(struct sockaddr_in *mcastaddr,
+                                   struct in_addr *localaddr,
+                                   Error **errp)
+{
+    struct ip_mreq imr;
+    int fd;
+    int val, ret;
+#ifdef __OpenBSD__
+    unsigned char loop;
+#else
+    int loop;
+#endif
+
+    if (!IN_MULTICAST(ntohl(mcastaddr->sin_addr.s_addr))) {
+        error_setg(errp, "specified mcastaddr %s (0x%08x) "
+                   "does not contain a multicast address",
+                   inet_ntoa(mcastaddr->sin_addr),
+                   (int)ntohl(mcastaddr->sin_addr.s_addr));
+        return -1;
+    }
+
+    fd = qemu_socket(PF_INET, SOCK_DGRAM, 0);
+    if (fd < 0) {
+        error_setg_errno(errp, errno, "can't create datagram socket");
+        return -1;
+    }
+
+    /*
+     * Allow multiple sockets to bind the same multicast ip and port by setting
+     * SO_REUSEADDR. This is the only situation where SO_REUSEADDR should be set
+     * on windows. Use socket_set_fast_reuse otherwise as it sets SO_REUSEADDR
+     * only on posix systems.
+     */
+    val = 1;
+    ret = setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &val, sizeof(val));
+    if (ret < 0) {
+        error_setg_errno(errp, errno,
+                         "can't set socket option SO_REUSEADDR");
+        goto fail;
+    }
+
+    ret = bind(fd, (struct sockaddr *)mcastaddr, sizeof(*mcastaddr));
+    if (ret < 0) {
+        error_setg_errno(errp, errno, "can't bind ip=%s to socket",
+                         inet_ntoa(mcastaddr->sin_addr));
+        goto fail;
+    }
+
+    /* Add host to multicast group */
+    imr.imr_multiaddr = mcastaddr->sin_addr;
+    if (localaddr) {
+        imr.imr_interface = *localaddr;
+    } else {
+        imr.imr_interface.s_addr = htonl(INADDR_ANY);
+    }
+
+    ret = setsockopt(fd, IPPROTO_IP, IP_ADD_MEMBERSHIP,
+                     &imr, sizeof(struct ip_mreq));
+    if (ret < 0) {
+        error_setg_errno(errp, errno,
+                         "can't add socket to multicast group %s",
+                         inet_ntoa(imr.imr_multiaddr));
+        goto fail;
+    }
+
+    /* Force mcast msgs to loopback (eg. several QEMUs in same host */
+    loop = 1;
+    ret = setsockopt(fd, IPPROTO_IP, IP_MULTICAST_LOOP,
+                     &loop, sizeof(loop));
+    if (ret < 0) {
+        error_setg_errno(errp, errno,
+                         "can't force multicast message to loopback");
+        goto fail;
+    }
+
+    /* If a bind address is given, only send packets from that address */
+    if (localaddr != NULL) {
+        ret = setsockopt(fd, IPPROTO_IP, IP_MULTICAST_IF,
+                         localaddr, sizeof(*localaddr));
+        if (ret < 0) {
+            error_setg_errno(errp, errno,
+                             "can't set the default network send interface");
+            goto fail;
+        }
+    }
+
+    qemu_socket_set_nonblock(fd);
+    return fd;
+fail:
+    if (fd >= 0) {
+        closesocket(fd);
+    }
+    return -1;
+}
+
+static void net_socket_cleanup(NetClientState *nc)
+{
+    NetSocketNGState *s = DO_UPCAST(NetSocketNGState, nc, nc);
+    if (s->fd != -1) {
+        net_socket_read_poll(s, false);
+        net_socket_write_poll(s, false);
+        close(s->fd);
+        s->fd = -1;
+    }
+    if (s->listen_fd != -1) {
+        qemu_set_fd_handler(s->listen_fd, NULL, NULL, NULL);
+        closesocket(s->listen_fd);
+        s->listen_fd = -1;
+    }
+}
+
+static NetClientInfo net_dgram_socket_info = {
+    .type = NET_CLIENT_DRIVER_SOCKET_NG,
+    .size = sizeof(NetSocketNGState),
+    .receive = net_socket_receive_dgram,
+    .cleanup = net_socket_cleanup,
+};
+
+static NetSocketNGState *net_socket_fd_init_dgram(NetClientState *peer,
+                                                const char *model,
+                                                const char *name,
+                                                int fd, int is_fd,
+                                                SocketAddress *mcast,
+                                                Error **errp)
+{
+    struct sockaddr_in saddr;
+    int newfd;
+    NetClientState *nc;
+    NetSocketNGState *s;
+    SocketAddress *sa;
+    SocketAddressType sa_type;
+
+    sa = socket_local_address(fd, errp);
+    if (!sa) {
+        return NULL;
+    }
+    sa_type = sa->type;
+    qapi_free_SocketAddress(sa);
+
+    /*
+     * fd passed: multicast: "learn" dgram_dst address from bound address and
+     * save it. Because this may be "shared" socket from a "master" process,
+     * datagrams would be recv() by ONLY ONE process: we must "clone" this
+     * dgram socket --jjo
+     */
+
+    if (is_fd && mcast != NULL) {
+            if (convert_host_port(&saddr, mcast->u.inet.host,
+                                  mcast->u.inet.port, errp) < 0) {
+                goto err;
+            }
+            /* must be bound */
+            if (saddr.sin_addr.s_addr == 0) {
+                error_setg(errp, "can't setup multicast destination address");
+                goto err;
+            }
+            /* clone dgram socket */
+            newfd = net_socket_mcast_create(&saddr, NULL, errp);
+            if (newfd < 0) {
+                goto err;
+            }
+            /* clone newfd to fd, close newfd */
+            dup2(newfd, fd);
+            close(newfd);
+
+    }
+
+    nc = qemu_new_net_client(&net_dgram_socket_info, peer, model, name);
+
+    s = DO_UPCAST(NetSocketNGState, nc, nc);
+
+    s->fd = fd;
+    s->listen_fd = -1;
+    s->send_fn = net_socket_send_dgram;
+    net_socket_rs_init(&s->rs, net_socket_rs_finalize, false);
+    net_socket_read_poll(s, true);
+
+    /* mcast: save bound address as dst */
+    if (is_fd && mcast != NULL) {
+        s->dgram_dst = saddr;
+        snprintf(nc->info_str, sizeof(nc->info_str),
+                 "socket-ng: fd=%d (cloned mcast=%s:%d)",
+                 fd, inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+    } else {
+        if (sa_type == SOCKET_ADDRESS_TYPE_UNIX) {
+            s->dgram_dst.sin_family = AF_UNIX;
+        }
+
+        snprintf(nc->info_str, sizeof(nc->info_str),
+                 "socket-ng: fd=%d %s", fd, SocketAddressType_str(sa_type));
+    }
+
+    return s;
+
+err:
+    closesocket(fd);
+    return NULL;
+}
+
+static void net_socket_connect(void *opaque)
+{
+    NetSocketNGState *s = opaque;
+    s->send_fn = net_socket_send;
+    net_socket_read_poll(s, true);
+}
+
+static NetClientInfo net_socket_info = {
+    .type = NET_CLIENT_DRIVER_SOCKET_NG,
+    .size = sizeof(NetSocketNGState),
+    .receive = net_socket_receive,
+    .cleanup = net_socket_cleanup,
+};
+
+static NetSocketNGState *net_socket_fd_init_stream(NetClientState *peer,
+                                                 const char *model,
+                                                 const char *name,
+                                                 int fd, int is_connected)
+{
+    NetClientState *nc;
+    NetSocketNGState *s;
+
+    nc = qemu_new_net_client(&net_socket_info, peer, model, name);
+
+    snprintf(nc->info_str, sizeof(nc->info_str), "socket-ng: fd=%d", fd);
+
+    s = DO_UPCAST(NetSocketNGState, nc, nc);
+
+    s->fd = fd;
+    s->listen_fd = -1;
+    net_socket_rs_init(&s->rs, net_socket_rs_finalize, false);
+
+    /* Disable Nagle algorithm on TCP sockets to reduce latency */
+    socket_set_nodelay(fd);
+
+    if (is_connected) {
+        net_socket_connect(s);
+    } else {
+        qemu_set_fd_handler(s->fd, NULL, net_socket_connect, s);
+    }
+    return s;
+}
+
+static void net_socket_accept(void *opaque)
+{
+    NetSocketNGState *s = opaque;
+    struct sockaddr_in saddr;
+    socklen_t len;
+    int fd;
+
+    for (;;) {
+        len = sizeof(saddr);
+        fd = qemu_accept(s->listen_fd, (struct sockaddr *)&saddr, &len);
+        if (fd < 0 && errno != EINTR) {
+            return;
+        } else if (fd >= 0) {
+            qemu_set_fd_handler(s->listen_fd, NULL, NULL, NULL);
+            break;
+        }
+    }
+
+    s->fd = fd;
+    s->nc.link_down = false;
+    net_socket_connect(s);
+    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
+             "socket-ng: connection from %s:%d",
+             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+}
+
+static int net_socketng_listen_init(NetClientState *peer,
+                                    const char *model,
+                                    const char *name,
+                                    SocketAddress *addr,
+                                    Error **errp)
+{
+    NetClientState *nc;
+    NetSocketNGState *s;
+    int fd, ret;
+
+    switch (addr->type) {
+    case SOCKET_ADDRESS_TYPE_INET: {
+        struct sockaddr_in saddr_in;
+
+        if (convert_host_port(&saddr_in, addr->u.inet.host, addr->u.inet.port,
+                              errp) < 0) {
+            return -1;
+        }
+
+        fd = qemu_socket(PF_INET, SOCK_STREAM, 0);
+        if (fd < 0) {
+            error_setg_errno(errp, errno, "can't create stream socket");
+            return -1;
+        }
+        qemu_socket_set_nonblock(fd);
+
+        socket_set_fast_reuse(fd);
+
+        ret = bind(fd, (struct sockaddr *)&saddr_in, sizeof(saddr_in));
+        if (ret < 0) {
+            error_setg_errno(errp, errno, "can't bind ip=%s to socket",
+                             inet_ntoa(saddr_in.sin_addr));
+            closesocket(fd);
+            return -1;
+        }
+        break;
+    }
+    case SOCKET_ADDRESS_TYPE_UNIX: {
+        error_setg(errp, "only support inet type");
+        return -1;
+    }
+    case SOCKET_ADDRESS_TYPE_FD:
+        fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
+        if (fd == -1) {
+            return -1;
+        }
+        ret = qemu_socket_try_set_nonblock(fd);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
+                             name, fd);
+            return -1;
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    ret = listen(fd, 0);
+    if (ret < 0) {
+        error_setg_errno(errp, errno, "can't listen on socket");
+        closesocket(fd);
+        return -1;
+    }
+
+    nc = qemu_new_net_client(&net_socket_info, peer, model, name);
+    s = DO_UPCAST(NetSocketNGState, nc, nc);
+    s->fd = -1;
+    s->listen_fd = fd;
+    s->nc.link_down = true;
+    net_socket_rs_init(&s->rs, net_socket_rs_finalize, false);
+
+    qemu_set_fd_handler(s->listen_fd, net_socket_accept, NULL, s);
+    return 0;
+}
+
+static int net_socketng_connect_init(NetClientState *peer,
+                                   const char *model,
+                                   const char *name,
+                                   SocketAddress *addr,
+                                   Error **errp)
+{
+    NetSocketNGState *s;
+    int fd, connected, ret;
+    gchar *info_str;
+
+    switch (addr->type) {
+    case SOCKET_ADDRESS_TYPE_INET: {
+        struct sockaddr_in saddr_in;
+
+        if (convert_host_port(&saddr_in, addr->u.inet.host, addr->u.inet.port,
+                              errp) < 0) {
+            return -1;
+        }
+
+        fd = qemu_socket(PF_INET, SOCK_STREAM, 0);
+        if (fd < 0) {
+            error_setg_errno(errp, errno, "can't create stream socket");
+            return -1;
+        }
+        qemu_socket_set_nonblock(fd);
+
+        connected = 0;
+        for (;;) {
+            ret = connect(fd, (struct sockaddr *)&saddr_in, sizeof(saddr_in));
+            if (ret < 0) {
+                if (errno == EINTR || errno == EWOULDBLOCK) {
+                    /* continue */
+                } else if (errno == EINPROGRESS ||
+                           errno == EALREADY ||
+                           errno == EINVAL) {
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
+        info_str = g_strdup_printf("socket-ng: connect to %s:%d",
+                                   inet_ntoa(saddr_in.sin_addr),
+                                   ntohs(saddr_in.sin_port));
+        break;
+    }
+    case SOCKET_ADDRESS_TYPE_FD:
+        fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
+        if (fd == -1) {
+            return -1;
+        }
+        ret = qemu_socket_try_set_nonblock(fd);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
+                             name, fd);
+            return -1;
+        }
+        connected = 1;
+        info_str = g_strdup_printf("socket-ng: connect to fd %d", fd);
+        break;
+    default:
+        error_setg(errp, "only support inet or fd type");
+        return -1;
+    }
+
+    s = net_socket_fd_init_stream(peer, model, name, fd, connected);
+
+    pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), info_str);
+    g_free(info_str);
+
+    return 0;
+}
+
+static int net_socketng_mcast_init(NetClientState *peer,
+                                 const char *model,
+                                 const char *name,
+                                 SocketAddress *remote,
+                                 SocketAddress *local,
+                                 Error **errp)
+{
+    NetSocketNGState *s;
+    int fd, ret;
+    struct sockaddr_in saddr;
+
+    if (remote->type != SOCKET_ADDRESS_TYPE_INET) {
+        error_setg(errp, "multicast only support inet type");
+        return -1;
+    }
+
+    if (convert_host_port(&saddr, remote->u.inet.host, remote->u.inet.port,
+                          errp) < 0) {
+        return -1;
+    }
+
+    if (!local) {
+        fd = net_socket_mcast_create(&saddr, NULL, errp);
+        if (fd < 0) {
+            return -1;
+        }
+    } else {
+        switch (local->type) {
+        case SOCKET_ADDRESS_TYPE_INET: {
+            struct in_addr localaddr;
+
+            if (inet_aton(local->u.inet.host, &localaddr) == 0) {
+                error_setg(errp, "localaddr '%s' is not a valid IPv4 address",
+                           local->u.inet.host);
+                return -1;
+            }
+
+            fd = net_socket_mcast_create(&saddr, &localaddr, errp);
+            if (fd < 0) {
+                return -1;
+            }
+            break;
+        }
+        case SOCKET_ADDRESS_TYPE_FD:
+            fd = monitor_fd_param(monitor_cur(), local->u.fd.str, errp);
+            if (fd == -1) {
+                return -1;
+            }
+            ret = qemu_socket_try_set_nonblock(fd);
+            if (ret < 0) {
+                error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
+                                 name, fd);
+                return -1;
+            }
+            break;
+        default:
+            error_setg(errp, "only support inet or fd type for local");
+            return -1;
+        }
+    }
+
+    s = net_socket_fd_init_dgram(peer, model, name, fd,
+                                 local->type == SOCKET_ADDRESS_TYPE_FD,
+                                 remote, errp);
+    if (!s) {
+        return -1;
+    }
+
+    s->dgram_dst = saddr;
+
+    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
+             "socket-ng: mcast=%s:%d",
+             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+    return 0;
+
+}
+
+static int net_socketng_udp_init(NetClientState *peer,
+                                 const char *model,
+                                 const char *name,
+                                 SocketAddress *remote,
+                                 SocketAddress *local,
+                                 Error **errp)
+{
+    NetSocketNGState *s;
+    int fd, ret;
+    struct sockaddr_in raddr_in;
+    gchar *info_str;
+
+    if (remote) {
+        if (local->type == SOCKET_ADDRESS_TYPE_FD) {
+            error_setg(errp, "don't set remote with local.fd");
+            return -1;
+        }
+        if (remote->type != local->type) {
+            error_setg(errp, "remote and local types must be the same");
+            return -1;
+        }
+    } else {
+        if (local->type != SOCKET_ADDRESS_TYPE_FD) {
+            error_setg(errp, "type=inet and mode=unicast require "
+                             "remote parameter");
+            return -1;
+        }
+    }
+
+    switch (local->type) {
+    case SOCKET_ADDRESS_TYPE_INET: {
+        struct sockaddr_in laddr_in;
+
+        if (convert_host_port(&laddr_in, local->u.inet.host, local->u.inet.port,
+                              errp) < 0) {
+            return -1;
+        }
+
+        if (convert_host_port(&raddr_in, remote->u.inet.host,
+                              remote->u.inet.port, errp) < 0) {
+            return -1;
+        }
+
+        fd = qemu_socket(PF_INET, SOCK_DGRAM, 0);
+        if (fd < 0) {
+            error_setg_errno(errp, errno, "can't create datagram socket");
+            return -1;
+        }
+
+        ret = socket_set_fast_reuse(fd);
+        if (ret < 0) {
+            error_setg_errno(errp, errno,
+                             "can't set socket option SO_REUSEADDR");
+            closesocket(fd);
+            return -1;
+        }
+        ret = bind(fd, (struct sockaddr *)&laddr_in, sizeof(laddr_in));
+        if (ret < 0) {
+            error_setg_errno(errp, errno, "can't bind ip=%s to socket",
+                             inet_ntoa(laddr_in.sin_addr));
+            closesocket(fd);
+            return -1;
+        }
+        qemu_socket_set_nonblock(fd);
+
+        info_str = g_strdup_printf("socket-ng: udp=%s:%d/%s:%d",
+                 inet_ntoa(laddr_in.sin_addr), ntohs(laddr_in.sin_port),
+                 inet_ntoa(raddr_in.sin_addr), ntohs(raddr_in.sin_port));
+
+        break;
+    }
+    case SOCKET_ADDRESS_TYPE_FD:
+        fd = monitor_fd_param(monitor_cur(), local->u.fd.str, errp);
+        if (fd == -1) {
+            return -1;
+        }
+        ret = qemu_socket_try_set_nonblock(fd);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
+                             name, fd);
+            return -1;
+        }
+        break;
+    default:
+        error_setg(errp, "only support inet or fd type for local");
+        return -1;
+    }
+
+    s = net_socket_fd_init_dgram(peer, model, name, fd, 0, NULL, errp);
+    if (!s) {
+        return -1;
+    }
+
+    if (remote) {
+        s->dgram_dst = raddr_in;
+
+        pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), info_str);
+        g_free(info_str);
+    }
+    return 0;
+}
+
+static int net_socketng_dgram_init(NetClientState *peer,
+                                 const char *model,
+                                 const char *name,
+                                 SocketAddress *remote,
+                                 SocketAddress *local,
+                                 Error **errp)
+{
+    /* detect multicast address */
+    if (remote && remote->type == SOCKET_ADDRESS_TYPE_INET) {
+        struct sockaddr_in mcastaddr;
+
+        if (convert_host_port(&mcastaddr, remote->u.inet.host,
+                              remote->u.inet.port, errp) < 0) {
+            return -1;
+        }
+
+        if (IN_MULTICAST(ntohl(mcastaddr.sin_addr.s_addr))) {
+            return net_socketng_mcast_init(peer, model, name, remote, local,
+                                           errp);
+        }
+    }
+    /* unicast address */
+    if (!local) {
+        error_setg(errp, "mode=dgram requires local= parameter");
+        return -1;
+    }
+    return net_socketng_udp_init(peer, model, name, remote, local, errp);
+}
+
+int net_init_socket_ng(const Netdev *netdev, const char *name,
+                    NetClientState *peer, Error **errp)
+{
+    const NetdevSocketNGOptions *sock;
+
+    assert(netdev->type == NET_CLIENT_DRIVER_SOCKET_NG);
+    sock = &netdev->u.socket_ng;
+
+    switch (sock->mode) {
+    case NETDEV_SOCKETNG_MODE_DGRAM:
+        return net_socketng_dgram_init(peer, "socket", name, sock->remote,
+                                       sock->local, errp);
+    case NETDEV_SOCKETNG_MODE_SERVER:
+        if (!sock->has_addr) {
+            error_setg(errp, "mode=server requires addr parameter");
+            return -1;
+        }
+        if (sock->has_remote || sock->has_local) {
+            error_setg(errp,
+                 "local and remote parameters cannot be used with mode=server");
+            return -1;
+        }
+        return net_socketng_listen_init(peer, "socket", name, sock->addr, errp);
+    case NETDEV_SOCKETNG_MODE_CLIENT:
+        if (!sock->has_addr) {
+            error_setg(errp, "mode=client requires addr parameter");
+            return -1;
+        }
+        if (sock->has_remote || sock->has_local) {
+            error_setg(errp,
+                 "local and remote parameters cannot be used with mode=client");
+            return -1;
+        }
+        return net_socketng_connect_init(peer, "socket", name, sock->addr,
+                                         errp);
+    default:
+        g_assert_not_reached();
+    }
+
+    g_assert_not_reached();
+}
diff --git a/qapi/net.json b/qapi/net.json
index b92f3f5fb444..2b31101e6641 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -7,6 +7,7 @@
 ##
 
 { 'include': 'common.json' }
+{ 'include': 'sockets.json' }
 
 ##
 # @set_link:
@@ -452,6 +453,40 @@
     '*vhostdev':     'str',
     '*queues':       'int' } }
 
+##
+# @NetdevSocketNGMode:
+#
+# @dgram: UDP mode
+#
+# @server: TCP server mode
+#
+# @client: TCP client mode
+#
+# Legacy NetdevSocketOptions only accepts one of:
+# "fd", "udp", "mcast" and "udp".
+# we map:
+#   "udp", "mcast" -> "dgram"
+#   "listen"       -> "server"
+#   "connect"      -> "client"
+#
+# Since: 7.1
+#
+##
+{ 'enum': 'NetdevSocketNGMode',
+  'data':  [ 'dgram', 'server', 'client' ] }
+
+##
+# @NetdevSocketNGOptions:
+#
+# Since: 7.1
+##
+{ 'struct': 'NetdevSocketNGOptions',
+  'data': {
+    'mode':    'NetdevSocketNGMode',
+    '*addr':   'SocketAddress',
+    '*remote': 'SocketAddress',
+    '*local':  'SocketAddress' } }
+
 ##
 # @NetClientDriver:
 #
@@ -463,7 +498,8 @@
 ##
 { 'enum': 'NetClientDriver',
   'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
-            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
+            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
+            'socket-ng' ] }
 
 ##
 # @Netdev:
@@ -492,7 +528,8 @@
     'hubport':  'NetdevHubPortOptions',
     'netmap':   'NetdevNetmapOptions',
     'vhost-user': 'NetdevVhostUserOptions',
-    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
+    'vhost-vdpa': 'NetdevVhostVDPAOptions',
+    'socket-ng': 'NetdevSocketNGOptions' } }
 
 ##
 # @RxState:
-- 
2.35.3


