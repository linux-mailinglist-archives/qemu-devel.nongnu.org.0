Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C2169894D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 01:34:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSSDs-0000ED-MW; Wed, 15 Feb 2023 19:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSSDq-0000DN-Ql; Wed, 15 Feb 2023 19:34:02 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSSDo-0004F7-PT; Wed, 15 Feb 2023 19:34:02 -0500
Received: by mail-ed1-x52b.google.com with SMTP id c1so677688edt.4;
 Wed, 15 Feb 2023 16:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qyJrtYOL5YpelMGc28Ic5KCaWPPw9obQt+E+/xRojiQ=;
 b=IVEITOtG0a/AbrlEYxf3caufBQ+/h1Y0c2o1fXuHMlXF+edEF1fKxdsPqIEbsu9eS5
 xU52tBVvVxXMoXRKY8Tvq7byuqueA9/EsR2CwuPXIdilB+BnYJV63XDYajp+z0jDt/2E
 TcmA7FtcV14zC2ykjhydwrIJjVK7pTG8c5yC7wR1/Xswj2O6vY5mu16UPDmmJqdTvMwM
 EuqSpH+5OItfnrxalRuI9RVgI3/xev63A3WzPMxfFSeD2/OvTYJbf/hd/7HMZ1nryP9N
 O5rq+zIQoA9yifXvrxfDLflnxeI8YGLFAVJSmlR948KlzLuZCcWMZZrNfAYWYYeMAO+f
 OPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qyJrtYOL5YpelMGc28Ic5KCaWPPw9obQt+E+/xRojiQ=;
 b=cJFKn0s59tOKReJIxPCOyg3fFKsyu92UwrFi7vxl3SGJGu01nH03nQfIHuQBR1wIHQ
 4OuCi2sXqwpy0BpHXaw0fr+HbwLPNcYsINeeujT3leYTrb8S1YoNc1MXxak2ZCkRraLK
 6HzvMSJJOzlECO0p8bfBQAsGhhEg7tvzFF23+KPrAvSw3y+mpG6GQ/eAe48kb+xC8RFG
 Aoep9H9wx1aJt3p4YviyysKR9W6UIlRySFLdiicYOx2UfzDfwCRCReymx+H7FjD49aOl
 MiPbEZ6rKNlYXw2lEkl/WRkCreLy5+gDrGcvisvVCCvlo9SOApAo+FL/qOaiLdL3yqCr
 AO+A==
X-Gm-Message-State: AO0yUKVmhjIrpn0mE6ThGPAcC4aijLqVPWltGgRr7UzmJIFjmSXIE/Ch
 /bffcxp0D0xQPb2u0tSKN/4=
X-Google-Smtp-Source: AK7set9hE64ncY9tkAWTYrWSuhhLmyDKg01lDGezYutnjI2uzxXPY+hIbd1/hwvG53PuZBGSMuFiAQ==
X-Received: by 2002:aa7:c389:0:b0:4ab:5ce9:9f83 with SMTP id
 k9-20020aa7c389000000b004ab5ce99f83mr4478525edq.23.1676507638837; 
 Wed, 15 Feb 2023 16:33:58 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-183-243-024.77.183.pool.telefonica.de.
 [77.183.243.24]) by smtp.gmail.com with ESMTPSA id
 m8-20020a50d7c8000000b004acc61206cfsm113203edj.33.2023.02.15.16.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 16:33:58 -0800 (PST)
Date: Thu, 16 Feb 2023 00:33:53 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 17/20] hw/ide/pci: Unexport bmdma_active_if()
In-Reply-To: <7D46E540-4C29-4439-981B-93D33DC7F481@gmail.com>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-18-philmd@linaro.org>
 <AF8AE36D-4C5E-465D-A416-B854707166D7@gmail.com>
 <0dc24395-ca89-323e-db20-7aecf0ed5df6@eik.bme.hu>
 <7D46E540-4C29-4439-981B-93D33DC7F481@gmail.com>
Message-ID: <10C0D410-A470-431A-922E-1AE7E82F7070@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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



