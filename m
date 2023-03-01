Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCEE6A75DF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:09:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXThA-0004lV-Sh; Wed, 01 Mar 2023 16:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pXTgy-0004V8-2X; Wed, 01 Mar 2023 16:08:53 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pXTgp-0007Tq-CD; Wed, 01 Mar 2023 16:08:47 -0500
Received: by mail-ed1-x530.google.com with SMTP id g3so3957145eda.1;
 Wed, 01 Mar 2023 13:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677704920;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NfdgY2A73a5OGKdx5+rNn/bPcoeTE1XjAcGxuU2C64U=;
 b=BdSIN+Qax7FP19gnpjrle7hQvz6KTMBeYPorY00gYpJRqMej2Iyb4SgpKCIND/9Fe+
 c0XaAVg0rAZgrgx3t64PY1Iu/L75UNfVzx6UCCP03A7MLzn0z/wnb9pSZrxcAqTOtkVF
 RRuDPGF5bP/LcDY87d5ntXdVljiDURY4k0KyzLji/KPy6Pk5cTZlAZHNeBx/okE0AEdX
 vsZtfGBvkCxLInYQzCJiC9peG9EQEhZXOOgYdEFEjh8Fyr32DHazUMh41dXNV3EWmEC6
 7Ep7FuV9ohXUpDOwHUhX6vvL/Hq2t4fqiQYfM6xJLhdP7PQkuLVjgPCeyzoTcHvSuVDm
 3PTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677704920;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NfdgY2A73a5OGKdx5+rNn/bPcoeTE1XjAcGxuU2C64U=;
 b=ARisPVCwpFN0NKLjQAjlndnfQZkrfooMawfLGUnaeDYzAkYv0GwSh0L9YHyCPYoLiM
 6t296mS2SLx8S6LTpl8SX3fanQ7oYKFVmQyVOL3exUgx5QPTU0W3bpnoX4eCW+vWZXT7
 ZT1UuIijg+/wXR1hB3/fJiGgEEZyL97f18+6HMjaToHSJ73qjkS5ymhE5JZiZmUk6Ohr
 qaecen71F2dnIXr6yljcjgM1MVCLdk93N1PPnlocDpZf8aJC4cYJIg+TYkDcNox4xppB
 RMAPzukRlBo7QWNq53bBc8yyrL6KFgaVlvyjg8qVX+1iXDjaem98S/hiPIqwzb7kFcH0
 IumA==
X-Gm-Message-State: AO0yUKWsGwhp3lj+4Tr9XIce0t3fmLe6+wz74FObzMlWZO2ML3wCNS9M
 /G2TpgMcB9TBC5kx64nW6+Q=
X-Google-Smtp-Source: AK7set9qze6oFP8G+XPPzy1IgyK15LcWQPgHC5AEWtRg+3uAws/f3JXzqY3IIA0KkdVBquuxCkXACg==
X-Received: by 2002:a17:907:7206:b0:8b1:94cc:4a6b with SMTP id
 dr6-20020a170907720600b008b194cc4a6bmr10525440ejc.37.1677704920609; 
 Wed, 01 Mar 2023 13:08:40 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-188-068-061.77.188.pool.telefonica.de.
 [77.188.68.61]) by smtp.gmail.com with ESMTPSA id
 uz25-20020a170907119900b008eb89a435c9sm6118315ejb.164.2023.03.01.13.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 13:08:40 -0800 (PST)
Date: Wed, 01 Mar 2023 21:08:37 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
Subject: Re: [PATCH v5 3/7] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <794ef01a-730b-46c6-2e79-95c68bc42102@eik.bme.hu>
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <36574dd259a98b240bfe12cd9ffa30b778bf06eb.1677628524.git.balaton@eik.bme.hu>
 <375EC0ED-F7D8-4A40-B316-F7BA32709836@gmail.com>
 <794ef01a-730b-46c6-2e79-95c68bc42102@eik.bme.hu>
Message-ID: <C6D02032-862B-4159-933C-D2B8C2BE00CC@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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



Am 1=2E M=C3=A4rz 2023 11:15:02 UTC schrieb BALATON Zoltan <balaton@eik=2E=
bme=2Ehu>:
>On Wed, 1 Mar 2023, Bernhard Beschow wrote:
>> Am 1=2E M=C3=A4rz 2023 00:17:09 UTC schrieb BALATON Zoltan <balaton@eik=
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
>>> ---
>>> hw/isa/vt82c686=2Ec | 38 +++++++++++++++++++++++++++++++++++++-
>>> 1 file changed, 37 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>>> index 01e0148967=2E=2E018a119964 100644
>>> --- a/hw/isa/vt82c686=2Ec
>>> +++ b/hw/isa/vt82c686=2Ec
>>> @@ -604,6 +604,42 @@ static void via_isa_request_i8259_irq(void *opaqu=
e, int irq, int level)
>>>     qemu_set_irq(s->cpu_intr, level);
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
>>> +    if (unlikely(pic_irq =3D=3D 0 || pic_irq =3D=3D 2 || pic_irq > 14=
)) {
>>=20
>> Where does the "pic_irq > 14" come from? It's not mentioned in the data=
sheet=2E
>
>Check at 0x3c register of USB and AC97 functions=2E For the others it may=
 be valid but unlikely to be used hence we just disallow it=2E (In my versi=
on which also mapped IDE here I've checkrf for each source but there's no w=
ay to do that in this version=2E)

I'm not sure what you mean=2E The 0x3c regs aren't related to the PCI IRQ =
routing regs=2E

Moreover, as I wrote in my other mail, I wonder what the datasheet tries t=
o tell us here at all=2E The information there partly contradicts itself=2E

Can you please clarify?

Thanks,
Bernhard

>
>Regards,
>BALATON Zoltan
>
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
>>> @@ -615,9 +651,9 @@ static void via_isa_realize(PCIDevice *d, Error **=
errp)
>>>=20
>>>     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
>>>     isa_irq =3D qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
>>> +    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq", PCI_NUM=
_PINS);
>>>     isa_bus =3D isa_bus_new(dev, pci_address_space(d), pci_address_spa=
ce_io(d),
>>>                           errp);
>>> -
>>>     if (!isa_bus) {
>>>         return;
>>>     }
>>=20
>>

