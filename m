Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974F96EB9E0
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 17:09:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqEqA-0001yk-0O; Sat, 22 Apr 2023 11:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq7-0001xp-Nx; Sat, 22 Apr 2023 11:07:51 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq6-0005CV-10; Sat, 22 Apr 2023 11:07:51 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-508418b6d59so4837243a12.3; 
 Sat, 22 Apr 2023 08:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682176066; x=1684768066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c3NlfVN1e4CUbSX8ASIf+P0h+04YA8+XY04IMvAW5tA=;
 b=p5qzta5i4ArlWgs75ZJsEl8zVx9/Pm4bNlFEL8GO+yQHJDgxO5mNgkQJ0+OottP+oY
 2xPcCo7gG828alTd1I1SY5lHWVLqUCE6mRZQmGXLZR14WYh6/XcbmK4QMAoadHcU1axN
 ddbDs/Mj3M4ueKm8PR0sWn00+lEDWdVtDmBlNFmQd3DdPKtcS73zNSuvIO2GZltVvnAI
 6OwzlH/AfhhbXow+Z6mkHtZa28muS7yPqkIflRIx4teVWlbm0puVu3ly2ftbPa8PNLoC
 M3NR5gF03BNuenvnrXJOyTGUJvl4vKx855Xtg3W+Opi4R0CQPSayAesju8W9TFeLenE0
 mKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682176066; x=1684768066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c3NlfVN1e4CUbSX8ASIf+P0h+04YA8+XY04IMvAW5tA=;
 b=FHKvVLYCihEpO/X81aVVci6899JfkE3OYDmv2uA2vIvi11PqxQhsn9CRI3MURdiHBd
 W5Q8nls600nW7j042sMPihEabT/BoXmt652oEPI6wkyvNy1CyDyOqQ2StBZ6zxc5udl0
 8N35h9tm41PNebDfv+drQBMNajeGmw+tea5QVnXr/bhdDQMJj/cdSrRqgk9r/MTBbs7A
 piNzTfSnVm6PkPR1CEGXlhG6VeWCOgoqLdGwbxqNQeY6GAx8Do0/+//PTk4S5/OBjuMM
 PTaf5JGhEk+Lg/L9PcrZWWn/pcVjzEmz1+vYMQVAoXewceGoHmC5LKg3ps3wr3AKI+U4
 4hgA==
X-Gm-Message-State: AAQBX9eCKTBSlKtqmQuxFCK2XEHz+r8/rYXu3cliKRRidDgq/nir+l/9
 82Q5njV06tdPsMyE9JjnKrq+kKiBpdY=
X-Google-Smtp-Source: AKy350bi4nwRTWgUkixaf/swGdaGuhUyS00Ztalg7g1DE/Pnu97Gkhh4zo86F2lCzeF0EjEws2hSsA==
X-Received: by 2002:a17:906:3698:b0:958:5c21:3fa7 with SMTP id
 a24-20020a170906369800b009585c213fa7mr959315ejc.25.1682176066704; 
 Sat, 22 Apr 2023 08:07:46 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-191-017-015.77.191.pool.telefonica.de. [77.191.17.15])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906844700b0094f7b713e40sm3300108ejy.126.2023.04.22.08.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 08:07:46 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 10/13] hw/ide/piix: Reuse PCIIDEState::{cmd,data}_ops
Date: Sat, 22 Apr 2023 17:07:25 +0200
Message-Id: <20230422150728.176512-11-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422150728.176512-1-shentey@gmail.com>
References: <20230422150728.176512-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Now that PCIIDEState::{cmd,data}_ops are initialized in the base class
constructor there is an opportunity for PIIX to reuse these attributes. This
resolves usage of ide_init_ioport() which would fall back internally to using
the isabus global due to NULL being passed as ISADevice by PIIX.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/piix.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index a3a15dc7db..406a67fa0f 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -104,34 +104,32 @@ static void piix_ide_reset(DeviceState *dev)
     pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
 }
 
-static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus *isa_bus,
-                              Error **errp)
+static void pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus *isa_bus)
 {
     static const struct {
         int iobase;
         int iobase2;
         int isairq;
     } port_info[] = {
-        {0x1f0, 0x3f6, 14},
-        {0x170, 0x376, 15},
+        {0x1f0, 0x3f4, 14},
+        {0x170, 0x374, 15},
     };
-    int ret;
+    MemoryRegion *address_space_io = pci_address_space_io(PCI_DEVICE(d));
 
     ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-    ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
-                          port_info[i].iobase2);
-    if (ret) {
-        error_setg_errno(errp, -ret, "Failed to realize %s port %u",
-                         object_get_typename(OBJECT(d)), i);
-        return false;
-    }
+    memory_region_add_subregion(address_space_io, port_info[i].iobase,
+                                &d->data_ops[i]);
+    /*
+     * PIIX forwards the last byte of cmd_ops to ISA. Model this using a low
+     * prio so competing memory regions take precedence.
+     */
+    memory_region_add_subregion_overlap(address_space_io, port_info[i].iobase2,
+                                        &d->cmd_ops[i], -1);
     ide_bus_init_output_irq(&d->bus[i],
                             isa_bus_get_irq(isa_bus, port_info[i].isairq));
 
     bmdma_init(&d->bus[i], &d->bmdma[i], d);
     ide_bus_register_restart_cb(&d->bus[i]);
-
-    return true;
 }
 
 static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
@@ -160,9 +158,7 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     }
 
     for (unsigned i = 0; i < 2; i++) {
-        if (!pci_piix_init_bus(d, i, isa_bus, errp)) {
-            return;
-        }
+        pci_piix_init_bus(d, i, isa_bus);
     }
 }
 
-- 
2.40.0


