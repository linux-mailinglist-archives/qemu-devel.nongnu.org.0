Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB606EFBA0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 22:27:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prliZ-0000qT-MA; Wed, 26 Apr 2023 16:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1prliW-0000oH-Vw; Wed, 26 Apr 2023 16:26:21 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1prliU-0007zx-Cg; Wed, 26 Apr 2023 16:26:20 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94f1d0d2e03so1124240266b.0; 
 Wed, 26 Apr 2023 13:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682540776; x=1685132776;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b4YQih1acVOVHxeSGNKR/0rN/rMjAm2tzpnYfAcG+1k=;
 b=QcQL28aUl1JaoyY+bCz2Uy7lNBrvK5r3d9C1nsu9OT0CFed5EUFvF7bcByhC+SL8QV
 fIvKylxHk3Kvsi9eqR5j1BOWH1uZVNi8m8TRS4hEP3Sab81wYikrFYrinOEshpPqeUVz
 Jh5IsKPvqkgVusgWr5RpddC4hZlJyffy8hq0ZWUnxeM7T5WFXwIqIE5sPPAr1t84Ukep
 6GEXrhuvDHcgHSrdQNUx6QPgj348FnlNrRRsc3BqnSPu+teMeF3Dy5I1+aNGD+y31rMY
 9GH0PvSUM8NlZHSNvbv0opB3JKq16pdtNiEiq0p86Rzum9UdcGpxcbffmIVGrKrELup4
 d08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682540776; x=1685132776;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b4YQih1acVOVHxeSGNKR/0rN/rMjAm2tzpnYfAcG+1k=;
 b=gxuVCN2HJU4bsIkRnHUrSUcw2M8OkVAYBmyB/cjH4VrebBsw/BWOhucekAPGqjBhLd
 tHG+ezj7VxxOK1wAZFAIZGYPEu7e3gf0pHZPFtldHuFQ3FlyyBmLlNjtgqdbDed+DpxF
 GbuKhA6xyshojlIBJSNISerOqzo6Z344LZoEI0mNe9zaMk57Dx/9tTwOZn7fqphLLt11
 R90JOOjMAs8lO+lQUVXHxOKpd6CQOaftCUYLsRpfwJ5leej/nqw1npMD9r/MAutOoAbc
 eUjsuwNoAuiY/32O2EeBaBqUIqo0q+1/lvU6wI4JbG0rOUwBcvgF+aho1qn9MWkDlCDA
 3KQA==
X-Gm-Message-State: AAQBX9fBnl9xJio3+8yHf1kBL8bp2iAW0P1nk1qMga59tuQU7i9fJq2q
 ro+8URfHUf68QynOJ0b5jvs=
X-Google-Smtp-Source: AKy350ZXBQKsDMpTK3DJqTpDu930uVYu1pDQfMLEX3NzmriszkYdyfYUrGdPsP3LkxGo80DqxwodiA==
X-Received: by 2002:a17:906:808:b0:953:856f:bd83 with SMTP id
 e8-20020a170906080800b00953856fbd83mr18326006ejd.75.1682540776037; 
 Wed, 26 Apr 2023 13:26:16 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-234-209.77.13.pool.telefonica.de.
 [77.13.234.209]) by smtp.gmail.com with ESMTPSA id
 lf4-20020a170907174400b0094a8f61ef3fsm8761139ejc.173.2023.04.26.13.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 13:26:15 -0700 (PDT)
Date: Wed, 26 Apr 2023 20:26:09 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 12/13] hw/ide/sii3112: Reuse PCIIDEState::bmdma_ops
In-Reply-To: <859c8a06-cfdf-3f0b-615f-07a703439687@ilande.co.uk>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-13-shentey@gmail.com>
 <859c8a06-cfdf-3f0b-615f-07a703439687@ilande.co.uk>
Message-ID: <CC5EBDEC-F2D8-4C44-AD42-2D60A055BC3E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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



Am 26=2E April 2023 11:44:29 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayl=
and@ilande=2Eco=2Euk>:
>On 22/04/2023 16:07, Bernhard Beschow wrote:
>
>> Allows to unexport bmdma_addr_ioport_ops and models TYPE_SII3112_PCI as=
 a
