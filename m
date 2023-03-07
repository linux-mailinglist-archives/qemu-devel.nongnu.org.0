Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAC16AFAB7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:49:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh2u-0003wV-3Q; Tue, 07 Mar 2023 18:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh2s-0003hS-Ad
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:38 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh2m-0002rs-FM
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:37 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h14so13790413wru.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9irWQw02oFu2/D4ty32J7zQYkGSYrUOUK9Or1m5BKRM=;
 b=gwSjzS98wh68Fu2g62z1JKcKVOswblHKob2VT9JjOtYDq22LbtmKNaDA1fJtv2W1AT
 EV4PEnfHsvXV9fkZFHjfFey4bEm7elIRc/4o+ejCRKE9e7IICyYX2gxAIqVWa3nsR/6t
 jceI8fB1gGrP9Fot83WgeMN7M/DOrivjLLFqZ+87zq6cwjwgNW3E/X2hgLDIA3fluhRL
 7rnXMz4v8wm1FMnhnQV2aMwxGVEcglLmU8y+nw1+eDeflXOJqADkJJV3KA1On/JMN0M/
 vE9v2XBsHflvT4892HG+KM8JRDa5iTt/w1i7yYIAtrm5djlTqFbe2aCgvLVt6L2qDtJP
 3HXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9irWQw02oFu2/D4ty32J7zQYkGSYrUOUK9Or1m5BKRM=;
 b=hn8AT+FRxbWjSXLQVW+ZZcpens+KvnOPo8QYWWdDDb4ZNrYUlHyDT2MyGDYoE74eU/
 yAFNLX+80iDFjA2YAYbn5FItuEH0siMXetKfobDA7AgVJwofAKD98K+wDrDo2xnb/+7p
 LiZWuwqSeHBvvzRsvxtbTrdjb3XLxzvAqJU+7OYQiNgzvOG00DwhbvN4YQTKAK+FhDh+
 cP/0iJF9MnsH4bVvPvp2MP8Ceb5jCzUUgpskMYjKOlCfP+vv5WuNVMs6wMYaup/bfjMx
 uv/mpXm/jtS4H+Ky7kyydPRrX/LUSlmmtGEjfVZwyx2KafnvY48IlvKNA5xy1ZNcQiaQ
 bW1w==
X-Gm-Message-State: AO0yUKVWREodBLC/duBYcNN6RExy80hVz5RV4OZ++twrqJivuKCGWo5p
 cdLb+7v27Eid2lLubrJAF0VwXYShqGV8ANmhEPw=
X-Google-Smtp-Source: AK7set9bUKjH516OYKwJDpYTcQvI7vZMOtaGlCpgvrDtdOORegST9Wycc1+PP+mlKDEPdmeA4OKwoA==
X-Received: by 2002:a05:6000:1041:b0:2c6:e91d:1359 with SMTP id
 c1-20020a056000104100b002c6e91d1359mr9832855wrx.61.1678232910583; 
 Tue, 07 Mar 2023 15:48:30 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 o13-20020a5d670d000000b002c8476dde7asm13706104wru.114.2023.03.07.15.48.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:48:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Bernhard Beschow <shentey@gmail.com>, Rene Engel <ReneEngel80@emailn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 13/20] hw/isa/vt82c686: Implement PCI IRQ routing
Date: Wed,  8 Mar 2023 00:47:04 +0100
Message-Id: <20230307234711.55375-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

From: BALATON Zoltan <balaton@eik.bme.hu>

The real VIA south bridges implement a PCI IRQ router which is configured
by the BIOS or the OS. In order to respect these configurations, QEMU
needs to implement it as well. The real chip may allow routing IRQs from
internal functions independently of PCI interrupts but since guests
usually configute it to a single shared interrupt we don't model that
here for simplicity.

Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4.

Suggested-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Tested-by: Rene Engel <ReneEngel80@emailn.de>
Message-Id: <fbb016c7d0e19093335c237e15f5f6c62c4393b4.1678188711.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/vt82c686.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 01e0148967..71da316052 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -604,6 +604,46 @@ static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
     qemu_set_irq(s->cpu_intr, level);
 }
 
+static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
+{
+    switch (irq_num) {
+    case 0:
+        return s->dev.config[0x55] >> 4;
+    case 1:
+        return s->dev.config[0x56] & 0xf;
+    case 2:
+        return s->dev.config[0x56] >> 4;
+    case 3:
+        return s->dev.config[0x57] >> 4;
+    }
+    return 0;
+}
+
+static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
+{
+    ViaISAState *s = opaque;
+    PCIBus *bus = pci_get_bus(&s->dev);
+    int i, pic_level, pic_irq = via_isa_get_pci_irq(s, irq_num);
+
+    /* IRQ 0: disabled, IRQ 2,8,13: reserved */
+    if (!pic_irq) {
+        return;
+    }
+    if (unlikely(pic_irq == 2 || pic_irq == 8 || pic_irq == 13)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid ISA IRQ routing");
+    }
+
+    /* The pic level is the logical OR of all the PCI irqs mapped to it. */
+    pic_level = 0;
+    for (i = 0; i < PCI_NUM_PINS; i++) {
+        if (pic_irq == via_isa_get_pci_irq(s, i)) {
+            pic_level |= pci_bus_get_irq_level(bus, i);
+        }
+    }
+    /* Now we change the pic irq level according to the via irq mappings. */
+    qemu_set_irq(s->isa_irqs_in[pic_irq], pic_level);
+}
+
 static void via_isa_realize(PCIDevice *d, Error **errp)
 {
     ViaISAState *s = VIA_ISA(d);
@@ -627,6 +667,8 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
 
+    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq", PCI_NUM_PINS);
+
     /* RTC */
     qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
-- 
2.38.1


