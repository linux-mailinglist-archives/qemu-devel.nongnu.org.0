Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301FC6F1C17
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 18:00:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psQV2-0001kA-L5; Fri, 28 Apr 2023 11:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1psQUy-0001jq-G3; Fri, 28 Apr 2023 11:59:04 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1psQUw-0004RF-NA; Fri, 28 Apr 2023 11:59:04 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-94f109b1808so1928052266b.1; 
 Fri, 28 Apr 2023 08:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682697540; x=1685289540;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NI7n2ktH7P+FtjC+xKo7toXoADizvEEIJ647rSRK2SY=;
 b=snvfKrntG/zS3F7tErhRG+BZIs+RpZI3wwHsrUvszvIYcYKuhACh71OVfqImSVM0WB
 eA7R1Oxsq8jNwvgvKjklSER8AjMxjkbffiCXYgC5OOH9zcBFUgdNLr1KNqoqUingRjf8
 luOk1kORGxYdcViCSmPcr8x8i48dCuioVsYQV8UaqSQyrJ5gTO+QgxeaWegocaYG2I26
 50GXTKlVd+XiXKp5I4YeFnfj6mcTZALM3WDVxevnSgGXmClBoiMLTmKF3Geh9OiMY8xT
 YqB5gBffc8fJQdJ/L6QqRF8Lo+sb/W8e8JUWjJmHepMrbPp1dLQXsG9I59q3UDigdMEx
 ycjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682697540; x=1685289540;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NI7n2ktH7P+FtjC+xKo7toXoADizvEEIJ647rSRK2SY=;
 b=KxpwWenouR1Q59jYJ5HN2NHfubwlkgWYj168RdUe/CkBlUVdRcGy3xVkOSWI/mXwGT
 lWfNXkHiqQ8YVKWbL3S8ddjXieaZ4zGJT1xAZZbvMIrbcEWOKui0FUIZJDVaEHgTUHBg
 Z0ZkOLX3FO3862evBx4cXPJwHheub5M8Lmu006f+f9JmnmA0XAfsfB4IZT5T3ftbZwfQ
 1tFB5CZvIlWW/UgvvqtXZ8KdfJOvBajSmfksJzsB8Oh1zPG93Noi1LWQACaX2qjPNIFH
 i/lHvRwcPN+XzY0EP8QO8WL3Ca+12U3T3I38UrwjJaKbchoo25ChFxAhNEI3VCVk3tg8
 DsPA==
X-Gm-Message-State: AC+VfDzozB889w6PNAWMXXv+hJ+YGc8OL+Yv8P3vzXHhAilYUwJbwDGB
 cjG7lw/aYK3dks7jxE9+IvM=
X-Google-Smtp-Source: ACHHUZ5nGhdPcd1KPAoErwI5DbW+LRBKXMFx6/xetPneMXXMJaH1sH2B3rEU+4qcIiCgOSE0dMs53g==
X-Received: by 2002:a17:906:7308:b0:94e:7bde:3108 with SMTP id
 di8-20020a170906730800b0094e7bde3108mr5941845ejc.27.1682697539959; 
 Fri, 28 Apr 2023 08:58:59 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-188-031-114.77.188.pool.telefonica.de.
 [77.188.31.114]) by smtp.gmail.com with ESMTPSA id
 d21-20020aa7c1d5000000b005027d31615dsm9137147edp.62.2023.04.28.08.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 08:58:59 -0700 (PDT)
Date: Fri, 28 Apr 2023 15:58:52 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 10/13] hw/ide/piix: Reuse PCIIDEState::{cmd,data}_ops
In-Reply-To: <6D292D6F-D82B-4425-8A03-7A51AA7791B0@gmail.com>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-11-shentey@gmail.com>
 <4ed18370-3a92-3ae5-912f-1f6dafab37d1@ilande.co.uk>
 <612DFA62-40DC-44D3-88A9-797FB4EC1F48@gmail.com>
 <CD1A2767-74AD-4285-ADF8-1757B8DD7953@gmail.com>
 <698457dc-ca0a-956d-f20d-c3b353fbf0c3@ilande.co.uk>
 <6D292D6F-D82B-4425-8A03-7A51AA7791B0@gmail.com>
Message-ID: <22990C1E-D554-4FA1-AE08-DA433AD26247@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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



