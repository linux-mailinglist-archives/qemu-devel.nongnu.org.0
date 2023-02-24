Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677BE6A16FC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:17:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVSJ1-0007h9-JH; Fri, 24 Feb 2023 02:15:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVSIt-0007f6-1y; Fri, 24 Feb 2023 02:15:42 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVSIq-0002an-JW; Fri, 24 Feb 2023 02:15:38 -0500
Received: by mail-ed1-x52a.google.com with SMTP id da10so52468140edb.3;
 Thu, 23 Feb 2023 23:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E2vXVNhEcoCC+NJjIF4RJTbfUgQScLtSf4BL9qLvkgI=;
 b=Nj+Xg2X9sdk32a/LM3S8vwEgctSbMtkVXA29BbLryCPC3IFsR5i4cIjyP4qMiO+bHm
 WoZOVrlEdvrIgw0/ocL/LDdnmFZq4xRQCQr+pnGj8icsUpvgh2M65Ede1fyzQOaXy27M
 82/VJ1JljWYYy3qpurWR2TFTp10SKnwPScVOo1uumYPN0S76/mI8wvLYBYgDTlqR8V02
 C7H8Wgmu1heQtHOS1udc9xyp5tbM7QEwx03wxD+UcJWPnYgjen8ndEeLPKZMXrOPqWAf
 +IUanmz//iu4H1urC/ZE0EHwe8s5oVEM5L1eQJFc56hszAj8F/1Ie0Se97bOuBXSm93c
 4Zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E2vXVNhEcoCC+NJjIF4RJTbfUgQScLtSf4BL9qLvkgI=;
 b=abnUrnmQk2cP1gxzkI6AUU9gRyw9n3LFfyphNVpjc+SyJzrHGik+N7Nw7tOkI3RMdc
 k8vOKxwxEtKytnrln/07Ok8MAekuB1mq5k7rr/JPhygxrSVFPOa3Js2i0vKFSREj7iqT
 97BnDoFqx/TwcEQm1uVN13QvLuC8Xb9mkqB/5rL0QTCmZjB+9HeWi4gZs/wP6O4Dgc7+
 9BlGWsqMdNn7KHmZek4lEVnMLQuhay/3s/ID++Zj8UbV5Rydo+DOPByy/IuRCu0ZPvbj
 py+GZ+adOrEeTsCTkM9lOAbqezLo10hRzZbu3CSagUIAjGXjVQ2Ur0jn+Vq1hnXKENzA
 KcNQ==
X-Gm-Message-State: AO0yUKVd6kACur+ydUEkZlIE8B/gK65gfHco2+NiToPrVgIgpH1ADYQY
 bZtRmMbscCAOrDYCmYZl9Cs=
X-Google-Smtp-Source: AK7set84yBSgXTJ4FfIbUxSbXNt6Axw5TWSdacGPtUCmDkUijdk/wkSS8U+HCbSoK8TdvuYXvc3GyQ==
X-Received: by 2002:a17:906:881:b0:878:605b:ffef with SMTP id
 n1-20020a170906088100b00878605bffefmr23690187eje.55.1677222933682; 
 Thu, 23 Feb 2023 23:15:33 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf06ee00e8d7373f8159d5bb.dip0.t-ipconnect.de.
 [2003:fa:af06:ee00:e8d7:373f:8159:d5bb])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a1709064a0500b008bbc4f3bceesm8093679eju.118.2023.02.23.23.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 23:15:33 -0800 (PST)
Date: Fri, 24 Feb 2023 07:15:28 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 2/5] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <b8d457d1-40b1-adb5-a2ac-98070f62ac1e@eik.bme.hu>
References: <20230223202053.117050-1-shentey@gmail.com>
 <20230223202053.117050-3-shentey@gmail.com>
 <a9efb349-e2b9-1ece-cded-ee500457f1cf@eik.bme.hu>
 <83759E2D-1871-4D26-906A-F9112990BDFF@gmail.com>
 <b8d457d1-40b1-adb5-a2ac-98070f62ac1e@eik.bme.hu>
Message-ID: <D6825370-F3B7-4FF0-9C91-3A7B1755D989@gmail.com>
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



