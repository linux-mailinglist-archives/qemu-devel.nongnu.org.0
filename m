Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1D167FFD8
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 16:21:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM9T4-0006nN-9k; Sun, 29 Jan 2023 10:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pM9T1-0006n3-Cv
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 10:19:39 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pM9Sz-0003CX-F5
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 10:19:39 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso3731703wms.4
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 07:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b0ym8vRYaEiD907yVifF/b/H//U/EDJDT09zptJpR1w=;
 b=AlP3JCjIZYzFOp5HZU1Xcem4GR6xGjc1s9Ig/Jo+bbW1PARCj1BNSY6d59rjq1qAWE
 ny23GNKmSk+R1ILiSb2wKQ0qESz66iKiT28hOuAYVeX10M1eUNTNKyca0Ds/GO6PLLCs
 4lCWm0oWvdVjgssO2tCr1QkhcStJ4AnGU/3i1YwH14rQ0NaRr5yc6M7axvS4OfI73gm0
 IXuvdfvvTkfO9e+nk/5mmEl21jH0C136jgFhUjTE3rTRADu9rRTdIe1IGgZ1pLD+Jakb
 uCrMFMksU4s7YtVtnmlFeZgxZfkKQpKJpAR6DtevakorYSnK1TA79fPJKlkYCcdy2W31
 sUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b0ym8vRYaEiD907yVifF/b/H//U/EDJDT09zptJpR1w=;
 b=5pLkDMvMlhTg1pIJZbO0AlJKjGuzt4OIOceRZHWmXZyDkURI0XlmBKLYfou3HxkvMx
 h+/PiHp/P1DLjNUqExDBh02By3T/C/J7PbsFjuWxXtQ2nmlbzc5xoaHwblhddBh9HMeD
 cWTXaBptiBAxXrJUUEF510Ma3PcYWiYMosw69AvYh/8bSc6tFoHjMmvKJVIXNm7kIE6K
 28CnR7KSm4ie67WcatOsh1mUXEcZtcGsHbhkzJUK96NtPUZiYSOt9wW6lKdEhLwkK10B
 NCcveX2E3z8za9qpYAtqSlZY5A73TAVjCAK6wkgFuHomcbZx7039uxGyG1Of+IbI8ieK
 ZCJw==
X-Gm-Message-State: AFqh2kozA+GaG8Z5DgXNhfGfl2zcXkU+IoRn4YRM1IgL2MbSuJYrk+i4
 r0XzagCgSYLn8IsGiobnEFA=
X-Google-Smtp-Source: AMrXdXuPhPMUDfKAzUdipXsIDkBcfFbVcqALzKaEttw0V2eRlYRMmuJIzuvaWTVj3+i56fVHy2U/GA==
X-Received: by 2002:a05:600c:3d16:b0:3cf:8b22:76b3 with SMTP id
 bh22-20020a05600c3d1600b003cf8b2276b3mr44322850wmb.0.1675005574658; 
 Sun, 29 Jan 2023 07:19:34 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf1ccd00356163aca05dbb0c.dip0.t-ipconnect.de.
 [2003:fa:af1c:cd00:3561:63ac:a05d:bb0c])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a7bcbd8000000b003daf7721bb3sm12865105wmi.12.2023.01.29.07.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jan 2023 07:19:34 -0800 (PST)
Date: Sun, 29 Jan 2023 15:19:26 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_3/7=5D_hw/acpi/=7Bich9=2Cpiix4=7D=3A_Res?=
 =?US-ASCII?Q?olve_redundant_io=5Fbase_address_attributes?=
In-Reply-To: <20230124170540.3995c49c@imammedo.users.ipa.redhat.com>
References: <20230122170724.21868-1-shentey@gmail.com>
 <20230122170724.21868-4-shentey@gmail.com>
 <c38c9c94-b629-0cdd-acd9-ac800ff9da8d@linaro.org>
 <8BFD0F5A-088F-4A17-8998-E9C618558FF6@gmail.com>
 <20230124170540.3995c49c@imammedo.users.ipa.redhat.com>
Message-ID: <978563FA-EA0E-4597-BBF4-2C7BB8C3AAD7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x329.google.com
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



Am 24=2E Januar 2023 16:05:40 UTC schrieb Igor Mammedov <imammedo@redhat=
=2Ecom>:
>s/resolve/remove|drop/
>
>On Mon, 23 Jan 2023 15:49:29 +0000
>Bernhard Beschow <shentey@gmail=2Ecom> wrote:
>
>> Am 23=2E Januar 2023 07:57:08 UTC schrieb "Philippe Mathieu-Daud=C3=A9"=
 <philmd@linaro=2Eorg>:
