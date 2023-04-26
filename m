Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C85C6EFB9E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 22:26:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prlhF-0008PT-Bi; Wed, 26 Apr 2023 16:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1prlhD-0008P6-Jv; Wed, 26 Apr 2023 16:24:59 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1prlhB-0007Pn-H7; Wed, 26 Apr 2023 16:24:59 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50847469a7fso11088813a12.0; 
 Wed, 26 Apr 2023 13:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682540694; x=1685132694;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w+qiEKa+gLFtuI7hs2weA/t7k8eutTEx35e+iSozLsQ=;
 b=C+uQgvzULc3+yilSRUm0mBjXzvyWk+RYGLkA+RYWTEmnMz+WFEohUUdPmhkh1LvUrU
 eVrt0651Kg6KFzUTQWHrKWKkPUl350YBwG48tl/+T1NZtsFM/TVYLGuktJAXHDi+bOeG
 r8zJcVam6xwKjAbnqBLG6KMdqoYvUu33a7/7A9MLRMw09OMlOlkecY6zXfdrFJQmfVay
 uZYKPRBpUcOyS4V6Tg0i//m0cmwzfRpCEA5EEOwbN2pIXAXP8kTH1mDwLZw1gcsp7tCg
 hBtwAp8Oi9vww4k8MFSGSG0dP69qVw/ngONg4ROQVhTtuQ+uBeFAs5OnZJvpgNHsFxrr
 tMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682540694; x=1685132694;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w+qiEKa+gLFtuI7hs2weA/t7k8eutTEx35e+iSozLsQ=;
 b=a/TWgzACdsrAOEx850qIbQx8fi6cEjewGxDk3deheslmROzFBl/eZ7Guv/huRkz3u/
 m3EIB0uq8S0GctvYZ2yBiy17rKMqrC6h00BDoHcM1pjjb6ly/RLjI9OdoVuRjR9qJkh1
 wSsDrbfZXWNndZ8vowfJIvnxXP+jhxi9NELNjPP3L8Zpnz69nPxbUdRHl25toOyNgvZ7
 lMWhbq2OrPffp7It1/qKeruiL5JcAloP12httNw+ezsEKveoaNQiOGKqKyxpnAxLEUIT
 6gNpYMY1yLbTBuEq0eBT6RaQBsjKupZQX6VTKMx1h9eDCzGfWhij1wwJjcGgHGVo+9hv
 gF/A==
X-Gm-Message-State: AAQBX9ca3tO6nYLhak/DvgjOp0k0lf4J6WGsJnmryaSh6m/tKHXjt16o
 YjFUTH0WiQ81j4/+9QDIEh8=
X-Google-Smtp-Source: AKy350YSeLPgn12zZfUXNIS+KGfhIhe9Pth3ZOO0p0qjbJMNwc0uvb6QgUWv3fOPZ4l7jwddv8vOtA==
X-Received: by 2002:a05:6402:5170:b0:504:b323:fdf1 with SMTP id
 d16-20020a056402517000b00504b323fdf1mr18763003ede.21.1682540694098; 
 Wed, 26 Apr 2023 13:24:54 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-234-209.77.13.pool.telefonica.de.
 [77.13.234.209]) by smtp.gmail.com with ESMTPSA id
 e14-20020a170906504e00b0094a90d3e385sm8552853ejk.30.2023.04.26.13.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 13:24:53 -0700 (PDT)
Date: Wed, 26 Apr 2023 20:24:47 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 11/13] hw/ide/sii3112: Reuse PCIIDEState::{cmd,data}_ops
In-Reply-To: <b4b8c651-3874-a919-1221-d09b3842e3c8@ilande.co.uk>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-12-shentey@gmail.com>
 <b4b8c651-3874-a919-1221-d09b3842e3c8@ilande.co.uk>
Message-ID: <2BE97CCD-7EB4-4F02-B504-194C7B40A900@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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

