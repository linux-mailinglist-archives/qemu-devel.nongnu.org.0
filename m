Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622B26EFA2C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 20:42:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prk5B-0001Zx-Mv; Wed, 26 Apr 2023 14:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1prk57-0001YB-8P; Wed, 26 Apr 2023 14:41:33 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1prk54-0005bu-79; Wed, 26 Apr 2023 14:41:33 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50685f1b6e0so13746865a12.0; 
 Wed, 26 Apr 2023 11:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682534479; x=1685126479;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gml1hfRegNX/KcXMPSEgyawYZdwoullBviJGijFwtg4=;
 b=oJH6aMxWbyn1U+5ZbWDGuBSFjw5qRNRzQfglBwaS0dXw9mRxiMQuMaSGikgsJzoZ/a
 CnO4qnHqAXzM6ck8dnANxX1P2jDH+FKu4QFGYb6Yl0wGKU7xTa+She9DyvDMlYb613dX
 FpJkUUzmw/CV2BFva6rLtdJoob4TjEx7w0qFhVyGS+WyHOSzx6pBFvz4Ena7FMsbKwcl
 HSGCGObXGXd7wHfr/BkmuIecfFdT3NLmYfxzmVot1AmwLqIjRgDTErmNMbG+Fjs4XE0/
 0NWk5Le3WS4MxvInsK9/K2/3a8GZ8ESQktB2+U2K2hzfs+WvNvncQR2ASBIKUZJoJKmP
 GWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682534479; x=1685126479;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gml1hfRegNX/KcXMPSEgyawYZdwoullBviJGijFwtg4=;
 b=KXAXUXvPePvomdlrGkqE/+M+kyeuqNNRKjxEnn90aJOt08ASKGTZdcgYj1f5mS7EBn
 OXjPr25WF0jyXCuW6AnFtIMVVV3BZ+aP07JJzEOvKb/yOW0c7+EqJGUKJyFAfhB1RFcB
 CJK4S7ihVJnvHLTFyK7Cjun1qMGO0gNhYN5KECkyHqkCJtKLA1N6qvc0QOboTXAnqAzi
 ldhNjx5LgsWNjZqrllGcxrAYoi0twgJ8K2gtc4aoVwwY3dOtQ5gf3Q96TYZnDKwxD4Hv
 irW1wmIq3KT9wJKH9NJypyXCqOpYL3qxlhbuUz70dJyn3bwkcuoEXjZirqr+T3KcO1Xh
 9mYg==
X-Gm-Message-State: AAQBX9e7Vw3Tey1JOJYADnjG6Z2KzJukMjOVaKsJcdywzgg72oK6L4B/
 nT//zaWwNfCqu7WHAh3ceOw=
X-Google-Smtp-Source: AKy350YQVUw/cTyRVkAN78kxSown8O/IHo5Ydy012fF/V/Wqw9qHY/7zgFHO5fSR22wx05wAVSdvTQ==
X-Received: by 2002:a05:6402:10c2:b0:504:9cec:8afb with SMTP id
 p2-20020a05640210c200b005049cec8afbmr17984601edu.2.1682534478430; 
 Wed, 26 Apr 2023 11:41:18 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-234-209.77.13.pool.telefonica.de.
 [77.13.234.209]) by smtp.gmail.com with ESMTPSA id
 v5-20020a056402184500b0050687f06aacsm6971353edy.12.2023.04.26.11.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 11:41:18 -0700 (PDT)
Date: Wed, 26 Apr 2023 18:29:31 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 08/13] hw/ide: Rename PCIIDEState::*_bar attributes
In-Reply-To: <8bd8555f-3b29-728a-9f2a-cbc724dad3b3@ilande.co.uk>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-9-shentey@gmail.com>
 <8bd8555f-3b29-728a-9f2a-cbc724dad3b3@ilande.co.uk>
Message-ID: <C7B7621E-875A-4A52-B876-5963A20F1925@gmail.com>
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



Am 26=2E April 2023 11:21:28 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayl=
and@ilande=2Eco=2Euk>:
>On 22/04/2023 16:07, Bernhard Beschow wrote:
>
>> The attributes represent memory regions containing operations which are=
 mapped
