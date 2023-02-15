Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4576980A5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:19:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKTA-0006zO-RT; Wed, 15 Feb 2023 11:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKT1-0006y5-0F
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:12 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKSw-0008Fx-DB
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:10 -0500
Received: by mail-wm1-x333.google.com with SMTP id r18so13711785wmq.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tln1lJc5WLQnNDFCja/omy1A0TTOLj6p3aQJ0P1Gb3g=;
 b=mD/DHKDDPVoqDx2HsPpa56A8KR0aKPRd+Q71camruv7ltmphAld2I6/9ZV3lEjbLpp
 1022bhXAVVDus0hJclTdw2CXSJxVryEwbgFSoDCYl289W34gJ52Z5ehvlvtCIU6I8uC7
 SRqA0PD6wLQqiRPA5bQOeMvuEEsnVfFtCMtBRHLCSRjhanjO2JVvhyZn6Dvy0GzeMvlw
 S0p8j53Ys+J1H1cBzQu2FvSKpI4GEQtfVOQOBw1EyXsdyQAD1HjkMgnD6dVn5M78wCwb
 xywudPq5xVOA6c1ndfxv1TKf2VCHNZKmesRD2o8bxNyaq4H2ig4WE10Dt6Cgc6xvAElj
 x6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tln1lJc5WLQnNDFCja/omy1A0TTOLj6p3aQJ0P1Gb3g=;
 b=XAFTPSFQ/bil+qufgztIleznBQCzJyzoXCNR09TJPoGrTxQ3eqM0qcPnH7T5mZ7g1r
 4o64um3JRxtr4CWF672HH/rxUKD8IvzglXMTggwCdhKOAyMxnRWalwai0En23vkgb6Uz
 G/XRz71C9D+qucnfkMPSi4xNly+XmnL6pi8NJFFLZqQXnyNWU+L5Waojf15LiRlTJ7/b
 /Ggz5hM7/f4fzYt7+A+NK1bajNz4MiSTmGJsUoy2gCZyITE5Ph1gToF7mRoNmP+ZoRAb
 CQHUq71X3P1vKYvOjAhAek/p18QWhjN6+gL8+Qr8KvK/n/scRAG3brUoSjqZdMqMcnYT
 VUXg==
X-Gm-Message-State: AO0yUKWnAph5LJ2oIuFaxilz6wc2EWf5w9OscAPPx31Oercuzn76kSSa
 7QYjJx82tt+EwrPfaZIl7xwITpHWroe3f31l
X-Google-Smtp-Source: AK7set/odeltcmDXKpDsJ7GZOjcqhr/w8JDVEhuL9NLog392FB+wi7iopcOZdvVQFK57HagB3U6APw==
X-Received: by 2002:a05:600c:705:b0:3df:f9e9:7600 with SMTP id
 i5-20020a05600c070500b003dff9e97600mr2483452wmn.25.1676477824797; 
 Wed, 15 Feb 2023 08:17:04 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r128-20020a1c2b86000000b003dff2b493c8sm2662781wmr.36.2023.02.15.08.17.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 08:17:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 04/18] hw/ide/piix: Expose output IRQ as properties for
 late object population
Date: Wed, 15 Feb 2023 17:16:27 +0100
Message-Id: <20230215161641.32663-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161641.32663-1-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
 include/hw/ide/pci.h  |  1 +
 include/hw/ide/piix.h |  4 ++++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 41d60921e3..9d876dd4a7 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -121,6 +121,13 @@ static void piix_ide_reset(DeviceState *dev)
     pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
 }
 
+static void piix_ide_initfn(Object *obj)
+{
+    PCIIDEState *dev = PCI_IDE(obj);
+
+    qdev_init_gpio_out_named(DEVICE(obj), dev->irq, "ide-irq", 2);
+}
+
 static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
 {
     static const struct {
@@ -133,6 +140,7 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
     };
     int ret;
 
+    qemu_irq irq_out = d->irq[i] ? : isa_get_irq(NULL, port_info[i].isairq);
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
+    for (unsigned i = 0; i < ARRAY_SIZE(d->irq); i++) {
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
 
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index 7b5e3f6e1c..548e539add 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -49,6 +49,7 @@ struct PCIIDEState {
 
     IDEBus bus[2];
     BMDMAState bmdma[2];
+    qemu_irq irq[2];
     uint32_t secondary; /* used only for cmd646 */
     MemoryRegion bmdma_bar;
     MemoryRegion cmd_bar[2];
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


