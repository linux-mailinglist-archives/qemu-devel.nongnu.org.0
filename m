Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A98A12EC7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 15:07:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40572 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMXua-0002Jo-8l
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 09:07:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hMXoL-0005UA-Vi
	for qemu-devel@nongnu.org; Fri, 03 May 2019 09:01:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hMXoK-0000Jl-KF
	for qemu-devel@nongnu.org; Fri, 03 May 2019 09:01:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33419)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1hMXoI-0000Il-9r
	for qemu-devel@nongnu.org; Fri, 03 May 2019 09:01:06 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A11EB3016F10
	for <qemu-devel@nongnu.org>; Fri,  3 May 2019 13:01:05 +0000 (UTC)
Received: from localhost (ovpn-112-51.ams2.redhat.com [10.36.112.51])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2185D5D962;
	Fri,  3 May 2019 13:01:01 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  3 May 2019 15:00:33 +0200
Message-Id: <20190503130034.24916-6-marcandre.lureau@redhat.com>
In-Reply-To: <20190503130034.24916-1-marcandre.lureau@redhat.com>
References: <20190503130034.24916-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 03 May 2019 13:01:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 5/6] util: simplify unix_listen()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kraxel@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only caller of unix_listen() left is qga/channel-posix.c.

There is no need to deal with legacy coma-trailing options ",...".

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 util/qemu-sockets.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 9705051690..d1664e83d6 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -966,26 +966,12 @@ static int unix_connect_saddr(UnixSocketAddress *sa=
ddr, Error **errp)
 /* compatibility wrapper */
 int unix_listen(const char *str, Error **errp)
 {
-    char *path, *optstr;
-    int sock, len;
     UnixSocketAddress *saddr;
+    int sock;
=20
     saddr =3D g_new0(UnixSocketAddress, 1);
-
-    optstr =3D strchr(str, ',');
-    if (optstr) {
-        len =3D optstr - str;
-        if (len) {
-            path =3D g_malloc(len+1);
-            snprintf(path, len+1, "%.*s", len, str);
-            saddr->path =3D path;
-        }
-    } else {
-        saddr->path =3D g_strdup(str);
-    }
-
+    saddr->path =3D g_strdup(str);
     sock =3D unix_listen_saddr(saddr, errp);
-
     qapi_free_UnixSocketAddress(saddr);
     return sock;
 }
--=20
2.21.0.777.g83232e3864


