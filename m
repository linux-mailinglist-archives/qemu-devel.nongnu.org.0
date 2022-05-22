Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A9553063D
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 23:34:50 +0200 (CEST)
Received: from localhost ([::1]:51232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nstDt-00073Y-Jb
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 17:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nst4U-0002zf-Up; Sun, 22 May 2022 17:25:07 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:36447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nst4T-0005bD-31; Sun, 22 May 2022 17:25:06 -0400
Received: by mail-ed1-x52b.google.com with SMTP id fd25so16888746edb.3;
 Sun, 22 May 2022 14:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ePaLtJNv3jkjrnLivwDrYW8J/72ZKgoiZBz5G23jZY=;
 b=hsFgS/Vjn9JLG8IMB8IoDBTw7kL/jzzoU+FXT8v27X77g3BjsrhX9uVt66sNBR9i6d
 cz7bCFPls1tXbX9+ZRDFovW+yb1OY3tbEusNoFvdn26eF4S3ziUGBGFWS4PMJit9ZIeI
 NXkn3A1c4epQWDcQC1kXvEFHsm2fU8AyrjlW3Tpn/rXM3H1pM+rBS9zn3U72zVn0PWCg
 yXY/6AoS3bckLNXfwHcbdNemj3PcjAwA6fFybxw7FbzrxSqrkgft2Li1q4yUXHFbE8fh
 ufepWYpiYMnshmvWWb2kO04Q98Pmjh//hmEXVwRgGN7XfnRjxisX51y+78jXqWrP8xR2
 h8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ePaLtJNv3jkjrnLivwDrYW8J/72ZKgoiZBz5G23jZY=;
 b=ZSK58cm8sRsq6wuYxzfmhYc0xuuyXkxz0eOHOs4nap4k87LlfF3vmzmmiH/N9qcEJi
 P+HwG8LSArgK+X+bAuZj5ubaHLqZESdlBSxW9LO6A/PHq9AKw3kCGVVN0RP2RywAjUH+
 tkHsatUPYHLv4EzYJJcpddHK5OkManoog6vICr2I408SXF3WCN+bi866Fvy72cZQz+xy
 s8MD5UuVD87Xq659VRl7qG6lydWAV2sHJf2khDKgWpecRfGBf5WiJEGWxAXJugcK/aSs
 2EdmdzvTrvyl35JervdBwcSxH6ftahTRTyDY5s5is3xHq54wfCpWUoEkc+ysWPCWKUnZ
 8Zrw==
X-Gm-Message-State: AOAM531rdgkm4nReWBFaMm0Txl1+dI4acBrUiqxBmU9C1Waox01Njrfl
 F6l57c/B+/4OTQwUWUgp3fjn5uqRAMg=
X-Google-Smtp-Source: ABdhPJwWKDIzsimJyaDRbIAhMz7uoV+GbY/E847Kh+Jddl0YCpJ5uSNYyNjiZabxMFysEpUvg3Lcig==
X-Received: by 2002:aa7:dd07:0:b0:42a:eeba:a0a8 with SMTP id
 i7-20020aa7dd07000000b0042aeebaa0a8mr21092476edv.371.1653254703261; 
 Sun, 22 May 2022 14:25:03 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-075-232.78.54.pool.telefonica.de. [78.54.75.232])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a170907270400b006f3ef214e22sm5418768ejk.136.2022.05.22.14.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 14:25:02 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH v2 4/6] hw/isa/piix{3,
 4}: Factor out ISABus retrieval from create() functions
Date: Sun, 22 May 2022 23:24:29 +0200
Message-Id: <20220522212431.14598-5-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220522212431.14598-1-shentey@gmail.com>
References: <20220522212431.14598-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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

Modernizes the code and even saves a few lines.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/i386/pc_piix.c             | 3 ++-
 hw/isa/piix3.c                | 3 +--
 hw/isa/piix4.c                | 6 +-----
 hw/mips/malta.c               | 3 ++-
 include/hw/southbridge/piix.h | 4 ++--
 5 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 578e537b35..4d4b83a27d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -206,9 +206,10 @@ static void pc_init1(MachineState *machine,
                               pci_memory, ram_memory);
         pcms->bus = pci_bus;
 
-        piix3 = piix3_create(pci_bus, &isa_bus);
+        piix3 = piix3_create(pci_bus);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
+        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
     } else {
         pci_bus = NULL;
         i440fx_state = NULL;
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index de532cc692..c6ff7795f4 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -400,7 +400,7 @@ static void piix3_register_types(void)
 
 type_init(piix3_register_types)
 
-PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
+PIIX3State *piix3_create(PCIBus *pci_bus)
 {
     PIIX3State *piix3;
     PCIDevice *pci_dev;
@@ -409,7 +409,6 @@ PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
 
     pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
     piix3 = PIIX3_PCI_DEVICE(pci_dev);
-    *isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
 
     return piix3;
 }
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 134d23aea7..4968c69da9 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -301,7 +301,7 @@ static void piix4_register_types(void)
 
 type_init(piix4_register_types)
 
-DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
+DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
 {
     PCIDevice *pci;
     DeviceState *dev;
@@ -311,10 +311,6 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                           TYPE_PIIX4_PCI_DEVICE);
     dev = DEVICE(pci);
 
-    if (isa_bus) {
-        *isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
-    }
-
     if (smbus) {
         *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
                                qdev_get_gpio_in_named(dev, "isa", 9),
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9ffdc5b8f1..e446b25ad0 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1399,7 +1399,8 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    dev = piix4_create(pci_bus, &isa_bus, &smbus);
+    dev = piix4_create(pci_bus, &smbus);
+    isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
 
     /* Interrupt controller */
     qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 4d17400dfd..0bec7f8ca3 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -74,8 +74,8 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
 #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
 #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
 
-PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
+PIIX3State *piix3_create(PCIBus *pci_bus);
 
-DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus);
+DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus);
 
 #endif
-- 
2.36.1


