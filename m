Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1614E5515D9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 12:29:20 +0200 (CEST)
Received: from localhost ([::1]:40012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Eel-0005z0-6k
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 06:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o3EUh-0006bj-W1
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:18:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o3EUf-0007W4-Df
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655720332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ilzc2jiWuPRUKLGLXsGWGS2+/9OzMYruir6oHjgl8jk=;
 b=Re6az2UPed6Z5bkbhCItc1SQRcawxRc+/qbYLeXG6IDLp2xPZRMJ8ULMVyOVQkjHu0KaGS
 q9w3uAo99dkckH4BoTf9cy8zjGYBh1l2K7PHYQoq6Z0g4XXtGeuCY4bdibZETjYrCpWRXU
 7pEMjxHXLTF4fxEDV+6uW8Fji+ZkNDM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-hLrce-i6MBG7RbuFmNpgog-1; Mon, 20 Jun 2022 06:18:51 -0400
X-MC-Unique: hLrce-i6MBG7RbuFmNpgog-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D282B299E74D
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:18:50 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BA0C492C3B;
 Mon, 20 Jun 2022 10:18:49 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH v3 10/11] qemu-sockets: introduce socket_uri()
Date: Mon, 20 Jun 2022 12:18:27 +0200
Message-Id: <20220620101828.518865-11-lvivier@redhat.com>
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

Format a string URI from a SocketAddress.

Original code from hmp-cmds.c:SocketAddress_to_str()

Replace 'tcp:' by 'inet:' (because 'inet' can be also 'udp').
Replace 'tcp:' by 'vsock:' with vsock socket type.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 include/qemu/sockets.h |  2 +-
 monitor/hmp-cmds.c     | 23 +----------------------
 util/qemu-sockets.c    | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 47194b9732f8..3e2ae7e21705 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -41,6 +41,7 @@ int unix_listen(const char *path, Error **errp);
 int unix_connect(const char *path, Error **errp);
 
 SocketAddress *socket_parse(const char *str, Error **errp);
+char *socket_uri(SocketAddress *addr);
 int socket_connect(SocketAddress *addr, Error **errp);
 int socket_listen(SocketAddress *addr, int num, Error **errp);
 void socket_listen_cleanup(int fd, Error **errp);
@@ -123,5 +124,4 @@ SocketAddress *socket_address_flatten(SocketAddressLegacy *addr);
  * Return 0 on success.
  */
 int socket_address_parse_named_fd(SocketAddress *addr, Error **errp);
-
 #endif /* QEMU_SOCKETS_H */
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 622c783c32e1..dcea71210e30 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -195,27 +195,6 @@ void hmp_info_mice(Monitor *mon, const QDict *qdict)
     qapi_free_MouseInfoList(mice_list);
 }
 
-static char *SocketAddress_to_str(SocketAddress *addr)
-{
-    switch (addr->type) {
-    case SOCKET_ADDRESS_TYPE_INET:
-        return g_strdup_printf("tcp:%s:%s",
-                               addr->u.inet.host,
-                               addr->u.inet.port);
-    case SOCKET_ADDRESS_TYPE_UNIX:
-        return g_strdup_printf("unix:%s",
-                               addr->u.q_unix.path);
-    case SOCKET_ADDRESS_TYPE_FD:
-        return g_strdup_printf("fd:%s", addr->u.fd.str);
-    case SOCKET_ADDRESS_TYPE_VSOCK:
-        return g_strdup_printf("tcp:%s:%s",
-                               addr->u.vsock.cid,
-                               addr->u.vsock.port);
-    default:
-        return g_strdup("unknown address type");
-    }
-}
-
 void hmp_info_migrate(Monitor *mon, const QDict *qdict)
 {
     MigrationInfo *info;
@@ -373,7 +352,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "socket address: [\n");
 
         for (addr = info->socket_address; addr; addr = addr->next) {
-            char *s = SocketAddress_to_str(addr->value);
+            char *s = socket_uri(addr->value);
             monitor_printf(mon, "\t%s\n", s);
             g_free(s);
         }
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 13b5b197f9ea..4efc2ce8b074 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1098,6 +1098,26 @@ int unix_connect(const char *path, Error **errp)
     return sock;
 }
 
+char *socket_uri(SocketAddress *addr)
+{
+    switch (addr->type) {
+    case SOCKET_ADDRESS_TYPE_INET:
+        return g_strdup_printf("inet:%s:%s",
+                               addr->u.inet.host,
+                               addr->u.inet.port);
+    case SOCKET_ADDRESS_TYPE_UNIX:
+        return g_strdup_printf("unix:%s",
+                               addr->u.q_unix.path);
+    case SOCKET_ADDRESS_TYPE_FD:
+        return g_strdup_printf("fd:%s", addr->u.fd.str);
+    case SOCKET_ADDRESS_TYPE_VSOCK:
+        return g_strdup_printf("vsock:%s:%s",
+                               addr->u.vsock.cid,
+                               addr->u.vsock.port);
+    default:
+        return g_strdup("unknown address type");
+    }
+}
 
 SocketAddress *socket_parse(const char *str, Error **errp)
 {
-- 
2.36.1


