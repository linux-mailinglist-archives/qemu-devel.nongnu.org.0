Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA39A612D5F
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:31:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGo1-0000AY-LY; Sun, 30 Oct 2022 18:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGnz-00008L-Ih
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:23 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGnx-0007Av-Ub
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:23 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso9794234wma.1
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n7QaJwgd7/+E/h1CKCmxp7Ly4mdpqr+k/rS/2LY+KMc=;
 b=L8urBlPRUiWgCqZEeuXp/Ln2usIgqhcZoiyXxyBBEO4wcZsgftSIIstZtTBHTv3ttw
 RC+QIOZheuN/X47doDXXV7L2Kr0iOZY97PsrMsTYdWoqytydMzNAmndjtAbwIlbJCGnL
 sYP8lNS/2TEp8EOL7OyN8enV5+Q784cfro1hpAlm89VdAjRpgGG7vvpHniI2lzvZV+uK
 lDh1oWqSWVc4IJPkXbLIaXo+XZQdAT9gnK44b5PZ7JUqbnOWgltEQwsJmZNwafRSPMfk
 t7OFt+/ZjAKazMAdiEgNUK/QYLIyPD+b2tTKVwG8/+H9fKOsZRRg7HbkGcjYGz14wa/Q
 caDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n7QaJwgd7/+E/h1CKCmxp7Ly4mdpqr+k/rS/2LY+KMc=;
 b=ApDapGmeK3h7jngrcMASQThZtUGzNCB7W07OfqT3Kzz0D0nR8zCDMQ671/8GM66oPP
 DJX+mCR083dZlnGBVKJ4YhvY6DiQXOwTiATc+b5EVQ/U+ZRPo8G190UBtI1vLrE3kzFg
 uu0RkoFRLKLdQysXRs7vof+B1XzTVO6NvWrOGoABNHYsDep2dOW7ZYuzKJ0z1mtL+6H3
 ahw3pvNgrBWPVYpz6OPC9RKoan9O+39W1a4BuXy5JutqgU7g94upzxlAtRg3vhafQZDR
 /ED/IBD1p3U48vN7BQR3SkCUw/gV0e82pAcAgfU93B6ASpaeYRaXSUCLb43rhwpprcCW
 lgwg==
X-Gm-Message-State: ACrzQf2ubzEh8JzbpgIAyi+/v6s7G5tE5EbvGZVqMMW3cqhPd691WIMq
 aSPh5kk4mLdTRWX34fz80macUVGytzD+dw==
X-Google-Smtp-Source: AMsMyM5XIRX/2VITB2tfqSevWOu/Pn23tMHP2Y1ZT8B5PVSMck9uokYwrK+TKnv0BcnYkVBBxI9gtg==
X-Received: by 2002:a05:600c:2116:b0:3cf:69ff:5da2 with SMTP id
 u22-20020a05600c211600b003cf69ff5da2mr3971043wml.16.1667168960090; 
 Sun, 30 Oct 2022 15:29:20 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bs14-20020a056000070e00b0023647841c5bsm5240543wrb.60.2022.10.30.15.29.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:29:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 05/55] hw/isa/vt82c686: Introduce TYPE_VIA_IDE define
Date: Sun, 30 Oct 2022 23:27:51 +0100
Message-Id: <20221030222841.42377-6-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

Establishes consistency with other (VIA) devices.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220901114127.53914-6-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index ecf682b148..0ccc130b88 100644
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


