Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7609835FD2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 17:03:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYXRY-0002uV-Jz
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 11:03:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hYXNI-0000Ip-1b
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:58:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hYXNG-0002Hl-28
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:58:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44214)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1hYXNF-0002El-TH
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:58:46 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 38264308C383
	for <qemu-devel@nongnu.org>; Wed,  5 Jun 2019 14:58:43 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B6EA5B697;
	Wed,  5 Jun 2019 14:58:42 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 16:58:26 +0200
Message-Id: <20190605145829.7674-3-marcandre.lureau@redhat.com>
In-Reply-To: <20190605145829.7674-1-marcandre.lureau@redhat.com>
References: <20190605145829.7674-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 05 Jun 2019 14:58:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/5] vhost-user: check unix_listen() return
 value
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This check shouldn't be necessary, since &error_fatal is given as
argument and will exit() on failure. However, this change should
silence coverity CID 1401761 & 1401705.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 contrib/vhost-user-gpu/main.c   | 4 ++++
 contrib/vhost-user-input/main.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/contrib/vhost-user-gpu/main.c b/contrib/vhost-user-gpu/main.=
c
index 9614c9422c..e0b6df5b4d 100644
--- a/contrib/vhost-user-gpu/main.c
+++ b/contrib/vhost-user-gpu/main.c
@@ -1160,6 +1160,10 @@ main(int argc, char *argv[])
=20
     if (opt_socket_path) {
         int lsock =3D unix_listen(opt_socket_path, &error_fatal);
+        if (lsock < 0) {
+            g_printerr("Failed to listen on %s.\n", opt_socket_path);
+            exit(EXIT_FAILURE);
+        }
         fd =3D accept(lsock, NULL, NULL);
         close(lsock);
     } else {
diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/m=
ain.c
index 8d493f598e..8b854117f5 100644
--- a/contrib/vhost-user-input/main.c
+++ b/contrib/vhost-user-input/main.c
@@ -367,6 +367,10 @@ main(int argc, char *argv[])
=20
     if (opt_socket_path) {
         int lsock =3D unix_listen(opt_socket_path, &error_fatal);
+        if (lsock < 0) {
+            g_printerr("Failed to listen on %s.\n", opt_socket_path);
+            exit(EXIT_FAILURE);
+        }
         fd =3D accept(lsock, NULL, NULL);
         close(lsock);
     } else {
--=20
2.22.0.rc2.384.g1a9a72ea1d


