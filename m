Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA056AB280
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 22:28:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYvsk-0000iq-E7; Sun, 05 Mar 2023 16:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYvsh-0000i3-Vh; Sun, 05 Mar 2023 16:27:00 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYvsf-0004EI-Rt; Sun, 05 Mar 2023 16:26:59 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso4120191wmp.4; 
 Sun, 05 Mar 2023 13:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678051616;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7yfSpiRqdxlz0Br6MtTbjSrK5csAsB+qMFSSy/Rhak=;
 b=amv39TighLXGitvJAzTEYyQ3i5WDA+OvQJGOLsRl+YXHGntrKpNubp8VzlCCpDM4RR
 zPu3ZPnHKFvQ0JDmCkuwkPwNVX618Nj7oorcSQI2GjuKdsW3HLRup/1gDuqh0a/xb89C
 /fDPPVBBCJzcWcM2pvPEpQBO0caY9GojKvckLoTi3Y6MDRUm6lCn7kUnhlbj06ehmjvH
 iTyOgHbbd+qk/Trqb/Adro24oL6/XEZz4vcSlUAAKVPxlulKUk0DFlhXDZAOFuANuzmK
 dFYcMXX0lnXqq8BnNf5dItDDpy8UAJ69cM/5OaEMlEYltEHeOKtHqq+0PC5CmEhi+k1h
 4Plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678051616;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7yfSpiRqdxlz0Br6MtTbjSrK5csAsB+qMFSSy/Rhak=;
 b=a+o4K7RXsChHREVzAVDLk2GjJnY+ZI1odKuJzrJqk7rSQXCUyJMcCN1B9hSgNffOoD
 lQbjG7k9bWuPXQnN916QAYUWVirQeyKZiqIYSRBOp1MaiLG0MgqSDyzpfTSmT6I/pXhU
 B52D/PKIG9ez1xdIxs0hAxS2I0SQxj4R46rLQ+nGTMlR9zDIzfmuf/4BJ3F622yqSq7I
 3e9GXcABk+/ZAiZV7Ss92K9dHY/+95kRlNHb19x0oP+/AZ0GpuWVLkmWAmxBN1D/AcQM
 RH/fndk3tclgWxwdkN4AGW6XRgFjdMrNKZFz6NIdhJdHB/eO23SNjc7L0QhHhTjjRWnP
 ex1A==
X-Gm-Message-State: AO0yUKWzxXw4EsvEngSebZnF6cwxamLTwegAot93Sia/WD9kKPl1ll3A
 Wh72elEgPlVepPp3Y0UiaZQ=
X-Google-Smtp-Source: AK7set+n78dG+wSoa0kjDKu4QYlGSSqL3OYy4luWKgRp5Uw/HfoKztPfGiI/zrg1ocX1Re48JjxS1A==
X-Received: by 2002:a05:600c:1907:b0:3eb:29fe:7b9e with SMTP id
 j7-20020a05600c190700b003eb29fe7b9emr6913346wmq.17.1678051615036; 
 Sun, 05 Mar 2023 13:26:55 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-176-138.78.54.pool.telefonica.de.
 [78.54.176.138]) by smtp.gmail.com with ESMTPSA id
 q10-20020a7bce8a000000b003ea57808179sm12153219wmj.38.2023.03.05.13.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 13:26:54 -0800 (PST)
Date: Sun, 05 Mar 2023 21:19:02 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
Subject: Re: [PATCH v7 3/6] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <33eebf66-d4d1-d25f-dbd8-2fdefa0fe211@eik.bme.hu>
References: <cover.1678023358.git.balaton@eik.bme.hu>
 <2c1aa2fad58fffa4e26e8e271243ed30ecd9d41d.1678023358.git.balaton@eik.bme.hu>
 <BB2359B3-F746-4D2D-BBB7-7FC744D5718A@gmail.com>
 <33eebf66-d4d1-d25f-dbd8-2fdefa0fe211@eik.bme.hu>
Message-ID: <FF990389-63CC-46EF-A2ED-DB7D1E306270@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32c.google.com
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



