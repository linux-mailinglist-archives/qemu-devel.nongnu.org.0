Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE76E65FFDE
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 12:58:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDlMS-0007kW-G5; Fri, 06 Jan 2023 06:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pDlMP-0007k3-Py
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 06:58:09 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pDlMN-00043T-Gq
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 06:58:09 -0500
Received: by mail-ej1-x634.google.com with SMTP id u19so2937305ejm.8
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 03:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TBxYdY0nhsET79NZ9XKnKiBr1yDDIcpHo558HUBkNFQ=;
 b=onoSQlpLMrOzWEEpbJjcfYgWALF8enzzBWje3CUbC5Cl+zXPJYyq+J0iI2WdL8Dwd7
 0p+MQoMZeclUSiUclWaCU/SWK/Bu6PhKzFvqRoPBT6lUS48gpP8kX3xAiGYv0Qbm/5n9
 EWK+IYEarusxXx5rRBpsGiRCjVRYtPBDZJhUreyVJSmt1RfCEYyhtioYkV8inanRpbHH
 wp1ISW5RaTZ/td3RP/qk2D7GLFhm+sGb3LTtscSU5O+Ey0aDUqhaG+UV8NGxTe36jqxK
 AtrKk/1kMLv7iqmgQmTxMdB+6LZ9PgbSguUxNYey0zUq5ZlHwT1aHqzwEa9T7d+rKgUn
 Xdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TBxYdY0nhsET79NZ9XKnKiBr1yDDIcpHo558HUBkNFQ=;
 b=0l9EQ6Q8HPXBsX6ETLsMMENDAhGzqcfziFx+guzGSVrejCvAYXtPpL9DRTQBAJcZ60
 XhlkqafMf9ZOrAtdAXNQdi1XvvBb8xSeBwtjZpmhg8xFJJiWihsyErIU91IT7gSp5spy
 0rQySP6OU8w5QiZlrGEHmuNZyxbPDlLBUeOKpW+CS2XVZJK8YFCumJADs4BF1iHW86XB
 LZ5Y0IcCLdLLRjGpdTEa68u5MXogdqAZWdyF2QhYNdyCzJF8jMFu3HTwWnWHx/N9MIq1
 /Dt41T9hx4c4afnzz3C0ooW0Z5Y/lOWxoUJPd0JMzaOPVDmummmTG6Yq97w5JiOPHgS+
 B7hg==
X-Gm-Message-State: AFqh2krafu0Y/X1OVtGie7mYlHWDj33IUWKzU3p3ym/RGy9pGkInH2DB
 XEI0KO9S9WmA2FZqrTueK/Q=
X-Google-Smtp-Source: AMrXdXtk3S7Dcv8qIz8C3RhdtMz6UKvTSdukRpBJB5XtgEItGpsj5crne5XSJSHuqB4f9YXLznGuXw==
X-Received: by 2002:a17:907:c71b:b0:7c1:67ca:56f5 with SMTP id
 ty27-20020a170907c71b00b007c167ca56f5mr53336482ejc.15.1673006285861; 
 Fri, 06 Jan 2023 03:58:05 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb20078bb45bd8c0dfe08.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:78bb:45bd:8c0d:fe08])
 by smtp.gmail.com with ESMTPSA id
 hq15-20020a1709073f0f00b0084c7029b24dsm330529ejc.151.2023.01.06.03.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 03:58:05 -0800 (PST)
Date: Fri, 06 Jan 2023 11:57:59 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
CC: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Chuck Zmudzinski <brchuckz@aol.com>,
 Thomas Huth <thuth@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_6/6=5D_hw/isa/piix=3A_Res?=
 =?US-ASCII?Q?olve_redundant_TYPE=5FPIIX3=5FXEN=5FDEVICE?=
In-Reply-To: <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
 <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org>
Message-ID: <B207F213-3B7B-4E0A-A87E-DE53CD351647@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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



