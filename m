Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3973701690
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 14:23:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxoFm-0004Xv-3t; Sat, 13 May 2023 08:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pxoFh-0004XG-Jy; Sat, 13 May 2023 08:21:34 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pxoFf-0005cZ-NO; Sat, 13 May 2023 08:21:33 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-96aae59bbd6so312285466b.3; 
 Sat, 13 May 2023 05:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683980489; x=1686572489;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QhJlq3cLAvYYgsw6EK+4vG0vmuFRJ4fmOVJ/2SBAcQQ=;
 b=am8Tq32Qerzg+fHFhOfkcsloUynaSMVgcbjWVlVzeszSDgGoESPar7LLwgEQkHxn2+
 wsvTZ37cd++FfHaLmimsqtbMWuXNWhSTBX3NwHTNmLBgvego7nrsfj0DgH7UswObeBrp
 S3XNzjGodjNyE8/LfUO1MGrSlQm0xYhkstPprNy7piYHpWcqahE1aOOl7SGmc5ejNAXh
 bF1vOV61keD6uU4bFxhESktyj24PZmLSqgkRKvfGSA66nnfRk0Lv1elW+nmsQ02C8yOJ
 vOaYl5pvOhZH3Lq/ib7dN/z35a0dHmKJJT2HxdbSFr80RQzqQV+LPml4gT4u9+CbxJ3S
 wYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683980489; x=1686572489;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QhJlq3cLAvYYgsw6EK+4vG0vmuFRJ4fmOVJ/2SBAcQQ=;
 b=ffTZCE86+m2bbCfEW8+WQHx4BXZWOZgRKWqR9DrSiglB6GTfRgD3uJIgsY/YQMYisU
 zZ9QKmkUNr8h6nLe85OMEdQY4MREsSrihQDkQ7BTUPYosYweqpH+/YPA2DY9HAbcQLr4
 yRlwvwDJa+zTeKhZpXDwckDJCD1kA9/qrYdQuZcmyyQC9phSuSZFRxJBV34ny2ol+xsu
 ImpZvuJrcgVPp9e1YguCohR4pEi5Q1itvcdi1n22nAipBIwq8JbbB79EXLxoC0zZypYO
 GiaHef7/WILMRBmxD1YKtjG0pX2zq7vNcnPqzsTTZUfatt6xqit2GlASW9ThA8j8YYdA
 ytxA==
X-Gm-Message-State: AC+VfDw/viYxIGnPd3i5qdsLM2A3tWihkaR/z6dSz76duBOGhh5ELEyh
 PDnHHXiBj70czZFQB6z5wuw=
X-Google-Smtp-Source: ACHHUZ66HZJotMCX/i06hmO0k2fww0CrkUGSkDR7XTGpPP2ljge1myNsK5YMKkAMzMjuNZ/MfLYW6Q==
X-Received: by 2002:a17:906:ee82:b0:94f:1a23:2f1c with SMTP id
 wt2-20020a170906ee8200b0094f1a232f1cmr23023406ejb.50.1683980489244; 
 Sat, 13 May 2023 05:21:29 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-174-037.77.13.pool.telefonica.de.
 [77.13.174.37]) by smtp.gmail.com with ESMTPSA id
 sa40-20020a1709076d2800b00965d4b2bd4csm6848553ejc.141.2023.05.13.05.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 05:21:28 -0700 (PDT)
Date: Sat, 13 May 2023 12:21:24 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 10/13] hw/ide/piix: Reuse PCIIDEState::{cmd,data}_ops
In-Reply-To: <3d9a88eb-e9f3-4335-2a00-34d249c17289@ilande.co.uk>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-11-shentey@gmail.com>
 <4ed18370-3a92-3ae5-912f-1f6dafab37d1@ilande.co.uk>
 <612DFA62-40DC-44D3-88A9-797FB4EC1F48@gmail.com>
 <CD1A2767-74AD-4285-ADF8-1757B8DD7953@gmail.com>
 <698457dc-ca0a-956d-f20d-c3b353fbf0c3@ilande.co.uk>
 <6D292D6F-D82B-4425-8A03-7A51AA7791B0@gmail.com>
 <3d9a88eb-e9f3-4335-2a00-34d249c17289@ilande.co.uk>
