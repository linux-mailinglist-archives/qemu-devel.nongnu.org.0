Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DC44D00A5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:03:31 +0100 (CET)
Received: from localhost ([::1]:44534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDxS-00011d-0b
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:03:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDgO-0006El-FD
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:45:52 -0500
Received: from [2607:f8b0:4864:20::102c] (port=51046
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDgM-0007Ia-EP
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:45:52 -0500
Received: by mail-pj1-x102c.google.com with SMTP id m22so13577042pja.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UeSAkhyb/cphUBvSNmfYLoHOmVsuXI6cx2VociCTd2o=;
 b=XgNkOeb2R6vVJYfCDV2gG5satv3MsQxmpqqdvCLu3r01JCG7HTSn1jXVvqy+emDisc
 XlGQCLHFSrdHRIsm9GFts22+PZd4UuhdRQ4WJT3jU6Hh/GrILDgOURFqCkONqx0uYxYc
 I1vSGspPq3r6Y9PDIRYDdCbThZYOoXghsTwHuYeTFh6hb/ABcpHA5pWxl3zi38AGq0HN
 oWKOBwgVDc/7cBA2UlbgLi86Pz+jVSAY2IOrYWAmnpoS82EaUPia8dMi08PUJmB2iYlz
 3Q7LdHXLgN6Q16hqiQ0ankJ5JZWLa0mA4vVE42B96rhwiP2kxa7JhIDNAX79aOMzAzH3
 w+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UeSAkhyb/cphUBvSNmfYLoHOmVsuXI6cx2VociCTd2o=;
 b=nTLY+FvtPyi4/eNySbw3wYp/U4fZBNFkgnFIwT78tSxdTXCh3S+lwO8Rcp+us1b71X
 0xyDeqk93O7RrQ2IyfDg5LGkGLyJGVr416pbkbL1RFS3YsAOm3HZCoYcmtRtikHHTUJx
 Z4CXxYqMqIPSpeO3KcF9mO9vgVlmRQwvWuSp2B9dithXMcM94GC63bCsIqzJvgs6TbCN
 uZHQf/GD+MDushMyPBsoMX+Ujvjj+ng9VdnH3yiBKwqeGzjnGU1Ur2mzamGhaXP7T/lm
 oal6rAivAgbTPNGHYdd0+BTNjc4ZHVCvXfjuNgNuObxZ4pzGIc2ObptB+qdW6ISvakfB
 g9eA==
X-Gm-Message-State: AOAM530kAE+Yf2HRCs4h5BuTzHBCN9HYJUeFjlDILjUI9lOwhYd/aXgm
 8qAVFhCV8fCMQ5IKtJGtyjdP96TgsG8=
X-Google-Smtp-Source: ABdhPJxPysZgCVbVBn9Dzno2EzEmymFDdnD4fSlsDq/EL0jYiWIzjI3JRXPMRIFu98U4QvVP6ovuEQ==
X-Received: by 2002:a17:90b:4d81:b0:1bf:4d44:ce1e with SMTP id
 oj1-20020a17090b4d8100b001bf4d44ce1emr8760766pjb.112.1646660749223; 
 Mon, 07 Mar 2022 05:45:49 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a17090a859100b001bc20ddcc67sm19073697pjn.34.2022.03.07.05.45.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 05:45:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Bernhard Beschow <shentey@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 13/13] hw/isa: Inline and remove one-line isa_init_irq()
Date: Mon,  7 Mar 2022 14:43:53 +0100
Message-Id: <20220307134353.1950-14-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Corey Minyard <cminyard@mvista.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
It can therefore be removed.

isa_ipmi_kcs)

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com> (tpm_tis_isa)
Acked-by: Corey Minyard <cminyard@mvista.com> (isa_ipmi_bt,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220301220037.76555-8-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/audio/cs4231a.c     | 2 +-
 hw/audio/gus.c         | 2 +-
 hw/audio/sb16.c        | 2 +-
 hw/block/fdc-isa.c     | 2 +-
 hw/char/parallel.c     | 2 +-
 hw/char/serial-isa.c   | 2 +-
 hw/ide/isa.c           | 2 +-
 hw/input/pckbd.c       | 4 ++--
 hw/ipmi/isa_ipmi_bt.c  | 2 +-
 hw/ipmi/isa_ipmi_kcs.c | 2 +-
 hw/isa/isa-bus.c       | 8 +-------
 hw/isa/piix4.c         | 2 +-
 hw/net/ne2000-isa.c    | 2 +-
 hw/rtc/m48t59-isa.c    | 2 +-
 hw/tpm/tpm_tis_isa.c   | 2 +-
 include/hw/isa/isa.h   | 1 -
 16 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/hw/audio/cs4231a.c b/hw/audio/cs4231a.c
index 7d60ce6f0e..0723e39430 100644
--- a/hw/audio/cs4231a.c
+++ b/hw/audio/cs4231a.c
@@ -677,7 +677,7 @@ static void cs4231a_realizefn (DeviceState *dev, Error **errp)
         return;
     }
 
