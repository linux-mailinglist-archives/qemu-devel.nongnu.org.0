Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085FF6AD882
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:52:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZS6P-0004mO-5L; Tue, 07 Mar 2023 02:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pZS6N-0004lv-11; Tue, 07 Mar 2023 02:51:15 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pZS6L-0003l1-0G; Tue, 07 Mar 2023 02:51:14 -0500
Received: by mail-ed1-x535.google.com with SMTP id cy23so48620371edb.12;
 Mon, 06 Mar 2023 23:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678175470;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9UaFNzxyPLabPlebkY5y3ot1yWMp7EcVKK9hX7YMR+k=;
 b=kTSIPPXjNB9h3xhJAS9IlWAWUfwQFdCfBnXqEKQdn1W0UaafhiLWlZLZlc5FbMw1TF
 Va090EVVSynCae4z6FjTZxtL+WN0NrrOv0NDqycJqTywZsjnAK4AbjIPBmweoITPywVM
 HwtL0MwrmHFTsXG6hEyng+qwzeuKhxBx6ZFAyWqMomdXAkIM+tptPbWe294kJlWuEzoa
 ViTkGc2SIXE+xgxwbvGZmitPZmmb/LGXqhIYmkW1EBti3/q/NAhJBnGghvhoESwksBkH
 EkURkPTDurKa3sMu4Mmu1UYh64B9afZUptXfNH5kfLnL3Bj/lGjQJ7UvOE/PvprS1rGE
 wW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678175470;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9UaFNzxyPLabPlebkY5y3ot1yWMp7EcVKK9hX7YMR+k=;
 b=1XUl/BjckheUu8fpgMQJiOR9SOt6CAnuqHCH4Y5GXSFYX/fWSVRpvam9WsBN7xvVQ6
 bcH2AtcM/IPN9N29OiQNKmrZDqc+wLdnV9zgEepELxr/ABhT/166aiC/uT7F5hWaMtM+
 4yAiYibfDC3uJ1h1QIpnZC5ofsmvJKZD/DGDxu25bOKe5HnG/GjKQdh05bg8+mkYKdKR
 5bcG63uYOY3hdUpYpbGOjfKWOyQj1DzVCDbXxmaKG7m5AMNqLNkG0ikkpU5YSF02LO0X
 rhiaNC/OnUYGjt7RedFFHmTFk1NAhSMmuKL/jNvaKe5wtySKee5aH6VDPls1YCQsxJ+M
 nxcw==
X-Gm-Message-State: AO0yUKWy46ZFT13Ax21uhOUiJBAHSdLK+uuRGtKGARLa3MQZ4Map/reA
 C7+lzB00a2/LwEYzY36kcps=
X-Google-Smtp-Source: AK7set98ScMlbByDbfAI4m6QIoINkUMjUpM3d1DxLPrI3XfKtWbaTvPkBuNkI+yStt7r0j2VVKVqXw==
X-Received: by 2002:a17:907:d602:b0:88a:723:f646 with SMTP id
 wd2-20020a170907d60200b0088a0723f646mr16246713ejc.75.1678175470536; 
 Mon, 06 Mar 2023 23:51:10 -0800 (PST)
Received: from [127.0.0.1] ([62.214.191.67]) by smtp.gmail.com with ESMTPSA id
 w21-20020a1709064a1500b008cce6c5da29sm5640145eju.70.2023.03.06.23.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 23:51:10 -0800 (PST)
Date: Tue, 07 Mar 2023 07:51:07 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
CC: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
Subject: Re: [PATCH v8 3/6] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <23370610213adb60877c3751f954b203fe2fa775.1678105081.git.balaton@eik.bme.hu>
References: <cover.1678105081.git.balaton@eik.bme.hu>
 <23370610213adb60877c3751f954b203fe2fa775.1678105081.git.balaton@eik.bme.hu>
Message-ID: <9D6C0560-BDAA-4F85-9232-14FB24082D53@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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



Am 6=2E M=C3=A4rz 2023 12:33:31 UTC schrieb BALATON Zoltan <balaton@eik=2E=
bme=2Ehu>:
>The real VIA south bridges implement a PCI IRQ router which is configured
>by the BIOS or the OS=2E In order to respect these configurations, QEMU
>needs to implement it as well=2E The real chip may allow routing IRQs fro=
m
>internal functions independently of PCI interrupts but since guests
>usually configute it to a single shared interrupt we don't model that
>here for simplicity=2E
>
>Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4=
=2E
>
>Suggested-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Signed-off-by: BALATON Zoltan <balaton@eik=2Ebme=2Ehu>
>Tested-by: Rene Engel <ReneEngel80@emailn=2Ede>
>---
> hw/isa/vt82c686=2Ec | 42 ++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 42 insertions(+)
>
>diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>index 8900d87f59=2E=2E3383ab7e2d 100644
>--- a/hw/isa/vt82c686=2Ec
>+++ b/hw/isa/vt82c686=2Ec
>@@ -600,6 +600,46 @@ void via_isa_set_irq(PCIDevice *d, int n, int level)
>     qemu_set_irq(s->isa_irqs_in[n], level);
> }
>=20
>+static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
>+{
>+    switch (irq_num) {
>+    case 0:
>+        return s->dev=2Econfig[0x55] >> 4;
>+    case 1:
>+        return s->dev=2Econfig[0x56] & 0xf;
>+    case 2:
>+        return s->dev=2Econfig[0x56] >> 4;
>+    case 3:
>+        return s->dev=2Econfig[0x57] >> 4;
>+    }
>+    return 0;
>+}
>+
>+static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
>+{
>+    ViaISAState *s =3D opaque;
>+    PCIBus *bus =3D pci_get_bus(&s->dev);
>+    int i, pic_level, pic_irq =3D via_isa_get_pci_irq(s, irq_num);
>+
>+    /* IRQ 0: disabled, IRQ 2,8,13: reserved */
>+    if (!pic_irq) {
>+        return;
>+    }
>+    if (unlikely(pic_irq =3D=3D 2 || pic_irq =3D=3D 8 || pic_irq =3D=3D =
13)) {
>+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid ISA IRQ routing");

I wonder whether we should return here or not=2E But well, that's probably=
 why it's reserved=2E Let's see how it goes and revist in case we learn mor=
e=2E=2E=2E

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

>+    }
>+
>+    /* The pic level is the logical OR of all the PCI irqs mapped to it=
=2E */
>+    pic_level =3D 0;
>+    for (i =3D 0; i < PCI_NUM_PINS; i++) {
>+        if (pic_irq =3D=3D via_isa_get_pci_irq(s, i)) {
>+            pic_level |=3D pci_bus_get_irq_level(bus, i);
>+        }
>+    }
>+    /* Now we change the pic irq level according to the via irq mappings=
=2E */
>+    qemu_set_irq(s->isa_irqs_in[pic_irq], pic_level);
>+}
>+
> static void via_isa_realize(PCIDevice *d, Error **errp)
> {
>     ViaISAState *s =3D VIA_ISA(d);
>@@ -620,6 +660,8 @@ static void via_isa_realize(PCIDevice *d, Error **err=
p)
>     i8254_pit_init(isa_bus, 0x40, 0, NULL);
>     i8257_dma_init(isa_bus, 0);
>=20
>+    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq", PCI_NUM_PI=
NS);
>+
>     /* RTC */
>     qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
>     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {

