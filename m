Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A777610A00
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:58:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIFT-0007MG-0Q; Fri, 28 Oct 2022 01:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIFQ-0007Lp-Sg
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:49:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIFN-0007Z8-Dj
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666936176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4b0O98URNmYA5INn4q1tSh/zP5+279wMvOxv+PqUc6s=;
 b=iJduWVgScAIxklrBiEdzlFSwPK9XH9jtBnq9bZbGwAQvvgX30RaWUSKSs5Kp6AIu3nrrMz
 6UYxP4OBhavO2nuO82WsxiWTS0vD7IAEbDV/1wDsPATZZU5aSj7Tus9GSG07d3hJaAt38C
 sHF3bHJtmgsCpFSqGvidDPESWjx+BCY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-zmyvrfR2NxS3FCenEQCOOA-1; Fri, 28 Oct 2022 01:49:33 -0400
X-MC-Unique: zmyvrfR2NxS3FCenEQCOOA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F316685A583
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:49:32 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-50.pek2.redhat.com [10.72.13.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08721C15BA8;
 Fri, 28 Oct 2022 05:49:29 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 16/26] qapi: net: add stream and dgram netdevs
Date: Fri, 28 Oct 2022 13:48:25 +0800
Message-Id: <20221028054835.29674-17-jasowang@redhat.com>
In-Reply-To: <20221028054835.29674-1-jasowang@redhat.com>
References: <20221028054835.29674-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Laurent Vivier <lvivier@redhat.com>

Copied from socket netdev file and modified to use SocketAddress
to be able to introduce new features like unix socket.

"udp" and "mcast" are squashed into dgram netdev, multicast is detected
according to the IP address type.
"listen" and "connect" modes are managed by stream netdev. An optional
parameter "server" defines the mode (off by default)

The two new types need to be parsed the modern way with -netdev, because
with the traditional way, the "type" field of netdev structure collides with
the "type" field of SocketAddress and prevents the correct evaluation of the
command line option. Moreover the traditional way doesn't allow to use
the same type (SocketAddress) several times with the -netdev option
(needed to specify "local" and "remote" addresses).

The previous commit paved the way for parsing the modern way, but
omitted one detail: how to pick modern vs. traditional, in
netdev_is_modern().

We want to pick based on the value of parameter "type".  But how to
extract it from the option argument?

Parsing the option argument, either the modern or the traditional way,
extracts it for us, but only if parsing succeeds.

If parsing fails, there is no good option.  No matter which parser we
pick, it'll be the wrong one for some arguments, and the error
reporting will be confusing.

