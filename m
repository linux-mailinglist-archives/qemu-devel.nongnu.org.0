Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34306A13BA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:24:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKwf-00075W-Cq; Thu, 23 Feb 2023 18:24:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVKwc-00075C-2V; Thu, 23 Feb 2023 18:24:10 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVKwa-000384-AE; Thu, 23 Feb 2023 18:24:09 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso639872wmp.4; 
 Thu, 23 Feb 2023 15:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hDtkLccc9+ac8whiLyCVI7ATTitSLcJh6k8QvTK6T3U=;
 b=bPnKG7fvPa54rblt7RS/ryx3CUFxOTzn1TXAqMm3g4wpWWPUiEt5DNY41+TpemIJwM
 7SXUEli0TQPgFsNUrmcSn1SqLhVEusGavi3E3RC7eCBtDwmgndOPVzVuvn2WhGOYncAO
 ZRy1TT/j4zAS32zIFEjhSAiYJq2Bfn12oyU3Ej+XYP/mZWD24OMn17VGrGDhgNnfybt6
 s8cUQ57PdtDq+rL1OIa5Cht0trg+NREecRZS5+5ll+VhHmL7bh0N5qEwOQOpgtQtF0qI
 4w/i4ajRxXyx6Yzn6dWNUmS9TSIltl5Rb7NFKRzA/mfeVYbFzBqM948XUs3SUrl3/2ts
 Nteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hDtkLccc9+ac8whiLyCVI7ATTitSLcJh6k8QvTK6T3U=;
 b=NavG2dCjGoTtwicO2ujS53rI5kVV5wIKlhMCgWGbE0ZbYk3hNEbLnNpaXZMjeTuoru
 t8u92B32aZknFxslkSh78w5PKMbZgQxQ4fEYrAoFNWFsl94vVx3Pg5mgELltFJY1UV5e
 dR4L2yWYDE1ylBjO4XCps0rhoiEqggoIq1FmaKWsesIGGCYjbkah6fivAYqFBHfue5/C
 toD8N+lyDxEK2IQZxBpnExAMJhwOkY4tbyG8zm0Oa2XMjchDMqSLeN5CbApNg/fSOuwp
 Y4OPtFVGIQGBsaU3S/37Xkk3jq9aO6Vqt1+eX/nijnz+BQUC/usgFd2rNjb48wH3p2Ql
 oj3A==
X-Gm-Message-State: AO0yUKVvbKfuyl5oI5SJa0yGOcjahQ1g2LNtfPKYGT2xfSa9XtJT/TjZ
 h9JVD367M3/SSzbRW2zvRB8=
X-Google-Smtp-Source: AK7set+TkMDj7l9kqenuWnkRPjA2EPJjRnTU/6X+wFjNVesLHXv4odr7v44cvORs8R4ckZBX3iEg3w==
X-Received: by 2002:a05:600c:4d20:b0:3ea:edc7:aa59 with SMTP id
 u32-20020a05600c4d2000b003eaedc7aa59mr960274wmp.32.1677194646232; 
 Thu, 23 Feb 2023 15:24:06 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf06ee00517ec7a097edb477.dip0.t-ipconnect.de.
 [2003:fa:af06:ee00:517e:c7a0:97ed:b477])
 by smtp.gmail.com with ESMTPSA id
 be6-20020a05600c1e8600b003e89e3284fasm765084wmb.36.2023.02.23.15.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 15:24:05 -0800 (PST)
Date: Thu, 23 Feb 2023 23:23:59 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 2/5] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <a9efb349-e2b9-1ece-cded-ee500457f1cf@eik.bme.hu>
References: <20230223202053.117050-1-shentey@gmail.com>
 <20230223202053.117050-3-shentey@gmail.com>
 <a9efb349-e2b9-1ece-cded-ee500457f1cf@eik.bme.hu>
Message-ID: <83759E2D-1871-4D26-906A-F9112990BDFF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x335.google.com
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



