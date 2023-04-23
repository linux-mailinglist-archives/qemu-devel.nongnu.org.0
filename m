Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5904A6EC2E1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 00:08:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqhrD-0003bx-3G; Sun, 23 Apr 2023 18:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqhr6-0003bR-Nz; Sun, 23 Apr 2023 18:06:48 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqhr4-0002ht-OC; Sun, 23 Apr 2023 18:06:48 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-504eb1155d3so27796514a12.1; 
 Sun, 23 Apr 2023 15:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682287604; x=1684879604;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/tlyaq/ewuMFJoYN59NWCUcgOqe8YdI0eDhCe68lONQ=;
 b=RY9/Ne3c2ut1SS7dLbl4DkpzRcXxnQCJRBaHkPQin7Tl0HcFYu7/iXi/HERAfltXFP
 qepyy6ZB02G/fVGt8IIBlac5Gt5cWaVED6yo2EmvzVwTgzbRWXu5ZRywiUn59QbjcrKf
 S0b2KMy33n/s3ztvFstIL8zd63cG4mWR2p96ePwpeQrRW0dEfJHlbFWbN6rxzPtmgjJx
 0cxxNWfv9ahooZUPCDYZgV+89E/aFYrXPvo9LhhTilTaQBiSezYSXL9alPYXjH6N9EOS
 mdz5l2wy/7NJpcg83w9LEmH/8Tx2q8VXHTxMYMcOfGtx/fT2+sNDhr3O/M7FFuQw3cZh
 ua4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682287604; x=1684879604;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/tlyaq/ewuMFJoYN59NWCUcgOqe8YdI0eDhCe68lONQ=;
 b=WjK4b86ILYzoAwV6JM034zJJJCdpFSuvP14TBHtmOm2cY1kkqqU90XleCFV70/4mvu
 RDnwl1ZQCqije4/Y16Qe7s669/gYCAUeSrtQukgmf9d4rfrGrT2HP8gyRNR3VN4etJkV
 eGL2xmm1ansiInpraS5VG3GCJQWGdGRR8fiwT+Vbf9JOk9+SqPb/9lpwsPCNlOp3VXhM
 G07IyAFOTdG2eoN6omxt+Sltpg7hw3emIniVKrNhL+hZLkSMNUA+sz4cOjNqiYQyCmI2
 WK3FbdONuS8gm2BoFsqbSUYDMvbDZw4me2v6xYsgKhQbDoMz1+KJsuaBChgDvEJNQozn
 6nGw==
X-Gm-Message-State: AAQBX9ehLz9hnAZkpnX1W+WY1kcF4huJyKlQa0rrJp9jMfh4g22aNasu
 hxwmy9wkNNiIFgbuJ9JLB9s=
X-Google-Smtp-Source: AKy350aM6mxo9vR+IKbPAP1BkpOcFN+cGxvoKVEReSPD9URT/ZJ2cc4z5yMVayK+aNGi5k0DgtNdDQ==
X-Received: by 2002:a17:906:a007:b0:933:4d47:55b7 with SMTP id
 p7-20020a170906a00700b009334d4755b7mr8668265ejy.2.1682287604463; 
 Sun, 23 Apr 2023 15:06:44 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-183-111-058.77.183.pool.telefonica.de.
 [77.183.111.58]) by smtp.gmail.com with ESMTPSA id
 i15-20020a1709061e4f00b0094f3d700868sm4827386ejj.80.2023.04.23.15.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 15:06:44 -0700 (PDT)
Date: Sun, 23 Apr 2023 21:53:41 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 13/13] hw/ide: Extract bmdma_clear_status()
In-Reply-To: <05de58ba-e27f-c5d1-9f70-e9704f782e20@eik.bme.hu>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-14-shentey@gmail.com>
 <d603fd42-6aba-99be-c24d-d04fc36abacb@eik.bme.hu>
 <D1082CEC-16C3-4A31-88DB-3F48BEAFB928@gmail.com>
 <05de58ba-e27f-c5d1-9f70-e9704f782e20@eik.bme.hu>
Message-ID: <C7231F40-2EDD-4994-A655-E68C3E2C9D7D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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



Am 23=2E April 2023 10:40:50 UTC schrieb BALATON Zoltan <balaton@eik=2Ebme=
=2Ehu>:
>On Sun, 23 Apr 2023, Bernhard Beschow wrote:
>> Am 22=2E April 2023 21:26:00 UTC schrieb BALATON Zoltan <balaton@eik=2E=
bme=2Ehu>:
>>> On Sat, 22 Apr 2023, Bernhard Beschow wrote:
>>>> Extract bmdma_clear_status() mirroring bmdma_cmd_writeb()=2E
>>>=20
>>> Is adding a trace point useful? This is called from places that alread=
y have traces so I don't think we need another separate trace point here=2E
>>=20
>> Adding a trace point was my original motivation to have this function=
=2E Then I realized that extracting the code in a dedicated function is a m=
erit in itself=2E The trace point is a leftover, so I'll remove it=2E
>>=20
>>> Also the names don't match but maybe rename function to bmdma_update_s=
tatus instead as it is more what it does=2E
>>=20
>> The status attribute models a w1c-style register=2E Writing to it can o=
nly clear bits, hence the name=2E Indeed I originally named the function bm=
dma_update_status() but thought it was too vague=2E I'm open to suggestions=
 though=2E
