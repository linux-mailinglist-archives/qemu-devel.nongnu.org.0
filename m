Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C2D4B9D2A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 11:31:48 +0100 (CET)
Received: from localhost ([::1]:54946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKe4h-0007MP-2P
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 05:31:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKdtn-0006mb-WC
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 05:20:32 -0500
Received: from [2a00:1450:4864:20::530] (port=39913
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKdtl-0002zH-VT
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 05:20:31 -0500
Received: by mail-ed1-x530.google.com with SMTP id u18so8725308edt.6
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 02:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/2H6Kju1HQIwMzyjyD2tOtStIN9FFUqCW7TnSzlxvNo=;
 b=C83SScQnuijwIs+sxGoIGan320fIM+Fql98aXbBhhd8XqmL/eacEMw3t80GAD+ZfZu
 mCAWmGWEz46maeJSvsnfq6DRJOy5p/TQvq00iBRNkZ2/RkAF/O7B+zWSeIVErHssUrXu
 recGwtXbUsYfMT/bykUaUst3YEHo5nk2vlGeDK4QkD1wSGk3F9WeQllYWaPpzh5OyzXr
 Dlu1QxOV5u84em853W82A0k5PH5PF8ofBjHt3VJt7LqX00J8IrwRV8l78C+F4/gJl5Lj
 vrDZqAyiWL0iUlpw4+A9Qo8ux5cfkwB8mHY6ZO41DTdkWNrFkO5EWaEcr/JS0kL51bof
 tI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/2H6Kju1HQIwMzyjyD2tOtStIN9FFUqCW7TnSzlxvNo=;
 b=gHPG+UwL+079z8Y5A8zSCh4eyz95sXbE12dZXtZ46zbHItIvrt/WPACR+GeBZzLWcI
 Ngq+4fyo/U9eK+4rbfVDTn9/W6uyIXmlG9Qr5mqQrxDAcCBhleuI43MAsvdbg/7jywc/
 ba+JZHxGuZTBsDvBQqZlpjKIYaFFtoR3l4fZVvCxGc0ZjPR9MQBXrf8DrJfsAFbIFsoi
 ekkpa5SUZWbIz7m72ngwTkSzsNAG2TMVp+gY7bgvsTHxuQiVWHETW0fOoq/gIIyn+MBk
 sAj024khTNE1rCHkO43LMXN8gQSxczSS+iQtFp7KBo0POCrRnDWfTU4vjvIdtKY1r+oq
 6FEQ==
X-Gm-Message-State: AOAM5312LF7O/tk0gZdOH4TECw729k8kRCYorey6YtEiQlkPM+e0mUSo
 VZOPPUc+rLD0XY8Y/mjjqzHA4nYwH/c=
X-Google-Smtp-Source: ABdhPJykH1nFZD7E35U4cK6Elai4sg8YfiNZYTRQSYyL93VNRuxN+vurCpu9UAsvZjy6vaAMAA4voQ==
X-Received: by 2002:a50:ba8e:0:b0:410:a99c:4c3b with SMTP id
 x14-20020a50ba8e000000b00410a99c4c3bmr1852663ede.427.1645093225944; 
 Thu, 17 Feb 2022 02:20:25 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-198-236.77.183.pool.telefonica.de. [77.183.198.236])
 by smtp.gmail.com with ESMTPSA id u26sm986753ejg.196.2022.02.17.02.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 02:20:25 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 7/7] hw/mips/gt64xxx_pci: Resolve gt64120_register()
Date: Thu, 17 Feb 2022 11:19:24 +0100
Message-Id: <20220217101924.15347-8-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217101924.15347-1-shentey@gmail.com>
References: <20220217101924.15347-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that gt64120_register() lost its pic parameter, there is an
opportunity to remove it. gt64120_register() is old style by wrapping
qdev API, and the new style is to use qdev directly. So take the
opportunity and modernize the code.

Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/gt64xxx_pci.c  | 21 ++++-----------------
 hw/mips/malta.c        |  3 ++-
 include/hw/mips/mips.h |  3 ---
 3 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index eb205d6d70..e0ff1b5566 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -26,7 +26,6 @@
 #include "qapi/error.h"
 #include "qemu/units.h"
 #include "qemu/log.h"
-#include "hw/mips/mips.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
 #include "migration/vmstate.h"
@@ -1151,30 +1150,18 @@ static void gt64120_reset(DeviceState *dev)
 static void gt64120_realize(DeviceState *dev, Error **errp)
 {
     GT64120State *s = GT64120_PCI_HOST_BRIDGE(dev);
+    PCIHostState *phb = PCI_HOST_BRIDGE(dev);
 
     memory_region_init_io(&s->ISD_mem, OBJECT(dev), &isd_mem_ops, s,
                           "gt64120-isd", 0x1000);
-}
-
-PCIBus *gt64120_register(void)
-{
-    GT64120State *d;
-    PCIHostState *phb;
-    DeviceState *dev;
-
-    dev = qdev_new(TYPE_GT64120_PCI_HOST_BRIDGE);
-    d = GT64120_PCI_HOST_BRIDGE(dev);
-    phb = PCI_HOST_BRIDGE(dev);
-    memory_region_init(&d->pci0_mem, OBJECT(dev), "pci0-mem", 4 * GiB);
-    address_space_init(&d->pci0_mem_as, &d->pci0_mem, "pci0-mem");
+    memory_region_init(&s->pci0_mem, OBJECT(dev), "pci0-mem", 4 * GiB);
+    address_space_init(&s->pci0_mem_as, &s->pci0_mem, "pci0-mem");
     phb->bus = pci_root_bus_new(dev, "pci",
-                                &d->pci0_mem,
+                                &s->pci0_mem,
                                 get_system_io(),
                                 PCI_DEVFN(18, 0), TYPE_PCI_BUS);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
-    return phb->bus;
 }
 
 static void gt64120_pci_realize(PCIDevice *d, Error **errp)
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 13254dbc89..55037eb90f 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1390,7 +1390,8 @@ void mips_malta_init(MachineState *machine)
     stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);
 
     /* Northbridge */
-    pci_bus = gt64120_register();
+    dev = sysbus_create_simple("gt64120", -1, NULL);
+    pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
     /*
      * The whole address space decoded by the GT-64120A doesn't generate
      * exception when accessing invalid memory. Create an empty slot to
diff --git a/include/hw/mips/mips.h b/include/hw/mips/mips.h
index ff88942e63..101799f7d3 100644
--- a/include/hw/mips/mips.h
+++ b/include/hw/mips/mips.h
@@ -9,9 +9,6 @@
 
 #include "exec/memory.h"
 
-/* gt64xxx.c */
-PCIBus *gt64120_register(void);
-
 /* bonito.c */
 PCIBus *bonito_init(qemu_irq *pic);
 
-- 
2.35.1


