Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3463701685
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 13:55:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxnpA-00077y-CI; Sat, 13 May 2023 07:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pxnp8-00077i-Rd; Sat, 13 May 2023 07:54:06 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pxnp6-0000ye-Vg; Sat, 13 May 2023 07:54:06 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bc0ced1d9so16184119a12.0; 
 Sat, 13 May 2023 04:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683978842; x=1686570842;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kLQ1bpJZdQzzgS9ggKhdZ3OkEhHdgwCql9uQHp+oNXk=;
 b=daKOE+kK+jYN57Xunajz6jiNZX6SFUlc5Io4ERKn/r0jyF8+5TozkfHpWTSnctzi9/
 WizL0ulKEr6pWKxPr0w0+f71zAnQf/E6tHoZzw2H6bN+UG69j/b2muzAdcboTcXTEVD1
 scoRm/+Pq3LPFj/ld9XeqwU8NJTYiKYr3+Bbx0V8BzmqmlW7xAD8WxAzYM7ikUzh+TRp
 viM0RdbpVdul2OzL/ix4EpxT9ACjS9LCXYE6FEbTzU2cLHxmEpBpdazGVlxm/S3Lnazj
 0EquBfrSFAPPaPc8wIHLDU41c5Y7cOAoAPwiBveDGAg7c0gFBHQmowK6NaNGUyiGKwYn
 Z21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683978842; x=1686570842;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kLQ1bpJZdQzzgS9ggKhdZ3OkEhHdgwCql9uQHp+oNXk=;
 b=CSER3g7kWGseVwvU7EDjD1WN6YUMfzCu5Id6mVweyfRo+LBiNfbWpoODZIR+/4cN4y
 PkssBWoEQ/mKYNAXc7kf5R+mFLXVX2laXZM0LGyKGi7DE2ijbhUrrUIugCd7hjju7dMk
 ff7U92gUsQF5Kq35hMkR066hckqaarI5spwhBfFE9biGAnUWazFCAE7vDMdMn/mbrjCr
 D0at4s+ewjPK6AHU/Xo1csznRA4kn7sEIitrVSGr/8o0tzpMA/DMJewJkYzcEmZsU06j
 p1MiRM6EpxUIq8OQTL7xySVEi9fY4z0PrnFElI5MZJixhh3uIFJKXKLXGARUuBUkDq8w
 1LuQ==
X-Gm-Message-State: AC+VfDx5EYF9Xo/cGaWApz9mCQtn6oV1b/3VpPlmIgDx6eWYucfCmL2l
 OtsZhwGdqYfQ4tTYacIpw6Y=
X-Google-Smtp-Source: ACHHUZ4r3hYASvvWvvY6uw8EzPd56huo0EYg69QT30jjvOUE9+y3NjNFUGv61S5FW4GZ5634dI5rkQ==
X-Received: by 2002:a17:907:a414:b0:968:892b:1903 with SMTP id
 sg20-20020a170907a41400b00968892b1903mr19310157ejc.5.1683978842136; 
 Sat, 13 May 2023 04:54:02 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-174-037.77.13.pool.telefonica.de.
 [77.13.174.37]) by smtp.gmail.com with ESMTPSA id
 md1-20020a170906ae8100b0094b5ce9d43dsm6675378ejb.85.2023.05.13.04.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 04:54:01 -0700 (PDT)
Date: Sat, 13 May 2023 11:53:59 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 09/13] hw/ide/piix: Disuse isa_get_irq()
In-Reply-To: <e19d0811-2eac-aad5-2c91-de72d8bae7d6@ilande.co.uk>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-10-shentey@gmail.com>
 <32b3425c-737f-4889-9c87-67cd852032f6@ilande.co.uk>
 <8C48868C-4791-4B96-9C56-D4B4A63492F2@gmail.com>
 <e19d0811-2eac-aad5-2c91-de72d8bae7d6@ilande.co.uk>
Message-ID: <AC81E372-BC1C-44CC-950A-B4EA8803EDB7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 27=2E April 2023 12:31:10 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayl=
and@ilande=2Eco=2Euk>:
>On 26/04/2023 19:25, Bernhard Beschow wrote:
>
>> Am 26=2E April 2023 11:33:40 UTC schrieb Mark Cave-Ayland <mark=2Ecave-=
ayland@ilande=2Eco=2Euk>:
>>> On 22/04/2023 16:07, Bernhard Beschow wrote:
>>>=20
>>>> isa_get_irq() asks for an ISADevice which piix-ide doesn't provide=2E
>>>> Passing a NULL pointer works but causes the isabus global to be used
>>>> then=2E By fishing out TYPE_ISA_BUS from the QOM tree it is possible =
to
>>>> achieve the same as using isa_get_irq()=2E
>>>>=20
>>>> This is an alternative solution to commit 9405d87be25d 'hw/ide: Fix
>>>> crash when plugging a piix3-ide device into the x-remote machine' whi=
ch
>>>> allows for cleaning up the ISA API while keeping PIIX IDE functions
>>>> user-createable=2E
>>>>=20
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>> ---
>>>>    hw/ide/piix=2Ec | 23 ++++++++++++++++++++---
>>>>    1 file changed, 20 insertions(+), 3 deletions(-)
>>>>=20
>>>> diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>>>> index 6942b484f9=2E=2Ea3a15dc7db 100644
>>>> --- a/hw/ide/piix=2Ec
>>>> +++ b/hw/ide/piix=2Ec
>>>> @@ -104,7 +104,8 @@ static void piix_ide_reset(DeviceState *dev)
>>>>        pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
>>>>    }
>>>>    -static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error *=
*errp)
>>>> +static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus *is=
a_bus,
>>>> +                              Error **errp)
>>>>    {
>>>>        static const struct {
>>>>            int iobase;
>>>> @@ -124,7 +125,8 @@ static bool pci_piix_init_bus(PCIIDEState *d, uns=
igned i, Error **errp)
>>>>                             object_get_typename(OBJECT(d)), i);
>>>>            return false;
>>>>        }
>>>> -    ide_bus_init_output_irq(&d->bus[i], isa_get_irq(NULL, port_info[=
i]=2Eisairq));
>>>> +    ide_bus_init_output_irq(&d->bus[i],
>>>> +                            isa_bus_get_irq(isa_bus, port_info[i]=2E=
isairq));
>>>=20
>>> I don't think is the right solution here, since ultimately we want to =
move the IRQ routing out of the device itself and into the PCI-ISA bridge=
=2E I'd go for the same solution as you've done for VIA IDE in patch 2, i=
=2Ee=2E update the PIIX interrupt handler to set the legacy_irqs in PCIIDES=
tate, and then wire them up to the ISA IRQs 14 and 15 similar to as Phil as=
 done in his patches:
