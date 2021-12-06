Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD9B46AD27
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 23:48:56 +0100 (CET)
Received: from localhost ([::1]:39780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muMn1-0004LG-3j
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 17:48:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muMk8-0001PE-1Y
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 17:45:56 -0500
Received: from [2a00:1450:4864:20::430] (port=41938
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muMk6-00079W-3q
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 17:45:55 -0500
Received: by mail-wr1-x430.google.com with SMTP id a9so25439904wrr.8
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 14:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w+yRQYeZ7bbAuc5HEXn4edg23VKEzwxJXX8ulRzRrI8=;
 b=fsBZVGR1SaDSWX2D9gGKqMipKf3QYwglqMie1g6y8NUwYJWFCno9B1qNYV6u9NtbsG
 /Gtnn3ZHR1y4ueyTH9nGO/W9lj+wE2/2BypnT99quvAJSr2pFCVHfajSbMjRUaNe+T8L
 +B0HQ8eCafvn+AD9A/C09BnEHu0uDBOXSEhWK9jz9i8jDqj/1l5yq91QzQm/vrdRNL7F
 pzLEJQt47OET4/HP3dYF7FlHtFSnAu4Bk0ktfNnpq6A4msiDRxwBb902Th5fmVjpqDwP
 Tar1jc9ta+TRoVDhoHqSUmabWsQeGWQoPRRirsXBnOnUXj5Il556570TnoTSNhyLc+D7
 qt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w+yRQYeZ7bbAuc5HEXn4edg23VKEzwxJXX8ulRzRrI8=;
 b=6nyIsCTgoK9xHhmDlFOmcsZu/28CJhRtdaHx8JWw9XSGxeQgerKOzLcht7YIw8XOs5
 7veAIlvhxYi1zmRGR1ZIxkloM70rNqUp2DP2eeinIbQQAfTLgDpJEkyh/4qQCfKHwT6N
 UqJPCrOuFxkewZ599MzIhPRE0iW2sOL3VVsYGRVJVM3p4p6o/Q4ceR5g8CSJzeQ3RleF
 IbFg8lfkEhiEHTraznAmEj8RsrAhrpZovsWgEUZVZr5oqJUhaQ3f2pHrYer/EquiG4bj
 sgiLXJ/rJtFlm77relj0Bl+z8T+XgebN8LPK9ykO1AuSuaqWV+Lc1MglKGFmqVr5PZxU
 MkxA==
X-Gm-Message-State: AOAM5320Mw+tKIcskeik/hFi1k0tRN4r0r3cjiks+Es9BFUBtksZMlBZ
 wxkj3SPPWJsE3C/o2Vm7NpqlXVBf3/8=
X-Google-Smtp-Source: ABdhPJxfn0iFulNSafMMU5r1zMheG3Sd/IjVsfwSDKvghqfpu3UonxrFSpd+NL8S7jR4lTXHzvleIQ==
X-Received: by 2002:a5d:54cf:: with SMTP id x15mr48411043wrv.30.1638830752552; 
 Mon, 06 Dec 2021 14:45:52 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m7sm637366wml.38.2021.12.06.14.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 14:45:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] hw/mips/jazz: Inline vga_mmio_init() and remove it
Date: Mon,  6 Dec 2021 23:45:28 +0100
Message-Id: <20211206224528.563588-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211206224528.563588-1-f4bug@amsat.org>
References: <20211206224528.563588-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vga_mmio_init() is used only one time and not very helpful,
inline and remove it.

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/display/vga.h |  5 -----
 hw/display/vga-mmio.c    | 19 -------------------
 hw/mips/jazz.c           |  9 ++++++++-
 3 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/include/hw/display/vga.h b/include/hw/display/vga.h
index 98b2e560f9b..a79aa2909b2 100644
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
index 10bde32af5c..49693680813 100644
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
index 8f345afd137..44f0d48bfd7 100644
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
2.33.1


