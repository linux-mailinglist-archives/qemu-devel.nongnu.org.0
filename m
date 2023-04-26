Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC07F6EFA2F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 20:43:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prk5E-0001e4-MU; Wed, 26 Apr 2023 14:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1prk58-0001ZK-Q4; Wed, 26 Apr 2023 14:41:35 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1prk54-0005be-7p; Wed, 26 Apr 2023 14:41:34 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-956ff2399c9so1321700266b.3; 
 Wed, 26 Apr 2023 11:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682534477; x=1685126477;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rB+PWZsJyPcTAOquyIu+KLdgZN4X5fVRpKl8JESb9PA=;
 b=hIGcgKviTlzYquRHo1FkJYiejx+1pxDSCnw5TQZl8DviM4qXfj5pWsPgCePVvSZg6P
 6t1mzbodhOSUwbmAQvdbOM5bNGQ7c6HdFth9/a6toipDFsdnyJshd931diE4D4SuMTjf
 aCLFWPRfXt/WzcNpc2UlriD1To5kcs5GUlyRUfkoJByvH8DfYgFpgh94jjyL2EEbUIsd
 Xd28n2vDIEjY5AO9gorYvok92mgUA4d55N0REW88jFEJkBGlZlLKUGH2kZK2+QoNvvdl
 5+ZhGX804eDt9tOhUrfDjH8WCFxWnA6DDWdFeQPGHBT4m3qMbflgC3CNa6ZS0Yun60+q
 eQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682534477; x=1685126477;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rB+PWZsJyPcTAOquyIu+KLdgZN4X5fVRpKl8JESb9PA=;
 b=iYDCIBn9+Olyk1PAWWiIyGw9HXgRcw+PrqcQkwitDZFmUHwxqZ6fO4w4uI/hFVQ2Qd
 RPktV7PYdngQa5mo3MnV8p+rlUkkkz/6CTgBHGX7rOKl5RNxcZP6ZV5SDiaANP0xMoyH
 RAklKRrlJOMvCRMPKPQJep3wKctRYtiBs0Qc1gYIEfg+vNlacZww5R4bGv71oja/XQKv
 AbEwOVngYYZcytpWdimMFhORiAPzePuHd13xh9KV5SdTVnVC8BgrCA9EH7dElNFCHRRx
 4y24wHva08pUtNeBG/XDv5+IE2No/baDcP7TWQ5PZ+SguCJj95p2OWt0ALblcRpPrj0d
 ECHQ==
X-Gm-Message-State: AAQBX9dGljf4FXpp/kFNw8Tvi1WoxbaH/RYF1z7CpqtKFSy+yVTqlfBJ
 aOoRW4mG3M8DtxD22rjut5A=
X-Google-Smtp-Source: AKy350YDxnUOetSafNkaX/nSe8JT5JdQy4T3OctzGT9qXWzv2yhU6abDxP7FGlq113FOktT1ghOLBQ==
X-Received: by 2002:a17:906:16d3:b0:94a:90e5:b2b6 with SMTP id
 t19-20020a17090616d300b0094a90e5b2b6mr16358128ejd.58.1682534476891; 
 Wed, 26 Apr 2023 11:41:16 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-234-209.77.13.pool.telefonica.de.
 [77.13.234.209]) by smtp.gmail.com with ESMTPSA id
 o19-20020a1709062e9300b0094f281bd279sm8511817eji.198.2023.04.26.11.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 11:41:16 -0700 (PDT)
Date: Wed, 26 Apr 2023 18:32:05 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 05/13] hw/ide: Extract pci_ide_class_init()
In-Reply-To: <811f068f-de53-dd81-b360-6b95930a237f@ilande.co.uk>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-6-shentey@gmail.com>
 <811f068f-de53-dd81-b360-6b95930a237f@ilande.co.uk>
Message-ID: <2B50BD9B-05D8-4CAC-96AF-D9A07AE0836F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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



Am 26=2E April 2023 11:04:30 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayl=
and@ilande=2Eco=2Euk>:
>On 22/04/2023 16:07, Bernhard Beschow wrote:
>
>> Resolves redundant code in every PCI IDE device model=2E
>
>I think this needs to mention that it's moving the PCIDeviceClass::exit()=
 function from all of the PCI IDE controller implementations to a common im=
plementation in the parent PCI_IDE type=2E

I'll completely rework this patch=2E

