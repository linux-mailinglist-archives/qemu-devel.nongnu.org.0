Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D146A3C5A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:23:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWYdP-0005sp-AY; Mon, 27 Feb 2023 03:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWYdL-0005fy-R7; Mon, 27 Feb 2023 03:13:20 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWYdJ-00064U-Jm; Mon, 27 Feb 2023 03:13:19 -0500
Received: by mail-ed1-x530.google.com with SMTP id ec43so22126358edb.8;
 Mon, 27 Feb 2023 00:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RPl6tF4+woy+nEtUHCd+mylyFPId0w3r5kPgwE9BRGk=;
 b=oU518uR94ak7xzZWdpWtpH4hoWI49vJg9xHDeJIqF/rDPVjNRNfW/SzUtk0vOdA46j
 1pMII5leFKRRq/x8G4wvczKWe8Xr3TGB8xUyx9xl6+AXOkG1jjivTr2T6RchW0NH3Y8n
 bavUzwNvWYOULfzV4E0LNOmhHgeaMCskCKqKC5dewdAphzeqGiM3MyssgzLTidsMjaMJ
 8FqUZX3ArYOMRlhQN1v5y085e6f+t0SDrc9Y+Z9yjo6ZPCssw0muKQjKB89MgOIzu6IW
 EzGnefuougsCx/2q9dVRZMXnG4QYQWIWTdT9YaucOS6o6wONs+pB2Fbc1bI+RkkIK3eu
 HKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RPl6tF4+woy+nEtUHCd+mylyFPId0w3r5kPgwE9BRGk=;
 b=ObjirGaLUBnukxzb6pJyAy87eyb06ChB1wybz12KV0cZ0VPNVngYIfl5ejVdLxpMtB
 sBckmdomAA3I43cbU94knEgDsRdHxJHFFNHB23EIk04Ze+b4FJusgnbQV4vJMcSy59uQ
 8equHxEPsi5N8/TsBgcLBbaJqgY1hstXeUQP1CgbH55SJ4nT8Mb4bdeGNGPpjpygzUQl
 xJFmMP3n/0A1GabQAKM6psAHXSgjlotIp6Hzz+POwtBWiuckWeXztrbV1Gtjm6e9j/Q6
 yAfhE24f39Ube9KYIKmT/s5tv1gllN0JjW7ki6BQOkC/gr/8HeDuvb5po4uPDfpGDYH7
 Is8g==
X-Gm-Message-State: AO0yUKXMq4Xf8px3QU0fuYtp8opiUc3K+5sFWCMpffuLSo6qsyM9symZ
 XPR4OHVTJ2+pTvivEk3+wVA=
X-Google-Smtp-Source: AK7set+PawkXVq7lh5mv2/PBK2wM8DhcKp26Pj9bB2Zi4DWuKN8lQRNSvqNuVBZdBQOBq1Qf9YGJTg==
X-Received: by 2002:a17:906:ad82:b0:8af:40b0:3dd1 with SMTP id
 la2-20020a170906ad8200b008af40b03dd1mr33701391ejb.27.1677485594898; 
 Mon, 27 Feb 2023 00:13:14 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-154-008.78.55.pool.telefonica.de.
 [78.55.154.8]) by smtp.gmail.com with ESMTPSA id
 z27-20020a50cd1b000000b004af516b5010sm2761734edi.94.2023.02.27.00.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 00:13:14 -0800 (PST)
Date: Mon, 27 Feb 2023 08:13:08 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, ReneEngel80@emailn.de
Subject: Re: [PATCH v3 4/8] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <04111f8e-e24d-2a61-d359-f20f8cd4634e@eik.bme.hu>
References: <cover.1677445307.git.balaton@eik.bme.hu>
 <0fd9eac9174a840054c511fbc015048929c7bc40.1677445307.git.balaton@eik.bme.hu>
 <F86A8AF3-8D69-497A-ADD1-688D2B4FED03@gmail.com>
 <04111f8e-e24d-2a61-d359-f20f8cd4634e@eik.bme.hu>
