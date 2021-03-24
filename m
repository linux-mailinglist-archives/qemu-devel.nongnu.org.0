Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8467A348007
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:08:22 +0100 (CET)
Received: from localhost ([::1]:49488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP7vZ-0002il-7b
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7ip-0004QU-8f; Wed, 24 Mar 2021 13:55:11 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7in-0008Ts-AP; Wed, 24 Mar 2021 13:55:10 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so3142067wma.0; 
 Wed, 24 Mar 2021 10:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FzI31dN/YNq+VHVWsKeAjQQulyO/vssJBqSN8FGglrs=;
 b=qC4JfUYB97dfHI/xDXfAqUHjJgQ41XTQFqeV5LtxN1kUljV5amsOEywfVyDjTlPAFb
 GqECPgRCVVOD0v7MZ2XzS1mfRwq9XLxZu+kR/hn49b7f0DgS8ehPKKradAmG4nw+jdK7
 Psl2HN4qqmMxWYopFXLWHcPs+D6+fXf7OK6HqnYvlQbsxg2nGpeIsJB41ChC3Lsh4S+X
 4syozOL6F8BfTNUxtLwAbx0ks95hCKokq5Bsb7ltct8Huu/gwHe9mH5jOgINUPjpPJiA
 fZWAC+YSA+U5YojpuIjA580uJXEJX5T7dbPGQ22JizYkCkqWGeFmuyHW7j60uQxMjfKU
 WNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FzI31dN/YNq+VHVWsKeAjQQulyO/vssJBqSN8FGglrs=;
 b=FRd+Yb0nIgFi0xAHRxRjfZ/GLERd9M9wPsPJwUzeFmuTAdagr01FW74NRVykZHzHuB
 kCF8HZClr25RyJS3g+qLPcw7ved/qfAsw5fZhJpvujOOFxGjXfx3t1hf9/8lCsqqhefl
 J3xksukcU9GcJt3mbm8busG7GLThwk+AF42g1sy1gK6cDX23lOH4+9Dqla9+8IAJd05B
 8jkPnh/zN27nV9L7w45rWXCbq/QzsXGM0gmgSmWYdVuOSOCOoEgsm3kSlyjGNxVo6zoq
 yMP5u63qD+60/Wu5jMLakLs9lZlBqSkMXXcj+SGEGKDTmOcEMh8moVN74Er6jJnsu6VE
 OdnA==
X-Gm-Message-State: AOAM5324Ebi7qvoGtz3c4V0UK2TIq8IJTZRhafwLVshX6LYhnyWe/TjW
 GxzDzFlc40ZBwOKZBSMjDHlWxo1SZyucEg==
X-Google-Smtp-Source: ABdhPJxZwLHHAcs5oIToGijduy+c5bM4Je4oNXfcaGAgpmGT8wODVDWVPNqZT3YTzcupyrKlWRZtZQ==
X-Received: by 2002:a1c:bdc2:: with SMTP id n185mr4160832wmf.128.1616608506064; 
 Wed, 24 Mar 2021 10:55:06 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x25sm3414026wmj.14.2021.03.24.10.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 10:55:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] hw/isa/vt82c686: Let ISA function expose ISA IRQs
Date: Wed, 24 Mar 2021 18:54:35 +0100
Message-Id: <20210324175438.680310-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210324175438.680310-1-f4bug@amsat.org>
References: <20210324175438.680310-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 2 cascaded 8259 PIC are managed by the PCI function #0
(ISA bridge). Expose the 16 IRQs on this function, so other
functions from the same chipset can access them.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 3dc3454858e..4359c87e2ee 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -320,6 +320,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
 struct VT82C686BISAState {
     PCIDevice dev;
     qemu_irq cpu_intr;
+    qemu_irq *pic_irq;
     SuperIOConfig superio_cfg;
 };
 
@@ -373,6 +374,13 @@ static void vt82c686b_isa_reset(DeviceState *dev)
     s->superio_cfg.regs[0xe8] = 0xbe; /* Serial port 2 base addr */
 }
 
+static void vt82c686b_isa_irq(void *opaque, int irq, int level)
+{
+    VT82C686BISAState *s = opaque;
+
+    qemu_set_irq(s->pic_irq[irq], level);
+}
+
 static void vt82c686b_realize(PCIDevice *d, Error **errp)
 {
     VT82C686BISAState *s = VT82C686B_ISA(d);
@@ -383,7 +391,10 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
     qdev_init_gpio_out_named(dev, &s->cpu_intr, "intr", 1);
     isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
                           &error_fatal);
-    isa_bus_irqs(isa_bus, i8259_init(isa_bus, s->cpu_intr));
+    s->pic_irq = i8259_init(isa_bus, s->cpu_intr);
+    isa_bus_irqs(isa_bus, s->pic_irq);
+    qdev_init_gpio_in_named(dev, vt82c686b_isa_irq, "isa-irq", ISA_NUM_IRQS);
+
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
     isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
-- 
2.26.2


