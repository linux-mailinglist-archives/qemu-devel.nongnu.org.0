Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2EA1B101
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 09:13:41 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ59Y-0006MQ-Rj
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 03:13:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hQ54G-0002Mr-JU
	for qemu-devel@nongnu.org; Mon, 13 May 2019 03:08:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hQ4pt-0002Is-3Y
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:53:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51762)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hQ4ps-0002Hr-82
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:53:21 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 11144C0528CB
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 06:53:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BF0217AE4;
	Mon, 13 May 2019 06:53:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 43C82A1E8; Mon, 13 May 2019 08:53:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 08:53:05 +0200
Message-Id: <20190513065310.10263-3-kraxel@redhat.com>
In-Reply-To: <20190513065310.10263-1-kraxel@redhat.com>
References: <20190513065310.10263-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 13 May 2019 06:53:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 2/7] libvhost-user: add PROTOCOL_F_CONFIG if
 {set, get}_config
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
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Add the config protocol feature bit if the set_config & get_config
callbacks are implemented.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Message-id: 20190503130034.24916-3-marcandre.lureau@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 contrib/libvhost-user/libvhost-user.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-use=
r/libvhost-user.c
index dcf4a969f238..74d42177c5c8 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -1157,6 +1157,10 @@ vu_get_protocol_features_exec(VuDev *dev, VhostUse=
rMsg *vmsg)
         features |=3D 1ULL << VHOST_USER_PROTOCOL_F_PAGEFAULT;
     }
=20
+    if (dev->iface->get_config && dev->iface->set_config) {
+        features |=3D 1ULL << VHOST_USER_PROTOCOL_F_CONFIG;
+    }
+
     if (dev->iface->get_protocol_features) {
         features |=3D dev->iface->get_protocol_features(dev);
     }
--=20
2.18.1


