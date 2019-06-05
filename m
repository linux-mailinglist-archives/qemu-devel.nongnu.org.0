Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCBF35FD6
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 17:04:42 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYXSz-0003uA-J2
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 11:04:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hYXNW-0000U1-Vc
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:59:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hYXNW-0002Wl-4W
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:59:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34646)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1hYXNV-0002WJ-Vq
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:59:02 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59068300513A
	for <qemu-devel@nongnu.org>; Wed,  5 Jun 2019 14:59:01 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56A421018A2C;
	Wed,  5 Jun 2019 14:58:54 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 16:58:28 +0200
Message-Id: <20190605145829.7674-5-marcandre.lureau@redhat.com>
In-Reply-To: <20190605145829.7674-1-marcandre.lureau@redhat.com>
References: <20190605145829.7674-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 05 Jun 2019 14:59:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 4/5] vhost-user-input: check ioctl(EVIOCGNAME)
 return value
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

This should fix coverity CID 1401704.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 contrib/vhost-user-input/main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/m=
ain.c
index 54f882602a..8b4e7d2536 100644
--- a/contrib/vhost-user-input/main.c
+++ b/contrib/vhost-user-input/main.c
@@ -342,7 +342,11 @@ main(int argc, char *argv[])
=20
     vi.config =3D g_array_new(false, false, sizeof(virtio_input_config))=
;
     memset(&id, 0, sizeof(id));
-    ioctl(vi.evdevfd, EVIOCGNAME(sizeof(id.u.string) - 1), id.u.string);
+    if (ioctl(vi.evdevfd, EVIOCGNAME(sizeof(id.u.string) - 1),
+              id.u.string) < 0) {
+        g_printerr("Failed to get evdev name: %s\n", g_strerror(errno));
+        exit(EXIT_FAILURE);
+    }
     id.select =3D VIRTIO_INPUT_CFG_ID_NAME;
     id.size =3D strlen(id.u.string);
     g_array_append_val(vi.config, id);
--=20
2.22.0.rc2.384.g1a9a72ea1d


