Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A0055BAF4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 18:06:19 +0200 (CEST)
Received: from localhost ([::1]:32862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5rFi-0001NT-8a
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 12:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o5qyJ-0002A1-C8
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 11:48:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o5qyH-0005jG-Kx
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 11:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656344897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJAU+7InORxMPHxiYkKkGEeyXytUsbFefHrNh/X56pk=;
 b=ZLN3k20BVFlr//vrRYYiGoRosQUlQK1fzwjTBhJxoQLLJN/mTJatmAdWmByPph/l2oNB6y
 RayRydgnDUIvzDMWwvjjBwyH4Y2n1nN1I1V+GXx6MHBifOpJFQdJ6wv2cha/Tw3Hv1+9Hq
 aUc5S032t3z+yILZvq24Sfj6mILI3sk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-NcDqzuqZOgGu0ed4d8rDyA-1; Mon, 27 Jun 2022 11:48:16 -0400
X-MC-Unique: NcDqzuqZOgGu0ed4d8rDyA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C54D5811E7A
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 15:48:15 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEE9C2166B26;
 Mon, 27 Jun 2022 15:48:13 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v5 09/12] net: dgram: move mcast specific code from
 net_socket_fd_init_dgram()
Date: Mon, 27 Jun 2022 17:47:46 +0200
Message-Id: <20220627154749.871943-10-lvivier@redhat.com>
In-Reply-To: <20220627154749.871943-1-lvivier@redhat.com>
References: <20220627154749.871943-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

It is less complex to manage special cases directly in
net_dgram_mcast_init() and net_dgram_udp_init().

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
---
 net/dgram.c | 143 +++++++++++++++++++++++++++-------------------------
 1 file changed, 73 insertions(+), 70 deletions(-)

diff --git a/net/dgram.c b/net/dgram.c
index dcc2205305c5..16e2d909755c 100644
--- a/net/dgram.c
+++ b/net/dgram.c
@@ -302,52 +302,11 @@ static NetClientInfo net_dgram_socket_info = {
 static NetDgramState *net_dgram_fd_init_dgram(NetClientState *peer,
                                               const char *model,
                                               const char *name,
-                                              int fd, int is_fd,
-                                              SocketAddress *mcast,
+                                              int fd,
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
-            newfd = net_dgram_mcast_create(saddr, NULL, errp);
-            if (newfd < 0) {
-                goto err;
-            }
-            /* clone newfd to fd, close newfd */
-            dup2(newfd, fd);
-            close(newfd);
-    }
 
     nc = qemu_new_net_client(&net_dgram_socket_info, peer, model, name);
 
@@ -359,24 +318,7 @@ static NetDgramState *net_dgram_fd_init_dgram(NetClientState *peer,
     net_socket_rs_init(&s->rs, net_dgram_rs_finalize, false);
     net_dgram_read_poll(s, true);
 
-    /* mcast: save bound address as dst */
-    if (saddr) {
-        g_assert(s->dgram_dst == NULL);
-        s->dgram_dst = (struct sockaddr *)saddr;
-        snprintf(nc->info_str, sizeof(nc->info_str),
-                 "fd=%d (cloned mcast=%s:%d)",
-                 fd, inet_ntoa(saddr->sin_addr), ntohs(saddr->sin_port));
-    } else {
-        snprintf(nc->info_str, sizeof(nc->info_str), "fd=%d %s", fd,
-                 SocketAddressType_str(sa_type));
-    }
-
     return s;
-
-err:
-    g_free(saddr);
-    closesocket(fd);
-    return NULL;
 }
 
 static void net_dgram_connect(void *opaque)
@@ -421,6 +363,7 @@ static int net_dgram_mcast_init(NetClientState *peer,
     NetDgramState *s;
     int fd, ret;
     struct sockaddr_in *saddr;
+    gchar *info_str;
 
     if (remote->type != SOCKET_ADDRESS_TYPE_INET) {
         error_setg(errp, "multicast only support inet type");
@@ -440,6 +383,9 @@ static int net_dgram_mcast_init(NetClientState *peer,
             g_free(saddr);
             return -1;
         }
+        info_str = g_strdup_printf("mcast=%s:%d",
+                                   inet_ntoa(saddr->sin_addr),
+                                   ntohs(saddr->sin_port));
     } else {
         switch (local->type) {
         case SOCKET_ADDRESS_TYPE_INET: {
@@ -457,9 +403,14 @@ static int net_dgram_mcast_init(NetClientState *peer,
                 g_free(saddr);
                 return -1;
             }
+            info_str = g_strdup_printf("mcast=%s:%d",
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
@@ -472,7 +423,46 @@ static int net_dgram_mcast_init(NetClientState *peer,
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
+            newfd = net_dgram_mcast_create(saddr, NULL, errp);
+            if (newfd < 0) {
+                g_free(saddr);
+                closesocket(fd);
+                return -1;
+            }
+            /* clone newfd to fd, close newfd */
+            dup2(newfd, fd);
+            close(newfd);
+
+            info_str = g_strdup_printf("fd=%d (cloned mcast=%s:%d)",
+                                       fd, inet_ntoa(saddr->sin_addr),
+                                       ntohs(saddr->sin_port));
             break;
+        }
         default:
             g_free(saddr);
             error_setg(errp, "only support inet or fd type for local");
@@ -480,9 +470,7 @@ static int net_dgram_mcast_init(NetClientState *peer,
         }
     }
 
-    s = net_dgram_fd_init_dgram(peer, model, name, fd,
-                                 local->type == SOCKET_ADDRESS_TYPE_FD,
-                                 remote, errp);
+    s = net_dgram_fd_init_dgram(peer, model, name, fd, errp);
     if (!s) {
         g_free(saddr);
         return -1;
@@ -491,8 +479,8 @@ static int net_dgram_mcast_init(NetClientState *peer,
     g_assert(s->dgram_dst == NULL);
     s->dgram_dst = (struct sockaddr *)saddr;
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str), "mcast=%s:%d",
-             inet_ntoa(saddr->sin_addr), ntohs(saddr->sin_port));
+    pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), info_str);
+    g_free(info_str);
 
     return 0;
 
@@ -571,7 +559,10 @@ static int net_dgram_udp_init(NetClientState *peer,
 
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
@@ -582,23 +573,35 @@ static int net_dgram_udp_init(NetClientState *peer,
                              name, fd);
             return -1;
         }
+
+        sa = socket_local_address(fd, errp);
+        if (sa) {
+            sa_type = sa->type;
+            qapi_free_SocketAddress(sa);
+
+            info_str = g_strdup_printf("fd=%d %s", fd,
+                                       SocketAddressType_str(sa_type));
+        } else {
+            info_str = g_strdup_printf("fd=%d", fd);
+        }
         break;
+    }
     default:
         error_setg(errp, "only support inet or fd type for local");
         return -1;
     }
 
-    s = net_dgram_fd_init_dgram(peer, model, name, fd, 0, NULL, errp);
+    s = net_dgram_fd_init_dgram(peer, model, name, fd, errp);
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
 }
-- 
2.36.1


