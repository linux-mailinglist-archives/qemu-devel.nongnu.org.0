Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C141BDB24
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 13:54:09 +0200 (CEST)
Received: from localhost ([::1]:45874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTlI0-0007YV-4E
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 07:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50882)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jTlGj-0005sU-5F
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 07:52:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jTlGi-0001zF-0A
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 07:52:48 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43834
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jTlGh-0001yd-Fe
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 07:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588161166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lDXYPiQCE75Oc34pPrtAqolaDeqROJMdOx2Dqa0OP4M=;
 b=IECl3l+yYEswS7EeHJBj3T1LVL5Pm+VdKTBvfsOVKa6v9aaA/PrFNdrMF6nAvDbc6rZX93
 aFUNqZ2vhcyNbBL/rXzVXu2e2u/DkgHMo8jHiUL2wU3mg+o60KAvqvZI6qiOGvQfYxZdUA
 3wszY4NrsIkvXRuqOBJFKctBVahmpdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-wwAqqk_tPU6NeR9BfSapkw-1; Wed, 29 Apr 2020 07:52:44 -0400
X-MC-Unique: wwAqqk_tPU6NeR9BfSapkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1D21108BD0A;
 Wed, 29 Apr 2020 11:52:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C59C160BF4;
 Wed, 29 Apr 2020 11:52:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 07FF89D9B; Wed, 29 Apr 2020 13:52:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] Revert "hw/display/ramfb: lock guest resolution after
 it's set"
Date: Wed, 29 Apr 2020 13:52:32 +0200
Message-Id: <20200429115236.28709-3-kraxel@redhat.com>
In-Reply-To: <20200429115236.28709-1-kraxel@redhat.com>
References: <20200429115236.28709-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 00:53:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
 Gerd Hoffmann <kraxel@redhat.com>, hqm03ster@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit a9e0cb67b7f4c485755659f9b764c38b5f970de4.

This breaks OVMF.  Reproducer: Just hit 'ESC' at early boot to enter
firmware setup.  OVMF wants switch from (default) 800x600 to 640x480 for
that, and this patch blocks it.

Cc: Hou Qiming <hqm03ster@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
---
 hw/display/ramfb.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/hw/display/ramfb.c b/hw/display/ramfb.c
index bd4746dc1768..9d41c2ad2868 100644
--- a/hw/display/ramfb.c
+++ b/hw/display/ramfb.c
@@ -31,7 +31,6 @@ struct RAMFBState {
     DisplaySurface *ds;
     uint32_t width, height;
     struct RAMFBCfg cfg;
-    bool locked;
 };
=20
 static void ramfb_unmap_display_surface(pixman_image_t *image, void *unuse=
d)
@@ -72,25 +71,18 @@ static DisplaySurface *ramfb_create_display_surface(int=
 width, int height,
 static void ramfb_fw_cfg_write(void *dev, off_t offset, size_t len)
 {
     RAMFBState *s =3D dev;
-    uint32_t fourcc, format, width, height;
+    uint32_t fourcc, format;
     hwaddr stride, addr;
=20
-    width     =3D be32_to_cpu(s->cfg.width);
-    height    =3D be32_to_cpu(s->cfg.height);
+    s->width  =3D be32_to_cpu(s->cfg.width);
+    s->height =3D be32_to_cpu(s->cfg.height);
     stride    =3D be32_to_cpu(s->cfg.stride);
     fourcc    =3D be32_to_cpu(s->cfg.fourcc);
     addr      =3D be64_to_cpu(s->cfg.addr);
     format    =3D qemu_drm_format_to_pixman(fourcc);
=20
     fprintf(stderr, "%s: %dx%d @ 0x%" PRIx64 "\n", __func__,
-            width, height, addr);
-    if (s->locked) {
-        fprintf(stderr, "%s: resolution locked, change rejected\n", __func=
__);
-        return;
-    }
-    s->locked =3D true;
-    s->width =3D width;
-    s->height =3D height;
+            s->width, s->height, addr);
     s->ds =3D ramfb_create_display_surface(s->width, s->height,
                                          format, stride, addr);
 }
@@ -110,13 +102,6 @@ void ramfb_display_update(QemuConsole *con, RAMFBState=
 *s)
     dpy_gfx_update_full(con);
 }
=20
-static void ramfb_reset(void *opaque)
-{
-    RAMFBState *s =3D (RAMFBState *)opaque;
-    s->locked =3D false;
-    memset(&s->cfg, 0, sizeof(s->cfg));
-}
-
 RAMFBState *ramfb_setup(Error **errp)
 {
     FWCfgState *fw_cfg =3D fw_cfg_find();
@@ -129,12 +114,9 @@ RAMFBState *ramfb_setup(Error **errp)
=20
     s =3D g_new0(RAMFBState, 1);
=20
-    s->locked =3D false;
-
     rom_add_vga("vgabios-ramfb.bin");
     fw_cfg_add_file_callback(fw_cfg, "etc/ramfb",
                              NULL, ramfb_fw_cfg_write, s,
                              &s->cfg, sizeof(s->cfg), false);
-    qemu_register_reset(ramfb_reset, s);
     return s;
 }
--=20
2.18.2


