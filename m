Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8006067FFA2
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 15:55:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM95T-0001KF-PB; Sun, 29 Jan 2023 09:55:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pM95R-0001IL-IA
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 09:55:17 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pM95P-0008K7-UM
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 09:55:17 -0500
Received: by mail-ej1-x62c.google.com with SMTP id me3so25319908ejb.7
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 06:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=13gpJIpQD2t94rlJeF5rntF2GdZtUh4oEskYuXuLdno=;
 b=FxJMcKubLQl9FCLrkTMHUBE8HNoNpN5wKk+J+cSzcK+AQpmG6JGPe9FnWDUYopH5uK
 l6vqKQ0iRl/FcZVrSrktJM93g+SZepIpcFNBBrDaIuNtHMbr93tk1bk8xw/ytRl9v8Zo
 1nR7826sLZ/9+egySXNDFINZwb6KJf4ZdUTD0YOtpi5lPEJVoLFikHjsv/2u4tZn28KY
 2eGt1uilYwXl6FC205zp7/P9k7fOES2W4qAC+zgck7k8fO1laaZ6XqvQdHWbW4YFOuB5
 pDgoovr53pCEzljctWxfp2QJiRgTuUIOiDbuWsgISx9A150M9LRTHG61zZYIxwyL0bz8
 0EyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=13gpJIpQD2t94rlJeF5rntF2GdZtUh4oEskYuXuLdno=;
 b=dfYrgdLmUoqdWZ/T2gihmo4j2E74mjdCduk3z0Ddik/evpbu4+ADRxtS+8iXq8LXhU
 QDsG69NUB8ELfZNG95VhV7QiNG44jtTTGlBVD7AipegtUT+Y75HkMuCV699HFf/BYYZY
 jwkFD6El+1y9lU4Lou6aqRQpZ7WYWPRwIxglUamZ735DLJ3kKVxcSImiIsyu/StW4Vt5
 urfUKz/PIK9X4Xx+u3dDPpXVjEF72/CeniBCei+EZSpq2g05MlACaICVMnnTkWbVqHuG
 U41vsrhSMzVqC8Wkbs5WiZLflH4+Zbml5EtLFP6GMMLF6VuuPCQZ6rKwuNxHmoyhIjcx
 F1Kw==
X-Gm-Message-State: AFqh2kqMd2mcByUQ32wK+BZNPyuz4pk7ayc0Y1yREUFNo7S7Qtj/ecHG
 sTqVKeG1CbxoO2dsjr7x2jw=
X-Google-Smtp-Source: AMrXdXtE8FrXbVaZL/aFrLwa8AWNZBYWMnZL7GNOu4wOsZM6A/6TElPVAlskn8+xfP1CeGfJxJpp6A==
X-Received: by 2002:a17:907:88cd:b0:86e:4067:b6a1 with SMTP id
 rq13-20020a17090788cd00b0086e4067b6a1mr54536567ejc.10.1675004114591; 
 Sun, 29 Jan 2023 06:55:14 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf1ccd00356163aca05dbb0c.dip0.t-ipconnect.de.
 [2003:fa:af1c:cd00:3561:63ac:a05d:bb0c])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a170906784e00b0084d34eec68esm5437113ejm.213.2023.01.29.06.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jan 2023 06:55:14 -0800 (PST)
Date: Sun, 29 Jan 2023 14:55:06 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
CC: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 5/7] hw/acpi/piix4: Fix offset of GPE0 registers
In-Reply-To: <20230125165501.00672bc0@imammedo.users.ipa.redhat.com>
References: <20230122170724.21868-1-shentey@gmail.com>
 <20230122170724.21868-6-shentey@gmail.com>
 <20230125165501.00672bc0@imammedo.users.ipa.redhat.com>
Message-ID: <BC12A842-2845-49DE-B88D-C5A1009BBD80@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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



