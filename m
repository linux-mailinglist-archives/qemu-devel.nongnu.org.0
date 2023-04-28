Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C7E6F1C53
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 18:11:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psQf9-0006oa-Fp; Fri, 28 Apr 2023 12:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1psQf7-0006o8-9g; Fri, 28 Apr 2023 12:09:33 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1psQf3-0006ag-FG; Fri, 28 Apr 2023 12:09:32 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-95f4c5cb755so671279366b.0; 
 Fri, 28 Apr 2023 09:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682698167; x=1685290167;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=07hT5KXr8KTmu67OkWoVRpXIP085qI0GGMjt9J0bvDE=;
 b=N66zaSaiGGE4qEX9BkZ2qEAk9UqBIsRiaE8emogsh3Ftfay9W5DbQsbRgJiR2NQ8Bt
 ePoKRS6eo/s1rptARctD2LTzXWNZ2bRhh/psmIg9EjooYr9WDFrd3m0DA7ZRb4Gi9Pu5
 R/sYv8cYjIg6S3wtz3YFDBwTr62WC3GTLS1UJ00DFwtPS874eKkpQRsKhv/A6NijoQGb
 XpKz6kP/ZP07RNfrRAF7zO7CmA/OXBxbDjOU796oUpa8Zm5UKmZGCSVUI2usgE/iULDr
 ycI328ThEOlYBt/oOvPtyJjLu5fIZeNXfreWNUTz92Hb7elDMek9z0X+0ScQOfwnqCxc
 2mmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682698167; x=1685290167;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=07hT5KXr8KTmu67OkWoVRpXIP085qI0GGMjt9J0bvDE=;
 b=d2P/Tqz9PCrQWjWLUoAY5PG1fWiqtuZvi0m/dUITQIhevWrdjBAriVFbymhbsn00Le
 zyZ/1hs4e91VI/4IyctQk+/dwHpWPTelSjEGl9NluekTigAsUGIR7gDwa6R463tVXlTP
 mtswn1jj2C2utjaYkIjHHm4s2vG6k+DCudYRpejAidmZxXsumQfG67YBtqxHjbtn0guK
 s4gBNlK7ZmlBBTRWwqUArfiQ9E5Vx8ngQutmBAYLTcH8snL/FDaHaki5kMHntploAwIC
 8MhQEB9NQZTt6PkljIA5VyqNWKF4Z9lCDy6TFT0/KGLTChrvs+Hamf8LinoESMcAekIz
 x4pQ==
X-Gm-Message-State: AC+VfDyKCQHLHAJd7pw3yvh68X/JEhaZ4qXVbyN921u++UXz/MMYp+pz
 aOa6lN7F72Jgz99eL7Jv0AA=
X-Google-Smtp-Source: ACHHUZ4BdHKNmHUwoxyNPXEUiV/9UZP1n4KFI2oD5IDGMC2soA8yabm210JjO1yazg6Z4ZJ6Nal+zA==
X-Received: by 2002:aa7:cd45:0:b0:506:97c2:a4e8 with SMTP id
 v5-20020aa7cd45000000b0050697c2a4e8mr4888784edw.19.1682698167164; 
 Fri, 28 Apr 2023 09:09:27 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-188-031-114.77.188.pool.telefonica.de.
 [77.188.31.114]) by smtp.gmail.com with ESMTPSA id
 u18-20020a056402111200b00501dd53dbfbsm9297245edv.75.2023.04.28.09.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 09:09:26 -0700 (PDT)
Date: Fri, 28 Apr 2023 16:09:20 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_03/18=5D_hw/i386/pc=5Fpiix=3A_Wire?=
 =?US-ASCII?Q?_PIIX3_IDE_ouput_IRQs_to_ISA_bus_IRQs_14/15?=
In-Reply-To: <a7c88b4d-2ffa-60b8-c37a-b993ad79ca40@eik.bme.hu>
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-4-philmd@linaro.org>
 <a233b5c7-56a6-ac94-c7c1-9fa5da9acb9c@ilande.co.uk>
 <3A39AAE9-73FC-4C56-9BD6-0DA2D78548E0@gmail.com>
 <df449cf0-c1f1-b9cb-8c9e-45b9ed7f1978@ilande.co.uk>
 <a7c88b4d-2ffa-60b8-c37a-b993ad79ca40@eik.bme.hu>
Message-ID: <15A0B143-8323-4D4F-B95A-078B29D77B5E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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