-    isa_init_irq(d, &s->pic, s->irq);
+    s->pic = isa_get_irq(d, s->irq);
     k = ISADMA_GET_CLASS(s->isa_dma);
     k->register_channel(s->isa_dma, s->dma, cs_dma_read, s);
 
diff --git a/hw/audio/gus.c b/hw/audio/gus.c
index e8719ee117..42f010b671 100644
--- a/hw/audio/gus.c
+++ b/hw/audio/gus.c
@@ -282,7 +282,7 @@ static void gus_realizefn (DeviceState *dev, Error **errp)
     s->emu.himemaddr = s->himem;
     s->emu.gusdatapos = s->emu.himemaddr + 1024 * 1024 + 32;
     s->emu.opaque = s;
-    isa_init_irq (d, &s->pic, s->emu.gusirq);
+    s->pic = isa_get_irq(d, s->emu.gusirq);
 
     AUD_set_active_out (s->voice, 1);
 }
diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index 60f1f75e3a..2215386ddb 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -1408,7 +1408,7 @@ static void sb16_realizefn (DeviceState *dev, Error **errp)
         return;
     }
 
-    isa_init_irq (isadev, &s->pic, s->irq);
+    s->pic = isa_get_irq(isadev, s->irq);
 
     s->mixer_regs[0x80] = magic_of_irq (s->irq);
     s->mixer_regs[0x81] = (1 << s->dma) | (1 << s->hdma);
diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
index ab663dce93..fa20450747 100644
--- a/hw/block/fdc-isa.c
+++ b/hw/block/fdc-isa.c
@@ -94,7 +94,7 @@ static void isabus_fdc_realize(DeviceState *dev, Error **errp)
                              isa->iobase, fdc_portio_list, fdctrl,
                              "fdc");
 
-    isa_init_irq(isadev, &fdctrl->irq, isa->irq);
+    fdctrl->irq = isa_get_irq(isadev, isa->irq);
     fdctrl->dma_chann = isa->dma;
     if (fdctrl->dma_chann != -1) {
         IsaDmaClass *k;
diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index b45e67bfbb..adb9bd9be3 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -553,7 +553,7 @@ static void parallel_isa_realizefn(DeviceState *dev, Error **errp)
     index++;
 
     base = isa->iobase;
-    isa_init_irq(isadev, &s->irq, isa->isairq);
+    s->irq = isa_get_irq(isadev, isa->isairq);
     qemu_register_reset(parallel_reset, s);
 
     qemu_chr_fe_set_handlers(&s->chr, parallel_can_receive, NULL,
diff --git a/hw/char/serial-isa.c b/hw/char/serial-isa.c
index 1b8b303079..7a7ed239cd 100644
--- a/hw/char/serial-isa.c
+++ b/hw/char/serial-isa.c
@@ -75,7 +75,7 @@ static void serial_isa_realizefn(DeviceState *dev, Error **errp)
     }
     index++;
 
-    isa_init_irq(isadev, &s->irq, isa->isairq);
+    s->irq = isa_get_irq(isadev, isa->isairq);
     qdev_realize(DEVICE(s), NULL, errp);
     qdev_set_legacy_instance_id(dev, isa->iobase, 3);
 
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 24bbde24c2..8bedbd13f1 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -75,7 +75,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
-    isa_init_irq(isadev, &s->irq, s->isairq);
+    s->irq = isa_get_irq(isadev, s->isairq);
     ide_init2(&s->bus, s->irq);
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
     ide_register_restart_cb(&s->bus);
diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index eb77e12f6f..1773db0d25 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -749,8 +749,8 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    isa_init_irq(isadev, &s->irq_kbd, isa_s->kbd_irq);
-    isa_init_irq(isadev, &s->irq_mouse, isa_s->mouse_irq);
+    s->irq_kbd = isa_get_irq(isadev, isa_s->kbd_irq);
+    s->irq_mouse = isa_get_irq(isadev, isa_s->mouse_irq);
 
     isa_register_ioport(isadev, isa_s->io + 0, 0x60);
     isa_register_ioport(isadev, isa_s->io + 1, 0x64);
diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index 02625eb94e..88aa734e9e 100644
--- a/hw/ipmi/isa_ipmi_bt.c
+++ b/hw/ipmi/isa_ipmi_bt.c
@@ -92,7 +92,7 @@ static void isa_ipmi_bt_realize(DeviceState *dev, Error **errp)
     }
 
     if (iib->isairq > 0) {
-        isa_init_irq(isadev, &iib->irq, iib->isairq);
+        iib->irq = isa_get_irq(isadev, iib->isairq);
         iib->bt.use_irq = 1;
         iib->bt.raise_irq = isa_ipmi_bt_raise_irq;
         iib->bt.lower_irq = isa_ipmi_bt_lower_irq;
diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
index 3b23ad08b3..afabb95ebe 100644
--- a/hw/ipmi/isa_ipmi_kcs.c
+++ b/hw/ipmi/isa_ipmi_kcs.c
@@ -91,7 +91,7 @@ static void ipmi_isa_realize(DeviceState *dev, Error **errp)
     }
 
     if (iik->isairq > 0) {
-        isa_init_irq(isadev, &iik->irq, iik->isairq);
+        iik->irq = isa_get_irq(isadev, iik->isairq);
         iik->kcs.use_irq = 1;
         iik->kcs.raise_irq = isa_ipmi_kcs_raise_irq;
         iik->kcs.lower_irq = isa_ipmi_kcs_lower_irq;
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index c64a14120b..0ad1c5fd65 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -85,15 +85,9 @@ qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
     return isabus->irqs[isairq];
 }
 
