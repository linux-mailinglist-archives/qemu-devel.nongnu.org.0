Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A172F6EFB9B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 22:15:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prlXh-0006Qb-PY; Wed, 26 Apr 2023 16:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1prlXe-0006Py-L2; Wed, 26 Apr 2023 16:15:06 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1prlXb-0005ja-Bg; Wed, 26 Apr 2023 16:15:05 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9505214c47fso1420479566b.1; 
 Wed, 26 Apr 2023 13:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682540101; x=1685132101;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NLwZ9iqFziXoPuY85+aeQObl778YHYtMBZycHMfQsi0=;
 b=Wfj4gJHAgdpDMBFrPt16g38PQgU891lDEcoPJQNKpoHn121KfbmjgLNHCC9WmNLL9s
 cdXEnB0l7JBvO9gm7HHzYpWA8hy3wKlTBHXaAGWs0+/RXv+qCsM1PX/1r/+6wjb9uonf
 yzplPCOz+1a2+RfVu3W4KU/dwrz2sx+gF0eVGh7HoPiuXtmpmrmSfZMAaPLDI8GIJ+1I
 TgpmoNwv/T53B3SBGA1L6AoJxfpc04Wevaph9u4f+iyRQpEk/O1C26Rgpyjw9OtT3gjW
 Tl0a3pRngnzvtuKBO/grRSc04NxCBEU0A5ZmUtW2+omF1RVuyx1ADpPV/3s352ShvLeX
 0KMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682540101; x=1685132101;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NLwZ9iqFziXoPuY85+aeQObl778YHYtMBZycHMfQsi0=;
 b=IYCrNsjDMbAaRB8FJk6XCrZUGwi/FOUcglG34qcmrrPpnIKaMh9QjtqZmJD7tEmEoW
 EUnnDRnoKkxgZnpsls0gu4TKtSyoEl245UtW5TJn/+Vkg082aoGTcih2smdniIhfOVKA
 cPwsNlK4be//Tt9W/1wM7Y+qPxqesMvjHTUqAsF56+XGQdGbMOecD/EH7znot4AwKdQ9
 NmRej8i6031ZJciiE+mq5gN0YvhOADyXEzem6mTegAtsY53h9pShIMiB6JR7Ld/BnU9p
 BtRc+vPvPMNWNFv+fF3B1eGCGLMgUUahK+WdqkDVQx+bJt6OdUDBq7+86n0kBkPbSZvT
 7Eng==
X-Gm-Message-State: AAQBX9d9VI/GzSP9pRgRbK/r8BqEazpWvMG2cLZpB5h0FwJmErqpcqoK
 aDvVh3oYXhFPZBG55cShHN4=
X-Google-Smtp-Source: AKy350Z3i9/S2rIM1pUFPmn1jiPEVTNYYiWBV6mcA5pluRah//vYcmOWL7ct6PrvJbfXDTRa5YOrXQ==
X-Received: by 2002:a17:907:7f04:b0:94e:3d6f:9c0f with SMTP id
 qf4-20020a1709077f0400b0094e3d6f9c0fmr22023632ejc.55.1682540100683; 
 Wed, 26 Apr 2023 13:15:00 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-234-209.77.13.pool.telefonica.de.
 [77.13.234.209]) by smtp.gmail.com with ESMTPSA id
 qw16-20020a1709066a1000b00959b3c30f2csm3997595ejc.222.2023.04.26.13.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 13:15:00 -0700 (PDT)
Date: Wed, 26 Apr 2023 20:14:51 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 10/13] hw/ide/piix: Reuse PCIIDEState::{cmd,data}_ops
In-Reply-To: <612DFA62-40DC-44D3-88A9-797FB4EC1F48@gmail.com>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-11-shentey@gmail.com>
 <4ed18370-3a92-3ae5-912f-1f6dafab37d1@ilande.co.uk>
 <612DFA62-40DC-44D3-88A9-797FB4EC1F48@gmail.com>
Message-ID: <CD1A2767-74AD-4285-ADF8-1757B8DD7953@gmail.com>
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



