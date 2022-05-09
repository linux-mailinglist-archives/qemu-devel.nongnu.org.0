Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45285203B1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 19:44:03 +0200 (CEST)
Received: from localhost ([::1]:46404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no7QQ-0003Ty-M7
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 13:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1no7J9-000726-Ds
 for qemu-devel@nongnu.org; Mon, 09 May 2022 13:36:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1no7J7-00012d-EE
 for qemu-devel@nongnu.org; Mon, 09 May 2022 13:36:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652117788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ToYkKaPbfElTjVmH+wgjLdbp1Kb5B9WCRUFojgbjEX4=;
 b=ZfLmiLr4GV7ZJ7qpIIVGz5smKgHGV5kbZ2bUyISL89PkTRpYV82g03/0eBTd6wVILlbcrj
 4ECY/ZRQoZaaCQPhNM+lFIvLamGFgGEp6skCc3Qg4YFtxR+EK70GUvgPa/bw9UtNJALiYD
 ELfaeyOUZ92oD4Caj+cJNFD24eLYKJQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-jElcsOxHMLu8RXiW2fzV3A-1; Mon, 09 May 2022 13:36:27 -0400
X-MC-Unique: jElcsOxHMLu8RXiW2fzV3A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CD0B3831C4C
 for <qemu-devel@nongnu.org>; Mon,  9 May 2022 17:36:27 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B31940CFD0C;
 Mon,  9 May 2022 17:36:26 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH 5/6] net: socket-ng: move mcast specific code from
 net_socket_fd_init_dgram()
Date: Mon,  9 May 2022 19:36:17 +0200
Message-Id: <20220509173618.467207-6-lvivier@redhat.com>
In-Reply-To: <20220509173618.467207-1-lvivier@redhat.com>
References: <20220509173618.467207-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
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

It is less complex to manage special cases directly in
net_socketng_mcast_init() and net_socketng_udp_init().

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 net/socket-ng.c | 144 ++++++++++++++++++++++++------------------------
 1 file changed, 73 insertions(+), 71 deletions(-)