Message-ID: <877517F9-2205-413F-A408-72D36B5142EB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 26=2E Februar 2023 23:33:20 UTC schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Sun, 26 Feb 2023, Bernhard Beschow wrote:
>> Am 25=2E Februar 2023 18:11:49 UTC schrieb BALATON Zoltan <balaton@eik=
=2Ebme=2Ehu>:
>>> From: Bernhard Beschow <shentey@gmail=2Ecom>
>>>=20
>>> The real VIA south bridges implement a PCI IRQ router which is configu=
red
>>> by the BIOS or the OS=2E In order to respect these configurations, QEM=
U
>>> needs to implement it as well=2E
>>>=20
>>> Note: The implementation was taken from piix4_set_irq() in hw/isa/piix=
4=2E
>>>=20
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> [balaton: declare gpio inputs instead of changing pci bus irqs so it c=
an
>>> be connected in board code; remove some empty lines]
>>> Signed-off-by: BALATON Zoltan <balaton@eik=2Ebme=2Ehu>
>>> Tested-by: Rene Engel <ReneEngel80@emailn=2Ede>
>>> ---
>>> hw/isa/vt82c686=2Ec | 39 +++++++++++++++++++++++++++++++++++++++
>>> 1 file changed, 39 insertions(+)
>>>=20
>>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>>> index 3f9bd0c04d=2E=2E4025f9bcdc 100644
>>> --- a/hw/isa/vt82c686=2Ec
>>> +++ b/hw/isa/vt82c686=2Ec
>>> @@ -604,6 +604,44 @@ static void via_isa_request_i8259_irq(void *opaqu=
e, int irq, int level)
>>>     qemu_set_irq(s->cpu_intr, level);
>>> }
>>>=20
>>> +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
>>> +{
>>> +    switch (irq_num) {
>>> +    case 0:
>>> +        return s->dev=2Econfig[0x55] >> 4;
>>> +    case 1:
>>> +        return s->dev=2Econfig[0x56] & 0xf;
>>> +    case 2:
>>> +        return s->dev=2Econfig[0x56] >> 4;
>>> +    case 3:
>>> +        return s->dev=2Econfig[0x57] >> 4;
>>> +    }
>>> +    return 0;
>>> +}
>>> +
>>> +static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
>>> +{
>>> +    ViaISAState *s =3D opaque;
>>> +    PCIBus *bus =3D pci_get_bus(&s->dev);
>>> +    int pic_irq;
>>> +
>>> +    /* now we change the pic irq level according to the via irq mappi=
ngs */
>>> +    /* XXX: optimize */
>>> +    pic_irq =3D via_isa_get_pci_irq(s, irq_num);
>>> +    if (pic_irq < ISA_NUM_IRQS) {
>>> +        int i, pic_level;
>>> +
>>> +        /* The pic level is the logical OR of all the PCI irqs mapped=
 to it=2E */
>>> +        pic_level =3D 0;
>>> +        for (i =3D 0; i < PCI_NUM_PINS; i++) {
>>> +            if (pic_irq =3D=3D via_isa_get_pci_irq(s, i)) {
>>> +                pic_level |=3D pci_bus_get_irq_level(bus, i);
>>> +            }
>>> +        }
>>> +        qemu_set_irq(s->isa_irqs[pic_irq], pic_level);
>>> +    }
>>> +}
>>> +
>>> static void via_isa_realize(PCIDevice *d, Error **errp)
>>> {
>>>     ViaISAState *s =3D VIA_ISA(d);
>>> @@ -614,6 +652,7 @@ static void via_isa_realize(PCIDevice *d, Error **=
errp)
>>>     int i;
>>>=20
>>>     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
>>> +    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq", PCI_NUM=
_PINS);
>>=20
>> This line is a Pegasos2 specific addition for fixing its IRQ handling=
=2E Since this code must also work with the Fuloong2e board we should aim f=
or a minimal changeset here which renders this line out of scope=2E
>>=20
>> Let's keep the two series separate since now I need to watch two series=
 for comments=2E Please use Based-on: tag next time instead=2E
>
>Well, it's not=2E It's part of the QDev model for VT8231 that allows it t=
o be connected by boards so I think this belongs here otherwise this won't =
even compile because the function you've added would be unused and bail on =
-Werror=2E Let's not make this more difficult than it is=2E I'm OK with rea=
sonable changes but what's your goal now? You can't get rid of this line as=
 it's how QDev can model it=2E Either I have to call into this model or hav=
e to export these pins as gpios=2E

Exporting the pins is a separate aspect on top of implementing PCI IRQ rou=
ting=2E To make this clear and obvious this should be a dedicated patch=2E =
In case either patch has an issue this would also ease and therefore acelle=
rate discussions=2E

Best regards,
Bernhard

>
>Regards,
>BALATON Zoltan
>
>> Thanks,
>> Bernhard
>>=20
>>>     isa_irq =3D qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
>>>     isa_bus =3D isa_bus_new(dev, pci_address_space(d), pci_address_spa=
ce_io(d),
>>>                           errp);
>>=20
>>=20

