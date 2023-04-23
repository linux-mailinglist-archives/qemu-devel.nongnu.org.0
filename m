Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9286EC2E4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 00:12:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqhvl-0005XU-CG; Sun, 23 Apr 2023 18:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqhve-0005XB-Vh; Sun, 23 Apr 2023 18:11:31 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqhvc-0003Gn-2v; Sun, 23 Apr 2023 18:11:30 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-504eb1155d3so27822740a12.1; 
 Sun, 23 Apr 2023 15:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682287885; x=1684879885;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ehl/xpxy2awJprAeYgXjIlTVS0qZ7ioF7KP9OwaaFog=;
 b=ZffONKEHmimiouMJM7d+nL0uV9510duNI1A44toFe6b7/RlhlMQI+Fef+aBpNbKFmT
 4B34luk4Emo5DFBMx6btQ706/WoYNQXkGNh3g6JAobdSrsFyoMZMfcN+fb7GRbStts0n
 UA3ueFs18uLmb07Ziwte2j6I3DKCbs5dlRJkbzhOgGBx4aNI34MtWGI3BZ2UTtEpGVqJ
 ZPKTbqM5QO1lxmUN5J1kWdtutm3EyZNo6jjGRqepZOmoDA/YCaJ1SNzEAxkiPqex/Czl
 YfIqIgR3qr9KKUExlXRgp7EC4RyE58XpvPoQ3zWzOA8pzhBl1KnsErrzjndWNmsTiTMb
 1zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682287885; x=1684879885;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ehl/xpxy2awJprAeYgXjIlTVS0qZ7ioF7KP9OwaaFog=;
 b=av/RJ/4eor7lSjilzuf5n+FA5X8AUG9yWqaJwW4w4DwyLiTPA6P5MaWMTOK4R+lqOH
 kQ6jpQH480NMu4MARm1SICpNgU5xJxFVsijjEHVsiovzRA+XjuVZsNor2JT6MnHrCMEU
 JWr64ttLkU1oVLQqDEGIPXIiIvOpMD9xEwpb+gGS3WcL+AWN6/i4I2OMDp3A9XPhDy/d
 xZgwGo/9CkvMR7wcT9aUl9KnOxnswfiL3fyQsMkJLERL2KSKWuLk0v1Q0gIUt/9g6Evd
 vRcrDuBWl8MF5jiZVpCaAY7ezILs7kDVKeGeCjJZeTzT5xb2kfqLZV5siAPBgIdmjdvY
 mcDw==
X-Gm-Message-State: AAQBX9eQsAy9aPehl9mHacc4Sj8/tri6r9ymqUjFohD5GFvnCw5eeIQK
 cLxGE1Za13kLsIIVQJIsfi0=
X-Google-Smtp-Source: AKy350YK/i68vV/1DgMeuFA22T6UcZNpSxl3reYkJrqlqGFpOG+qKZAytgANMoGh8zfUqxHQaIm5QA==
X-Received: by 2002:a17:906:cc99:b0:94a:511b:a21d with SMTP id
 oq25-20020a170906cc9900b0094a511ba21dmr8603643ejb.28.1682287885242; 
 Sun, 23 Apr 2023 15:11:25 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-183-111-058.77.183.pool.telefonica.de.
 [77.183.111.58]) by smtp.gmail.com with ESMTPSA id
 r20-20020a170906705400b0094f05fee9d3sm4856505ejj.211.2023.04.23.15.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 15:11:24 -0700 (PDT)
Date: Sun, 23 Apr 2023 22:11:22 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org
Subject: Re: [PATCH 05/13] hw/ide: Extract pci_ide_class_init()
In-Reply-To: <9a25912c-a494-9efc-62ee-1de83b69a060@linaro.org>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-6-shentey@gmail.com>
 <9a25912c-a494-9efc-62ee-1de83b69a060@linaro.org>
Message-ID: <1A105E4E-4F2E-4C06-8434-4A3349D45618@gmail.com>
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



Am 23=2E April 2023 17:41:33 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <ph=
ilmd@linaro=2Eorg>:
>On 22/4/23 17:07, Bernhard Beschow wrote:
>> Resolves redundant code in every PCI IDE device model=2E
>> ---
>>   include/hw/ide/pci=2Eh |  1 -
>>   hw/ide/cmd646=2Ec      | 15 ---------------
>>   hw/ide/pci=2Ec         | 25 ++++++++++++++++++++++++-
>>   hw/ide/piix=2Ec        | 19 -------------------
>>   hw/ide/sii3112=2Ec     |  3 ++-
>>   hw/ide/via=2Ec         | 15 ---------------
>>   6 files changed, 26 insertions(+), 52 deletions(-)
>
>
>> diff --git a/hw/ide/sii3112=2Ec b/hw/ide/sii3112=2Ec
>> index 5dd3d03c29=2E=2E0af897a9ef 100644
>> --- a/hw/ide/sii3112=2Ec
>> +++ b/hw/ide/sii3112=2Ec
>> @@ -301,9 +301,10 @@ static void sii3112_pci_class_init(ObjectClass *kl=
ass, void *data)
>>       pd->class_id =3D PCI_CLASS_STORAGE_RAID;
>>       pd->revision =3D 1;
>>       pd->realize =3D sii3112_pci_realize;
>> +    pd->exit =3D NULL;
>>       dc->reset =3D sii3112_reset;
>> +    dc->vmsd =3D NULL;
>>       dc->desc =3D "SiI3112A SATA controller";
>
>The SiI3112A doesn't have these regions?

Yeah, it ignores a lot of stuff in the base class=2E This gets changed in =
the last part of this series though=2E This seems why there is no exit meth=
od=2E Furthermore -- probably due to additional custom fields -- there is n=
o migration description=2E

Best regards,
Bernhard

