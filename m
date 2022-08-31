Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED445A826A
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 17:55:13 +0200 (CEST)
Received: from localhost ([::1]:59718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTQ3b-0005oa-O3
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 11:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvE-0002fY-1w; Wed, 31 Aug 2022 11:46:33 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:42520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvB-00036E-Kp; Wed, 31 Aug 2022 11:46:31 -0400
Received: by mail-ej1-x633.google.com with SMTP id p16so26096034ejb.9;
 Wed, 31 Aug 2022 08:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ccpcYMGxqn8WXNFI2X2jCqAbkQ1k7CgYSp60BbZylhE=;
 b=KRJAPydy6BGrD99QFyZyLpSmpNAOv5khBb9fNHDUsanIjUajpo64ybIcouBQc6wzWS
 yf3Xfec0Ya37YO1ls0Tk5DYlU54cJOSJ+LS8Zkd+ywDXLq2XqOGqKWCq83oc0GCsgot1
 mCHv9Oo6+C53i6JZAGbjJ1u6/s7FQVbR7NJ2XzFUNru7pb0HCavFNxTL9vetb13hiarb
 C/JX4a4KXwbCFvc7G+EzGWjw7t+KRWkAcvPA73Z2GPme74cAmDRv+U/XxilT1adIOHQi
 rft3cGmljtiQmf3DpFy5HnsvdV+Rif/VHfolftkl6V7gqjK4kN26cLVQDa/5ASIhfRGz
 E3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ccpcYMGxqn8WXNFI2X2jCqAbkQ1k7CgYSp60BbZylhE=;
 b=OpR0MIYDri9QfdhTeMKhXm7bmj8Ns8F8SQlJTQ8OY48Jk83iW/haeS5qohAQqGuKWP
 JNsBhAcJh/dd2IOI0RzEKeIPeciK9VR+8b/HR7oHAfveY6vQl0vNnk9oohGNkB9uMS1n
 WZ7exErKJ6ktVSwVud3mE9gtrA0vsLTCkKj37EZx24DgBFUICiRtq3FG/335vVAbkXgd
 pvCTKvQAVDUs/+/OGIQwr92H2EfQRQJyj6ztkIBN9EBi4Ik5fCEx+d+pgBPTfewcFh8W
 1C+JOuP33jaELnOI0Qm4gHaBVJbARJ+Oar7ZIWhwwE6Czlfvmqn1/tDR39xl9Ai1eYFI
 7EsA==
X-Gm-Message-State: ACgBeo1MhE7+QSXRY6scYYtHXeWZZeONqBeM+bGQHt8sVPflk2q/YHBC
 1lOo49Sp7bIR/EGzhsqDS6xU2tCmF6w=
X-Google-Smtp-Source: AA6agR4HubmOYEiIIdoTTN/E8s8xZemJQ1BX+KPlJcOC/aLXO+JfRbVnn6YBK//GY9d1G8jfnwkPng==
X-Received: by 2002:a17:907:868b:b0:741:8f8c:6ab5 with SMTP id
 qa11-20020a170907868b00b007418f8c6ab5mr10534674ejc.194.1661960787263; 
 Wed, 31 Aug 2022 08:46:27 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a508ac9000000b00445e930e20esm9252123edk.64.2022.08.31.08.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 08:46:26 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 02/12] hw/isa/vt82c686: Resolve unneeded attribute
Date: Wed, 31 Aug 2022 17:45:55 +0200
Message-Id: <20220831154605.12773-3-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831154605.12773-1-shentey@gmail.com>
References: <20220831154605.12773-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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


