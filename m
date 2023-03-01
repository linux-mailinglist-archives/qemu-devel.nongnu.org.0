Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DCA6A67AF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 07:40:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXG83-0007PQ-90; Wed, 01 Mar 2023 01:39:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pXG7t-0007KG-GM; Wed, 01 Mar 2023 01:39:46 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pXG7q-0007bf-Fy; Wed, 01 Mar 2023 01:39:44 -0500
Received: by mail-ed1-x52e.google.com with SMTP id o15so47173618edr.13;
 Tue, 28 Feb 2023 22:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677652780;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E9U0vw1FU0/HBw87/Xs/oKcu8X7AcQ6fjQvVxDMoLhY=;
 b=JD5VNyH+FI98KEKW8OZ//qo9XcCGp2IeWy7vFB9I7O3op87EYdxhuketmKgz0nfysV
 6+HMutnB/pdjAtCjZFEiSrLDUUSYHVmtjzxCU1Rp6hVSpThyGZjJkziqvQUpdEI69T/g
 yzrTu+6X5QShRNJvLcQpeIwKPo1FUV3ofkR/riTRKmv9/a4otziWO5fBlIa8KEzepT+m
 oKiONNyUCkwTBqcx99dBrN4qPUPQpyk4exQbwh+CLS+5tozdK+/rLQwKdJEyn8Z0tR4Z
 iNW58tG0rlPtbChMcDFbRaA08xkkZxYXTxtftD0oqjKZBdj0soC88bYJ17b6z4iiFNWT
 jq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677652780;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E9U0vw1FU0/HBw87/Xs/oKcu8X7AcQ6fjQvVxDMoLhY=;
 b=osEDbK6LqJ4eWSMQqwwY/BN9kTPbn6GsO6MBVs/GlVh0Kvas+TdPYtP5SrW8h7FL3K
 1FFVFJXY6d+RbJiNA4WghHFgpMetFb8KUu5OsfjD1WFDWCFyhAOCwuK8LAGznd/LnQZP
 /T1z2SgTWKcfPCssc6rMuoq1ozcderBdWjaghBxuRjW8z8ji5PbWgaSBjbnVU6Z3T43F
 uyeuvsn2sYb5mtKwD1xrAUZJXjyMJJNf7wmesDOrd5hb9lsJX0CKo+uW/0uYj0yWY0uc
 0LTSHllS9Kb6OTaJ7Kj4qkGGANC2tdxeioYHn+4sSHDjFGyYNGlwqfLh1SnGoL6GdDiw
 dnOw==
X-Gm-Message-State: AO0yUKUG3A0Z8/5826bhppG2M5gxClivJIIO4DCMobnJnk6OB2BPYkBV
 G+Rw6992cQaHumK7vKQAbnY=
X-Google-Smtp-Source: AK7set93Wv7sAxKjJZYbDsdgRIHJKpCfzUrZ7P1MolpLH4kHp8dGBpsi66Dg23ZPUHYDAAyORwTzIA==
X-Received: by 2002:a17:906:2348:b0:8e5:c06b:90e9 with SMTP id
 m8-20020a170906234800b008e5c06b90e9mr5221883eja.50.1677652780308; 
 Tue, 28 Feb 2023 22:39:40 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-154-055.78.54.pool.telefonica.de.
 [78.54.154.55]) by smtp.gmail.com with ESMTPSA id
 kq2-20020a170906abc200b008d2683e24c4sm5401314ejb.69.2023.02.28.22.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 22:39:39 -0800 (PST)
Date: Wed, 01 Mar 2023 06:38:53 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
CC: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
Subject: Re: [PATCH v5 3/7] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <36574dd259a98b240bfe12cd9ffa30b778bf06eb.1677628524.git.balaton@eik.bme.hu>
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <36574dd259a98b240bfe12cd9ffa30b778bf06eb.1677628524.git.balaton@eik.bme.hu>
Message-ID: <375EC0ED-F7D8-4A40-B316-F7BA32709836@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



Am 1=2E M=C3=A4rz 2023 00:17:09 UTC schrieb BALATON Zoltan <balaton@eik=2E=
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
>---
> hw/isa/vt82c686=2Ec | 38 +++++++++++++++++++++++++++++++++++++-
> 1 file changed, 37 insertions(+), 1 deletion(-)
>
>diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>index 01e0148967=2E=2E018a119964 100644
>--- a/hw/isa/vt82c686=2Ec
>+++ b/hw/isa/vt82c686=2Ec
>@@ -604,6 +604,42 @@ static void via_isa_request_i8259_irq(void *opaque, =
int irq, int level)
>     qemu_set_irq(s->cpu_intr, level);
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
>+    if (unlikely(pic_irq =3D=3D 0 || pic_irq =3D=3D 2 || pic_irq > 14)) =
{

Where does the "pic_irq > 14" come from? It's not mentioned in the datashe=
et=2E

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
>@@ -615,9 +651,9 @@ static void via_isa_realize(PCIDevice *d, Error **err=
p)
>=20
>     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
>     isa_irq =3D qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
>+    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq", PCI_NUM_PI=
NS);
>     isa_bus =3D isa_bus_new(dev, pci_address_space(d), pci_address_space=
_io(d),
>                           errp);
>-
>     if (!isa_bus) {
>         return;
>     }

