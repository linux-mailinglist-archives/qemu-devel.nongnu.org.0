Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C104C2E829E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 00:02:53 +0100 (CET)
Received: from localhost ([::1]:54074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6xz-0001Av-U9
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 18:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6m7-0002XJ-B2
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:31 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6m4-0006ri-RB
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:30 -0500
Received: by mail-wm1-x334.google.com with SMTP id r4so8134676wmh.5
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U9pXfDIHDtTAEsuOS9yHHlzE8xYt6k1B0TpokEBN3ro=;
 b=gkrW+y9agX4liAywPUAzeSNFGJcZlPj2rDfi8VKQWmlVzloqmheKNtGfE4W/HIHeah
 9he4YGB04jLffQ4As+a6EY9YST9r+5jffFpVad2PeXB3IUxNUiyS+//FuMGFD1eebwzB
 FSPpndK1ZAKyaNjhSct5/a5LR/6J/5dApEWWqxhTNhtssJcjHNMnOhtrS0B0sHgB6mcB
 xxIriToN0wymOb3io9tCWzlYU9aD7JCE5TKlHjOzqMoa8DzlYISH7fSPWZZA/Wh3+ibP
 oX+TiARavWLwmxtOwi+Dzy5ivJ/Pl/b5du9aF5BAxsH4dGmg+dhFZ+Jf6iiKdsbMquqi
 /5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U9pXfDIHDtTAEsuOS9yHHlzE8xYt6k1B0TpokEBN3ro=;
 b=JXTM1bIRnMUK4EzoXh2c5C2cTh4az/aDiM1ddEoFgBClnxTSdOhqoddDaa9a9lxtHj
 u4NrMG79KjaruUYIu0sUJqMNGIcYyZqNErf3Ervvw67UmCtp+ydVNLh8WDPysQTKbEkg
 elvm3zaqRBkiiYX7KlUNmedjmUQtf5D7pEAhDdnVf/h8YG3PxFRk//XNoM+a8UmetJiM
 bEuylgL57O8Khi6nUvbmz7bsqV0gL3KuFSuF93C5EDgH04a9Rij8kVkKjal25a/wtA2e
 vsaxQ1oLMn+Ba4x7tJdf/yMedPWCawQtWU5YQ0T/7junW82vpQFqtvXYELt82nwPgAYD
 9LQw==
X-Gm-Message-State: AOAM5325StXRHYintsr1A8dFgh7tmD8Pa3VSnE174npTb7xGIkdXFTfy
 vLKBAm4UmB3irm+O8KTjYwIfsrnVFlM=
X-Google-Smtp-Source: ABdhPJyyS4tEvaiEG5HortvVFWPPfuf3qI0zfPqawxJFpAy1iRV3TmW+97tNz0zr1ME4Np2weZl3xQ==
X-Received: by 2002:a1c:4107:: with SMTP id o7mr13522953wma.69.1609455027343; 
 Thu, 31 Dec 2020 14:50:27 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id h184sm15061993wmh.23.2020.12.31.14.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:50:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/18] hw/pci-host/bonito: Map north bridge region in
 bonito_host_realize()
Date: Thu, 31 Dec 2020 23:49:08 +0100
Message-Id: <20201231224911.1467352-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'north bridge' is not part of the PCI function,
so create and map it in bonito_host_realize().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index c09d54cca82..099bb737c77 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -638,6 +638,13 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("PCI_2",
                                 (hwaddr)BONITO_PCIHI_BASE + BONITO_PCIHI_SIZE,
                                 2 * GiB);
+
+    /* set the north bridge pci configure mapping */
+    /* north bridge PCI configure space. 0x1fe0 0000 - 0x1fe0 00ff */
+    memory_region_init_io(&phb->conf_mem, OBJECT(phb), &pci_host_conf_le_ops, bs,
+                          "north-bridge-pci-config", BONITO_PCICONFIG_SIZE);
+    memory_region_add_subregion(get_system_memory(), BONITO_PCICONFIG_BASE,
+                                &phb->conf_mem);
 }
 
 static void bonito_pci_realize(PCIDevice *dev, Error **errp)
@@ -660,30 +667,24 @@ static void bonito_pci_realize(PCIDevice *dev, Error **errp)
     sysbus_init_mmio(sysbus, &s->iomem);
     sysbus_mmio_map(sysbus, 0, BONITO_INTERNAL_REG_BASE);
 
-    /* set the north bridge pci configure  mapping */
-    memory_region_init_io(&phb->conf_mem, OBJECT(s), &pci_host_conf_le_ops, s,
-                          "north-bridge-pci-config", BONITO_PCICONFIG_SIZE);
-    sysbus_init_mmio(sysbus, &phb->conf_mem);
-    sysbus_mmio_map(sysbus, 1, BONITO_PCICONFIG_BASE);
-
     /* set the south bridge pci configure  mapping */
     memory_region_init_io(&phb->data_mem, OBJECT(s), &bonito_spciconf_ops, s,
                           "south-bridge-pci-config", BONITO_SPCICONFIG_SIZE);
     sysbus_init_mmio(sysbus, &phb->data_mem);
-    sysbus_mmio_map(sysbus, 2, BONITO_SPCICONFIG_BASE);
+    sysbus_mmio_map(sysbus, 1, BONITO_SPCICONFIG_BASE);
 
     create_unimplemented_device("bonito", BONITO_REG_BASE, BONITO_REG_SIZE);
 
     memory_region_init_io(&s->iomem_ldma, OBJECT(s), &bonito_ldma_ops, s,
                           "ldma", 0x100);
     sysbus_init_mmio(sysbus, &s->iomem_ldma);
-    sysbus_mmio_map(sysbus, 3, 0x1fe00200);
+    sysbus_mmio_map(sysbus, 2, 0x1fe00200);
 
     /* PCI copier */
     memory_region_init_io(&s->iomem_cop, OBJECT(s), &bonito_cop_ops, s,
                           "cop", 0x100);
     sysbus_init_mmio(sysbus, &s->iomem_cop);
-    sysbus_mmio_map(sysbus, 4, 0x1fe00300);
+    sysbus_mmio_map(sysbus, 3, 0x1fe00300);
 
     create_unimplemented_device("ROMCS", BONITO_FLASH_BASE, 60 * MiB);
 
@@ -691,14 +692,14 @@ static void bonito_pci_realize(PCIDevice *dev, Error **errp)
     memory_region_init_alias(&s->bonito_pciio, OBJECT(s), "isa_mmio",
                              get_system_io(), 0, BONITO_PCIIO_SIZE);
     sysbus_init_mmio(sysbus, &s->bonito_pciio);
-    sysbus_mmio_map(sysbus, 5, BONITO_PCIIO_BASE);
+    sysbus_mmio_map(sysbus, 4, BONITO_PCIIO_BASE);
 
     /* add pci local io mapping */
 
     memory_region_init_alias(&s->bonito_localio, OBJECT(s), "IOCS[0]",
                              get_system_io(), 0, 256 * KiB);
     sysbus_init_mmio(sysbus, &s->bonito_localio);
-    sysbus_mmio_map(sysbus, 6, BONITO_DEV_BASE);
+    sysbus_mmio_map(sysbus, 5, BONITO_DEV_BASE);
     create_unimplemented_device("IOCS[1]", BONITO_DEV_BASE + 1 * 256 * KiB,
                                 256 * KiB);
     create_unimplemented_device("IOCS[2]", BONITO_DEV_BASE + 2 * 256 * KiB,
-- 
2.26.2


