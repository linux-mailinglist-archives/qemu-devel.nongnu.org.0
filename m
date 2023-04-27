Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB65E6F0BCA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 20:17:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps6A0-0000zi-T5; Thu, 27 Apr 2023 14:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ps69o-0000xr-BA; Thu, 27 Apr 2023 14:15:52 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ps69l-0002pl-LH; Thu, 27 Apr 2023 14:15:51 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-94f4b911570so1389476166b.0; 
 Thu, 27 Apr 2023 11:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682619347; x=1685211347;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FfK3FjuwJjJxkQ5zkC4wxqsIXo5zbHlVUrrUPNf2VrA=;
 b=ElYjVvGJaYXDDia6KLgh6FQiYeJ8EfyUjlKshBpoFMci+eMZNYuB+o7nnsbg6t//L/
 pvmxdU1lqL+JoQ4OnjhSInOXRSKI7mox1lV7Ibi0pi+Zi4exOGrh51MeBCtAwLKxp3FE
 eTmQ/ZPxkURKlT7uS3pxyP3IenD9f6iy2tuANdpog2MqKuskE7D9Maq989KqeZ9FFdC7
 EW6sN2q61H4m7kXl4rxwTtanmLCaAQ7+dYJeR+8rd0R5IOdwTihmPa15xeygNPa62e0J
 NjEV0NPvb+kJZL5jakR1+TphZG/KG0CMOq2q4LcegljA/+rY+/ZaKx99fTcXEjgtXIvA
 6U/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682619347; x=1685211347;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FfK3FjuwJjJxkQ5zkC4wxqsIXo5zbHlVUrrUPNf2VrA=;
 b=GMw25C6Mo50jzpzK9pYjW0SP7lT8wZVq1NSkRCe5sP9X8Oe8T3fiUu+0J8tYRViTFH
 zr56uBe+zjMEuPr9bD69wsKZ3x/9ZF9Ceh4CpdB9J+gdRPXc538Q/RFIFNI02KNX6bT3
 MfQfVATU2EsLyYXPuNWAItbFUJpIrIR4vLjcxzSbUt6VOB7kwP+6FWiI2JKz83KTpe+z
 IV5FxunL9Ecte0p/8wr8K9ohSyJa51fzE8uzpmlNjIRMTYHNIlPxOyUf0ajZo6+KxrK8
 hVa42qHJ02e+9ic1ykWIutR6dNf7t0fv5e9dUWoYAaoJQHTcR7VexlgW8APDbUi3MJbr
 0PNQ==
X-Gm-Message-State: AC+VfDwB6iYhgqw4TBNgm3fcL+6ouAQg8hD2r4utqjzLlYRdSAfsFIip
 XEn5BnwO5mS8Sr9FOE4CGWE=
X-Google-Smtp-Source: ACHHUZ4sUFSUiypiDHp27W6qe3lYQwCBPjZ0vrJZohAbQtSLleORFJuuuvoTOxYXTXX4L95D2zo0ng==
X-Received: by 2002:a17:907:628f:b0:94a:a41b:558 with SMTP id
 nd15-20020a170907628f00b0094aa41b0558mr2519916ejc.54.1682619347214; 
 Thu, 27 Apr 2023 11:15:47 -0700 (PDT)
Received: from [127.0.0.1] ([62.214.191.67]) by smtp.gmail.com with ESMTPSA id
 k9-20020a170906054900b00923f05b2931sm9961495eja.118.2023.04.27.11.15.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 11:15:46 -0700 (PDT)
Date: Thu, 27 Apr 2023 18:15:24 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 10/13] hw/ide/piix: Reuse PCIIDEState::{cmd,data}_ops
In-Reply-To: <698457dc-ca0a-956d-f20d-c3b353fbf0c3@ilande.co.uk>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-11-shentey@gmail.com>
 <4ed18370-3a92-3ae5-912f-1f6dafab37d1@ilande.co.uk>
 <612DFA62-40DC-44D3-88A9-797FB4EC1F48@gmail.com>
 <CD1A2767-74AD-4285-ADF8-1757B8DD7953@gmail.com>
 <698457dc-ca0a-956d-f20d-c3b353fbf0c3@ilande.co.uk>
Message-ID: <6D292D6F-D82B-4425-8A03-7A51AA7791B0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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



Am 27=2E April 2023 10:52:17 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayl=
and@ilande=2Eco=2Euk>:
>On 26/04/2023 21:14, Bernhard Beschow wrote:
>
>> Am 26=2E April 2023 18:18:35 UTC schrieb Bernhard Beschow <shentey@gmai=
l=2Ecom>:
>>>=20
>>>=20
>>> Am 26=2E April 2023 11:37:48 UTC schrieb Mark Cave-Ayland <mark=2Ecave=
-ayland@ilande=2Eco=2Euk>:
>>>> On 22/04/2023 16:07, Bernhard Beschow wrote:
>>>>=20
>>>>> Now that PCIIDEState::{cmd,data}_ops are initialized in the base cla=
ss
>>>>> constructor there is an opportunity for PIIX to reuse these attribut=
es=2E This
>>>>> resolves usage of ide_init_ioport() which would fall back internally=
 to using
