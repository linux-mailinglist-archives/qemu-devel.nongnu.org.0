Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FB06109D2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:51:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIG2-0007Rj-4r; Fri, 28 Oct 2022 01:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIFh-0007Qn-HN
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:50:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIFf-0007g9-IR
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:49:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666936194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7Hwb9qID5vQ9CZi2b/JtM7bSnrB5Qtzv6TT6mpZh8Q=;
 b=TMEktl3cFqTjL70a90XxV0ZHYMX2B9t/TAndioJVeVpL61T+uHYE7/p8sM1e5Kg6lekfnt
 j8x3iJgonJLtgnjwslHtP13tGZtL2eyT4geCR68d95Gu/YqquudqpXmQfz0AUSXtoFWB+e
 mRxvQAtCBUsGYuKtmNbjEGS9tPEF0BY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-Ak13MJOMOmSyQ5Oyk5igyw-1; Fri, 28 Oct 2022 01:49:52 -0400
X-MC-Unique: Ak13MJOMOmSyQ5Oyk5igyw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 796078027EA
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:49:51 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-50.pek2.redhat.com [10.72.13.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B29D7C16922;
 Fri, 28 Oct 2022 05:49:48 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 21/26] net: dgram: move mcast specific code from
 net_socket_fd_init_dgram()
Date: Fri, 28 Oct 2022 13:48:30 +0800
Message-Id: <20221028054835.29674-22-jasowang@redhat.com>
In-Reply-To: <20221028054835.29674-1-jasowang@redhat.com>
References: <20221028054835.29674-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
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

It is less complex to manage special cases directly in
net_dgram_mcast_init() and net_dgram_udp_init().

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/dgram.c | 143 ++++++++++++++++++++++++++++++++----------------------------
 1 file changed, 76 insertions(+), 67 deletions(-)

