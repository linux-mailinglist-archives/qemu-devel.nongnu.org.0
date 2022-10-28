Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21456109EF
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:55:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIFd-0007Pw-HD; Fri, 28 Oct 2022 01:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIFc-0007Pg-CY
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:49:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIFa-0007eL-JW
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666936190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JVrS/W8NeVgJedBrtey90h88uQJImvWu9BMTQtZUT9E=;
 b=i5aeu981he9WCZptW2O0lk6bDTzvYmsXQDLKkR4pf6oKv8xiZ+40p4NVUvsUIAWIHsYyve
 xob2LBWLA7IAyWItUWna4BOfSX3lELMCfH5ye4mNyiiFqnRNyRttYhOrm34sG1whoOZJ5b
 HLmlb37Xw5gGiK/0EzWsqpYMwrOkKqM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-789Ke1LmNgmoxBeM3ChdbA-1; Fri, 28 Oct 2022 01:49:48 -0400
X-MC-Unique: 789Ke1LmNgmoxBeM3ChdbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10B34811E81;
 Fri, 28 Oct 2022 05:49:48 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-50.pek2.redhat.com [10.72.13.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E2F5C15BA8;
 Fri, 28 Oct 2022 05:49:44 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 20/26] net: dgram: make dgram_dst generic
Date: Fri, 28 Oct 2022 13:48:29 +0800
Message-Id: <20221028054835.29674-21-jasowang@redhat.com>
In-Reply-To: <20221028054835.29674-1-jasowang@redhat.com>
References: <20221028054835.29674-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

dgram_dst is a sockaddr_in structure. To be able to use it with
unix socket, use a pointer to a generic sockaddr structure.

Rename it dest_addr, and store socket length in dest_len.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/dgram.c | 82 +++++++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 53 insertions(+), 29 deletions(-)

diff --git a/net/dgram.c b/net/dgram.c
index 5339585..e20be9c 100644
--- a/net/dgram.c
+++ b/net/dgram.c
@@ -40,9 +40,11 @@ typedef struct NetDgramState {
     NetClientState nc;
     int fd;
     SocketReadState rs;
-    struct sockaddr_in dgram_dst; /* contains destination iff connectionless */
     bool read_poll;               /* waiting to receive data? */
     bool write_poll;              /* waiting to transmit data? */
+    /* contains destination iff connectionless */
+    struct sockaddr *dest_addr;
+    socklen_t dest_len;
 } NetDgramState;
 
 static void net_dgram_send(void *opaque);
