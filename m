Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704DD6EBDAF
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 09:36:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqUGR-0005t3-Vi; Sun, 23 Apr 2023 03:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqUGQ-0005sm-Df; Sun, 23 Apr 2023 03:36:02 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqUGN-0002uW-Fi; Sun, 23 Apr 2023 03:36:01 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-94f32588c13so446064666b.2; 
 Sun, 23 Apr 2023 00:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682235357; x=1684827357;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uLK6Hw7R/pKqTkDV27PqKoRk4XKTTduaDWC4Y6OOn/4=;
 b=h3lHjFU8JCm1tRy6vPOUBALiOHnRPjQvEB4GDJxuJ0YWzlCx43xT9zV2/l4opKb7LZ
 a/OtWlUs7j2ghWbKdoR1NJ3pLb0sQ7+NaccM72YL44YpN7s7ufar6936IY+AND/mVWNl
 4Z0EcJetgbUvmd74OFC0PElSBHLduJvsTpMVBrIJ43XupPHD6MIt+FFaK22A52FmJC2q
 lbdhT88GvJcG/cJBQzNLPYK8jv14A1UdKc7OuVhImoHp+KjOWbBXz9gf8vb/gIN0Qnne
 tEcxH5SIOEpFAdvK/2hCPUuIy4NRKsV1LaUfAXcwNgomQE7H+Sqd7q5HseEgRfOgaV32
 eGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682235357; x=1684827357;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uLK6Hw7R/pKqTkDV27PqKoRk4XKTTduaDWC4Y6OOn/4=;
 b=GW210hJazlr2jdjYQ6uOxbGYRBd1A06Q8hMziDhQ2snYBzKHNdQh9A/CBGVxeHDVuV
 2XuBKR0Kmihcbk8rzLG2j+OVrgl3lpjadFEv9CLWv2vrqmDHW5DVVlzFeDHGn3oMjnHm
 ixwTrWvgphLIux+Yw5JO8nUm7AuhVsyQ4KtIAAg3IpBA5vsYL7LBbYaDXyAWZ7cmZsU4
 M7b4SdxkpK3vyGqjJtAJXxF3Fbu2BvBiNEiMP0TEehSQQ84n2amDvCGIIA1CoUqmyV0s
 2vw+kCwqmC+1LCDa8locem6QY9rV+uKSZpRUshEh1YMouMZ+1z1GQI+4WtuHBgZGmOSH
 uj0A==
X-Gm-Message-State: AAQBX9cpjayKnFPESi0sSZRreAWeucB7wNflRSAB5c/OjRjrMN/wy8Y7
 jDeHQA+onQijcN7VD6S4VmQ=
X-Google-Smtp-Source: AKy350b6BOALTuzBwdo7az7/3ew2RHErvkYiK1u7TmIWvgOwzgQcqgLAbTato8Nm9wdnPyQ80Fwc9w==
X-Received: by 2002:a17:906:808:b0:953:856f:bd83 with SMTP id
 e8-20020a170906080800b00953856fbd83mr7128913ejd.75.1682235356751; 
 Sun, 23 Apr 2023 00:35:56 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-183-175-163.77.183.pool.telefonica.de.
 [77.183.175.163]) by smtp.gmail.com with ESMTPSA id
 re4-20020a170906d8c400b0094a82a236cbsm4051912ejb.129.2023.04.23.00.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 00:35:56 -0700 (PDT)
Date: Sun, 23 Apr 2023 07:35:49 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 13/13] hw/ide: Extract bmdma_clear_status()
In-Reply-To: <a0cad7e3-94f0-3106-d531-f76af18da730@eik.bme.hu>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-14-shentey@gmail.com>
 <a0cad7e3-94f0-3106-d531-f76af18da730@eik.bme.hu>
Message-ID: <364E3290-49BE-4A0D-BE90-70B436462D3E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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



