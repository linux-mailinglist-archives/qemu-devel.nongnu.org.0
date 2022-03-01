Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFD14C9867
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:35:26 +0100 (CET)
Received: from localhost ([::1]:46368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPB5Z-00010j-K6
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:35:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPAYE-00029H-JE; Tue, 01 Mar 2022 17:00:58 -0500
Received: from [2a00:1450:4864:20::534] (port=45821
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPAYC-0005DQ-3v; Tue, 01 Mar 2022 17:00:58 -0500
Received: by mail-ed1-x534.google.com with SMTP id g23so2876216edy.12;
 Tue, 01 Mar 2022 14:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MFJZxqGtEKsVyYEyQja8UwrJm7SlWSmwFoQ8cAEjeqE=;
 b=Hh9IhrliRMJ257bBrFS7YdJndMgPHo5DIPoAWoDyeBgP+T5qI9tkd5BeNhNxIwU8Vm
 h+KgOxe8+l21djnC0iRc2leoGNpb00Df4sN/4FWohkK7uHCBWvjBik8Vd4ZiVquk38YT
 6WW9QoZeUMohaa9TNlHviOb2JS7TSBsLfOQbjhNNI7ChqcsYv1o8ydIFpF3BjDgry99M
 Nhswxlstk2cWhnsNzaOhBwRVa8wIpU6u6nuqxjj7WSs/TPsB4mPDpRfBM9efwGnzRFeB
 x9iNSVAOf2Hch5updtIm8IYEHSJzp+P8p5Zy9/ZTtiUK+DLd0QWFUokZAWvAlcWL4GMS
 ZoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MFJZxqGtEKsVyYEyQja8UwrJm7SlWSmwFoQ8cAEjeqE=;
 b=W4WtWI7ZPv9gOAvIjuAoMgKwG3IMMfwfCCSXkaTH718XZe+tA7KIOWgeWHKyb8KDJ1
 JjC8c3DvzL3tfhIdPcuafxDaAJ6l4zXlQJ7Jjl0IlHUrl+O643qk0xPwzsT9JbWArwq5
 gK1rdezGB6sQCnxe+d3IO4zmtlp0KiWG+816rebNyQBzufkpSOlL3jPEiYmA1P+hvIP/
 tmF5QUd1nGOoYWwZrsCly0pWu4+umORn0xpHyJ4GItTI2Lm+7SPI/fyLdW26FbyBcDm9
 zIuohhm7YzSzfhBqE6Q1EPEwu2b5aL1HzsVAs61RH/bbGTcngcHBmW8AFEINU3Cv85Mv
 1Y5A==
X-Gm-Message-State: AOAM533lVoE6KXfzFyBLargx6tuXA6uQz2vQEJeoXAAOKn3acRS9wdyD
 6nKtCyoFc3moHv3M0pFJMZog3uu1HFM=
X-Google-Smtp-Source: ABdhPJwo3EHuiKvSIQ2kQBWpthdsPa18xY7gFDJmYwLgWXwZ6nq0uB8o1RGKb97kbXQUlXYmQsh4gw==
X-Received: by 2002:a05:6402:b62:b0:3e2:a75f:b949 with SMTP id
 cb2-20020a0564020b6200b003e2a75fb949mr26309288edb.62.1646172053465; 
 Tue, 01 Mar 2022 14:00:53 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-055-004-046.78.55.pool.telefonica.de. [78.55.4.46])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a056402348700b00415b38e920bsm182731edc.95.2022.03.01.14.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:52 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/7] isa: Inline and remove one-line isa_init_irq()
Date: Tue,  1 Mar 2022 23:00:37 +0100
Message-Id: <20220301220037.76555-8-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301220037.76555-1-shentey@gmail.com>
References: <20220301220037.76555-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 "open list:Floppy" <qemu-block@nongnu.org>, Corey Minyard <minyard@acm.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "open list:PReP" <qemu-ppc@nongnu.org>,
 Bernhard Beschow <shentey@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
It can therefore be removed.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com> (tpm_tis_isa)
Acked-by: Corey Minyard <cminyard@mvista.com> (isa_ipmi_bt,
isa_ipmi_kcs)
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index cb291d121c..0fd6756dcf 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -197,7 +197,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
         return;
     }
-    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, s->rtc.isairq);
+    s->rtc.irq = isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc.isairq);
 
     piix4_dev = dev;
 }
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
2.35.1


