Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97255660E36
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 12:07:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE71h-0005pc-4b; Sat, 07 Jan 2023 06:06:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pE71I-0005g6-VJ
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 06:06:06 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pE71F-0005mT-SP
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 06:05:47 -0500
Received: by mail-ej1-x631.google.com with SMTP id tz12so8853749ejc.9
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 03:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p8znfIc5uTd1Ou5iVaebPJV/Az3nHisy/UQuipCCwyg=;
 b=pqpQ25EjgFzgKfoRnFjp4IMjSfLb5H/CQhHcoDR5YRXx0SOr1BzR8t8EpmRE81BL+y
 0fiilZA4Bk9IEa39roFI0tL6WUtpsoPVtYCWDLw8uJeHLCd6s6UJjmcBXZdkkHISzxap
 wEyq9X0AuXWbDNZ2hti48n52SfyGxB00FYO+iOM62mykAeC/pMmJHfLhEcdihyxpPYeA
 jLuSjCv0+dzzl0tBD/9xKOCdERm1P10utZIxHMAU2EbzzTeICPQSfJWPrBjt8RjsuVRu
 xRfWnTSjBzUPeFB0HyrfDh9bESZN0jwLXfIiZ9p9Qr/eoO0qypGzTEAaOqbPevWY5MrS
 UWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p8znfIc5uTd1Ou5iVaebPJV/Az3nHisy/UQuipCCwyg=;
 b=mU0cVqVx4NxDW5wDucwFSJ4dZ8lvbIetpPE+RhnVIXHIDR3ao1IQbBgXRujchUPii6
 5epzDD+nwLvYxLj2VuLXaDyQf6BXatfvUXzYbnB+YQIWuO1qJYHdTpkYiPiUAv4luxXu
 /es0ewIiKx+gQ9yF2+Yo/evlQS12bj9J2Q/fshEU1+/45qGpkoF7JhGtih1GRONxgICw
 teS/OFddC36aL4w6yq0Q2BPl7TuxHlAQblOzb+EGmua35k/7qee8oXfnGdcXJQf7uCGa
 64Cr37nR4c9lRkafVuYiCI+/BqtTC/OghDM18sGgGOVuUcWt+wcsbrVMDg9MInn8ipWt
 Pu0A==
X-Gm-Message-State: AFqh2koujGQAkAX4osnkWuK2HQ+RCicdKmwq2j2VQKiGXdM+OcUVTxJe
 Q3incEuoY4taoTcVH0RHerM=
X-Google-Smtp-Source: AMrXdXu3EvFsoaT/hHNtPJ6LgsuygrkUQxHjYjz32DZvgWWafo+QGIRF9hiULkUfK0ut69Re1Wwjvw==
X-Received: by 2002:a17:906:883:b0:84d:134a:2076 with SMTP id
 n3-20020a170906088300b0084d134a2076mr7280855eje.44.1673089528882; 
 Sat, 07 Jan 2023 03:05:28 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200f901f42a62c21174.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:f901:f42a:62c2:1174])
 by smtp.gmail.com with ESMTPSA id
 kw16-20020a170907771000b007adf2e4c6f7sm1310121ejc.195.2023.01.07.03.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Jan 2023 03:05:28 -0800 (PST)
Date: Sat, 07 Jan 2023 11:05:20 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Chuck Zmudzinski <brchuckz@aol.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
CC: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_6/6=5D_hw/isa/piix=3A_Res?=
 =?US-ASCII?Q?olve_redundant_TYPE=5FPIIX3=5FXEN=5FDEVICE?=
In-Reply-To: <00ff4875-62e0-05c8-a13e-5a52d4195cc2@aol.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
 <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org>
 <B207F213-3B7B-4E0A-A87E-DE53CD351647@gmail.com>
 <6a1a6ed8-568d-c08b-91a7-1093a2b25929@linaro.org>
 <d9e2f616-d3bf-fc6c-2dc5-a0bf53148632@aol.com>
 <30337c62-a938-61c8-3ae5-092dbccf6302@aol.com>
 <00ff4875-62e0-05c8-a13e-5a52d4195cc2@aol.com>
Message-ID: <01A7F932-0DF1-4977-A111-0907A7FC6FF9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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



Am 7=2E Januar 2023 01:08:46 UTC schrieb Chuck Zmudzinski <brchuckz@aol=2E=
com>:
>On 1/6/23 6:04=E2=80=AFPM, Chuck Zmudzinski wrote:
>> On 1/6/23 2:08=E2=80=AFPM, Chuck Zmudzinski wrote:
>>> On 1/6/23 7:25=E2=80=AFAM, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> On 6/1/23 12:57, Bernhard Beschow wrote:
>>>>>=20
>>>>>=20
>>>>> Am 4=2E Januar 2023 15:35:33 UTC schrieb "Philippe Mathieu-Daud=C3=
=A9" <philmd@linaro=2Eorg>:
>>>>>> +Markus/Thomas
>>>>>>
>>>>>> On 4/1/23 15:44, Bernhard Beschow wrote:
>>>>>>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone=
 of