Am 5=2E M=C3=A4rz 2023 17:08:30 UTC schrieb BALATON Zoltan <balaton@eik=2E=
bme=2Ehu>:
>On Sun, 5 Mar 2023, Bernhard Beschow wrote:
>> Am 5=2E M=C3=A4rz 2023 14:05:49 UTC schrieb BALATON Zoltan <balaton@eik=
=2Ebme=2Ehu>:
>>> The real VIA south bridges implement a PCI IRQ router which is configu=
red
>>> by the BIOS or the OS=2E In order to respect these configurations, QEM=
U
>>> needs to implement it as well=2E The real chip may allow routing IRQs =
from
>>> internal functions independently of PCI interrupts but since guests
>>> usually configute it to a single shared interrupt we don't model that
>>> here for simplicity=2E
>>>=20
>>> Note: The implementation was taken from piix4_set_irq() in hw/isa/piix=
4=2E
>>>=20
>>> Suggested-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> Signed-off-by: BALATON Zoltan <balaton@eik=2Ebme=2Ehu>
>>> Tested-by: Rene Engel <ReneEngel80@emailn=2Ede>
>>> ---
>>> hw/isa/vt82c686=2Ec | 42 ++++++++++++++++++++++++++++++++++++++++++
>>> 1 file changed, 42 insertions(+)
>>>=20
>>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>>> index 8900d87f59=2E=2Ee5aa467506 100644
>>> --- a/hw/isa/vt82c686=2Ec
>>> +++ b/hw/isa/vt82c686=2Ec
>>> @@ -600,6 +600,46 @@ void via_isa_set_irq(PCIDevice *d, int n, int lev=
el)
>>>     qemu_set_irq(s->isa_irqs_in[n], level);
>>> }
>>>=20
>>> +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
>>> +{
>>> +    switch (irq_num) {
>>> +    case 0:
>>> +        return s->dev=2Econfig[0x55] >> 4;
>>> +    case 1:
>>> +        return s->dev=2Econfig[0x56] & 0xf;
>>> +    case 2:
>>> +        return s->dev=2Econfig[0x56] >> 4;
>>> +    case 3:
>>> +        return s->dev=2Econfig[0x57] >> 4;
>>> +    }
>>> +    return 0;
>>> +}
>>> +
>>> +static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
>>> +{
>>> +    ViaISAState *s =3D opaque;
>>> +    PCIBus *bus =3D pci_get_bus(&s->dev);
>>> +    int i, pic_level, pic_irq =3D via_isa_get_pci_irq(s, irq_num);
>>> +
>>> +    /* IRQ 0 and 15 mean disabled, IRQ 2 is reserved */
>>=20
>> The vt82c686b datasheet mentions that IRQs 2, 8 and 13 are reserved (->=
 guest errors) while only 0 means disabled=2E I think below code should ref=
lect this=2E
>
>We can't because 8 and 13 are allowed for USB and ac97 but 15 means disab=
led for those=2E My original implementation would have allowed to implement=
 that but this one from you mixes everyting with the PIRQ pins

What I think should be done is not to mix the PIRQ pins with the IRQ lines=
=2E I=2Ee=2E we should only stick to the PCI IRQ routing register descripti=
ons being implemented here=2E See how IRQs 8 & 13 are missing for PCI usage=
 in section "IRQ resources" of page 3-22 in https://cdn=2Eviaembedded=2Ecom=
/eol_products/docs/epia-v/user_manual/epia-v_manual_v1=2E2=2Epdf (manual of=
 a main board using the VT8231)=2E

Best regards,
Bernhard

>so we can't implement different reserved/disabled values for different IR=
Q sources so this is the best we can do=2E IRQ 0 is already handled as disa=
bled by the code below=2E
>
>Regards,
>BALATON Zoltan
>
>>> +    if (unlikely(pic_irq =3D=3D 0 || pic_irq =3D=3D 2 || pic_irq > 14=
)) {
>>> +        if (pic_irq =3D=3D 2) {
>>> +            qemu_log_mask(LOG_GUEST_ERROR, "Invalid ISA IRQ routing")=
;
>>> +        }
>>> +        return;
>>> +    }
>>> +
>>> +    /* The pic level is the logical OR of all the PCI irqs mapped to =
it=2E */
>>> +    pic_level =3D 0;
>>> +    for (i =3D 0; i < PCI_NUM_PINS; i++) {
>>> +        if (pic_irq =3D=3D via_isa_get_pci_irq(s, i)) {
>>> +            pic_level |=3D pci_bus_get_irq_level(bus, i);
>>> +        }
>>> +    }
>>> +    /* Now we change the pic irq level according to the via irq mappi=
ngs=2E */
>>> +    qemu_set_irq(s->isa_irqs_in[pic_irq], pic_level);
>>> +}
>>> +
>>> static void via_isa_realize(PCIDevice *d, Error **errp)
>>> {
>>>     ViaISAState *s =3D VIA_ISA(d);
>>> @@ -620,6 +660,8 @@ static void via_isa_realize(PCIDevice *d, Error **=
errp)
>>>     i8254_pit_init(isa_bus, 0x40, 0, NULL);
>>>     i8257_dma_init(isa_bus, 0);
>>>=20
>>> +    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq", PCI_NUM=
_PINS);
>>> +
>>>     /* RTC */
>>>     qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
>>>     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>>=20
>> 