>>=20
>> The problem is user-creatable PIIX-IDE=2E IMO we should stick to our de=
precation process before going this step because this will break it=2E
>
>Thomas posted some links from previous discussions where it seems that th=
is hack is still in use:
>
>https://lists=2Enongnu=2Eorg/archive/html/qemu-block/2019-07/msg00780=2Eh=
tml
>https://lists=2Egnu=2Eorg/archive/html/qemu-block/2021-04/msg00746=2Ehtml
>
>So it seems we can't even deprecate this, as it's working around missing =
functionality in q35 :(
>
>Certainly it seems that we should add a check that will fail the machine =
if there is more than one -device piix3-ide on the command line, since I ca=
n't see that could ever work properly=2E
>
>I'm leaning towards adding a device property that must be set to enabled =
in order for PIIX IDE realize() to succeed, leave it disabled by default an=
d only enable it for the q35 machine=2E Does that seem like a reasonable so=
lution?

I'd rather declare this to be out of scope of this series=2E First, this s=
eries contains a lot of material already=2E Second, this patch attempts to =
preserve current behavior=2E

This patch is actually a preparation for the next one=2E In the next patch=
 the (non-obvious) check for presence of the ISABus get removed so we need =
this patch to preserve behavior=2E Otherwise machines without an ISA bus wi=
ll crash if piix3-ide gets user-created=2E One machine that would crash is =
the "remote" machine IIRC=2E

Best regards,
Bernhard

>
>>> https://patchew=2Eorg/QEMU/20230302224058=2E43315-1-philmd@linaro=2Eor=
g/20230302224058=2E43315-4-philmd@linaro=2Eorg/
>>>=20
>>> https://patchew=2Eorg/QEMU/20230302224058=2E43315-1-philmd@linaro=2Eor=
g/20230302224058=2E43315-5-philmd@linaro=2Eorg/
>>>=20
>>> This also reminds me, given that the first patch above is doing wiring=
 in pc_init1() then we are still missing part of your tidy-up series :/
>>>=20
>>>>        bmdma_init(&d->bus[i], &d->bmdma[i], d);
>>>>        ide_bus_register_restart_cb(&d->bus[i]);
>>>> @@ -136,14 +138,29 @@ static void pci_piix_ide_realize(PCIDevice *dev=
, Error **errp)
>>>>    {
>>>>        PCIIDEState *d =3D PCI_IDE(dev);
>>>>        uint8_t *pci_conf =3D dev->config;
>>>> +    ISABus *isa_bus;
>>>> +    bool ambiguous;
>>>>          pci_conf[PCI_CLASS_PROG] =3D 0x80; // legacy ATA mode
>>>>          bmdma_init_ops(d, &piix_bmdma_ops);
>>>>        pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_=
ops);
>>>>    +    isa_bus =3D ISA_BUS(object_resolve_path_type("", TYPE_ISA_BUS=
, &ambiguous));
>>>> +    if (ambiguous) {
>>>> +        error_setg(errp,
>>>> +                   "More than one ISA bus found while %s supports on=
ly one",
>>>> +                   object_get_typename(OBJECT(d)));
>>>> +        return;
>>>> +    }
>>>> +    if (!isa_bus) {
>>>> +        error_setg(errp, "No ISA bus found while %s requires one",
>>>> +                   object_get_typename(OBJECT(d)));
>>>> +        return;
>>>> +    }
>>>=20
>>> Again I think this should go away with using PCIIDEState's legacy_irqs=
, since you simply let the board wire them up to the ISABus (or not) as req=
uired=2E
>>=20
>> Same here: This breaks user-creatable PIIX-IDE=2E
>>=20
>>>=20
>>>>        for (unsigned i =3D 0; i < 2; i++) {
>>>> -        if (!pci_piix_init_bus(d, i, errp)) {
>>>> +        if (!pci_piix_init_bus(d, i, isa_bus, errp)) {
>>>>                return;
>>>>            }
>>>>        }
>
>
>ATB,
>
>Mark=2E