diff --git a/net/dgram.c b/net/dgram.c
index e20be9c..e581cc6 100644
--- a/net/dgram.c
+++ b/net/dgram.c
@@ -259,52 +259,11 @@ static NetClientInfo net_dgram_socket_info = {
 static NetDgramState *net_dgram_fd_init(NetClientState *peer,
                                         const char *model,
                                         const char *name,
-                                        int fd, int is_fd,
-                                        SocketAddress *mcast,
+                                        int fd,
                                         Error **errp)
 {
-    struct sockaddr_in *saddr = NULL;
-    int newfd;
     NetClientState *nc;
     NetDgramState *s;
-    SocketAddress *sa;
-    SocketAddressType sa_type;
-
-    sa = socket_local_address(fd, errp);
-    if (!sa) {
-        return NULL;
-    }
-    sa_type = sa->type;
-    qapi_free_SocketAddress(sa);
-
-    /*
-     * fd passed: multicast: "learn" dest_addr address from bound address and
-     * save it. Because this may be "shared" socket from a "master" process,
-     * datagrams would be recv() by ONLY ONE process: we must "clone" this
-     * dgram socket --jjo
-     */
-
-    if (is_fd && mcast != NULL) {
-            saddr = g_new(struct sockaddr_in, 1);
-
-            if (convert_host_port(saddr, mcast->u.inet.host, mcast->u.inet.port,
-                                  errp) < 0) {
-                goto err;
-            }
-            /* must be bound */
-            if (saddr->sin_addr.s_addr == 0) {
-                error_setg(errp, "can't setup multicast destination address");
-                goto err;
-            }
-            /* clone dgram socket */
-            newfd = net_dgram_mcast_create(saddr, NULL, errp);
-            if (newfd < 0) {
-                goto err;
-            }
-            /* clone newfd to fd, close newfd */
-            dup2(newfd, fd);
-            close(newfd);
-    }
 
     nc = qemu_new_net_client(&net_dgram_socket_info, peer, model, name);
 
@@ -314,23 +273,7 @@ static NetDgramState *net_dgram_fd_init(NetClientState *peer,
     net_socket_rs_init(&s->rs, net_dgram_rs_finalize, false);
     net_dgram_read_poll(s, true);
 
-    /* mcast: save bound address as dst */
-    if (saddr) {
-        g_assert(s->dest_addr == NULL);
-        s->dest_addr = (struct sockaddr *)saddr;
-        s->dest_len = sizeof(*saddr);
-        qemu_set_info_str(nc, "fd=%d (cloned mcast=%s:%d)", fd,
-                          inet_ntoa(saddr->sin_addr), ntohs(saddr->sin_port));
-    } else {
-        qemu_set_info_str(nc, "fd=%d %s", fd, SocketAddressType_str(sa_type));
-    }
-
     return s;
-
-err:
-    g_free(saddr);
-    closesocket(fd);
-    return NULL;
 }
 
 static int net_dgram_mcast_init(NetClientState *peer,
@@ -381,7 +324,9 @@ static int net_dgram_mcast_init(NetClientState *peer,
             }
             break;
         }
-        case SOCKET_ADDRESS_TYPE_FD:
+        case SOCKET_ADDRESS_TYPE_FD: {
+            int newfd;
+
             fd = monitor_fd_param(monitor_cur(), local->u.fd.str, errp);
             if (fd == -1) {
                 g_free(saddr);
@@ -394,7 +339,42 @@ static int net_dgram_mcast_init(NetClientState *peer,
                                  name, fd);
                 return -1;
             }
+
+            /*
+             * fd passed: multicast: "learn" dest_addr address from bound
+             * address and save it. Because this may be "shared" socket from a
+             * "master" process, datagrams would be recv() by ONLY ONE process:
+             * we must "clone" this dgram socket --jjo
+             */
+
+            saddr = g_new(struct sockaddr_in, 1);
+
+            if (convert_host_port(saddr, local->u.inet.host, local->u.inet.port,
+                                  errp) < 0) {
+                g_free(saddr);
+                closesocket(fd);
+                return -1;
+            }
+
+            /* must be bound */
+            if (saddr->sin_addr.s_addr == 0) {
+                error_setg(errp, "can't setup multicast destination address");
+                g_free(saddr);
+                closesocket(fd);
+                return -1;
+            }
+            /* clone dgram socket */
+            newfd = net_dgram_mcast_create(saddr, NULL, errp);
+            if (newfd < 0) {
+                g_free(saddr);
+                closesocket(fd);
+                return -1;
+            }
+            /* clone newfd to fd, close newfd */
+            dup2(newfd, fd);
+            close(newfd);
             break;
+        }
         default:
             g_free(saddr);
             error_setg(errp, "only support inet or fd type for local");
@@ -402,9 +382,7 @@ static int net_dgram_mcast_init(NetClientState *peer,
         }
     }
 
-    s = net_dgram_fd_init(peer, model, name, fd,
-                          local->type == SOCKET_ADDRESS_TYPE_FD,
-                          remote, errp);
+    s = net_dgram_fd_init(peer, model, name, fd, errp);
     if (!s) {
         g_free(saddr);
         return -1;
@@ -414,8 +392,26 @@ static int net_dgram_mcast_init(NetClientState *peer,
     s->dest_addr = (struct sockaddr *)saddr;
     s->dest_len = sizeof(*saddr);
 
-    qemu_set_info_str(&s->nc, "mcast=%s:%d", inet_ntoa(saddr->sin_addr),
-                      ntohs(saddr->sin_port));
+    if (!local) {
+        qemu_set_info_str(&s->nc, "mcast=%s:%d",
+                          inet_ntoa(saddr->sin_addr),
+                          ntohs(saddr->sin_port));
+    } else {
+        switch (local->type) {
+        case SOCKET_ADDRESS_TYPE_INET:
+            qemu_set_info_str(&s->nc, "mcast=%s:%d",
+                              inet_ntoa(saddr->sin_addr),
+                              ntohs(saddr->sin_port));
+            break;
+        case SOCKET_ADDRESS_TYPE_FD:
+            qemu_set_info_str(&s->nc, "fd=%d (cloned mcast=%s:%d)",
+                              fd, inet_ntoa(saddr->sin_addr),
+                              ntohs(saddr->sin_port));
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
 
     return 0;
 
@@ -531,7 +527,7 @@ int net_init_dgram(const Netdev *netdev, const char *name,
         return -1;
     }
 
-    s = net_dgram_fd_init(peer, "dgram", name, fd, 0, NULL, errp);
+    s = net_dgram_fd_init(peer, "dgram", name, fd, errp);
     if (!s) {
         return -1;
     }
@@ -550,9 +546,22 @@ int net_init_dgram(const Netdev *netdev, const char *name,
                           inet_ntoa(raddr_in.sin_addr),
                           ntohs(raddr_in.sin_port));
         break;
-    case SOCKET_ADDRESS_TYPE_FD:
-        qemu_set_info_str(&s->nc, "fd=%d", fd);
+    case SOCKET_ADDRESS_TYPE_FD: {
+        SocketAddress *sa;
+        SocketAddressType sa_type;
+
+        sa = socket_local_address(fd, errp);
+        if (sa) {
+            sa_type = sa->type;
+            qapi_free_SocketAddress(sa);
+
+            qemu_set_info_str(&s->nc, "fd=%d %s", fd,
+                              SocketAddressType_str(sa_type));
+        } else {
+            qemu_set_info_str(&s->nc, "fd=%d", fd);
+        }
         break;
+    }
     default:
         g_assert_not_reached();
     }
-- 
2.7.4


