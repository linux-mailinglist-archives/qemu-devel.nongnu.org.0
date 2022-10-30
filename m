Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B727612D8D
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:37:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGuS-00024t-Ki; Sun, 30 Oct 2022 18:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGso-0005Yu-J3
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:34:23 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGsm-0000NC-9F
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:34:21 -0400
Received: by mail-wr1-x436.google.com with SMTP id o4so13675998wrq.6
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JUlrjLC/LAC7Ijn15DnykEeyXV+ARRHqV/ZNxwn5z5k=;
 b=A0EGfOIA1Sc0wB0vKN+9GjKghF3F9CJyQch4EuwrEYx3Km2d/kuVmjvFOIrXZHOXrG
 KAKaN71dy2hniBo4BMdyIOTtwNJoPh6P3T5Ys2Q53D9kxzQeYnjZqb9h1Pi/w+Hxq09i
 gE2mweNUinNus6UufRj8z2gxGfjdXkhmvW+i0pTG9zAi20om1WR/tFyC3JKTAaP+Vty9
 B6PomGf1+SqeAoglMfo7BgviPDWp/wLuhqbZVv7AgbA/RMNItN7tDxl//KVbt0c0d5o3
 xrPSjn73t+SydSX+HpUGbkOzko8r3tHYx3QOcnIIcx1025BlB9K79CtF0rebSvL1yzYL
 POUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JUlrjLC/LAC7Ijn15DnykEeyXV+ARRHqV/ZNxwn5z5k=;
 b=0sTa6UkK4h3nbX2HrwE1q31oCbnbgTs1bCsCZ/piV70FUJw0ajzlW+RFF78sHc/65M
 NdFFm/PBPDQbpkwJlkwyCCnrb2KxHK7OPGu5s17P1f7ysydtIJ50xFSsGImO38Qw8/9w
 CXWkOj+xg6096a9T4c0jjl6vixeJD0GwWSMwBcJW9nIvETruzKJOc3OGL9YV3ATpwPI4
 o8mhAVuqAgDP+XgV+DKMU4VOG/FjOpr2egNSi8uBKjk4Ka2zjBBBG+ffE6wxx7VKQ4wp
 wHcYhZVV3+CJWSToVyr6W7sY6vWJbQtYj9ESEXt+tKPhhoOvoca+7FrkBYewID6rnzgi
 ok4w==
X-Gm-Message-State: ACrzQf2UavrVIxrV1+jumvAP/F/8HtCbPGo+3rjgQXgUTTKut3nWwJ8z
 8JtyYjd7s/SCz0TaBda5e1z7ef4D73rfKQ==
X-Google-Smtp-Source: AMsMyM6DnOSLvsJDJzLuz/TUwnM+dWdj6LcD48clGIRa8YVHSS7Kq7f8tHgvbNzdawqc6M/+o1aeVA==
X-Received: by 2002:a5d:61c9:0:b0:236:781a:8d7e with SMTP id
 q9-20020a5d61c9000000b00236781a8d7emr6106517wrv.576.1667169258338; 
 Sun, 30 Oct 2022 15:34:18 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t16-20020adff610000000b0023538fb27c1sm5227015wrp.85.2022.10.30.15.34.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:34:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 51/55] hw/isa/piix4: Move pci_ide_create_devs() call to board
 code
Date: Sun, 30 Oct 2022 23:28:37 +0100
Message-Id: <20221030222841.42377-52-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

For the VIA south bridges there was a comment to have the call in board code.
Move it there for PIIX4 as well for consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20221022150508.26830-29-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/piix4.c  |  1 -
 hw/mips/malta.c | 10 ++++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 9126eb9edf..8fc1db6dc9 100644
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
index 6ac811763c..5a4e2abbdf 100644
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
@@ -1400,11 +1400,13 @@ void mips_malta_init(MachineState *machine)
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
2.37.3


