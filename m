Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E137E1B3C1D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 12:04:05 +0200 (CEST)
Received: from localhost ([::1]:47092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRCEe-0003pn-Dm
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 06:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40874)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jRCD3-0002OC-Nn
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 06:02:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jRCD2-0004Qf-RI
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 06:02:25 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25689
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jRCD2-0004HE-Bz
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 06:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587549742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j+sx8e7RqLsFNXEP5CtlRYH6haipWbEa+wPrC7e/3pA=;
 b=JG34LizkRkd5/bd+hnhnahRdk1eXFSUeYiJ5ZfIE2xJnJ5/vUKrM5m5RCIAQn5SKNLB047
 6gI83Tv2lDeL5oUVhqpovaOJ6rq6kjOoHkMLeEEr4fDPxk2ncwToIOPaXoKyCVUVvnhsc4
 VVkIOCCEw2JNuzLEzxKJKLuxysQXLDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-sAjro906PlClybH0ge5fEQ-1; Wed, 22 Apr 2020 06:02:19 -0400
X-MC-Unique: sAjro906PlClybH0ge5fEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C760318C35A0;
 Wed, 22 Apr 2020 10:02:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D44E95DA85;
 Wed, 22 Apr 2020 10:02:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E085F9D9C; Wed, 22 Apr 2020 12:02:11 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] ramfb: don't update RAMFBState on errors
Date: Wed, 22 Apr 2020 12:02:09 +0200
Message-Id: <20200422100211.30614-4-kraxel@redhat.com>
In-Reply-To: <20200422100211.30614-1-kraxel@redhat.com>
References: <20200422100211.30614-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:12:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, lersek@redhat.com,
 hqm03ster@gmail.com, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Store width & height & surface in local variables.  Update RAMFBState
with the new values only in case the ramfb_create_display_surface() call
succeeds.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/ramfb.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/hw/display/ramfb.c b/hw/display/ramfb.c
index 9d41c2ad2868..fbe959147dc9 100644
--- a/hw/display/ramfb.c
+++ b/hw/display/ramfb.c
@@ -71,20 +71,27 @@ static DisplaySurface *ramfb_create_display_surface(int=
 width, int height,
 static void ramfb_fw_cfg_write(void *dev, off_t offset, size_t len)
 {
     RAMFBState *s =3D dev;
-    uint32_t fourcc, format;
+    DisplaySurface *surface;
+    uint32_t fourcc, format, width, height;
     hwaddr stride, addr;
=20
-    s->width  =3D be32_to_cpu(s->cfg.width);
-    s->height =3D be32_to_cpu(s->cfg.height);
-    stride    =3D be32_to_cpu(s->cfg.stride);
-    fourcc    =3D be32_to_cpu(s->cfg.fourcc);
-    addr      =3D be64_to_cpu(s->cfg.addr);
-    format    =3D qemu_drm_format_to_pixman(fourcc);
+    width  =3D be32_to_cpu(s->cfg.width);
+    height =3D be32_to_cpu(s->cfg.height);
+    stride =3D be32_to_cpu(s->cfg.stride);
+    fourcc =3D be32_to_cpu(s->cfg.fourcc);
+    addr   =3D be64_to_cpu(s->cfg.addr);
+    format =3D qemu_drm_format_to_pixman(fourcc);
=20
     fprintf(stderr, "%s: %dx%d @ 0x%" PRIx64 "\n", __func__,
             s->width, s->height, addr);
-    s->ds =3D ramfb_create_display_surface(s->width, s->height,
-                                         format, stride, addr);
+    surface =3D ramfb_create_display_surface(width, height,
+                                           format, stride, addr);
+    if (!surface)
+        return;
+
+    s->width =3D width;
+    s->height =3D height;
+    s->ds =3D surface;
 }
=20
 void ramfb_display_update(QemuConsole *con, RAMFBState *s)
--=20
2.18.2


