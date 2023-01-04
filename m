Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2AF65DD0F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 20:45:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD9hP-0000MD-QA; Wed, 04 Jan 2023 14:45:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pD9hK-0000Kj-F6
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 14:45:14 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pD9hI-0002jz-7G
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 14:45:13 -0500
Received: by mail-ej1-x636.google.com with SMTP id m18so84983835eji.5
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 11:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1kn+AYwd9lDHGXpUlw4WpNPWS0CBUeFg+5hmPOLLj2g=;
 b=fvw62VWCDMnjcXtA15FzvRRp64P3oNkuH/ZltE0KWoV3o5+NfP4Ep0LVLGB6BHpgz8
 2Es1/5ovPDWfohWdEir7Lop58w3KC26cxxW7sEFJ+B2G3/yy/h4scu0L3/FIKuox1XJd
 xLvm6xNx3sWjWoNGXqKJaeCSKnBQfv1haPzSX96eK78sKGQ30cH/WXUrw+ON92w5vn1v
 Z/IHW7X1e1HEZjzNyY9CJFsWR/2BRBjrsPP6sgAB/zJfWILsX8GUCR5Q/d+H4EoGauh5
 Px2Z0t6pzlXUdOEy9ObdXzVkC3QdPrGLGtwNo9YLG4bbkDjkb1L0WjI9fzb2tfshqP7C
 FoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1kn+AYwd9lDHGXpUlw4WpNPWS0CBUeFg+5hmPOLLj2g=;
 b=50koCkS0D7D+otSIOoUnbythGCRwFuJmXNpEEqAOGfhPJXaOao4pvhZb0hu0ZUb6SX
 kON1bqoAwnRS25S9orM3SOxHJ9UvnmospgMb277BHe/jt45GFET6WMUZkV2LjEOuUPtS
 knMozhQLyuN9Grq30YGTR6gpUM6RgrPQmhSBmThdZx9nQ7kvmAR4gLOjqK70ZJEVmzR6
 G5ZnUanVfOQ98IiT3LV1WISUT4WymT0UvLwJHRk9ztUUE7fRTLzXeF8AiXuFhl8oVx5s
 3gPGNPcHb02451SEUXQBv39N99dkcXZyuJZOCS+o2UTCxbFMabPFn0BYeBoayMcpzXa6
 nxqQ==
X-Gm-Message-State: AFqh2kodvTiW2NmWdY3S1+537f70U4er7zOFGhQ6gy3KbA6UiMJm6BKt
 oU9fAJCf/yDzWUMRN8MPz9I=
X-Google-Smtp-Source: AMrXdXu2tDDJFnRrl/d4WpCbxJux1PU03beEP+9otm5co6/WDkq8FqU81+yT4TaSGMFOmqXiN0FxFg==
X-Received: by 2002:a17:907:8b09:b0:7c0:e5c8:d439 with SMTP id
 sz9-20020a1709078b0900b007c0e5c8d439mr45326486ejc.3.1672861510655; 
 Wed, 04 Jan 2023 11:45:10 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb2008108eedf25879029.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:8108:eedf:2587:9029])
 by smtp.gmail.com with ESMTPSA id
 z27-20020a1709063a1b00b007aea1dc1840sm15719325eje.111.2023.01.04.11.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 11:45:10 -0800 (PST)
Date: Wed, 04 Jan 2023 19:45:04 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_6/6=5D_hw/isa/piix=3A_Res?=
 =?US-ASCII?Q?olve_redundant_TYPE=5FPIIX3=5FXEN=5FDEVICE?=
In-Reply-To: <30ed41ab-f7c9-15fb-8f4b-b2742b1d4188@aol.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
 <30ed41ab-f7c9-15fb-8f4b-b2742b1d4188@aol.com>
Message-ID: <E1080F7D-3441-4C82-9EA8-FB6B6AC317A0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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



