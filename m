Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271515A8286
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 17:59:05 +0200 (CEST)
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTQ7M-0004Hz-9K
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 11:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvG-0002gG-Eo; Wed, 31 Aug 2022 11:46:34 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:40451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvE-00036y-Oy; Wed, 31 Aug 2022 11:46:34 -0400
Received: by mail-ed1-x52f.google.com with SMTP id m1so18964670edb.7;
 Wed, 31 Aug 2022 08:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=7oW9e9CQAQ6fs7n+6iH6aAQcJgkK+/GOKyNQf68VL6Q=;
 b=DZsxTy1FOjkKozuO9ZVDG2x4ahxEO9ZLgkbgzyD30erPVx5lth4tIf8AGDAQRy+1Ba
 7p+J/2fEfpbpnZSuFikLbvFVSErh1Pwb+3P77x2S174xsxWzZHTr8fNFu5ZtabDoRgvv
 mxlroEfjS3KRq7Zg4A7G/VazOA2u+1ngO+YvLYfYX82Boplk4h39CF9hGdKuDBTsCNUo
 qFXPAYWvGZwBa0+xweF8SR90SPuSP2k6E8/YttB2RY9iX9Y9ahoqG84SrluGI8Lm5WG1
 ebyfn3qNFK+Y7ZCNBVOBlzaO4gzb1DHo3HXeHd3oYYBUmuIiRk6vT0WaL2CoXZBNn0Kp
 51HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=7oW9e9CQAQ6fs7n+6iH6aAQcJgkK+/GOKyNQf68VL6Q=;
 b=M/ciDBp+dy5zfToN4Tfudp5/tLk+u0UA1ze+o51KoNhCWn3QSX/IDKp5NbV5/7sSiE
 q+oIFI9dLBaelUzZv0ntWYXC8whagYnsFV5tQjNfHyDMxPOh/7SiI8zhUjypfGUIhsLZ
 XJh/eXX6YJgjsIFfyOPMxlCeGc3SQdDxihMgO3G5r9vZ1qTiZu2uUICxk7GbsiaKAYm+
 fXSdjZrVFOQYHVZIE/kUko4E/sCN3yLe4plrPW4Pmq47RrzQ8Ge2TiD1FsHiWjCyUlQP
 pPpb+DWoGrVe3wYF9GgbRlzhOquJ1p/YgV+S5zYmCvW5pcY/pFTbY/oVngi9OMm6hv5Z
 MRPQ==
X-Gm-Message-State: ACgBeo2XVEiwTHzHsciyXv4niU+upJ57ttNIgZUfvib7hIEsTraV/u0W
 YL6nK+fd4Ud0Qncj1zbkT0YD82lVDv4=
X-Google-Smtp-Source: AA6agR5r2Qgy6yNITSAiEi4p0YJufHO+kAHxvvsZURO2HpO44Y3i8IiMdc1jl1VBx9enwetXdFE2bw==
X-Received: by 2002:a05:6402:50ca:b0:447:3355:76e3 with SMTP id
 h10-20020a05640250ca00b00447335576e3mr25045061edb.72.1661960790506; 
 Wed, 31 Aug 2022 08:46:30 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a508ac9000000b00445e930e20esm9252123edk.64.2022.08.31.08.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 08:46:30 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 05/12] hw/isa/vt82c686: Introduce TYPE_VIA_IDE define
Date: Wed, 31 Aug 2022 17:45:58 +0200
Message-Id: <20220831154605.12773-6-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831154605.12773-1-shentey@gmail.com>
References: <20220831154605.12773-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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

Establishes consistency with other (VIA) devices.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/via.c              | 2 +-
 hw/mips/fuloong2e.c       | 2 +-
 hw/ppc/pegasos2.c         | 2 +-
 include/hw/isa/vt82c686.h | 1 +
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index 82def819c4..e1a429405d 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -230,7 +230,7 @@ static void via_ide_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo via_ide_info = {
-    .name          = "via-ide",
+    .name          = TYPE_VIA_IDE,
     .parent        = TYPE_PCI_IDE,
     .class_init    = via_ide_class_init,
 };
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 5ee546f5f6..44225fbe33 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -205,7 +205,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
                                           TYPE_VT82C686B_ISA);
     qdev_connect_gpio_out(DEVICE(dev), 0, intc);
 
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
+    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), TYPE_VIA_IDE);
     pci_ide_create_devs(dev);
 
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 61f4263953..8039775f80 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -166,7 +166,7 @@ static void pegasos2_init(MachineState *machine)
                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
 
     /* VT8231 function 1: IDE Controller */
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 1), "via-ide");
+    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 1), TYPE_VIA_IDE);
     pci_ide_create_devs(dev);
 
     /* VT8231 function 2-3: USB Ports */
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index 56ac141be3..87aca3e5bb 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -8,6 +8,7 @@
 #define TYPE_VT8231_ISA "vt8231-isa"
 #define TYPE_VT8231_PM "vt8231-pm"
 #define TYPE_VIA_AC97 "via-ac97"
+#define TYPE_VIA_IDE "via-ide"
 #define TYPE_VIA_MC97 "via-mc97"
 
 void via_isa_set_irq(PCIDevice *d, int n, int level);
-- 
2.37.3


