Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1983E3A17D6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:49:04 +0200 (CEST)
Received: from localhost ([::1]:47962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzVv-0001jH-67
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqzSo-0003HT-Ee
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:45:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqzSm-0005Sz-Hb
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623249947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0HyOa6ltjbaqEp6S+XfeNEi/Q5ntfEuMy7rznJ97OGI=;
 b=Dj19fdnAuDAG5Vjf5jioqV8KsyfK1igwnRCXpeW3kDoUvdiNPL0QkCdHqIM5lP94BtOsxd
 3utpBRt15aNlCje0MZO/jtNlxcLat4NiAMfBpxGCjkByjWiCSoQRAWtHdnZ2HeSe6IMnMM
 v6URvYcmzfR/wQ9nUBMD/O71tyWrpYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-ckR107n2PJeinN99C32T4A-1; Wed, 09 Jun 2021 10:45:46 -0400
X-MC-Unique: ckR107n2PJeinN99C32T4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60C8E1934104;
 Wed,  9 Jun 2021 14:45:45 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-168.ams2.redhat.com
 [10.36.113.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E35B11002EF0;
 Wed,  9 Jun 2021 14:45:40 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, huangy81@chinatelecom.cn, peterx@redhat.com,
 lizhijian@cn.fujitsu.com, leobras.c@gmail.com, pabeni@redhat.com
Subject: [PULL 7/9] sockets: Support multipath TCP
Date: Wed,  9 Jun 2021 15:45:10 +0100
Message-Id: <20210609144512.211746-8-dgilbert@redhat.com>
In-Reply-To: <20210609144512.211746-1-dgilbert@redhat.com>
References: <20210609144512.211746-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Multipath TCP allows combining multiple interfaces/routes into a single
socket, with very little work for the user/admin.

It's enabled by 'mptcp' on most socket addresses:

   ./qemu-system-x86_64 -nographic -incoming tcp:0:4444,mptcp

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210421112834.107651-6-dgilbert@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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
index 2463c49773..c415c342c1 100644
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


