Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3489957F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 15:52:15 +0200 (CEST)
Received: from localhost ([::1]:43308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0nVe-0000fU-H5
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 09:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45079)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1i0nRo-0006dl-RE
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 09:48:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1i0nRn-0006JR-0r
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 09:48:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35040)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1i0nRm-0006HO-Pd
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 09:48:14 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E93C211768A5;
 Thu, 22 Aug 2019 13:48:10 +0000 (UTC)
Received: from localhost (ovpn-116-85.phx2.redhat.com [10.3.116.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0A85600CD;
 Thu, 22 Aug 2019 13:48:07 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 17:47:23 +0400
Message-Id: <20190822134725.32479-5-marcandre.lureau@redhat.com>
In-Reply-To: <20190822134725.32479-1-marcandre.lureau@redhat.com>
References: <20190822134725.32479-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Thu, 22 Aug 2019 13:48:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 4/6] tests: specify the address family when
 checking bind
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

getaddrinfo() may succeed with PF_UNSPEC, but fail when more specific.

(this allows to skip some tests that would fail under podman)

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tests/socket-helpers.c | 17 +++++++++++++----
 tests/socket-helpers.h | 11 -----------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/tests/socket-helpers.c b/tests/socket-helpers.c
index 8112763f5b..19a51e887e 100644
--- a/tests/socket-helpers.c
+++ b/tests/socket-helpers.c
@@ -30,7 +30,16 @@
 # define EAI_ADDRFAMILY 0
 #endif
=20
-int socket_can_bind_connect(const char *hostname)
+/*
+ * @hostname: a DNS name or numeric IP address
+ *
+ * Check whether it is possible to bind & connect to ports
+ * on the DNS name or IP address @hostname. If an IP address
+ * is used, it must not be a wildcard address.
+ *
+ * Returns 0 on success, -1 on error with errno set
+ */
+static int socket_can_bind_connect(const char *hostname, int family)
 {
     int lfd =3D -1, cfd =3D -1, afd =3D -1;
     struct addrinfo ai, *res =3D NULL;
@@ -44,7 +53,7 @@ int socket_can_bind_connect(const char *hostname)
=20
     memset(&ai, 0, sizeof(ai));
     ai.ai_flags =3D AI_CANONNAME | AI_ADDRCONFIG;
-    ai.ai_family =3D AF_UNSPEC;
+    ai.ai_family =3D family;
     ai.ai_socktype =3D SOCK_STREAM;
=20
     /* lookup */
@@ -129,7 +138,7 @@ int socket_check_protocol_support(bool *has_ipv4, boo=
l *has_ipv6)
 {
     *has_ipv4 =3D *has_ipv6 =3D false;
=20
-    if (socket_can_bind_connect("127.0.0.1") < 0) {
+    if (socket_can_bind_connect("127.0.0.1", PF_INET) < 0) {
         if (errno !=3D EADDRNOTAVAIL) {
             return -1;
         }
@@ -137,7 +146,7 @@ int socket_check_protocol_support(bool *has_ipv4, boo=
l *has_ipv6)
         *has_ipv4 =3D true;
     }
=20
-    if (socket_can_bind_connect("::1") < 0) {
+    if (socket_can_bind_connect("::1", PF_INET6) < 0) {
         if (errno !=3D EADDRNOTAVAIL) {
             return -1;
         }
diff --git a/tests/socket-helpers.h b/tests/socket-helpers.h
index 9de0e6b151..512a004811 100644
--- a/tests/socket-helpers.h
+++ b/tests/socket-helpers.h
@@ -20,17 +20,6 @@
 #ifndef TESTS_SOCKET_HELPERS_H
 #define TESTS_SOCKET_HELPERS_H
=20
-/*
- * @hostname: a DNS name or numeric IP address
- *
- * Check whether it is possible to bind & connect to ports
- * on the DNS name or IP address @hostname. If an IP address
- * is used, it must not be a wildcard address.
- *
- * Returns 0 on success, -1 on error with errno set
- */
-int socket_can_bind_connect(const char *hostname);
-
 /*
  * @has_ipv4: set to true on return if IPv4 is available
  * @has_ipv6: set to true on return if IPv6 is available
--=20
2.23.0