Message-ID: <0E1C9281-7688-44FF-917B-0E4AB99C1EE1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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



Am 3=2E Mai 2023 19:52:41 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayland=
@ilande=2Eco=2Euk>:
>On 27/04/2023 19:15, Bernhard Beschow wrote:
>
>> Am 27=2E April 2023 10:52:17 UTC schrieb Mark Cave-Ayland <mark=2Ecave-=
ayland@ilande=2Eco=2Euk>:
>>> On 26/04/2023 21:14, Bernhard Beschow wrote:
>>>=20
>>>> Am 26=2E April 2023 18:18:35 UTC schrieb Bernhard Beschow <shentey@gm=
ail=2Ecom>:
>>>>>=20
>>>>>=20
>>>>> Am 26=2E April 2023 11:37:48 UTC schrieb Mark Cave-Ayland <mark=2Eca=
ve-ayland@ilande=2Eco=2Euk>:
>>>>>> On 22/04/2023 16:07, Bernhard Beschow wrote:
>>>>>>=20
>>>>>>> Now that PCIIDEState::{cmd,data}_ops are initialized in the base c=
lass
>>>>>>> constructor there is an opportunity for PIIX to reuse these attrib=
utes=2E This
>>>>>>> resolves usage of ide_init_ioport() which would fall back internal=
ly to using
>>>>>>> the isabus global due to NULL being passed as ISADevice by PIIX=2E
>>>>>>>=20
>>>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>>>>> ---
>>>>>>>     hw/ide/piix=2Ec | 30 +++++++++++++-----------------
>>>>>>>     1 file changed, 13 insertions(+), 17 deletions(-)
>>>>>>>=20
>>>>>>> diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>>>>>>> index a3a15dc7db=2E=2E406a67fa0f 100644
>>>>>>> --- a/hw/ide/piix=2Ec
>>>>>>> +++ b/hw/ide/piix=2Ec
>>>>>>> @@ -104,34 +104,32 @@ static void piix_ide_reset(DeviceState *dev)
>>>>>>>         pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
>>>>>>>     }
>>>>>>>     -static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, ISA=
Bus *isa_bus,
>>>>>>> -                              Error **errp)
>>>>>>> +static void pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus =
*isa_bus)
>>>>>>>     {
>>>>>>>         static const struct {
>>>>>>>             int iobase;
>>>>>>>             int iobase2;
>>>>>>>             int isairq;
>>>>>>>         } port_info[] =3D {
>>>>>>> -        {0x1f0, 0x3f6, 14},
>>>>>>> -        {0x170, 0x376, 15},
>>>>>>> +        {0x1f0, 0x3f4, 14},
>>>>>>> +        {0x170, 0x374, 15},
>>>>>>>         };
>>>>>>> -    int ret;
>>>>>>> +    MemoryRegion *address_space_io =3D pci_address_space_io(PCI_D=
EVICE(d));
>>>>>>>           ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i=
, 2);
>>>>>>> -    ret =3D ide_init_ioport(&d->bus[i], NULL, port_info[i]=2Eioba=
se,
>>>>>>> -                          port_info[i]=2Eiobase2);
>>>>>>> -    if (ret) {
>>>>>>> -        error_setg_errno(errp, -ret, "Failed to realize %s port %=
u",
>>>>>>> -                         object_get_typename(OBJECT(d)), i);
>>>>>>> -        return false;
>>>>>>> -    }
>>>>>>> +    memory_region_add_subregion(address_space_io, port_info[i]=2E=
iobase,
>>>>>>> +                                &d->data_ops[i]);
>>>>>>> +    /*
>>>>>>> +     * PIIX forwards the last byte of cmd_ops to ISA=2E Model thi=
s using a low
>>>>>>> +     * prio so competing memory regions take precedence=2E
>>>>>>> +     */
>>>>>>> +    memory_region_add_subregion_overlap(address_space_io, port_in=
fo[i]=2Eiobase2,
>>>>>>> +                                        &d->cmd_ops[i], -1);
>>>>>>=20
>>>>>> Interesting=2E Is this behaviour documented somewhere and/or used i=
n one of your test images at all? If I'd have seen this myself, I probably =
thought that the addresses were a typo=2E=2E=2E
>>>>>=20
>>>>> I first  stumbled upon this and wondered why this code was working w=
ith VIA_IDE (through my pc-via branch)=2E Then I found the correct offsets =
there which are confirmed in the piix datasheet, e=2Eg=2E: "Secondary Contr=
ol Block Offset: 0374h"
>>>>=20
>>>> In case you were wondering about the forwarding of the last byte the =
datasheet says: "Accesses to byte 3 of the Control Block are forwarded to I=
SA where the floppy disk controller responds=2E"
>>>=20
>>> Ahhh okay okay I see what's happening here: the PIIX IDE is assuming t=
hat the legacy ioport semantics are in operation here, which as you note ab=
ove is where the FDC controller is also accessed via the above byte in the =
IDE control block=2E This is also why you need to change the address above =
from 0x3f6/0x376 to 0x3f4/0x374 when trying to use the MemoryRegions used f=
or the PCI BARs since the PCI IDE controller specification requires a 4 byt=
e allocation for the Control Block - see sections 2=2E0 and 2=2E2=2E
>>=20
>> Yes, PIIX assuming that might be the case=2E Why does it contradict the=
 PCI IDE specification? PIIX seems to apply the apprppriate "workarounds" h=