>>>>>>> TYPE_PIIX3_DEVICE=2E Remove this redundancy=2E
>>>>>>>
>>>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>>>>> ---
>>>>>>>    hw/i386/pc_piix=2Ec             |  4 +---
>>>>>>>    hw/isa/piix=2Ec                 | 20 --------------------
>>>>>>>    include/hw/southbridge/piix=2Eh |  1 -
>>>>>>>    3 files changed, 1 insertion(+), 24 deletions(-)
>>>>=20
>>>>=20
>>>>>>>    -static void piix3_xen_class_init(ObjectClass *klass, void *dat=
a)
>>>>>>> -{
>>>>>>> -    DeviceClass *dc =3D DEVICE_CLASS(klass);
>>>>>>> -    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>>>>>>> -
>>>>>>> -    k->realize =3D piix3_realize;
>>>>>>> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
>>>>>>> -    k->device_id =3D PCI_DEVICE_ID_INTEL_82371SB_0;
>>>>>>> -    dc->vmsd =3D &vmstate_piix3;
>>>>>>
>>>>>> IIUC, since this device is user-creatable, we can't simply remove i=
t
>>>>>> without going thru the deprecation process=2E
>>>>>=20
>>>>> AFAICS this device is actually not user-creatable since dc->user_cre=
atable is set to false once in the base class=2E I think it is safe to remo=
ve the Xen class unless there are ABI issues=2E
>>>> Great news!
>>>=20
>>> I don't know if this means the device is user-creatable:
>>>=20
>>> chuckz@bullseye:~$ qemu-system-i386 -device piix3-ide-xen,help
>>> piix3-ide-xen options:
>>>   addr=3D<int32>           - Slot and optional function number, exampl=
e: 06=2E0 or 06 (default: -1)
>>>   failover_pair_id=3D<str>
>>>   multifunction=3D<bool>   - on/off (default: false)
>>>   rombar=3D<uint32>        -  (default: 1)
>>>   romfile=3D<str>
>>>   x-pcie-extcap-init=3D<bool> - on/off (default: true)
>>>   x-pcie-lnksta-dllla=3D<bool> - on/off (default: true)
>>>=20
>>> Today I am running qemu-5=2E2 on Debian 11, so this output is for
>>> qemu 5=2E2, and that version of qemu has a piix3-ide-xen device=2E
>>> Is that this same device that is being removed? If so, it seems to
>>> me that at least as of qemu 5=2E2, the device was user-creatable=2E
>>>=20
>>> Chuck
>>=20
>> Good news! It looks the device was removed as user-creatable since vers=
ion 5=2E2:
>>=20
>> chuckz@debian:~$ qemu-system-i386-7=2E50 -device help | grep piix
>> name "piix3-usb-uhci", bus PCI
>> name "piix4-usb-uhci", bus PCI
>> name "piix3-ide", bus PCI
>> name "piix4-ide", bus PCI
>> chuckz@debian:~$ qemu-system-i386-7=2E50-bernhard-v2 -device help | gre=
p piix
>> name "piix3-usb-uhci", bus PCI
>> name "piix4-usb-uhci", bus PCI
>> name "piix3-ide", bus PCI
>> name "piix4-ide", bus PCI
>> chuckz@debian:~$
>>=20
>> The piix3-ide-xen device is not present either with or without Bernhard=
's patches
>> for current qemu 7=2E50, the development version for qemu 8=2E0
>>=20
>> Cheers,
>>=20
>> Chuck
>
>
>I traced where the pciix3-ide-xen device was removed:
>
>It was 7851b21a81 (hw/ide/piix: Remove redundant "piix3-ide-xen" device c=
lass)
>
>https://gitlab=2Ecom/qemu-project/qemu/-/commit/7851b21a8192750adecbcf6e8=
780a20de5891ad6
>
>about six months ago=2E That was between 7=2E0 and 7=2E1=2E So the device=
 being removed
>here is definitely not user-creatable, but it appears that this piix3-ide=
-xen
>device that was removed between 7=2E0 and 7=2E1 was user-creatable=2E Doe=
s that one
>need to go through the deprecation process? Or, since no one has complain=
ed
>it is gone, maybe we don't need to worry about it?

Good point! Looks like it fell through the cracks=2E=2E=2E

There are voices who claim that this device and its non-Xen counterpart sh=
ould have never been user-creatable in the firtst place:
https://patchwork=2Ekernel=2Eorg/project/qemu-devel/patch/20190718091740=
=2E6834-1-philmd@redhat=2Ecom/

Best regards,
Bernhard

>
>Cheers,
>
>Chuck