>> standard-compliant PCI IDE device=2E
>
>Nice! I think it's worth adding a brief mention that you've added BMDMA t=
race-events, but otherwise looks sensible to me=2E

Will do=2E I'd also split this patch into two=2E

Best regards,
Bernhard

>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   include/hw/ide/pci=2Eh |  1 -
>>   hw/ide/pci=2Ec         |  2 +-
>>   hw/ide/sii3112=2Ec     | 94 ++++++++++++++++++++++++++---------------=
---
>>   hw/ide/trace-events  |  6 ++-
>>   4 files changed, 60 insertions(+), 43 deletions(-)
>>=20
>> diff --git a/include/hw/ide/pci=2Eh b/include/hw/ide/pci=2Eh
>> index dbb4b13161=2E=2E81e0370202 100644
>> --- a/include/hw/ide/pci=2Eh
>> +++ b/include/hw/ide/pci=2Eh
>> @@ -59,7 +59,6 @@ struct PCIIDEState {
>>   void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
>>   void bmdma_init_ops(PCIIDEState *d, const MemoryRegionOps *bmdma_ops)=
;
>>   void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
>> -extern MemoryRegionOps bmdma_addr_ioport_ops;
>>   void pci_ide_create_devs(PCIDevice *dev);
>>     #endif
>> diff --git a/hw/ide/pci=2Ec b/hw/ide/pci=2Ec
>> index 97ccc75aa6=2E=2E3539b162b7 100644
>> --- a/hw/ide/pci=2Ec
>> +++ b/hw/ide/pci=2Ec
>> @@ -342,7 +342,7 @@ static void bmdma_addr_write(void *opaque, hwaddr a=
ddr,
>>       bm->addr |=3D ((data & mask) << shift) & ~3;
>>   }
>>   -MemoryRegionOps bmdma_addr_ioport_ops =3D {
>> +static MemoryRegionOps bmdma_addr_ioport_ops =3D {
>>       =2Eread =3D bmdma_addr_read,
>>       =2Ewrite =3D bmdma_addr_write,
>>       =2Eendianness =3D DEVICE_LITTLE_ENDIAN,
>> diff --git a/hw/ide/sii3112=2Ec b/hw/ide/sii3112=2Ec
>> index 9cf920369f=2E=2E373c0dd1ee 100644
>> --- a/hw/ide/sii3112=2Ec
>> +++ b/hw/ide/sii3112=2Ec
>> @@ -34,47 +34,73 @@ struct SiI3112PCIState {
>>       SiI3112Regs regs[2];
>>   };
>>   -/* The sii3112_reg_read and sii3112_reg_write functions implement th=
e
>> - * Internal Register Space - BAR5 (section 6=2E7 of the data sheet)=2E
>> - */
>> -
>> -static uint64_t sii3112_reg_read(void *opaque, hwaddr addr,
>> -                                unsigned int size)
>> +static uint64_t sii3112_bmdma_read(void *opaque, hwaddr addr, unsigned=
 int size)
>>   {
>> -    SiI3112PCIState *d =3D opaque;
>> +    BMDMAState *bm =3D opaque;
>> +    SiI3112PCIState *d =3D SII3112_PCI(bm->pci_dev);
>> +    int i =3D (bm =3D=3D &bm->pci_dev->bmdma[0]) ? 0 : 1;
>>       uint64_t val;
>>         switch (addr) {
>>       case 0x00:
>> -        val =3D d->i=2Ebmdma[0]=2Ecmd;
>> +        val =3D bm->cmd;
>>           break;
>>       case 0x01:
>> -        val =3D d->regs[0]=2Eswdata;
>> +        val =3D d->regs[i]=2Eswdata;
>>           break;
>>       case 0x02:
>> -        val =3D d->i=2Ebmdma[0]=2Estatus;
>> +        val =3D bm->status;
>>           break;
>>       case 0x03:
>>           val =3D 0;
>>           break;
>> -    case 0x04 =2E=2E=2E 0x07:
>> -        val =3D bmdma_addr_ioport_ops=2Eread(&d->i=2Ebmdma[0], addr - =
4, size);
>> -        break;
>> -    case 0x08:
>> -        val =3D d->i=2Ebmdma[1]=2Ecmd;
>> +    default:
>> +        val =3D 0;
>>           break;
>> -    case 0x09:
>> -        val =3D d->regs[1]=2Eswdata;
>> +    }
>> +    trace_sii3112_bmdma_read(size, addr, val);
>> +    return val;
>> +}
>> +
>> +static void sii3112_bmdma_write(void *opaque, hwaddr addr,
>> +                                uint64_t val, unsigned int size)
>> +{
>> +    BMDMAState *bm =3D opaque;
>> +    SiI3112PCIState *d =3D SII3112_PCI(bm->pci_dev);
>> +    int i =3D (bm =3D=3D &bm->pci_dev->bmdma[0]) ? 0 : 1;
>> +
>> +    trace_sii3112_bmdma_write(size, addr, val);
>> +    switch (addr) {
>> +    case 0x00:
>> +        bmdma_cmd_writeb(bm, val);
>>           break;
>> -    case 0x0a:
>> -        val =3D d->i=2Ebmdma[1]=2Estatus;
>> +    case 0x01:
>> +        d->regs[i]=2Eswdata =3D val & 0x3f;
>>           break;
>> -    case 0x0b:
>> -        val =3D 0;
>> +    case 0x02:
>> +        bm->status =3D (val & 0x60) | (bm->status & 1) | (bm->status &=
 ~val & 6);
>>           break;
>> -    case 0x0c =2E=2E=2E 0x0f:
>> -        val =3D bmdma_addr_ioport_ops=2Eread(&d->i=2Ebmdma[1], addr - =
12, size);
>> +    default:
>>           break;
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps sii3112_bmdma_ops =3D {
>> +    =2Eread =3D sii3112_bmdma_read,
>> +    =2Ewrite =3D sii3112_bmdma_write,
>> +};
>> +
>> +/* The sii3112_reg_read and sii3112_reg_write functions implement the
>> + * Internal Register Space - BAR5 (section 6=2E7 of the data sheet)=2E
>> + */
>> +
>> +static uint64_t sii3112_reg_read(void *opaque, hwaddr addr,
>> +                                unsigned int size)
>> +{
>> +    SiI3112PCIState *d =3D opaque;
>> +    uint64_t val;
>> +
>> +    switch (addr) {
>>       case 0x10:
>>           val =3D d->i=2Ebmdma[0]=2Ecmd;
>>           val |=3D (d->regs[0]=2Econfstat & (1UL << 11) ? (1 << 4) : 0)=
; /*SATAINT0*/
>> @@ -127,38 +153,26 @@ static void sii3112_reg_write(void *opaque, hwadd=
r addr,
>>         trace_sii3112_write(size, addr, val);
>>       switch (addr) {
>> -    case 0x00:
>>       case 0x10:
>>           bmdma_cmd_writeb(&d->i=2Ebmdma[0], val);
>>           break;
>> -    case 0x01:
>>       case 0x11:
>>           d->regs[0]=2Eswdata =3D val & 0x3f;
>>           break;
>> -    case 0x02:
>>       case 0x12:
>>           d->i=2Ebmdma[0]=2Estatus =3D (val & 0x60) | (d->i=2Ebmdma[0]=
=2Estatus & 1) |
>>                                  (d->i=2Ebmdma[0]=2Estatus & ~val & 6);
>>           break;
>> -    case 0x04 =2E=2E=2E 0x07:
>> -        bmdma_addr_ioport_ops=2Ewrite(&d->i=2Ebmdma[0], addr - 4, val,=
 size);
>> -        break;
>> -    case 0x08:
>>       case 0x18:
>>           bmdma_cmd_writeb(&d->i=2Ebmdma[1], val);
>>           break;
>> -    case 0x09:
>>       case 0x19:
>>           d->regs[1]=2Eswdata =3D val & 0x3f;
>>           break;
>> -    case 0x0a:
>>       case 0x1a:
>>           d->i=2Ebmdma[1]=2Estatus =3D (val & 0x60) | (d->i=2Ebmdma[1]=
=2Estatus & 1) |
>>                                  (d->i=2Ebmdma[1]=2Estatus & ~val & 6);
>>           break;
>> -    case 0x0c =2E=2E=2E 0x0f:
>> -        bmdma_addr_ioport_ops=2Ewrite(&d->i=2Ebmdma[1], addr - 12, val=
, size);
>> -        break;
>>       case 0x100:
>>           d->regs[0]=2Escontrol =3D val & 0xfff;
>>           if (val & 1) {
>> @@ -240,6 +254,9 @@ static void sii3112_pci_realize(PCIDevice *dev, Err=
or **errp)
>>       pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &s->data_ops[=
1]);
>>       pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &s->cmd_ops[1=
]);
>>   +    bmdma_init_ops(s, &sii3112_bmdma_ops);
>> +    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &s->bmdma_ops)=
;
>> +
>>       /* BAR5 is in PCI memory space */
>>       memory_region_init_io(&d->mmio, OBJECT(d), &sii3112_reg_ops, d,
>>                            "sii3112=2Ebar5", 0x200);
>> @@ -262,10 +279,10 @@ static void sii3112_pci_realize(PCIDevice *dev, E=
rror **errp)
>>       memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar3", &s->cmd=
_ops[1], 0,
>>                                memory_region_size(&s->cmd_ops[1]));
>>       memory_region_add_subregion_overlap(&d->mmio, 0xc8, mr, 1);
>> -
>>       mr =3D g_new(MemoryRegion, 1);
>> -    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar4", &d->mmio=
, 0, 16);
>> -    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, mr);
>> +    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar4", &s->bmdm=
a_ops, 0,
>> +                             memory_region_size(&s->bmdma_ops));
>> +    memory_region_add_subregion_overlap(&d->mmio, 0x0, mr, 1);
>>         qdev_init_gpio_in(ds, sii3112_set_irq, 2);
>>       for (i =3D 0; i < 2; i++) {
>> @@ -287,7 +304,6 @@ static void sii3112_pci_class_init(ObjectClass *kla=
ss, void *data)
>>       pd->class_id =3D PCI_CLASS_STORAGE_RAID;
>>       pd->revision =3D 1;
>>       pd->realize =3D sii3112_pci_realize;
>> -    pd->exit =3D NULL;
>>       dc->reset =3D sii3112_reset;
>>       dc->vmsd =3D NULL;
>>       dc->desc =3D "SiI3112A SATA controller";
>> diff --git a/hw/ide/trace-events b/hw/ide/trace-events
>> index 57042cafdd=2E=2Ea479525e38 100644
>> --- a/hw/ide/trace-events
>> +++ b/hw/ide/trace-events
>> @@ -38,8 +38,10 @@ bmdma_read(uint64_t addr, uint8_t val) "bmdma: readb=
 0x%"PRIx64" : 0x%02x"
>>   bmdma_write(uint64_t addr, uint64_t val) "bmdma: writeb 0x%"PRIx64" :=
 0x%02"PRIx64
>>     # sii3112=2Ec
>> -sii3112_read(int size, uint64_t addr, uint64_t val) "bmdma: read (size=
 %d) 0x%"PRIx64" : 0x%02"PRIx64
>> -sii3112_write(int size, uint64_t addr, uint64_t val) "bmdma: write (si=
ze %d) 0x%"PRIx64" : 0x%02"PRIx64
>> +sii3112_bmdma_read(int size, uint64_t addr, uint64_t val) "read (size =
%d) 0x%"PRIx64" : 0x%02"PRIx64
>> +sii3112_bmdma_write(int size, uint64_t addr, uint64_t val) "write (siz=
e %d) 0x%"PRIx64" : 0x%02"PRIx64
>> +sii3112_read(int size, uint64_t addr, uint64_t val) "read (size %d) 0x=
%"PRIx64" : 0x%02"PRIx64
>> +sii3112_write(int size, uint64_t addr, uint64_t val) "write (size %d) =
0x%"PRIx64" : 0x%02"PRIx64
>>   sii3112_set_irq(int channel, int level) "channel %d level %d"
>>     # via=2Ec
>
>Reviewed-by: Mark Cave-Ayland <mark=2Ecave-ayland@ilande=2Eco=2Euk>
>
>
>ATB,
>
>Mark=2E

