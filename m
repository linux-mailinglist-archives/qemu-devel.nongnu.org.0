Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E31B6AAE7B
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 08:36:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYit6-00008B-HL; Sun, 05 Mar 2023 02:34:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYit2-00007w-4O; Sun, 05 Mar 2023 02:34:28 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYisz-0005gF-Gb; Sun, 05 Mar 2023 02:34:27 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l1so5871897wry.12;
 Sat, 04 Mar 2023 23:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678001663;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oTYt8SFHiKPLsd0ANIUNkQFIbjMNSOgG9p/CHMfAQH0=;
 b=EJpQRBDB1hrPLxjjzqhkgnfppr1cqDp+Uw65NmKdss7vUfcP0M+HPbb5xqZuYljFHa
 /IZ2MTTcnZGFJVNSL/8rqwjD91hkpzoaTV+UZyacunc9KrFPc+0wa0AgsanvNKLbro8Z
 IcuPbxIzjMGu8/gprXaumtNjly7EoE0mpGvCapkDv1sI79cNRiCOjOGoK9oj5uY0UaEz
 LLWu4eOA0JyDreb7gRu3deAYK1uLQf/1eul5qka7NcxM4+875r5KkVN6Ooq5McQoZcf5
 /tJMuZ5YOg/Fg9/bYqg47bRY/PFLV37Y1T3ksAlN/7xBZoeTt4IrsfjxTjYMBrI4z3Eu
 bpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678001663;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oTYt8SFHiKPLsd0ANIUNkQFIbjMNSOgG9p/CHMfAQH0=;
 b=MHQ70IkPQUH/PaRCh7dv8WU3xHyb0iBm3xrDjAFZ+JDmPlvzfYSnYJDNZb5WOVZRlK
 ObI8mEvx7zheckkkRpTa9Mdsm9QlRYlU+MmO+FTbiIp5jnJ1K8PCBIw9hwpyUIW+cq/N
 vn322Xdpe1fB9wTES698P3d86CnUiBYDD7Ql48Mp/HnndxG1EPthW+oPHXTj3gIx9Eae
 pVdM8hj86+pt846dZ1DtGbAlsJoZ0TgTS8fGSc+9PriAdOA/gD0DjxeTZegil7vHsr9K
 n66hQVA320nZhTti/xaMmNHH4yEwlaFp+wILLunz/2bSMDXufGKcuVjBYARZirCLusOw
 W8EQ==
X-Gm-Message-State: AO0yUKUvyAfgJFky83qk+5Goz30LVSqs8sIx39kem7J4FTWRRSz6ceo/
 gky6bpKMaJqO8tb5pLcqF1Q=
X-Google-Smtp-Source: AK7set9bGh1zp0rFasLdJJDxfimjczl2TYJj9hCCUoWlL9b3AOIVEsye6H+Ysa1fgyPvvB4jlb8N5Q==
X-Received: by 2002:a5d:45c3:0:b0:2c5:6247:b89d with SMTP id
 b3-20020a5d45c3000000b002c56247b89dmr4602018wrs.6.1678001663469; 
 Sat, 04 Mar 2023 23:34:23 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-176-138.78.54.pool.telefonica.de.
 [78.54.176.138]) by smtp.gmail.com with ESMTPSA id
 t20-20020a0560001a5400b002c54f4d0f71sm6897477wry.38.2023.03.04.23.34.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Mar 2023 23:34:23 -0800 (PST)
Date: Sun, 05 Mar 2023 07:34:15 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
CC: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
Subject: Re: [PATCH v6 3/7] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <7c2b8906bc5fc9ac5eb8836ca2f6dc05c9046c01.1677940224.git.balaton@eik.bme.hu>
References: <cover.1677940224.git.balaton@eik.bme.hu>
 <7c2b8906bc5fc9ac5eb8836ca2f6dc05c9046c01.1677940224.git.balaton@eik.bme.hu>
Message-ID: <B46A85AE-53B3-4DD8-8CD5-C8D393D1824C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42b.google.com
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



Am 4=2E M=C3=A4rz 2023 14:48:20 UTC schrieb BALATON Zoltan <balaton@eik=2E=
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
> hw/isa/vt82c686=2Ec | 38 ++++++++++++++++++++++++++++++++++++++
> 1 file changed, 38 insertions(+)
>
>diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>index f4c40965cd=2E=2E51c0dd4c41 100644
>--- a/hw/isa/vt82c686=2Ec
>+++ b/hw/isa/vt82c686=2Ec
>@@ -598,6 +598,42 @@ void via_isa_set_irq(PCIDevice *d, int n, int level)
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
>+    if (unlikely(pic_irq =3D=3D 0 || pic_irq =3D=3D 2 || pic_irq > 14)) =
{

In the previous iteration I already mentioned this: Why "pic_irq > 14"? Pl=
ease either remove or put a comment in the code since the datasheet allows =
it=2E Otherwise this leads to hard to comprehend and therefore hard to main=
tain code=2E

Moreover, "pic_irq =3D=3D 2" is reserved which we should log a guest error=
 for=2E Otherwise, misbehaving guests will go unnoticed, which is exactly w=
hat guest errors should prevent=2E Also, logging a guest error here makes t=
he code more self documenting=2E

Note that excess logging can always be filtered out using grep=2E

Best regards,
Bernhard

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
>@@ -619,6 +655,8 @@ static void via_isa_realize(PCIDevice *d, Error **err=
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