>
>The function seems to clear bits 1-2 but set bits 5-6 so it it has some w=
rite 1 to clear and some read write bits=2E Therefore naming the function c=
lear when it can also set bits is not quite right so I think update is bett=
er=2E

Convinced=2E I'll rename to bmdma_update_status() in the next iteration=2E

Best regards,
Bernhard

>
>Regards,
>BALATON Zoltan
>
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>> ---
>>>> include/hw/ide/pci=2Eh |  1 +
>>>> hw/ide/cmd646=2Ec      |  2 +-
>>>> hw/ide/pci=2Ec         |  7 +++++++
>>>> hw/ide/piix=2Ec        |  2 +-
>>>> hw/ide/sii3112=2Ec     | 12 +++++-------
>>>> hw/ide/via=2Ec         |  2 +-
>>>> hw/ide/trace-events  |  1 +
>>>> 7 files changed, 17 insertions(+), 10 deletions(-)
>>>>=20
>>>> diff --git a/include/hw/ide/pci=2Eh b/include/hw/ide/pci=2Eh
>>>> index 81e0370202=2E=2E6a286ad307 100644
>>>> --- a/include/hw/ide/pci=2Eh
>>>> +++ b/include/hw/ide/pci=2Eh
>>>> @@ -59,6 +59,7 @@ struct PCIIDEState {
>>>> void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
>>>> void bmdma_init_ops(PCIIDEState *d, const MemoryRegionOps *bmdma_ops)=
;
>>>> void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
>>>> +void bmdma_clear_status(BMDMAState *bm, uint32_t val);
>>>> void pci_ide_create_devs(PCIDevice *dev);
>>>>=20
>>>> #endif
>>>> diff --git a/hw/ide/cmd646=2Ec b/hw/ide/cmd646=2Ec
>>>> index b9d005a357=2E=2E973c3ff0dc 100644
>>>> --- a/hw/ide/cmd646=2Ec
>>>> +++ b/hw/ide/cmd646=2Ec
>>>> @@ -144,7 +144,7 @@ static void bmdma_write(void *opaque, hwaddr addr=
,
>>>>         cmd646_update_irq(pci_dev);
>>>>         break;
>>>>     case 2:
>>>> -        bm->status =3D (val & 0x60) | (bm->status & 1) | (bm->status=
 & ~val & 0x06);
>>>> +        bmdma_clear_status(bm, val);
>>>>         break;
>>>>     case 3:
>>>>         if (bm =3D=3D &bm->pci_dev->bmdma[0]) {
>>>> diff --git a/hw/ide/pci=2Ec b/hw/ide/pci=2Ec
>>>> index 3539b162b7=2E=2E4aa06be7c6 100644
>>>> --- a/hw/ide/pci=2Ec
>>>> +++ b/hw/ide/pci=2Ec
>>>> @@ -318,6 +318,13 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t v=
al)
>>>>     bm->cmd =3D val & 0x09;
>>>> }
>>>>=20
>>>> +void bmdma_clear_status(BMDMAState *bm, uint32_t val)
>>>> +{
>>>> +    trace_bmdma_update_status(val);
>>>> +
>>>> +    bm->status =3D (val & 0x60) | (bm->status & BM_STATUS_DMAING) | =
(bm->status & ~val & 0x06);
>>>> +}
>>>> +
>>>> static uint64_t bmdma_addr_read(void *opaque, hwaddr addr,
>>>>                                 unsigned width)
>>>> {
>>>> diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>>>> index 406a67fa0f=2E=2E9eab615e35 100644
>>>> --- a/hw/ide/piix=2Ec
>>>> +++ b/hw/ide/piix=2Ec
>>>> @@ -76,7 +76,7 @@ static void bmdma_write(void *opaque, hwaddr addr,
>>>>         bmdma_cmd_writeb(bm, val);
>>>>         break;
>>>>     case 2:
>>>> -        bm->status =3D (val & 0x60) | (bm->status & 1) | (bm->status=
 & ~val & 0x06);
>>>> +        bmdma_clear_status(bm, val);
>>>>         break;
>>>>     }
>>>> }
>>>> diff --git a/hw/ide/sii3112=2Ec b/hw/ide/sii3112=2Ec
>>>> index 373c0dd1ee=2E=2E1180ff55e7 100644
>>>> --- a/hw/ide/sii3112=2Ec
>>>> +++ b/hw/ide/sii3112=2Ec
>>>> @@ -66,7 +66,7 @@ static void sii3112_bmdma_write(void *opaque, hwadd=
r addr,
>>>>                                 uint64_t val, unsigned int size)
>>>> {
>>>>     BMDMAState *bm =3D opaque;
>>>> -    SiI3112PCIState *d =3D SII3112_PCI(bm->pci_dev);
>>>> +    SiI3112PCIState *s =3D SII3112_PCI(bm->pci_dev);
>>>>     int i =3D (bm =3D=3D &bm->pci_dev->bmdma[0]) ? 0 : 1;
>>>>=20
>>>>     trace_sii3112_bmdma_write(size, addr, val);
>>>> @@ -75,10 +75,10 @@ static void sii3112_bmdma_write(void *opaque, hwa=
ddr addr,
>>>>         bmdma_cmd_writeb(bm, val);
>>>>         break;
>>>>     case 0x01:
>>>> -        d->regs[i]=2Eswdata =3D val & 0x3f;
>>>> +        s->regs[i]=2Eswdata =3D val & 0x3f;
>>>>         break;
>>>>     case 0x02:
>>>> -        bm->status =3D (val & 0x60) | (bm->status & 1) | (bm->status=
 & ~val & 6);
>>>> +        bmdma_clear_status(bm, val);
>>>>         break;
>>>>     default:
>>>>         break;
>>>> @@ -160,8 +160,7 @@ static void sii3112_reg_write(void *opaque, hwadd=
r addr,
>>>>         d->regs[0]=2Eswdata =3D val & 0x3f;
>>>>         break;
>>>>     case 0x12:
>>>> -        d->i=2Ebmdma[0]=2Estatus =3D (val & 0x60) | (d->i=2Ebmdma[0]=
=2Estatus & 1) |
>>>> -                               (d->i=2Ebmdma[0]=2Estatus & ~val & 6)=
;
>>>> +        bmdma_clear_status(&d->i=2Ebmdma[0], val);
>>>>         break;
>>>>     case 0x18:
>>>>         bmdma_cmd_writeb(&d->i=2Ebmdma[1], val);
>>>> @@ -170,8 +169,7 @@ static void sii3112_reg_write(void *opaque, hwadd=
r addr,
>>>>         d->regs[1]=2Eswdata =3D val & 0x3f;
>>>>         break;
>>>>     case 0x1a:
>>>> -        d->i=2Ebmdma[1]=2Estatus =3D (val & 0x60) | (d->i=2Ebmdma[1]=
=2Estatus & 1) |
>>>> -                               (d->i=2Ebmdma[1]=2Estatus & ~val & 6)=
;
>>>> +        bmdma_clear_status(&d->i=2Ebmdma[1], val);
>>>>         break;
>>>>     case 0x100:
>>>>         d->regs[0]=2Escontrol =3D val & 0xfff;
>>>> diff --git a/hw/ide/via=2Ec b/hw/ide/via=2Ec
>>>> index 35dd97e49b=2E=2Eafb97f302a 100644
>>>> --- a/hw/ide/via=2Ec
>>>> +++ b/hw/ide/via=2Ec
>>>> @@ -75,7 +75,7 @@ static void bmdma_write(void *opaque, hwaddr addr,
>>>>         bmdma_cmd_writeb(bm, val);
>>>>         break;
>>>>     case 2:
>>>> -        bm->status =3D (val & 0x60) | (bm->status & 1) | (bm->status=
 & ~val & 0x06);
>>>> +        bmdma_clear_status(bm, val);
>>>>         break;
>>>>     default:;
>>>>     }
>>>> diff --git a/hw/ide/trace-events b/hw/ide/trace-events
>>>> index a479525e38=2E=2Ed219c64b61 100644
>>>> --- a/hw/ide/trace-events
>>>> +++ b/hw/ide/trace-events
>>>> @@ -30,6 +30,7 @@ bmdma_write_cmd646(uint64_t addr, uint64_t val) "bm=
dma: writeb 0x%"PRIx64" : 0x%
>>>> # pci=2Ec
>>>> bmdma_reset(void) ""
>>>> bmdma_cmd_writeb(uint32_t val) "val: 0x%08x"
>>>> +bmdma_update_status(uint32_t val) "val: 0x%08x"
>>>> bmdma_addr_read(uint64_t data) "data: 0x%016"PRIx64
>>>> bmdma_addr_write(uint64_t data) "data: 0x%016"PRIx64
>>>>=20
>>>>=20
>>=20
>>=20

