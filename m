Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C15B5203C9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 19:51:29 +0200 (CEST)
Received: from localhost ([::1]:59956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no7Xc-0004NV-61
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 13:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1no7JN-0007MJ-IP
 for qemu-devel@nongnu.org; Mon, 09 May 2022 13:36:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1no7JM-000142-01
 for qemu-devel@nongnu.org; Mon, 09 May 2022 13:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652117803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQ461eKF56EY0djFo1y69Sg4lrRbfot/mXEIxyS0QME=;
 b=e0bbS6A3lDiGKxBQuZQ0skEc0clvlSthVoxQmGWCnvQMJDsm+jmOxM7WEG4kwM2hgZR7j9
 2SH5FfLWmBkiOVgm6REPWoMo5xmfOqBZuJzNrpCGw3Ada5zBafTbqzpH88FSPeM3kUpj53
 FlEQf3ptafWKClitagrTEz+h5zJk+cE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-m847oMWQMl--cnCCdWgbDg-1; Mon, 09 May 2022 13:36:42 -0400
X-MC-Unique: m847oMWQMl--cnCCdWgbDg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 235CA1019E1D
 for <qemu-devel@nongnu.org>; Mon,  9 May 2022 17:36:22 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 838CC4010157;
 Mon,  9 May 2022 17:36:21 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH 1/6] net: introduce convert_host_port()
Date: Mon,  9 May 2022 19:36:13 +0200
Message-Id: <20220509173618.467207-2-lvivier@redhat.com>
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

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 include/qemu/sockets.h |  2 ++
 net/net.c              | 62 ++++++++++++++++++++++--------------------
 2 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 038faa157f59..47194b9732f8 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -47,6 +47,8 @@ void socket_listen_cleanup(int fd, Error **errp);
 int socket_dgram(SocketAddress *remote, SocketAddress *local, Error **errp);
 
 /* Old, ipv4 only bits.  Don't use for new code. */
+int convert_host_port(struct sockaddr_in *saddr, const char *host,
+                      const char *port, Error **errp);
 int parse_host_port(struct sockaddr_in *saddr, const char *str,
                     Error **errp);
 int socket_init(void);
diff --git a/net/net.c b/net/net.c
index a094cf1d2929..58c05c200622 100644
--- a/net/net.c
+++ b/net/net.c
@@ -66,55 +66,57 @@ static QTAILQ_HEAD(, NetClientState) net_clients;
 /***********************************************************/
 /* network device redirectors */
 
-int parse_host_port(struct sockaddr_in *saddr, const char *str,
-                    Error **errp)
+int convert_host_port(struct sockaddr_in *saddr, const char *host,
+                      const char *port, Error **errp)
 {
-    gchar **substrings;
     struct hostent *he;
-    const char *addr, *p, *r;
-    int port, ret = 0;
+    const char *r;
+    long p;
 
     memset(saddr, 0, sizeof(*saddr));
 
-    substrings = g_strsplit(str, ":", 2);
-    if (!substrings || !substrings[0] || !substrings[1]) {
-        error_setg(errp, "host address '%s' doesn't contain ':' "
-                   "separating host from port", str);
-        ret = -1;
-        goto out;
-    }
-
-    addr = substrings[0];
-    p = substrings[1];
-
     saddr->sin_family = AF_INET;
-    if (addr[0] == '\0') {
+    if (host[0] == '\0') {
         saddr->sin_addr.s_addr = 0;
     } else {
-        if (qemu_isdigit(addr[0])) {
-            if (!inet_aton(addr, &saddr->sin_addr)) {
+        if (qemu_isdigit(host[0])) {
+            if (!inet_aton(host, &saddr->sin_addr)) {
                 error_setg(errp, "host address '%s' is not a valid "
-                           "IPv4 address", addr);
-                ret = -1;
-                goto out;
+                           "IPv4 address", host);
+                return -1;
             }
         } else {
-            he = gethostbyname(addr);
+            he = gethostbyname(host);
             if (he == NULL) {
-                error_setg(errp, "can't resolve host address '%s'", addr);
-                ret = -1;
-                goto out;
+                error_setg(errp, "can't resolve host address '%s'", host);
+                return -1;
             }
             saddr->sin_addr = *(struct in_addr *)he->h_addr;
         }
     }
-    port = strtol(p, (char **)&r, 0);
-    if (r == p) {
-        error_setg(errp, "port number '%s' is invalid", p);
+    if (qemu_strtol(port, &r, 0, &p) != 0) {
+        error_setg(errp, "port number '%s' is invalid", port);
+        return -1;
+    }
+    saddr->sin_port = htons(p);
+    return 0;
+}
+
+int parse_host_port(struct sockaddr_in *saddr, const char *str,
+                    Error **errp)
+{
+    gchar **substrings;
+    int ret;
+
+    substrings = g_strsplit(str, ":", 2);
+    if (!substrings || !substrings[0] || !substrings[1]) {
+        error_setg(errp, "host address '%s' doesn't contain ':' "
+                   "separating host from port", str);
         ret = -1;
         goto out;
     }
-    saddr->sin_port = htons(port);
+
+    ret = convert_host_port(saddr, substrings[0], substrings[1], errp);
 
 out:
     g_strfreev(substrings);
-- 
2.35.3