Am 27=2E April 2023 13:04:15 UTC schrieb BALATON Zoltan <balaton@eik=2Ebme=
=2Ehu>:
>On Thu, 27 Apr 2023, Mark Cave-Ayland wrote:
>> On 27/04/2023 08:58, Bernhard Beschow wrote:
>>> Am 26=2E April 2023 12:50:08 UTC schrieb Mark Cave-Ayland <mark=2Ecave=
-ayland@ilande=2Eco=2Euk>:
>>>> On 02/03/2023 22:40, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>=20
>>>>> Since pc_init1() has access to the ISABus*, retrieve the
>>>>> ISA IRQs with isa_bus_get_irq()=2E
>>>>>=20
>>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>>>>> ---
>>>>>    hw/i386/pc_piix=2Ec | 8 +++++++-
>>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>=20
>>>>> diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>>>>> index 126b6c11df=2E=2E1e90b9ff0d 100644
>>>>> --- a/hw/i386/pc_piix=2Ec
>>>>> +++ b/hw/i386/pc_piix=2Ec
>>>>> @@ -277,7 +277,13 @@ static void pc_init1(MachineState *machine,
>>>>>        if (pcmc->pci_enabled) {
>>>>>            PCIDevice *dev;
>>>>>    -        dev =3D pci_create_simple(pci_bus, piix3_devfn + 1, TYPE=
_PIIX3_IDE);
>>>>> +        dev =3D pci_new_multifunction(piix3_devfn + 1, false, TYPE_=
PIIX3_IDE);
>>>>> +        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", 0,
>>>>> +                                    isa_bus_get_irq(isa_bus, 14));
>>>>> +        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", 1,
>>>>> +                                    isa_bus_get_irq(isa_bus, 15));
>>>>> +        pci_realize_and_unref(dev, pci_bus, &error_fatal);
>>>>> +
>>>>>            pci_ide_create_devs(dev);
>>>>>            idebus[0] =3D qdev_get_child_bus(&dev->qdev, "ide=2E0");
>>>>>            idebus[1] =3D qdev_get_child_bus(&dev->qdev, "ide=2E1");
>>>>=20
>>>> Another reason this probably isn't a good idea: you're having to call=
 qdev_connect_gpio_*() before realizing the device :(
>>>=20
>>> Just curious: Resources like memory regions are assigned before realiz=
ation, see e=2Eg=2E i440fx or q35=2E Interrupts are also resources=2E What =
makes them special?
>>=20
>> I think I've covered the =2Einstance_init() vs=2E realize() part in my =
reply to Zoltan, but in terms of qdev_connect_gpio_out_named() the reasonin=
g here is
>
>Well, not quite I'm afaid as I still have questions as it's not clear wha=
t should be in init and in realize=2E
>
>I've looked at i440fx and it has no init just realize which does what ini=
t method shoulc do anf the i440fx_init there is a legacy init function whic=
h should probably be realize so this does not look to be a good example=2E =
The q35 model is more complex and I proably don't understand it fully but s=
till has a realize where most of the memory regions are created and an init=
 method where some tweaks are done that are mentioned in a comment as neede=
d but not the norm so it may also not be the best example so I'm not even g=
etting why Bernhard's cited these in the first place=2E

Let's not confuse the topics "=2Einstance_init() vs=2E =2Erealize()" and "=
resources"=2E I440fx seems to be very old code -- so old that it still uses=
 legacy init methods (not to be confused with =2Einstance_init()" methods)=
=2E I've chosen the examples in context of the "resources" topic=2E

Best regards,
Bernhard

>
>Maybe some QOM/qdev experts could give some advice here=2E
>
>Regards,
>BALATON Zoltan
>
>> that a device shouldn't change it's internal behaviour depending upon h=
ow it is wired=2E In other words a standalone device will behave exactly th=
e same as a device connected into a machine=2E
>>=20
>>> I'm asking since this issue seems to be the main blocker for the piix =
consolidation to be merged=2E
>>=20
>> I did have a brief catch-up with Phil at the start of the week, and he'=
s tagged your series for review but he is really busy at the moment=2E As b=
efore I repeat my offer to help out if needed as I think it's a good series=
, but for now we're waiting for Phil to let us know what the next steps are=
=2E=2E=2E
>>=20
>>=20
>> ATB,
>>=20
>> Mark=2E
>>=20
>> 

