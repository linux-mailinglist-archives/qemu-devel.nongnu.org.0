Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BA866A0FB
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:45:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGO0G-000605-Jy; Fri, 13 Jan 2023 12:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pGO01-0005cx-IV; Fri, 13 Jan 2023 12:37:59 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pGNzz-0006FE-PJ; Fri, 13 Jan 2023 12:37:53 -0500
Received: by mail-ej1-x633.google.com with SMTP id u9so53984034ejo.0;
 Fri, 13 Jan 2023 09:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GDy8bJ/Gv2qqj+xAOHoFWy6kzv9BYh/XQshZdn4QF+s=;
 b=IU016H8Gb6vz4jht0eC/NwvtnV91l/Wi+xAOLwFOlmPXvTnxyNzWKfwG4zoOgib3k8
 QfcwAbybjyduKtZl1k03JII5cLpVIGCIr/ohj2Tp3XqW5hXixuHAz3QAtqBHt4ungRVP
 BhrbGlnZdGnp4jv+TGo/FLmJ1MtrwbZiO7TuEcal09/fLCmUcaD0vcm37zaAcW1yksu2
 WT07wvFsp9RM1x+Gerzhojb5QIWJZIxnwWf1XXkifFRkFQdFjpWVz4SYB+/GsEb4SQcB
 KT4xLXsxJv56EXVrnAX6WDqSeal++gVfl07JUfTZYEW8sgK/W+K98wUR97zO+HMXw7a8
 IyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GDy8bJ/Gv2qqj+xAOHoFWy6kzv9BYh/XQshZdn4QF+s=;
 b=cSB/5SSXlZwEG5MjZdWUyqaUeowfeYH8IhDHaSmc4bzPuNd3wT3GWyMWdo0AbRESms
 MCzc+qHAH5kpLPD86vNsEhfkM0euvCG1HRCyUa3KDWlgiEvI5L2gqYs3G82EgvANKt2d
 fvUo+AGJFXHvuq0bNGTQYO67Vg4NnAzZUK6gqkYm/uhn2HtxuaV4ybdlinDYcDxv9yoA
 RTmvBYakIX8UEzheO0j+dGSnbm9Sw47pCV/ht7W4ryc7rr47rs08jaGf7OoZARCqPdun
 nUvFoiuH3vh/gxk8WnYfxHp1kCMUYG3xbm0YyJoSFItGMV76w1JSfxrQnRRnuok8JNms
 C0Yw==
X-Gm-Message-State: AFqh2kpMg97N1JX03kZ/lvdvBfYc5wpVd/KifneKdT7pfwxkdvn8iLFc
 Hdd3FiIjbhpMRK41fLYcNQU=
X-Google-Smtp-Source: AMrXdXtKHxZEuyAdWNHHUHcElOdnm24bqRKiXUJgxXX2pKtXC2XXSU5nfAd+SM6hOU7dnpMlxwSBVw==
X-Received: by 2002:a17:907:7b88:b0:84d:465f:d2fe with SMTP id
 ne8-20020a1709077b8800b0084d465fd2femr18102339ejc.41.1673631468883; 
 Fri, 13 Jan 2023 09:37:48 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-135-037.89.12.pool.telefonica.de.
 [89.12.135.37]) by smtp.gmail.com with ESMTPSA id
 u1-20020a1709061da100b0086b7ffb3b92sm509900ejh.205.2023.01.13.09.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 09:37:48 -0800 (PST)
Date: Fri, 13 Jan 2023 17:37:39 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_04/33=5D_hw/pci/pci=3A_Factor_o?=
 =?US-ASCII?Q?ut_pci=5Fbus=5Fmap=5Firqs=28=29_from_pci=5Fbus=5Firqs=28=29?=
In-Reply-To: <0b7cf41c-6fca-f8d9-e8c2-0a1cfea2c51e@linaro.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-5-shentey@gmail.com>
 <0b7cf41c-6fca-f8d9-e8c2-0a1cfea2c51e@linaro.org>
Message-ID: <4D077DB6-9595-4487-ACCE-84CFB1D73AC1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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



