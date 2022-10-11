Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 643825FBC36
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 22:38:04 +0200 (CEST)
Received: from localhost ([::1]:37668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiM0p-0001a2-8c
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 16:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLW0-0006Pb-Iv
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:20 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:36079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLVy-0003lE-72
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:12 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N2Ujn-1p9wAi30CV-013t7r; Tue, 11 Oct 2022 22:06:00 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Greg Kurz <groug@kaod.org>,
 Eric Blake <eblake@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>, Paul Durrant <paul@xen.org>,
 David Gibson <david@gibson.dropbear.id.au>, xen-devel@lists.xenproject.org,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v11 10/17] net: dgram: make dgram_dst generic
Date: Tue, 11 Oct 2022 22:05:32 +0200
Message-Id: <20221011200539.1486809-11-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011200539.1486809-1-lvivier@redhat.com>
References: <20221011200539.1486809-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mej7cnifO8Mk5n6kRHCS/Ch3oXeRsA1xv31dK1e5Man9+8wiSPh
 FZ9ulsjdhM0i6b/olyMprHqPfhAqyspaUMNEMOk4cMPrSQFY/z/MTKtvQd7cNsRrMLbApbg
 J1amHxjIaEle/AtNYaB4Dtv9V9wFcvIeu7+Gn/or3BaRcRr1GiBzqZ9sYKwKJF/05eCxhDG
 6I0clpj62qPYAK5hYjYaA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J0TF2aWliOo=:BPXg9n1pCmKLD6cojC6G1+
 p2pruc297vkkHWWMsS6XFm+AOtdbcnOEt0BKJ7yqr16GF250tQQeT0ThVqfeASv7oJcb4lQJ5
 vXf1Z2URE5K1J683wbRgj+U1OADWen+z6kJtOskaJse1dwO9axbouIreXSv51tJSzrRT2y6eF
 5pJeS9Hp42FlQYU6ltICXpg27pDYB95MCSEGNujJ9sjPrM7EYYc/M6b+BsYtGiNBgdKL5DuxV
 BZmuDjM9XHd4Dno5QYS2qYS0d9oDr2UIWsxEF9ziBS4zeEIrjk06j4FbaMqHa6VMfT6PJMWWi
 3II2dcwc6ypnaOrEyT2d1Putr+jnwGfZQLt7Rh/EEeJWcoKlnzzRYIfwkfY/uByhOYtN6LCsT
 r21NhCDKanT2V453DodX9Rl4p2kYyG2+g8WTyBGQOsjCs6qfyBfZbFDlFNLDP1Iwri/KzEUJ3
 qV9fW5LzZMH1bXnYTjLFRm9E9SubUClh+sZnsxeMDaTPhjxudHOAADiAS/IhlHFg4L51mKh+I
 uoYYu3OnWxSNkzCy5aVn9b9GnGNgU+lZ/ww2CcDIeRFhKxtojBg/yugUgcL8JSkZqoSREsM3p
 oicx9NWC30jHzob9YGzkThVx9o2q3lq8Lr/JyQV7rG5ZERgM+yZvTu0yPx7dQJBkZTpAxrJE0
 LwnsfzYNhSM6XW//UI4IWx9pPzjzVdKhS5tNuqO1b+uljJwAKoNsqxumfjJuHgsK3iyQquyZ3
 6dhJhg/Ljkmg5IkHRqvi2iGJ/biFuK7aGB50VzL7ha/o0t+pOPWDbHDBT7G3eIVbVdGJjQYYZ
 T1dtztp
Received-SPF: permerror client-ip=212.227.126.133;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001,
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

dgram_dst is a sockaddr_in structure. To be able to use it with
unix socket, use a pointer to a generic sockaddr structure.

Rename it dest_addr, and store socket length in dest_len.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/dgram.c | 82 ++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 53 insertions(+), 29 deletions(-)

diff --git a/net/dgram.c b/net/dgram.c
index 5339585b8202..e20be9ca79d3 100644
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
2.37.3


