Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A776A1126
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:24:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVI7e-0005es-RL; Thu, 23 Feb 2023 15:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVI7c-0005dd-JC; Thu, 23 Feb 2023 15:23:20 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVI7Z-0002Nv-35; Thu, 23 Feb 2023 15:23:19 -0500
Received: by mail-ed1-x52e.google.com with SMTP id s26so46695297edw.11;
 Thu, 23 Feb 2023 12:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=URC4QULn1s6Vm1JS2+nnjxOu3AuTbC5LZ+8A63obzbk=;
 b=Ud2cFpNPmcI0ZMmV13Y2JgvJBl5uo+ugE6ro05qlmV1OtCAilKNBEoQSYlJGJ3BZMl
 uxBmCEnppdaFo1RfeFbAG8XmC05Muy1dXYYugVXuN8WXKHj07g8qGJrsnSPzBXzVgLEn
 9rLtliqnnFBKo60jn4Ggfp55NmKVXhXasonokNoctq5iLwuKFGoQDngDLIGQZM/F/LPo
 JPZkovIDprU+L6S3BMWrx57/UlPQHyijaZnp43Kc2dI+5naaVZsngZrhDV6oGgqbHiEk
 I8dCCf9kL7RSOA3krUFY5ScpedZn2T+oKNyCfslOgmm6XBNLAJHYoB0etGXcKHHEixlq
 LBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=URC4QULn1s6Vm1JS2+nnjxOu3AuTbC5LZ+8A63obzbk=;
 b=J6C6fYhcJ5dngFULYJkT5rT7Pi1mKTNJGDa7s0rwLUW5hOWENLVLGFiepFZtF4GBt/
 gK2OOJvZAjBvsup7Hj7es6TtSU9ANubS9CQVHv8T7U/Qkjks/v7HSOyKGvieoZfEm0dW
 o8oyNfsdPzDxbXZkDrZlrNnjuc9AlfI7Sm/1dnbFb+c2kr7zMtEFne0ZN0mN+dcSkwQb
 BX8C36DCbgpth2akhTquXq8O/HfHk4YidBtGmcJDTDQXKbuKziVIzS/6rrT/S1q+yWrP
 B6hmk07ygrGwzI2Ajhrk4svomHjV0Uh6Mos51QkX/wTrGotXksDT86/onX0pfM868LGx
 U9jw==
X-Gm-Message-State: AO0yUKV4Y14k59NtcmpJ8dZ81rLrSWADER81U/Cc19uIzbAAo2vwoF3L
 fOG4P1ZF8MC4JddLEz8O552swSBAlpY=
X-Google-Smtp-Source: AK7set+V6EmoQRLSALSepupWkjPI/pJ9jCrRb64D3/rEeC2rtzhOBeaKgXbrAEl/T1XFZbLvJ2kvpQ==
X-Received: by 2002:a17:907:7b97:b0:8db:4c66:59cf with SMTP id
 ne23-20020a1709077b9700b008db4c6659cfmr16788511ejc.42.1677183794547; 
 Thu, 23 Feb 2023 12:23:14 -0800 (PST)
Received: from osoxes.fritz.box (pd9ed7433.dip0.t-ipconnect.de.
 [217.237.116.51]) by smtp.gmail.com with ESMTPSA id
 jj1-20020a170907984100b008d606b1bbb1sm5200917ejc.9.2023.02.23.12.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:23:14 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/5] hw/isa/vt82c686: Implement PCI IRQ routing
Date: Thu, 23 Feb 2023 21:20:50 +0100
Message-Id: <20230223202053.117050-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223202053.117050-1-shentey@gmail.com>
References: <20230223202053.117050-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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

Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 3f9bd0c04d..f24e387d63 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -604,6 +604,48 @@ static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
     qemu_set_irq(s->cpu_intr, level);
 }
 
+static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
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
+    int pic_irq;
+
+    /* now we change the pic irq level according to the via irq mappings */
+    /* XXX: optimize */
+    pic_irq = via_isa_get_pci_irq(s, irq_num);
+    if (pic_irq < ISA_NUM_IRQS) {
+        int i, pic_level;
+
+        /* The pic level is the logical OR of all the PCI irqs mapped to it. */
+        pic_level = 0;
+        for (i = 0; i < PCI_NUM_PINS; i++) {
+            if (pic_irq == via_isa_get_pci_irq(s, i)) {
+                pic_level |= pci_bus_get_irq_level(bus, i);
+            }
+        }
+        qemu_set_irq(s->isa_irqs[pic_irq], pic_level);
+    }
+}
+
 static void via_isa_realize(PCIDevice *d, Error **errp)
 {
     ViaISAState *s = VIA_ISA(d);
@@ -676,6 +718,8 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
         return;
     }
+
+    pci_bus_irqs(pci_bus, via_isa_set_pci_irq, s, PCI_NUM_PINS);
 }
 
 /* TYPE_VT82C686B_ISA */
-- 
2.39.2