Am 23=2E Februar 2023 23:47:58 UTC schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Thu, 23 Feb 2023, Bernhard Beschow wrote:
>> Am 23=2E Februar 2023 21:11:23 UTC schrieb BALATON Zoltan <balaton@eik=
=2Ebme=2Ehu>:
>>> On Thu, 23 Feb 2023, Bernhard Beschow wrote:
>>>> The real VIA south bridges implement a PCI IRQ router which is config=
ured
>>>> by the BIOS or the OS=2E In order to respect these configurations, QE=
MU
>>>> needs to implement it as well=2E
>>>>=20
>>>> Note: The implementation was taken from piix4_set_irq() in hw/isa/pii=
x4=2E
>>>>=20
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>> ---
>>>> hw/isa/vt82c686=2Ec | 44 ++++++++++++++++++++++++++++++++++++++++++++
>>>> 1 file changed, 44 insertions(+)
>>>>=20
>>>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>>>> index 3f9bd0c04d=2E=2Ef24e387d63 100644
>>>> --- a/hw/isa/vt82c686=2Ec
>>>> +++ b/hw/isa/vt82c686=2Ec
>>>> @@ -604,6 +604,48 @@ static void via_isa_request_i8259_irq(void *opaq=
ue, int irq, int level)
>>>>     qemu_set_irq(s->cpu_intr, level);
>>>> }
>>>>=20
>>>> +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
>>>> +{
>>>> +    switch (irq_num) {
>>>> +    case 0:
>>>> +        return s->dev=2Econfig[0x55] >> 4;
>>>> +
>>>> +    case 1:
>>>> +        return s->dev=2Econfig[0x56] & 0xf;
>>>> +
>>>> +    case 2:
>>>> +        return s->dev=2Econfig[0x56] >> 4;
>>>> +
>>>> +    case 3:
>>>> +        return s->dev=2Econfig[0x57] >> 4;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void via_isa_set_pci_irq(void *opaque, int irq_num, int level=
)
>>>> +{
>>>> +    ViaISAState *s =3D opaque;
>>>> +    PCIBus *bus =3D pci_get_bus(&s->dev);
>>>> +    int pic_irq;
>>>> +
>>>> +    /* now we change the pic irq level according to the via irq mapp=
ings */
>>>> +    /* XXX: optimize */
>>>> +    pic_irq =3D via_isa_get_pci_irq(s, irq_num);
>>>> +    if (pic_irq < ISA_NUM_IRQS) {
>>>> +        int i, pic_level;
>>>> +
>>>> +        /* The pic level is the logical OR of all the PCI irqs mappe=
d to it=2E */
>>>> +        pic_level =3D 0;
>>>> +        for (i =3D 0; i < PCI_NUM_PINS; i++) {
>>>> +            if (pic_irq =3D=3D via_isa_get_pci_irq(s, i)) {
>>>> +                pic_level |=3D pci_bus_get_irq_level(bus, i);
>>>> +            }
>>>> +        }
>>>> +        qemu_set_irq(s->isa_irqs[pic_irq], pic_level);
>>>> +    }
>>>> +}
>>>> +
>>>> static void via_isa_realize(PCIDevice *d, Error **errp)
>>>> {
>>>>     ViaISAState *s =3D VIA_ISA(d);
>>>> @@ -676,6 +718,8 @@ static void via_isa_realize(PCIDevice *d, Error *=
*errp)
>>>>     if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
>>>>         return;
>>>>     }
>>>> +
>>>> +    pci_bus_irqs(pci_bus, via_isa_set_pci_irq, s, PCI_NUM_PINS);
>>>=20
>>> Please no oversimplification=2E This replaces the connections to mv643=
61 gpp pins made in mv64361_realize() and breaks the interrupts that can be=
 enabled in mv64361=2E
>>=20
>> Let's split our work as follows: You'll do the audio and pegasos2 chang=
es including exporting the pirq properties, I'll do the first three routing=
 patches of this series as the base=2E
>
>I'm OK with doing audio as said and already did the PIRQ and pegaosos2 ch=
anges (patch 2 and 3 in my series), just take those without deleting half o=
f them=2E

I can only take the three VT82xx patches as I proposed since I don't know =
the Pegasos2 board as well as you do and I don't want to iterate on any rev=
iew comments for the other patches=2E I'll send my series soonish=2E

Best regards,
Bernhard

>So drop the last two via-ac97 patches and do the IRQ fixes in your way bu=
t keep working what now works=2E
>
>>> I've implemented that for something but can't remember now which guest=
 exactly,
>>=20
>> Could you please put this information into the commit message or into t=
he code? That would ease maintainance a lot=2E
>
>I did, see patch 3 in my series=2E
>
>>> but this would be needed so please restore my pegasos2 patch and move =
this there connecting both mv64361 and via-isa to PCI interrupts as shown i=
n the schematics=2E That means you also need the PIRQ pins here=2E Can you =
do a new version with that?
>>=20
>> As proposed above I'd fold the first three patches into a separate seri=
es which you can build upon=2E I have no way to test the pegasos2 IRQ chang=
es since the test cases I'm aware of either work or we agreed that they can=
 be fixed later (-> USB)=2E
>
>I did fix the USB just haven't sent a v2 yet due to this thread but it's =
just the change I've sent yesterday, just add this before qemu_set_irq at t=
he end of via_isa_set_irq() in my series=2E This is what I have now:
>
>+    uint16_t old_state;
>+    if (old_state && s->isa_irq_state[isa_irq]) {
>+        /* FIXME: i8259 model does not support level sensitive mode */
>+        qemu_set_irq(s->isa_irqs[isa_irq], 0);
>+    }
>
>How to do that with your version I have no idea but this fixed the proble=
m with my series=2E I can send a v2 of this patch with this change if it's =
not clear from this and the other message what I did=2E
>
>>> I'll try this one in the meantime
>>=20
>> Sounds good to me -- that's what I wanted to achieve ;) Thanks!
>
>I've answered about that in the other message, I've tried with AmigaOS, D=
ebian Linux 8=2E11=2E0 netboot iso and MorphOS and they still boot but coul=
dn't test them much yet=2E MorphOS works on my series with sound and USB an=
d does not hang with the above workaround but found now it still hangs if I=
 send something to it over serial (e=2Eg=2E press space or enter where you'=
ve typed boot cd boot=2Eimg after it starts playing sound)=2E This happens =
on both of our series but only with the via-ac97 patch so probably related =
to that=2E This could easily be a guest bug too so I don't care that much, =
the pegasos2 changes are more interesting to get AmigaOS run well so that's=
 my main focus now, MorphOS already runs on other QEMU machines well=2E I'l=
l still try to find this out but AmigaOS can use other sound card so as lon=
g as the IRQ problems are fixed it would work but we need more than one PCI=
 cards working as we'd need sound card and network card for it to be usable=
=2E This was tested to work with my series, if you give alternative series =
I can ask to have those tested too=2E
>
>Regards,
>BALATON Zoltan

