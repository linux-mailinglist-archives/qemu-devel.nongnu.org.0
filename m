Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3B869C795
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:21:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2Gg-0006nX-9v; Mon, 20 Feb 2023 04:15:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2GN-0006cn-OR
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:12 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2GK-0003lt-FG
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:11 -0500
Received: by mail-wr1-x430.google.com with SMTP id t15so437059wrz.7
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vt6PhkOauBmS4s+Hk5XyQ3elHoYvUAOplun9HCHnuMI=;
 b=mAf4yQ1EFe4goLXMf3Kt0pImswORQT+N+ywdHHMHH0eDdUsdtIB0r02y2H1OiOdvnV
 D6EHUXd8JSc2UEL9yq7M2qSLOZMVtQfN4MjdQ41nyZ1/KNFQWKQMNfqctbKe2kpS9hvH
 AgBDxfymYk2J+GPjDrMqkcOP+ebIeYX2D6SKSLwskB0IDObxrBYkQyh60HuK3fu4QkvO
 LeBAGp0vXk3XaGNy/SukF6c9xR5liehR4fE6VquP7qZqZp28leAzTFOjFZjpnOsf7+3C
 7aD/+vpcyqTNiheBgWonIwUhTMTgvAEuFdAcFJB9sTQw+nnKUdNJ8POk3eAT1VtKZuZf
 Tyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vt6PhkOauBmS4s+Hk5XyQ3elHoYvUAOplun9HCHnuMI=;
 b=R9qT6w1Wz24Y1QhCvu40auMXPaBXCf/lZ2tzxLe2dTdI5CPZOkcI3R+vWkduXu+hUI
 ovKt5dcnWot/i3WiX6/mr/m1AzvAkbLey6qIP+z47qLRI5Hhv7C5ogbNA4UARQwcSA7X
 qENEvQzsmearYjXEAKxbqzygO20EDwgtV3ZDy+Vt5gRDbu0HQkaEm557PsLnA1fCWyya
 P2evb5qGWqAdaU1/W1IWP1bF0eIx99bvKKujU/DRQP52zTt1Qb7uNT77mXBvKf3As/zL
 x0R9YJ/WNuNtwphyRAHVMp/lIFJhMB1ieMbIGqJVpxQ2p2e69k7A3J1OpfLgIFjYAoDt
 dZxA==
X-Gm-Message-State: AO0yUKVo2VyipNV3mUMpArfe0ZFQDMkYuiysDwCvROqhKKUDPmwjNRLm
 tJdDPRTFRMh/qN9bdi0GMHvDRtjmrJyiU717
X-Google-Smtp-Source: AK7set9MAmCkLHmfSvcJflFEw8MkOmgDAVarz+3KhDXAftO1WBQaKsMFclFrttRg0c3D7Uibt/BlrA==
X-Received: by 2002:adf:e811:0:b0:2c5:61ef:7b37 with SMTP id
 o17-20020adfe811000000b002c561ef7b37mr1251045wrm.10.1676884506582; 
 Mon, 20 Feb 2023 01:15:06 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a5d5389000000b002c6eb1fc07asm1262627wrv.31.2023.02.20.01.15.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:15:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 13/24] hw/ide: Rename ide_register_restart_cb ->
 ide_bus_register_restart_cb
Date: Mon, 20 Feb 2023 10:13:47 +0100
Message-Id: <20230220091358.17038-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

ide_register_restart_cb() operates on a IDEBus; rename it as
ide_bus_register_restart_cb() to emphasize its first argument
is a IDEBus.

Mechanical change using:

  $ sed -i -e 's/ide_register_restart_cb/ide_bus_register_restart_cb/g' \
    $(git grep -l ide_register_restart_cb)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-13-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/ahci.c             | 2 +-
 hw/ide/cmd646.c           | 2 +-
 hw/ide/core.c             | 2 +-
 hw/ide/isa.c              | 2 +-
 hw/ide/piix.c             | 2 +-
 hw/ide/sii3112.c          | 2 +-
 hw/ide/via.c              | 2 +-
 include/hw/ide/internal.h | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 90fea5d059..430961d73b 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1560,7 +1560,7 @@ void ahci_realize(AHCIState *s, DeviceState *qdev, AddressSpace *as, int ports)
         ad->port_no = i;
         ad->port.dma = &ad->dma;
         ad->port.dma->ops = &ahci_dma_ops;
-        ide_register_restart_cb(&ad->port);
+        ide_bus_register_restart_cb(&ad->port);
     }
     g_free(irqs);
 }
diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index 94c576262c..2865bc25fc 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -298,7 +298,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
         d->bmdma[i].bus = &d->bus[i];
-        ide_register_restart_cb(&d->bus[i]);
+        ide_bus_register_restart_cb(&d->bus[i]);
     }
 }
 
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 117e26cef1..5897411b95 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2759,7 +2759,7 @@ static void ide_restart_cb(void *opaque, bool running, RunState state)
     }
 }
 
-void ide_register_restart_cb(IDEBus *bus)
+void ide_bus_register_restart_cb(IDEBus *bus)
 {
     if (bus->dma->ops->restart_dma) {
         bus->vmstate = qemu_add_vm_change_state_handler(ide_restart_cb, bus);
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 74f7b43137..f8ed26b587 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -74,7 +74,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
     ide_init2(&s->bus, isa_get_irq(isadev, s->irqnum));
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
-    ide_register_restart_cb(&s->bus);
+    ide_bus_register_restart_cb(&s->bus);
 }
 
 ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int irqnum,
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 267dbf37db..daeb9b605d 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -149,7 +149,7 @@ static int pci_piix_init_ports(PCIIDEState *d)
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
         d->bmdma[i].bus = &d->bus[i];
-        ide_register_restart_cb(&d->bus[i]);
+        ide_bus_register_restart_cb(&d->bus[i]);
     }
 
     return 0;
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 46204f10d7..c918370220 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -288,7 +288,7 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
 
         bmdma_init(&s->bus[i], &s->bmdma[i], s);
         s->bmdma[i].bus = &s->bus[i];
-        ide_register_restart_cb(&s->bus[i]);
+        ide_bus_register_restart_cb(&s->bus[i]);
     }
 }
 
diff --git a/hw/ide/via.c b/hw/ide/via.c
index e1a429405d..fd398226d4 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -195,7 +195,7 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
         d->bmdma[i].bus = &d->bus[i];
-        ide_register_restart_cb(&d->bus[i]);
+        ide_bus_register_restart_cb(&d->bus[i]);
     }
 }
 
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index ccfe064643..cc95cd47a0 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -620,7 +620,7 @@ void ide_init2(IDEBus *bus, qemu_irq irq);
 void ide_exit(IDEState *s);
 int ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
 void ide_bus_set_irq(IDEBus *bus);
-void ide_register_restart_cb(IDEBus *bus);
+void ide_bus_register_restart_cb(IDEBus *bus);
 
 void ide_exec_cmd(IDEBus *bus, uint32_t val);
 
-- 
2.38.1


