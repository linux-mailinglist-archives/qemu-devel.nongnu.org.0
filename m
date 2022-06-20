Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415C85515CF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 12:27:26 +0200 (CEST)
Received: from localhost ([::1]:33748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Ecv-0001lh-C1
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 06:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o3EUa-0006ZZ-Ue
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:18:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o3EUZ-0007VY-5a
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:18:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655720326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FLWhKU1wI72i3O/mX/gIHQNuqut0rRvKtSfKd8n9ElU=;
 b=hKNEZWDH/8Bh1rYuhO85oYO4BujGdKTyqWVcaZrVaWE+2+Aqb3OgyvhGQmqTIf4X9FQG9E
 Fyzdy24eDqdj4OOTo/VX5dAlu2GvVHvEC0CSKVxRM667WJSOP/YP/Zff3M5iZKyHjc3A5q
 Y+wUUrS9O+2j3hObMF0FTnUIXKca8pQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-2X8Yf3t3Ml-J3ZYfPxLAKQ-1; Mon, 20 Jun 2022 06:18:45 -0400
X-MC-Unique: 2X8Yf3t3Ml-J3ZYfPxLAKQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 223B585A584
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:18:45 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67FA9492C3B;
 Mon, 20 Jun 2022 10:18:43 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [RFC PATCH v3 07/11] net: dgram: make dgram_dst generic
Date: Mon, 20 Jun 2022 12:18:24 +0200
Message-Id: <20220620101828.518865-8-lvivier@redhat.com>
In-Reply-To: <20220620101828.518865-1-lvivier@redhat.com>
References: <20220620101828.518865-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

dgram_dst is a sockaddr_in structure. To be able to use it with
unix socket, use a pointer to a generic sockaddr structure.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
---
 net/dgram.c | 76 +++++++++++++++++++++++++++++++----------------------
 1 file changed, 45 insertions(+), 31 deletions(-)

diff --git a/net/dgram.c b/net/dgram.c
index aa4240501ed0..16b4d4c94c81 100644
--- a/net/dgram.c
+++ b/net/dgram.c
@@ -39,9 +39,8 @@ typedef struct NetDgramState {
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
@@ -85,10 +84,9 @@ static ssize_t net_dgram_receive_dgram(NetClientState *nc,
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
@@ -289,6 +287,8 @@ static void net_dgram_cleanup(NetClientState *nc)
         closesocket(s->listen_fd);
         s->listen_fd = -1;
     }
+    g_free(s->dgram_dst);
+    s->dgram_dst = NULL;
 }
 
 static NetClientInfo net_dgram_socket_info = {
@@ -305,7 +305,7 @@ static NetDgramState *net_dgram_fd_init_dgram(NetClientState *peer,
                                               SocketAddress *mcast,
                                               Error **errp)
 {
-    struct sockaddr_in saddr;
+    struct sockaddr_in *saddr = NULL;
     int newfd;
     NetClientState *nc;
     NetDgramState *s;
@@ -327,24 +327,25 @@ static NetDgramState *net_dgram_fd_init_dgram(NetClientState *peer,
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
@@ -358,16 +359,13 @@ static NetDgramState *net_dgram_fd_init_dgram(NetClientState *peer,
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
@@ -375,6 +373,7 @@ static NetDgramState *net_dgram_fd_init_dgram(NetClientState *peer,
     return s;
 
 err:
+    g_free(saddr);
     closesocket(fd);
     return NULL;
 }
@@ -420,21 +419,24 @@ static int net_dgram_mcast_init(NetClientState *peer,
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
@@ -443,13 +445,15 @@ static int net_dgram_mcast_init(NetClientState *peer,
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
@@ -457,16 +461,19 @@ static int net_dgram_mcast_init(NetClientState *peer,
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
@@ -476,13 +483,16 @@ static int net_dgram_mcast_init(NetClientState *peer,
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
@@ -496,8 +506,8 @@ static int net_dgram_udp_init(NetClientState *peer,
 {
     NetDgramState *s;
     int fd, ret;
-    struct sockaddr_in raddr_in;
     gchar *info_str;
+    struct sockaddr *dgram_dst;
 
     if (remote) {
         if (local->type == SOCKET_ADDRESS_TYPE_FD) {
@@ -517,7 +527,7 @@ static int net_dgram_udp_init(NetClientState *peer,
 
     switch (local->type) {
     case SOCKET_ADDRESS_TYPE_INET: {
-        struct sockaddr_in laddr_in;
+        struct sockaddr_in laddr_in, raddr_in;
 
         if (convert_host_port(&laddr_in, local->u.inet.host, local->u.inet.port,
                               errp) < 0) {
@@ -551,9 +561,12 @@ static int net_dgram_udp_init(NetClientState *peer,
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
@@ -580,7 +593,8 @@ static int net_dgram_udp_init(NetClientState *peer,
     }
 
     if (remote) {
-        s->dgram_dst = raddr_in;
+        g_assert(s->dgram_dst == NULL);
+        s->dgram_dst = dgram_dst;
 
         pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), info_str);
         g_free(info_str);
-- 
2.36.1


