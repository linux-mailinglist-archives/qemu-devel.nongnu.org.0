Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ABF2E2474
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 06:33:51 +0100 (CET)
Received: from localhost ([::1]:35760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksJG1-0006gu-IJ
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 00:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1ksJEc-0006Dw-8o
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 00:32:22 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:38147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1ksJEa-0003Ug-Dx
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 00:32:22 -0500
Received: by mail-oi1-x22f.google.com with SMTP id x13so1443146oic.5
 for <qemu-devel@nongnu.org>; Wed, 23 Dec 2020 21:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Qot5Z1uWCDvAHasrGR6xIPlMrvaIhVbY9eCaGk+pZ+U=;
 b=OsUNMd8QqWLWT7geUBtXvoRERlJFa7qBKFWgSaMAs6achy1WxLBNui0wCJrar1Klu0
 7R58Rln+w/36EubRpVJL4L5EjAWGWHeTIaiZFeVOChe2IJ1VRcNsxZkjQrLVmYXXyWBz
 6+riDg71gSMIgahMlbvBvyOCAbsFvCnaFW0TLvtygh71LOL9VSPOHCmwasRIOQpWgtEJ
 rropL/zBGae204IRDZ+lyHuXLewAZJV4qo2DaL9+fVsKT5qq0fbY+zXDtRVnV3gUWa71
 RSwM+vG1n2neR0MA5LQcBCI1SJMpREObHIgxEJCKgM7rrZxzbYtOlMFJfKaH4Z/rb44A
 sEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Qot5Z1uWCDvAHasrGR6xIPlMrvaIhVbY9eCaGk+pZ+U=;
 b=Vc66cJI6YyycbgBwJQcw55/lxy7OtdhG22hSYoympW3qlU8k6Es7+tYhriHWrJ8cFf
 rNbEe0hU9a2rrZRcCEeakBptrTGvKTn0G11kceRGoMTlmH+kMbP53EHEQ3GTWImDar3m
 GC+y0+E1xYB3Flr7cLKz/vDI6BmpzzrwYgDmRG5a0RjFSKuZx4PPBAKUsWIfYYKxtAt7
 CIE9PoKI0dL6MIGGTqAnRGC11fIKMJINcRzpDhWZItAmw5Wcrz3jpZHnGLjFRRTtCX8K
 Na9Z08vB+ckABtO5i3iu+CW2TqYseMKZlnzl0z2oid8axpRQRovXF4q6kp5hpdhXXxsK
 DlAw==
X-Gm-Message-State: AOAM532hvu4R9I9s/ydSIxW9Bw8yKoWtVBimNhcYCS+Ly2yEUMfSjwaj
 uRkHraFaC8+f25KR375XFkQ=
X-Google-Smtp-Source: ABdhPJyLU0U6amGsk2AHFjEyCBTo+5RPLkq8AMbMV9fKabCRdm+ofI83VPhOOPOslQ8Gshfyb//c7w==
X-Received: by 2002:aca:bac3:: with SMTP id k186mr1909485oif.93.1608787939154; 
 Wed, 23 Dec 2020 21:32:19 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id u85sm6537655oif.57.2020.12.23.21.32.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 23 Dec 2020 21:32:18 -0800 (PST)
Date: Wed, 23 Dec 2020 21:32:16 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: Problems with irq mapping in qemu v5.2
Message-ID: <20201224053216.GA60462@roeck-us.net>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <e90b9df0-5173-6e2b-3572-4f21ac318231@amsat.org>
 <2c478b3e-5098-1887-73b3-90f91a808ad8@ilande.co.uk>
 <1d33fa46-2079-ad40-d579-6e827543de50@roeck-us.net>
 <f04ae64-fa4a-2e21-1468-cf37315ec9b2@eik.bme.hu>
 <c64fe3a4-cd9c-b455-53ce-c53fb6cf0632@roeck-us.net>
 <8a3b2030-8ee6-fd56-6bfa-206457db84f@eik.bme.hu>
 <165973a-135e-3072-ee2c-afda64844770@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165973a-135e-3072-ee2c-afda64844770@eik.bme.hu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, chenhuacai@kernel.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 24, 2020 at 02:34:07AM +0100, BALATON Zoltan wrote:
[ ... ]
> 
> If we need legacy mode then we may be able to emulate that by setting BARs
> to legacy ports ignoring what values are written to them if legacy mode
> config is set (which may be what the real chip does) and we already have
> IRQs hard wired to legacy values so that would give us legacy and
> half-native mode which is enough for both fuloong2e and pegasos2 but I'm not
> sure how can we fix BARs in QEMU because that's also handled by generic PCI
> code which I also don't want to break.

The code below works for booting Linux while at the same time not affecting
any other emulation. I don't claim it to be a perfect fix, and overloading
the existing property is a bit hackish, but it does work.

Guenter

---
From cf2d1d655f3fe4f88dc435a3ac4e1e6b6040d08b Mon Sep 17 00:00:00 2001
From: Guenter Roeck <linux@roeck-us.net>
Date: Wed, 23 Dec 2020 09:12:37 -0800
Subject: [PATCH] via-ide: Fix fuloong2 support

Fuloong2 needs to use legacy mode for IDE support to work with Linux.
Add property to via-ide driver to make the mode configurable, and set
legacy mode for Fuloong2.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/ide/via.c        | 16 ++++++++++++++--
 hw/mips/fuloong2e.c |  4 +++-
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index be09912b33..9e55e717e8 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -26,6 +26,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/pci/pci.h"
+#include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "sysemu/dma.h"
@@ -185,12 +186,17 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
                           &d->bus[1], "via-ide1-cmd", 4);
     pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
 
-    bmdma_setup_bar(d);
-    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
+    if (!d->secondary) {
+        bmdma_setup_bar(d);
+        pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
+    }
 
     qdev_init_gpio_in(ds, via_ide_set_irq, 2);
     for (i = 0; i < 2; i++) {
         ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
+        if (d->secondary) {
+            ide_init_ioport(&d->bus[i], NULL, i ? 0x170 : 0x1f0, i ? 0x376 : 0x3f6);
+        }
         ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
@@ -210,6 +216,11 @@ static void via_ide_exitfn(PCIDevice *dev)
     }
 }
 
+static Property via_ide_properties[] = {
+    DEFINE_PROP_UINT32("legacy_mode", PCIIDEState, secondary, 0), /* hijacked */
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void via_ide_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -223,6 +234,7 @@ static void via_ide_class_init(ObjectClass *klass, void *data)
     k->device_id = PCI_DEVICE_ID_VIA_IDE;
     k->revision = 0x06;
     k->class_id = PCI_CLASS_STORAGE_IDE;
+    device_class_set_props(dc, via_ide_properties);
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
 
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 23c526c69d..d0398d6266 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -245,7 +245,9 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     /* Super I/O */
     isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
 
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
+    dev = pci_new(PCI_DEVFN(slot, 1), "via-ide");
+    qdev_prop_set_uint32(&dev->qdev, "legacy_mode", 1);
+    pci_realize_and_unref(dev, pci_bus, &error_fatal);
     pci_ide_create_devs(dev);
 
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
-- 
2.17.1