@@ -84,10 +86,8 @@ static ssize_t net_dgram_receive(NetClientState *nc,
     ssize_t ret;
 
     do {
-        if (s->dgram_dst.sin_family != AF_UNIX) {
-            ret = sendto(s->fd, buf, size, 0,
-                         (struct sockaddr *)&s->dgram_dst,
-                         sizeof(s->dgram_dst));
+        if (s->dest_addr) {
+            ret = sendto(s->fd, buf, size, 0, s->dest_addr, s->dest_len);
         } else {
             ret = send(s->fd, buf, size, 0);
         }
@@ -244,6 +244,9 @@ static void net_dgram_cleanup(NetClientState *nc)
         close(s->fd);
         s->fd = -1;
     }
+    g_free(s->dest_addr);
+    s->dest_addr = NULL;
+    s->dest_len = 0;
 }
 
 static NetClientInfo net_dgram_socket_info = {
@@ -260,7 +263,7 @@ static NetDgramState *net_dgram_fd_init(NetClientState *peer,
                                         SocketAddress *mcast,
                                         Error **errp)
 {
-    struct sockaddr_in saddr;
+    struct sockaddr_in *saddr = NULL;
     int newfd;
     NetClientState *nc;
     NetDgramState *s;
@@ -275,31 +278,32 @@ static NetDgramState *net_dgram_fd_init(NetClientState *peer,
     qapi_free_SocketAddress(sa);
 
     /*
-     * fd passed: multicast: "learn" dgram_dst address from bound address and
+     * fd passed: multicast: "learn" dest_addr address from bound address and
      * save it. Because this may be "shared" socket from a "master" process,
      * datagrams would be recv() by ONLY ONE process: we must "clone" this
      * dgram socket --jjo
      */
 
     if (is_fd && mcast != NULL) {
-            if (convert_host_port(&saddr, mcast->u.inet.host,
-                                  mcast->u.inet.port, errp) < 0) {
+            saddr = g_new(struct sockaddr_in, 1);
+
+            if (convert_host_port(saddr, mcast->u.inet.host, mcast->u.inet.port,
+                                  errp) < 0) {
                 goto err;
             }
             /* must be bound */
-            if (saddr.sin_addr.s_addr == 0) {
+            if (saddr->sin_addr.s_addr == 0) {
                 error_setg(errp, "can't setup multicast destination address");
                 goto err;
             }
             /* clone dgram socket */
-            newfd = net_dgram_mcast_create(&saddr, NULL, errp);
+            newfd = net_dgram_mcast_create(saddr, NULL, errp);
             if (newfd < 0) {
                 goto err;
             }
             /* clone newfd to fd, close newfd */
             dup2(newfd, fd);
             close(newfd);
-
     }
 
     nc = qemu_new_net_client(&net_dgram_socket_info, peer, model, name);
@@ -311,21 +315,20 @@ static NetDgramState *net_dgram_fd_init(NetClientState *peer,
     net_dgram_read_poll(s, true);
 
     /* mcast: save bound address as dst */
-    if (is_fd && mcast != NULL) {
-        s->dgram_dst = saddr;
+    if (saddr) {
+        g_assert(s->dest_addr == NULL);
+        s->dest_addr = (struct sockaddr *)saddr;
+        s->dest_len = sizeof(*saddr);
         qemu_set_info_str(nc, "fd=%d (cloned mcast=%s:%d)", fd,
-                          inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+                          inet_ntoa(saddr->sin_addr), ntohs(saddr->sin_port));
     } else {
-        if (sa_type == SOCKET_ADDRESS_TYPE_UNIX) {
-            s->dgram_dst.sin_family = AF_UNIX;
-        }
-
         qemu_set_info_str(nc, "fd=%d %s", fd, SocketAddressType_str(sa_type));
     }
 
     return s;
 
 err:
+    g_free(saddr);
     closesocket(fd);
     return NULL;
 }
@@ -339,21 +342,24 @@ static int net_dgram_mcast_init(NetClientState *peer,
 {
     NetDgramState *s;
     int fd, ret;
-    struct sockaddr_in saddr;
+    struct sockaddr_in *saddr;
 
     if (remote->type != SOCKET_ADDRESS_TYPE_INET) {
         error_setg(errp, "multicast only support inet type");
         return -1;
     }
 
-    if (convert_host_port(&saddr, remote->u.inet.host, remote->u.inet.port,
+    saddr = g_new(struct sockaddr_in, 1);
+    if (convert_host_port(saddr, remote->u.inet.host, remote->u.inet.port,
                           errp) < 0) {
+        g_free(saddr);
         return -1;
     }
 
     if (!local) {
-        fd = net_dgram_mcast_create(&saddr, NULL, errp);
+        fd = net_dgram_mcast_create(saddr, NULL, errp);
         if (fd < 0) {
+            g_free(saddr);
             return -1;
         }
     } else {
@@ -362,13 +368,15 @@ static int net_dgram_mcast_init(NetClientState *peer,
             struct in_addr localaddr;
 
             if (inet_aton(local->u.inet.host, &localaddr) == 0) {
+                g_free(saddr);
                 error_setg(errp, "localaddr '%s' is not a valid IPv4 address",
                            local->u.inet.host);
                 return -1;
             }
 
-            fd = net_dgram_mcast_create(&saddr, &localaddr, errp);
+            fd = net_dgram_mcast_create(saddr, &localaddr, errp);
             if (fd < 0) {
+                g_free(saddr);
                 return -1;
             }
             break;
@@ -376,16 +384,19 @@ static int net_dgram_mcast_init(NetClientState *peer,
         case SOCKET_ADDRESS_TYPE_FD:
             fd = monitor_fd_param(monitor_cur(), local->u.fd.str, errp);
             if (fd == -1) {
+                g_free(saddr);
                 return -1;
             }
             ret = qemu_socket_try_set_nonblock(fd);
             if (ret < 0) {
+                g_free(saddr);
                 error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
                                  name, fd);
                 return -1;
             }
             break;
         default:
+            g_free(saddr);
             error_setg(errp, "only support inet or fd type for local");
             return -1;
         }
@@ -395,13 +406,17 @@ static int net_dgram_mcast_init(NetClientState *peer,
                           local->type == SOCKET_ADDRESS_TYPE_FD,
                           remote, errp);
     if (!s) {
+        g_free(saddr);
         return -1;
     }
 
-    s->dgram_dst = saddr;
+    g_assert(s->dest_addr == NULL);
+    s->dest_addr = (struct sockaddr *)saddr;
+    s->dest_len = sizeof(*saddr);
+
+    qemu_set_info_str(&s->nc, "mcast=%s:%d", inet_ntoa(saddr->sin_addr),
+                      ntohs(saddr->sin_port));
 
-    qemu_set_info_str(&s->nc, "mcast=%s:%d", inet_ntoa(saddr.sin_addr),
-                      ntohs(saddr.sin_port));
     return 0;
 
 }
@@ -412,9 +427,10 @@ int net_init_dgram(const Netdev *netdev, const char *name,
 {
     NetDgramState *s;
     int fd, ret;
-    struct sockaddr_in raddr_in;
-    struct sockaddr_in laddr_in;
     SocketAddress *remote, *local;
+    struct sockaddr *dest_addr;
+    struct sockaddr_in laddr_in, raddr_in;
+    socklen_t dest_len;
 
     assert(netdev->type == NET_CLIENT_DRIVER_DGRAM);
 
@@ -491,6 +507,10 @@ int net_init_dgram(const Netdev *netdev, const char *name,
             return -1;
         }
         qemu_socket_set_nonblock(fd);
+
+        dest_len = sizeof(raddr_in);
+        dest_addr = g_malloc(dest_len);
+        memcpy(dest_addr, &raddr_in, dest_len);
         break;
     case SOCKET_ADDRESS_TYPE_FD:
         fd = monitor_fd_param(monitor_cur(), local->u.fd.str, errp);
@@ -503,6 +523,8 @@ int net_init_dgram(const Netdev *netdev, const char *name,
                              name, fd);
             return -1;
         }
+        dest_addr = NULL;
+        dest_len = 0;
         break;
     default:
         error_setg(errp, "only support inet or fd type for local");
@@ -515,7 +537,9 @@ int net_init_dgram(const Netdev *netdev, const char *name,
     }
 
     if (remote) {
-        s->dgram_dst = raddr_in;
+        g_assert(s->dest_addr == NULL);
+        s->dest_addr = dest_addr;
+        s->dest_len = dest_len;
     }
 
     switch (local->type) {
-- 
2.7.4


