Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3DD1329FE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 16:25:47 +0100 (CET)
Received: from localhost ([::1]:51404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioqjq-0007gy-6e
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 10:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56285)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqTF-0005GA-3o
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:08:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqTE-0004wZ-1h
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:08:36 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23905
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ioqTD-0004wJ-UI
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:08:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578409715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oKTV1GWDNyd1B33P8RLG1jvM7IO9biN04q66oucReX4=;
 b=d5+ROMOeLckWnQY16FNyKNiDM5EyUuATGgAxvvYGR/YVKiIkitOucK90SQkHCtZWXYzzVo
 iHwXEGGVr8z6icLjlGzncYti5tMUf3RozGzhOzNMXFZLvOwiqWWfyPlrw6ddyYQ1vqXh4X
 qPIjizmNA7VMXP2NsUQHty+T8HQ8elA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-d795MoZcN_aP-P8cqudPdQ-1; Tue, 07 Jan 2020 10:08:34 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 410F11005502;
 Tue,  7 Jan 2020 15:08:33 +0000 (UTC)
Received: from localhost (ovpn-112-42.ams2.redhat.com [10.36.112.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E25E07C82C;
 Tue,  7 Jan 2020 15:08:26 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/37] mips: use sysbus_add_io()
Date: Tue,  7 Jan 2020 19:04:24 +0400
Message-Id: <20200107150442.1727958-20-marcandre.lureau@redhat.com>
In-Reply-To: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
References: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: d795MoZcN_aP-P8cqudPdQ-1
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
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
2.25.0.rc1.20.g2443f3f80d