>> >Hi Bernhard,
>> >
>> >On 22/1/23 18:07, Bernhard Beschow wrote: =20
>> >> A MemoryRegion has an addr attribute which gets set to the same valu=
es
>> >> as the redundant io_addr attributes=2E
>
>
>MemoryRegion::addr is an offset within subregion while fields you
>are removing are absolute values (offset within address space)=2E
>
>Assuming that the former is the same as the later seems wrong
>to me (even if they both match at the moment)=2E
>So I'd drop this patch=2E

The device models try hard to keep those in sync=2E I'd rather avoid havin=
g two sources of truth, so I think there is merit in keeping this patch and=
 split it in two=2E

Note that in addition, the base addresses are also present in PCI config s=
pace which is yet another source of truth=2E The config space is preserved =
during migration, and I meanwhile noticed that the addresses are recovered =
from there=2E This makes the io_addr attributes seem even more redundant=2E

There is already a memory_region_to_absolute_addr() which would fit well h=
ere=2E It would need to be exported, and I wonder if it isn't for a reason?=
 Any thoughts?

>
>
>> >> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> >> ---
>> >>   include/hw/acpi/ich9=2Eh  |  1 -
>> >>   include/hw/acpi/piix4=2Eh |  2 --
>> >>   hw/acpi/ich9=2Ec          | 17 ++++++++---------
>> >>   hw/acpi/piix4=2Ec         | 11 ++++++-----
>> >>   4 files changed, 14 insertions(+), 17 deletions(-) =20
>> > =20
>> >> diff --git a/hw/acpi/piix4=2Ec b/hw/acpi/piix4=2Ec
>> >> index 370b34eacf=2E=2E2e9bc63fca 100644
>> >> --- a/hw/acpi/piix4=2Ec
>> >> +++ b/hw/acpi/piix4=2Ec
>> >> @@ -91,13 +91,14 @@ static void apm_ctrl_changed(uint32_t val, void =
*arg)
>> >>   static void pm_io_space_update(PIIX4PMState *s)
>> >>   {
>> >>       PCIDevice *d =3D PCI_DEVICE(s);
>> >> +    uint32_t io_base;
>> >>   -    s->io_base =3D le32_to_cpu(*(uint32_t *)(d->config + 0x40));
>> >> -    s->io_base &=3D 0xffc0;
>> >> +    io_base =3D le32_to_cpu(*(uint32_t *)(d->config + 0x40));
>> >> +    io_base &=3D 0xffc0;
>> >>         memory_region_transaction_begin();
>> >>       memory_region_set_enabled(&s->io, d->config[0x80] & 1);
>> >> -    memory_region_set_address(&s->io, s->io_base);
>> >> +    memory_region_set_address(&s->io, io_base); =20
>> >
>> >OK for this part=2E
>> > =20
>> >>       memory_region_transaction_commit();
>> >>   }
>> >>   @@ -433,8 +434,8 @@ static void piix4_pm_add_properties(PIIX4PMSta=
te *s)
>> >>                                     &s->ar=2Egpe=2Elen, OBJ_PROP_FLA=
G_READ);
>> >>       object_property_add_uint16_ptr(OBJECT(s), ACPI_PM_PROP_SCI_INT=
,
>> >>                                     &sci_int, OBJ_PROP_FLAG_READ);
>> >> -    object_property_add_uint32_ptr(OBJECT(s), ACPI_PM_PROP_PM_IO_BA=
SE,
>> >> -                                  &s->io_base, OBJ_PROP_FLAG_READ);
>> >> +    object_property_add_uint64_ptr(OBJECT(s), ACPI_PM_PROP_PM_IO_BA=
SE,
>> >> +                                   &s->io=2Eaddr, OBJ_PROP_FLAG_REA=
D); =20
>> >
>> >+Eduardo/Mark
>> >
>> >We shouldn't do that IMO, because we access an internal field from
>> >another QOM object=2E
>> >
>> >We can however alias the MR property:
>> >
>> >  object_property_add_alias(OBJECT(s), ACPI_PM_PROP_PM_IO_BASE,
>> >                            OBJECT(&s->io), "addr"); =20
>
>also, do not access 'io=2Eaddr' directly elsewhere in the patch either=2E
>
>>=20
>> Indeed! And the "addr" property is already read-only -- which seems lik=
e a good fit=2E
>>=20
>> > =20
>> >>   } =20
>>=20
>

