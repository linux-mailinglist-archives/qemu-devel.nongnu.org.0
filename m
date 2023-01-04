Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E6865DDB8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 21:32:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDAQF-00058D-Tm; Wed, 04 Jan 2023 15:31:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pDAQ2-00057a-PJ
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 15:31:26 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pDAPt-000804-A2
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 15:31:19 -0500
Received: by mail-ej1-x62f.google.com with SMTP id gh17so85541075ejb.6
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 12:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+XRBUxpmPx9usQEuTJXDwuff2z3rP9GnzpnzVXFfp2A=;
 b=KPR7ESFJUZ9mQDwHEIGHdXbgAumH46eg/HrFO8zp0Wzpc46FWnPJVYGRnO/nt6OjNc
 ouzKS2j34Qvb2dyGEZxtdRr5SDNyE4S2A0/UG6gjJxBRuqTOv71pMCY4j+piNai2QZxb
 uDWTJx67GW7J6kE23DtA68wH2pytXfrREZnuxxzguNTOaL2eH4DEJ2QYZtH6yG1kpTsa
 790YDTiWkV/FtzskkuhqUrNZIifd3V1zmpTDtqWAFsoR0hWAljOxP4EC91YO3PX6SD20
 l2DyB1Q3XnC5SJldn3YQVxu6GS24ixejmv78PidQHKSxji/wwNnzmVRQvaJlN0G9oCFM
 0lKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+XRBUxpmPx9usQEuTJXDwuff2z3rP9GnzpnzVXFfp2A=;
 b=ExwjgIoJuP2Tv7Yw8FlLeBCvXFAbkdce3JT6/PyBcU4xGV5rFu7zFPODUI1wLJWaEa
 356zC082Vo5N+Pb3pTRPHE11nrhz4Uiihqjt4CvbSi0D/xsFbqszG/mYK66PmuXc4/S9
 nPtnoeiXsdLQ4WCSYeyM6CwwlelobcGptTJ4l8U2RgzHdBTN+O3YAxeNdgQpykHWnQ+o
 +OMjrQPcur+cH37La2/xyuYTDJrJY7B76fJda3PlxNEwlanz+aGlpkJ+xnvcPbPSg1uH
 Z7YRpq0F8D86EP+/8DW+teyJPnBBu7PlnsEj8/orN9SlxLpoMWqB3yv61BxdLQ9Dqlgv
 xeGA==
X-Gm-Message-State: AFqh2kp2KVV95mRjqP1HzOs715zp8FPMVzjRYIPigKEEYI9kFjPPlzdO
 EK3W/Pv/q/4KZWMCZ6fNrBs=
X-Google-Smtp-Source: AMrXdXsta8i2SwGAjzUl+oFzU2XtPqGoG0G+UvqlFlG8R0YsfOzmlrhJt+FjHFZ1CmWKajdhCWGJ1Q==
X-Received: by 2002:a17:907:6f19:b0:818:3ef8:f2fc with SMTP id
 sy25-20020a1709076f1900b008183ef8f2fcmr40195994ejc.5.1672864275622; 
 Wed, 04 Jan 2023 12:31:15 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb2008108eedf25879029.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:8108:eedf:2587:9029])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1709060cc200b0084c4a8062a0sm12901703ejh.149.2023.01.04.12.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 12:31:15 -0800 (PST)
Date: Wed, 04 Jan 2023 20:31:10 +0000
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
In-Reply-To: <92efe0f1-f22b-47bc-f27d-2f31cb3621ea@aol.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
 <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org>
 <f596a7c1-10d0-3743-fe0b-d42003cf7440@aol.com>
 <be75758a-2547-d1ef-223e-157f3aa28b23@linaro.org>
 <92efe0f1-f22b-47bc-f27d-2f31cb3621ea@aol.com>
Message-ID: <A4B4B1D1-B466-459C-8A30-E79DACB14094@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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



