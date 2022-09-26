Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C2C5EB1FB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 22:19:03 +0200 (CEST)
Received: from localhost ([::1]:44936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocuZC-000431-Et
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 16:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu8F-0008LI-6y
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:11 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:52105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu8C-0005wg-Rv
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:10 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MOV26-1oswyx07DS-00PwKn; Mon, 26 Sep 2022 21:51:01 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v9 09/16] net: dgram: make dgram_dst generic
Date: Mon, 26 Sep 2022 21:50:41 +0200
Message-Id: <20220926195048.487915-10-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926195048.487915-1-lvivier@redhat.com>
References: <20220926195048.487915-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zkVCwdsSJom7PRynVg48SwlfrZ+1A8+jILYcg4Le4e7M3TgFiAg
 ckzOAgU9dCaOVNMQISJD3eDeXbLitoGETwgGsGeiwmmFqJwFN67hk8OQwyzxpOFgWHmES4F
 FK9CIICAUdRlfy0rlDJeNI+62SBc9ayMz83M2SJzOMIMpEcN9/eDkLRj2b1/q7pRFXVuqV/
 cUDMu2/YyIM3sGKkfmZcw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:36av9FoTuro=:6CVhJlUS2tjsnDyPtfENkM
 UjbvSkmc6KwhF33dd1KI9JbmksDulLhLBjF8496mvT2QoDxTi02MB3omAmsPR8XP7vvyHJ7Go
 H3h/b3uRacSUuozsvb8ybXVHq0F/SKHy7mpPgQvryErcBtEpHYFMSvWk4LN7O6WENXASqgGq2
 8CZEUCdUCybvZi79g5jr4Nb9Ehk05iQF0kPfNE2Eev9vL4TzUyPcCyq0p/x4awpZdGvNhySGT
 CcXBk0mxr1AnejjsS+ZxbaRaR4ntB7aTjiqXrBMEkcOmDKcH5cY8KFfTBXXqvyR+kwbKJo9FL
 DUoP34BOG9hWfrVVnkhaU2ohVzza4b+JWLAykc5OO8H1WjhYRigTidU2D/5TuVurvCPydhIka
 qOYcmMbMZhn60x4C6OsBEu2/9898d0Hdesa3B1CfNx6g/4Pb9SAyytmtlyl7VfrwpSXVpsk4T
 5nx5BcViJUnKVzUMJvuWrbkIWhUYQkUent9pZwldwwSGQTUsVKAgtT/Lsv9lpsZQ3r0TLeydK
 CyZAUDkSGdHbiMZ6IlxHS3WqVkgK5mXzT8ZeP7KtmqLHI2zYPfIH9dYD3LTcLa1gyZOhvYjK1
 ERV7gFWWbvoV6zc4HbE+4uEUkPShf8YBupKIkXAtjMN+i6HKaUxVkKk1DTQZpjEumNiEBnZGt
 RHCUMWBZ12+k9lc2gLiYOOZTubK3ZmvPNAgJCx+lMfpsIinoxaINfcgjaWswD6JrFVV7z+3c2
 5yRHtC1NHJpvY5XpgAc27doKTnmFz856rDRtpAzvEdD6vktPol8yz88gUTFh1oEhdIN1Yv1eX
 44U+xTa
Received-SPF: permerror client-ip=212.227.126.130;
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

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
---
 net/dgram.c | 73 ++++++++++++++++++++++++++++++++---------------------
 1 file changed, 44 insertions(+), 29 deletions(-)

diff --git a/net/dgram.c b/net/dgram.c
index 45d869efc844..57933bfbd1c1 100644
--- a/net/dgram.c
+++ b/net/dgram.c
@@ -39,7 +39,7 @@ typedef struct NetDgramState {
     NetClientState nc;
     int fd;
     SocketReadState rs;
-    struct sockaddr_in dgram_dst; /* contains destination iff connectionless */
+    struct sockaddr *dgram_dst; /* contains destination iff connectionless */
     bool read_poll;               /* waiting to receive data? */
     bool write_poll;              /* waiting to transmit data? */
 } NetDgramState;
@@ -83,10 +83,9 @@ static ssize_t net_dgram_receive_dgram(NetClientState *nc,
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
@@ -243,6 +242,8 @@ static void net_dgram_cleanup(NetClientState *nc)
         close(s->fd);
         s->fd = -1;
     }
+    g_free(s->dgram_dst);
+    s->dgram_dst = NULL;
 }
 
 static NetClientInfo net_dgram_socket_info = {
@@ -259,7 +260,7 @@ static NetDgramState *net_dgram_fd_init_dgram(NetClientState *peer,
                                               SocketAddress *mcast,
                                               Error **errp)
 {
-    struct sockaddr_in saddr;
+    struct sockaddr_in *saddr = NULL;
     int newfd;
     NetClientState *nc;
     NetDgramState *s;
@@ -281,24 +282,25 @@ static NetDgramState *net_dgram_fd_init_dgram(NetClientState *peer,
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
@@ -310,16 +312,13 @@ static NetDgramState *net_dgram_fd_init_dgram(NetClientState *peer,
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
@@ -327,6 +326,7 @@ static NetDgramState *net_dgram_fd_init_dgram(NetClientState *peer,
     return s;
 
 err:
+    g_free(saddr);
     closesocket(fd);
     return NULL;
 }
@@ -340,21 +340,24 @@ static int net_dgram_mcast_init(NetClientState *peer,
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
@@ -363,13 +366,15 @@ static int net_dgram_mcast_init(NetClientState *peer,
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
@@ -377,16 +382,19 @@ static int net_dgram_mcast_init(NetClientState *peer,
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
@@ -396,13 +404,16 @@ static int net_dgram_mcast_init(NetClientState *peer,
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
@@ -416,8 +427,8 @@ static int net_dgram_init(NetClientState *peer,
 {
     NetDgramState *s;
     int fd, ret;
-    struct sockaddr_in raddr_in;
     gchar *info_str;
+    struct sockaddr *dgram_dst;
 
     /* detect multicast address */
     if (remote && remote->type == SOCKET_ADDRESS_TYPE_INET) {
@@ -458,7 +469,7 @@ static int net_dgram_init(NetClientState *peer,
 
     switch (local->type) {
     case SOCKET_ADDRESS_TYPE_INET: {
-        struct sockaddr_in laddr_in;
+        struct sockaddr_in laddr_in, raddr_in;
 
         if (convert_host_port(&laddr_in, local->u.inet.host, local->u.inet.port,
                               errp) < 0) {
@@ -492,9 +503,12 @@ static int net_dgram_init(NetClientState *peer,
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
@@ -521,7 +535,8 @@ static int net_dgram_init(NetClientState *peer,
     }
 
     if (remote) {
-        s->dgram_dst = raddr_in;
+        g_assert(s->dgram_dst == NULL);
+        s->dgram_dst = dgram_dst;
 
         pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), info_str);
         g_free(info_str);
-- 
2.37.3


