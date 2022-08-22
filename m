Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BCC59CBD3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:58:10 +0200 (CEST)
Received: from localhost ([::1]:51084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGMz-000624-9k
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGA6-0003rP-QR; Mon, 22 Aug 2022 18:44:51 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:44651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGA5-0007w8-4p; Mon, 22 Aug 2022 18:44:50 -0400
Received: by mail-ed1-x535.google.com with SMTP id t5so15781524edc.11;
 Mon, 22 Aug 2022 15:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=tfjpe0kq5Hqkrre7mfBlqhm29F5/cPJTQ5XTLa09A84=;
 b=FUxaEQ4Ecdgv8e4TWRpTemcMEzcgYSm2tbFi1yz6MCirDPj4YF66JFNSSgNN5sODaH
 kN9Lz412i2a46N7eNQnZ0ILiv9mYdobf4Go3S5U5W4NZqJnrXMWuGgrv0XA9hb03UV7Q
 g4m7pQOT/PU90Opax8P5IVn0/zVahGqxXO5EzBT2k2IjlV+bQBFpkkXmDDBjksDWSf1B
 ZYrVPcQBTBVevHj+5epQzYLAzNLdo0enS36YnvMPGML3WrqLFeSQxSwsm+JMYD70FUom
 Ww6Hv5Lbm6WMuJuvlLWwEd7Ts6I1VN/ktcIOMzwXi9O9B/9gyVQeK1YH51IdMdq9nf0E
 eKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=tfjpe0kq5Hqkrre7mfBlqhm29F5/cPJTQ5XTLa09A84=;
 b=abzxC8mqUnZjJJRQYSKgsEr7+CnRph2/DFwbHGU5s2CZU2dcNqe/87oeIooKDRa+Zx
 NGleXM3MDgNcAOWl6OXsIb5yVB7ofpek9byNkMH8igGMHTlGPki5SJZmrCkF9mSViM4L
 FBnJ2C533BvymjJc6//A+rPhxXWdqbXxBJxGhlA9qLm6r0wT8XNMdkEJNtGYFfx8j06U
 MFPe1ZDnUEhrnMtoRvXmarRXCU6ERN11ug0MCXtUM4b1GGeUmUhM6UBrMKiohqAxqfbC
 yR/HtH50e4c1+N7wSdnNOIDTFGe6dRGjVU5AkSC6/RRU3WOGA32Hdi1PA5i48z9x6hM+
 RM/A==
X-Gm-Message-State: ACgBeo3NkIuB2QJTiL3eAXtjCx6Mz80P/xs7k1FDQ0er8vnlpD1E0TC5
 ildh7YCmsx3j4eyC3EO46lhpMf5ExxY=
X-Google-Smtp-Source: AA6agR4XkemkbnYDMPRPeXjhM6TWKVZa7A6rcI34QIBlgyvIqd3fxhHwp3YibG6gwKVd/OX+YY0yiw==
X-Received: by 2002:aa7:cd78:0:b0:446:49f4:1c0f with SMTP id
 ca24-20020aa7cd78000000b0044649f41c0fmr1076383edb.342.1661208286827; 
 Mon, 22 Aug 2022 15:44:46 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-070-107.77.183.pool.telefonica.de. [77.183.70.107])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a170906768400b0073d7b876621sm2455758ejm.205.2022.08.22.15.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 15:44:46 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/9] hw/isa/vt82c686: Resolve unneeded attribute
Date: Tue, 23 Aug 2022 00:43:48 +0200
Message-Id: <20220822224355.11753-3-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822224355.11753-1-shentey@gmail.com>
References: <20220822224355.11753-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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

Now that also the super io device is realized in the common realize method,
the isa_bus attribute can be turned into a temporary.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 0217c98fe4..9d12e1cae4 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -543,7 +543,6 @@ struct ViaISAState {
     PCIDevice dev;
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs;
-    ISABus *isa_bus;
     ViaSuperIOState via_sio;
 };
 
@@ -585,17 +584,18 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     ViaISAState *s = VIA_ISA(d);
     DeviceState *dev = DEVICE(d);
     qemu_irq *isa_irq;
+    ISABus *isa_bus;
     int i;
 
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
-    s->isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
+    isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
                           &error_fatal);
-    s->isa_irqs = i8259_init(s->isa_bus, *isa_irq);
-    isa_bus_irqs(s->isa_bus, s->isa_irqs);
-    i8254_pit_init(s->isa_bus, 0x40, 0, NULL);
-    i8257_dma_init(s->isa_bus, 0);
-    mc146818_rtc_init(s->isa_bus, 2000, NULL);
+    s->isa_irqs = i8259_init(isa_bus, *isa_irq);
+    isa_bus_irqs(isa_bus, s->isa_irqs);
+    i8254_pit_init(isa_bus, 0x40, 0, NULL);
+    i8257_dma_init(isa_bus, 0);
+    mc146818_rtc_init(isa_bus, 2000, NULL);
 
     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
         if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
@@ -604,7 +604,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     }
 
     /* Super I/O */
-    if (!qdev_realize(DEVICE(&s->via_sio), BUS(s->isa_bus), errp)) {
+    if (!qdev_realize(DEVICE(&s->via_sio), BUS(isa_bus), errp)) {
         return;
     }
 }
-- 
2.37.2


