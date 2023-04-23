Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8717C6EC2E9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 00:20:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqi3R-0007ps-2D; Sun, 23 Apr 2023 18:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqi3K-0007pW-Ek; Sun, 23 Apr 2023 18:19:27 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqi3E-0004NJ-Me; Sun, 23 Apr 2023 18:19:22 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-94f1d0d2e03so515855166b.0; 
 Sun, 23 Apr 2023 15:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682288358; x=1684880358;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+3SUoYNrcFkVEhRdioyGFs0DrSvjLMioaEifh5W+Wsg=;
 b=ogIPAbXcJwsOPn2enkPpQwpoFdEyzIx3ygVRW8oLO4VDyZmGphO7hXQHR6WRxNuQ0b
 PX4Xx1zR+dRycgpZliIZZ+wQnESLT8L9lP6RsvED07LixHgAmgkWzWWHTRlT3oBVSCM/
 5E8+ySiE8fAdvrdX5Vxd10N1kG/7SqCEev2/XW/8OjK2xZWZaEFQySFHUHG2Vb4g0etO
 hwjH9cYMMIQzEZYKutO0qH+OijjZFIh8FggjtR9JNRxilgE3lowSl+ikHEVlZ4H18jpq
 8nV4mtaa3s2DPcsMFQ26f3G49DDQUFYF7ycmPHJnFmoDMD166tJu2dX9z+so5+hbxqAB
 Y1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682288358; x=1684880358;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+3SUoYNrcFkVEhRdioyGFs0DrSvjLMioaEifh5W+Wsg=;
 b=Ls/8EYQhO+IJzemNh1a/wbfzT3tSisQ9WyzKWyRypOCSCn9Ep+qZJzHFTHWHJIYTc6
 N/LtrNdKiVSStXFMOcKC8yrPphd9hJegt3EhFtKPFV8fB5Xf1FBUqAQaja+fPTXRAvnE
 UXBbqHoSWyvDqwnd+/PuFGvhROuBoCpPhokiwTTfoFRm/0ot6mOFBJvGDGJLZWuaHs4P
 KMhIe/RpYlAaZXWQ36B/l4LzoIc6cv5kizF9zl4evJ/79GvbmmmS9NsgPuUn7Wllzm6j
 zHSzZVx69Ct1DJUl/Lwckogx/LhO4/ov+6kkHYgjWej4rWiptMdyMzUkXnXy5J3QTVu2
 0C2w==
X-Gm-Message-State: AAQBX9eYjOl7/GQfEqzXMBAS2VYoeV6SIm6zGrHHQXtxadlAxwnAAvX5
 AAL7LaXITMCjYKWTpTNXRtc=
X-Google-Smtp-Source: AKy350bEYCipKPg3KW3hfM7uxO1UkrNPyyXBSoJw+LvQRq9SI69Knj7IDPCXcu1L3odEFa70eRZ4Rw==
X-Received: by 2002:a17:906:b46:b0:94e:6b12:caab with SMTP id
 v6-20020a1709060b4600b0094e6b12caabmr7960237ejg.51.1682288358337; 
 Sun, 23 Apr 2023 15:19:18 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-183-111-058.77.183.pool.telefonica.de.
 [77.183.111.58]) by smtp.gmail.com with ESMTPSA id
 tp24-20020a170907c49800b00957304d68a7sm3135213ejc.202.2023.04.23.15.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 15:19:17 -0700 (PDT)
Date: Sun, 23 Apr 2023 22:19:16 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 11/13] hw/ide/sii3112: Reuse PCIIDEState::{cmd,data}_ops
In-Reply-To: <468a2251-0484-ab97-217c-10d965af6c67@eik.bme.hu>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-12-shentey@gmail.com>
 <468a2251-0484-ab97-217c-10d965af6c67@eik.bme.hu>
Message-ID: <1568DC85-6305-4EE5-9F22-E3E792E36538@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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



