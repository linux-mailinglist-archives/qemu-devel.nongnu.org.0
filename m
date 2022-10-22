Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A31609993
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:01:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhTv-0008H9-CD
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5Z-0007KZ-Ts; Sat, 22 Oct 2022 11:07:05 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5X-0002Ex-O8; Sat, 22 Oct 2022 11:07:05 -0400
Received: by mail-ed1-x535.google.com with SMTP id l22so16108163edj.5;
 Sat, 22 Oct 2022 08:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJFanPG6Dom+OOVnb+H9BrqEGSCa/O3aKDM5m7Y77qA=;
 b=qod+5162ymnRd2jvZL24H4AlE6V2Zuq87FLbA/gJ4y6xGP5OuBb8r+paHhhH9wTimS
 lTxgrIV5q6o80JLVdIKdB1UemAvCcq3ogg2RjROzxJJ9og2lPRJBtEXmC1oeZkZr/Aha
 TJQo1EsHBdZfXU7URhfRvzygeyc5PBKm2K3Ykj8M0MF/dUBY7j74ZeQ0Q8QcgN2Q4ux9
 y0XH+KT5wNrQveNd00/pCdIsTBq8Jfe5+5AsPCHceOCqYZByO23G8txjGvh+ciDZcyau
 FW+EmWf0+I/jkz12ngeaGtTIz3ZWL6R4abc5WwePoL+hRp/crgtMncXVS4PnGg0rnzjB
 DTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJFanPG6Dom+OOVnb+H9BrqEGSCa/O3aKDM5m7Y77qA=;
 b=c4YQndfVx+m45zg6JVogIsJupjK0+8y2R5vNvwm3o5WfrAdePCPwajNREGjK6SweW7
 gTF+2mJlxjOWxm1c49YaoepZ1ywi6GMGXXIjio+oZ5xCy6bAb4EW84sfj4v9hcAQrBSD
 S6zXL01fGc3v6h4pTAVRpB5iGOse6x2c0H4VPSZM156kkIO3e2ue45INJkYbxKDATgOE
 hCEycDPVlrLIIVYMttkdLm38zziztZZBy4AVZ2AuVU3zbqsj+3ubT92lFrZ9/cl0xdI5
 6ETmxSdEjPXoaZeu5WvR2O93B1owPLhmarP30DhdLPuWSYkB4uMscsmT+SOtmsAPHj00
 9p4A==
X-Gm-Message-State: ACrzQf19p03Rw9h9SaDQlvJCRkiM0MGsjr/ei1LZlCDQotm7hlZVYpGY
 YL8bSsM7JPLWO7qV2SZ65gsS+frt2SHWmg==
X-Google-Smtp-Source: AMsMyM4id+kj4HX88VqemgqLrHjsC1rJmuZUCRXj8rIXePeoeNKAqN/7TrF+EA0BGsjpw2vNtJWvsA==
X-Received: by 2002:a17:907:7b86:b0:78d:cb21:da0c with SMTP id
 ne6-20020a1709077b8600b0078dcb21da0cmr20857331ejc.24.1666451222460; 
 Sat, 22 Oct 2022 08:07:02 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:07:01 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 28/43] hw/isa/piix4: Move pci_ide_create_devs() call to
 board code
Date: Sat, 22 Oct 2022 17:04:53 +0200
Message-Id: <20221022150508.26830-29-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the VIA south bridges there was a comment to have the call in board code.
Move it there for PIIX4 as well for consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c  |  1 -
 hw/mips/malta.c | 10 ++++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 4b8dece257..a7389ff193 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -257,7 +257,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
         return;
     }
-    pci_ide_create_devs(PCI_DEVICE(&s->ide));
 
     /* USB */
     qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 0ec2ac2eaf..a4b866a2cf 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -39,7 +39,7 @@
 #include "hw/pci/pci.h"
 #include "qemu/log.h"
 #include "hw/mips/bios.h"
-#include "hw/ide.h"
+#include "hw/ide/pci.h"
 #include "hw/irq.h"
 #include "hw/loader.h"
 #include "elf.h"
@@ -1402,11 +1402,13 @@ void mips_malta_init(MachineState *machine)
     /* Southbridge */
     piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
                                             TYPE_PIIX4_PCI_DEVICE);
-    dev = DEVICE(piix4);
-    isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
+    isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
+
+    dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "ide"));
+    pci_ide_create_devs(PCI_DEVICE(dev));
 
     /* Interrupt controller */
-    qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
+    qdev_connect_gpio_out_named(DEVICE(piix4), "intr", 0, i8259_irq);
 
     /* generate SPD EEPROM data */
     dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "pm"));
-- 
2.38.1


