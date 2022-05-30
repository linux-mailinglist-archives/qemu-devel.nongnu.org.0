Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F329537A5F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 14:09:30 +0200 (CEST)
Received: from localhost ([::1]:38654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nveDB-0004Pq-ML
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 08:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdZU-0000zI-08
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:28:28 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:43616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdZS-0001M9-8D
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:28:27 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y189so10318669pfy.10
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 04:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1+liANe7HLDwmKcJ37O0LsowkCA+nP93jC+zpYHLnjY=;
 b=khW9hUteUv2ORoiT6HU0XZTvGcesFwdveMzbiW+iP0C/vmeQ1TAfqiifB/K2sMjJDZ
 ncR9rEWCcdg0UJD0bbbpiaVwmLZz06RBqihrgwCh7FZKYYdquryUrqfWatU6fsj5PRDs
 grHLhRvWOy32pk3rsm41A3G+Bqh3lxzH35EnpdweiLXF+YwW1pScZPbrZpsxKHC5NEIg
 fxBbpmLNLbI/wAACapTclWHmAwbJOJt4Lh4NpMLrZl7T0g8JSuOxv2WsrsF/NoGrcAY9
 haQHVP9cSfRP3Yt8aKzxccirNCbzxRN2XUy4VgbLl2JNwnh17f6xeFxGJGDUrN4PA31d
 HXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1+liANe7HLDwmKcJ37O0LsowkCA+nP93jC+zpYHLnjY=;
 b=R+//aA02Pd52wc/Tl+Sz+/EkB5So5viqf8zxWN4iSjeoKC1vUSkHmNf92AekkFXlGI
 QJtIqGlgtDXfVlU418W1MHjWxTNkp2uAuzPBQQOhWgp+WrsjlQpLULLQ+7Zh4Va0Llci
 rNF2ThcpjkFv5lSjycEACle9Ouue4h7THi5RQSB81eoc7TWjUOmm61dD+GN6oLySaGjK
 C3pqmyKGRzjHBPq9GgaF3lQxK2pyMKyKi4234p2DFlkGscCSdNHFNjbFxGTzYoHrCFQd
 uXDT/IoNUXxBGoMJt+upAXpAPmcVF6srPrzUn5msQ6+/VD1TvWeMvNvvHvZT8ATGg68M
 y4uw==
X-Gm-Message-State: AOAM530/ADnK/lUASuEaPEgM/8PmmV3DPN8CINO1SaCLVaDTj0WUixiv
 wDBuOA1pppB23oZXXXt22Bg=
X-Google-Smtp-Source: ABdhPJwhVaX/+ZAentMN+Lo496oDTiPLLrLF29JyTYi657StmsFTzkyF6wnAzxunWKjobkxtM/k87A==
X-Received: by 2002:a65:6c12:0:b0:3db:a518:ff1b with SMTP id
 y18-20020a656c12000000b003dba518ff1bmr47089858pgu.315.1653910105522; 
 Mon, 30 May 2022 04:28:25 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a635501000000b003f285ba5a9fsm8330168pgb.57.2022.05.30.04.28.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 04:28:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 06/11] hw/acpi/piix4: rename piix4_pm_init() to
 piix4_pm_initfn()
Date: Mon, 30 May 2022 13:27:13 +0200
Message-Id: <20220530112718.26582-7-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
References: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

When QOMifying a device it is typical to use _init() as the suffix for an
instance_init function, however this name is already in use by the legacy
piix4_pm_init() wrapper function. Eventually the wrapper function will be
removed, but for now rename it to piix4_pm_initfn() to avoid a naming
collision.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220528091934.15520-7-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/piix4.c               | 6 +++---
 hw/i386/pc_piix.c             | 6 +++---
 hw/isa/piix4.c                | 6 +++---
 include/hw/southbridge/piix.h | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index c4cfb75020..418ec4ee56 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -497,9 +497,9 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
     piix4_pm_add_properties(s);
 }
 
-PIIX4PMState *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                            qemu_irq sci_irq, qemu_irq smi_irq,
-                            bool smm_enabled)
+PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
+                              qemu_irq sci_irq, qemu_irq smi_irq,
+                              bool smm_enabled)
 {
     PCIDevice *pci_dev;
     DeviceState *dev;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 891692616b..d2ab9f966c 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -284,9 +284,9 @@ static void pc_init1(MachineState *machine,
         PIIX4PMState *piix4_pm;
 
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
-        piix4_pm = piix4_pm_init(pci_bus, piix3_devfn + 3, 0xb100,
-                                 x86ms->gsi[9], smi_irq,
-                                 x86_machine_is_smm_enabled(x86ms));
+        piix4_pm = piix4_pm_initfn(pci_bus, piix3_devfn + 3, 0xb100,
+                                   x86ms->gsi[9], smi_irq,
+                                   x86_machine_is_smm_enabled(x86ms));
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         /* TODO: Populate SPD eeprom data.  */
         smbus_eeprom_init(pcms->smbus, 8, NULL, 0);
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 7d9bedd1bb..33a7015ea3 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -311,9 +311,9 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 
     pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
     if (smbus) {
-        pms = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
-                            qdev_get_gpio_in_named(dev, "isa", 9),
-                            NULL, 0);
+        pms = piix4_pm_initfn(pci_bus, devfn + 3, 0x1100,
+                              qdev_get_gpio_in_named(dev, "isa", 9),
+                              NULL, 0);
         *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pms), "i2c"));
     }
 
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index a362ec7484..f75a4adf5f 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -16,9 +16,9 @@
 #include "qom/object.h"
 #include "hw/acpi/piix4.h"
 
-PIIX4PMState *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                            qemu_irq sci_irq, qemu_irq smi_irq,
-                            bool smm_enabled);
+PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
+                              qemu_irq sci_irq, qemu_irq smi_irq,
+                              bool smm_enabled);
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
-- 
2.36.1