>
>> ---
>>   include/hw/ide/pci=2Eh |  1 -
>>   hw/ide/cmd646=2Ec      | 15 ---------------
>>   hw/ide/pci=2Ec         | 25 ++++++++++++++++++++++++-
>>   hw/ide/piix=2Ec        | 19 -------------------
>>   hw/ide/sii3112=2Ec     |  3 ++-
>>   hw/ide/via=2Ec         | 15 ---------------
>>   6 files changed, 26 insertions(+), 52 deletions(-)
>>=20
>> diff --git a/include/hw/ide/pci=2Eh b/include/hw/ide/pci=2Eh
>> index 74c127e32f=2E=2E7bc4e53d02 100644
>> --- a/include/hw/ide/pci=2Eh
>> +++ b/include/hw/ide/pci=2Eh
>> @@ -61,7 +61,6 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
>>   extern MemoryRegionOps bmdma_addr_ioport_ops;
>>   void pci_ide_create_devs(PCIDevice *dev);
>>   -extern const VMStateDescription vmstate_ide_pci;
>>   extern const MemoryRegionOps pci_ide_cmd_le_ops;
>>   extern const MemoryRegionOps pci_ide_data_le_ops;
>>   #endif
>> diff --git a/hw/ide/cmd646=2Ec b/hw/ide/cmd646=2Ec
>> index a094a6e12a=2E=2E9aabf80e52 100644
>> --- a/hw/ide/cmd646=2Ec
>> +++ b/hw/ide/cmd646=2Ec
>> @@ -301,17 +301,6 @@ static void pci_cmd646_ide_realize(PCIDevice *dev,=
 Error **errp)
