Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0E164ED0D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 15:39:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6BrI-00066q-5r; Fri, 16 Dec 2022 09:38:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6BrG-000660-3X; Fri, 16 Dec 2022 09:38:42 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6BrE-0004TM-2d; Fri, 16 Dec 2022 09:38:41 -0500
Received: by mail-ed1-x533.google.com with SMTP id i15so3925971edf.2;
 Fri, 16 Dec 2022 06:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dEYMbp/zrpMQKCEM2oPH/SQVe/h2yZJqZv9VuDbrOk8=;
 b=eB269ZzVi3w23NjKm1EKqyA0B7K/qBUNhgAZs6aaaiMp7kGa7/6HpzO9TnB+6d2nta
 G0yq9y/vw/OCGhy2r7UWXGUA9ykIZp6TxkqZyo+tZPqxDXIG4XyuLlnL8gVRjbeDQsBf
 HToCeZfFaAQBwBZXi1Dfae6EYFi79FbunmUYIfwIVvj6GbDHI9rSCfX6MoKB9dqSHixR
 B5kvr2Bav16ZGbfqDWyP7gweik7UiNL9XZxrXoPXMqi3BEU7YfQiwjh1aRZCqNkZ/fYK
 GTnL8OeYoyS4JnKz5zFAujzMk6JJRWt+MMvZJKPjGXKil7XyDNSkUdk0voPuyoN1GA/g
 YKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dEYMbp/zrpMQKCEM2oPH/SQVe/h2yZJqZv9VuDbrOk8=;
 b=q4nIPRpgGUpEg9+6OJv9LoJ2/o5NUQ6rlf3iIIM/GQSRQNezTFSpMyMylSpBWyAx1Q
 wShke+ZkstAe6ysm/sOZVQwrMsKsFt35AWcW2e2Wr3Zsv49CmoYgQHUQEeR8jTJqRU/Z
 1eq07vdUu7V5u+b48Cr3YiaMFVz1N/YazN5hctj9Ox6xy2NXTL+sXFr5BfFtgaiQulu7
 RWxx3B9HD5jK2Si8R1+Yt4DtL2D6btJ7N71do+MqxOL02uYdTzB3d9/ToHGSUrTbXZxQ
 Hezw04FyZfHKIkxNe1f+y6Onws9yScxQnHK0nDH2uf/1OfA22tILBiXktBAcYgVhIjfI
 XShg==
X-Gm-Message-State: ANoB5plbyyJBaEkQ+GuSkuqRddKorZjGou4q2iFGa+Mzff35fICxsolz
 5tBw3tTXRVreRR0/DjCk1HA=
X-Google-Smtp-Source: AA0mqf4iLLitTxPPu0vL/eCfWgeUA/D9BwcGZuzIhLMMiFMvYY11SJeIclCLRlpQsOmcLBG1hIYsDw==
X-Received: by 2002:a05:6402:e09:b0:467:91bc:f523 with SMTP id
 h9-20020a0564020e0900b0046791bcf523mr29782813edh.36.1671201516928; 
 Fri, 16 Dec 2022 06:38:36 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-138-012.78.55.pool.telefonica.de.
 [78.55.138.12]) by smtp.gmail.com with ESMTPSA id
 cb11-20020a0564020b6b00b004588ef795easm945796edb.34.2022.12.16.06.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 06:38:36 -0800 (PST)
Date: Fri, 16 Dec 2022 14:38:28 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>, 
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jan Kiszka <jan.kiszka@web.de>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_6/7=5D_hw/sd/sdhci=3A_Imp?=
 =?US-ASCII?Q?lement_Freescale_eSDHC_device_model?=
