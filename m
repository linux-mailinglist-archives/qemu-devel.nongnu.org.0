Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E3C6EBA4C
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 18:25:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqG1v-0003MA-Sj; Sat, 22 Apr 2023 12:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqG1u-0003Ld-0r; Sat, 22 Apr 2023 12:24:06 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqG1r-00083t-Pk; Sat, 22 Apr 2023 12:24:05 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5069097bac7so4871266a12.0; 
 Sat, 22 Apr 2023 09:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682180641; x=1684772641;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ywtZTeDh9/hf2Jmgh2VjNwiHPgwV84bdRQmxOiwr1Q=;
 b=phjTLEvhAIKVzZ5qdtQA/xEpE3tgGe/Pu2FIhlGVNgIUpjh4mbPlooeGDb9IbQzVdE
 fficCXJoan+bdB0XgNg3wU8RDToCYnEWHw3blBuGkSyR6KykrlTMxkdTvt632pktE+14
 IwuSNWHoFWARhWFXpytIpnISgymZX5hsdMKUcKPFoCTMO63zAd1KzpiR1blTvQHUxiBp
 RXQZ8Au353rYMhWXt2EXVggQSyacCJemT+2VqvRI6GCbCLVp9/Mb84q+B7vaFsnbFfau
 eiIx/lhkgW1xMdbsk4odahBdTKuUU5yzJGtWsABT+P4jSQVYIdZZJFiBO/xjfjE6TmXn
 2pYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682180641; x=1684772641;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ywtZTeDh9/hf2Jmgh2VjNwiHPgwV84bdRQmxOiwr1Q=;
 b=KK2KGPL+q92jYz8UhEyLwvKOHm5oXacORcqZ1iiROnZmR+ftKz/WX6F/+BHqZFALz8
 zGuEjVOdouUQBz5RGiBD88r69CoB85QcZ5Uddtz7xyzAMhLlamP1yXSZ5JqcFwMJr6KW
 ULxIBFF4o5m07Y0YJulCCSLiNpSfAG0fiK5dR7ZKlSTg1qL/vuMfr1rkPnPKbGfc+3Nl
 7Tr6OxJJY4hNDWRqle+bmqTmVssipwBLKxSXkniNXfqO+u1dDdd/7VBpSLbCyD4Y9Yt7
 eguT1qqV3TPM6/ah6vMpS5IPWn6XHVgRzhM5W77Ll6HcLoooExIytWuQbmRSvhoXS1+n
 kmtg==
X-Gm-Message-State: AAQBX9f7CyfWVsXhK7FCOiKf3Fb8UTyVcxMUfWPZxUSV1xUF8kO+grw/
 b41REMX7PRJ6CVXLDn+92XQ=
X-Google-Smtp-Source: AKy350YMsxHqyf4E+vXjAZg4l+9awecMGV5WZ8Lz3k15rHkfJa2f+IBVCZJnvyOzA8PTZOTy2f63+Q==
X-Received: by 2002:a17:906:3b56:b0:94f:cc7:fd7f with SMTP id
 h22-20020a1709063b5600b0094f0cc7fd7fmr5483508ejf.65.1682180641078; 
 Sat, 22 Apr 2023 09:24:01 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-191-017-015.77.191.pool.telefonica.de.
 [77.191.17.15]) by smtp.gmail.com with ESMTPSA id
 qw11-20020a170906fcab00b0094e4eabb402sm3374790ejb.128.2023.04.22.09.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Apr 2023 09:24:00 -0700 (PDT)
Date: Sat, 22 Apr 2023 16:23:56 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 20210518215545.1793947-10-philmd@redhat.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_08/10=5D_hw/i?=
 =?US-ASCII?Q?de=3A_Let_ide=5Finit=5Fioport=28=29?=
 =?US-ASCII?Q?_take_a_MemoryRegion_argument_instead_of_ISADevice?=
In-Reply-To: <8c433dc2-80d2-c01b-0b01-cd5e2749e60b@ilande.co.uk>
References: <20230126211740.66874-1-shentey@gmail.com>
 <20230126211740.66874-9-shentey@gmail.com>
 <8c433dc2-80d2-c01b-0b01-cd5e2749e60b@ilande.co.uk>
Message-ID: <9CC04CD4-EF9D-4DB2-AE43-ABCB4F46DDE9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
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