Am 4=2E Januar 2023 15:35:33 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <ph=
ilmd@linaro=2Eorg>:
>+Markus/Thomas
>
>On 4/1/23 15:44, Bernhard Beschow wrote:
>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
>> TYPE_PIIX3_DEVICE=2E Remove this redundancy=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/i386/pc_piix=2Ec             |  4 +---
>>   hw/isa/piix=2Ec                 | 20 --------------------
>>   include/hw/southbridge/piix=2Eh |  1 -
>>   3 files changed, 1 insertion(+), 24 deletions(-)
>>=20
>> diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>> index 5738d9cdca=2E=2E6b8de3d59d 100644
>> --- a/hw/i386/pc_piix=2Ec
>> +++ b/hw/i386/pc_piix=2Ec
>> @@ -235,8 +235,6 @@ static void pc_init1(MachineState *machine,
>>       if (pcmc->pci_enabled) {
>>           DeviceState *dev;
>>           PCIDevice *pci_dev;
>> -        const char *type =3D xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
>> -                                         : TYPE_PIIX3_DEVICE;
>>           int i;
>>             pci_bus =3D i440fx_init(pci_type,
>> @@ -250,7 +248,7 @@ static void pc_init1(MachineState *machine,
>>                                          : pci_slot_get_pirq);
>>           pcms->bus =3D pci_bus;
>>   -        pci_dev =3D pci_new_multifunction(-1, true, type);
>> +        pci_dev =3D pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE)=
;
>>           object_property_set_bool(OBJECT(pci_dev), "has-usb",
>>                                    machine_usb(machine), &error_abort);
>>           object_property_set_bool(OBJECT(pci_dev), "has-acpi",
>> diff --git a/hw/isa/piix=2Ec b/hw/isa/piix=2Ec
>> index 98e9b12661=2E=2Ee4587352c9 100644
>> --- a/hw/isa/piix=2Ec
>> +++ b/hw/isa/piix=2Ec
>> @@ -33,7 +33,6 @@
>>   #include "hw/qdev-properties=2Eh"
>>   #include "hw/ide/piix=2Eh"
>>   #include "hw/isa/isa=2Eh"
>> -#include "hw/xen/xen=2Eh"
>>   #include "sysemu/runstate=2Eh"
>>   #include "migration/vmstate=2Eh"
>>   #include "hw/acpi/acpi_aml_interface=2Eh"
>> @@ -465,24 +464,6 @@ static const TypeInfo piix3_info =3D {
>>       =2Eclass_init    =3D piix3_class_init,
>>   };
>>   -static void piix3_xen_class_init(ObjectClass *klass, void *data)
>> -{
>> -    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> -    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>> -
>> -    k->realize =3D piix3_realize;
>> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
>> -    k->device_id =3D PCI_DEVICE_ID_INTEL_82371SB_0;
>> -    dc->vmsd =3D &vmstate_piix3;
>
>IIUC, since this device is user-creatable, we can't simply remove it
>without going thru the deprecation process=2E

AFAICS this device is actually not user-creatable since dc->user_creatable=
 is set to false once in the base class=2E I think it is safe to remove the=
 Xen class unless there are ABI issues=2E

Best regards,
Bernhard

>Alternatively we could
>add a type alias:
>
>-- >8 --
>diff --git a/softmmu/qdev-monitor=2Ec b/softmmu/qdev-monitor=2Ec
>index 4b0ef65780=2E=2Ed94f7ea369 100644
>--- a/softmmu/qdev-monitor=2Ec
>+++ b/softmmu/qdev-monitor=2Ec
>@@ -64,6 +64,7 @@ typedef struct QDevAlias
>                               QEMU_ARCH_LOONGARCH)
> #define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
> #define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
>+#define QEMU_ARCH_XEN (QEMU_ARCH_ARM | QEMU_ARCH_I386)
>
> /* Please keep this table sorted by typename=2E */
> static const QDevAlias qdev_alias_table[] =3D {
>@@ -111,6 +112,7 @@ static const QDevAlias qdev_alias_table[] =3D {
>     { "virtio-tablet-device", "virtio-tablet", QEMU_ARCH_VIRTIO_MMIO },
>     { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_VIRTIO_CCW },
>     { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_VIRTIO_PCI },
>+    { "PIIX3", "PIIX3-xen", QEMU_ARCH_XEN },
>     { }
> };
>---
>
>But I'm not sure due to this comment from commit ee46d8a503
>(2011-12-22 15:24:20 -0600):
>
>47) /*
>48)  * Aliases were a bad idea from the start=2E  Let's keep them
>49)  * from spreading further=2E
>50)  */
>
>Maybe using qdev_alias_table[] during device deprecation is
>acceptable?
>
>> -}
>> -
>> -static const TypeInfo piix3_xen_info =3D {
>> -    =2Ename          =3D TYPE_PIIX3_XEN_DEVICE,
>> -    =2Eparent        =3D TYPE_PIIX_PCI_DEVICE,
>> -    =2Einstance_init =3D piix3_init,
>> -    =2Eclass_init    =3D piix3_xen_class_init,
>> -};
>> -
>>   static void piix4_realize(PCIDevice *dev, Error **errp)
>>   {
>>       ERRP_GUARD();
>> @@ -534,7 +515,6 @@ static void piix3_register_types(void)
>>   {
>>       type_register_static(&piix_pci_type_info);
>>       type_register_static(&piix3_info);
>> -    type_register_static(&piix3_xen_info);
>>       type_register_static(&piix4_info);
>>   }
>>   diff --git a/include/hw/southbridge/piix=2Eh b/include/hw/southbridge=
/piix=2Eh
>> index 65ad8569da=2E=2Eb1fc94a742 100644
>> --- a/include/hw/southbridge/piix=2Eh
>> +++ b/include/hw/southbridge/piix=2Eh
>> @@ -77,7 +77,6 @@ struct PIIXState {
>>   OBJECT_DECLARE_SIMPLE_TYPE(PIIXState, PIIX_PCI_DEVICE)
>>     #define TYPE_PIIX3_DEVICE "PIIX3"
>> -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>>   #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>>     #endif
>