Fortunately, the traditional parser accepts *anything* when called in
a certain way.  This maximizes our chance to extract the value of
"type", and in turn minimizes the risk of confusing error reporting.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hmp-commands.hx |   2 +-
 net/clients.h   |   6 +
 net/dgram.c     | 537 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 net/hub.c       |   2 +
 net/meson.build |   2 +
 net/net.c       |  30 +++-
 net/stream.c    | 425 ++++++++++++++++++++++++++++++++++++++++++++
 qapi/net.json   |  66 ++++++-
 qemu-options.hx |  12 ++
 9 files changed, 1078 insertions(+), 4 deletions(-)
 create mode 100644 net/dgram.c
 create mode 100644 net/stream.c

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 12b6d4e..673e39a 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1276,7 +1276,7 @@ ERST
     {
         .name       = "netdev_add",
         .args_type  = "netdev:O",
-        .params     = "[user|tap|socket|vde|bridge|hubport|netmap|vhost-user"
+        .params     = "[user|tap|socket|stream|dgram|vde|bridge|hubport|netmap|vhost-user"
 #ifdef CONFIG_VMNET
                       "|vmnet-host|vmnet-shared|vmnet-bridged"
 #endif
diff --git a/net/clients.h b/net/clients.h
index c915778..ed8bdff 100644
--- a/net/clients.h
+++ b/net/clients.h
@@ -40,6 +40,12 @@ int net_init_hubport(const Netdev *netdev, const char *name,
 int net_init_socket(const Netdev *netdev, const char *name,
                     NetClientState *peer, Error **errp);
 
+int net_init_stream(const Netdev *netdev, const char *name,
+                    NetClientState *peer, Error **errp);
+
+int net_init_dgram(const Netdev *netdev, const char *name,
+                   NetClientState *peer, Error **errp);
+
 int net_init_tap(const Netdev *netdev, const char *name,
                  NetClientState *peer, Error **errp);
 
diff --git a/net/dgram.c b/net/dgram.c
new file mode 100644
index 0000000..5339585
--- /dev/null
+++ b/net/dgram.c
@@ -0,0 +1,537 @@
+/*
+ * QEMU System Emulator
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ * Copyright (c) 2022 Red Hat, Inc.
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
+
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
+typedef struct NetDgramState {
+    NetClientState nc;
+    int fd;
+    SocketReadState rs;
+    struct sockaddr_in dgram_dst; /* contains destination iff connectionless */
+    bool read_poll;               /* waiting to receive data? */
+    bool write_poll;              /* waiting to transmit data? */
+} NetDgramState;
+
+static void net_dgram_send(void *opaque);
+static void net_dgram_writable(void *opaque);
+
+static void net_dgram_update_fd_handler(NetDgramState *s)
+{
+    qemu_set_fd_handler(s->fd,
+                        s->read_poll ? net_dgram_send : NULL,
+                        s->write_poll ? net_dgram_writable : NULL,
+                        s);
+}
+
+static void net_dgram_read_poll(NetDgramState *s, bool enable)
+{
+    s->read_poll = enable;
+    net_dgram_update_fd_handler(s);
+}
+
+static void net_dgram_write_poll(NetDgramState *s, bool enable)
+{
+    s->write_poll = enable;
+    net_dgram_update_fd_handler(s);
+}
+
+static void net_dgram_writable(void *opaque)
+{
+    NetDgramState *s = opaque;
+
+    net_dgram_write_poll(s, false);
+
+    qemu_flush_queued_packets(&s->nc);
+}
+
+static ssize_t net_dgram_receive(NetClientState *nc,
+                                 const uint8_t *buf, size_t size)
+{
+    NetDgramState *s = DO_UPCAST(NetDgramState, nc, nc);
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
+        net_dgram_write_poll(s, true);
+        return 0;
+    }
+    return ret;
+}
+
+static void net_dgram_send_completed(NetClientState *nc, ssize_t len)
+{
+    NetDgramState *s = DO_UPCAST(NetDgramState, nc, nc);
+
+    if (!s->read_poll) {
+        net_dgram_read_poll(s, true);
+    }
+}
+
+static void net_dgram_rs_finalize(SocketReadState *rs)
+{
+    NetDgramState *s = container_of(rs, NetDgramState, rs);
+
+    if (qemu_send_packet_async(&s->nc, rs->buf,
+                               rs->packet_len,
+                               net_dgram_send_completed) == 0) {
+        net_dgram_read_poll(s, false);
+    }
+}
+
+static void net_dgram_send(void *opaque)
+{
+    NetDgramState *s = opaque;
+    int size;
+
+    size = recv(s->fd, s->rs.buf, sizeof(s->rs.buf), 0);
+    if (size < 0) {
+        return;
+    }
+    if (size == 0) {
+        /* end of connection */
+        net_dgram_read_poll(s, false);
+        net_dgram_write_poll(s, false);
+        return;
+    }
+    if (qemu_send_packet_async(&s->nc, s->rs.buf, size,
+                               net_dgram_send_completed) == 0) {
+        net_dgram_read_poll(s, false);
+    }
+}
+
+static int net_dgram_mcast_create(struct sockaddr_in *mcastaddr,
+                                  struct in_addr *localaddr,
+                                  Error **errp)
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
+        error_setg_errno(errp, errno, "can't set socket option SO_REUSEADDR");
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
+static void net_dgram_cleanup(NetClientState *nc)
+{
+    NetDgramState *s = DO_UPCAST(NetDgramState, nc, nc);
+    if (s->fd != -1) {
+        net_dgram_read_poll(s, false);
+        net_dgram_write_poll(s, false);
+        close(s->fd);
+        s->fd = -1;
+    }
+}
+
+static NetClientInfo net_dgram_socket_info = {
+    .type = NET_CLIENT_DRIVER_DGRAM,
+    .size = sizeof(NetDgramState),
+    .receive = net_dgram_receive,
+    .cleanup = net_dgram_cleanup,
+};
+
+static NetDgramState *net_dgram_fd_init(NetClientState *peer,
+                                        const char *model,
+                                        const char *name,
+                                        int fd, int is_fd,
+                                        SocketAddress *mcast,
+                                        Error **errp)
+{
+    struct sockaddr_in saddr;
+    int newfd;
+    NetClientState *nc;
+    NetDgramState *s;
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
+            newfd = net_dgram_mcast_create(&saddr, NULL, errp);
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
+    s = DO_UPCAST(NetDgramState, nc, nc);
+
+    s->fd = fd;
+    net_socket_rs_init(&s->rs, net_dgram_rs_finalize, false);
+    net_dgram_read_poll(s, true);
+
+    /* mcast: save bound address as dst */
+    if (is_fd && mcast != NULL) {
+        s->dgram_dst = saddr;
+        qemu_set_info_str(nc, "fd=%d (cloned mcast=%s:%d)", fd,
+                          inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+    } else {
+        if (sa_type == SOCKET_ADDRESS_TYPE_UNIX) {
+            s->dgram_dst.sin_family = AF_UNIX;
+        }
+
+        qemu_set_info_str(nc, "fd=%d %s", fd, SocketAddressType_str(sa_type));
+    }
+
+    return s;
+
+err:
+    closesocket(fd);
+    return NULL;
+}
+
+static int net_dgram_mcast_init(NetClientState *peer,
+                                const char *model,
+                                const char *name,
+                                SocketAddress *remote,
+                                SocketAddress *local,
+                                Error **errp)
+{
+    NetDgramState *s;
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
+        fd = net_dgram_mcast_create(&saddr, NULL, errp);
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
+            fd = net_dgram_mcast_create(&saddr, &localaddr, errp);
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
+    s = net_dgram_fd_init(peer, model, name, fd,
+                          local->type == SOCKET_ADDRESS_TYPE_FD,
+                          remote, errp);
+    if (!s) {
+        return -1;
+    }
+
+    s->dgram_dst = saddr;
+
+    qemu_set_info_str(&s->nc, "mcast=%s:%d", inet_ntoa(saddr.sin_addr),
+                      ntohs(saddr.sin_port));
+    return 0;
+
+}
+
+
+int net_init_dgram(const Netdev *netdev, const char *name,
+                   NetClientState *peer, Error **errp)
+{
+    NetDgramState *s;
+    int fd, ret;
+    struct sockaddr_in raddr_in;
+    struct sockaddr_in laddr_in;
+    SocketAddress *remote, *local;
+
+    assert(netdev->type == NET_CLIENT_DRIVER_DGRAM);
+
+    remote = netdev->u.dgram.remote;
+    local = netdev->u.dgram.local;
+
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
+            return net_dgram_mcast_init(peer, "dram", name, remote, local,
+                                           errp);
+        }
+    }
+
+    /* unicast address */
+    if (!local) {
+        error_setg(errp, "dgram requires local= parameter");
+        return -1;
+    }
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
+            error_setg(errp, "type=inet requires remote parameter");
+            return -1;
+        }
+    }
+
+    switch (local->type) {
+    case SOCKET_ADDRESS_TYPE_INET:
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
+        break;
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
+    s = net_dgram_fd_init(peer, "dgram", name, fd, 0, NULL, errp);
+    if (!s) {
+        return -1;
+    }
+
+    if (remote) {
+        s->dgram_dst = raddr_in;
+    }
+
+    switch (local->type) {
+    case SOCKET_ADDRESS_TYPE_INET:
+        qemu_set_info_str(&s->nc, "udp=%s:%d/%s:%d",
+                          inet_ntoa(laddr_in.sin_addr),
+                          ntohs(laddr_in.sin_port),
+                          inet_ntoa(raddr_in.sin_addr),
+                          ntohs(raddr_in.sin_port));
+        break;
+    case SOCKET_ADDRESS_TYPE_FD:
+        qemu_set_info_str(&s->nc, "fd=%d", fd);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return 0;
+}
diff --git a/net/hub.c b/net/hub.c
index 1375738..67ca534 100644
--- a/net/hub.c
+++ b/net/hub.c
@@ -313,6 +313,8 @@ void net_hub_check_clients(void)
             case NET_CLIENT_DRIVER_USER:
             case NET_CLIENT_DRIVER_TAP:
             case NET_CLIENT_DRIVER_SOCKET:
+            case NET_CLIENT_DRIVER_STREAM:
+            case NET_CLIENT_DRIVER_DGRAM:
             case NET_CLIENT_DRIVER_VDE:
             case NET_CLIENT_DRIVER_VHOST_USER:
                 has_host_dev = 1;
diff --git a/net/meson.build b/net/meson.build
index d1be76d..6cd1e3d 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -13,6 +13,8 @@ softmmu_ss.add(files(
   'net.c',
   'queue.c',
   'socket.c',
+  'stream.c',
+  'dgram.c',
   'util.c',
 ))
 
diff --git a/net/net.c b/net/net.c
index f29a59c..840ad9d 100644
--- a/net/net.c
+++ b/net/net.c
@@ -48,6 +48,7 @@
 #include "qemu/qemu-print.h"
 #include "qemu/main-loop.h"
 #include "qemu/option.h"
+#include "qemu/keyval.h"
 #include "qapi/error.h"
 #include "qapi/opts-visitor.h"
 #include "sysemu/runstate.h"
@@ -1021,6 +1022,8 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
 #endif
         [NET_CLIENT_DRIVER_TAP]       = net_init_tap,
         [NET_CLIENT_DRIVER_SOCKET]    = net_init_socket,
+        [NET_CLIENT_DRIVER_STREAM]    = net_init_stream,
+        [NET_CLIENT_DRIVER_DGRAM]     = net_init_dgram,
 #ifdef CONFIG_VDE
         [NET_CLIENT_DRIVER_VDE]       = net_init_vde,
 #endif
@@ -1112,6 +1115,8 @@ void show_netdevs(void)
     int idx;
     const char *available_netdevs[] = {
         "socket",
+        "stream",
+        "dgram",
         "hubport",
         "tap",
 #ifdef CONFIG_SLIRP
@@ -1624,7 +1629,30 @@ void net_init_clients(void)
  */
 bool netdev_is_modern(const char *optarg)
 {
-    return false;
+    QemuOpts *opts;
+    bool is_modern;
+    const char *type;
+    static QemuOptsList dummy_opts = {
+        .name = "netdev",
+        .implied_opt_name = "type",
+        .head = QTAILQ_HEAD_INITIALIZER(dummy_opts.head),
+        .desc = { { } },
+    };
+
+    if (optarg[0] == '{') {
+        /* This is JSON, which means it's modern syntax */
+        return true;
+    }
+
+    opts = qemu_opts_create(&dummy_opts, NULL, false, &error_abort);
+    qemu_opts_do_parse(opts, optarg, dummy_opts.implied_opt_name,
+                       &error_abort);
+    type = qemu_opt_get(opts, "type");
+    is_modern = !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");
+
+    qemu_opts_reset(&dummy_opts);
+
+    return is_modern;
 }
 
 /*
diff --git a/net/stream.c b/net/stream.c
new file mode 100644
index 0000000..0a7e847
--- /dev/null
+++ b/net/stream.c
@@ -0,0 +1,425 @@
+/*
+ * QEMU System Emulator
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ * Copyright (c) 2022 Red Hat, Inc.
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
+
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
+typedef struct NetStreamState {
+    NetClientState nc;
+    int listen_fd;
+    int fd;
+    SocketReadState rs;
+    unsigned int send_index;      /* number of bytes sent*/
+    bool read_poll;               /* waiting to receive data? */
+    bool write_poll;              /* waiting to transmit data? */
+} NetStreamState;
+
+static void net_stream_send(void *opaque);
+static void net_stream_accept(void *opaque);
+static void net_stream_writable(void *opaque);
+
+static void net_stream_update_fd_handler(NetStreamState *s)
+{
+    qemu_set_fd_handler(s->fd,
+                        s->read_poll ? net_stream_send : NULL,
+                        s->write_poll ? net_stream_writable : NULL,
+                        s);
+}
+
+static void net_stream_read_poll(NetStreamState *s, bool enable)
+{
+    s->read_poll = enable;
+    net_stream_update_fd_handler(s);
+}
+
+static void net_stream_write_poll(NetStreamState *s, bool enable)
+{
+    s->write_poll = enable;
+    net_stream_update_fd_handler(s);
+}
+
+static void net_stream_writable(void *opaque)
+{
+    NetStreamState *s = opaque;
+
+    net_stream_write_poll(s, false);
+
+    qemu_flush_queued_packets(&s->nc);
+}
+
+static ssize_t net_stream_receive(NetClientState *nc, const uint8_t *buf,
+                                  size_t size)
+{
+    NetStreamState *s = DO_UPCAST(NetStreamState, nc, nc);
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
+        net_stream_write_poll(s, true);
+        return 0;
+    }
+    s->send_index = 0;
+    return size;
+}
+
+static void net_stream_send_completed(NetClientState *nc, ssize_t len)
+{
+    NetStreamState *s = DO_UPCAST(NetStreamState, nc, nc);
+
+    if (!s->read_poll) {
+        net_stream_read_poll(s, true);
+    }
+}
+
+static void net_stream_rs_finalize(SocketReadState *rs)
+{
+    NetStreamState *s = container_of(rs, NetStreamState, rs);
+
+    if (qemu_send_packet_async(&s->nc, rs->buf,
+                               rs->packet_len,
+                               net_stream_send_completed) == 0) {
+        net_stream_read_poll(s, false);
+    }
+}
+
+static void net_stream_send(void *opaque)
+{
+    NetStreamState *s = opaque;
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
+        net_stream_read_poll(s, false);
+        net_stream_write_poll(s, false);
+        if (s->listen_fd != -1) {
+            qemu_set_fd_handler(s->listen_fd, net_stream_accept, NULL, s);
+        }
+        closesocket(s->fd);
+
+        s->fd = -1;
+        net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
+        s->nc.link_down = true;
+        qemu_set_info_str(&s->nc, "");
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
+static void net_stream_cleanup(NetClientState *nc)
+{
+    NetStreamState *s = DO_UPCAST(NetStreamState, nc, nc);
+    if (s->fd != -1) {
+        net_stream_read_poll(s, false);
+        net_stream_write_poll(s, false);
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
+static void net_stream_connect(void *opaque)
+{
+    NetStreamState *s = opaque;
+    net_stream_read_poll(s, true);
+}
+
+static NetClientInfo net_stream_info = {
+    .type = NET_CLIENT_DRIVER_STREAM,
+    .size = sizeof(NetStreamState),
+    .receive = net_stream_receive,
+    .cleanup = net_stream_cleanup,
+};
+
+static NetStreamState *net_stream_fd_init(NetClientState *peer,
+                                          const char *model,
+                                          const char *name,
+                                          int fd, int is_connected)
+{
+    NetClientState *nc;
+    NetStreamState *s;
+
+    nc = qemu_new_net_client(&net_stream_info, peer, model, name);
+
+    qemu_set_info_str(nc, "fd=%d", fd);
+
+    s = DO_UPCAST(NetStreamState, nc, nc);
+
+    s->fd = fd;
+    s->listen_fd = -1;
+    net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
+
+    /* Disable Nagle algorithm on TCP sockets to reduce latency */
+    socket_set_nodelay(fd);
+
+    if (is_connected) {
+        net_stream_connect(s);
+    } else {
+        qemu_set_fd_handler(s->fd, NULL, net_stream_connect, s);
+    }
+    return s;
+}
+
+static void net_stream_accept(void *opaque)
+{
+    NetStreamState *s = opaque;
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
+    net_stream_connect(s);
+    qemu_set_info_str(&s->nc, "connection from %s:%d",
+                      inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+}
+
+static int net_stream_server_init(NetClientState *peer,
+                                  const char *model,
+                                  const char *name,
+                                  SocketAddress *addr,
+                                  Error **errp)
+{
+    NetClientState *nc;
+    NetStreamState *s;
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
+        error_setg(errp, "only support inet or fd type");
+        return -1;
+    }
+
+    ret = listen(fd, 0);
+    if (ret < 0) {
+        error_setg_errno(errp, errno, "can't listen on socket");
+        closesocket(fd);
+        return -1;
+    }
+
+    nc = qemu_new_net_client(&net_stream_info, peer, model, name);
+    s = DO_UPCAST(NetStreamState, nc, nc);
+    s->fd = -1;
+    s->listen_fd = fd;
+    s->nc.link_down = true;
+    net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
+
+    qemu_set_fd_handler(s->listen_fd, net_stream_accept, NULL, s);
+    return 0;
+}
+
+static int net_stream_client_init(NetClientState *peer,
+                                  const char *model,
+                                  const char *name,
+                                  SocketAddress *addr,
+                                  Error **errp)
+{
+    NetStreamState *s;
+    struct sockaddr_in saddr_in;
+    int fd, connected, ret;
+
+    switch (addr->type) {
+    case SOCKET_ADDRESS_TYPE_INET:
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
+        break;
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
+        break;
+    default:
+        error_setg(errp, "only support inet or fd type");
+        return -1;
+    }
+
+    s = net_stream_fd_init(peer, model, name, fd, connected);
+
+    switch (addr->type) {
+    case SOCKET_ADDRESS_TYPE_INET:
+        qemu_set_info_str(&s->nc, "connect to %s:%d",
+                          inet_ntoa(saddr_in.sin_addr),
+                          ntohs(saddr_in.sin_port));
+        break;
+    case SOCKET_ADDRESS_TYPE_FD:
+        qemu_set_info_str(&s->nc, "connect to fd %d", fd);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return 0;
+}
+
+int net_init_stream(const Netdev *netdev, const char *name,
+                    NetClientState *peer, Error **errp)
+{
+    const NetdevStreamOptions *sock;
+
+    assert(netdev->type == NET_CLIENT_DRIVER_STREAM);
+    sock = &netdev->u.stream;
+
+    if (!sock->has_server || !sock->server) {
+        return net_stream_client_init(peer, "stream", name, sock->addr, errp);
+    }
+    return net_stream_server_init(peer, "stream", name, sock->addr, errp);
+}
diff --git a/qapi/net.json b/qapi/net.json
index 926ecc8..d476d33 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -7,6 +7,7 @@
 ##
 
 { 'include': 'common.json' }
+{ 'include': 'sockets.json' }
 
 ##
 # @set_link:
@@ -577,6 +578,60 @@
   'if': 'CONFIG_VMNET' }
 
 ##
+# @NetdevStreamOptions:
+#
+# Configuration info for stream socket netdev
+#
+# @addr: socket address to listen on (server=true)
+#        or connect to (server=false)
+# @server: create server socket (default: false)
+#
+# Only SocketAddress types 'inet' and 'fd' are supported.
+#
+# Since: 7.2
+##
+{ 'struct': 'NetdevStreamOptions',
+  'data': {
+    'addr':   'SocketAddress',
+    '*server': 'bool' } }
+
+##
+# @NetdevDgramOptions:
+#
+# Configuration info for datagram socket netdev.
+#
+# @remote: remote address
+# @local: local address
+#
+# Only SocketAddress types 'inet' and 'fd' are supported.
+#
+# If remote address is present and it's a multicast address, local address
+# is optional. Otherwise local address is required and remote address is
+# optional.
+#
+# .. table:: Valid parameters combination table
+#    :widths: auto
+#
+#    =============  ========  =====
+#    remote         local     okay?
+#    =============  ========  =====
+#    absent         absent    no
+#    absent         not fd    no
+#    absent         fd        yes
+#    multicast      absent    yes
+#    multicast      present   yes
+#    not multicast  absent    no
+#    not multicast  present   yes
+#    =============  ========  =====
+#
+# Since: 7.2
+##
+{ 'struct': 'NetdevDgramOptions',
+  'data': {
+    '*local':  'SocketAddress',
+    '*remote': 'SocketAddress' } }
+
+##
 # @NetClientDriver:
 #
 # Available netdev drivers.
@@ -587,10 +642,13 @@
 #        @vmnet-host since 7.1
 #        @vmnet-shared since 7.1
 #        @vmnet-bridged since 7.1
+#        @stream since 7.2
+#        @dgram since 7.2
 ##
 { 'enum': 'NetClientDriver',
-  'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
-            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
+  'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'stream',
+            'dgram', 'vde', 'bridge', 'hubport', 'netmap', 'vhost-user',
+            'vhost-vdpa',
             { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
             { 'name': 'vmnet-shared', 'if': 'CONFIG_VMNET' },
             { 'name': 'vmnet-bridged', 'if': 'CONFIG_VMNET' }] }
@@ -610,6 +668,8 @@
 #        'vmnet-host' - since 7.1
 #        'vmnet-shared' - since 7.1
 #        'vmnet-bridged' - since 7.1
+#        'stream' since 7.2
+#        'dgram' since 7.2
 ##
 { 'union': 'Netdev',
   'base': { 'id': 'str', 'type': 'NetClientDriver' },
@@ -620,6 +680,8 @@
     'tap':      'NetdevTapOptions',
     'l2tpv3':   'NetdevL2TPv3Options',
     'socket':   'NetdevSocketOptions',
+    'stream':   'NetdevStreamOptions',
+    'dgram':    'NetdevDgramOptions',
     'vde':      'NetdevVdeOptions',
     'bridge':   'NetdevBridgeOptions',
     'hubport':  'NetdevHubPortOptions',
diff --git a/qemu-options.hx b/qemu-options.hx
index 876a70a..01f2b92 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2772,6 +2772,18 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "-netdev socket,id=str[,fd=h][,udp=host:port][,localaddr=host:port]\n"
     "                configure a network backend to connect to another network\n"
     "                using an UDP tunnel\n"
+    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port\n"
+    "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=file-descriptor\n"
+    "                configure a network backend to connect to another network\n"
+    "                using a socket connection in stream mode.\n"
+    "-netdev dgram,id=str,remote.type=inet,remote.host=maddr,remote.port=port[,local.type=inet,local.host=addr]\n"
+    "-netdev dgram,id=str,remote.type=inet,remote.host=maddr,remote.port=port[,local.type=fd,local.str=file-descriptor]\n"
+    "                configure a network backend to connect to a multicast maddr and port\n"
+    "                use ``local.host=addr`` to specify the host address to send packets from\n"
+    "-netdev dgram,id=str,local.type=inet,local.host=addr,local.port=port[,remote.type=inet,remote.host=addr,remote.port=port]\n"
+    "-netdev dgram,id=str,local.type=fd,local.str=file-descriptor\n"
+    "                configure a network backend to connect to another network\n"
+    "                using an UDP tunnel\n"
 #ifdef CONFIG_VDE
     "-netdev vde,id=str[,sock=socketpath][,port=n][,group=groupname][,mode=octalmode]\n"
     "                configure a network backend to connect to port 'n' of a vde switch\n"
-- 
2.7.4


