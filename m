Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E471B461F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 15:18:56 +0200 (CEST)
Received: from localhost ([::1]:50430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRFHD-0002su-7L
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 09:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46918)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRF6C-0003rq-8s
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:07:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRF69-0003uS-P5
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:07:30 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22906
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jRF69-0003sl-A8
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:07:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587560848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ld/bBsfDpttrTV0PKzMSzSLeV9H2V1HonsYLEXv6m2Y=;
 b=O2fe2bMLKJu1z2RSPCb5BfSefSHEk0CowqHntbA5In4GqL6CX2VTQ+ykGUntvVzYLSg7bq
 5p4mzrC/L4DXoytVz6cG6E0erQTQFq0LiPzj1/mXWfhoBz+eAYTN77SS7eeKbppv9v2pNY
 hgwngT2WTWW31BFjUgX49+ARuGirhzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-tipvEGmDP0-F5p9IolmMqg-1; Wed, 22 Apr 2020 09:07:26 -0400
X-MC-Unique: tipvEGmDP0-F5p9IolmMqg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12C158017FF
 for <qemu-devel@nongnu.org>; Wed, 22 Apr 2020 13:07:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23AA8277C8;
 Wed, 22 Apr 2020 13:07:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 155CC11358C3; Wed, 22 Apr 2020 15:07:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/14] bochs-display: Fix vgamem=SIZE error handling
Date: Wed, 22 Apr 2020 15:07:12 +0200
Message-Id: <20200422130719.28225-8-armbru@redhat.com>
In-Reply-To: <20200422130719.28225-1-armbru@redhat.com>
References: <20200422130719.28225-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:57:52
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bochs_display_realize() rejects out-of-range vgamem.  The error
handling is broken:

    $ qemu-system-x86_64 -S -display none -monitor stdio
    QEMU 4.2.93 monitor - type 'help' for more information
    (qemu) device_add bochs-display,vgamem=3D1
    Error: bochs-display: video memory too small
    (qemu) device_add bochs-display,vgamem=3D1
    RAMBlock "0000:00:04.0/bochs-display-vram" already registered, abort!
    Aborted (core dumped)

Cause: bochs_display_realize() neglects to bail out after setting the
error.  Fix that.

Fixes: 765c94290863eef1fc4a67819d452cc13b7854a1
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/display/bochs-display.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index 70eb619ef4..e763a0a72d 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -267,16 +267,18 @@ static void bochs_display_realize(PCIDevice *dev, Err=
or **errp)
     Object *obj =3D OBJECT(dev);
     int ret;
=20
-    s->con =3D graphic_console_init(DEVICE(dev), 0, &bochs_display_gfx_ops=
, s);
-
     if (s->vgamem < 4 * MiB) {
         error_setg(errp, "bochs-display: video memory too small");
+        return;
     }
     if (s->vgamem > 256 * MiB) {
         error_setg(errp, "bochs-display: video memory too big");
+        return;
     }
     s->vgamem =3D pow2ceil(s->vgamem);
=20
+    s->con =3D graphic_console_init(DEVICE(dev), 0, &bochs_display_gfx_ops=
, s);
+
     memory_region_init_ram(&s->vram, obj, "bochs-display-vram", s->vgamem,
                            &error_fatal);
     memory_region_init_io(&s->vbe, obj, &bochs_display_vbe_ops, s,
--=20
2.21.1