Am 26=2E April 2023 18:18:35 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>
>
>Am 26=2E April 2023 11:37:48 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ay=
land@ilande=2Eco=2Euk>:
>>On 22/04/2023 16:07, Bernhard Beschow wrote:
>>
>>> Now that PCIIDEState::{cmd,data}_ops are initialized in the base class
>>> constructor there is an opportunity for PIIX to reuse these attributes=
=2E This
>>> resolves usage of ide_init_ioport() which would fall back internally t=
o using
>>> the isabus global due to NULL being passed as ISADevice by PIIX=2E
>>>=20
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> ---
>>>   hw/ide/piix=2Ec | 30 +++++++++++++-----------------
>>>   1 file changed, 13 insertions(+), 17 deletions(-)
>>>=20
>>> diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>>> index a3a15dc7db=2E=2E406a67fa0f 100644
>>> --- a/hw/ide/piix=2Ec
>>> +++ b/hw/ide/piix=2Ec
>>> @@ -104,34 +104,32 @@ static void piix_ide_reset(DeviceState *dev)
>>>       pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
>>>   }
>>>   -static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus *i=
sa_bus,
>>> -                              Error **errp)
>>> +static void pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus *isa=
_bus)
>>>   {
>>>       static const struct {
>>>           int iobase;
>>>           int iobase2;
>>>           int isairq;
>>>       } port_info[] =3D {
>>> -        {0x1f0, 0x3f6, 14},
>>> -        {0x170, 0x376, 15},
>>> +        {0x1f0, 0x3f4, 14},
>>> +        {0x170, 0x374, 15},
>>>       };
>>> -    int ret;
>>> +    MemoryRegion *address_space_io =3D pci_address_space_io(PCI_DEVIC=
E(d));
>>>         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
>>> -    ret =3D ide_init_ioport(&d->bus[i], NULL, port_info[i]=2Eiobase,
>>> -                          port_info[i]=2Eiobase2);
>>> -    if (ret) {
>>> -        error_setg_errno(errp, -ret, "Failed to realize %s port %u",
>>> -                         object_get_typename(OBJECT(d)), i);
>>> -        return false;
>>> -    }
>>> +    memory_region_add_subregion(address_space_io, port_info[i]=2Eioba=
se,
>>> +                                &d->data_ops[i]);
>>> +    /*
>>> +     * PIIX forwards the last byte of cmd_ops to ISA=2E Model this us=
ing a low
>>> +     * prio so competing memory regions take precedence=2E
>>> +     */
>>> +    memory_region_add_subregion_overlap(address_space_io, port_info[i=
]=2Eiobase2,
>>> +                                        &d->cmd_ops[i], -1);
>>
>>Interesting=2E Is this behaviour documented somewhere and/or used in one=
 of your test images at all? If I'd have seen this myself, I probably thoug=
ht that the addresses were a typo=2E=2E=2E
>
>I first  stumbled upon this and wondered why this code was working with V=
IA_IDE (through my pc-via branch)=2E Then I found the correct offsets there=
 which are confirmed in the piix datasheet, e=2Eg=2E: "Secondary Control Bl=
ock Offset: 0374h"

In case you were wondering about the forwarding of the last byte the datas=
heet says: "Accesses to byte 3 of the Control Block are forwarded to ISA wh=
ere the floppy disk controller responds=2E"

>
>>
>>>       ide_bus_init_output_irq(&d->bus[i],
>>>                               isa_bus_get_irq(isa_bus, port_info[i]=2E=
isairq));
>>>         bmdma_init(&d->bus[i], &d->bmdma[i], d);
>>>       ide_bus_register_restart_cb(&d->bus[i]);
>>> -
>>> -    return true;
>>>   }
>>>     static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>>> @@ -160,9 +158,7 @@ static void pci_piix_ide_realize(PCIDevice *dev, E=
rror **errp)
>>>       }
>>>         for (unsigned i =3D 0; i < 2; i++) {
>>> -        if (!pci_piix_init_bus(d, i, isa_bus, errp)) {
>>> -            return;
>>> -        }
>>> +        pci_piix_init_bus(d, i, isa_bus);
>>>       }
>>>   }
>>>  =20
>>
>>
>>ATB,
>>
>>Mark=2E

