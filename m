Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577E96109FD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:57:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIGV-0007ht-AV; Fri, 28 Oct 2022 01:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIFq-0007Rf-Le
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:50:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIFl-0007hv-59
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666936200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kOWLrCrlJtuNh87ot6hBgBSJxgqiO62dIsIeCs8xvkw=;
 b=LXIx1fN2Q3jhgyGkkmc1/TDOxK+fGGsdcFV8LxXKcvkS1zwM6ZwLBKLtcRO2iDgAmh0z/d
 QfCWp5V5bnP0V7A+hvmPzb0wV6Ds/5yt/yD6aaiaiLGRsb0vqAem4i6jWNUeooYwoYhMei
 gVcACdquaqhvyEj7mSjN8FKyj02cg6Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-P0FdjxSuNqOlssvODvtepQ-1; Fri, 28 Oct 2022 01:49:56 -0400
X-MC-Unique: P0FdjxSuNqOlssvODvtepQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 041601C08790;
 Fri, 28 Oct 2022 05:49:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-50.pek2.redhat.com [10.72.13.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF73CC15995;
 Fri, 28 Oct 2022 05:49:51 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 22/26] net: dgram: add unix socket
Date: Fri, 28 Oct 2022 13:48:31 +0800
Message-Id: <20221028054835.29674-23-jasowang@redhat.com>
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

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com> (QAPI schema)
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/dgram.c     | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 qapi/net.json   |  2 +-
 qemu-options.hx |  1 +
 3 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/net/dgram.c b/net/dgram.c
index e581cc6..9f7bf38 100644
--- a/net/dgram.c
+++ b/net/dgram.c
@@ -426,6 +426,7 @@ int net_init_dgram(const Netdev *netdev, const char *name,
     SocketAddress *remote, *local;
     struct sockaddr *dest_addr;
     struct sockaddr_in laddr_in, raddr_in;
+    struct sockaddr_un laddr_un, raddr_un;
     socklen_t dest_len;
 
     assert(netdev->type == NET_CLIENT_DRIVER_DGRAM);
@@ -465,7 +466,8 @@ int net_init_dgram(const Netdev *netdev, const char *name,
         }
     } else {
         if (local->type != SOCKET_ADDRESS_TYPE_FD) {
-            error_setg(errp, "type=inet requires remote parameter");
+            error_setg(errp,
+                       "type=inet or type=unix requires remote parameter");
             return -1;
         }
     }
@@ -508,6 +510,53 @@ int net_init_dgram(const Netdev *netdev, const char *name,
         dest_addr = g_malloc(dest_len);
         memcpy(dest_addr, &raddr_in, dest_len);
         break;
+    case SOCKET_ADDRESS_TYPE_UNIX:
+        ret = unlink(local->u.q_unix.path);
+        if (ret < 0 && errno != ENOENT) {
+            error_setg_errno(errp, errno, "failed to unlink socket %s",
+                             local->u.q_unix.path);
+            return -1;
+        }
+
+        laddr_un.sun_family = PF_UNIX;
+        ret = snprintf(laddr_un.sun_path, sizeof(laddr_un.sun_path), "%s",
+                       local->u.q_unix.path);
+        if (ret < 0 || ret >= sizeof(laddr_un.sun_path)) {
+            error_setg(errp, "UNIX socket path '%s' is too long",
+                       local->u.q_unix.path);
+            error_append_hint(errp, "Path must be less than %zu bytes\n",
+                              sizeof(laddr_un.sun_path));
+        }
+
+        raddr_un.sun_family = PF_UNIX;
+        ret = snprintf(raddr_un.sun_path, sizeof(raddr_un.sun_path), "%s",
+                       remote->u.q_unix.path);
+        if (ret < 0 || ret >= sizeof(raddr_un.sun_path)) {
+            error_setg(errp, "UNIX socket path '%s' is too long",
+                       remote->u.q_unix.path);
+            error_append_hint(errp, "Path must be less than %zu bytes\n",
+                              sizeof(raddr_un.sun_path));
+        }
+
+        fd = qemu_socket(PF_UNIX, SOCK_DGRAM, 0);
+        if (fd < 0) {
+            error_setg_errno(errp, errno, "can't create datagram socket");
+            return -1;
+        }
+
+        ret = bind(fd, (struct sockaddr *)&laddr_un, sizeof(laddr_un));
+        if (ret < 0) {
+            error_setg_errno(errp, errno, "can't bind unix=%s to socket",
+                             laddr_un.sun_path);
+            closesocket(fd);
+            return -1;
+        }
+        qemu_socket_set_nonblock(fd);
+
+        dest_len = sizeof(raddr_un);
+        dest_addr = g_malloc(dest_len);
+        memcpy(dest_addr, &raddr_un, dest_len);
+        break;
     case SOCKET_ADDRESS_TYPE_FD:
         fd = monitor_fd_param(monitor_cur(), local->u.fd.str, errp);
         if (fd == -1) {
@@ -546,6 +595,10 @@ int net_init_dgram(const Netdev *netdev, const char *name,
                           inet_ntoa(raddr_in.sin_addr),
                           ntohs(raddr_in.sin_port));
         break;
+    case SOCKET_ADDRESS_TYPE_UNIX:
+        qemu_set_info_str(&s->nc, "udp=%s:%s",
+                          laddr_un.sun_path, raddr_un.sun_path);
+        break;
     case SOCKET_ADDRESS_TYPE_FD: {
         SocketAddress *sa;
         SocketAddressType sa_type;
diff --git a/qapi/net.json b/qapi/net.json
index b4768ce..cbc8d77 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -603,7 +603,7 @@
 # @remote: remote address
 # @local: local address
 #
-# Only SocketAddress types 'inet' and 'fd' are supported.
+# Only SocketAddress types 'unix', 'inet' and 'fd' are supported.
 #
 # If remote address is present and it's a multicast address, local address
 # is optional. Otherwise local address is required and remote address is
diff --git a/qemu-options.hx b/qemu-options.hx
index 858f3dc..e76142b 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2782,6 +2782,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                configure a network backend to connect to a multicast maddr and port\n"
     "                use ``local.host=addr`` to specify the host address to send packets from\n"
     "-netdev dgram,id=str,local.type=inet,local.host=addr,local.port=port[,remote.type=inet,remote.host=addr,remote.port=port]\n"
+    "-netdev dgram,id=str,local.type=unix,local.path=path[,remote.type=unix,remote.path=path]\n"
     "-netdev dgram,id=str,local.type=fd,local.str=file-descriptor\n"
     "                configure a network backend to connect to another network\n"
     "                using an UDP tunnel\n"
-- 
2.7.4