Am 16=2E Februar 2023 00:18:47 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>
>
>Am 15=2E Februar 2023 21:09:10 UTC schrieb BALATON Zoltan <balaton@eik=2E=
bme=2Ehu>:
>>On Wed, 15 Feb 2023, Bernhard Beschow wrote:
>>> Am 15=2E Februar 2023 11:27:09 UTC schrieb "Philippe Mathieu-Daud=C3=
=A9" <philmd@linaro=2Eorg>:
>>>> From: Bernhard Beschow <shentey@gmail=2Ecom>
>>>>=20
>>>> The function is only used inside ide/pci=2Ec, so doesn't need to be e=
xported=2E
>>>>=20
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>>>> ---
>>>> hw/ide/pci=2Ec         | 6 ++++++
>>>> include/hw/ide/pci=2Eh | 6 ------
>>>> 2 files changed, 6 insertions(+), 6 deletions(-)
>>>>=20
>>>> diff --git a/hw/ide/pci=2Ec b/hw/ide/pci=2Ec
>>>> index 2ddcb49b27=2E=2Efc9224bbc9 100644
>>>> --- a/hw/ide/pci=2Ec
>>>> +++ b/hw/ide/pci=2Ec
>>>> @@ -104,6 +104,12 @@ const MemoryRegionOps pci_ide_data_le_ops =3D {
>>>>     =2Eendianness =3D DEVICE_LITTLE_ENDIAN,
>>>> };
>>>>=20
>>>> +static IDEState *bmdma_active_if(BMDMAState *bmdma)
>>>> +{
>>>> +    assert(bmdma->bus->retry_unit !=3D (uint8_t)-1);
>>>> +    return bmdma->bus->ifs + bmdma->bus->retry_unit;
>>>> +}
>>>> +
>>>> static void bmdma_start_dma(const IDEDMA *dma, IDEState *s,
>>>>                             BlockCompletionFunc *dma_cb)
>>>> {
>>>> diff --git a/include/hw/ide/pci=2Eh b/include/hw/ide/pci=2Eh
>>>> index 2a6284acac=2E=2E7b5e3f6e1c 100644
>>>> --- a/include/hw/ide/pci=2Eh
>>>> +++ b/include/hw/ide/pci=2Eh
>>>> @@ -55,12 +55,6 @@ struct PCIIDEState {
>>>>     MemoryRegion data_bar[2];
>>>> };
>>>>=20
>>>> -static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
>>>> -{
>>>> -    assert(bmdma->bus->retry_unit !=3D (uint8_t)-1);
>>>> -    return bmdma->bus->ifs + bmdma->bus->retry_unit;
>>>> -}
>>>> -
>>>> void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
>>>> void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
>>>> extern MemoryRegionOps bmdma_addr_ioport_ops;
>>>=20
>>> Cool, where did you find this? ;)
>>>=20
>>> This patch, your other patches doing s/ide/ide_bus/, and the fact that=
 IDEBus instantiates two IDE devices itself make me wonder whether the IDE =
devices should really be instantiated in the usual QOM way=2E Then perhaps =
it could turn out that all the s/ide/ide_bus/ patches aren't really needed =
since the functions could operate on the IDE device directly=2E Not sure th=
ough=2E=2E=2E
>>>=20
>>> This might all be a rabbit hole, but since you already started looking=
 into it=2E=2E=2E ;)
>>
>>If you want some more, we've also found another problem with ports that =
should not have anythnig connected but still appear to have a non-working d=
evice that causes some delay during guest boot (and I think this is the rea=
son the pegasos2 firmware prints an "ATA device not present or not respondi=
ng" error while detecting IDE devices=2E
>
>Yes, that would make sense and is indeed the "phantom" behavior I would b=
e expecting=2E

Just an idea: Perhaps pci_ide_create_devs() rather than ide_init2() could =
create the IDEState objects -- of course only if the respective drives are =
configured=2E

>
>>This was discussed here:
>>
>>https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2020-02/msg02468=2E=
html
>>
>>Just to spread knowledge about it=2E I don't exoect this to be fixed as =
it does not cause much trouble just if you wanted to dig into it in the fut=
ure I thought I'd let you know=2E
>
>Interesting read=2E=2E=2E Thanks for sharing!
>
>Best regards,
>Bernhard
>>
>>Regards,
>>BALATON Zoltan

