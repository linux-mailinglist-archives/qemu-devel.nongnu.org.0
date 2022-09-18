Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BA55BC032
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 23:51:48 +0200 (CEST)
Received: from localhost ([::1]:49524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa2CY-0006Xa-W9
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 17:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oa28x-0002t1-BU
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 17:48:04 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oa28u-0008BH-6D
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 17:48:03 -0400
Received: by mail-ej1-x635.google.com with SMTP id u9so60580735ejy.5
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 14:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=ttwyvbwSOzJG9nx2CrSEDxxfwnEa9cSgaWPFtlt6egg=;
 b=bFv9B5C0cm6DIoC/YiNCXcF39P9KPc+c3ZodTtC7sW1Mg5VIloHHL8oE2aOHBdOZI7
 T4cW4TPTS9+ZATQdD+KrHFaLrbmC/a+XX+rXo9owK+zT9RvCpbHeO63AusF68BX5krpp
 nknofDnj7n9JWSdDEjweoKTCvewqbMvpV3QwLNbvH/+k7QSw1B2t1XiA6T3Ca6Nu7yMR
 x0TAOBf5G57KS179DvR+WjQQw4N7h5HCEH44IAtLKYx6DTQXqFdwBNchOKP7UT9xTDXH
 jVXL86yjwDX/SH6HBmHvKqOm+CdVbIl6016KqrldZpT2aCXttaUZ9eNCgNovdmTElI04
 xI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ttwyvbwSOzJG9nx2CrSEDxxfwnEa9cSgaWPFtlt6egg=;
 b=b874LwZ3ErKRov89UkRmglk14jh9Shi5d5QPuTHhVAPhvaARdXB0+ini4KO5RoPeHZ
 a8fuRZDvgEsNzuSc6Rz5ddjU5ZFtVsCziZSiSqegf10KNexGO0etQuWzrnnuW+M4KpSb
 FmC7IZNUHnxL23Il7AMBcwVtunSpQrhVt71/JcQYbcICjyzmOM5kNNAwRMLkjqwqIfPC
 Y+YTd/gMMAJEwJxvf7sOWSbjq0oLg4N4xfvbM36Z9EXnuZDbXO2o9secyfr19+69TwXD
 k0OvE+/UAi+y2CfClYw4E5IUiPa+JffhcDthVJ8fHG+hkF/2oQ30I8p00AxLTy0EywGd
 fVQw==
X-Gm-Message-State: ACrzQf0zmWTVV8VyF4ETdizQPty+jHLrXqXs3RkO9e3JqaXfSZ6QQhtO
 npVtZKC+Gk3+p3w43BnbJSA=
X-Google-Smtp-Source: AMsMyM6rrDm2a/GuxTawBJaJDTPx+TRIeK2T1li1talP/dehacgeINq90KZKb870Bkd5yQwBXVnS/g==
X-Received: by 2002:a17:906:8a77:b0:780:a02d:ca4a with SMTP id
 hy23-20020a1709068a7700b00780a02dca4amr9537980ejc.488.1663537678193; 
 Sun, 18 Sep 2022 14:47:58 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-054-124-024.78.54.pool.telefonica.de.
 [78.54.124.24]) by smtp.gmail.com with ESMTPSA id
 r2-20020a17090609c200b0071cbc7487e1sm14375329eje.69.2022.09.18.14.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 14:47:57 -0700 (PDT)
Date: Sun, 18 Sep 2022 21:47:52 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_26/42=5D_hw/isa/piix4=3A_Make_P?=
 =?US-ASCII?Q?IIX4=27s_ACPI_and_USB_functions_optional?=
In-Reply-To: <7c73d39c-815b-4159-ea90-530460cabc76@ilande.co.uk>
References: <20220901162613.6939-1-shentey@gmail.com>
 <20220901162613.6939-27-shentey@gmail.com>
 <7c73d39c-815b-4159-ea90-530460cabc76@ilande.co.uk>