diff --git a/net/socket-ng.c b/net/socket-ng.c
index 0056924dc02b..aabdd0eed381 100644
--- a/net/socket-ng.c
+++ b/net/socket-ng.c
@@ -340,52 +340,11 @@ static NetClientInfo net_dgram_socket_info = {
 static NetSocketNGState *net_socket_fd_init_dgram(NetClientState *peer,
                                                 const char *model,
                                                 const char *name,
-                                                int fd, int is_fd,
-                                                SocketAddress *mcast,
+                                                int fd,
                                                 Error **errp)
 {
-    struct sockaddr_in *saddr = NULL;
-    int newfd;
     NetClientState *nc;
     NetSocketNGState *s;
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
-     * fd passed: multicast: "learn" dgram_dst address from bound address and
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
-            newfd = net_socket_mcast_create(saddr, NULL, errp);
-            if (newfd < 0) {
-                goto err;
-            }
-            /* clone newfd to fd, close newfd */
-            dup2(newfd, fd);
-            close(newfd);
-    }
 
     nc = qemu_new_net_client(&net_dgram_socket_info, peer, model, name);
 
@@ -397,24 +356,7 @@ static NetSocketNGState *net_socket_fd_init_dgram(NetClientState *peer,
     net_socket_rs_init(&s->rs, net_socket_rs_finalize, false);
     net_socket_read_poll(s, true);
 
-    /* mcast: save bound address as dst */
-    if (saddr) {
-        g_assert(s->dgram_dst == NULL);
-        s->dgram_dst = (struct sockaddr *)saddr;
-        snprintf(nc->info_str, sizeof(nc->info_str),
-                 "socket-ng: fd=%d (cloned mcast=%s:%d)",
-                 fd, inet_ntoa(saddr->sin_addr), ntohs(saddr->sin_port));
-    } else {
-        snprintf(nc->info_str, sizeof(nc->info_str),
-                 "socket-ng: fd=%d %s", fd, SocketAddressType_str(sa_type));
-    }
-
     return s;
-
-err:
-    g_free(saddr);
-    closesocket(fd);
-    return NULL;
 }
 
 static void net_socket_connect(void *opaque)
@@ -743,6 +685,7 @@ static int net_socketng_mcast_init(NetClientState *peer,
     NetSocketNGState *s;
     int fd, ret;
     struct sockaddr_in *saddr;
+    gchar *info_str;
 
     if (remote->type != SOCKET_ADDRESS_TYPE_INET) {
         error_setg(errp, "multicast only support inet type");
@@ -762,6 +705,9 @@ static int net_socketng_mcast_init(NetClientState *peer,
             g_free(saddr);
             return -1;
         }
+        info_str = g_strdup_printf("socket-ng: mcast=%s:%d",
+                                   inet_ntoa(saddr->sin_addr),
+                                   ntohs(saddr->sin_port));
     } else {
         switch (local->type) {
         case SOCKET_ADDRESS_TYPE_INET: {
@@ -779,9 +725,14 @@ static int net_socketng_mcast_init(NetClientState *peer,
                 g_free(saddr);
                 return -1;
             }
+            info_str = g_strdup_printf("socket-ng: mcast=%s:%d",
+                                       inet_ntoa(saddr->sin_addr),
+                                       ntohs(saddr->sin_port));
             break;
         }
-        case SOCKET_ADDRESS_TYPE_FD:
+        case SOCKET_ADDRESS_TYPE_FD: {
+            int newfd;
+
             fd = monitor_fd_param(monitor_cur(), local->u.fd.str, errp);
             if (fd == -1) {
                 g_free(saddr);
@@ -794,7 +745,46 @@ static int net_socketng_mcast_init(NetClientState *peer,
                                  name, fd);
                 return -1;
             }
+
+            /*
+             * fd passed: multicast: "learn" dgram_dst address from bound
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
+            newfd = net_socket_mcast_create(saddr, NULL, errp);
+            if (newfd < 0) {
+                g_free(saddr);
+                closesocket(fd);
+                return -1;
+            }
+            /* clone newfd to fd, close newfd */
+            dup2(newfd, fd);
+            close(newfd);
+
+            info_str = g_strdup_printf("socket-ng: fd=%d (cloned mcast=%s:%d)",
+                                       fd, inet_ntoa(saddr->sin_addr),
+                                       ntohs(saddr->sin_port));
             break;
+        }
         default:
             g_free(saddr);
             error_setg(errp, "only support inet or fd type for local");
@@ -802,9 +792,7 @@ static int net_socketng_mcast_init(NetClientState *peer,
         }
     }
 
-    s = net_socket_fd_init_dgram(peer, model, name, fd,
-                                 local->type == SOCKET_ADDRESS_TYPE_FD,
-                                 remote, errp);
+    s = net_socket_fd_init_dgram(peer, model, name, fd, errp);
     if (!s) {
         g_free(saddr);
         return -1;
@@ -813,9 +801,8 @@ static int net_socketng_mcast_init(NetClientState *peer,
     g_assert(s->dgram_dst == NULL);
     s->dgram_dst = (struct sockaddr *)saddr;
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "socket-ng: mcast=%s:%d",
-             inet_ntoa(saddr->sin_addr), ntohs(saddr->sin_port));
+    pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), info_str);
+    g_free(info_str);
 
     return 0;
 
@@ -895,7 +882,10 @@ static int net_socketng_udp_init(NetClientState *peer,
 
         break;
     }
-    case SOCKET_ADDRESS_TYPE_FD:
+    case SOCKET_ADDRESS_TYPE_FD: {
+        SocketAddress *sa;
+        SocketAddressType sa_type;
+
         fd = monitor_fd_param(monitor_cur(), local->u.fd.str, errp);
         if (fd == -1) {
             return -1;
@@ -906,23 +896,35 @@ static int net_socketng_udp_init(NetClientState *peer,
                              name, fd);
             return -1;
         }
+
+        sa = socket_local_address(fd, errp);
+        if (sa) {
+            sa_type = sa->type;
+            qapi_free_SocketAddress(sa);
+
+            info_str = g_strdup_printf("socket: fd=%d %s", fd,
+                                       SocketAddressType_str(sa_type));
+        } else {
+            info_str = g_strdup_printf("socket: fd=%d", fd);
+        }
         break;
+    }
     default:
         error_setg(errp, "only support inet or fd type for local");
         return -1;
     }
 
-    s = net_socket_fd_init_dgram(peer, model, name, fd, 0, NULL, errp);
+    s = net_socket_fd_init_dgram(peer, model, name, fd, errp);
     if (!s) {
         return -1;
     }
 
+    pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), info_str);
+    g_free(info_str);
+
     if (remote) {
         g_assert(s->dgram_dst == NULL);
         s->dgram_dst = dgram_dst;
-
-        pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), info_str);
-        g_free(info_str);
     }
     return 0;
 };
-- 
2.35.3


