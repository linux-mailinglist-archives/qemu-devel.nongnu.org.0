Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3491C6A8C0E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:43:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrby-0006yS-Ll; Thu, 02 Mar 2023 17:41:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrbx-0006y6-8g
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:41:17 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrbt-0008Nk-9y
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:41:17 -0500
Received: by mail-wr1-x42d.google.com with SMTP id g3so601431wri.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NiuWoaksh0oshsP0kUmDcyGu8Cw2DTFvBk0EZlMxbKo=;
 b=FPJNv+8+TTdqtmnHj6tfqzCUql0vlOPht4vuAofMHp9KurkxIXez/i7YoPWfaqoczJ
 LGR++0OiKXATsIJ2BZTSQkiDEcuHQMZNJHet3XDroBncOoUIH+hfGW16Wid+dBy8NrFe
 +GFQH76wicQNeOkXA/3Xt7KzbHibzev4nVpSBxAYtbZY3paNibJiNO5mIbV/djgc8mGt
 6k+xVlfbUTOqeiKODx9NhvK1kVrrA2KFA7aIHEiOI+PdCBahP/GBd5X4TNteuUfv1x4Z
 ZDnN3hQR7mqguYe0UmU11aViP8cCfOnXDFu5ck+G2m6NeslkyBAsISxKvjjCGdQtgpjJ
 0zqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NiuWoaksh0oshsP0kUmDcyGu8Cw2DTFvBk0EZlMxbKo=;
 b=DHEwGxZefQw1scGCi6RXMqNouNSdAUNjH4DCoPkcKBo3mluSI/SWPg9exXY48sD2Tm
 E8WJf5q2SwPiZixFLjgxi7UjyqJhK5B2xh5RgCrvXnP1Kwp/jXYPX+wRce4ShNWWfq67
 H4KF1H+VSyEAk0zCLAfxGREvSMVTghoQFfFoB/7Q9RbO2Jn7AJWeRpvg09/Vgc2ae6fu
 pQ4MUWc9fjnsCMh/xCy5ULzbMW1l+TT0og50JyaScl3qxb1GHoG/ogyO5IcvfPDkpEAb
 GHuQmHaEH22+AubUyS+bLZ0z8G/c3NFkyMWPF2KTNu9r2evid5TlTyt/RemLOLliRnXB
 NxIA==
X-Gm-Message-State: AO0yUKVAlxY6Thq8iIaRP6jy4PCEGyD7MgU/z531ybcMxOvh7WZpFWpt
 di2Qg3cT/XQdHI3t+r4awkYq5tr2rwoQL8hI
X-Google-Smtp-Source: AK7set/+kcd80h2vQXleyqG0reDFOHPU8JU1qjbumAByxDLDzlzrojg/VjIOT6lfDOGhFay66eR4AA==
X-Received: by 2002:a5d:6b10:0:b0:2c5:55cf:b1ab with SMTP id
 v16-20020a5d6b10000000b002c555cfb1abmr8410671wrw.48.1677796870769; 
 Thu, 02 Mar 2023 14:41:10 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 m13-20020a056000008d00b002c54c92e125sm531885wrx.46.2023.03.02.14.41.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:41:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org
Subject: [PATCH v3 01/18] hw/ide/piix: Expose output IRQ as properties for
 late object population
Date: Thu,  2 Mar 2023 23:40:41 +0100
Message-Id: <20230302224058.43315-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/piix.c         | 14 ++++++++++++--
 include/hw/ide/piix.h |  4 ++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 41d60921e3..a36dac8469 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -121,6 +121,13 @@ static void piix_ide_reset(DeviceState *dev)
     pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
 }
 
+static void piix_ide_initfn(Object *obj)
+{
+    PCIIDEState *dev = PCI_IDE(obj);
+
+    qdev_init_gpio_out_named(DEVICE(obj), dev->isa_irq, "ide-irq", 2);
+}
+
 static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
 {
     static const struct {
@@ -133,6 +140,7 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
     };
     int ret;
 
+    qemu_irq irq_out = d->isa_irq[i] ? : isa_get_irq(NULL, port_info[i].isairq);
     ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
     ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
                           port_info[i].iobase2);
@@ -141,7 +149,7 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
                          object_get_typename(OBJECT(d)), i);
         return false;
     }
-    ide_bus_init_output_irq(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
+    ide_bus_init_output_irq(&d->bus[i], irq_out);
 
     bmdma_init(&d->bus[i], &d->bmdma[i], d);
     d->bmdma[i].bus = &d->bus[i];
@@ -162,7 +170,7 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
 
-    for (unsigned i = 0; i < 2; i++) {
+    for (unsigned i = 0; i < ARRAY_SIZE(d->isa_irq); i++) {
         if (!pci_piix_init_bus(d, i, errp)) {
             return;
         }
@@ -199,6 +207,7 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
 static const TypeInfo piix3_ide_info = {
     .name          = TYPE_PIIX3_IDE,
     .parent        = TYPE_PCI_IDE,
+    .instance_init = piix_ide_initfn,
     .class_init    = piix3_ide_class_init,
 };
 
@@ -221,6 +230,7 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
 static const TypeInfo piix4_ide_info = {
     .name          = TYPE_PIIX4_IDE,
     .parent        = TYPE_PCI_IDE,
+    .instance_init = piix_ide_initfn,
     .class_init    = piix4_ide_class_init,
 };
 
diff --git a/include/hw/ide/piix.h b/include/hw/ide/piix.h
index ef3ef3d62d..533d24d408 100644
--- a/include/hw/ide/piix.h
+++ b/include/hw/ide/piix.h
@@ -1,6 +1,10 @@
 #ifndef HW_IDE_PIIX_H
 #define HW_IDE_PIIX_H
 
+/*
+ * QEMU interface:
+ *  + named GPIO outputs "ide-irq": asserted by each IDE channel
+ */
 #define TYPE_PIIX3_IDE "piix3-ide"
 #define TYPE_PIIX4_IDE "piix4-ide"
 
-- 
2.38.1