>>       }
>>   }
>>   -static void pci_cmd646_ide_exitfn(PCIDevice *dev)
>> -{
>> -    PCIIDEState *d =3D PCI_IDE(dev);
>> -    unsigned i;
>> -
>> -    for (i =3D 0; i < 2; ++i) {
>> -        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i]=2Eextr=
a_io);
>> -        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i]=2Eaddr=
_ioport);
>> -    }
>> -}
>> -
>>   static Property cmd646_ide_properties[] =3D {
>>       DEFINE_PROP_UINT32("secondary", PCIIDEState, secondary, 0),
>>       DEFINE_PROP_END_OF_LIST(),
>> @@ -323,17 +312,13 @@ static void cmd646_ide_class_init(ObjectClass *kl=
ass, void *data)
>>       PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>>         dc->reset =3D cmd646_reset;
>> -    dc->vmsd =3D &vmstate_ide_pci;
>>       k->realize =3D pci_cmd646_ide_realize;
>> -    k->exit =3D pci_cmd646_ide_exitfn;
>>       k->vendor_id =3D PCI_VENDOR_ID_CMD;
>>       k->device_id =3D PCI_DEVICE_ID_CMD_646;
>>       k->revision =3D 0x07;
>> -    k->class_id =3D PCI_CLASS_STORAGE_IDE;
>>       k->config_read =3D cmd646_pci_config_read;
>>       k->config_write =3D cmd646_pci_config_write;
>>       device_class_set_props(dc, cmd646_ide_properties);
>> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>>   }
>>     static const TypeInfo cmd646_ide_info =3D {
>> diff --git a/hw/ide/pci=2Ec b/hw/ide/pci=2Ec
>> index 67e0998ff0=2E=2E8bea92e394 100644
>> --- a/hw/ide/pci=2Ec
>> +++ b/hw/ide/pci=2Ec
>> @@ -467,7 +467,7 @@ static int ide_pci_post_load(void *opaque, int vers=
ion_id)
>>       return 0;
>>   }
>>   -const VMStateDescription vmstate_ide_pci =3D {
>> +static const VMStateDescription vmstate_ide_pci =3D {
>>       =2Ename =3D "ide",
>>       =2Eversion_id =3D 3,
>>       =2Eminimum_version_id =3D 0,
>> @@ -530,11 +530,34 @@ static void pci_ide_init(Object *obj)
>>       qdev_init_gpio_out(DEVICE(d), d->isa_irq, ARRAY_SIZE(d->isa_irq))=
;
>>   }
>>   +static void pci_ide_exitfn(PCIDevice *dev)
>> +{
>> +    PCIIDEState *d =3D PCI_IDE(dev);
>> +    unsigned i;
>> +
>> +    for (i =3D 0; i < ARRAY_SIZE(d->bmdma); ++i) {
>> +        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i]=2Eextr=
a_io);
>> +        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i]=2Eaddr=
_ioport);
>> +    }
>> +}
>> +
>> +static void pci_ide_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>> +
>> +    dc->vmsd =3D &vmstate_ide_pci;
>> +    k->exit =3D pci_ide_exitfn;
>> +    k->class_id =3D PCI_CLASS_STORAGE_IDE;
>> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>> +}
>> +
>>   static const TypeInfo pci_ide_type_info =3D {
>>       =2Ename =3D TYPE_PCI_IDE,
>>       =2Eparent =3D TYPE_PCI_DEVICE,
>>       =2Einstance_size =3D sizeof(PCIIDEState),
>>       =2Einstance_init =3D pci_ide_init,
>> +    =2Eclass_init =3D pci_ide_class_init,
>>       =2Eabstract =3D true,
>>       =2Einterfaces =3D (InterfaceInfo[]) {
>>           { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>> diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>> index a32f7ccece=2E=2E4e6ca99123 100644
>> --- a/hw/ide/piix=2Ec
>> +++ b/hw/ide/piix=2Ec
>> @@ -159,8 +159,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, Er=
ror **errp)
>>       bmdma_setup_bar(d);
>>       pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar=
);
>>   -    vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
>> -
>
>Presumably this still survives migration between a pre-series and post-se=
ries QEMU using the PIIX IDE controller?
>
>>       for (unsigned i =3D 0; i < 2; i++) {
>>           if (!pci_piix_init_bus(d, i, errp)) {
>>               return;
>> @@ -168,17 +166,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, E=
rror **errp)
>>       }
>>   }
>>   -static void pci_piix_ide_exitfn(PCIDevice *dev)
>> -{
>> -    PCIIDEState *d =3D PCI_IDE(dev);
>> -    unsigned i;
>> -
>> -    for (i =3D 0; i < 2; ++i) {
>> -        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i]=2Eextr=
a_io);
>> -        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i]=2Eaddr=
_ioport);
>> -    }
>> -}
>> -
>>   /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
>>   static void piix3_ide_class_init(ObjectClass *klass, void *data)
>>   {
>> @@ -187,11 +174,8 @@ static void piix3_ide_class_init(ObjectClass *klas=
s, void *data)
>>         dc->reset =3D piix_ide_reset;
>>       k->realize =3D pci_piix_ide_realize;
>> -    k->exit =3D pci_piix_ide_exitfn;
>>       k->vendor_id =3D PCI_VENDOR_ID_INTEL;
>>       k->device_id =3D PCI_DEVICE_ID_INTEL_82371SB_1;
>> -    k->class_id =3D PCI_CLASS_STORAGE_IDE;
>> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>>       dc->hotpluggable =3D false;
>>   }
>>   @@ -209,11 +193,8 @@ static void piix4_ide_class_init(ObjectClass *kl=
ass, void *data)
>>         dc->reset =3D piix_ide_reset;
>>       k->realize =3D pci_piix_ide_realize;
>> -    k->exit =3D pci_piix_ide_exitfn;
>>       k->vendor_id =3D PCI_VENDOR_ID_INTEL;
>>       k->device_id =3D PCI_DEVICE_ID_INTEL_82371AB;
>> -    k->class_id =3D PCI_CLASS_STORAGE_IDE;
>> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>>       dc->hotpluggable =3D false;
>>   }
>>   diff --git a/hw/ide/sii3112=2Ec b/hw/ide/sii3112=2Ec
>> index 5dd3d03c29=2E=2E0af897a9ef 100644
>> --- a/hw/ide/sii3112=2Ec
>> +++ b/hw/ide/sii3112=2Ec
>> @@ -301,9 +301,10 @@ static void sii3112_pci_class_init(ObjectClass *kl=
ass, void *data)
>>       pd->class_id =3D PCI_CLASS_STORAGE_RAID;
>>       pd->revision =3D 1;
>>       pd->realize =3D sii3112_pci_realize;
>> +    pd->exit =3D NULL;
>>       dc->reset =3D sii3112_reset;
>> +    dc->vmsd =3D NULL;
>>       dc->desc =3D "SiI3112A SATA controller";
>> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>>   }
>
>No need to set explicit NULLs here: class/object structures are all zeroe=
d before init (unless you're deliberately trying to prevent the common PCID=
eviceClass::exit() function from being called here temporarily?)
>
>>   static const TypeInfo sii3112_pci_info =3D {
>> diff --git a/hw/ide/via=2Ec b/hw/ide/via=2Ec
>> index 91253fa4ef=2E=2E287143a005 100644
>> --- a/hw/ide/via=2Ec
>> +++ b/hw/ide/via=2Ec
>> @@ -200,34 +200,19 @@ static void via_ide_realize(PCIDevice *dev, Error=
 **errp)
>>       }
>>   }
>>   -static void via_ide_exitfn(PCIDevice *dev)
>> -{
>> -    PCIIDEState *d =3D PCI_IDE(dev);
>> -    unsigned i;
>> -
>> -    for (i =3D 0; i < ARRAY_SIZE(d->bmdma); ++i) {
>> -        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i]=2Eextr=
a_io);
>> -        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i]=2Eaddr=
_ioport);
>> -    }
>> -}
>> -
>>   static void via_ide_class_init(ObjectClass *klass, void *data)
>>   {
>>       DeviceClass *dc =3D DEVICE_CLASS(klass);
>>       PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>>         dc->reset =3D via_ide_reset;
>> -    dc->vmsd =3D &vmstate_ide_pci;
>>       /* Reason: only works as function of VIA southbridge */
>>       dc->user_creatable =3D false;
>>         k->realize =3D via_ide_realize;
>> -    k->exit =3D via_ide_exitfn;
>>       k->vendor_id =3D PCI_VENDOR_ID_VIA;
>>       k->device_id =3D PCI_DEVICE_ID_VIA_IDE;
>>       k->revision =3D 0x06;
>> -    k->class_id =3D PCI_CLASS_STORAGE_IDE;
>> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>>   }
>>     static const TypeInfo via_ide_info =3D {
>
>A couple of queries, but generally looks good to me=2E
>
>
>ATB,
>
>Mark=2E