Am 5=2E Februar 2023 22:02:02 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ay=
land@ilande=2Eco=2Euk>:
>On 26/01/2023 21:17, Bernhard Beschow wrote:
>
>> Both callers to ide_init_ioport() have access to the I/O memory region
>> of the ISA bus, so can pass it directly=2E This allows ide_init_ioport(=
)
>> to directly call portio_list_init()=2E
>>=20
>> Note, now the callers become the owner of the PortioList=2E
>>=20
>> Inspired-by: <20210518215545=2E1793947-10-philmd@redhat=2Ecom>
>>    'hw/ide: Let ide_init_ioport() take an ISA bus argument instead of d=
evice'
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   include/hw/ide/internal=2Eh |  3 ++-
>>   hw/ide/ioport=2Ec           | 15 ++++++++-------
>>   hw/ide/isa=2Ec              |  4 +++-
>>   hw/ide/piix=2Ec             |  8 ++++++--
>>   4 files changed, 19 insertions(+), 11 deletions(-)
>>=20
>> diff --git a/include/hw/ide/internal=2Eh b/include/hw/ide/internal=2Eh
>> index 42c49414f4=2E=2Ec3e4d192fa 100644
>> --- a/include/hw/ide/internal=2Eh
>> +++ b/include/hw/ide/internal=2Eh
>> @@ -628,7 +628,8 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, =
IDEDriveKind kind,
>>                      int chs_trans, Error **errp);
>>   void ide_init2(IDEBus *bus, qemu_irq irq);
>>   void ide_exit(IDEState *s);
>> -void ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int ioba=
se2);
>> +void ide_init_ioport(IDEBus *bus, MemoryRegion *address_space_io, Obje=
ct *owner,
>> +                     int iobase, int iobase2);
>>   void ide_register_restart_cb(IDEBus *bus);
>>     void ide_exec_cmd(IDEBus *bus, uint32_t val);
>> diff --git a/hw/ide/ioport=2Ec b/hw/ide/ioport=2Ec
>> index b613ff3bba=2E=2E00e9baf0d1 100644
>> --- a/hw/ide/ioport=2Ec
>> +++ b/hw/ide/ioport=2Ec
>> @@ -50,15 +50,16 @@ static const MemoryRegionPortio ide_portio2_list[] =
=3D {
>>       PORTIO_END_OF_LIST(),
>>   };
>>   -void ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int io=
base2)
>> +void ide_init_ioport(IDEBus *bus, MemoryRegion *address_space_io, Obje=
ct *owner,
>> +                     int iobase, int iobase2)
>>   {
>> -    /* ??? Assume only ISA and PCI configurations, and that the PCI-IS=
A
>> -       bridge has been setup properly to always register with ISA=2E  =
*/
>> -    isa_register_portio_list(dev, &bus->portio_list,
>> -                             iobase, ide_portio_list, bus, "ide");
>> +    assert(address_space_io);
>> +
>> +    portio_list_init(&bus->portio_list, owner, ide_portio_list, bus, "=
ide",
>> +                     address_space_io, iobase);
>>         if (iobase2) {
>> -        isa_register_portio_list(dev, &bus->portio2_list,
>> -                                 iobase2, ide_portio2_list, bus, "ide"=
);
>> +        portio_list_init(&bus->portio2_list, owner, ide_portio2_list, =
bus,
>> +                         "ide", address_space_io, iobase2);
>>       }
>>   }
>> diff --git a/hw/ide/isa=2Ec b/hw/ide/isa=2Ec
>> index 8bedbd13f1=2E=2Ecab5d0a07a 100644
>> --- a/hw/ide/isa=2Ec
>> +++ b/hw/ide/isa=2Ec
>> @@ -72,9 +72,11 @@ static void isa_ide_realizefn(DeviceState *dev, Erro=
r **errp)
>>   {
>>       ISADevice *isadev =3D ISA_DEVICE(dev);
>>       ISAIDEState *s =3D ISA_IDE(dev);
>> +    ISABus *isabus =3D isa_bus_from_device(isadev);
>>         ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
>> -    ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
>> +    ide_init_ioport(&s->bus, isabus->address_space_io, OBJECT(dev),
>> +                    s->iobase, s->iobase2);
>>       s->irq =3D isa_get_irq(isadev, s->isairq);
>>       ide_init2(&s->bus, s->irq);
>>       vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
>> diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>> index f0d95761ac=2E=2E236b5b7416 100644
>> --- a/hw/ide/piix=2Ec
>> +++ b/hw/ide/piix=2Ec
>> @@ -29,6 +29,7 @@
>>     #include "qemu/osdep=2Eh"
>>   #include "hw/pci/pci=2Eh"
>> +#include "hw/pci/pci_bus=2Eh"
>>   #include "migration/vmstate=2Eh"
>>   #include "qapi/error=2Eh"
>>   #include "qemu/module=2Eh"
>> @@ -143,8 +144,11 @@ static void pci_piix_init_ports(PCIIDEState *d, IS=
ABus *isa_bus)
>>           {0x1f0, 0x3f6, 14},
>>           {0x170, 0x376, 15},
>>       };
>> +    PCIBus *pci_bus =3D pci_get_bus(&d->parent_obj);
>>       int i;
>>   +    assert(pci_bus);
>> +
>>       if (isa_bus) {
>>           d->isa_irqs[0] =3D isa_bus->irqs[port_info[0]=2Eisairq];
>>           d->isa_irqs[1] =3D isa_bus->irqs[port_info[1]=2Eisairq];
>> @@ -154,8 +158,8 @@ static void pci_piix_init_ports(PCIIDEState *d, ISA=
Bus *isa_bus)
>>         for (i =3D 0; i < 2; i++) {
>>           ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
>> -        ide_init_ioport(&d->bus[i], NULL, port_info[i]=2Eiobase,
>> -                        port_info[i]=2Eiobase2);
>> +        ide_init_ioport(&d->bus[i], pci_bus->address_space_io, OBJECT(=
d),
>> +                        port_info[i]=2Eiobase, port_info[i]=2Eiobase2)=
;
>>           ide_init2(&d->bus[i], qdev_get_gpio_in(DEVICE(d), i));
>>             bmdma_init(&d->bus[i], &d->bmdma[i], d);
>
>Again, given that I suspect ioports are specific to x86 I'd be inclined t=
o leave this as a reference to ISA=2E I could see there being a function th=
at exists such as isa_get_address_space_io(ISADevice *isa) in the same way =
as pci_address_space_io(), for example=2E

Hi Mark,

I've just posted a series resolving the same problem in a different way=2E

For some reason I thought you were the maintainer of cmd646=2E So I was su=
rprised not to see you in the recipients list there=2E=2E=2E

Best regards,
Bernhard

>
>
>ATB,
>
>Mark=2E

