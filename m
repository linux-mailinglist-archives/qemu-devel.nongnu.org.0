Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAA75B6877
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 09:17:17 +0200 (CEST)
Received: from localhost ([::1]:42806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY0AW-0000eh-Op
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 03:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzg3-0000gc-Dt
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:49 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:57257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzfy-0004E4-DE
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:47 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N2BQM-1pK16x2p4w-013hsu; Tue, 13 Sep 2022 08:40:13 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gregory Kurz <gregory.kurz@free.fr>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v8 08/14] net: dgram: make dgram_dst generic
Date: Tue, 13 Sep 2022 08:39:54 +0200
Message-Id: <20220913064000.79353-9-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913064000.79353-1-lvivier@redhat.com>
References: <20220913064000.79353-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6/2w0Mp4BIhzA1IgXK8ZlWqd/gHirvGjL1S8M+L/YGS373APl9Q
 W4m/cLfZbyR4r8jUPWXnQLRH1cMN5KFzb5DqZyDnf3va4n1khLNYviMVnln6SNuf/7z7Qyw
 uVnaG6CITy/p4P8ZBrmou3MeBsO24bIm4U+QfCSPrqf+jbxVh+YMMcVuTeYNsq5EthqUzOZ
 ysBuyrkutGjfyGSGQPcKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/oBdXP1R1ks=:W6a7wAJFp6zLG/PMHAO4aP
 8StUwWoFSddSzHIdlfw2ZyPUEp9Dktjix+Gpprq1hxAWWaAAeKHONjyTGXK7Vn+g76fCsbF5X
 dpj0eODX8zFwkrZgzdpG06Tcs6CFVTpbid48JOjtiq4I6FnSaHcLH+I31pMnIBGt13JJUyXz8
 aDJ+vA2WgaHo7h/uepOWimybaWVAK7G6PawQsozYrKa/SOb0KtWkRaupcaFZT52wlZxMhvwZo
 bug7Fc2lvIKeDa/BnJ2WV21HXbWfg3gKHiZj3pnoVh/WJWuosiJUmiJ5+P5GjiRy9QijGs82x
 bWyNOsWzgFbLQIvSpbtyjcILWJ/cC1fU5YqmEjgqcKTXvLZn8rrL3RADWwodBvkCpHqdVYW7W
 pHNlhe/8CoEKmzCCEHg/hPq8TQW7Gcz/EkwkvkmjEa2iTxDHztVflCYRCrmdZpxkM/8ogzYWS
 CZike8D/TNE3Cnp9zQTv5oLxr2J5GFGLyncPQERTX63+EyY8eYYP0jDP3W1YOtOzXWMzAXI7X
 by56tfMJCXvCEQJL11JJkAnf6hddEOpx1WB4v5ccDoIfLwOo8FlXhnMxgqmoGfZTLX3QLmOED
 q+E63QBe+rWJFA6ulb4LYP9w5UXfp19o5mLZm+5KUI/9M8EiK5lKk1iYAgkcXdlagB5uH5pFB
 ugohaZ07gu+k/5wiKog1+EeIUeLnDovs6m41Q2PGcSVLxL3SIbRGT8v8ZG0vOjerByVMARVHP
 YQJe5Fm/ZY7Xo8vFdb2W0SGIT8400kQtza99Jr1EgZCqY5DMN9JmLDi/xv9JDV4pp1XKcETi3
 CShq/J4
Received-SPF: permerror client-ip=212.227.126.135;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
---
 net/dgram.c | 76 +++++++++++++++++++++++++++++++----------------------
 1 file changed, 45 insertions(+), 31 deletions(-)

diff --git a/net/dgram.c b/net/dgram.c
index dbe65102d174..dcc2205305c5 100644
--- a/net/dgram.c
+++ b/net/dgram.c
@@ -40,9 +40,8 @@ typedef struct NetDgramState {
     int listen_fd;
     int fd;
     SocketReadState rs;
-  /* contains inet host and port destination iff connectionless (SOCK_DGRAM) */
-    struct sockaddr_in dgram_dst;
-    IOHandler *send_fn;           /* differs between SOCK_STREAM/SOCK_DGRAM */
+    struct sockaddr *dgram_dst; /* contains destination iff connectionless */
+    IOHandler *send_fn;
     bool read_poll;               /* waiting to receive data? */
     bool write_poll;              /* waiting to transmit data? */
 } NetDgramState;