>> by the device models into PCI BARs=2E Reflect this by changing the suff=
ic into
>> "_ops"=2E
>>=20
>> Note that in a few commits piix will also use the {cmd,data}_ops but wo=
n't map
>> them into BARs=2E This further suggests that the "_bar" suffix doesn't =
match
>> very well=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   include/hw/ide/pci=2Eh |  6 +++---
>>   hw/ide/cmd646=2Ec      | 10 +++++-----
>>   hw/ide/pci=2Ec         | 18 +++++++++---------
>>   hw/ide/piix=2Ec        |  2 +-
>>   hw/ide/via=2Ec         | 10 +++++-----
>>   5 files changed, 23 insertions(+), 23 deletions(-)
>>=20
>> diff --git a/include/hw/ide/pci=2Eh b/include/hw/ide/pci=2Eh
>> index 597c77c7ad=2E=2E5025df5b82 100644
>> --- a/include/hw/ide/pci=2Eh
>> +++ b/include/hw/ide/pci=2Eh
>> @@ -51,9 +51,9 @@ struct PCIIDEState {
>>       BMDMAState bmdma[2];
>>       qemu_irq isa_irq[2];
>>       uint32_t secondary; /* used only for cmd646 */
>> -    MemoryRegion bmdma_bar;
>> -    MemoryRegion cmd_bar[2];
>> -    MemoryRegion data_bar[2];
>> +    MemoryRegion bmdma_ops;
>> +    MemoryRegion cmd_ops[2];
>> +    MemoryRegion data_ops[2];
>>   };
>>     void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
>> diff --git a/hw/ide/cmd646=2Ec b/hw/ide/cmd646=2Ec
>> index 85716aaf17=2E=2Eb9d005a357 100644
>> --- a/hw/ide/cmd646=2Ec
>> +++ b/hw/ide/cmd646=2Ec
>> @@ -251,13 +251,13 @@ static void pci_cmd646_ide_realize(PCIDevice *dev=
, Error **errp)
>>       dev->wmask[MRDMODE] =3D 0x0;
>>       dev->w1cmask[MRDMODE] =3D MRDMODE_INTR_CH0 | MRDMODE_INTR_CH1;
>>   -    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar=
[0]);
>> -    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[0]=
);
>> -    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[1=
]);
>> -    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]=
);
>> +    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_ops[0=
]);
>> +    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_ops[0]=
);
>> +    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_ops[1=
]);
>> +    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_ops[1]=
);
>>         bmdma_init_ops(d, &cmd646_bmdma_ops);
>> -    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar)=
;
>> +    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_ops)=
;
>>         /* TODO: RST# value should be 0 */
>>       pci_conf[PCI_INTERRUPT_PIN] =3D 0x01; // interrupt on pin 1
>> diff --git a/hw/ide/pci=2Ec b/hw/ide/pci=2Ec
>> index a9194313bd=2E=2Eb2fcc00a64 100644
>> --- a/hw/ide/pci=2Ec
>> +++ b/hw/ide/pci=2Ec
>> @@ -527,15 +527,15 @@ void bmdma_init_ops(PCIIDEState *d, const MemoryR=
egionOps *bmdma_ops)
>>   {
>>       size_t i;
>>   -    memory_region_init(&d->bmdma_bar, OBJECT(d), "bmdma-container", =
16);
>> +    memory_region_init(&d->bmdma_ops, OBJECT(d), "bmdma-container", 16=
);
>>       for (i =3D 0; i < ARRAY_SIZE(d->bmdma); i++) {
>>           BMDMAState *bm =3D &d->bmdma[i];
>>             memory_region_init_io(&bm->extra_io, OBJECT(d), bmdma_ops, =
bm, "bmdma-ops", 4);
>> -        memory_region_add_subregion(&d->bmdma_bar, i * 8, &bm->extra_i=
o);
>> +        memory_region_add_subregion(&d->bmdma_ops, i * 8, &bm->extra_i=
o);
>>           memory_region_init_io(&bm->addr_ioport, OBJECT(d), &bmdma_add=
r_ioport_ops, bm,
>>                                 "bmdma-ioport-ops", 4);
>> -        memory_region_add_subregion(&d->bmdma_bar, i * 8 + 4, &bm->add=
r_ioport);
>> +        memory_region_add_subregion(&d->bmdma_ops, i * 8 + 4, &bm->add=
r_ioport);
>>       }
>>   }
>>   @@ -543,14 +543,14 @@ static void pci_ide_init(Object *obj)
>>   {
>>       PCIIDEState *d =3D PCI_IDE(obj);
>>   -    memory_region_init_io(&d->data_bar[0], OBJECT(d), &pci_ide_data_=
le_ops,
>> +    memory_region_init_io(&d->data_ops[0], OBJECT(d), &pci_ide_data_le=
_ops,
>>                             &d->bus[0], "pci-ide0-data-ops", 8);
>> -    memory_region_init_io(&d->cmd_bar[0], OBJECT(d), &pci_ide_cmd_le_o=
ps,
>> +    memory_region_init_io(&d->cmd_ops[0], OBJECT(d), &pci_ide_cmd_le_o=
ps,
>>                             &d->bus[0], "pci-ide0-cmd-ops", 4);
>>   -    memory_region_init_io(&d->data_bar[1], OBJECT(d), &pci_ide_data_=
le_ops,
>> +    memory_region_init_io(&d->data_ops[1], OBJECT(d), &pci_ide_data_le=
_ops,
>>                             &d->bus[1], "pci-ide1-data-ops", 8);
>> -    memory_region_init_io(&d->cmd_bar[1], OBJECT(d), &pci_ide_cmd_le_o=
ps,
>> +    memory_region_init_io(&d->cmd_ops[1], OBJECT(d), &pci_ide_cmd_le_o=
ps,
>>                             &d->bus[1], "pci-ide1-cmd-ops", 4);
>>         qdev_init_gpio_out(DEVICE(d), d->isa_irq, ARRAY_SIZE(d->isa_irq=
));
>> @@ -562,8 +562,8 @@ static void pci_ide_exitfn(PCIDevice *dev)
>>       unsigned i;
>>         for (i =3D 0; i < ARRAY_SIZE(d->bmdma); ++i) {
>> -        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i]=2Eextr=
a_io);
>> -        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i]=2Eaddr=
_ioport);
>> +        memory_region_del_subregion(&d->bmdma_ops, &d->bmdma[i]=2Eextr=
a_io);
>> +        memory_region_del_subregion(&d->bmdma_ops, &d->bmdma[i]=2Eaddr=
_ioport);
>>       }
>>   }
>>   diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>> index 5611473d37=2E=2E6942b484f9 100644
>> --- a/hw/ide/piix=2Ec
>> +++ b/hw/ide/piix=2Ec
>> @@ -140,7 +140,7 @@ static void pci_piix_ide_realize(PCIDevice *dev, Er=
ror **errp)
>>       pci_conf[PCI_CLASS_PROG] =3D 0x80; // legacy ATA mode
>>         bmdma_init_ops(d, &piix_bmdma_ops);
>> -    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar)=
;
>> +    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_ops)=
;
>>         for (unsigned i =3D 0; i < 2; i++) {
>>           if (!pci_piix_init_bus(d, i, errp)) {
>> diff --git a/hw/ide/via=2Ec b/hw/ide/via=2Ec
>> index 704a8024cb=2E=2E35dd97e49b 100644
>> --- a/hw/ide/via=2Ec
>> +++ b/hw/ide/via=2Ec
>> @@ -154,13 +154,13 @@ static void via_ide_realize(PCIDevice *dev, Error=
 **errp)
>>       dev->wmask[PCI_INTERRUPT_LINE] =3D 0;
>>       dev->wmask[PCI_CLASS_PROG] =3D 5;
>>   -    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar=
[0]);
>> -    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[0]=
);
>> -    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[1=
]);
>> -    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]=
);
>> +    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_ops[0=
]);
>> +    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_ops[0]=
);
>> +    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_ops[1=
]);
>> +    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_ops[1]=
);
>>         bmdma_init_ops(d, &via_bmdma_ops);
>> -    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar)=
;
>> +    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_ops)=
;
>>         qdev_init_gpio_in(ds, via_ide_set_irq, ARRAY_SIZE(d->bus));
>>       for (i =3D 0; i < ARRAY_SIZE(d->bus); i++) {
>
>I don't really feel strongly either way on this one, so I'm happy to go a=
long with the silent majority here - I see that Zoltan has expressed a pref=
erence for it to stay as-is=2E

Doesn't it look off in PIIX-IDE where we don't map these regions via BARs?=
 Don't these memory regions only become "BARs" by mapping them as such?

>
>
>ATB,
>
>Mark=2E

