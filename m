Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AA02917C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 09:06:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50123 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU4Hf-0007RZ-Ic
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 03:06:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hU4Cp-00044g-0b
	for qemu-devel@nongnu.org; Fri, 24 May 2019 03:01:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hU4Cn-0005Gb-9c
	for qemu-devel@nongnu.org; Fri, 24 May 2019 03:01:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52918)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hU4Cm-0005Fp-AG
	for qemu-devel@nongnu.org; Fri, 24 May 2019 03:01:29 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02429D7809
	for <qemu-devel@nongnu.org>; Fri, 24 May 2019 07:01:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-101.ams2.redhat.com
	[10.36.116.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D571919C4F;
	Fri, 24 May 2019 07:01:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 92AF317536; Fri, 24 May 2019 09:01:18 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 May 2019 09:01:15 +0200
Message-Id: <20190524070118.30157-2-kraxel@redhat.com>
In-Reply-To: <20190524070118.30157-1-kraxel@redhat.com>
References: <20190524070118.30157-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 24 May 2019 07:01:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 1/4] console: add dmabuf modifier field.
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dmabufs can have a format modifier (DRM_FORMAT_MOD_*) which is used for
tiled layouts for example.  Add a field to QemuDmaBuf so we can carry
around that information.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index fef900db76a5..f9816968487c 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -175,6 +175,7 @@ typedef struct QemuDmaBuf {
     uint32_t  height;
     uint32_t  stride;
     uint32_t  fourcc;
+    uint64_t  modifier;
     uint32_t  texture;
     bool      y0_top;
 } QemuDmaBuf;
--=20
2.18.1


