Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2156AB167
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 17:46:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYrTR-0003rT-LN; Sun, 05 Mar 2023 11:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYrTQ-0003rG-01; Sun, 05 Mar 2023 11:44:36 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYrTO-0000bL-9p; Sun, 05 Mar 2023 11:44:35 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso3884270wms.5; 
 Sun, 05 Mar 2023 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678034672;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZA7RYFOIBERpSBU5fVunrjPt2LM9w5Na3fAMRMZZ+AY=;
 b=bHJa8wCGnYKhkF76ddUiSVDoTcZVQ77jby2OICbWY4b0vjMr5b/saJhWuM5Iia3gpf
 kSpG5xcQAD2NV5xz6WPRZ8amZdw6Zjh+pRwhkX0/F3sNE1+rQrZyVTY6xDgKjDENVL3E
 oA2jLNY/+vgXCNuIrHWmOQhg7m53hmDDqF5BpAi1BuWjooAFjOtPwY/f74JZJDfbZVTC
 TMwmw4hXzTuY2Ej3/3KUo2RhzQsEyZKEUge3wbIXp6cIrO1UleaStOnyE1nLUjvrHDBs
 yFCB4N2k8iKI27Le9qVVbJlAHMdcVn3jT3lOW4uFwEI+diIigS5DCDgi62wZ8Hvu+wjE
 FTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678034672;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZA7RYFOIBERpSBU5fVunrjPt2LM9w5Na3fAMRMZZ+AY=;
 b=WGP/6Omk18F+Y7cVK26Ae0VifWMOTcsIVB2+88ekpbw7kithCH9ZAtETnQEir5Tg41
 AKXzkEhuHrX8/cTgVSwBU63TVDsXpTGn3iir2b43dJgziNpUPUz3hJUnuuskmqnV/kQy
 0ctXlVOxznTBCxBs4N7dious0ICNZwZoKXvrAYJtetLPMOJN8k9HGNkxOyXg8DrVye/s
 5CybB78o1sTwH0ZrAyRinRjYWRMpzhi2WomSvwAi7C/89bbzNV+UXVRh+s9fgH92m5oP
 Fghy4+5+rtrBn7AlxpiHhBC2rMipIWyOaCH+lzJYi8HNfw2sX80Z+7Jv/Aagf1Ksxoj/
 jzXg==
X-Gm-Message-State: AO0yUKWeWTDPiFSjKRT1oK9N9yggjvUoq4/hGPFHooAXiluUVEPoK3E+
 R+AxaUas8Pa3uMbEdIjaxig=
X-Google-Smtp-Source: AK7set8nAqQ6dWjZE8qdDs42+m2Cx9R5xWgRe5+BBQyyNO9wCA581U8Ie/dldht8MgU+fSyc0tGXcw==
X-Received: by 2002:a05:600c:1d0e:b0:3eb:376e:2ba5 with SMTP id
 l14-20020a05600c1d0e00b003eb376e2ba5mr6808382wms.3.1678034671963; 
 Sun, 05 Mar 2023 08:44:31 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-176-138.78.54.pool.telefonica.de.
 [78.54.176.138]) by smtp.gmail.com with ESMTPSA id
 o13-20020a5d670d000000b002c8476dde7asm7747489wru.114.2023.03.05.08.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 08:44:31 -0800 (PST)
Date: Sun, 05 Mar 2023 16:44:23 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
CC: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
Subject: Re: [PATCH v7 3/6] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <2c1aa2fad58fffa4e26e8e271243ed30ecd9d41d.1678023358.git.balaton@eik.bme.hu>
References: <cover.1678023358.git.balaton@eik.bme.hu>
 <2c1aa2fad58fffa4e26e8e271243ed30ecd9d41d.1678023358.git.balaton@eik.bme.hu>
Message-ID: <BB2359B3-F746-4D2D-BBB7-7FC744D5718A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32a.google.com
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



Am 5=2E M=C3=A4rz 2023 14:05:49 UTC schrieb BALATON Zoltan <balaton@eik=2E=
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
>index 8900d87f59=2E=2Ee5aa467506 100644
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
>+    /* IRQ 0 and 15 mean disabled, IRQ 2 is reserved */

The vt82c686b datasheet mentions that IRQs 2, 8 and 13 are reserved (-> gu=
est errors) while only 0 means disabled=2E I think below code should reflec=
t this=2E

Best regards,
Bernhard

>+    if (unlikely(pic_irq =3D=3D 0 || pic_irq =3D=3D 2 || pic_irq > 14)) =
{
>+        if (pic_irq =3D=3D 2) {
>+            qemu_log_mask(LOG_GUEST_ERROR, "Invalid ISA IRQ routing");
>+        }
>+        return;
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