Am 22=2E April 2023 21:10:14 UTC schrieb BALATON Zoltan <balaton@eik=2Ebme=
=2Ehu>:
>On Sat, 22 Apr 2023, Bernhard Beschow wrote:
>> Allows to unexport pci_ide_{cmd,data}_le_ops and models TYPE_SII3112_PC=
I as a
>> standard-compliant PCI IDE device=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>> include/hw/ide/pci=2Eh |  2 --
>> hw/ide/pci=2Ec         |  4 ++--
>> hw/ide/sii3112=2Ec     | 50 ++++++++++++++++---------------------------=
-
>> 3 files changed, 20 insertions(+), 36 deletions(-)
>>=20
>> diff --git a/include/hw/ide/pci=2Eh b/include/hw/ide/pci=2Eh
>> index 5025df5b82=2E=2Edbb4b13161 100644
>> --- a/include/hw/ide/pci=2Eh
>> +++ b/include/hw/ide/pci=2Eh
>> @@ -62,6 +62,4 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
>> extern MemoryRegionOps bmdma_addr_ioport_ops;
>> void pci_ide_create_devs(PCIDevice *dev);
>>=20
>> -extern const MemoryRegionOps pci_ide_cmd_le_ops;
>> -extern const MemoryRegionOps pci_ide_data_le_ops;
>> #endif
>> diff --git a/hw/ide/pci=2Ec b/hw/ide/pci=2Ec
>> index b2fcc00a64=2E=2E97ccc75aa6 100644
>> --- a/hw/ide/pci=2Ec
>> +++ b/hw/ide/pci=2Ec
>> @@ -60,7 +60,7 @@ static void pci_ide_ctrl_write(void *opaque, hwaddr a=
ddr,
>>     ide_ctrl_write(bus, addr + 2, data);
>> }
>>=20
>> -const MemoryRegionOps pci_ide_cmd_le_ops =3D {
>> +static const MemoryRegionOps pci_ide_cmd_le_ops =3D {
>>     =2Eread =3D pci_ide_status_read,
>>     =2Ewrite =3D pci_ide_ctrl_write,
>>     =2Eendianness =3D DEVICE_LITTLE_ENDIAN,
>> @@ -98,7 +98,7 @@ static void pci_ide_data_write(void *opaque, hwaddr a=
ddr,
>>     }
>> }
>>=20
>> -const MemoryRegionOps pci_ide_data_le_ops =3D {
>> +static const MemoryRegionOps pci_ide_data_le_ops =3D {
>>     =2Eread =3D pci_ide_data_read,
>>     =2Ewrite =3D pci_ide_data_write,
>>     =2Eendianness =3D DEVICE_LITTLE_ENDIAN,
>> diff --git a/hw/ide/sii3112=2Ec b/hw/ide/sii3112=2Ec
>> index 0af897a9ef=2E=2E9cf920369f 100644
>> --- a/hw/ide/sii3112=2Ec
>> +++ b/hw/ide/sii3112=2Ec
>> @@ -88,21 +88,9 @@ static uint64_t sii3112_reg_read(void *opaque, hwadd=
r addr,
>>         val |=3D (d->regs[1]=2Econfstat & (1UL << 11) ? (1 << 4) : 0);
>>         val |=3D (uint32_t)d->i=2Ebmdma[1]=2Estatus << 16;
>>         break;
>> -    case 0x80 =2E=2E=2E 0x87:
>> -        val =3D pci_ide_data_le_ops=2Eread(&d->i=2Ebus[0], addr - 0x80=
, size);
>> -        break;
>> -    case 0x8a:
>> -        val =3D pci_ide_cmd_le_ops=2Eread(&d->i=2Ebus[0], 2, size);
>> -        break;
>>     case 0xa0:
>>         val =3D d->regs[0]=2Econfstat;
>>         break;
>> -    case 0xc0 =2E=2E=2E 0xc7:
>> -        val =3D pci_ide_data_le_ops=2Eread(&d->i=2Ebus[1], addr - 0xc0=
, size);
>> -        break;
>> -    case 0xca:
>> -        val =3D pci_ide_cmd_le_ops=2Eread(&d->i=2Ebus[1], 2, size);
>> -        break;
>>     case 0xe0:
>>         val =3D d->regs[1]=2Econfstat;
>>         break;
>> @@ -171,18 +159,6 @@ static void sii3112_reg_write(void *opaque, hwaddr=
 addr,
>>     case 0x0c =2E=2E=2E 0x0f:
>>         bmdma_addr_ioport_ops=2Ewrite(&d->i=2Ebmdma[1], addr - 12, val,=
 size);
>>         break;
>> -    case 0x80 =2E=2E=2E 0x87:
>> -        pci_ide_data_le_ops=2Ewrite(&d->i=2Ebus[0], addr - 0x80, val, =
size);
>> -        break;
>> -    case 0x8a:
>> -        pci_ide_cmd_le_ops=2Ewrite(&d->i=2Ebus[0], 2, val, size);
>> -        break;
>> -    case 0xc0 =2E=2E=2E 0xc7:
>> -        pci_ide_data_le_ops=2Ewrite(&d->i=2Ebus[1], addr - 0xc0, val, =
size);
>> -        break;
>> -    case 0xca:
>> -        pci_ide_cmd_le_ops=2Ewrite(&d->i=2Ebus[1], 2, val, size);
>> -        break;
>>     case 0x100:
>>         d->regs[0]=2Escontrol =3D val & 0xfff;
>>         if (val & 1) {
>> @@ -259,6 +235,11 @@ static void sii3112_pci_realize(PCIDevice *dev, Er=
ror **errp)
>>     pci_config_set_interrupt_pin(dev->config, 1);
>>     pci_set_byte(dev->config + PCI_CACHE_LINE_SIZE, 8);
>>=20
>> +    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->data_ops[0=
]);
>> +    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &s->cmd_ops[0]=
);
>> +    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &s->data_ops[1=
]);
>> +    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &s->cmd_ops[1]=
);
>> +
>>     /* BAR5 is in PCI memory space */
>>     memory_region_init_io(&d->mmio, OBJECT(d), &sii3112_reg_ops, d,
>>                          "sii3112=2Ebar5", 0x200);
>> @@ -266,17 +247,22 @@ static void sii3112_pci_realize(PCIDevice *dev, E=
rror **errp)
>>=20
>>     /* BAR0-BAR4 are PCI I/O space aliases into BAR5 */
>
>This patch breaks the above comment

Indeed=2E It's now the other way around=2E

>but I think you should not mess with BAR0-4 at all and leave to to aliase=
d into BAR5=2E These have the same registers mirrored and some guests acces=
s them via the memory mapped BAR5 while others prefer the io mapped BAR0-4 =
so removing these from BAR5 would break some guests=2E

BARs 0-3 are the PCI-native BARs and BAR4 is the BMDMA BAR which are mappe=
d by via and cmd646 already since they support these modes=2E SIL3112 suppo=
rts these modes as well but had custom implementations so far while ignorin=
g the attributes of the parent class=2E Now that the parent class already i=
nitializes these attributes we can just reuse them here which in addition m=
akes it very obvious that SIL3112 supports these modes=2E

I'll split this patch and the next one to (hopefully) make more visible wh=
at happens=2E

> If you want to remove something from BAR5 and map subregions implementin=
g those instead then I think only BAR5 needs to be chnaged or I'm not getti=
ng what is happening here so a more detailed commit message would be needed=
=2E

Agreed=2E I'll put wording similar to above into the commit message=2E

>
>Was this tested? A minimal test might be booting AROS and MorphOS on sam4=
60ex=2E

I tested with MorphOS on sam460ex=2E The second ppc test case in the cover=
 letter was actually supposed to show this=2E

Best regards,
Bernhard

>
>Regards,
>BALATON Zoltan
>
>>     mr =3D g_new(MemoryRegion, 1);
>> -    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar0", &d->mmio=
, 0x80, 8);
>> -    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, mr);
>> +    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar0", &s->data=
_ops[0], 0,
>> +                             memory_region_size(&s->data_ops[0]));
>> +    memory_region_add_subregion_overlap(&d->mmio, 0x80, mr, 1);
>>     mr =3D g_new(MemoryRegion, 1);
>> -    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar1", &d->mmio=
, 0x88, 4);
>> -    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, mr);
>> +    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar1", &s->cmd_=
ops[0], 0,
>> +                             memory_region_size(&s->cmd_ops[0]));
>> +    memory_region_add_subregion_overlap(&d->mmio, 0x88, mr, 1);
>>     mr =3D g_new(MemoryRegion, 1);
>> -    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar2", &d->mmio=
, 0xc0, 8);
>> -    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, mr);
>> +    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar2", &s->data=
_ops[1], 0,
>> +                             memory_region_size(&s->data_ops[1]));
>> +    memory_region_add_subregion_overlap(&d->mmio, 0xc0, mr, 1);
>>     mr =3D g_new(MemoryRegion, 1);
>> -    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar3", &d->mmio=
, 0xc8, 4);
>> -    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, mr);
>> +    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar3", &s->cmd_=
ops[1], 0,
>> +                             memory_region_size(&s->cmd_ops[1]));
>> +    memory_region_add_subregion_overlap(&d->mmio, 0xc8, mr, 1);
>> +
>>     mr =3D g_new(MemoryRegion, 1);
>>     memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar4", &d->mmio,=
 0, 16);
>>     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, mr);
>>=20

