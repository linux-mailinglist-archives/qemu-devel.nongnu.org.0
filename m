Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC1941801E
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 08:49:59 +0200 (CEST)
Received: from localhost ([::1]:51020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU1VW-000757-Mm
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 02:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mU18C-0007jv-9D
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 02:25:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mU183-0007ME-64
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 02:25:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632551140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7cdoSv6tGTyXCNJ6AeziPVZDaTBw1HZcjMAUwlF9bY=;
 b=KZb5A1WHOt26ZpJ9FJ1mVxvcweEvsfptFkBWjbs9NG0qhXwjhO0vUMO84NMwQmkGzBgHmL
 HyhOcxI8QR9vzgswMN1WRJlJ/2GxWRygZyQf/wyD2cBWG9VUBSElJQZCB8S2HYHG63imcx
 OhypubypilBsxOiwbw6nFvy4oCU9rgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-h6994Q4pOjCkBl1VOzxQog-1; Sat, 25 Sep 2021 02:25:37 -0400
X-MC-Unique: h6994Q4pOjCkBl1VOzxQog-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D1DC1084687;
 Sat, 25 Sep 2021 06:25:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DECFE6A904;
 Sat, 25 Sep 2021 06:25:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 33E5E11384A9; Sat, 25 Sep 2021 08:25:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/25] qapi: Convert simple union SocketAddressLegacy to flat
 one
Date: Sat, 25 Sep 2021 08:25:08 +0200
Message-Id: <20210925062525.988405-9-armbru@redhat.com>
In-Reply-To: <20210925062525.988405-1-armbru@redhat.com>
References: <20210925062525.988405-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.473, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simple unions predate flat unions.  Having both complicates the QAPI
schema language and the QAPI generator.  We haven't been using simple
unions in new code for a long time, because they are less flexible and
somewhat awkward on the wire.

To prepare for their removal, convert simple union SocketAddressLegacy
to an equivalent flat one, with existing enum SocketAddressType
replacing implicit enum type SocketAddressLegacyKind.  Adds some
boilerplate to the schema, which is a bit ugly, but a lot easier to
maintain than the simple union feature.

Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210917143134.412106-9-armbru@redhat.com>
---
 qapi/sockets.json      | 46 +++++++++++++++++++++++++++++++++++-------
 chardev/char-socket.c  |  6 +++---
 chardev/char-udp.c     |  4 ++--
 tests/unit/test-yank.c |  6 +++---
 util/qemu-sockets.c    |  8 ++++----
 5 files changed, 51 insertions(+), 19 deletions(-)

diff --git a/qapi/sockets.json b/qapi/sockets.json
index 7866dc27d6..ef4b16d6f2 100644
--- a/qapi/sockets.json
+++ b/qapi/sockets.json
@@ -110,6 +110,38 @@
     'cid': 'str',
     'port': 'str' } }
 
+##
+# @InetSocketAddressWrapper:
+#
+# Since: 1.3
+##
+{ 'struct': 'InetSocketAddressWrapper',
+  'data': { 'data': 'InetSocketAddress' } }
+
+##
+# @UnixSocketAddressWrapper:
+#
+# Since: 1.3
+##
+{ 'struct': 'UnixSocketAddressWrapper',
+  'data': { 'data': 'UnixSocketAddress' } }
+
+##
+# @VsockSocketAddressWrapper:
+#
+# Since: 2.8
+##
+{ 'struct': 'VsockSocketAddressWrapper',
+  'data': { 'data': 'VsockSocketAddress' } }
+
+##
+# @StringWrapper:
+#
+# Since: 1.3
+##
+{ 'struct': 'StringWrapper',
+  'data': { 'data': 'String' } }
+
 ##
 # @SocketAddressLegacy:
 #
@@ -117,18 +149,18 @@
 #
 # Note: This type is deprecated in favor of SocketAddress.  The
 #       difference between SocketAddressLegacy and SocketAddress is that the
