Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C88B6EC7CE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 10:25:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqrU7-0001NX-7N; Mon, 24 Apr 2023 04:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqrU5-0001NB-Ia; Mon, 24 Apr 2023 04:23:41 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqrU2-0005Ym-Iv; Mon, 24 Apr 2023 04:23:41 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-506bdf29712so30786754a12.0; 
 Mon, 24 Apr 2023 01:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682324616; x=1684916616;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SLgTktoiJDrltmPdA+fyLFv4jSgRIyBfihjGYWjhxEg=;
 b=ieSpT4ockkJIc+ec+AahCqYB9XyazOht27svEBSAOq8PkBdDeu4AIJuN31Gr4Ga8uS
 1EGIv+sR+pDF2fg8Oc7x1E5OO0b5hWI9Tz7LbHhlM5/RNVqn92jbzwFmhnOLH0XM4Yux
 ilLEEzB1bEkhQS5Q2Zj17u4zBX4EM/Gv140b6ieEtYUQrVLCPfmY+jhhOYnQnc29tmP1
 PJ0lrtCQRqBfeR0oB7+2K6TM8JrP6n+ke42REqRi/VEw3NJ+bu0FSDTtPjV5FWEqbTW4
 zWbaktFfqdz/VvcykDzC7+evtM3Lf8FKyYwkOw9KnPP9lPPUmKh3o9rlD9/RhV8DX7iU
 Lt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682324616; x=1684916616;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SLgTktoiJDrltmPdA+fyLFv4jSgRIyBfihjGYWjhxEg=;
 b=XL4bfFoq8Ct0m9bXUCn6KrC3X0ufTEc+TpgObsv7gAxrh8Esuw+trw23nCO7C7JhI1
 fBnX6yeCzJp5dfQGHe5v5u3CEyz6+HmNBKtp5nisfBrUtxoPgK57fsZbBuSO46dA1OK0
 jkQIEQZp0L0/hLNFZKA3vvEd6WI+c7Gb55slDBkjQg3luASKgfp08QAtHg4Y3LR9HWlY
 e7W2hdOdq9OsUgDKOPLqDtjOucapoAnrWR+ZpiyaUQEiCSpFEaZC5XalFOKLiFNu1kdU
 MQk64H/CBNvHMN95W8ubbsTEJ/1yGduNfStR28zZlF7+QSAoM47ftjDlYM4bgcEovO2y
 b65Q==
X-Gm-Message-State: AAQBX9eOqparmUJGkUIredyGQJyCQaNpQVQy+5motDUdltcLCtpKvbsi
 Wrd07MBHshkzK/vm3LqkgaU=
X-Google-Smtp-Source: AKy350aTuMoJ7xd9YsDhNHy6f2f6abu3MDne1O9G8YyOF3UMiI63zY4tYjAcesnKjtw/+CeoRoEzZQ==
X-Received: by 2002:a17:907:9894:b0:94e:6eb3:abc4 with SMTP id
 ja20-20020a170907989400b0094e6eb3abc4mr9690297ejc.4.1682324616107; 
 Mon, 24 Apr 2023 01:23:36 -0700 (PDT)
Received: from [127.0.0.1] (business-90-187-110-129.pool2.vodafone-ip.de.
 [90.187.110.129]) by smtp.gmail.com with ESMTPSA id
 u18-20020a056402111200b00501dd53dbfbsm4430236edv.75.2023.04.24.01.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 01:23:35 -0700 (PDT)
Date: Mon, 24 Apr 2023 07:50:35 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 02/13] hw/ide/via: Implement ISA IRQ routing
In-Reply-To: <d7d94bb5-3f76-e7bb-9786-207ec10e4936@eik.bme.hu>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-3-shentey@gmail.com>
 <3b1d7a25-1600-872d-c0e8-b71ec49f551e@eik.bme.hu>
 <8B29FA8F-B534-4CB5-8311-07AAAC782CD9@gmail.com>
 <d7d94bb5-3f76-e7bb-9786-207ec10e4936@eik.bme.hu>
Message-ID: <38E230DE-6452-45B8-ACC9-84B2872BBC31@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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



Am 22=2E April 2023 19:21:12 UTC schrieb BALATON Zoltan <balaton@eik=2Ebme=
=2Ehu>:
>On Sat, 22 Apr 2023, Bernhard Beschow wrote:
>> Am 22=2E April 2023 17:23:56 UTC schrieb BALATON Zoltan <balaton@eik=2E=
bme=2Ehu>:
>>> On Sat, 22 Apr 2023, Bernhard Beschow wrote:
>>>> The VIA south bridge allows the legacy IDE interrupts to be routed to=
 four
>>>> different ISA interrupts=2E This can be configured through the 0x4a r=
egister in
>>>> the PCI configuration space of the ISA function=2E The default routin=
g matches
>>>> the legacy ISA IRQs, that is 14 and 15=2E
>>>=20
>>> On VT8231 0x4a is PCI Master Arbitration Control, IDE interrupt Routin=
g is 0x4c and only documents 14/15 as valid values=2E
>>=20
>> In the datasheet titled "VT8231 South Bridge", preliminary revision 0=
=2E8, Oct=2E 29, 1999, page 60, the "IDE Interrupt Routing" register is loc=
ated at offset 0x4a and offers the same four interrupts in the same order a=
s in the code=2E Are we looking at the same datasheet?
>
>Apparently not=2E The one I have says: Revision 2=2E32, May 10, 2004=2E L=
ooks more authorative than a preliminary one=2E

Indeed=2E I've updated my copy of the datasheet=2E

>
>>> Not sure any guest would actually change this or 0x4a and if that coul=
d cause problems but you may need to handle this somehow=2E (Apart from tes=
ting with MorphOS with -kernel you should really be testing with pegasos2=
=2Erom with MorphOS and Linux, e=2Eg=2E Debian 8=2E11 netinstall iso is kno=
wn to boot=2E)
>>=20
>> I've tested extensively with an x86 Linux guest on my pc-via branch whi=
ch worked flawlessly=2E
>
>That does not substitute testing Linux on pegasos2 though becuase there a=
re some hacks in Linux kernel to handle some pecularities of the pegasos2 i=
ncluding via ide on that machine and that can only be fully tested with peg=
asos2=2Erom and PPC Linux=2E

I'll try to find the Debian ISO to test with pegasos2=2Erom=2E

>
>> As mentioned in the commit message the default routing of the chipset m=
atches legacy behavior, that is interrupts 14 and 15=2E This is reflected b=
y assigning [0x4a] =3D 4 in the code and that is how the code behaved befor=
e=2E
>
>And that's the only allowed value on VT8231, other bits are listed as res=
erved so I wonder if we want to model this at all if no guest is touching i=
t anyway=2E So you could also just drop that part and keep it hard mapped t=
o 14-15 as it is now, mentioning the config reg in a comment if we ever fin=
d a guest that needs it=2E

I see it now=2E I'll use hardcoded IRQs 14 and 15 then=2E

Best regards,
Bernhard

>
>Regards,
>BALATON Zoltan

