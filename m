Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E725662CDB
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:35:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvtT-0002Y0-S5; Mon, 09 Jan 2023 12:25:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtQ-0002V4-IH; Mon, 09 Jan 2023 12:25:04 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtL-00010R-Un; Mon, 09 Jan 2023 12:25:03 -0500
Received: by mail-ej1-x634.google.com with SMTP id cf18so15589255ejb.5;
 Mon, 09 Jan 2023 09:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KdSAwJSzEqA+I9v6UkRG9aJr/cFnqZhXxsUKNpwRs1s=;
 b=R+VnQQ6LUC+pO4dLmxA3NqVLJS5HBrGbqhdTvfXXOlQn5/6LcIX5N9RBFya7gIX7Oq
 JY5ULQRoySzHrZqOIJ3v2Aiz4tZmZ+7tcvaZHZ5h3tsKW6YEN2xgMMR/0U6gxJqRfoFy
 woEJA5RW01iv/R/+MAo2gCDFE39+UMQ7Eudl6WjL7IhmRM7YDTV0BcYRNhpTx8wYfO1/
 /y456Q6U7ESNaUyTMUJPIQF+Ldm4UK+MvpOH0+63bGvtgfHvIISpc3CqOBT3OaSradoW
 0HeKrrV2Xj0Xo/L2now4YBEQPmOh0zXWcvjtGbcPBgYF/EpHj0qKF2H+kqbtX2os+bPG
 V9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KdSAwJSzEqA+I9v6UkRG9aJr/cFnqZhXxsUKNpwRs1s=;
 b=KvIL8Up+zHArphPCJe68Qp2sed1Aw2ZviDmfYVogQYlR68WfkSAFhm8nlJNiIIt4r6
 gYsCND0jJMEKkltlkgx7xOPwf1RmLgt8Ly9dfa3hQOsZSjgypncw18b0aC1kE8Im/Av5
 mDCamCq13nPQvGnPmITg9VHXfiCuJR5x7Ybqn3HBLwtkfZTfaE2Tr+aZDuf+B3TPmWWp
 u7tBe2wj4kLfIvi6NKUhdpsS+1lI30A4lnJbVFaUqEbxVmBawqL2FEGFNtw0CuwTNbjQ
 6Fow+EnPG+NgZwFFcHeUZZrQuIDVp4jL2KgQTLPBShAN5U59ZWbgbN8JbtFM/zKlWgTR
 P/lA==
X-Gm-Message-State: AFqh2krFCbA19e7iSd7M4gvveeUz5RaQ2NboXDLcwqwmTgnLV/E/A2AT
 p3XPfCYnteBsz4Upm9gFzY0vu+iAV2f8Sg==
X-Google-Smtp-Source: AMrXdXugRPYnRnPa4GA0niab/ga9uEHI0s3eQN8mgdOtvdpf/8NRVad6NbXEZWAmHfPUZVyxbFmPqg==
X-Received: by 2002:a17:907:a488:b0:84d:2171:d79 with SMTP id
 vp8-20020a170907a48800b0084d21710d79mr11353631ejc.54.1673285097362; 
 Mon, 09 Jan 2023 09:24:57 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:24:57 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 05/33] hw/isa/piix3: Decouple INTx-to-LNKx routing which is
 board-specific
Date: Mon,  9 Jan 2023 18:23:18 +0100
Message-Id: <20230109172347.1830-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

pci_map_irq_fn's in general seem to be board-specific. So move PIIX3's
pci_slot_get_pirq() to board code to not have PIIX3 make assuptions
about its board.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_piix.c | 15 +++++++++++++++
 hw/isa/piix3.c    | 13 -------------
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index b48047f50c..bb3b10557f 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -47,6 +47,7 @@
 #include "hw/sysbus.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/xen/xen-x86.h"
+#include "hw/xen/xen.h"
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/piix4.h"
@@ -73,6 +74,17 @@ static const int ide_iobase2[MAX_IDE_BUS] = { 0x3f6, 0x376 };
 static const int ide_irq[MAX_IDE_BUS] = { 14, 15 };
 #endif
 
+/*
+ * Return the global irq number corresponding to a given device irq
+ * pin. We could also use the bus number to have a more precise mapping.
+ */
+static int pc_pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
+{
+    int slot_addend;
+    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
+    return (pci_intx + slot_addend) & 3;
+}
+
 /* PC hardware initialisation */
 static void pc_init1(MachineState *machine,
                      const char *host_type, const char *pci_type)
@@ -216,6 +228,9 @@ static void pc_init1(MachineState *machine,
                               x86ms->below_4g_mem_size,
                               x86ms->above_4g_mem_size,
                               pci_memory, ram_memory);
+        pci_bus_map_irqs(pci_bus,
+                         xen_enabled() ? xen_pci_slot_get_pirq
+                                       : pc_pci_slot_get_pirq);
         pcms->bus = pci_bus;
 
         pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 666e794f77..283b971ec4 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -79,17 +79,6 @@ static void piix3_set_irq(void *opaque, int pirq, int level)
     piix3_set_irq_level(piix3, pirq, level);
 }
 
-/*
- * Return the global irq number corresponding to a given device irq
- * pin. We could also use the bus number to have a more precise mapping.
- */
-static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
-{
-    int slot_addend;
-    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
-    return (pci_intx + slot_addend) & 3;
-}
-
 static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 {
     PIIX3State *piix3 = opaque;
@@ -385,7 +374,6 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
     }
 
     pci_bus_irqs(pci_bus, piix3_set_irq, piix3, PIIX_NUM_PIRQS);
-    pci_bus_map_irqs(pci_bus, pci_slot_get_pirq);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
 }
 
@@ -421,7 +409,6 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
      * These additional routes can be discovered through ACPI.
      */
     pci_bus_irqs(pci_bus, xen_piix3_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
-    pci_bus_map_irqs(pci_bus, xen_pci_slot_get_pirq);
 }
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
-- 
2.39.0