>>>>> the isabus global due to NULL being passed as ISADevice by PIIX=2E
>>>>>=20
>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>>> ---
>>>>>    hw/ide/piix=2Ec | 30 +++++++++++++-----------------
>>>>>    1 file changed, 13 insertions(+), 17 deletions(-)
>>>>>=20
>>>>> diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>>>>> index a3a15dc7db=2E=2E406a67fa0f 100644
>>>>> --- a/hw/ide/piix=2Ec
>>>>> +++ b/hw/ide/piix=2Ec
>>>>> @@ -104,34 +104,32 @@ static void piix_ide_reset(DeviceState *dev)
>>>>>        pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
>>>>>    }
>>>>>    -static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus=
 *isa_bus,
>>>>> -                              Error **errp)
>>>>> +static void pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus *i=
sa_bus)
>>>>>    {
>>>>>        static const struct {
>>>>>            int iobase;
>>>>>            int iobase2;
>>>>>            int isairq;
>>>>>        } port_info[] =3D {
>>>>> -        {0x1f0, 0x3f6, 14},
>>>>> -        {0x170, 0x376, 15},
>>>>> +        {0x1f0, 0x3f4, 14},
>>>>> +        {0x170, 0x374, 15},
>>>>>        };
>>>>> -    int ret;
>>>>> +    MemoryRegion *address_space_io =3D pci_address_space_io(PCI_DEV=
ICE(d));
>>>>>          ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2=
);
>>>>> -    ret =3D ide_init_ioport(&d->bus[i], NULL, port_info[i]=2Eiobase=
,
>>>>> -                          port_info[i]=2Eiobase2);
>>>>> -    if (ret) {
>>>>> -        error_setg_errno(errp, -ret, "Failed to realize %s port %u"=
,
>>>>> -                         object_get_typename(OBJECT(d)), i);
>>>>> -        return false;
>>>>> -    }
>>>>> +    memory_region_add_subregion(address_space_io, port_info[i]=2Eio=
base,
>>>>> +                                &d->data_ops[i]);
>>>>> +    /*
>>>>> +     * PIIX forwards the last byte of cmd_ops to ISA=2E Model this =
using a low
>>>>> +     * prio so competing memory regions take precedence=2E
>>>>> +     */
>>>>> +    memory_region_add_subregion_overlap(address_space_io, port_info=
[i]=2Eiobase2,
>>>>> +                                        &d->cmd_ops[i], -1);
>>>>=20
>>>> Interesting=2E Is this behaviour documented somewhere and/or used in =
one of your test images at all? If I'd have seen this myself, I probably th=
ought that the addresses were a typo=2E=2E=2E
>>>=20
>>> I first  stumbled upon this and wondered why this code was working wit=
h VIA_IDE (through my pc-via branch)=2E Then I found the correct offsets th=
ere which are confirmed in the piix datasheet, e=2Eg=2E: "Secondary Control=
 Block Offset: 0374h"
>>=20
>> In case you were wondering about the forwarding of the last byte the da=
tasheet says: "Accesses to byte 3 of the Control Block are forwarded to ISA=
 where the floppy disk controller responds=2E"
>
>Ahhh okay okay I see what's happening here: the PIIX IDE is assuming that=
 the legacy ioport semantics are in operation here, which as you note above=
 is where the FDC controller is also accessed via the above byte in the IDE=
 control block=2E This is also why you need to change the address above fro=
m 0x3f6/0x376 to 0x3f4/0x374 when trying to use the MemoryRegions used for =
the PCI BARs since the PCI IDE controller specification requires a 4 byte a=
llocation for the Control Block - see sections 2=2E0 and 2=2E2=2E

Yes, PIIX assuming that might be the case=2E Why does it contradict the PC=
I IDE specification? PIIX seems to apply the apprppriate "workarounds" here=
=2E

>
>And that's fine, because the portio_lists used in ide_init_ioport() set u=
p the legacy IDE ioports so that FDC accesses done in this way can succeed,=
 and the PIIX IDE is hard-coded to legacy mode=2E So in fact PIIX IDE shoul=
d keep using ide_init_ioport() rather than trying to re-use the BAR MemoryR=
egions so I think this patch should just be dropped=2E

I was hoping to keep that patch=2E=2E=2E

Best regards,
Bernhard

>
>>>>=20
>>>>>        ide_bus_init_output_irq(&d->bus[i],
>>>>>                                isa_bus_get_irq(isa_bus, port_info[i]=
=2Eisairq));
>>>>>          bmdma_init(&d->bus[i], &d->bmdma[i], d);
>>>>>        ide_bus_register_restart_cb(&d->bus[i]);
>>>>> -
>>>>> -    return true;
>>>>>    }
>>>>>      static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>>>>> @@ -160,9 +158,7 @@ static void pci_piix_ide_realize(PCIDevice *dev,=
 Error **errp)
>>>>>        }
>>>>>          for (unsigned i =3D 0; i < 2; i++) {
>>>>> -        if (!pci_piix_init_bus(d, i, isa_bus, errp)) {
>>>>> -            return;
>>>>> -        }
>>>>> +        pci_piix_init_bus(d, i, isa_bus);
>>>>>        }
>>>>>    }
>
>
>ATB,
>
>Mark=2E

