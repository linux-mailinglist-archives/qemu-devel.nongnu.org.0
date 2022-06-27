Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6CF55BB19
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 18:22:55 +0200 (CEST)
Received: from localhost ([::1]:39568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5rVm-0000Kj-2k
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 12:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o5qyE-00021d-UA
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 11:48:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o5qyD-0005ik-BA
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 11:48:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656344892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/R3XMy4d111ISt9N7aac4zN8XErVUnJxv3oY2OqsA0=;
 b=fQlJ6D1HZeemP5uX5onAx2CP1C0vOHq2hQ3LqqwcD+HY/z8w6IPaV6rAR47Xv1ge0n578l
 7C0fukKWglGfBKNIDRn5pJejDWiyQ7csOrUqCGnrkiqerseFBD4fD9a92WV5SVHE/094Hu
 iZETV9WolMUNtscOCIAjrWHkXfdrxH4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-wsLJ3c02OpK8jIHxwNIv0A-1; Mon, 27 Jun 2022 11:48:11 -0400
X-MC-Unique: wsLJ3c02OpK8jIHxwNIv0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A6873C0F363
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 15:48:11 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 607CB2166B29;
 Mon, 27 Jun 2022 15:48:09 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v5 07/12] net: stream: add unix socket
Date: Mon, 27 Jun 2022 17:47:44 +0200
Message-Id: <20220627154749.871943-8-lvivier@redhat.com>
In-Reply-To: <20220627154749.871943-1-lvivier@redhat.com>
References: <20220627154749.871943-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
---
 net/stream.c    | 106 +++++++++++++++++++++++++++++++++++++++++++++---
 qemu-options.hx |   1 +
 2 files changed, 102 insertions(+), 5 deletions(-)

diff --git a/net/stream.c b/net/stream.c
index e8afbaca50b6..1a2bc237707e 100644
--- a/net/stream.c
+++ b/net/stream.c
@@ -235,7 +235,7 @@ static NetStreamState *net_stream_fd_init_stream(NetClientState *peer,
 static void net_stream_accept(void *opaque)
 {
     NetStreamState *s = opaque;
-    struct sockaddr_in saddr;
+    struct sockaddr_storage saddr;
     socklen_t len;
     int fd;
 
@@ -253,9 +253,27 @@ static void net_stream_accept(void *opaque)
     s->fd = fd;
     s->nc.link_down = false;
     net_stream_connect(s);
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "connection from %s:%d",
-             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+    switch (saddr.ss_family) {
+    case AF_INET: {
+        struct sockaddr_in *saddr_in = (struct sockaddr_in *)&saddr;
+
+        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
+                 "connection from %s:%d",
+                 inet_ntoa(saddr_in->sin_addr), ntohs(saddr_in->sin_port));
+        break;
+    }
+    case AF_UNIX: {
+        struct sockaddr_un saddr_un;
+
+        len = sizeof(saddr_un);
+        getsockname(s->listen_fd, (struct sockaddr *)&saddr_un, &len);
+        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
+                 "connect from %s", saddr_un.sun_path);
+        break;
+    }
+    default:
+        g_assert_not_reached();
+    }
 }
 
 static int net_stream_server_init(NetClientState *peer,
@@ -295,6 +313,42 @@ static int net_stream_server_init(NetClientState *peer,
         }
         break;
     }
+    case SOCKET_ADDRESS_TYPE_UNIX: {
+        struct sockaddr_un saddr_un;
+
+        ret = unlink(addr->u.q_unix.path);
+        if (ret < 0 && errno != ENOENT) {
+            error_setg_errno(errp, errno, "failed to unlink socket %s",
+                             addr->u.q_unix.path);
+            return -1;
+        }
+
+        saddr_un.sun_family = PF_UNIX;
+        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
+                       addr->u.q_unix.path);
+        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
+            error_setg(errp, "UNIX socket path '%s' is too long",
+                       addr->u.q_unix.path);
+            error_append_hint(errp, "Path must be less than %zu bytes\n",
+                              sizeof(saddr_un.sun_path));
+        }
+
+        fd = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
+        if (fd < 0) {
+            error_setg_errno(errp, errno, "can't create stream socket");
+            return -1;
+        }
+        qemu_socket_set_nonblock(fd);
+
+        ret = bind(fd, (struct sockaddr *)&saddr_un, sizeof(saddr_un));
+        if (ret < 0) {
+            error_setg_errno(errp, errno, "can't create socket with path: %s",
+                             saddr_un.sun_path);
+            closesocket(fd);
+            return -1;
+        }
+        break;
+    }
     case SOCKET_ADDRESS_TYPE_FD:
         fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
         if (fd == -1) {
@@ -380,6 +434,48 @@ static int net_stream_client_init(NetClientState *peer,
                                    ntohs(saddr_in.sin_port));
         break;
     }
+    case SOCKET_ADDRESS_TYPE_UNIX: {
+        struct sockaddr_un saddr_un;
+
+        saddr_un.sun_family = PF_UNIX;
+        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
+                       addr->u.q_unix.path);
+        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
+            error_setg(errp, "UNIX socket path '%s' is too long",
+                       addr->u.q_unix.path);
+            error_append_hint(errp, "Path must be less than %zu bytes\n",
+                              sizeof(saddr_un.sun_path));
+        }
+
+        fd = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
+        if (fd < 0) {
+            error_setg_errno(errp, errno, "can't create stream socket");
+            return -1;
+        }
+        qemu_socket_set_nonblock(fd);
+
+        connected = 0;
+        for (;;) {
+            ret = connect(fd, (struct sockaddr *)&saddr_un, sizeof(saddr_un));
+            if (ret < 0) {
+                if (errno == EINTR || errno == EWOULDBLOCK) {
+                    /* continue */
+                } else if (errno == EAGAIN ||
+                           errno == EALREADY) {
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
+        info_str = g_strdup_printf(" connect to %s", saddr_un.sun_path);
+        break;
+    }
     case SOCKET_ADDRESS_TYPE_FD:
         fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
         if (fd == -1) {
@@ -395,7 +491,7 @@ static int net_stream_client_init(NetClientState *peer,
         info_str = g_strdup_printf("connect to fd %d", fd);
         break;
     default:
-        error_setg(errp, "only support inet or fd type");
+        error_setg(errp, "only support inet, unix or fd type");
         return -1;
     }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 2be0cbd2549b..23ff12c1b183 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2723,6 +2723,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                configure a network backend to connect to another network\n"
     "                using an UDP tunnel\n"
     "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port\n"
+    "-netdev stream,id=str[,server=on|off],addr.type=unix,addr.path=path\n"
     "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=h\n"
     "                configure a network backend to connect to another network\n"
     "                using a socket connection in stream mode.\n"
-- 
2.36.1


