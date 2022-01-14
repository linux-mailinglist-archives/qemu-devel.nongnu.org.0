Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC1248E519
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:58:45 +0100 (CET)
Received: from localhost ([::1]:48238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8HTw-0001Kw-AI
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:58:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUw-0007fs-52
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUs-0007WX-Gj
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YnnS8YfNqbZD01HFRkFyf8c3PQoBMqVxIhmY7Z+5zaY=;
 b=Rv+UIIUv36sPJ+r/UoAVu0j98zRq3UHSY6kuEJWfI0dg2speizGRU0WqMLiovgSmrhFhTK
 xAH7JpqFWBtBBJx/rZ1BYZ2UoGBYwuCRadAV4tBuycHYZHVvxnR/jwsbCWpG/JZu4dJCL7
 rc46G5nOHbf9Zfzybjb3qd5EnYypbY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-YAawA5DCOEGLe8HOjLnWoQ-1; Fri, 14 Jan 2022 01:55:26 -0500
X-MC-Unique: YAawA5DCOEGLe8HOjLnWoQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A92F85B660;
 Fri, 14 Jan 2022 06:55:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DE1978DA8;
 Fri, 14 Jan 2022 06:55:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2A17F1800848; Fri, 14 Jan 2022 07:53:27 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/20] hw/mips/jazz: Inline vga_mmio_init() and remove it
Date: Fri, 14 Jan 2022 07:53:19 +0100
Message-Id: <20220114065326.782420-14-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

vga_mmio_init() is used only one time and not very helpful,
inline and remove it.

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211206224528.563588-5-f4bug@amsat.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/display/vga.h |  5 -----
 hw/display/vga-mmio.c    | 19 -------------------
 hw/mips/jazz.c           |  9 ++++++++-
 3 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/include/hw/display/vga.h b/include/hw/display/vga.h
index 98b2e560f9b3..a79aa2909b25 100644
--- a/include/hw/display/vga.h
+++ b/include/hw/display/vga.h
@@ -9,8 +9,6 @@
 #ifndef QEMU_HW_DISPLAY_VGA_H
 #define QEMU_HW_DISPLAY_VGA_H
 
-#include "exec/hwaddr.h"
-
 /*
  * modules can reference this symbol to avoid being loaded
  * into system emulators without vga support
@@ -26,7 +24,4 @@ extern enum vga_retrace_method vga_retrace_method;
 
 #define TYPE_VGA_MMIO "vga-mmio"
 
-int vga_mmio_init(hwaddr vram_base, hwaddr ctrl_base,
-                  int it_shift, MemoryRegion *address_space);
-
 #endif
diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
index 10bde32af5ca..496936808137 100644
--- a/hw/display/vga-mmio.c
+++ b/hw/display/vga-mmio.c
@@ -24,7 +24,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "hw/display/vga.h"
 #include "hw/sysbus.h"
 #include "hw/display/vga.h"
 #include "hw/qdev-properties.h"
@@ -85,24 +84,6 @@ static void vga_mmio_reset(DeviceState *dev)
     vga_common_reset(&s->vga);
 }
 
-int vga_mmio_init(hwaddr vram_base, hwaddr ctrl_base,
-                  int it_shift, MemoryRegion *address_space)
-{
-    DeviceState *dev;
-    SysBusDevice *s;
-
-    dev = qdev_new(TYPE_VGA_MMIO);
-    qdev_prop_set_uint8(dev, "it_shift", it_shift);
-    s = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(s, &error_fatal);
-
-    sysbus_mmio_map(s, 0, ctrl_base);
-    sysbus_mmio_map(s, 1, vram_base + 0x000a0000);
-    sysbus_mmio_map(s, 2, VBE_DISPI_LFB_PHYSICAL_ADDRESS);
-
-    return 0;
-}
-
 static void vga_mmio_realizefn(DeviceState *dev, Error **errp)
 {
     VGAMmioState *s = VGA_MMIO(dev);
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 8f345afd137a..44f0d48bfd75 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -43,6 +43,7 @@
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/timer/i8254.h"
 #include "hw/display/vga.h"
+#include "hw/display/bochs-vbe.h"
 #include "hw/audio/pcspk.h"
 #include "hw/input/i8042.h"
 #include "hw/sysbus.h"
@@ -274,7 +275,13 @@ static void mips_jazz_init(MachineState *machine,
         }
         break;
     case JAZZ_PICA61:
-        vga_mmio_init(0x40000000, 0x60000000, 0, get_system_memory());
+        dev = qdev_new(TYPE_VGA_MMIO);
+        qdev_prop_set_uint8(dev, "it_shift", 0);
+        sysbus = SYS_BUS_DEVICE(dev);
+        sysbus_realize_and_unref(sysbus, &error_fatal);
+        sysbus_mmio_map(sysbus, 0, 0x60000000);
+        sysbus_mmio_map(sysbus, 1, 0x400a0000);
+        sysbus_mmio_map(sysbus, 2, VBE_DISPI_LFB_PHYSICAL_ADDRESS);
         break;
     default:
         break;
-- 
2.34.1


