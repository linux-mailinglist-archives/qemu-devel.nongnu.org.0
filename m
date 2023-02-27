Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A386A41C0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:34:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcho-0004cl-Ls; Mon, 27 Feb 2023 07:34:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWchS-0004Vs-Us; Mon, 27 Feb 2023 07:33:52 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWchR-0008Nq-0q; Mon, 27 Feb 2023 07:33:50 -0500
Received: by mail-ed1-x531.google.com with SMTP id s26so24984217edw.11;
 Mon, 27 Feb 2023 04:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cCBIFmIAWg8Q7D4jp9k+Iwr3obFsmdZ+ZJHDhgQt8XU=;
 b=UluoqGh2k28P+JS0Vz01Xgq1pelqHd7j8F8guZTsTdZp+Yk4Q23i1MQMs/EIk6eHvt
 6xwDbc1/nHs4P43SqaT1X+SeJ4UhnTgWKEzVxuhZcu7f8Y9PrHtVOMsmcJIEOsxwN+6P
 MNTqlzZ3KwTIWT7sYQwTLIPiUfbHDVI8He6aRU1rDQdLcF6R/xhQOrY2OubpCxaBc9v7
 sHLbmA5IiOGarhPRuuzVJFGQ3cc0EB9x1LuSA3P0lWmCpwkgXcpD2FZpNVhmw2HUsfcg
 yuwqDgAsZAxPyLAw59YaXyEnP5qWE8wDmaVKmd/wK/NwrNvw33nG0CpBNuwedF6RXlTJ
 q7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cCBIFmIAWg8Q7D4jp9k+Iwr3obFsmdZ+ZJHDhgQt8XU=;
 b=LS8aMwyRJ/VMxWBqC/J9bVDJFimYaMbhC3TtknQ2MZMKsg8PHKWaEyB/12d42idpX9
 hAriqW2pkZ2jgUjXsMIvub9/FIvZpSSEdBGqVHFRgazadLXZmoXx4CFgVUyId5LymfKP
 5685Qk4aoRYyQJZ38ExchIvDhM/EikFo9rWtHE361Xu3CGwiEIF5g3axixV0O4JM+zwM
 qP4c06gdYWNU7aE7EcF4tFcxTTzGCX9Y14hXy2b5keKBKWBGH0lleg5YQZNp6O6POR7Z
 E2t8qomNNra2rStthePyQ25Ho1B8UNb7UoMMWXwyHN+z8dyg1/Par8kjNYZ4GpQuc0z+
 0qug==
X-Gm-Message-State: AO0yUKWR+NhPQ062UTnTmr4A33kIpOIFY2crNPjikkhmyGqQfN7oKh4i
 44LPdy/Q8e5GmBLbMsB6la2fqiUU1dU=
X-Google-Smtp-Source: AK7set/PEW0Bk0Ynz4srIWs/iyqiqSMmZUjXNYRpfOZS4BTgnthbye31ZQVxzwuiu/AiXYGbm1/bQw==
X-Received: by 2002:a17:907:d87:b0:885:5682:7e52 with SMTP id
 go7-20020a1709070d8700b0088556827e52mr40648626ejc.13.1677501226668; 
 Mon, 27 Feb 2023 04:33:46 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-154-008.78.55.pool.telefonica.de. [78.55.154.8])
 by smtp.gmail.com with ESMTPSA id
 oy26-20020a170907105a00b008b133f9b33dsm3092124ejb.169.2023.02.27.04.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 04:33:46 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 2/3] hw/isa/vt82c686: Implement PCI IRQ routing
Date: Mon, 27 Feb 2023 13:33:15 +0100
Message-Id: <20230227123316.18719-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227123316.18719-1-shentey@gmail.com>
References: <20230227123316.18719-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The real VIA south bridges implement a PCI IRQ router which is configured
by the BIOS or the OS. In order to respect these configurations, QEMU
needs to implement it as well.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 3f9bd0c04d..7aea97365f 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -604,6 +604,45 @@ static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
     qemu_set_irq(s->cpu_intr, level);
 }
 
+static unsigned via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
+{
+    switch (irq_num) {
+    case 0:
+        return s->dev.config[0x55] >> 4;
+
+    case 1:
+        return s->dev.config[0x56] & 0xf;
+
+    case 2:
+        return s->dev.config[0x56] >> 4;
+
+    case 3:
+        return s->dev.config[0x57] >> 4;
+    }
+
+    return 0;
+}
+
+static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
+{
+    ViaISAState *s = opaque;
+    PCIBus *bus = pci_get_bus(&s->dev);
+    unsigned pic_irq = via_isa_get_pci_irq(s, irq_num);
+    int i, pic_level = 0;
+
+    assert(pic_irq < ISA_NUM_IRQS);
+
+    /* The PIC level is the logical OR of all the PCI irqs mapped to it. */
+    for (i = 0; i < PCI_NUM_PINS; i++) {
+        if (pic_irq == via_isa_get_pci_irq(s, i)) {
+            pic_level |= pci_bus_get_irq_level(bus, i);
+        }
+    }
+
+    /* Now we change the pic irq level according to the via irq mappings. */
+    qemu_set_irq(s->isa_irqs[pic_irq], pic_level);
+}
+
 static void via_isa_realize(PCIDevice *d, Error **errp)
 {
     ViaISAState *s = VIA_ISA(d);
@@ -676,6 +715,8 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
         return;
     }
+
+    pci_bus_irqs(pci_bus, via_isa_set_pci_irq, s, PCI_NUM_PINS);
 }
 
 /* TYPE_VT82C686B_ISA */
-- 
2.39.2