Am 25=2E Januar 2023 15:55:01 UTC schrieb Igor Mammedov <imammedo@redhat=
=2Ecom>:
>On Sun, 22 Jan 2023 18:07:22 +0100
>Bernhard Beschow <shentey@gmail=2Ecom> wrote:
>
>> The PIIX4 datasheet defines the GPSTS register to be at offset 0x0c of =
the
>> power management I/O register block=2E This register block is represent=
ed
>> in the device model by the io attribute=2E So make io_gpe a child memor=
y
>> region of io at offset 0x0c=2E
>
>to what end?
>
>> Note that SeaBIOS sets the base address of the register block to 0x600,
>> resulting in the io_gpe block to start at 0x60c=2E GPE_BASE is defined =
as
>> 0xafe0 which is 0xa9d4 bytes off=2E In order to preserve compatibilty,
>> create an io_gpe_qemu memory region alias at GPE_BASE=2E
>
>qemu's io_gpe !=3D piix4(GPSTS)
>QEMU simply doesn't implement piix4(GPSTS), instead it has implemented
>custom GPE registers block at 0xafe0 for its hotplug purposes=2E
>Bits in both GPE blocks have different meaning,
>so moving io_gpe to PMBASE+0x0c, would be a bug=2E
>
>Interesting question is what guest gets now when it reads
>PMBASE+0x0c ?
>
>If reads return -1 and guest uses these
>registers it might get confused since all STS/EN bits
>are set and writes are ignored=2E We likely get away
>with it since these registers aren't used by non ACPI guests
>(non x86 ones) and x86 ones fetch GPE block from FADT
>table =3D> not using piix4(GPSTS) at all=2E
>So It's a bug to fix (at least make it read as 0s)

I see=2E This wasn't obvious to me and I'll drop this patch=2E

How about renaming io_gpe to something communicating that this is purely a=
 "Frankenstein" functionality, e=2Eg=2E to io_gpe_qemu or io_gpe_hotplug? A=
ny preferences?

>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  include/hw/acpi/piix4=2Eh | 1 +
>>  hw/acpi/piix4=2Ec         | 9 +++++++--
>>  2 files changed, 8 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/include/hw/acpi/piix4=2Eh b/include/hw/acpi/piix4=2Eh
>> index 62e1925a1f=2E=2E4e6cad9e8c 100644
>> --- a/include/hw/acpi/piix4=2Eh
>> +++ b/include/hw/acpi/piix4=2Eh
>> @@ -40,6 +40,7 @@ struct PIIX4PMState {
>> =20
>>      MemoryRegion io;
>>      MemoryRegion io_gpe;
>> +    MemoryRegion io_gpe_qemu;
>>      ACPIREGS ar;
>> =20
>>      APMState apm;
>> diff --git a/hw/acpi/piix4=2Ec b/hw/acpi/piix4=2Ec
>> index 2e9bc63fca=2E=2E836f9026b1 100644
>> --- a/hw/acpi/piix4=2Ec
>> +++ b/hw/acpi/piix4=2Ec
>> @@ -49,6 +49,7 @@
>>  #include "qom/object=2Eh"
>> =20
>>  #define GPE_BASE 0xafe0
>> +#define GPE_OFS 0xc
>>  #define GPE_LEN 4
>> =20
>>  #define ACPI_PCIHP_ADDR_PIIX4 0xae00
>> @@ -429,7 +430,7 @@ static void piix4_pm_add_properties(PIIX4PMState *s=
)
>>      object_property_add_uint8_ptr(OBJECT(s), ACPI_PM_PROP_ACPI_DISABLE=
_CMD,
>>                                    &acpi_disable_cmd, OBJ_PROP_FLAG_REA=
D);
>>      object_property_add_uint64_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK,
>> -                                   &s->io_gpe=2Eaddr, OBJ_PROP_FLAG_RE=
AD);
>> +                                   &s->io_gpe_qemu=2Eaddr, OBJ_PROP_FL=
AG_READ);
>>      object_property_add_uint8_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK_LEN=
,
>>                                    &s->ar=2Egpe=2Elen, OBJ_PROP_FLAG_RE=
AD);
>>      object_property_add_uint16_ptr(OBJECT(s), ACPI_PM_PROP_SCI_INT,
>> @@ -558,7 +559,11 @@ static void piix4_acpi_system_hot_add_init(MemoryR=
egion *parent,
>>  {
>>      memory_region_init_io(&s->io_gpe, OBJECT(s), &piix4_gpe_ops, s,
>>                            "acpi-gpe0", GPE_LEN);
>> -    memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe);
>> +    memory_region_add_subregion(&s->io, GPE_OFS, &s->io_gpe);
>> +
>> +    memory_region_init_alias(&s->io_gpe_qemu, OBJECT(s), "acpi-gpe0-qe=
mu",
>> +                             &s->io_gpe, 0, memory_region_size(&s->io_=
gpe));
>> +    memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe_qemu);
>> =20
>>      if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
>>          acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
>