Am 4=2E Januar 2023 19:29:35 UTC schrieb Chuck Zmudzinski <brchuckz@aol=2E=
com>:
>On 1/4/23 1:48=E2=80=AFPM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 4/1/23 18:54, Chuck Zmudzinski wrote:
>>> On 1/4/23 10:35=E2=80=AFAM, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> +Markus/Thomas
>>>>
>>>> On 4/1/23 15:44, Bernhard Beschow wrote:
>>>>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone o=
f
>>>>> TYPE_PIIX3_DEVICE=2E Remove this redundancy=2E
>>>>>
>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>>> ---
>>>>>    hw/i386/pc_piix=2Ec             |  4 +---
>>>>>    hw/isa/piix=2Ec                 | 20 --------------------
>>>>>    include/hw/southbridge/piix=2Eh |  1 -
>>>>>    3 files changed, 1 insertion(+), 24 deletions(-)
>>>>>
>>>>> diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>>>>> index 5738d9cdca=2E=2E6b8de3d59d 100644
>>>>> --- a/hw/i386/pc_piix=2Ec
>>>>> +++ b/hw/i386/pc_piix=2Ec
>>>>> @@ -235,8 +235,6 @@ static void pc_init1(MachineState *machine,
>>>>>        if (pcmc->pci_enabled) {
>>>>>            DeviceState *dev;
>>>>>            PCIDevice *pci_dev;
>>>>> -        const char *type =3D xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
>>>>> -                                         : TYPE_PIIX3_DEVICE;
>>>>>            int i;
>>>>>   =20
>>>>>            pci_bus =3D i440fx_init(pci_type,
>>>>> @@ -250,7 +248,7 @@ static void pc_init1(MachineState *machine,
>>>>>                                           : pci_slot_get_pirq);
>>>>>            pcms->bus =3D pci_bus;
>>>>>   =20
>>>>> -        pci_dev =3D pci_new_multifunction(-1, true, type);
>>>>> +        pci_dev =3D pci_new_multifunction(-1, true, TYPE_PIIX3_DEVI=
CE);
>>>>>            object_property_set_bool(OBJECT(pci_dev), "has-usb",
>>>>>                                     machine_usb(machine), &error_abo=
rt);
>>>>>            object_property_set_bool(OBJECT(pci_dev), "has-acpi",
>>>>> diff --git a/hw/isa/piix=2Ec b/hw/isa/piix=2Ec
>>>>> index 98e9b12661=2E=2Ee4587352c9 100644
>>>>> --- a/hw/isa/piix=2Ec
>>>>> +++ b/hw/isa/piix=2Ec
>>>>> @@ -33,7 +33,6 @@
>>>>>    #include "hw/qdev-properties=2Eh"
>>>>>    #include "hw/ide/piix=2Eh"
>>>>>    #include "hw/isa/isa=2Eh"
>>>>> -#include "hw/xen/xen=2Eh"
>>>>>    #include "sysemu/runstate=2Eh"
>>>>>    #include "migration/vmstate=2Eh"
>>>>>    #include "hw/acpi/acpi_aml_interface=2Eh"
>>>>> @@ -465,24 +464,6 @@ static const TypeInfo piix3_info =3D {
>>>>>        =2Eclass_init    =3D piix3_class_init,
>>>>>    };
>>>>>   =20
>>>>> -static void piix3_xen_class_init(ObjectClass *klass, void *data)
>>>>> -{
>>>>> -    DeviceClass *dc =3D DEVICE_CLASS(klass);
>>>>> -    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>>>>> -
>>>>> -    k->realize =3D piix3_realize;
>>>>> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
>>>>> -    k->device_id =3D PCI_DEVICE_ID_INTEL_82371SB_0;
>>>>> -    dc->vmsd =3D &vmstate_piix3;
>>>>
>>>> IIUC, since this device is user-creatable, we can't simply remove it
>>>> without going thru the deprecation process=2E Alternatively we could
>>>> add a type alias:
>>>>
>>>> -- >8 --
>>>> diff --git a/softmmu/qdev-monitor=2Ec b/softmmu/qdev-monitor=2Ec
>>>> index 4b0ef65780=2E=2Ed94f7ea369 100644
>>>> --- a/softmmu/qdev-monitor=2Ec
>>>> +++ b/softmmu/qdev-monitor=2Ec
>>>> @@ -64,6 +64,7 @@ typedef struct QDevAlias
>>>>                                  QEMU_ARCH_LOONGARCH)
>>>>    #define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
>>>>    #define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
>>>> +#define QEMU_ARCH_XEN (QEMU_ARCH_ARM | QEMU_ARCH_I386)
>>>>
>>>>    /* Please keep this table sorted by typename=2E */
>>>>    static const QDevAlias qdev_alias_table[] =3D {
>>>> @@ -111,6 +112,7 @@ static const QDevAlias qdev_alias_table[] =3D {
>>>>        { "virtio-tablet-device", "virtio-tablet", QEMU_ARCH_VIRTIO_MM=
IO },
>>>>        { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_VIRTIO_CCW }=
,
>>>>        { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_VIRTIO_PCI }=
,
>>>> +    { "PIIX3", "PIIX3-xen", QEMU_ARCH_XEN },
>>>=20
>>> Hi Bernhard,
>>>=20
>>> Can you comment if this should be:
>>>=20
>>> +    { "PIIX", "PIIX3-xen", QEMU_ARCH_XEN },
>>>=20
>>> instead? IIUC, the patch series also removed PIIX3 and PIIX4 and
>>> replaced them with PIIX=2E Or am I not understanding correctly?
>>=20
>> There is a confusion in QEMU between PCI bridges, the first PCI
>> function they implement, and the other PCI functions=2E
>>=20
>> Here TYPE_PIIX3_DEVICE means for "PCI function part of the PIIX
>> south bridge chipset, which expose a PCI-to-ISA bridge"=2E A better
>> name could be TYPE_PIIX3_ISA_PCI_DEVICE=2E Unfortunately this
>> device is named "PIIX3" with no indication of ISA bridge=2E
>
>
>Thanks, you are right, I see the PIIX3 device still exists after
>this patch set is applied=2E
>
>chuckz@debian:~/sources-sid/qemu/qemu-7=2E50+dfsg/hw/i386$ grep -r PIIX3 =
*
>pc_piix=2Ec:        pci_dev =3D pci_new_multifunction(-1, true, TYPE_PIIX=
3_DEVICE);
>
>I also understand there is the PCI-to-ISA bridge at 00:01=2E0 on the PCI =
bus:
>
>chuckz@debian:~$ lspci
>00:00=2E0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (re=
v 02)
>00:01=2E0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton =
II]
>00:01=2E1 IDE interface: Intel Corporation 82371SB PIIX3 IDE [Natoma/Trit=
on II]
>00:01=2E2 USB controller: Intel Corporation 82371SB PIIX3 USB [Natoma/Tri=
ton II] (rev 01)
>00:01=2E3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 03)
>00:02=2E0 Unassigned class [ff80]: XenSource, Inc=2E Xen Platform Device =
(rev 01)
>00:03=2E0 VGA compatible controller: Device 1234:1111 (rev 02)
>
>I also see with this patch, there is a bridge that is a PIIX4 ACPI at 00:=
01=2E3=2E

Yeah, this PIIX4 ACPI device is what we consider a "Frankenstein" device h=
ere on the list=2E Indeed my PIIX consolidation series aims for eventually =
replacing the remaining PIIX3 devices with PIIX4 ones to present a realisti=
c environment to guests=2E The series you tested makes Xen work with PIIX4=
=2E With a couple of more patches you might be able to opt into a realistic=
 PIIX4 emulation in the future!

Best regards,
Bernhard

>I get the exact same output from lspci without the patch series, so that =
gives
>me confidence it is working as designed=2E