Message-ID: <75ADFFAA-C3EA-4286-A083-74D6570878C3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18=2E September 2022 20:10:51 UTC schrieb Mark Cave-Ayland <mark=2Ecave-=
ayland@ilande=2Eco=2Euk>:
>On 01/09/2022 17:25, Bernhard Beschow wrote:
>
>> This aligns PIIX4 with PIIX3=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/isa/piix4=2Ec  | 44 ++++++++++++++++++++++++++++++++------------
>>   hw/mips/malta=2Ec |  6 ++++--
>>   2 files changed, 36 insertions(+), 14 deletions(-)
>>=20
>> diff --git a/hw/isa/piix4=2Ec b/hw/isa/piix4=2Ec
>> index 67881e3a75=2E=2Eed9eca715f 100644
>> --- a/hw/isa/piix4=2Ec
>> +++ b/hw/isa/piix4=2Ec
>> @@ -50,9 +50,16 @@ struct PIIX4State {
>>       PCIIDEState ide;
>>       UHCIState uhci;
>>       PIIX4PMState pm;
>> +
>> +    uint32_t smb_io_base;
>> +
>>       /* Reset Control Register */
>>       MemoryRegion rcr_mem;
>>       uint8_t rcr;
>> +
>> +    bool has_acpi;
>> +    bool has_usb;
>> +    bool smm_enabled;
>>   };
>>     OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
>> @@ -258,17 +265,26 @@ static void piix4_realize(PCIDevice *dev, Error *=
*errp)
>>       }
>>         /* USB */
>> -    qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
>> -    if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
>> -        return;
>> +    if (s->has_usb) {
>> +        object_initialize_child(OBJECT(dev), "uhci", &s->uhci,
>> +                                "piix4-usb-uhci");
>
>Can you use the relevant TYPE_ macro here for the USB-UHCI device?
>
>> +        qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
>> +        if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
>> +            return;
>> +        }
>>       }
>>         /* ACPI controller */
>> -    qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
>> -    if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
>> -        return;
>> +    if (s->has_acpi) {
>> +        object_initialize_child(OBJECT(s), "pm", &s->pm, TYPE_PIIX4_PM=
);
>> +        qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
>> +        qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", s->smb_io_=
base);
>> +        qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", s->smm_enable=
d);
>> +        if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
>> +            return;
>> +        }
>> +        qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
>>       }
>> -    qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
>>         pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX=
_NUM_PIRQS);
>>   }
>> @@ -279,13 +295,16 @@ static void piix4_init(Object *obj)
>>         object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC)=
;
>>       object_initialize_child(obj, "ide", &s->ide, "piix4-ide");
>
>=2E=2E=2E and same here for IDE?

Sure!

Best regards,
Bernhard
>
>> -    object_initialize_child(obj, "uhci", &s->uhci, "piix4-usb-uhci");
>> -
>> -    object_initialize_child(obj, "pm", &s->pm, TYPE_PIIX4_PM);
>> -    qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", 0x1100);
>> -    qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", 0);
>>   }
>>   +static Property piix4_props[] =3D {
>> +    DEFINE_PROP_UINT32("smb_io_base", PIIX4State, smb_io_base, 0),
>> +    DEFINE_PROP_BOOL("has-acpi", PIIX4State, has_acpi, true),
>> +    DEFINE_PROP_BOOL("has-usb", PIIX4State, has_usb, true),
>> +    DEFINE_PROP_BOOL("smm-enabled", PIIX4State, smm_enabled, false),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>>   static void piix4_class_init(ObjectClass *klass, void *data)
>>   {
>>       DeviceClass *dc =3D DEVICE_CLASS(klass);
>> @@ -304,6 +323,7 @@ static void piix4_class_init(ObjectClass *klass, vo=
id *data)
>>        */
>>       dc->user_creatable =3D false;
>>       dc->hotpluggable =3D false;
>> +    device_class_set_props(dc, piix4_props);
>>   }
>>     static const TypeInfo piix4_info =3D {
>> diff --git a/hw/mips/malta=2Ec b/hw/mips/malta=2Ec
>> index a4b866a2cf=2E=2E6339b0d66c 100644
>> --- a/hw/mips/malta=2Ec
>> +++ b/hw/mips/malta=2Ec
>> @@ -1400,8 +1400,10 @@ void mips_malta_init(MachineState *machine)
>>       empty_slot_init("GT64120", 0, 0x20000000);
>>         /* Southbridge */
>> -    piix4 =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0=
), true,
>> -                                            TYPE_PIIX4_PCI_DEVICE);
>> +    piix4 =3D pci_new_multifunction(PCI_DEVFN(10, 0), true,
>> +                                  TYPE_PIIX4_PCI_DEVICE);
>> +    qdev_prop_set_uint32(DEVICE(piix4), "smb_io_base", 0x1100);
>> +    pci_realize_and_unref(piix4, pci_bus, &error_fatal);
>>       isa_bus =3D ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa=2E0"))=
;
>>         dev =3D DEVICE(object_resolve_path_component(OBJECT(piix4), "id=
e"));
>
>
>ATB,
>
>Mark=2E


