Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98EC320B1F
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:50:56 +0100 (CET)
Received: from localhost ([::1]:41286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDq4V-0000QG-Jj
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:50:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpr9-0007zo-8x
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:07 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpr7-0003JK-KJ
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:07 -0500
Received: by mail-wm1-x330.google.com with SMTP id a207so12082054wmd.1
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fn2wgV+lTDENJfWcbIU51ctlhy1kkwhbv5mosNpy87A=;
 b=H7u49TBmnJguwv5gB1vnANUb0v6ZjR6GIhS0shW/bfl4kGFsFOOH1c73crawqpY1EI
 AUtjdlCl48o2QIRwy0L2RxudXjhKRKiwpTAS+d9LL8xetYVj+m7PTjNTitejoW6eql7N
 um2mERD6XtUt1pCPnzAjxZ4O+bKw7V0MDHt4BLpn6tLytr9gIJHQhiEKO28B6fyDJmpA
 e1e5A/Qb4uqVIdaGrt82AhsJ9EBcHi0/dXQpdxNHJL2UUzvcLXPl3EnEOHLT1EA65dz2
 +yGX+Ln0cxV8MXcCHEOzeSDSlKNJ4cJuvonRsPI0HIFXht4O57hHQ6atUq5u2J6sMp4G
 KQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Fn2wgV+lTDENJfWcbIU51ctlhy1kkwhbv5mosNpy87A=;
 b=qxLYDIfUhR/vp9weC2DM8x6pib2Zfgnn5wGHYT4xg9Vy23BT4aKVj0wiYW92ycgtd/
 aTb1j5q7Ihu5A2/GZuBEuEj6lfsO7TAKl+8QiJ5fdkaY7YkKJh4OBrLBG1+jbtTogEgX
 +sS1r2vSeJLYCbKW6FLEvQTeGfXx6fm8+gvaCcgiKclosCsEmebIQbkduS/SZxKw3Vry
 z4uXbdfIgLtHvC1Bc8fMutimeVEBKb+Zi+RHqbyZJlbihdzYHSF2gJCwaDAOvAaUN2Oa
 pQ13aKerA3zBjjCpnGmI3XxC+8rquowhKw7qO/FAHg6vnCinhLi+3IA9dOz/hgJQNpNp
 BYeg==
X-Gm-Message-State: AOAM533Ogqri87x/5shoMl9se/WlR2XzX30rfWadeWJuLR26Vx/rr8eD
 OJdgMN0J1auoMZp0QsKjWEgluuXaaiE=
X-Google-Smtp-Source: ABdhPJygGmSi6Qx4Zj3SRDnVfJXS7W5zElbSmb9YN6Z69GQeGRHUb32aNIrJ7ByjRSlkLQK8nT6gxw==
X-Received: by 2002:a05:600c:294c:: with SMTP id
 n12mr258617wmd.118.1613918223723; 
 Sun, 21 Feb 2021 06:37:03 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b15sm23809109wrr.47.2021.02.21.06.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:37:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/43] vt82c686: Fix SMBus IO base and configuration registers
Date: Sun, 21 Feb 2021 15:34:19 +0100
Message-Id: <20210221143432.2468220-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

The base address of the SMBus io ports and its enabled status is set
by registers in the PCI config space but this was not correctly
emulated. Instead the SMBus registers were mapped on realize to the
base address set by a property to the address expected by fuloong2e
firmware.

Fix the base and config register handling to more closely model
hardware which allows to remove the property and allows the guest to
control this mapping. Do all this in reset instead of realize so it's
correctly updated on reset.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <f2ca2ad5f08ba8cee07afd9d67b4e75cda21db09.1610223397.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c   | 49 +++++++++++++++++++++++++++++++++------------
 hw/mips/fuloong2e.c |  4 +---
 2 files changed, 37 insertions(+), 16 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index fe8961b0573..9c4d1530225 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -22,6 +22,7 @@
 #include "hw/i2c/pm_smbus.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/range.h"
 #include "qemu/timer.h"
 #include "exec/address-spaces.h"
 #include "trace.h"
@@ -34,7 +35,6 @@ struct VT686PMState {
     ACPIREGS ar;
     APMState apm;
     PMSMBus smb;
-    uint32_t smb_io_base;
 };
 
 static void pm_io_space_update(VT686PMState *s)