Am 4=2E Januar 2023 16:42:43 UTC schrieb Chuck Zmudzinski <brchuckz@aol=2E=
com>:
>On 1/4/23 9:44=E2=80=AFAM, Bernhard Beschow wrote:
>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
>> TYPE_PIIX3_DEVICE=2E Remove this redundancy=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  hw/i386/pc_piix=2Ec             |  4 +---
>>  hw/isa/piix=2Ec                 | 20 --------------------
>>  include/hw/southbridge/piix=2Eh |  1 -
>>  3 files changed, 1 insertion(+), 24 deletions(-)
>>=20
>> diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>> index 5738d9cdca=2E=2E6b8de3d59d 100644
>> --- a/hw/i386/pc_piix=2Ec
>> +++ b/hw/i386/pc_piix=2Ec
>> @@ -235,8 +235,6 @@ static void pc_init1(MachineState *machine,
>>      if (pcmc->pci_enabled) {
>>          DeviceState *dev;
>>          PCIDevice *pci_dev;
>> -        const char *type =3D xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
>> -                                         : TYPE_PIIX3_DEVICE;
>>          int i;
>> =20
>>          pci_bus =3D i440fx_init(pci_type,
>> @@ -250,7 +248,7 @@ static void pc_init1(MachineState *machine,
>>                                         : pci_slot_get_pirq);
>>          pcms->bus =3D pci_bus;
>> =20
>> -        pci_dev =3D pci_new_multifunction(-1, true, type);
>> +        pci_dev =3D pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE)=
;
>>          object_property_set_bool(OBJECT(pci_dev), "has-usb",
>>                                   machine_usb(machine), &error_abort);
>>          object_property_set_bool(OBJECT(pci_dev), "has-acpi",
>> diff --git a/hw/isa/piix=2Ec b/hw/isa/piix=2Ec
>> index 98e9b12661=2E=2Ee4587352c9 100644
>> --- a/hw/isa/piix=2Ec
>> +++ b/hw/isa/piix=2Ec
>> @@ -33,7 +33,6 @@
>>  #include "hw/qdev-properties=2Eh"
>>  #include "hw/ide/piix=2Eh"
>>  #include "hw/isa/isa=2Eh"
>> -#include "hw/xen/xen=2Eh"
>>  #include "sysemu/runstate=2Eh"
>>  #include "migration/vmstate=2Eh"
>>  #include "hw/acpi/acpi_aml_interface=2Eh"
>> @@ -465,24 +464,6 @@ static const TypeInfo piix3_info =3D {
>>      =2Eclass_init    =3D piix3_class_init,
>>  };
>> =20
>> -static void piix3_xen_class_init(ObjectClass *klass, void *data)
>> -{
>> -    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> -    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>> -
>> -    k->realize =3D piix3_realize;
>> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
>> -    k->device_id =3D PCI_DEVICE_ID_INTEL_82371SB_0;
>> -    dc->vmsd =3D &vmstate_piix3;
>> -}
>> -
>> -static const TypeInfo piix3_xen_info =3D {
>> -    =2Ename          =3D TYPE_PIIX3_XEN_DEVICE,
>> -    =2Eparent        =3D TYPE_PIIX_PCI_DEVICE,
>> -    =2Einstance_init =3D piix3_init,
>> -    =2Eclass_init    =3D piix3_xen_class_init,
>> -};
>> -
>>  static void piix4_realize(PCIDevice *dev, Error **errp)
>>  {
>>      ERRP_GUARD();
>> @@ -534,7 +515,6 @@ static void piix3_register_types(void)
>>  {
>>      type_register_static(&piix_pci_type_info);
>>      type_register_static(&piix3_info);
>> -    type_register_static(&piix3_xen_info);
>>      type_register_static(&piix4_info);
>>  }
>> =20
>> diff --git a/include/hw/southbridge/piix=2Eh b/include/hw/southbridge/p=
iix=2Eh
>> index 65ad8569da=2E=2Eb1fc94a742 100644
>> --- a/include/hw/southbridge/piix=2Eh
>> +++ b/include/hw/southbridge/piix=2Eh
>> @@ -77,7 +77,6 @@ struct PIIXState {
>>  OBJECT_DECLARE_SIMPLE_TYPE(PIIXState, PIIX_PCI_DEVICE)
>> =20
>>  #define TYPE_PIIX3_DEVICE "PIIX3"
>> -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>>  #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>> =20
>>  #endif
>
>
>This fixes the regression with the emulated usb tablet device that I repo=
rted in v1 here:
>
>https://lore=2Ekernel=2Eorg/qemu-devel/aed4f2c1-83f7-163a-fb44-f284376668=
dc@aol=2Ecom/
>
>I tested this patch again with all the prerequisites and now with v2 ther=
e are no regressions=2E

Good news!

>Tested-by: Chuck Zmudzinski <brchuckz@aol=2Ecom>

Thanks for the test ride and the Tested-by medal ;)

Best regards,
Bernhard

