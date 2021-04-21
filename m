Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6563669F2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 13:32:54 +0200 (CEST)
Received: from localhost ([::1]:48146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZB6D-0006vp-BK
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 07:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lZB3p-0005Hz-6q
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 07:30:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lZB3n-0000wp-EM
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 07:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619004622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mMUqbXWzaqX32o8JwjV7L/8gcPeFSjXmqK0cmd0KwLE=;
 b=LwQ/Wphum56GsjZxhw4979xfeUPjx44ljMWLqZ6YXK2fDvFHoi95H0bTZLpWzdGmMgkBWn
 /MIMc94i1IVmxGZNYYSnv9NqO7xoIj+IEGH86U0/Zi430nTMRrgRuHN6/uaKF11h1g5mWs
 2SiJNY6cnl2Vpy2odXVCC4+Hxf0pseY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-WWtO9j79PbK8sfOXatuP6Q-1; Wed, 21 Apr 2021 07:29:47 -0400
X-MC-Unique: WWtO9j79PbK8sfOXatuP6Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93BA510890E5
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 11:28:49 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-29.ams2.redhat.com
 [10.36.114.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAAAE62693;
 Wed, 21 Apr 2021 11:28:47 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, kraxel@redhat.com,
 eblake@redhat.com, armbru@redhat.com, pabeni@redhat.com
Subject: [PATCH v2 5/5] sockets: Support multipath TCP
Date: Wed, 21 Apr 2021 12:28:34 +0100
Message-Id: <20210421112834.107651-6-dgilbert@redhat.com>
In-Reply-To: <20210421112834.107651-1-dgilbert@redhat.com>
References: <20210421112834.107651-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Multipath TCP allows combining multiple interfaces/routes into a single
socket, with very little work for the user/admin.

It's enabled by 'mptcp' on most socket addresses:

   ./qemu-system-x86_64 -nographic -incoming tcp:0:4444,mptcp

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 io/dns-resolver.c   |  4 ++++
 qapi/sockets.json   |  5 ++++-
 util/qemu-sockets.c | 23 +++++++++++++++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/io/dns-resolver.c b/io/dns-resolver.c
index 743a0efc87..a5946a93bf 100644
--- a/io/dns-resolver.c
+++ b/io/dns-resolver.c
@@ -122,6 +122,10 @@ static int qio_dns_resolver_lookup_sync_inet(QIODNSResolver *resolver,
             .ipv4 = iaddr->ipv4,
             .has_ipv6 = iaddr->has_ipv6,
             .ipv6 = iaddr->ipv6,
+#ifdef IPPROTO_MPTCP
+            .has_mptcp = iaddr->has_mptcp,
+            .mptcp = iaddr->mptcp,
+#endif
         };
 
         (*addrs)[i] = newaddr;
diff --git a/qapi/sockets.json b/qapi/sockets.json
index 2e83452797..735eb4abb5 100644
--- a/qapi/sockets.json
+++ b/qapi/sockets.json
@@ -57,6 +57,8 @@
 # @keep-alive: enable keep-alive when connecting to this socket. Not supported
 #              for passive sockets. (Since 4.2)
 #
+# @mptcp: enable multi-path TCP. (Since 6.1)
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
+    '*mptcp': { 'type': 'bool', 'if': 'defined(IPPROTO_MPTCP)' } } }
 
 ##
 # @UnixSocketAddress:
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 8af0278f15..ba7cb1ec4f 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -278,6 +278,11 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
 
     /* create socket + bind/listen */
     for (e = res; e != NULL; e = e->ai_next) {
+#ifdef IPPROTO_MPTCP
+        if (saddr->has_mptcp && saddr->mptcp) {
+            e->ai_protocol = IPPROTO_MPTCP;
+        }
+#endif
         getnameinfo((struct sockaddr*)e->ai_addr,e->ai_addrlen,
                         uaddr,INET6_ADDRSTRLEN,uport,32,
                         NI_NUMERICHOST | NI_NUMERICSERV);
@@ -456,6 +461,13 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
     for (e = res; e != NULL; e = e->ai_next) {
         error_free(local_err);
         local_err = NULL;
+
+#ifdef IPPROTO_MPTCP
+        if (saddr->has_mptcp && saddr->mptcp) {
+            e->ai_protocol = IPPROTO_MPTCP;
+        }
+#endif
+
         sock = inet_connect_addr(saddr, e, &local_err);
         if (sock >= 0) {
             break;
@@ -687,6 +699,17 @@ int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
         }
         addr->has_keep_alive = true;
     }
+#ifdef IPPROTO_MPTCP
+    begin = strstr(optstr, ",mptcp");
+    if (begin) {
+        if (inet_parse_flag("mptcp", begin + strlen(",mptcp"),
+                            &addr->mptcp, errp) < 0)
+        {
+            return -1;
+        }
+        addr->has_mptcp = true;
+    }
+#endif
     return 0;
 }
 
-- 
2.31.1


