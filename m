Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE486EBAE6
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 20:49:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqIH8-0007C4-UY; Sat, 22 Apr 2023 14:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqIH6-0007BX-O9; Sat, 22 Apr 2023 14:47:56 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqIH3-0006Qh-Uh; Sat, 22 Apr 2023 14:47:55 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-957dbae98b4so142749266b.1; 
 Sat, 22 Apr 2023 11:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682189270; x=1684781270;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s+opdVN/gAOwRDj1QyeoNVZpRMG/mDTRk0LT01Lcwug=;
 b=Jk3NL6rUwNLlkvywcqP/mOKW/jF+iAUzoJ5nJ1OWtnMBfsnrZURErsJwtqUEQFYfr/
 HUSfBZSvPBkD2bSzxTvUS6fzatvgNiZtv8km8D2bY3HIr1c+6ZNbmqfKrHHCrWESPIrF
 Pgbqa3gnax/0Q6gx99TWIxZ4F2c1aSxUYqGLQBCN0I6S1D8IhBt/VsuxsJ3H6I4KAk8l
 P93gWZ0/o0HMLcQ2VbSs9NRvkyuYxOWVudb+74lEd3moJN9JtsCcaQnPDBkxvRPtc5Qh
 pXg18wc27GBGQsLaMvqAhyZOX0yssq9q3WPlKMZNHedLn8JU4kSHh/qGtf8uJz9xgEOF
 jqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682189270; x=1684781270;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s+opdVN/gAOwRDj1QyeoNVZpRMG/mDTRk0LT01Lcwug=;
 b=DJu4VPLA0wM/dkgz20eHGno4SSSS2dvS1499cns/8Hoe+HVCqQX1AdEs3ebrN+23lL
 ynhT18b6Qvw19Xztz6hJ/mb6/v51Z3AkkjHiKgvZWB+zQbhY0MjfwAX2EzEidhnhKOyc
 SMI6EqQK+mc0gQc5M84WawLXCrN7NvEN618qWXf4X5lwBaAzzO86ohN3NsnoBG1X15bC
 FgRA2K878XBVuzylauaz6ijtv8RPyyQD9C4Z3YuBdMIcxWYkptTe1uK2j+sidOo1wZqq
 cXrD3X49SCU3L8EgYkluJVBEtzSEuknm+UCUErKN5oUDlf5mxw1F68tAMi1C0IS1hL/0
 MCGw==
X-Gm-Message-State: AAQBX9di78G10WsFJTGLjsId5fzbQ9Yv3/vgvXvXWFMWg1H49SMo1BRV
 LqO4NmwZ6rChZXNnhWnRJf0=
X-Google-Smtp-Source: AKy350aW+Jz79arn+5kX6uOgqCFSEwn061ssTi+0pzBK4vzz5ceizTB7BtkitYePxYJxlneFX17LVA==
X-Received: by 2002:a17:906:783:b0:94f:1a11:e07d with SMTP id
 l3-20020a170906078300b0094f1a11e07dmr5030651ejc.32.1682189270048; 
 Sat, 22 Apr 2023 11:47:50 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-191-017-015.77.191.pool.telefonica.de.
 [77.191.17.15]) by smtp.gmail.com with ESMTPSA id
 vf1-20020a170907238100b0094f71c73d35sm3615324ejb.145.2023.04.22.11.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Apr 2023 11:47:49 -0700 (PDT)
Date: Sat, 22 Apr 2023 18:47:44 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 02/13] hw/ide/via: Implement ISA IRQ routing
In-Reply-To: <3b1d7a25-1600-872d-c0e8-b71ec49f551e@eik.bme.hu>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-3-shentey@gmail.com>
 <3b1d7a25-1600-872d-c0e8-b71ec49f551e@eik.bme.hu>
Message-ID: <8B29FA8F-B534-4CB5-8311-07AAAC782CD9@gmail.com>
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



Am 22=2E April 2023 17:23:56 UTC schrieb BALATON Zoltan <balaton@eik=2Ebme=
=2Ehu>:
>On Sat, 22 Apr 2023, Bernhard Beschow wrote:
>> The VIA south bridge allows the legacy IDE interrupts to be routed to f=
our
>> different ISA interrupts=2E This can be configured through the 0x4a reg=
ister in
>> the PCI configuration space of the ISA function=2E The default routing =
matches
>> the legacy ISA IRQs, that is 14 and 15=2E
>
>On VT8231 0x4a is PCI Master Arbitration Control, IDE interrupt Routing i=
s 0x4c and only documents 14/15 as valid values=2E

In the datasheet titled "VT8231 South Bridge", preliminary revision 0=2E8,=
 Oct=2E 29, 1999, page 60, the "IDE Interrupt Routing" register is located =
at offset 0x4a and offers the same four interrupts in the same order as in =
the code=2E Are we looking at the same datasheet?

>Not sure any guest would actually change this or 0x4a and if that could c=
ause problems but you may need to handle this somehow=2E (Apart from testin=
g with MorphOS with -kernel you should really be testing with pegasos2=2Ero=
m with MorphOS and Linux, e=2Eg=2E Debian 8=2E11 netinstall iso is known to=
 boot=2E)

