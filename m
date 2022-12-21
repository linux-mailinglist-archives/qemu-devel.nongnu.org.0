Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD1A6539A0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 00:15:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p88HZ-0008Hm-Se; Wed, 21 Dec 2022 18:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p88HX-0008HP-E7; Wed, 21 Dec 2022 18:13:51 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p88HU-0006aB-Ig; Wed, 21 Dec 2022 18:13:51 -0500
Received: by mail-ej1-x631.google.com with SMTP id qk9so1095434ejc.3;
 Wed, 21 Dec 2022 15:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JbUSAbX+r7mXkVfusUjUGiqbFiEA6iMQZrAXUYVPB28=;
 b=YOV3QJFdmDOUCztawysPcVyWMXHenXDOkE6NjA0ndleYwY2fAkYXTZSqy+RSUI1AXy
 o9djkozupA9k2z304NWPYrvGWIuxtkU/LA9PSe30bydR6IO3uAF5ax6GfkIbkGoHVZ5S
 d7NAf+njfY4SbVoqr3h19JdfIuIh2pfC6d+njqvxRZpw9Bx3pxgW//UVImKwCIhR+cOb
 iJpROHjOWH4zOYPE3Z65QBUxA1CxhzXLjvN/G2hmRbHuJ7YLxPIkpwHh3KoDzFFzF5Js
 bk45HHFK5ITGz4WtRXkSTPKwTXM/xFZjt9vOLuih7fVEkM/V4H5PPVRlq3I00L84SlcN
 1h7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JbUSAbX+r7mXkVfusUjUGiqbFiEA6iMQZrAXUYVPB28=;
 b=huBA9ogZ0rJ5VZczYdteRzetPwEGswdSNFioYvQtuFFXTcr/UbHp1lageetZIeaPRF
 fpIMkRczFNtod4BbgC9gLbAiyKHGLTNB91vwItQv/FAY6BQ79X2PNaGtOsSe1CUh8bs3
 Ih3hb93gKihMqLNkVy07vCAMhlk3g+QYhQ65CHcPkEPm9BNA54RUD5SEiLuschGjfM6o
 +PHq5jZ6oe1abjjzQaoNFaC5c2w5gwxZovooVsJJCOOS0xcnjJTAA+2puoMod5fnjmxZ
 XZqGoQ3xBWV/e6EKsVgaHDvbTjbMl4cHbNVxjGxTG/stAKGt2TT7Eq7HcOSJpfljO/0c
 MgDQ==
X-Gm-Message-State: AFqh2kokhX94VyhqppPGD2VQWKiKYZnD18L7gomZMm3d+N6zibMDTlfP
 nFMHOeRYw7zxDmrLLez2BGg=
X-Google-Smtp-Source: AMrXdXtkhYOXrOuMoTAtTX7R29tRmr87xmyxfn3PT1zkjztEHvjXj1IX37CQLL2ZzjtjO2nHbpU7vA==
X-Received: by 2002:a17:906:a186:b0:82d:e2a6:4b0d with SMTP id
 s6-20020a170906a18600b0082de2a64b0dmr3118010ejy.18.1671664426030; 
 Wed, 21 Dec 2022 15:13:46 -0800 (PST)
Received: from [127.0.0.1] (dynamic-092-224-051-061.92.224.pool.telefonica.de.
 [92.224.51.61]) by smtp.gmail.com with ESMTPSA id
 g19-20020a170906539300b007c0efbaa8a0sm7669609ejo.4.2022.12.21.15.13.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 15:13:45 -0800 (PST)
Date: Wed, 21 Dec 2022 23:13:35 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_00/30=5D_This_series_consolidates_t?=
 =?US-ASCII?Q?he_implementations_of_the_PIIX3_and_PIIX4_south?=
In-Reply-To: <f4d9fd97-a986-d212-5cf5-332e831ee337@linaro.org>
References: <20221221170003.2929-1-shentey@gmail.com>
 <f4d9fd97-a986-d212-5cf5-332e831ee337@linaro.org>
Message-ID: <DBC3D87B-7F66-4A83-BF1D-D67A66A06CF8@gmail.com>
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



Am 21=2E Dezember 2022 19:15:04 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>On 21/12/22 17:59, Bernhard Beschow wrote:
>> code as possible and to bring both device models to feature parity such=
 that
>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc mach=
ine=2E This
>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on=
 this
>> list before=2E
>>=20
>> The series is structured as follows: First, PIIX3 is changed to instant=
iate
>> internal devices itself, like PIIX4 does already=2E Second, PIIX3 gets =
prepared
>> for the merge with PIIX4 which includes some fixes, cleanups, and renam=
ings=2E
>> Third, the same is done for PIIX4=2E In step four the implementations a=
re merged=2E
>> Since some consolidations could be done easier with merged implementati=
ons, the
>> consolidation continues in step five which concludes the series=2E
>>=20
>> One particular challenge in this series was that the PIC of PIIX3 used =
to be
>> instantiated outside of the south bridge while some sub functions requi=
re a PIC
>> with populated qemu_irqs=2E This has been solved by introducing a proxy=
 PIC which
>> furthermore allows PIIX3 to be agnostic towards the virtualization tech=
nology
>> used (KVM, TCG, Xen)=2E Due to consolidation PIIX4 gained the proxy PIC=
 as well=2E
>>=20
>> Another challenge was dealing with optional devices where Peter already=
 gave
>> advice in [1] which this series implements=2E
>>=20
>> Last but not least there might be some opportunity to consolidate VM st=
ate
>> handling, probably by reusing the one from PIIX3=2E Since I'm not very =
familiar
>> with the requirements I didn't touch it so far=2E
>>=20
>> v4:
>> - Rebase onto "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south =
bridges"
>>    since it is already queued via mips-next=2E This eliminates patches
>>    'hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"' and 'hw/isa=
/piix4:
>>    Prefix pci_slot_get_pirq() with "piix4_"'=2E
>> - Squash 'hw/isa/piix: Drop the "3" from the PIIX base class' into
>>    'hw/isa/piix3: Rename typedef PIIX3State to PIIXState'=2E I original=
ly only
>>    split these patches since I wasn't sure whether renaming a type was =
allowed=2E
>> - Add new patch 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as P=
CI bus is
>>    created' for forther cleanup of INTx-to-LNKx route decoupling=2E
>
>Sigh I did the rebase this morning and was waiting for the test suite=2E=
=2E=2E
>https://gitlab=2Ecom/philmd/qemu/-/commits/mips-testing/

Hmm, I'm a little confused=2E I thought to do the rebase myself in order t=
o help which I announced yesterday=2E

AFAICS the nanoMIPS bootloader still needs to be adapted before this serie=
s can be queued and tested=2E Let me know if I could help=2E

>Anyway I'll double-check with this series=2E

Thank you!

Best regards,
Bernhard