In-Reply-To: <6F4D0C8A-5DDC-4802-BE98-F546E6E73048@gmail.com>
References: <20221018210146.193159-1-shentey@gmail.com>
 <20221018210146.193159-7-shentey@gmail.com>
 <f9dd1e1e-65b6-c74d-d957-43774393c2a4@linaro.org>
 <724F8CC8-C5E8-4785-B5C2-F1D327863717@gmail.com>
 <590683A5-2774-432C-A47A-ED755054479C@gmail.com>
 <DB3C19E8-007B-46F6-96B3-EE0CF6AD2019@gmail.com>
 <45be44c0-766b-07c6-be8a-c21d46da7f72@linaro.org>
 <CAG4p6K5qvJFRihrZV3Gku_fYsxWFzEN4UfGf4xySQyfzkv9q0g@mail.gmail.com>
 <3629cba9-0eb7-1f9e-4bcd-030e1edb8745@linaro.org>
 <6F4D0C8A-5DDC-4802-BE98-F546E6E73048@gmail.com>
Message-ID: <BEA593C6-8569-44AE-8E4B-554B6D389B72@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
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



Am 1=2E November 2022 10:49:20 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>Am 31=2E Oktober 2022 12:11:37 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>>On 30/10/22 12:46, Bernhard Beschow wrote:
>>>=20
>>>=20
>>> On Sun, Oct 30, 2022 at 1:10 AM Philippe Mathieu-Daud=C3=A9 <philmd@li=
naro=2Eorg <mailto:philmd@linaro=2Eorg>> wrote:
>>>=20
>>>     On 29/10/22 20:28, Bernhard Beschow wrote:
>>>      > Am 29=2E Oktober 2022 13:04:00 UTC schrieb Bernhard Beschow
>>>     <shentey@gmail=2Ecom <mailto:shentey@gmail=2Ecom>>:
>>>      >> Am 29=2E Oktober 2022 11:33:51 UTC schrieb Bernhard Beschow
>>>     <shentey@gmail=2Ecom <mailto:shentey@gmail=2Ecom>>:
>>>      >>> Am 27=2E Oktober 2022 21:40:01 UTC schrieb "Philippe
>>>     Mathieu-Daud=C3=A9" <philmd@linaro=2Eorg <mailto:philmd@linaro=2Eo=
rg>>:
>>>      >>>> Hi Bernhard,
>>>      >>>>
>>>      >>>> On 18/10/22 23:01, Bernhard Beschow wrote:
>>>      >>>>> Will allow e500 boards to access SD cards using just their
>>>     own devices=2E
>>>      >>>>>
>>>      >>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom
>>>     <mailto:shentey@gmail=2Ecom>>
>>>      >>>>> ---
>>>      >>>>>=C2=A0 =C2=A0 hw/sd/sdhci=2Ec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 120
>>>     +++++++++++++++++++++++++++++++++++++++++-
>>>      >>>>>=C2=A0 =C2=A0 include/hw/sd/sdhci=2Eh |=C2=A0 =C2=A03 ++
>>>      >>>>>=C2=A0 =C2=A0 2 files changed, 122 insertions(+), 1 deletion=
(-)
>>>=20
>>>      >>>> So now, I'd create 1 UNIMP region for ESDHC_WML and map it
>>>      >>>> into SDHC_REGISTERS_MAP (s->iomem) with priority 1, and add
>>>      >>>> another UNIMP region of ESDHC_REGISTERS_MAP_SIZE -
>>>     SDHC_REGISTERS_MAP_SIZE (=3D 0x310) and map it normally at offset
>>>      >>>> 0x100 (SDHC_REGISTERS_MAP_SIZE)=2E Look at create_unimp() in
>>>      >>>> hw/arm/bcm2835_peripherals=2Ec=2E
>>>      >>>>
>>>      >>>> But the ESDHC_WML register has address 0x44 and fits inside =
the
>>>      >>>> SDHC_REGISTERS_MAP region, so likely belong there=2E 0x44 is=
 the
