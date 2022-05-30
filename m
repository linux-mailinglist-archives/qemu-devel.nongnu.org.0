Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D80537A52
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 14:03:19 +0200 (CEST)
Received: from localhost ([::1]:53200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nve7C-0003Pl-7A
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 08:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdZs-0001G7-5C
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:28:59 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdZm-0001Rm-Cl
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:28:49 -0400
Received: by mail-pg1-x52c.google.com with SMTP id g184so9932342pgc.1
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 04:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JHw0uvDnn6jauPFRpGFE232XofQUpO0l/XT6x5dmgwI=;
 b=kuTJ6SF3l/EznSJEMwuzTQz6XUA8zGeVKLsba1a+yzaXm7XFi/iTvfwhOa9WTSTy/m
 fEFemxufu7WDCfO/nYMuyqDAaEfW1AI0iTVybM0laLZnc/81r2+zmzpm1kwbncgwcRg/
 8FWSonVkZDv4M9icqzxOzSD+GTxvwMyQ8nQ+1pz9tNPvC0NBpBsAI+ND5B2s974h8Z+O
 p7uvUj9ssuxmEu/xGKT0lNaWfkzb0/kUtpOBhLE3FtydzFd2J9UMT981CwxFOBnKpYMD
 Un6m2SL9HRBmfWt9i5A8WVkYXPFW8cNRLk/Jl5L5r05Git/vWidQlePHNE31Z8r3n4kQ
 DGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JHw0uvDnn6jauPFRpGFE232XofQUpO0l/XT6x5dmgwI=;
 b=vmbvvkrEnOMxLwb+jeZTkAdcyXEMOwF90YQ9cHtdTeVmd34LjsOqcyh8Nm2D49qzHN
 T0WB5OsZos9WYfVcrjl9L7R2WtIgx3S8KsHBnBU/eg/JK0b5QQo1fwggxDkTA3SMSfsJ
 E8lzFeLUf2okkMJr67W/eBHjFuhhExthk8mDMiXsqj4uGA0Y3+Mo5c10hkmhUINmxEBU
 g+bSf01sZ7WyzNZ3B75eS8EXOk+NQr2aN2LSb3YGVjBweLRxVmfP29IErm/tE3FrFs3U
 IBj3Bis/+GxV0JEs3KozEc0WiPqY08yb5CT8019tMkexEhntynlla8NwSeYAul/VLevz
 1Ftw==
X-Gm-Message-State: AOAM532MAG7jzOaD90zJm+oLZrIG1NYDmbXLOZ8vOXfOMmolvk+vvmCh
 kXbWXy2yfbqCv4GMiNyAi1U=
X-Google-Smtp-Source: ABdhPJxpaTy89KCRurLU8GpwXGQZj8/6GVVKAYtsMtJxn5V7FCVcJ8E48B7GilxfLw1vwIT9c33zCA==
X-Received: by 2002:a05:6a00:1897:b0:518:8bc7:9a82 with SMTP id
 x23-20020a056a00189700b005188bc79a82mr42914339pfh.26.1653910125157; 
 Mon, 30 May 2022 04:28:45 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a17090aa59000b001e28e80a8d6sm5381484pjq.38.2022.05.30.04.28.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 04:28:44 -0700 (PDT)
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
Subject: [PATCH v2 08/11] hw/acpi/piix4: use qdev gpio to wire up smi_irq
Date: Mon, 30 May 2022 13:27:15 +0200
Message-Id: <20220530112718.26582-9-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
References: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52c.google.com
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

Initialize the SMI IRQ in piix4_pm_init().

The smi_irq can now be wired up directly using a qdev gpio instead
of having to set the IRQ externally in piix4_pm_initfn().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220528091934.15520-10-mark.cave-ayland@ilande.co.uk>
[PMD: Partially squash 20220528091934.15520-8-mark.cave-ayland@ilande.co.uk]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/piix4.c               | 4 ++--
 hw/i386/pc_piix.c             | 3 ++-
 hw/isa/piix4.c                | 2 +-
 include/hw/southbridge/piix.h | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index fe5ec0a723..32033bc9d7 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -502,10 +502,11 @@ static void piix4_pm_init(Object *obj)
     PIIX4PMState *s = PIIX4_PM(obj);
 
     qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
+    qdev_init_gpio_out_named(DEVICE(obj), &s->smi_irq, "smi-irq", 1);
 }
 
 PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                              qemu_irq smi_irq, bool smm_enabled)
+                              bool smm_enabled)
 {
     PCIDevice *pci_dev;
     DeviceState *dev;
@@ -517,7 +518,6 @@ PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
     qdev_prop_set_bit(dev, "smm-enabled", smm_enabled);
 
     s = PIIX4_PM(dev);
-    s->smi_irq = smi_irq;
 
     pci_realize_and_unref(pci_dev, bus, &error_fatal);
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0662bf44a9..683ec39b80 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -284,9 +284,10 @@ static void pc_init1(MachineState *machine,
         PIIX4PMState *piix4_pm;
 
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
-        piix4_pm = piix4_pm_initfn(pci_bus, piix3_devfn + 3, 0xb100, smi_irq,
+        piix4_pm = piix4_pm_initfn(pci_bus, piix3_devfn + 3, 0xb100,
                                    x86_machine_is_smm_enabled(x86ms));
         qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
+        qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         /* TODO: Populate SPD eeprom data.  */
         smbus_eeprom_init(pcms->smbus, 8, NULL, 0);
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 0b6ea22143..775e15eb20 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -311,7 +311,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 
     pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
     if (smbus) {
-        pms = piix4_pm_initfn(pci_bus, devfn + 3, 0x1100, NULL, 0);
+        pms = piix4_pm_initfn(pci_bus, devfn + 3, 0x1100, 0);
         qdev_connect_gpio_out(DEVICE(pms), 0,
                               qdev_get_gpio_in_named(dev, "isa", 9));
         *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pms), "i2c"));
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 105d158f78..b69e0dfb04 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -17,7 +17,7 @@
 #include "hw/acpi/piix4.h"
 
 PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                              qemu_irq smi_irq, bool smm_enabled);
+                              bool smm_enabled);
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
-- 
2.36.1


