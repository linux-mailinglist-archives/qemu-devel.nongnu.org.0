Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E462E8296
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 23:59:01 +0100 (CET)
Received: from localhost ([::1]:44762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6uK-0004yf-I6
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 17:59:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6mL-00033d-3I
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:45 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6mJ-00071u-G7
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:44 -0500
Received: by mail-wr1-x42a.google.com with SMTP id q18so21083752wrn.1
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=423UJbcbIa77Pf7DWP8ntIYBlM/uiTnfSWl6dX1wzkM=;
 b=HW7xG8rDq7aUhQi7ETz8ENCqsU1WwI/QSBHCBNc/SjvA4QX+bK0F/x5O+5Mp1gL+lH
 3BMhjbDNcoZF+FntBru1ljFl1aglY+7p2Mq/NRueKvuCkbTuy0jHgeQOLHOzSw/6U8JW
 sS1xE2ajx05WduvWP/GHxB1BogmBdQfCtyEARdO9l8fAtrUqn7Pjgc9+UiMFq/vxWcTj
 9wW4Dr4JoAUALxP1SUserUpYlRbujasv86y/TvVfZYpTxP7aQsmaNL4NfRE1nVfH0GqK
 bRtM7WQLXLhcjQSi6EgK73IjEpEr4Basevbt887Sozm/28D3zvejOQeIFp9HME3Kpo9E
 VitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=423UJbcbIa77Pf7DWP8ntIYBlM/uiTnfSWl6dX1wzkM=;
 b=KJM2re8pIsNfc8tT5SKTCXIcqPFKIneEJrfubl2++CWruKXdRXE5d1phv0uZ9pdaQN
 C6FbEMlptNmbVd5PHo72axmEHlVvoV9so+wrZsIAWV4wSYibkhFiH4JAkE2LWkB+VZ5+
 2lB0GTbuVsodDW99aRB0Xp89BplJbmUzGfi05xN0/lVfBBk7b1GrjtYMHn+xok4g0JtF
 WwPlTA8JZfOiRCc3GMmMQISNwe8Dvy1bxxO1hLgLS9PZcJNvz2Pi9rE/sKwfpYLxBJx9
 /tIS5324CfqklKruKrAAtWxOxwyYE39pIBLcX3goqEkJlt+fQaXcvWaIrauHVJ4734Fy
 QEqA==
X-Gm-Message-State: AOAM533xKEYhYnwnbS9xMxDmCZ4U5jsVZtg9pWqHn0rEO4BIrKLBQwro
 RNLFTbDrVpz1f/XMeDhQlW/8baaLsuo=
X-Google-Smtp-Source: ABdhPJy+j67cr4SJreaz//u0IYQ5JJaJyIpWlW0YHR4WoxboDfiDlcg3bHROCNdQWmLaZyn3w0A9OA==
X-Received: by 2002:a05:6000:cc:: with SMTP id
 q12mr67707459wrx.335.1609455041958; 
 Thu, 31 Dec 2020 14:50:41 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id r2sm72319749wrn.83.2020.12.31.14.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:50:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 18/18] hw/mips/fuloong2e: Inline bonito_init()
Date: Thu, 31 Dec 2020 23:49:11 +0100
Message-Id: <20201231224911.1467352-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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

Remove bonito_init() by inlining it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
TBC next year.
---
 include/hw/mips/mips.h |  3 ---
 hw/mips/fuloong2e.c    |  7 ++++++-
 hw/pci-host/bonito.c   | 15 ---------------
 3 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/include/hw/mips/mips.h b/include/hw/mips/mips.h
index 6c9c8805f3f..609a33881f6 100644
--- a/include/hw/mips/mips.h
+++ b/include/hw/mips/mips.h
@@ -12,9 +12,6 @@
 /* gt64xxx.c */
 PCIBus *gt64120_register(qemu_irq *pic);
 
-/* bonito.c */
-PCIBus *bonito_init(qemu_irq *pic);
-
 /* rc4030.c */
 typedef struct rc4030DMAState *rc4030_dma;
 void rc4030_dma_read(void *dma, uint8_t *buf, int len);
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 45c596f4fe5..19b3788e816 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -25,6 +25,7 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/clock.h"
+#include "hw/pci-host/bonito.h"
 #include "hw/intc/i8259.h"
 #include "hw/dma/i8257.h"
 #include "hw/isa/superio.h"
@@ -303,6 +304,7 @@ static void mips_fuloong2e_init(MachineState *machine)
     MIPSCPU *cpu;
     CPUMIPSState *env;
     DeviceState *dev;
+    BonitoState *bonito;
 
     cpuclk = clock_new(OBJECT(machine), "cpu-refclk");
     clock_set_hz(cpuclk, 533080000); /* ~533 MHz */
@@ -360,7 +362,10 @@ static void mips_fuloong2e_init(MachineState *machine)
     cpu_mips_clock_init(cpu);
 
     /* North bridge, Bonito --> IP2 */
-    pci_bus = bonito_init((qemu_irq *)&(env->irq[2]));
+    bonito = BONITO_PCI_HOST_BRIDGE(qdev_new(TYPE_BONITO_PCI_HOST_BRIDGE));
+    bonito->pic = (qemu_irq *)&(env->irq[2]); /* TODO link/property */
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(bonito), &error_fatal);
+    pci_bus = PCI_HOST_BRIDGE(bonito)->bus;
 
     /* South bridge -> IP5 */
     vt82c686b_southbridge_init(pci_bus, FULOONG2E_VIA_SLOT, env->irq[5],
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index b959b353854..28d385ff363 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -714,21 +714,6 @@ static void bonito_pci_realize(PCIDevice *dev, Error **errp)
     qemu_register_reset(bonito_reset, s);
 }
 
-PCIBus *bonito_init(qemu_irq *pic)
-{
-    DeviceState *dev;
-    BonitoState *pcihost;
-    PCIHostState *phb;
-
-    dev = qdev_new(TYPE_BONITO_PCI_HOST_BRIDGE);
-    phb = PCI_HOST_BRIDGE(dev);
-    pcihost = BONITO_PCI_HOST_BRIDGE(dev);
-    pcihost->pic = pic;
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-
-    return phb->bus;
-}
-
 static void bonito_pci_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-- 
2.26.2