>>>      >>>> upper part of the SDHC_CAPAB register=2E These bits are unde=
fined
>>>      >>>> on the spec v2, which I see you are setting in esdhci_init()=
=2E
>>>      >>>> So this register should already return 0, otherwise we have
>>>      >>>> a bug=2E Thus we don't need to handle this ESDHC_WML particu=
larly=2E
>>>      >>
>>>      >> My idea here was to catch this unimplemented case in order to
>>>     indicate this clearly to users=2E Perhaps it nudges somebody to
>>>     provide a patch?
>>>      >>
>>>      >>>>
>>>      >>>> And your model is reduced to handling create_unimp() in
>>>     esdhci_realize()=2E
>>>      >>>>
>>>      >>>> Am I missing something?
>>>      >>>
>>>      >>> The mmio ops are big endian and need to be aligned to a 4-byt=
e
>>>     boundary=2E It took me quite a while to debug this=2E So shall I j=
ust
>>>     create an additional memory region for the region above
>>>     SDHC_REGISTERS_MAP_SIZE for ESDHC_DMA_SYSCTL?
>>>      >>
>>>      >> All in all I currently don't have a better idea than keeping t=
he
>>>     custom i/o ops for the standard region and adding an additional
>>>     unimplemented region for ESDHC_DMA_SYSCTL=2E I think I'd have to
>>>     dynamically allocate memory for it where I still need to figure ou=
t
>>>     how not to leak it=2E
>>>      >
>>>      > By simply reusing sdhci_{read,write} in eSDHC's io_ops struct I
>>>     was able to remove the custom implementations while having big
>>>     endian and the alignments proper=2E However, I don't see a way of
>>>     adding two memory regions - with or without a container=2E With a
>>>     container I'd have to somehow preserve the mmio attribute which is
>>>     initialized by the parent class, re-initialize it with the
>>>     container, and add the preserved memory region as child=2E This se=
ems
>>>     very fragile, esp=2E since the parent class has created an alias f=
or
>>>     mmio in sysbus=2E Without a container, one would have two memory
>>>     regions that both have to be mapped separately by the caller, i=2E=
e=2E
>>>     it burdens the caller with an implementation detail=2E
>>>      >
>>>      > Any suggestions?
>>
>>See https://lore=2Ekernel=2Eorg/qemu-devel/20221031115402=2E91912-7-phil=
md@linaro=2Eorg/
>>
>>>     Can you share branch and how to test?
>>>=20
>>>=20
>>> QEMU branch: https://github=2Ecom/shentok/qemu/tree/e500-flash <https:=
//github=2Ecom/shentok/qemu/tree/e500-flash>
>>>=20
>>> How to test:
>>> 1=2E `git clone -b e500 https://github=2Ecom/shentok/buildroot=2Egit <=
https://github=2Ecom/shentok/buildroot=2Egit>`
>>> 2=2E `cd buildroot`
>>> 3=2E `make qemu_ppc_e500mc_defconfig`
>>> 4=2E `make`
>>> 5=2E `cd output/images`
>>> 6=2E `dd if=3D/dev/zero of=3Droot=2Eimg bs=3D1M count=3D64 && dd if=3D=
rootfs=2Eext2 of=3Droot=2Eimg bs=3D1M conv=3Dnotrunc`
>>> 7=2E `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -ap=
pend "console=3DttyS0 rootwait root=3D/dev/mmcblk0" -device sd-card,drive=
=3Dmydrive -drive id=3Dmydrive,if=3Dnone,file=3Droot=2Eimg,format=3Draw`
>>
>>Could you add an Avocado-based test?
>
>I could give it a try at least=2E Where would I drop the binaries?

Looks like Cederic already had a repo [1]=2E Let's see what I can do=2E

Best regards,
Bernhard

[1] https://github=2Ecom/legoater/qemu-ppc-boot/tree/main/buildroot

>
>Best regards,
>Bernhard
>>
>>>  =C2=A0 Welcome to Buildroot
>>>  =C2=A0 buildroot login:
>>
>>Regards,
>>
>>Phil=2E
>

