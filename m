Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559006AFAB2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:48:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh2a-0001tx-28; Tue, 07 Mar 2023 18:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh2V-0001hE-Tr
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:15 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh2T-0002fE-LF
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:15 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso150203wms.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DnwfOaXOxJrTPxWxlZ50jz6yqfpogkCU7arLL1adNDo=;
 b=QopmL8k4bpj8/B6JHSR3giYXTdSGPrP04oHPfRkSGoyrIaDb8ByvmPRvNSEn7AQ7CB
 W5SVPF4xsaqE07BreKe1XFqpkhLiqoZwucv/j8+T3ltWw/yAY+XsNt9cTGu7jIpB9ljP
 PEgm5k2NRzaCWOtgjI//qzImZv5vnU+docY21DH8b+4Mtgg5a3RhukDeDR2CdMbe/DkZ
 YXKnGV/iaGDHhHO8s2Uy6KwKRZsdjodFrJvZsmX8ScwUpr36i1DV4/yDJfZ4RHfT6jta
 2N/r1/r+YzqomKBsGc2PpW7SWNOLYNb0h1F18NO8/hCJVXAPJ2OjyJxUqHcXTeeoiBNn
 4vgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DnwfOaXOxJrTPxWxlZ50jz6yqfpogkCU7arLL1adNDo=;
 b=iohPwWWKreUVc1Ej3yiBLTdZ845buQOEN8jCXmYHYwX6+92lPd74WNTCaySU/0sJgX
 PyNOMWlaANVHFi5DegU3aoGaPLpgpSjdaHHocWbTkeI34smQcl53M0dewcOuf2aT3M17
 83dSvoF28Z7PP6y7jwII6YzXMaH4pUw0RTZGesG9PJQMhX+0/ojsBL7Rq0DG5zFGS5k2
 2ds8b6H2LPQNFitX8flGK7AINBXni1sPDGTz75nkSfhq6vm79XMMP/+fUerEVa/ngytS
 qdlqfJuZh59Sc2l2o+fhScTK745VdWmiCOqSM62yrxldz9h6uNHb1Z9vatYshprMOjh7
 f1Tg==
X-Gm-Message-State: AO0yUKX60ShSl7wkXzq6VtHTIhUcOZKfV1eoj1ylOQ/fXcXHp7C/6z8U
 mckrUe/iHhfZMW0OT/2M0HoDRP/N+wW0Tmv9RNM=
X-Google-Smtp-Source: AK7set8w0gA44wlYaKCU3/xjf/xeUnLEinWz9Dt6WTwZoSsy7dAnixReHwZcbx9MmYXt7f9EZzr4GQ==
X-Received: by 2002:a05:600c:3506:b0:3dc:405b:99bf with SMTP id
 h6-20020a05600c350600b003dc405b99bfmr14894698wmq.15.1678232892608; 
 Tue, 07 Mar 2023 15:48:12 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c44c700b003e2232d0960sm14049592wmo.23.2023.03.07.15.48.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:48:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Rene Engel <ReneEngel80@emailn.de>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 10/20] Revert "hw/isa/vt82c686: Remove intermediate IRQ
 forwarder"
Date: Wed,  8 Mar 2023 00:47:01 +0100
Message-Id: <20230307234711.55375-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

From: BALATON Zoltan <balaton@eik.bme.hu>

To be 'usable', QDev objects (which are QOM objects) must be
1/ initialized (at this point their properties can be modified), then
2/ realized (properties are consumed).
Some devices (objects) might depend on other devices. When creating
the 'QOM composition tree', parent objects can't be 'realized' until
all their children are. We might also have circular dependencies.
A common circular dependency occurs with IRQs. Device (A) has an
output IRQ wired to device (B), and device (B) has one to device (A).
When (A) is realized and connects its IRQ to an unrealized (B), the
IRQ handler on (B) is not yet created. QEMU pass IRQ between objects
as pointer. When (A) poll (B)'s IRQ, it is NULL. Later (B) is realized
and its IRQ pointers are populated, but (A) keeps a reference to a
NULL pointer.
A common pattern to bypass this circular limitation is to use 'proxy'
objects. Proxy (P) is created (and realized) before (A) and (B). Then
(A) and (B) can be created in different order, it doesn't matter: (P)
pointers are already populated.

Commit bb98e0f59cde ("hw/isa/vt82c686: Remove intermediate IRQ
forwarder") neglected the QOM/QDev circular dependency issue, and
removed the 'proxy' between the southbridge, its PCI functions and the
interrupt controller, resulting in PCI functions wiring output IRQs to
'NULL', leading to guest failures (IRQ never delivered) [1] [2].

Since we are entering feature freeze, it is safer to revert the
offending patch until we figure a way to strengthen our APIs.

[1] https://lore.kernel.org/qemu-devel/928a8552-ab62-9e6c-a492-d6453e338b9d@redhat.com/
[2] https://lore.kernel.org/qemu-devel/cover.1677628524.git.balaton@eik.bme.hu/

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Tested-by: Rene Engel <ReneEngel80@emailn.de>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <cdfb3c5a42e505450f6803124f27856434c5b298.1677628524.git.balaton@eik.bme.hu>
[PMD: Reworded description]
Inspired-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/vt82c686.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index f4c40965cd..01e0148967 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -598,15 +598,23 @@ void via_isa_set_irq(PCIDevice *d, int n, int level)
     qemu_set_irq(s->isa_irqs_in[n], level);
 }
 
+static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
+{
+    ViaISAState *s = opaque;
+    qemu_set_irq(s->cpu_intr, level);
+}
+
 static void via_isa_realize(PCIDevice *d, Error **errp)
 {
     ViaISAState *s = VIA_ISA(d);
     DeviceState *dev = DEVICE(d);
     PCIBus *pci_bus = pci_get_bus(d);
+    qemu_irq *isa_irq;
     ISABus *isa_bus;
     int i;
 
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
+    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
                           errp);
 
@@ -614,7 +622,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
         return;
     }
 
-    s->isa_irqs_in = i8259_init(isa_bus, s->cpu_intr);
+    s->isa_irqs_in = i8259_init(isa_bus, *isa_irq);
     isa_bus_register_input_irqs(isa_bus, s->isa_irqs_in);
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
-- 
2.38.1


