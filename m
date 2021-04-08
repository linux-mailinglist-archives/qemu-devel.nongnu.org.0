Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD0F358E58
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 22:29:24 +0200 (CEST)
Received: from localhost ([::1]:47370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUbHH-0004y1-JJ
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 16:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lUbEq-0002za-JF
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 16:26:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lUbEe-0007Ve-It
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 16:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617913599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6v0ufZEPZNlTZ23gcFAWmj+A0YVzmAbagmcB2GekwNE=;
 b=F0wTO25uWCx9/kiIftGzuTkit3//rHQSxKf5cEJoS+Y9RBKAyOGAAZu6F+14AW6nmSOZLh
 zEVezR9+kQvqN5SHaZ6WsEymX//k7PuAoVl9n25dJw9jVrXe9cmWBWRhRxVzhGeg9lgCkD
 ZiNkn+hAJcJCMcBW8R8C/h4Upo1NTDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-p1OaxaUYODqXYV3dCcFaZg-1; Thu, 08 Apr 2021 16:26:38 -0400
X-MC-Unique: p1OaxaUYODqXYV3dCcFaZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA6221CC2CF
 for <qemu-devel@nongnu.org>; Thu,  8 Apr 2021 19:12:34 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-38.ams2.redhat.com
 [10.36.115.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A5BF5D9CC;
 Thu,  8 Apr 2021 19:12:30 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, kraxel@redhat.com,
 eblake@redhat.com, armbru@redhat.com, pabeni@redhat.com
Subject: [RFC PATCH 5/5] sockets: Support multipath TCP
Date: Thu,  8 Apr 2021 20:11:59 +0100
Message-Id: <20210408191159.133644-6-dgilbert@redhat.com>
In-Reply-To: <20210408191159.133644-1-dgilbert@redhat.com>
References: <20210408191159.133644-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Multipath TCP allows combining multiple interfaces/routes into a single
socket, with very little work for the user/admin.

It's enabled by 'mptcp' on most socket addresses:

   ./qemu-system-x86_64 -nographic -incoming tcp:0:4444,mptcp

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 io/dns-resolver.c   |  2 ++
 qapi/sockets.json   |  5 ++++-
 util/qemu-sockets.c | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/io/dns-resolver.c b/io/dns-resolver.c
index 743a0efc87..b081e098bb 100644
--- a/io/dns-resolver.c
+++ b/io/dns-resolver.c
@@ -122,6 +122,8 @@ static int qio_dns_resolver_lookup_sync_inet(QIODNSResolver *resolver,
             .ipv4 = iaddr->ipv4,
             .has_ipv6 = iaddr->has_ipv6,
             .ipv6 = iaddr->ipv6,
+            .has_mptcp = iaddr->has_mptcp,
+            .mptcp = iaddr->mptcp,
         };
 
         (*addrs)[i] = newaddr;
diff --git a/qapi/sockets.json b/qapi/sockets.json
index 2e83452797..43122a38bf 100644
--- a/qapi/sockets.json
+++ b/qapi/sockets.json
@@ -57,6 +57,8 @@
 # @keep-alive: enable keep-alive when connecting to this socket. Not supported
 #              for passive sockets. (Since 4.2)
 #
+# @mptcp: enable multi-path TCP. (Since 6.0)
+#
 # Since: 1.3
 ##
 { 'struct': 'InetSocketAddress',
@@ -66,7 +68,8 @@
     '*to': 'uint16',
     '*ipv4': 'bool',
     '*ipv6': 'bool',
-    '*keep-alive': 'bool' } }
+    '*keep-alive': 'bool',
+    '*mptcp': 'bool' } }
 
 ##
 # @UnixSocketAddress:
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 8af0278f15..72527972d5 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -206,6 +206,21 @@ static int try_bind(int socket, InetSocketAddress *saddr, struct addrinfo *e)
 #endif
 }
 
+static int check_mptcp(const InetSocketAddress *saddr, struct addrinfo *ai,
+                       Error **errp)
+{
+    if (saddr->has_mptcp && saddr->mptcp) {
+#ifdef IPPROTO_MPTCP
+        ai->ai_protocol = IPPROTO_MPTCP;
+#else
+        error_setg(errp, "MPTCP unavailable in this build");
+        return -1;
+#endif
+    }
+
+    return 0;
+}
+
 static int inet_listen_saddr(InetSocketAddress *saddr,
                              int port_offset,
                              int num,
@@ -278,6 +293,11 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
 
     /* create socket + bind/listen */
     for (e = res; e != NULL; e = e->ai_next) {
+        if (check_mptcp(saddr, e, &err)) {
+            error_propagate(errp, err);
+            return -1;
+        }
+
         getnameinfo((struct sockaddr*)e->ai_addr,e->ai_addrlen,
                         uaddr,INET6_ADDRSTRLEN,uport,32,
                         NI_NUMERICHOST | NI_NUMERICSERV);
@@ -456,6 +476,11 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
     for (e = res; e != NULL; e = e->ai_next) {
         error_free(local_err);
         local_err = NULL;
+
+        if (check_mptcp(saddr, e, &local_err)) {
+            break;
+        }
+
         sock = inet_connect_addr(saddr, e, &local_err);
         if (sock >= 0) {
             break;
@@ -687,6 +712,15 @@ int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
         }
         addr->has_keep_alive = true;
     }
+    begin = strstr(optstr, ",mptcp");
+    if (begin) {
+        if (inet_parse_flag("mptcp", begin + strlen(",mptcp"),
+                            &addr->mptcp, errp) < 0)
+        {
+            return -1;
+        }
+        addr->has_mptcp = true;
+    }
     return 0;
 }
 
-- 
2.31.1