Am 27=2E April 2023 18:15:24 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>
>
>Am 27=2E April 2023 10:52:17 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ay=
land@ilande=2Eco=2Euk>:
>>On 26/04/2023 21:14, Bernhard Beschow wrote:
>>
>>> Am 26=2E April 2023 18:18:35 UTC schrieb Bernhard Beschow <shentey@gma=
il=2Ecom>:
>>>>=20
>>>>=20
>>>> Am 26=2E April 2023 11:37:48 UTC schrieb Mark Cave-Ayland <mark=2Ecav=
e-ayland@ilande=2Eco=2Euk>:
>>>>> On 22/04/2023 16:07, Bernhard Beschow wrote:
>>>>>=20
>>>>>> Now that PCIIDEState::{cmd,data}_ops are initialized in the base cl=
ass
>>>>>> constructor there is an opportunity for PIIX to reuse these attribu=
tes=2E This
>>>>>> resolves usage of ide_init_ioport() which would fall back internall=
y to using
>>>>>> the isabus global due to NULL being passed as ISADevice by PIIX=2E
>>>>>>=20
>>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>>>> ---
>>>>>>    hw/ide/piix=2Ec | 30 +++++++++++++-----------------
>>>>>>    1 file changed, 13 insertions(+), 17 deletions(-)
>>>>>>=20
>>>>>> diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>>>>>> index a3a15dc7db=2E=2E406a67fa0f 100644
>>>>>> --- a/hw/ide/piix=2Ec
>>>>>> +++ b/hw/ide/piix=2Ec
>>>>>> @@ -104,34 +104,32 @@ static void piix_ide_reset(DeviceState *dev)
>>>>>>        pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
>>>>>>    }
>>>>>>    -static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABu=
s *isa_bus,
>>>>>> -                              Error **errp)
>>>>>> +static void pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus *=
isa_bus)
>>>>>>    {
>>>>>>        static const struct {
>>>>>>            int iobase;
>>>>>>            int iobase2;
>>>>>>            int isairq;
>>>>>>        } port_info[] =3D {
>>>>>> -        {0x1f0, 0x3f6, 14},
>>>>>> -        {0x170, 0x376, 15},
>>>>>> +        {0x1f0, 0x3f4, 14},
>>>>>> +        {0x170, 0x374, 15},
>>>>>>        };
>>>>>> -    int ret;
>>>>>> +    MemoryRegion *address_space_io =3D pci_address_space_io(PCI_DE=
VICE(d));
>>>>>>          ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, =
2);
>>>>>> -    ret =3D ide_init_ioport(&d->bus[i], NULL, port_info[i]=2Eiobas=
e,
>>>>>> -                          port_info[i]=2Eiobase2);
>>>>>> -    if (ret) {
>>>>>> -        error_setg_errno(errp, -ret, "Failed to realize %s port %u=
",
>>>>>> -                         object_get_typename(OBJECT(d)), i);
>>>>>> -        return false;
>>>>>> -    }
>>>>>> +    memory_region_add_subregion(address_space_io, port_info[i]=2Ei=
obase,
>>>>>> +                                &d->data_ops[i]);
>>>>>> +    /*
>>>>>> +     * PIIX forwards the last byte of cmd_ops to ISA=2E Model this=
 using a low
>>>>>> +     * prio so competing memory regions take precedence=2E
>>>>>> +     */
>>>>>> +    memory_region_add_subregion_overlap(address_space_io, port_inf=
o[i]=2Eiobase2,
>>>>>> +                                        &d->cmd_ops[i], -1);
>>>>>=20
>>>>> Interesting=2E Is this behaviour documented somewhere and/or used in=
 one of your test images at all? If I'd have seen this myself, I probably t=
hought that the addresses were a typo=2E=2E=2E
>>>>=20
>>>> I first  stumbled upon this and wondered why this code was working wi=
th VIA_IDE (through my pc-via branch)=2E Then I found the correct offsets t=
here which are confirmed in the piix datasheet, e=2Eg=2E: "Secondary Contro=
l Block Offset: 0374h"
>>>=20
>>> In case you were wondering about the forwarding of the last byte the d=
atasheet says: "Accesses to byte 3 of the Control Block are forwarded to IS=
A where the floppy disk controller responds=2E"
>>
>>Ahhh okay okay I see what's happening here: the PIIX IDE is assuming tha=
t the legacy ioport semantics are in operation here, which as you note abov=
e is where the FDC controller is also accessed via the above byte in the ID=
E control block=2E This is also why you need to change the address above fr=
om 0x3f6/0x376 to 0x3f4/0x374 when trying to use the MemoryRegions used for=
 the PCI BARs since the PCI IDE controller specification requires a 4 byte =
allocation for the Control Block - see sections 2=2E0 and 2=2E2=2E
>
>Yes, PIIX assuming that might be the case=2E Why does it contradict the P=
CI IDE specification? PIIX seems to apply the apprppriate "workarounds" her=
e=2E
>
>>
>>And that's fine, because the portio_lists used in ide_init_ioport() set =
up the legacy IDE ioports so that FDC accesses done in this way can succeed=
, and the PIIX IDE is hard-coded to legacy mode=2E So in fact PIIX IDE shou=
ld keep using ide_init_ioport() rather than trying to re-use the BAR Memory=
Regions so I think this patch should just be dropped=2E
>
>I was hoping to keep that patch=2E=2E=2E

The whole paragraph reads: "PIIX4 claims all accesses to these ranges, if =
enabled=2E The byte enables do not have to be externally decoded to assert =
DEVSEL#=2E Accesses to byte 3 of the Control Block are forwarded to ISA whe=
re the floppy disk controller responds=2E" So PIIX doesn't look at the indi=
vidual io ports but rather at the whole blocks covering them=2E

To me, this sounds like PIIX is applying the PCI IDE controller specificat=
ion without the native option=2E In QEMU the block part of the specificatio=
n is implemented by cmd_bar and data_bar=2E I think that reusing the blocks=
 here in fact models the PIIX datasheet closer than the current implementat=
ion=2E I'd therefore keep this patch=2E

Best regards,
Bernhard

>
>Best regards,
>Bernhard
>
>>
>>>>>=20
>>>>>>        ide_bus_init_output_irq(&d->bus[i],
>>>>>>                                isa_bus_get_irq(isa_bus, port_info[i=
]=2Eisairq));
>>>>>>          bmdma_init(&d->bus[i], &d->bmdma[i], d);
>>>>>>        ide_bus_register_restart_cb(&d->bus[i]);
>>>>>> -
>>>>>> -    return true;
>>>>>>    }
>>>>>>      static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>>>>>> @@ -160,9 +158,7 @@ static void pci_piix_ide_realize(PCIDevice *dev=
, Error **errp)
>>>>>>        }
>>>>>>          for (unsigned i =3D 0; i < 2; i++) {
>>>>>> -        if (!pci_piix_init_bus(d, i, isa_bus, errp)) {
>>>>>> -            return;
>>>>>> -        }
>>>>>> +        pci_piix_init_bus(d, i, isa_bus);
>>>>>>        }
>>>>>>    }
>>
>>
>>ATB,
>>
>>Mark=2E