@@ -50,11 +50,22 @@ static void pm_io_space_update(VT686PMState *s)
     memory_region_transaction_commit();
 }
 
+static void smb_io_space_update(VT686PMState *s)
+{
+    uint32_t smbase = pci_get_long(s->dev.config + 0x90) & 0xfff0UL;
+
+    memory_region_transaction_begin();
+    memory_region_set_address(&s->smb.io, smbase);
+    memory_region_set_enabled(&s->smb.io, s->dev.config[0xd2] & BIT(0));
+    memory_region_transaction_commit();
+}
+
 static int vmstate_acpi_post_load(void *opaque, int version_id)
 {
     VT686PMState *s = opaque;
 
     pm_io_space_update(s);
+    smb_io_space_update(s);
     return 0;
 }
 
@@ -77,8 +88,18 @@ static const VMStateDescription vmstate_acpi = {
 
 static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
 {
+    VT686PMState *s = VT82C686B_PM(d);
+
     trace_via_pm_write(addr, val, len);
     pci_default_write_config(d, addr, val, len);
+    if (ranges_overlap(addr, len, 0x90, 4)) {
+        uint32_t v = pci_get_long(s->dev.config + 0x90);
+        pci_set_long(s->dev.config + 0x90, (v & 0xfff0UL) | 1);
+    }
+    if (range_covers_byte(addr, len, 0xd2)) {
+        s->dev.config[0xd2] &= 0xf;
+        smb_io_space_update(s);
+    }
 }
 
 static void pm_update_sci(VT686PMState *s)
@@ -103,6 +124,17 @@ static void pm_tmr_timer(ACPIREGS *ar)
     pm_update_sci(s);
 }
 
+static void vt82c686b_pm_reset(DeviceState *d)
+{
+    VT686PMState *s = VT82C686B_PM(d);
+
+    /* SMBus IO base */
+    pci_set_long(s->dev.config + 0x90, 1);
+    s->dev.config[0xd2] = 0;
+
+    smb_io_space_update(s);
+}
+
 static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
 {
     VT686PMState *s = VT82C686B_PM(dev);
@@ -116,13 +148,9 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
     /* 0x48-0x4B is Power Management I/O Base */
     pci_set_long(pci_conf + 0x48, 0x00000001);
 
-    /* SMB ports:0xeee0~0xeeef */
-    s->smb_io_base = ((s->smb_io_base & 0xfff0) + 0x0);
-    pci_conf[0x90] = s->smb_io_base | 1;
-    pci_conf[0x91] = s->smb_io_base >> 8;
-    pci_conf[0xd2] = 0x90;
     pm_smbus_init(DEVICE(s), &s->smb, false);
-    memory_region_add_subregion(get_system_io(), s->smb_io_base, &s->smb.io);
+    memory_region_add_subregion(pci_address_space_io(dev), 0, &s->smb.io);
+    memory_region_set_enabled(&s->smb.io, false);
 
     apm_init(dev, &s->apm, NULL, s);
 
@@ -135,11 +163,6 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
     acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2);
 }
 
-static Property via_pm_properties[] = {
-    DEFINE_PROP_UINT32("smb_io_base", VT686PMState, smb_io_base, 0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void via_pm_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -151,10 +174,10 @@ static void via_pm_class_init(ObjectClass *klass, void *data)
     k->device_id = PCI_DEVICE_ID_VIA_ACPI;
     k->class_id = PCI_CLASS_BRIDGE_OTHER;
     k->revision = 0x40;
+    dc->reset = vt82c686b_pm_reset;
     dc->desc = "PM";
     dc->vmsd = &vmstate_acpi;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    device_class_set_props(dc, via_pm_properties);
 }
 
 static const TypeInfo via_pm_info = {
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 1f3680fda3e..94f4718147f 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -230,9 +230,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci");
 
-    dev = pci_new(PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
-    qdev_prop_set_uint32(DEVICE(dev), "smb_io_base", 0xeee1);
-    pci_realize_and_unref(dev, pci_bus, &error_fatal);
+    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
 
     /* Audio support */
-- 
2.26.2