I've tested extensively with an x86 Linux guest on my pc-via branch which =
worked flawlessly=2E

As mentioned in the commit message the default routing of the chipset matc=
hes legacy behavior, that is interrupts 14 and 15=2E This is reflected by a=
ssigning [0x4a] =3D 4 in the code and that is how the code behaved before=
=2E

Best regards,
Bernhard

>
>Regards,
>BALATON Zoltan
>
>> Implement this missing piece of the VIA south bridge=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>> hw/ide/via=2Ec      |  6 ++++--
>> hw/isa/vt82c686=2Ec | 17 +++++++++++++++++
>> 2 files changed, 21 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/hw/ide/via=2Ec b/hw/ide/via=2Ec
>> index 177baea9a7=2E=2E0caae52276 100644
>> --- a/hw/ide/via=2Ec
>> +++ b/hw/ide/via=2Ec
>> @@ -31,6 +31,7 @@
>> #include "sysemu/dma=2Eh"
>> #include "hw/isa/vt82c686=2Eh"
>> #include "hw/ide/pci=2Eh"
>> +#include "hw/irq=2Eh"
>> #include "trace=2Eh"
>>=20
>> static uint64_t bmdma_read(void *opaque, hwaddr addr,
>> @@ -104,7 +105,8 @@ static void bmdma_setup_bar(PCIIDEState *d)
>>=20
>> static void via_ide_set_irq(void *opaque, int n, int level)
>> {
>> -    PCIDevice *d =3D PCI_DEVICE(opaque);
>> +    PCIIDEState *s =3D opaque;
>> +    PCIDevice *d =3D PCI_DEVICE(s);
>>=20
>>     if (level) {
>>         d->config[0x70 + n * 8] |=3D 0x80;
>> @@ -112,7 +114,7 @@ static void via_ide_set_irq(void *opaque, int n, in=
t level)
>>         d->config[0x70 + n * 8] &=3D ~0x80;
>>     }
>>=20
>> -    via_isa_set_irq(pci_get_function_0(d), 14 + n, level);
>> +    qemu_set_irq(s->isa_irq[n], level);
>> }
>>=20
>> static void via_ide_reset(DeviceState *dev)
>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>> index ca89119ce0=2E=2Ec7e29bb46a 100644
>> --- a/hw/isa/vt82c686=2Ec
>> +++ b/hw/isa/vt82c686=2Ec
>> @@ -568,9 +568,19 @@ static const VMStateDescription vmstate_via =3D {
>>     }
>> };
>>=20
>> +static void via_isa_set_ide_irq(void *opaque, int n, int level)
>> +{
>> +    static const uint8_t irqs[] =3D { 14, 15, 10, 11 };
>> +    ViaISAState *s =3D opaque;
>> +    uint8_t irq =3D irqs[(s->dev=2Econfig[0x4a] >> (n * 2)) & 0x3];
>> +
>> +    qemu_set_irq(s->isa_irqs_in[irq], level);
>> +}
>> +
>> static void via_isa_init(Object *obj)
>> {
>>     ViaISAState *s =3D VIA_ISA(obj);
>> +    DeviceState *dev =3D DEVICE(s);
>>=20
>>     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
>>     object_initialize_child(obj, "ide", &s->ide, TYPE_VIA_IDE);
>> @@ -578,6 +588,8 @@ static void via_isa_init(Object *obj)
>>     object_initialize_child(obj, "uhci2", &s->uhci[1], TYPE_VT82C686B_U=
SB_UHCI);
>>     object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
>>     object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
>> +
>> +    qdev_init_gpio_in_named(dev, via_isa_set_ide_irq, "ide", ARRAY_SIZ=
E(s->ide=2Eisa_irq));
>> }
>>=20
>> static const TypeInfo via_isa_info =3D {
>> @@ -692,6 +704,10 @@ static void via_isa_realize(PCIDevice *d, Error **=
errp)
>>     if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
>>         return;
>>     }
>> +    for (i =3D 0; i < 2; i++) {
>> +        qdev_connect_gpio_out(DEVICE(&s->ide), i,
>> +                              qdev_get_gpio_in_named(DEVICE(s), "ide",=
 i));
>> +    }
>>=20
>>     /* Functions 2-3: USB Ports */
>>     for (i =3D 0; i < ARRAY_SIZE(s->uhci); i++) {
>> @@ -814,6 +830,7 @@ static void vt8231_isa_reset(DeviceState *dev)
>>                  PCI_COMMAND_MASTER | PCI_COMMAND_SPECIAL);
>>     pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_DEVSEL_MEDIUM);
>>=20
>> +    pci_conf[0x4a] =3D 0x04; /* IDE interrupt Routing */
>>     pci_conf[0x58] =3D 0x40; /* Miscellaneous Control 0 */
>>     pci_conf[0x67] =3D 0x08; /* Fast IR Config */
>>     pci_conf[0x6b] =3D 0x01; /* Fast IR I/O Base */
>>=20

