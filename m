Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD76F6EFA2B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 20:42:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prk5B-0001ZR-1l; Wed, 26 Apr 2023 14:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1prk57-0001YA-7O; Wed, 26 Apr 2023 14:41:33 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1prk54-0005c7-7C; Wed, 26 Apr 2023 14:41:32 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5050491cb04so11218099a12.0; 
 Wed, 26 Apr 2023 11:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682534480; x=1685126480;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UO7gRog1HnBctE98id/A8bXZ+DwbD/6Cg+Pg9SspSvs=;
 b=V3HjLKL4C69knrMQsTKhrJr8360JF+FPT1Lujq4IJCrIQ2T4g0Iboj43VfCdKedKXg
 QcpQ8WmP8xdFb7y9o2h+K7GeLt6eMA4rS+BDPo7TlZ6S+sbQWaTMCyVsUmVy5NoHZ1Ks
 7/ZxB5U1nrI4b9YRsBcLcewI3Xlgf9SrUXJ7GAAAiZZVHaTYama6KlJmVqCxTW2SiGLO
 oeSF3jK6avJMRnrMrF4/kuOVEyPiims1BwZgzJIBIToIsEXJ2GQC3yaD2BIHV/ynau6j
 lZh6vf2NKbR7Wqp94oNw0RiIHrrR1WXAdt4TK+yVeqQRGsf2BeqeHsVHlfjjAdU5hV1X
 7Jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682534480; x=1685126480;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UO7gRog1HnBctE98id/A8bXZ+DwbD/6Cg+Pg9SspSvs=;
 b=UWKp6NK+7yb9FOOCgxawANVHc53xCYruF05DzMLBI+2+c5zWeqkP+Up5trMK25romU
 LyOCvoGRP8V2KJ6/cJRdozZTtIGAPzANRrSD64nVC9IqdPFXIJb0ogInQszsdGtz6S7h
 XFGod4MheNMN7ivE8EcnfL1MFqa3+GLAm6zPToE49+RtQV/yePuQMnND+DDwccpHqrIy
 fKLER5hmn/1UXshMT2Kp5Z1N4rjt02UQ3flNvYvl716/SC8D4Ssj13Ss+j9BLZOGkd2+
 TSzIMXykykEQKmZP9TXh4ng/gSz3H0gpPHpuzqrCQdtbpe7CyroGyh+07d2uy0aCjObk
 YE4w==
X-Gm-Message-State: AAQBX9eCfJDz5o1KAR/E6mljWkOIoTB4mg64bly7AwyjILIwrUE0ZxuM
 PcB8LbilKBey4I1/vs8xH8m8H2VD9wU=
X-Google-Smtp-Source: AKy350afIuRgFZCtQ2TOj9RdPbUor+DqX1iHwer5Pf5xk+k3b/gx9gOuQxKOLTANZAGaUnjtAOojOg==
X-Received: by 2002:aa7:c592:0:b0:506:c288:118 with SMTP id
 g18-20020aa7c592000000b00506c2880118mr18903656edq.39.1682534479772; 
 Wed, 26 Apr 2023 11:41:19 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-234-209.77.13.pool.telefonica.de.
 [77.13.234.209]) by smtp.gmail.com with ESMTPSA id
 c26-20020a056402121a00b0050673b13b58sm7025867edw.56.2023.04.26.11.41.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 11:41:19 -0700 (PDT)
Date: Wed, 26 Apr 2023 18:25:36 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 09/13] hw/ide/piix: Disuse isa_get_irq()
In-Reply-To: <32b3425c-737f-4889-9c87-67cd852032f6@ilande.co.uk>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-10-shentey@gmail.com>
 <32b3425c-737f-4889-9c87-67cd852032f6@ilande.co.uk>
Message-ID: <8C48868C-4791-4B96-9C56-D4B4A63492F2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
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