@@ -86,10 +85,9 @@ static ssize_t net_dgram_receive_dgram(NetClientState *nc,
     ssize_t ret;
 
     do {
-        if (s->dgram_dst.sin_family != AF_UNIX) {
-            ret = sendto(s->fd, buf, size, 0,
-                         (struct sockaddr *)&s->dgram_dst,
-                         sizeof(s->dgram_dst));
+        if (s->dgram_dst) {
+            ret = sendto(s->fd, buf, size, 0, s->dgram_dst,
+                         sizeof(struct sockaddr_in));
         } else {
             ret = send(s->fd, buf, size, 0);
         }
@@ -290,6 +288,8 @@ static void net_dgram_cleanup(NetClientState *nc)
         closesocket(s->listen_fd);
         s->listen_fd = -1;
     }
+    g_free(s->dgram_dst);
+    s->dgram_dst = NULL;
 }
 
 static NetClientInfo net_dgram_socket_info = {
@@ -306,7 +306,7 @@ static NetDgramState *net_dgram_fd_init_dgram(NetClientState *peer,
                                               SocketAddress *mcast,
                                               Error **errp)
 {
-    struct sockaddr_in saddr;
+    struct sockaddr_in *saddr = NULL;
     int newfd;
     NetClientState *nc;
     NetDgramState *s;
@@ -328,24 +328,25 @@ static NetDgramState *net_dgram_fd_init_dgram(NetClientState *peer,
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
@@ -359,16 +360,13 @@ static NetDgramState *net_dgram_fd_init_dgram(NetClientState *peer,
     net_dgram_read_poll(s, true);
 
     /* mcast: save bound address as dst */
-    if (is_fd && mcast != NULL) {
-        s->dgram_dst = saddr;
+    if (saddr) {
+        g_assert(s->dgram_dst == NULL);
+        s->dgram_dst = (struct sockaddr *)saddr;
         snprintf(nc->info_str, sizeof(nc->info_str),
                  "fd=%d (cloned mcast=%s:%d)",
-                 fd, inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+                 fd, inet_ntoa(saddr->sin_addr), ntohs(saddr->sin_port));
     } else {
-        if (sa_type == SOCKET_ADDRESS_TYPE_UNIX) {
-            s->dgram_dst.sin_family = AF_UNIX;
-        }
-
         snprintf(nc->info_str, sizeof(nc->info_str), "fd=%d %s", fd,
                  SocketAddressType_str(sa_type));
     }
@@ -376,6 +374,7 @@ static NetDgramState *net_dgram_fd_init_dgram(NetClientState *peer,
     return s;
 
 err:
+    g_free(saddr);
     closesocket(fd);
     return NULL;
 }
@@ -421,21 +420,24 @@ static int net_dgram_mcast_init(NetClientState *peer,
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
@@ -444,13 +446,15 @@ static int net_dgram_mcast_init(NetClientState *peer,
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
@@ -458,16 +462,19 @@ static int net_dgram_mcast_init(NetClientState *peer,
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
@@ -477,13 +484,16 @@ static int net_dgram_mcast_init(NetClientState *peer,
                                  local->type == SOCKET_ADDRESS_TYPE_FD,
                                  remote, errp);
     if (!s) {
+        g_free(saddr);
         return -1;
     }
 
-    s->dgram_dst = saddr;
+    g_assert(s->dgram_dst == NULL);
+    s->dgram_dst = (struct sockaddr *)saddr;
 
     snprintf(s->nc.info_str, sizeof(s->nc.info_str), "mcast=%s:%d",
-             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+             inet_ntoa(saddr->sin_addr), ntohs(saddr->sin_port));
+
     return 0;
 
 }
@@ -497,8 +507,8 @@ static int net_dgram_udp_init(NetClientState *peer,
 {
     NetDgramState *s;
     int fd, ret;
-    struct sockaddr_in raddr_in;
     gchar *info_str;
+    struct sockaddr *dgram_dst;
 
     if (remote) {
         if (local->type == SOCKET_ADDRESS_TYPE_FD) {
@@ -518,7 +528,7 @@ static int net_dgram_udp_init(NetClientState *peer,
 
     switch (local->type) {
     case SOCKET_ADDRESS_TYPE_INET: {
-        struct sockaddr_in laddr_in;
+        struct sockaddr_in laddr_in, raddr_in;
 
         if (convert_host_port(&laddr_in, local->u.inet.host, local->u.inet.port,
                               errp) < 0) {
@@ -552,9 +562,12 @@ static int net_dgram_udp_init(NetClientState *peer,
         }
         qemu_socket_set_nonblock(fd);
 
+        dgram_dst = g_malloc(sizeof(raddr_in));
+        memcpy(dgram_dst, &raddr_in, sizeof(raddr_in));
+
         info_str = g_strdup_printf("udp=%s:%d/%s:%d",
-                 inet_ntoa(laddr_in.sin_addr), ntohs(laddr_in.sin_port),
-                 inet_ntoa(raddr_in.sin_addr), ntohs(raddr_in.sin_port));
+                        inet_ntoa(laddr_in.sin_addr), ntohs(laddr_in.sin_port),
+                        inet_ntoa(raddr_in.sin_addr), ntohs(raddr_in.sin_port));
 
         break;
     }
@@ -581,7 +594,8 @@ static int net_dgram_udp_init(NetClientState *peer,
     }
 
     if (remote) {
-        s->dgram_dst = raddr_in;
+        g_assert(s->dgram_dst == NULL);
+        s->dgram_dst = dgram_dst;
 
         pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), info_str);
         g_free(info_str);
-- 
2.37.3