-void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq)
-{
-    *p = isa_get_irq(dev, isairq);
-}
-
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
 {
-    qemu_irq irq;
-    isa_init_irq(isadev, &irq, isairq);
+    qemu_irq irq = isa_get_irq(isadev, isairq);
     qdev_connect_gpio_out(DEVICE(isadev), gpioirq, irq);
 }
 
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index fc3c8b3fd1..8607e0ac36 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -216,7 +216,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
         return;
     }
-    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, s->rtc.isairq);
+    s->rtc.irq = isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc.isairq);
 }
 
 static void piix4_init(Object *obj)
diff --git a/hw/net/ne2000-isa.c b/hw/net/ne2000-isa.c
index dd6f6e34d3..6ced6775ff 100644
--- a/hw/net/ne2000-isa.c
+++ b/hw/net/ne2000-isa.c
@@ -68,7 +68,7 @@ static void isa_ne2000_realizefn(DeviceState *dev, Error **errp)
     ne2000_setup_io(s, DEVICE(isadev), 0x20);
     isa_register_ioport(isadev, &s->io, isa->iobase);
 
-    isa_init_irq(isadev, &s->irq, isa->isairq);
+    s->irq = isa_get_irq(isadev, isa->isairq);
 
     qemu_macaddr_default_if_unset(&s->c.macaddr);
     ne2000_reset(s);
diff --git a/hw/rtc/m48t59-isa.c b/hw/rtc/m48t59-isa.c
index e9086eada4..e61f7ec370 100644
--- a/hw/rtc/m48t59-isa.c
+++ b/hw/rtc/m48t59-isa.c
@@ -106,7 +106,7 @@ static void m48t59_isa_realize(DeviceState *dev, Error **errp)
 
     s->model = u->info.model;
     s->size = u->info.size;
-    isa_init_irq(isadev, &s->IRQ, d->isairq);
+    s->IRQ = isa_get_irq(isadev, d->isairq);
     m48t59_realize_common(s, errp);
     memory_region_init_io(&d->io, OBJECT(dev), &m48t59_io_ops, s, "m48t59", 4);
     if (d->io_base != 0) {
diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
index 10d8a14f19..3477afd735 100644
--- a/hw/tpm/tpm_tis_isa.c
+++ b/hw/tpm/tpm_tis_isa.c
@@ -127,7 +127,7 @@ static void tpm_tis_isa_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    isa_init_irq(ISA_DEVICE(dev), &s->irq, s->irq_num);
+    s->irq = isa_get_irq(ISA_DEVICE(dev), s->irq_num);
 
     memory_region_add_subregion(isa_address_space(ISA_DEVICE(dev)),
                                 TPM_TIS_ADDR_BASE, &s->mmio);
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index d80cab5b79..034d706ba1 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -90,7 +90,6 @@ ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *address_space,
                     MemoryRegion *address_space_io, Error **errp);
 void isa_bus_irqs(ISABus *bus, qemu_irq *irqs);
 qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq);
-void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq);
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq);
 void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
 IsaDma *isa_get_dma(ISABus *bus, int nchan);
-- 
2.34.1


