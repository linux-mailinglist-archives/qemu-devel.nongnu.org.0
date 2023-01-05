Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BA765EC74
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 14:09:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPyO-0004dI-8h; Thu, 05 Jan 2023 08:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPyL-0004Xm-QD
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:53 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPyK-0004Jy-5u
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:53 -0500
Received: by mail-wr1-x432.google.com with SMTP id co23so36091927wrb.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 05:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gd+xC3PY2bHAZfis1Su9RMK8WeD5UdldXtzUnYRkru0=;
 b=Z0y3qfBIHv0QH2AAvqYrPyqd7y6iB9W7meqDbFjfCE5yrcaezfcOqf05l4CSN56gt9
 pSSgglQ2qfrFPi6qt6cQDWy+GcTIcJpVQ92WoVwgXvVWEUL2s12CIK80GZyBNs4yh9iO
 f6xap5T3aOxkDBGmvfiWot9A9tcpa2D7YGxGgnClrl5GdJdvQLuEL2ENhVjXGFJqPBpo
 SkhM+x3GqQoqBHmP4Cdqzkv7+zN9VW4dhpsEnPnwygNGFBv/obDzEzblIUL6y3lFTeep
 Dxlu6BDviG3x5x8Fboly05Q+Sk/AWw5jc4El+Gv9k/WEzGQ2a9pyUQR6WKfqS73QUCQn
 Cmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gd+xC3PY2bHAZfis1Su9RMK8WeD5UdldXtzUnYRkru0=;
 b=4b+vFkUZYjzpOMnegThZ5/ERrYfHfXqApjRejseqG8mI6bO1VHHtBivhASMCBPL5X4
 KiGsssLi/w5q95fgYBbrDU7fCIwCtob3P/8xMJp/CaTZQ9N96oJBhITncVyImREitiKz
 MZWf87VMDZBr1RywjpUfj3WM2tTzUJhMs+EJ9INiVl+INyxp6HbA2T2nuq6HzE/hXpnG
 3HKTqoqZLz7oUKsm1TJmz7BUIKJRjQaRQ6O1ouQEzNOB3y35j7ecbbGbmJ7syNk3sakP
 MJIeYZ4cHZz48alDkgiq1svoErJIpV1GZxk1ffZTGFX7aWnXCN34oRQ5eWOtI9vf0OE+
 RcYg==
X-Gm-Message-State: AFqh2konxs/3H8Ft6zUZkEIKITo5My/IbHHb816WOwkYp0Rr2dr+3rN6
 pZakQit6k9K+u3TpG25kywuDJEHmGR5biNcl
X-Google-Smtp-Source: AMrXdXuyuk9wcUm7yY1b9cHUUbbPVaMge3sev4KRmv88uOWeMUtMrqTW8QgW5zQ5zUTgvlLmLMmSBg==
X-Received: by 2002:adf:df86:0:b0:242:67f6:89c5 with SMTP id
 z6-20020adfdf86000000b0024267f689c5mr33055438wrl.12.1672924070619; 
 Thu, 05 Jan 2023 05:07:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z13-20020adff74d000000b002366f9bd717sm42614326wrp.45.2023.01.05.05.07.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jan 2023 05:07:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 8/8] hw/mips/fuloong2e: Open code bonito_init()
Date: Thu,  5 Jan 2023 14:07:10 +0100
Message-Id: <20230105130710.49264-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230105130710.49264-1-philmd@linaro.org>
References: <20230105130710.49264-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This helper is trivial and is called once, directly open-code it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/fuloong2e.c    |  6 +++++-
 hw/pci-host/bonito.c   | 15 ---------------
 include/hw/mips/mips.h |  3 ---
 3 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 34befa5dd5..f41e19dc3f 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -32,6 +32,7 @@
 #include "hw/mips/bootloader.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
+#include "hw/pci-host/bonito.h"
 #include "hw/loader.h"
 #include "hw/ide/pci.h"
 #include "hw/qdev-properties.h"
@@ -292,7 +293,10 @@ static void mips_fuloong2e_init(MachineState *machine)
     cpu_mips_clock_init(cpu);
 
     /* North bridge, Bonito --> IP2 */
-    pci_bus = bonito_init((qemu_irq *)&(env->irq[2]));
+    dev = qdev_new(TYPE_BONITO_PCI_HOST_BRIDGE);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, env->irq[2]);
+    pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
 
     /* South bridge -> IP5 */
     pci_dev = pci_create_simple_multifunction(pci_bus,
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index df61b051b0..ca5fa2a155 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -44,7 +44,6 @@
 #include "qemu/error-report.h"
 #include "hw/pci/pci.h"
 #include "hw/irq.h"
-#include "hw/mips/mips.h"
 #include "hw/pci-host/bonito.h"
 #include "hw/pci/pci_host.h"
 #include "migration/vmstate.h"
@@ -750,20 +749,6 @@ static void bonito_pci_realize(PCIDevice *dev, Error **errp)
     pci_set_byte(dev->config + PCI_MAX_LAT, 0x00);
 }
 
-PCIBus *bonito_init(qemu_irq *pic)
-{
-    DeviceState *dev;
-    PCIHostState *phb;
-
-    dev = qdev_new(TYPE_BONITO_PCI_HOST_BRIDGE);
-    phb = PCI_HOST_BRIDGE(dev);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, *pic);
-
-    return phb->bus;
-}
-
 static void bonito_pci_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
diff --git a/include/hw/mips/mips.h b/include/hw/mips/mips.h
index 101799f7d3..4d2db99952 100644
--- a/include/hw/mips/mips.h
+++ b/include/hw/mips/mips.h
@@ -9,9 +9,6 @@
 
 #include "exec/memory.h"
 
-/* bonito.c */
-PCIBus *bonito_init(qemu_irq *pic);
-
 /* rc4030.c */
 typedef struct rc4030DMAState *rc4030_dma;
 void rc4030_dma_read(void *dma, uint8_t *buf, int len);
-- 
2.38.1