Am 26=2E April 2023 11:33:40 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayl=
and@ilande=2Eco=2Euk>:
>On 22/04/2023 16:07, Bernhard Beschow wrote:
>
>> isa_get_irq() asks for an ISADevice which piix-ide doesn't provide=2E
>> Passing a NULL pointer works but causes the isabus global to be used
>> then=2E By fishing out TYPE_ISA_BUS from the QOM tree it is possible to
>> achieve the same as using isa_get_irq()=2E
>>=20
>> This is an alternative solution to commit 9405d87be25d 'hw/ide: Fix
>> crash when plugging a piix3-ide device into the x-remote machine' which
>> allows for cleaning up the ISA API while keeping PIIX IDE functions
>> user-createable=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/ide/piix=2Ec | 23 ++++++++++++++++++++---
>>   1 file changed, 20 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>> index 6942b484f9=2E=2Ea3a15dc7db 100644
>> --- a/hw/ide/piix=2Ec
>> +++ b/hw/ide/piix=2Ec
>> @@ -104,7 +104,8 @@ static void piix_ide_reset(DeviceState *dev)
>>       pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
>>   }
>>   -static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **er=
rp)
>> +static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus *isa_=
bus,
>> +                              Error **errp)
>>   {
>>       static const struct {
>>           int iobase;
>> @@ -124,7 +125,8 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsig=
ned i, Error **errp)
>>                            object_get_typename(OBJECT(d)), i);
>>           return false;
>>       }
>> -    ide_bus_init_output_irq(&d->bus[i], isa_get_irq(NULL, port_info[i]=
=2Eisairq));
>> +    ide_bus_init_output_irq(&d->bus[i],
>> +                            isa_bus_get_irq(isa_bus, port_info[i]=2Eis=
airq));
>
>I don't think is the right solution here, since ultimately we want to mov=
e the IRQ routing out of the device itself and into the PCI-ISA bridge=2E I=
'd go for the same solution as you've done for VIA IDE in patch 2, i=2Ee=2E=
 update the PIIX interrupt handler to set the legacy_irqs in PCIIDEState, a=
nd then wire them up to the ISA IRQs 14 and 15 similar to as Phil as done i=
n his patches:

The problem is user-creatable PIIX-IDE=2E IMO we should stick to our depre=
cation process before going this step because this will break it=2E

>
>https://patchew=2Eorg/QEMU/20230302224058=2E43315-1-philmd@linaro=2Eorg/2=
0230302224058=2E43315-4-philmd@linaro=2Eorg/
>
>https://patchew=2Eorg/QEMU/20230302224058=2E43315-1-philmd@linaro=2Eorg/2=
0230302224058=2E43315-5-philmd@linaro=2Eorg/
>
>This also reminds me, given that the first patch above is doing wiring in=
 pc_init1() then we are still missing part of your tidy-up series :/
>
>>       bmdma_init(&d->bus[i], &d->bmdma[i], d);
>>       ide_bus_register_restart_cb(&d->bus[i]);
>> @@ -136,14 +138,29 @@ static void pci_piix_ide_realize(PCIDevice *dev, =
Error **errp)
>>   {
>>       PCIIDEState *d =3D PCI_IDE(dev);
>>       uint8_t *pci_conf =3D dev->config;
>> +    ISABus *isa_bus;
>> +    bool ambiguous;
>>         pci_conf[PCI_CLASS_PROG] =3D 0x80; // legacy ATA mode
>>         bmdma_init_ops(d, &piix_bmdma_ops);
>>       pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_ops=
);
>>   +    isa_bus =3D ISA_BUS(object_resolve_path_type("", TYPE_ISA_BUS, &=
ambiguous));
>> +    if (ambiguous) {
>> +        error_setg(errp,
>> +                   "More than one ISA bus found while %s supports only=
 one",
>> +                   object_get_typename(OBJECT(d)));
>> +        return;
>> +    }
>> +    if (!isa_bus) {
>> +        error_setg(errp, "No ISA bus found while %s requires one",
>> +                   object_get_typename(OBJECT(d)));
>> +        return;
>> +    }
>
>Again I think this should go away with using PCIIDEState's legacy_irqs, s=
ince you simply let the board wire them up to the ISABus (or not) as requir=
ed=2E

Same here: This breaks user-creatable PIIX-IDE=2E

>
>>       for (unsigned i =3D 0; i < 2; i++) {
>> -        if (!pci_piix_init_bus(d, i, errp)) {
>> +        if (!pci_piix_init_bus(d, i, isa_bus, errp)) {
>>               return;
>>           }
>>       }
>
>
>ATB,
>
>Mark=2E