Am 22=2E April 2023 22:46:08 UTC schrieb BALATON Zoltan <balaton@eik=2Ebme=
=2Ehu>:
>On Sat, 22 Apr 2023, Bernhard Beschow wrote:
>> Extract bmdma_clear_status() mirroring bmdma_cmd_writeb()=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>> include/hw/ide/pci=2Eh |  1 +
>> hw/ide/cmd646=2Ec      |  2 +-
>> hw/ide/pci=2Ec         |  7 +++++++
>> hw/ide/piix=2Ec        |  2 +-
>> hw/ide/sii3112=2Ec     | 12 +++++-------
>> hw/ide/via=2Ec         |  2 +-
>> hw/ide/trace-events  |  1 +
>> 7 files changed, 17 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/include/hw/ide/pci=2Eh b/include/hw/ide/pci=2Eh
>> index 81e0370202=2E=2E6a286ad307 100644
>> --- a/include/hw/ide/pci=2Eh
>> +++ b/include/hw/ide/pci=2Eh
>> @@ -59,6 +59,7 @@ struct PCIIDEState {
>> void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
>> void bmdma_init_ops(PCIIDEState *d, const MemoryRegionOps *bmdma_ops);
>> void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
>> +void bmdma_clear_status(BMDMAState *bm, uint32_t val);
>> void pci_ide_create_devs(PCIDevice *dev);
>>=20
>> #endif
>> diff --git a/hw/ide/cmd646=2Ec b/hw/ide/cmd646=2Ec
>> index b9d005a357=2E=2E973c3ff0dc 100644
>> --- a/hw/ide/cmd646=2Ec
>> +++ b/hw/ide/cmd646=2Ec
>> @@ -144,7 +144,7 @@ static void bmdma_write(void *opaque, hwaddr addr,
>>         cmd646_update_irq(pci_dev);
>>         break;
>>     case 2:
>> -        bm->status =3D (val & 0x60) | (bm->status & 1) | (bm->status &=
 ~val & 0x06);
>> +        bmdma_clear_status(bm, val);
>>         break;
>>     case 3:
>>         if (bm =3D=3D &bm->pci_dev->bmdma[0]) {
>> diff --git a/hw/ide/pci=2Ec b/hw/ide/pci=2Ec
>> index 3539b162b7=2E=2E4aa06be7c6 100644
>> --- a/hw/ide/pci=2Ec
>> +++ b/hw/ide/pci=2Ec
>> @@ -318,6 +318,13 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val=
)
>>     bm->cmd =3D val & 0x09;
>> }
>>=20
>> +void bmdma_clear_status(BMDMAState *bm, uint32_t val)
>> +{
>> +    trace_bmdma_update_status(val);
>> +
>> +    bm->status =3D (val & 0x60) | (bm->status & BM_STATUS_DMAING) | (b=
m->status & ~val & 0x06);
>> +}
>> +
>> static uint64_t bmdma_addr_read(void *opaque, hwaddr addr,
>>                                 unsigned width)
>> {
>> diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>> index 406a67fa0f=2E=2E9eab615e35 100644
>> --- a/hw/ide/piix=2Ec
>> +++ b/hw/ide/piix=2Ec
>> @@ -76,7 +76,7 @@ static void bmdma_write(void *opaque, hwaddr addr,
>>         bmdma_cmd_writeb(bm, val);
>>         break;
>>     case 2:
>> -        bm->status =3D (val & 0x60) | (bm->status & 1) | (bm->status &=
 ~val & 0x06);
>> +        bmdma_clear_status(bm, val);
>>         break;
>>     }
>> }
>> diff --git a/hw/ide/sii3112=2Ec b/hw/ide/sii3112=2Ec
>> index 373c0dd1ee=2E=2E1180ff55e7 100644
>> --- a/hw/ide/sii3112=2Ec
>> +++ b/hw/ide/sii3112=2Ec
>> @@ -66,7 +66,7 @@ static void sii3112_bmdma_write(void *opaque, hwaddr =
addr,
>>                                 uint64_t val, unsigned int size)
>> {
>>     BMDMAState *bm =3D opaque;
>> -    SiI3112PCIState *d =3D SII3112_PCI(bm->pci_dev);
>> +    SiI3112PCIState *s =3D SII3112_PCI(bm->pci_dev);
>
>Also renaming local variable is an unrelated change=2E May be separate pa=
tch but wasn't it added in previous patch? Why not already done there?

This change is unintented=2E I'll fix it=2E Thanks for catching!

Best regards,
Bernhard

>
>Regards,
>BALATON Zoltan
>
>>     int i =3D (bm =3D=3D &bm->pci_dev->bmdma[0]) ? 0 : 1;
>>=20
>>     trace_sii3112_bmdma_write(size, addr, val);
>> @@ -75,10 +75,10 @@ static void sii3112_bmdma_write(void *opaque, hwadd=
r addr,
>>         bmdma_cmd_writeb(bm, val);
>>         break;
>>     case 0x01:
>> -        d->regs[i]=2Eswdata =3D val & 0x3f;
>> +        s->regs[i]=2Eswdata =3D val & 0x3f;
>>         break;
>>     case 0x02:
>> -        bm->status =3D (val & 0x60) | (bm->status & 1) | (bm->status &=
 ~val & 6);
>> +        bmdma_clear_status(bm, val);
>>         break;
>>     default:
>>         break;
>> @@ -160,8 +160,7 @@ static void sii3112_reg_write(void *opaque, hwaddr =
addr,
>>         d->regs[0]=2Eswdata =3D val & 0x3f;
>>         break;
>>     case 0x12:
>> -        d->i=2Ebmdma[0]=2Estatus =3D (val & 0x60) | (d->i=2Ebmdma[0]=
=2Estatus & 1) |
>> -                               (d->i=2Ebmdma[0]=2Estatus & ~val & 6);
>> +        bmdma_clear_status(&d->i=2Ebmdma[0], val);
>>         break;
>>     case 0x18:
>>         bmdma_cmd_writeb(&d->i=2Ebmdma[1], val);
>> @@ -170,8 +169,7 @@ static void sii3112_reg_write(void *opaque, hwaddr =
addr,
>>         d->regs[1]=2Eswdata =3D val & 0x3f;
>>         break;
>>     case 0x1a:
>> -        d->i=2Ebmdma[1]=2Estatus =3D (val & 0x60) | (d->i=2Ebmdma[1]=
=2Estatus & 1) |
>> -                               (d->i=2Ebmdma[1]=2Estatus & ~val & 6);
>> +        bmdma_clear_status(&d->i=2Ebmdma[1], val);
>>         break;
>>     case 0x100:
>>         d->regs[0]=2Escontrol =3D val & 0xfff;
>> diff --git a/hw/ide/via=2Ec b/hw/ide/via=2Ec
>> index 35dd97e49b=2E=2Eafb97f302a 100644
>> --- a/hw/ide/via=2Ec
>> +++ b/hw/ide/via=2Ec
>> @@ -75,7 +75,7 @@ static void bmdma_write(void *opaque, hwaddr addr,
>>         bmdma_cmd_writeb(bm, val);
>>         break;
>>     case 2:
>> -        bm->status =3D (val & 0x60) | (bm->status & 1) | (bm->status &=
 ~val & 0x06);
>> +        bmdma_clear_status(bm, val);
>>         break;
>>     default:;
>>     }
>> diff --git a/hw/ide/trace-events b/hw/ide/trace-events
>> index a479525e38=2E=2Ed219c64b61 100644
>> --- a/hw/ide/trace-events
>> +++ b/hw/ide/trace-events
>> @@ -30,6 +30,7 @@ bmdma_write_cmd646(uint64_t addr, uint64_t val) "bmdm=
a: writeb 0x%"PRIx64" : 0x%
>> # pci=2Ec
>> bmdma_reset(void) ""
>> bmdma_cmd_writeb(uint32_t val) "val: 0x%08x"
>> +bmdma_update_status(uint32_t val) "val: 0x%08x"
>> bmdma_addr_read(uint64_t data) "data: 0x%016"PRIx64
>> bmdma_addr_write(uint64_t data) "data: 0x%016"PRIx64
>>=20
>>=20