Am 26=2E April 2023 11:41:54 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayla=
nd@ilande=2Eco=2Euk>:
>On 22/04/2023 16:07, Bernhard Beschow wrote:
>
>> Allows to unexport pci_ide_{cmd,data}_le_ops and models TYPE_SII3112_PC=
I as a
>> standard-compliant PCI IDE device=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   include/hw/ide/pci=2Eh |  2 --
>>   hw/ide/pci=2Ec         |  4 ++--
>>   hw/ide/sii3112=2Ec     | 50 ++++++++++++++++-------------------------=
---
>>   3 files changed, 20 insertions(+), 36 deletions(-)
>>=20
>> diff --git a/include/hw/ide/pci=2Eh b/include/hw/ide/pci=2Eh
>> index 5025df5b82=2E=2Edbb4b13161 100644
>> --- a/include/hw/ide/pci=2Eh
>> +++ b/include/hw/ide/pci=2Eh
>> @@ -62,6 +62,4 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
>>   extern MemoryRegionOps bmdma_addr_ioport_ops;
>>   void pci_ide_create_devs(PCIDevice *dev);
>>   -extern const MemoryRegionOps pci_ide_cmd_le_ops;
>> -extern const MemoryRegionOps pci_ide_data_le_ops;
>>   #endif
>> diff --git a/hw/ide/pci=2Ec b/hw/ide/pci=2Ec
>> index b2fcc00a64=2E=2E97ccc75aa6 100644
>> --- a/hw/ide/pci=2Ec
>> +++ b/hw/ide/pci=2Ec
>> @@ -60,7 +60,7 @@ static void pci_ide_ctrl_write(void *opaque, hwaddr a=
ddr,
>>       ide_ctrl_write(bus, addr + 2, data);
>>   }
>>   -const MemoryRegionOps pci_ide_cmd_le_ops =3D {
>> +static const MemoryRegionOps pci_ide_cmd_le_ops =3D {
>>       =2Eread =3D pci_ide_status_read,
>>       =2Ewrite =3D pci_ide_ctrl_write,
>>       =2Eendianness =3D DEVICE_LITTLE_ENDIAN,
>> @@ -98,7 +98,7 @@ static void pci_ide_data_write(void *opaque, hwaddr a=
ddr,
>>       }
>>   }
>>   -const MemoryRegionOps pci_ide_data_le_ops =3D {
>> +static const MemoryRegionOps pci_ide_data_le_ops =3D {
>>       =2Eread =3D pci_ide_data_read,
>>       =2Ewrite =3D pci_ide_data_write,
>>       =2Eendianness =3D DEVICE_LITTLE_ENDIAN,
>> diff --git a/hw/ide/sii3112=2Ec b/hw/ide/sii3112=2Ec
>> index 0af897a9ef=2E=2E9cf920369f 100644
>> --- a/hw/ide/sii3112=2Ec
>> +++ b/hw/ide/sii3112=2Ec
>> @@ -88,21 +88,9 @@ static uint64_t sii3112_reg_read(void *opaque, hwadd=
r addr,
>>           val |=3D (d->regs[1]=2Econfstat & (1UL << 11) ? (1 << 4) : 0)=
;
>>           val |=3D (uint32_t)d->i=2Ebmdma[1]=2Estatus << 16;
>>           break;
>> -    case 0x80 =2E=2E=2E 0x87:
>> -        val =3D pci_ide_data_le_ops=2Eread(&d->i=2Ebus[0], addr - 0x80=
, size);
>> -        break;
>> -    case 0x8a:
>> -        val =3D pci_ide_cmd_le_ops=2Eread(&d->i=2Ebus[0], 2, size);
>> -        break;
>>       case 0xa0:
>>           val =3D d->regs[0]=2Econfstat;
>>           break;
>> -    case 0xc0 =2E=2E=2E 0xc7:
>> -        val =3D pci_ide_data_le_ops=2Eread(&d->i=2Ebus[1], addr - 0xc0=
, size);
>> -        break;
>> -    case 0xca:
>> -        val =3D pci_ide_cmd_le_ops=2Eread(&d->i=2Ebus[1], 2, size);
>> -        break;
>>       case 0xe0:
>>           val =3D d->regs[1]=2Econfstat;
>>           break;
>> @@ -171,18 +159,6 @@ static void sii3112_reg_write(void *opaque, hwaddr=
 addr,
>>       case 0x0c =2E=2E=2E 0x0f:
>>           bmdma_addr_ioport_ops=2Ewrite(&d->i=2Ebmdma[1], addr - 12, va=
l, size);
>>           break;
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
>>       case 0x100:
>>           d->regs[0]=2Escontrol =3D val & 0xfff;
>>           if (val & 1) {
>> @@ -259,6 +235,11 @@ static void sii3112_pci_realize(PCIDevice *dev, Er=
ror **errp)
>>       pci_config_set_interrupt_pin(dev->config, 1);
>>       pci_set_byte(dev->config + PCI_CACHE_LINE_SIZE, 8);
>>   +    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->data_ops=
[0]);
>> +    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &s->cmd_ops[0]=
);
>> +    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &s->data_ops[1=
]);
>> +    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &s->cmd_ops[1]=
);
>> +
>>       /* BAR5 is in PCI memory space */
>>       memory_region_init_io(&d->mmio, OBJECT(d), &sii3112_reg_ops, d,
>>                            "sii3112=2Ebar5", 0x200);
>> @@ -266,17 +247,22 @@ static void sii3112_pci_realize(PCIDevice *dev, E=
rror **errp)
>>         /* BAR0-BAR4 are PCI I/O space aliases into BAR5 */
>>       mr =3D g_new(MemoryRegion, 1);
>> -    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar0", &d->mmio=
, 0x80, 8);
>> -    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, mr);
>> +    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar0", &s->data=
_ops[0], 0,
>> +                             memory_region_size(&s->data_ops[0]));
>> +    memory_region_add_subregion_overlap(&d->mmio, 0x80, mr, 1);
>>       mr =3D g_new(MemoryRegion, 1);
>> -    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar1", &d->mmio=
, 0x88, 4);
>> -    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, mr);
>> +    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar1", &s->cmd_=
ops[0], 0,
>> +                             memory_region_size(&s->cmd_ops[0]));
>> +    memory_region_add_subregion_overlap(&d->mmio, 0x88, mr, 1);
>>       mr =3D g_new(MemoryRegion, 1);
>> -    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar2", &d->mmio=
, 0xc0, 8);
>> -    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, mr);
>> +    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar2", &s->data=
_ops[1], 0,
>> +                             memory_region_size(&s->data_ops[1]));
>> +    memory_region_add_subregion_overlap(&d->mmio, 0xc0, mr, 1);
>>       mr =3D g_new(MemoryRegion, 1);
>> -    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar3", &d->mmio=
, 0xc8, 4);
>> -    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, mr);
>> +    memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar3", &s->cmd_=
ops[1], 0,
>> +                             memory_region_size(&s->cmd_ops[1]));
>> +    memory_region_add_subregion_overlap(&d->mmio, 0xc8, mr, 1);
>> +
>>       mr =3D g_new(MemoryRegion, 1);
>>       memory_region_init_alias(mr, OBJECT(d), "sii3112=2Ebar4", &d->mmi=
o, 0, 16);
>>       pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, mr);
>
>So if I read this right, this is now switching the aliases over on BAR5 t=
o allow re-use of the common IDE/BMDMA BARs in PCIIDEState? If that's corre=
ct then I think the commit message needs a bit more detail, otherwise:

That's correct=2E Besides improving the commit message I'll additonally sp=
lit this patch into two to show what's going on=2E

Furthermore, I'd init the memory regions in sii3112's init method rather t=
han in realize()=2E This will be more consistent with the other PCI IDE dev=
ice models and with the other memory regions=2E

Best regards,
Bernhard

>
>Reviewed-by: Mark Cave-Ayland <mark=2Ecave-ayland@ilande=2Eco=2Euk>
>
>
>ATB,
>
>Mark=2E