ere=2E
>
>Can you explain a bit more about where you see the contradiction? At firs=
t glance it looks okay to me=2E
>
>>> And that's fine, because the portio_lists used in ide_init_ioport() se=
t up the legacy IDE ioports so that FDC accesses done in this way can succe=
ed, and the PIIX IDE is hard-coded to legacy mode=2E So in fact PIIX IDE sh=
ould keep using ide_init_ioport() rather than trying to re-use the BAR Memo=
ryRegions so I think this patch should just be dropped=2E
>>=20
>> I was hoping to keep that patch=2E=2E=2E
>
>Perhaps a different way to think about it is that from QEMU's perspective=
 a BAR is a MemoryRegion that can be dynamically assigned/updated and canno=
t overlap, whereas the portio_list implementation also handles unaligned ac=
cesses and overlapping sparse accesses=2E Since the latter is the exact cas=
e here with the IDE/FDC then it seems the existing portio_list solution alr=
eady does the "right thing" instead of having to manually emulate the overl=
apping dispatch=2E

I've had another look into the "PCI IDE Controller Specification Revision =
1=2E0" which says:

"The Control Block registers consist of two bytes used for control/status =
of the IDE device=2E The second byte of this pair is read-only and has the =
interesting quirk where the top bit of this byte is shared with the floppy =
controller when the IDE device is mapped at 'compatibility' locations=2E It=
 turns out that software controlling IDE devices (BIOS, drivers, etc=2E) do=
es not use this register at all=2E

The exception for PCI IDE controllers to the ATA Standard is that only the=
 first of the two bytes defined in the Control Block registers is implement=
ed=2E This byte provides Alternate Status on reads and Device Control on wr=
ites=2E Accesses to the second byte of the Control Block registers (Drive A=
ddress) should be ignored by the PCI IDE controller=2E"

So in fact the real PIIX does adhere to this standard and there is no reas=
on to reject the idea behind this patch -- which is to make our PIIX device=
 model implement this standard=2E

It's just that all our other PCI-IDE implementations need to implement thi=
s quirk as long as they implement the standard=2E And according to the Linu=
x kernel they all do -- see its CONFIG_ATA_SFF=2E

Since this patch actually uncovered a small bug in the other device models=
 I'd rather fix those, too=2E One way I could do this is to decrease the si=
ze of the memory region or to map with lower priority=2E What is the prefer=
red fix? Any other ideas?

Note that this and the next patch resolve the last dependencies on the "is=
abus" global=2E So after this series we could apply some small patches post=
ed before and get rid of the global entirely=2E=2E=2E And have as many ISA =
and LPC buses as we want!

Best regards,
Bernhard

>
>
>ATB,
>
>Mark=2E
>

