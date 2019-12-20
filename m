Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C427127C0D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 14:56:42 +0100 (CET)
Received: from localhost ([::1]:56272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiIll-0001Bv-31
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 08:56:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50810)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiIeo-0006bs-GL
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:49:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiIen-00064k-CP
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:49:30 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33060
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iiIen-00062K-61
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:49:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576849768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=osaqJ3M/BMMVcUs231lV6YDuyZCKmWiJvoxROLmaamI=;
 b=fSLKu3x0Xjwtt3x+sITT9PuB+o5f6hb956Tqkxj5H3InK5DLOkdBlVni1hsqiOTqnZFFxS
 kpGY7RjXdez1Iqv18tIyY2l7lbB9GwpJb/VXspGHqy4ughPlaDBBauQOzbADU8o5hIs2w5
 BWNJOLF0gMHKW+dUMD5ANBcIsIKE7UQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-gz9Y7CjWPv-l4-n5lUH_UQ-1; Fri, 20 Dec 2019 08:49:23 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63F361086708;
 Fri, 20 Dec 2019 13:49:22 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E988027061;
 Fri, 20 Dec 2019 13:49:16 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/37] mips: use sysbus_add_io()
Date: Fri, 20 Dec 2019 17:45:43 +0400
Message-Id: <20191220134601.571905-20-marcandre.lureau@redhat.com>
In-Reply-To: <20191220134601.571905-1-marcandre.lureau@redhat.com>
References: <20191220134601.571905-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: gz9Y7CjWPv-l4-n5lUH_UQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

sysbus devices should use the associated helper function instead of
calling memory_region_add_subregion() manually. This simplifies
slightly the code.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/mips/mips_mipssim.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c
index 3cd0e6eb33..2c2c7f25b2 100644
--- a/hw/mips/mips_mipssim.c
+++ b/hw/mips/mips_mipssim.c
@@ -227,8 +227,7 @@ mips_mipssim_init(MachineState *machine)
         qdev_set_legacy_instance_id(dev, 0x3f8, 2);
         qdev_init_nofail(dev);
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, env->irq[4]);
-        memory_region_add_subregion(get_system_io(), 0x3f8,
-                                    &SERIAL_IO(dev)->serial.io);
+        sysbus_add_io(SYS_BUS_DEVICE(dev), 0x3f8, &SERIAL_IO(dev)->serial.=
io);
     }
=20
     if (nd_table[0].used)
--=20
2.24.0.308.g228f53135a


