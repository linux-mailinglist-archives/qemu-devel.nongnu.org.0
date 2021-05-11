Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1B2379E45
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 06:20:57 +0200 (CEST)
Received: from localhost ([::1]:60972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgJtA-0001gc-HC
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 00:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJrN-0007S9-HN; Tue, 11 May 2021 00:19:06 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:43004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJrM-0000Y6-0W; Tue, 11 May 2021 00:19:05 -0400
Received: by mail-ed1-x535.google.com with SMTP id j26so17551944edf.9;
 Mon, 10 May 2021 21:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DiFFH8O4TIOlJxeMKOOEACbUi4Vw6SFr1FrtvEk5qRE=;
 b=Cq3bzcIjQIHrJrSKnHQOMDPGmQEvteAwjVoQ0IqnVsCKSDsQPZv7CCf0XDeYzfjIOv
 BIbwfq4vQBfzigO1jy8ysnydjbkBS6/Yl9oiTJF2FUdZRXco7KdTiQx4GzbU1Nm09kxs
 qDMdmS8cqo/8bVBRdxnhbJQhmJMKRjY3dHARpS7GlVK6LSOaJwBqCmLTvXI/KY8LnBzT
 y0J8LWxMfYVSfXNWUoUbQuulfd+bkqIjXcA99yyyjytd/7TJ5w7rQmnyueN7KAw4lb2z
 aNMdOWiC5nFgQU/Kxdk5ARas7en03K8LnLRioHHDtyAyB3XAmJRyKmMtEi1I6t4IhHPN
 3jeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DiFFH8O4TIOlJxeMKOOEACbUi4Vw6SFr1FrtvEk5qRE=;
 b=g83lpqG/0dQEx1IBPf/AJ4RfUtnIHLF7vgy+mCV70F5oUfKdm2HCXwvz3kk/ovSNah
 ICo/GmaunUrSGzLsZvdAN1RD311PhR+9Ii6top31h/QWefmgPAZceyLxp8bjSu3l17iE
 7U7nV5VmPZqK0kNOG3lF8vl/vY/+dsTcKXUySJdFUGbrbaK/8Lwfhs2Ij58ljIeSIoOj
 CkqwrI/0Ad4voW4qUjQfYKQSgxBk4vLaUKNhvuvVuVoMHfMtpVjVRelQxfWSJgTRGG3h
 ltth2cb+N5nbpPZMDIsqyk5TEkn9VZ3q0YqoF0mDaqh2tQRUFpLV9MiU9mX+wDYv349l
 t79w==
X-Gm-Message-State: AOAM530OVPX4iLxN8wd/HMR6eSdDooqNyNAwhzsgjONk5+dxMw7ESG23
 YoPK2eunsX+aVOL56eKBCTz2LlhNJdVFQw==
X-Google-Smtp-Source: ABdhPJyWUYTPZzrNyB/5Hf7Op/WCbE+5Cfz8A+1PSMeuHDR0mxT282UpV4In2loruKtE/pVUXFJ5wA==
X-Received: by 2002:a05:6402:12c6:: with SMTP id
 k6mr33326023edx.372.1620706742138; 
 Mon, 10 May 2021 21:19:02 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g4sm13080055edq.0.2021.05.10.21.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:19:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] hw/isa/vt82c686: Simplify removing unuseful
 qemu_allocate_irqs() call
Date: Tue, 11 May 2021 06:18:44 +0200
Message-Id: <20210511041848.2743312-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511041848.2743312-1-f4bug@amsat.org>
References: <20210511041848.2743312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of creating an input IRQ with qemu_allocate_irqs()
to pass it as output IRQ of the PIC, with its handler simply
dispatching into the "intr" output IRQ, simplify by directly
connecting the PIC to the "intr" named output.

Fixes: 3dc31cb8490 ("vt82c686: Move creation of ISA devices to the ISA bridge")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index b177016125d..2ce5c6cbb00 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -566,12 +566,6 @@ static const TypeInfo via_isa_info = {
     },
 };
 
-static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
-{
-    ViaISAState *s = opaque;
-    qemu_set_irq(s->cpu_intr, level);
-}
-
 /* TYPE_VT82C686B_ISA */
 
 static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
@@ -612,14 +606,12 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
     ViaISAState *s = VIA_ISA(d);
     DeviceState *dev = DEVICE(d);
     ISABus *isa_bus;
-    qemu_irq *isa_irq;
     int i;
 
     qdev_init_gpio_out_named(dev, &s->cpu_intr, "intr", 1);
-    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
                           &error_fatal);
-    isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
+    isa_bus_irqs(isa_bus, i8259_init(isa_bus, s->cpu_intr));
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
     s->via_sio = VIA_SUPERIO(isa_create_simple(isa_bus,
@@ -693,14 +685,12 @@ static void vt8231_realize(PCIDevice *d, Error **errp)
     ViaISAState *s = VIA_ISA(d);
     DeviceState *dev = DEVICE(d);
     ISABus *isa_bus;
-    qemu_irq *isa_irq;
     int i;
 
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
-    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
                           &error_fatal);
-    isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
+    isa_bus_irqs(isa_bus, i8259_init(isa_bus, s->cpu_intr));
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
     s->via_sio = VIA_SUPERIO(isa_create_simple(isa_bus, TYPE_VT8231_SUPERIO));
-- 
2.26.3


