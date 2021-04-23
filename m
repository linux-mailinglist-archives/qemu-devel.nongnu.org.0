Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE128369632
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 17:32:58 +0200 (CEST)
Received: from localhost ([::1]:57838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZxnd-0000kB-Td
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 11:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1lZxlw-0007ot-0M
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:31:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1lZxlt-0000f1-Vd
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619191869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGrweohHu0nTHRSihwf2V3bZpwnNswbiV+ybDnLfE2w=;
 b=AT1GRVL4w8XcD9WZSYq5+qmISTXSjbSV0EOQjQsSAGVjSfwXZp3RaKj8HxEI2kf2tZA1Wp
 aS3SeJQhn4FXw18dnJF4q134nhVHNiehxQd/GhaNs5RNTpzVqTXBRYVrPy59/LflPfMkCx
 EsTSi4/CkWRi2bswuRGYAXNCV9Z4IuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-kdjyaBfCNaG2LUNs5Ci8PA-1; Fri, 23 Apr 2021 11:31:06 -0400
X-MC-Unique: kdjyaBfCNaG2LUNs5Ci8PA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D62A78030C4;
 Fri, 23 Apr 2021 15:31:05 +0000 (UTC)
Received: from epycfail.redhat.com (unknown [10.36.110.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F22263BA7;
 Fri, 23 Apr 2021 15:31:03 +0000 (UTC)
From: Stefano Brivio <sbrivio@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] net: Allow also UNIX domain sockets to be used as -netdev
 socket
Date: Fri, 23 Apr 2021 17:30:44 +0200
Message-Id: <ba51349d353f11e05c6341a7e065f2ade3874c68.1619190878.git.sbrivio@redhat.com>
In-Reply-To: <cover.1619190878.git.sbrivio@redhat.com>
References: <cover.1619190878.git.sbrivio@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sbrivio@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sbrivio@redhat.com;
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
Cc: Ralph Schmieder <ralph.schmieder@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laine Stump <laine@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It has lower overhead compared to TCP, doesn't need a free port
and the adaptation is trivial.

Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
---
 net/socket.c    | 106 ++++++++++++++++++++++++++++++++++++++++--------
 qemu-options.hx |  12 +++---
 2 files changed, 94 insertions(+), 24 deletions(-)

diff --git a/net/socket.c b/net/socket.c
index 15b410e8d825..aadd11dae2b3 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -511,26 +511,60 @@ static int net_socket_listen_init(NetClientState *peer,
 {
     NetClientState *nc;
     NetSocketState *s;
-    struct sockaddr_in saddr;
-    int fd, ret;
+    struct sockaddr_storage saddr;
+    struct sockaddr_in *saddr_in = (struct sockaddr_in *)&saddr;
+    struct sockaddr_un *saddr_un = (struct sockaddr_un *)&saddr;
+    size_t saddr_size;
+    int fd, ret, pf;
+
+#ifndef WIN32
+    if (strchr(host_str, ':')) {
+#endif
+        if (parse_host_port(saddr_in, host_str, errp) < 0)
+            return -1;
 
-    if (parse_host_port(&saddr, host_str, errp) < 0) {
-        return -1;
+        pf = PF_INET;
+        saddr_size = sizeof(*saddr_in);
+#ifndef WIN32
+    } else {
+        struct stat sb;
+
+        if (stat(host_str, &sb) == -1) {
+            error_setg_errno(errp, errno, "can't stat socket path");
+            return -1;
+        }
+
+        if ((sb.st_mode & S_IFMT) != S_IFSOCK) {
+            error_setg_errno(errp, errno, "path provided is not a socket");
+            return -1;
+        }
+
+        saddr_un->sun_family = PF_UNIX;
+        strncpy(saddr_un->sun_path, host_str, sizeof(saddr_un->sun_path));
+
+        pf = PF_UNIX;
+        saddr_size = sizeof(*saddr_un);
     }
+#endif /* !WIN32 */
 
-    fd = qemu_socket(PF_INET, SOCK_STREAM, 0);
+    fd = qemu_socket(pf, SOCK_STREAM, 0);
     if (fd < 0) {
         error_setg_errno(errp, errno, "can't create stream socket");
         return -1;
     }
     qemu_set_nonblock(fd);
 
-    socket_set_fast_reuse(fd);
+    if (pf == PF_INET)
+        socket_set_fast_reuse(fd);
 
-    ret = bind(fd, (struct sockaddr *)&saddr, sizeof(saddr));
+    ret = bind(fd, (struct sockaddr *)&saddr, saddr_size);
     if (ret < 0) {
-        error_setg_errno(errp, errno, "can't bind ip=%s to socket",
-                         inet_ntoa(saddr.sin_addr));
+        if (pf == PF_INET)
+            error_setg_errno(errp, errno, "can't bind ip=%s to socket",
+                             inet_ntoa(saddr_in->sin_addr));
+        else if (pf == PF_UNIX)
+            error_setg_errno(errp, errno, "can't create socket with path: %s",
+                             host_str);
         closesocket(fd);
         return -1;
     }
@@ -559,14 +593,44 @@ static int net_socket_connect_init(NetClientState *peer,
                                    Error **errp)
 {
     NetSocketState *s;
-    int fd, connected, ret;
-    struct sockaddr_in saddr;
+    int fd, connected, ret, pf;
+    struct sockaddr_storage saddr;
+    size_t saddr_size;
+    struct sockaddr_in *saddr_in = (struct sockaddr_in *)&saddr;
+#ifndef WIN32
+    struct sockaddr_un *saddr_un = (struct sockaddr_un *)&saddr;
 
-    if (parse_host_port(&saddr, host_str, errp) < 0) {
-        return -1;
+
+    if (strchr(host_str, ':')) {
+#endif
+        if (parse_host_port(saddr_in, host_str, errp) < 0)
+            return -1;
+
+        pf = PF_INET;
+        saddr_size = sizeof(*saddr_in);
+#ifndef WIN32
+    } else {
+        struct stat sb;
+
+        if (stat(host_str, &sb) == -1) {
+            error_setg_errno(errp, errno, "can't stat socket path");
+            return -1;
+        }
+
+        if ((sb.st_mode & S_IFMT) != S_IFSOCK) {
+            error_setg_errno(errp, errno, "provided path is not a socket");
+            return -1;
+        }
+
+        saddr_un->sun_family = PF_UNIX;
+        strncpy(saddr_un->sun_path, host_str, sizeof(saddr_un->sun_path));
+
+        pf = PF_UNIX;
+        saddr_size = sizeof(*saddr_un);
     }
+#endif /* !WIN32 */
 
-    fd = qemu_socket(PF_INET, SOCK_STREAM, 0);
+    fd = qemu_socket(pf, SOCK_STREAM, 0);
     if (fd < 0) {
         error_setg_errno(errp, errno, "can't create stream socket");
         return -1;
@@ -575,7 +639,7 @@ static int net_socket_connect_init(NetClientState *peer,
 
     connected = 0;
     for(;;) {
-        ret = connect(fd, (struct sockaddr *)&saddr, sizeof(saddr));
+        ret = connect(fd, (struct sockaddr *)&saddr, saddr_size);
         if (ret < 0) {
             if (errno == EINTR || errno == EWOULDBLOCK) {
                 /* continue */
@@ -598,9 +662,15 @@ static int net_socket_connect_init(NetClientState *peer,
         return -1;
     }
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "socket: connect to %s:%d",
-             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+    if (pf == PF_INET) {
+        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
+                 "socket: connect to %s:%d",
+                 inet_ntoa(saddr_in->sin_addr), ntohs(saddr_in->sin_port));
+    } else if (pf == PF_UNIX) {
+        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
+                 "socket: connect to %s", saddr_un->sun_path);
+    }
+
     return 0;
 }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index fd21002bd61d..625a31dcdbc8 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2847,13 +2847,13 @@ SRST
         #connect a TAP device to bridge qemubr0
         |qemu_system| linux.img -netdev bridge,br=qemubr0,id=n1 -device virtio-net,netdev=n1
 
-``-netdev socket,id=id[,fd=h][,listen=[host]:port][,connect=host:port]``
+``-netdev socket,id=id[,fd=h][,listen=[host]:port|path][,connect=host:port|path]``
     This host network backend can be used to connect the guest's network
-    to another QEMU virtual machine using a TCP socket connection. If
-    ``listen`` is specified, QEMU waits for incoming connections on port
-    (host is optional). ``connect`` is used to connect to another QEMU
-    instance using the ``listen`` option. ``fd``\ =h specifies an
-    already opened TCP socket.
+    to another QEMU virtual machine using a TCP or a UNIX domain socket
+    connection. If ``listen`` is specified, QEMU waits for incoming
+    connections on port (host is optional), or on path. ``connect`` is used
+    to connect to another QEMU instance using the ``listen`` option.
+    ``fd``\ =h specifies an already opened TCP or UNIX domain socket.
 
     Example:
 
-- 
2.29.2