-#       latter is a flat union rather than a simple union. Flat is nicer
-#       because it avoids nesting on the wire, i.e. that form has fewer {}.
-
+#       latter is has fewer {} on the wire.
 #
 # Since: 1.3
 ##
 { 'union': 'SocketAddressLegacy',
+  'base': { 'type': 'SocketAddressType' },
+  'discriminator': 'type',
   'data': {
-    'inet': 'InetSocketAddress',
-    'unix': 'UnixSocketAddress',
-    'vsock': 'VsockSocketAddress',
-    'fd': 'String' } }
+    'inet': 'InetSocketAddressWrapper',
+    'unix': 'UnixSocketAddressWrapper',
+    'vsock': 'VsockSocketAddressWrapper',
+    'fd': 'StringWrapper' } }
 
 ##
 # @SocketAddressType:
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index c43668cc15..836cfa0bc2 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1520,7 +1520,7 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
     addr = g_new0(SocketAddressLegacy, 1);
     if (path) {
         UnixSocketAddress *q_unix;
-        addr->type = SOCKET_ADDRESS_LEGACY_KIND_UNIX;
+        addr->type = SOCKET_ADDRESS_TYPE_UNIX;
         q_unix = addr->u.q_unix.data = g_new0(UnixSocketAddress, 1);
         q_unix->path = g_strdup(path);
 #ifdef CONFIG_LINUX
@@ -1530,7 +1530,7 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
         q_unix->abstract = abstract;
 #endif
     } else if (host) {
-        addr->type = SOCKET_ADDRESS_LEGACY_KIND_INET;
+        addr->type = SOCKET_ADDRESS_TYPE_INET;
         addr->u.inet.data = g_new(InetSocketAddress, 1);
         *addr->u.inet.data = (InetSocketAddress) {
             .host = g_strdup(host),
@@ -1543,7 +1543,7 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
             .ipv6 = qemu_opt_get_bool(opts, "ipv6", 0),
         };
     } else if (fd) {
-        addr->type = SOCKET_ADDRESS_LEGACY_KIND_FD;
+        addr->type = SOCKET_ADDRESS_TYPE_FD;
         addr->u.fd.data = g_new(String, 1);
         addr->u.fd.data->str = g_strdup(fd);
     } else {
diff --git a/chardev/char-udp.c b/chardev/char-udp.c
index 16b5dbce58..6756e69924 100644
--- a/chardev/char-udp.c
+++ b/chardev/char-udp.c
@@ -165,7 +165,7 @@ static void qemu_chr_parse_udp(QemuOpts *opts, ChardevBackend *backend,
     qemu_chr_parse_common(opts, qapi_ChardevUdp_base(udp));
 
     addr = g_new0(SocketAddressLegacy, 1);
-    addr->type = SOCKET_ADDRESS_LEGACY_KIND_INET;
+    addr->type = SOCKET_ADDRESS_TYPE_INET;
     addr->u.inet.data = g_new(InetSocketAddress, 1);
     *addr->u.inet.data = (InetSocketAddress) {
         .host = g_strdup(host),
@@ -180,7 +180,7 @@ static void qemu_chr_parse_udp(QemuOpts *opts, ChardevBackend *backend,
     if (has_local) {
         udp->has_local = true;
         addr = g_new0(SocketAddressLegacy, 1);
-        addr->type = SOCKET_ADDRESS_LEGACY_KIND_INET;
+        addr->type = SOCKET_ADDRESS_TYPE_INET;
         addr->u.inet.data = g_new(InetSocketAddress, 1);
         *addr->u.inet.data = (InetSocketAddress) {
             .host = g_strdup(localaddr),
diff --git a/tests/unit/test-yank.c b/tests/unit/test-yank.c
index 2383d2908c..e6c036a64d 100644
--- a/tests/unit/test-yank.c
+++ b/tests/unit/test-yank.c
@@ -88,7 +88,7 @@ static void char_change_test(gconstpointer opaque)
             .type = CHARDEV_BACKEND_KIND_SOCKET,
             .u.socket.data = &(ChardevSocket) {
                 .addr = &(SocketAddressLegacy) {
-                    .type = SOCKET_ADDRESS_LEGACY_KIND_INET,
+                    .type = SOCKET_ADDRESS_TYPE_INET,
                     .u.inet.data = &addr->u.inet
                 },
                 .has_server = true,
@@ -102,7 +102,7 @@ static void char_change_test(gconstpointer opaque)
             .type = CHARDEV_BACKEND_KIND_UDP,
             .u.udp.data = &(ChardevUdp) {
                 .remote = &(SocketAddressLegacy) {
-                    .type = SOCKET_ADDRESS_LEGACY_KIND_UNIX,
+                    .type = SOCKET_ADDRESS_TYPE_UNIX,
                     .u.q_unix.data = &(UnixSocketAddress) {
                         .path = (char *)""
                     }
@@ -114,7 +114,7 @@ static void char_change_test(gconstpointer opaque)
             .type = CHARDEV_BACKEND_KIND_SOCKET,
             .u.socket.data = &(ChardevSocket) {
                 .addr = &(SocketAddressLegacy) {
-                    .type = SOCKET_ADDRESS_LEGACY_KIND_INET,
+                    .type = SOCKET_ADDRESS_TYPE_INET,
                     .u.inet.data = &(InetSocketAddress) {
                         .host = (char *)"127.0.0.1",
                         .port = (char *)"0"
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index c5043999e9..72216ef980 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1455,22 +1455,22 @@ SocketAddress *socket_address_flatten(SocketAddressLegacy *addr_legacy)
     addr = g_new(SocketAddress, 1);
 
     switch (addr_legacy->type) {
-    case SOCKET_ADDRESS_LEGACY_KIND_INET:
+    case SOCKET_ADDRESS_TYPE_INET:
         addr->type = SOCKET_ADDRESS_TYPE_INET;
         QAPI_CLONE_MEMBERS(InetSocketAddress, &addr->u.inet,
                            addr_legacy->u.inet.data);
         break;
-    case SOCKET_ADDRESS_LEGACY_KIND_UNIX:
+    case SOCKET_ADDRESS_TYPE_UNIX:
         addr->type = SOCKET_ADDRESS_TYPE_UNIX;
         QAPI_CLONE_MEMBERS(UnixSocketAddress, &addr->u.q_unix,
                            addr_legacy->u.q_unix.data);
         break;
-    case SOCKET_ADDRESS_LEGACY_KIND_VSOCK:
+    case SOCKET_ADDRESS_TYPE_VSOCK:
         addr->type = SOCKET_ADDRESS_TYPE_VSOCK;
         QAPI_CLONE_MEMBERS(VsockSocketAddress, &addr->u.vsock,
                            addr_legacy->u.vsock.data);
         break;
-    case SOCKET_ADDRESS_LEGACY_KIND_FD:
+    case SOCKET_ADDRESS_TYPE_FD:
         addr->type = SOCKET_ADDRESS_TYPE_FD;
         QAPI_CLONE_MEMBERS(String, &addr->u.fd, addr_legacy->u.fd.data);
         break;
-- 
2.31.1