Am 13=2E Januar 2023 10:13:29 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>On 9/1/23 18:23, Bernhard Beschow wrote:
>> pci_bus_irqs() coupled together the assignment of pci_set_irq_fn and
>> pci_map_irq_fn to a PCI bus=2E This coupling gets in the way when the
>> pci_map_irq_fn is board-specific while the pci_set_irq_fn is device-
>> specific=2E
>>=20
>> For example, both of QEMU's PIIX south bridge models have different
>> pci_map_irq_fn implementations which are board-specific rather than
>> device-specific=2E These implementations should therefore reside in boa=
rd
>> code=2E The pci_set_irq_fn's, however, should stay in the device models
>> because they access memory internal to the model=2E
>>=20
>> Factoring out pci_bus_map_irqs() from pci_bus_irqs() allows the
>> assignments to be decoupled, resolving the problem described above=2E
>>=20
>> Note also how pci_vpb_realize() which gets touched in this commit
>> assigns different pci_map_irq_fn's depending on the board=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>> ---
>>   include/hw/pci/pci=2Eh    |  3 ++-
>>   hw/i386/pc_q35=2Ec        |  4 ++--
>>   hw/isa/piix3=2Ec          |  8 ++++----
>>   hw/isa/piix4=2Ec          |  3 ++-
>>   hw/pci-host/raven=2Ec     |  3 ++-
>>   hw/pci-host/versatile=2Ec |  3 ++-
>>   hw/pci/pci=2Ec            | 12 +++++++++---
>>   hw/remote/machine=2Ec     |  3 ++-
>>   8 files changed, 25 insertions(+), 14 deletions(-)
>>=20
>> diff --git a/include/hw/pci/pci=2Eh b/include/hw/pci/pci=2Eh
>> index 7048a373d1=2E=2E85ee458cd2 100644
>> --- a/include/hw/pci/pci=2Eh
>> +++ b/include/hw/pci/pci=2Eh
>> @@ -282,8 +282,9 @@ PCIBus *pci_root_bus_new(DeviceState *parent, const=
 char *name,
>>                            MemoryRegion *address_space_io,
>>                            uint8_t devfn_min, const char *typename);
>>   void pci_root_bus_cleanup(PCIBus *bus);
>> -void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq, pci_map_irq_fn =
map_irq,
>> +void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
>>                     void *irq_opaque, int nirq);
>> +void pci_bus_map_irqs(PCIBus *bus, pci_map_irq_fn map_irq);
>
>I'm squashing:
>
>-- >8 --
>diff --git a/hw/remote/vfio-user-obj=2Ec b/hw/remote/vfio-user-obj=2Ec
>index fe1fdfb5f7=2E=2E46171f22f7 100644
>--- a/hw/remote/vfio-user-obj=2Ec
>+++ b/hw/remote/vfio-user-obj=2Ec
>@@ -667,4 +667,4 @@ void vfu_object_set_bus_irq(PCIBus *pci_bus)
>
>-    pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, pci_bu=
s,
>-                 max_bdf);
>+    pci_bus_irqs(pci_bus, vfu_object_set_irq, , pci_bus, max_bdf);
>+    pci_bus_map_irqs(pci_bus, vfu_object_map_irq);
> }
>---
>
>to fix:
>
>=2E=2E/hw/remote/vfio-user-obj=2Ec: In function =E2=80=98vfu_object_set_b=
us_irq=E2=80=99:
>=2E=2E/hw/remote/vfio-user-obj=2Ec:668:67: error: passing argument 4 of =
=E2=80=98pci_bus_irqs=E2=80=99 makes integer from pointer without a cast [-=
Werror=3Dint-conversion]
>     pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, pci_bu=
s,
>                                                                   ^~~~~~=
~
>In file included from include/hw/pci/pci_device=2Eh:4,
>                 from include/hw/remote/iohub=2Eh:14,
>                 from include/hw/remote/machine=2Eh:18,
>                 from =2E=2E/hw/remote/vfio-user-obj=2Ec:43:
>include/hw/pci/pci=2Eh:286:41: note: expected =E2=80=98int=E2=80=99 but a=
rgument is of type =E2=80=98PCIBus *=E2=80=99 {aka =E2=80=98struct PCIBus *=
=E2=80=99}
>                   void *irq_opaque, int nirq);
>                                     ~~~~^~~~
>=2E=2E/hw/remote/vfio-user-obj=2Ec:668:5: error: too many arguments to fu=
nction =E2=80=98pci_bus_irqs=E2=80=99
>     pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, pci_bu=
s,
>     ^~~~~~~~~~~~
>In file included from include/hw/pci/pci_device=2Eh:4,
>                 from include/hw/remote/iohub=2Eh:14,
>                 from include/hw/remote/machine=2Eh:18,
>                 from =2E=2E/hw/remote/vfio-user-obj=2Ec:43:
>include/hw/pci/pci=2Eh:285:6: note: declared here
> void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
>      ^~~~~~~~~~~~
>

Thanks!

I've missed enabling vfio-user-server for my builds=2E Fixed now=2E

Best regards,
Bernhard