Am 23=2E Februar 2023 21:11:23 UTC schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Thu, 23 Feb 2023, Bernhard Beschow wrote:
>> The real VIA south bridges implement a PCI IRQ router which is configur=
ed
>> by the BIOS or the OS=2E In order to respect these configurations, QEMU
>> needs to implement it as well=2E
>>=20
>> Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4=
=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>> hw/isa/vt82c686=2Ec | 44 ++++++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 44 insertions(+)
>>=20
>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>> index 3f9bd0c04d=2E=2Ef24e387d63 100644
>> --- a/hw/isa/vt82c686=2Ec
>> +++ b/hw/isa/vt82c686=2Ec
>> @@ -604,6 +604,48 @@ static void via_isa_request_i8259_irq(void *opaque=
, int irq, int level)
>>     qemu_set_irq(s->cpu_intr, level);
>> }
>>=20
>> +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
>> +{
>> +    switch (irq_num) {
>> +    case 0:
>> +        return s->dev=2Econfig[0x55] >> 4;
>> +
>> +    case 1:
>> +        return s->dev=2Econfig[0x56] & 0xf;
>> +
>> +    case 2:
>> +        return s->dev=2Econfig[0x56] >> 4;
>> +
>> +    case 3:
>> +        return s->dev=2Econfig[0x57] >> 4;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
>> +{
>> +    ViaISAState *s =3D opaque;
>> +    PCIBus *bus =3D pci_get_bus(&s->dev);
>> +    int pic_irq;
>> +
>> +    /* now we change the pic irq level according to the via irq mappin=
gs */
>> +    /* XXX: optimize */
>> +    pic_irq =3D via_isa_get_pci_irq(s, irq_num);
>> +    if (pic_irq < ISA_NUM_IRQS) {
>> +        int i, pic_level;
>> +
>> +        /* The pic level is the logical OR of all the PCI irqs mapped =
to it=2E */
>> +        pic_level =3D 0;
>> +        for (i =3D 0; i < PCI_NUM_PINS; i++) {
>> +            if (pic_irq =3D=3D via_isa_get_pci_irq(s, i)) {
>> +                pic_level |=3D pci_bus_get_irq_level(bus, i);
>> +            }
>> +        }
>> +        qemu_set_irq(s->isa_irqs[pic_irq], pic_level);
>> +    }
>> +}
>> +
>> static void via_isa_realize(PCIDevice *d, Error **errp)
>> {
>>     ViaISAState *s =3D VIA_ISA(d);
>> @@ -676,6 +718,8 @@ static void via_isa_realize(PCIDevice *d, Error **e=
rrp)
>>     if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
>>         return;
>>     }
>> +
>> +    pci_bus_irqs(pci_bus, via_isa_set_pci_irq, s, PCI_NUM_PINS);
>
>Please no oversimplification=2E This replaces the connections to mv64361 =
gpp pins made in mv64361_realize() and breaks the interrupts that can be en=
abled in mv64361=2E

Let's split our work as follows: You'll do the audio and pegasos2 changes =
including exporting the pirq properties, I'll do the first three routing pa=
tches of this series as the base=2E

> I've implemented that for something but can't remember now which guest e=
xactly,

Could you please put this information into the commit message or into the =
code? That would ease maintainance a lot=2E

> but this would be needed so please restore my pegasos2 patch and move th=
is there connecting both mv64361 and via-isa to PCI interrupts as shown in =
the schematics=2E That means you also need the PIRQ pins here=2E Can you do=
 a new version with that?

As proposed above I'd fold the first three patches into a separate series =
which you can build upon=2E I have no way to test the pegasos2 IRQ changes =
since the test cases I'm aware of either work or we agreed that they can be=
 fixed later (-> USB)=2E

> I'll try this one in the meantime

Sounds good to me -- that's what I wanted to achieve ;) Thanks!

Best regards,
Bernhard

> but I'm quite sure this is wrong as it is=2E You can drop the via-ac97 p=
atches from this series, I can submit them separately rebased on the final =
IRQ series we come up with=2E
>
>Regards,
>BALATON Zoltan
>
>> }
>>=20
>> /* TYPE_VT82C686B_ISA */
>>=20

