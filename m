Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2485A7AF6
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 12:07:49 +0200 (CEST)
Received: from localhost ([::1]:56108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTKdP-0000gH-NX
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 06:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXl-0006P1-S3; Wed, 31 Aug 2022 06:01:57 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXi-0002sd-S5; Wed, 31 Aug 2022 06:01:57 -0400
Received: by mail-ej1-x62b.google.com with SMTP id fy31so26895604ejc.6;
 Wed, 31 Aug 2022 03:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ccpcYMGxqn8WXNFI2X2jCqAbkQ1k7CgYSp60BbZylhE=;
 b=DdN1h3mCPuzB89sHWp0b/dZLFFCyqPNJXAZuT78KmP+uodsjFUmwIojzXeE/InEPlU
 ZGcJhzqTX/OrSMfMD2u9prUWykFwuJxFVv9wGI9ALh+StFOEdKkn7Kg8YcXGb9OBmRTR
 BF0Ftyxf0rvIlx/aBG/R3qd15ZHstbuwftMj182dgND5zMFfMnUcnwX0ZZMBjK3hrvVT
 eF6kfu8Mmm07JKd5Evl+uV/Hhoo9/gSSn/ePLJ1mIMiMz9Phbr4ulLQTezttSOoXHxYH
 L0RCPUAAbs9Ef0AfcVAxt2fme9uUkpvenLsFY6TKs/eFs94gGX+iyxISywmAO+SVUIRe
 hZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ccpcYMGxqn8WXNFI2X2jCqAbkQ1k7CgYSp60BbZylhE=;
 b=rI0BkkopdGmQYygF44+OOpR7drlaUbiw1oaf92w41uWLwLasgf9Ui8h/gBpoIRJLTL
 rWm/YuENUi+SuxycX3b9M2VCjTmK+XcZbjFy+XtAFJvzr1nKZzTwyYG0VujR9Fn/qO5V
 r4nV1A6rCvOu/DPfajFKkKeC+6NsXyHBrReurdW4aSXxdQQDCN60pJbU1pLGMPBLvqP3
 UVCOGtWZn+9TEKCTYrhloyKrxUc/EggkM6FqcQYEeybXr1uX2cgEPBHHguAjs3UOM0kX
 Qy4OPWTYkq/9Hj+LzE3suat/kA92kgmDTSA2+U8djpvLWxVYG3osPmR50xEZRcJpLhvR
 SV2g==
X-Gm-Message-State: ACgBeo2BopG6Le3LlKKQ2rao5iXHsxdiOY/B4LTZ1yaNkbdu6eFGKfa2
 8kFJFVYERDUO07/lLCbu0fLSmh+s/QI=
X-Google-Smtp-Source: AA6agR6COgoPBS3fD5QQzcIFpuJ6dFD/nNbb+B8U69dVf/sXc9R8FuFABZCcyf7iS9KAx6EdBG16uA==
X-Received: by 2002:a17:907:7f0c:b0:741:ebcc:27c4 with SMTP id
 qf12-20020a1709077f0c00b00741ebcc27c4mr5984284ejc.663.1661940113022; 
 Wed, 31 Aug 2022 03:01:53 -0700 (PDT)
Received: from osoxes.fritz.box (pd95ed71f.dip0.t-ipconnect.de.
 [217.94.215.31]) by smtp.gmail.com with ESMTPSA id
 6-20020a170906310600b0073c10031dc9sm6449583ejx.80.2022.08.31.03.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 03:01:52 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 02/10] hw/isa/vt82c686: Resolve unneeded attribute
Date: Wed, 31 Aug 2022 11:59:06 +0200
Message-Id: <20220831095914.2041-3-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831095914.2041-1-shentey@gmail.com>
References: <20220831095914.2041-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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
2.37.3


