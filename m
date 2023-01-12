Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3355D667EE0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 20:19:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG368-00017q-5r; Thu, 12 Jan 2023 14:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pG365-00017C-LD
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 14:18:45 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pG363-0000FE-25
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 14:18:45 -0500
Received: by mail-ej1-x62a.google.com with SMTP id az20so28092899ejc.1
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 11:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=znKsrcQI5eTxWw6koP5BmwfUjNK/TzPXrZHro2GI5WA=;
 b=Wl+jtIsFriABXsvXf6S4odSPfbDt4hEJ1RHb2+gg78+xqikxqT2QFN6fUVlX1YGsB/
 68iX7EMUXp7M0bFRIpJVRdi2t47OELjPLBINU8GPoNwSaFkQtPzloRXWZ5xfKW15dceu
 f+sdSnMC61oWlOVD4tCqBsqRrxU+zrGJvZONVIo+9BMG70Ev+WccXuSeZaCkJJ9hQAT3
 gPE2LWi50yvQUGxEgY9G1hkYO19i4qd6KZiJgWcP5ZAW26fK1/UvJGBiQNuzl1j6sFnL
 7rxwbMNyICpcg0CO4UYk+IeCVVf0sxcE4K30C3aCVpjOaALIVPm+7fOcII+oIqzSJv0/
 8vjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=znKsrcQI5eTxWw6koP5BmwfUjNK/TzPXrZHro2GI5WA=;
 b=B3sdOUNgAgrbJcsrZx+QyT0Reqpn62ckIzW1f/3MOftiMJI+X83lCdmIrYk3Blff+0
 PoPe7176YkyU/NBcl+R9I0J0MYdzsWlHvCS65fhEB2gTgmRe6NcbJHgjFy+DvZUOV/T1
 hPUgYwibLLtSb6XkedKo+CQ5PnvFdYiGETgiEciazynG7KhAYLbWUaAM0ch/uGf2m7ZQ
 Rd0nxc15Pbz7fQJyMAJ18QD6ngfXpF0+jizOZE4sNrNujICrmWEc2bkYn2tqGWfCnArT
 fswwUeFZVHBIUc0QxBUYJUtHPBBYJu+7unRr5CXApEgSHv3xn3+ciXnNs1A4hOQ09E9V
 m93Q==
X-Gm-Message-State: AFqh2kq9Q6QvYHjCW4c6iqdTjFr3FkEYapd1lSuPzdYxwwwYO4K1mlrN
 polE4SSoZ0huC3BompSAQIM=
X-Google-Smtp-Source: AMrXdXv56uNTCYYXFq6lM/TortLCbgJXTPuzaeqNqvVDij57HiG55FXcZJQVWBmgtkxxMnqNNAZcRQ==
X-Received: by 2002:a17:907:9a98:b0:7c1:d4c:f08c with SMTP id
 km24-20020a1709079a9800b007c10d4cf08cmr68854870ejc.4.1673551120068; 
 Thu, 12 Jan 2023 11:18:40 -0800 (PST)
Received: from [127.0.0.1] (dynamic-092-224-135-062.92.224.pool.telefonica.de.
 [92.224.135.62]) by smtp.gmail.com with ESMTPSA id
 b6-20020aa7d486000000b0048447efe3fcsm7496599edr.84.2023.01.12.11.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 11:18:39 -0800 (PST)
Date: Thu, 12 Jan 2023 19:18:33 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Chuck Zmudzinski <brchuckz@aol.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
In-Reply-To: <a6994521-68d5-a05b-7be2-a8c605733467@aol.com>
References: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz.ref@aol.com>
 <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com>
 <20230110030331-mutt-send-email-mst@kernel.org>
 <a6994521-68d5-a05b-7be2-a8c605733467@aol.com>
Message-ID: <D785501E-F95D-4A22-AFD0-85133F8CE56D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



Am 11=2E Januar 2023 15:40:24 UTC schrieb Chuck Zmudzinski <brchuckz@aol=
=2Ecom>:
>On 1/10/23 3:16=E2=80=AFAM, Michael S=2E Tsirkin wrote:
>> On Tue, Jan 10, 2023 at 02:08:34AM -0500, Chuck Zmudzinski wrote:
>>> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
>>> as noted in docs/igd-assign=2Etxt in the Qemu source code=2E
>>>=20
>>> Currently, when the xl toolstack is used to configure a Xen HVM guest =
with
>>> Intel IGD passthrough to the guest with the Qemu upstream device model=
,
>>> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will o=
ccupy
>>> a different slot=2E This problem often prevents the guest from booting=
=2E
>>>=20
>>> The only available workaround is not good: Configure Xen HVM guests to=
 use
>>> the old and no longer maintained Qemu traditional device model availab=
le
>>> from xenbits=2Exen=2Eorg which does reserve slot 2 for the Intel IGD=
=2E
>>>=20
>>> To implement this feature in the Qemu upstream device model for Xen HV=
M
>>> guests, introduce the following new functions, types, and macros:
>>>=20
>>> * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_D=
EVICE
>>> * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLAS=
S
>>> * typedef XenPTQdevRealize function pointer
>>> * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve sl=
ot 2
>>> * xen_igd_reserve_slot and xen_igd_clear_slot functions
>>>=20
>>> The new xen_igd_reserve_slot function uses the existing slot_reserved_=
mask
>>> member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured u=
sing
>>> the xl toolstack with the gfx_passthru option enabled, which sets the
>>> igd-passthru=3Don option to Qemu for the Xen HVM machine type=2E
>>>=20
>>> The new xen_igd_reserve_slot function also needs to be implemented in
>>> hw/xen/xen_pt_stub=2Ec to prevent FTBFS during the link stage for the =
case
>>> when Qemu is configured with --enable-xen and --disable-xen-pci-passth=
rough,
>>> in which case it does nothing=2E
>>>=20
>>> The new xen_igd_clear_slot function overrides qdev->realize of the par=
ent
>>> PCI device class to enable the Intel IGD to occupy slot 2 on the PCI b=
us
>>> since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
>>> created in hw/i386/pc_piix=2Ec for the case when igd-passthru=3Don=2E
>>>=20
>>> Move the call to xen_host_pci_device_get, and the associated error
>>> handling, from xen_pt_realize to the new xen_igd_clear_slot function t=
o
>>> initialize the device class and vendor values which enables the checks=
 for
>>> the Intel IGD to succeed=2E The verification that the host device is a=
n
>>> Intel IGD to be passed through is done by checking the domain, bus, sl=
ot,
>>> and function values as well as by checking that gfx_passthru is enable=
d,
>>> the device class is VGA, and the device vendor in Intel=2E
>>>=20
>>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol=2Ecom>
>>> ---
>>> Notes that might be helpful to reviewers of patched code in hw/xen:
>>>=20
>>> The new functions and types are based on recommendations from Qemu doc=
s:
>>> https://qemu=2Ereadthedocs=2Eio/en/latest/devel/qom=2Ehtml
>>>=20
>>> Notes that might be helpful to reviewers of patched code in hw/i386:
>>>=20
>>> The small patch to hw/i386/pc_piix=2Ec is protected by CONFIG_XEN so i=
t does
>>> not affect builds that do not have CONFIG_XEN defined=2E
>>>=20
>>> xen_igd_gfx_pt_enabled() in the patched hw/i386/pc_piix=2Ec file is an
>>> existing function that is only true when Qemu is built with
>>> xen-pci-passthrough enabled and the administrator has configured the X=
en
>>> HVM guest with Qemu's igd-passthru=3Don option=2E
>>>=20
>>> v2: Remove From: <email address> tag at top of commit message
>>>=20
>>> v3: Changed the test for the Intel IGD in xen_igd_clear_slot:
>>>=20
>>>     if (is_igd_vga_passthrough(&s->real_device) &&
>>>         (s->real_device=2Evendor_id =3D=3D PCI_VENDOR_ID_INTEL)) {
>>>=20
>>>     is changed to
>>>=20
>>>     if (xen_igd_gfx_pt_enabled() && (s->hostaddr=2Eslot =3D=3D 2)
>>>         && (s->hostaddr=2Efunction =3D=3D 0)) {
>>>=20
>>>     I hoped that I could use the test in v2, since it matches the
>>>     other tests for the Intel IGD in Qemu and Xen, but those tests
>>>     do not work because the necessary data structures are not set with
>>>     their values yet=2E So instead use the test that the administrator
>>>     has enabled gfx_passthru and the device address on the host is
>>>     02=2E0=2E This test does detect the Intel IGD correctly=2E
>>>=20
>>> v4: Use brchuckz@aol=2Ecom instead of brchuckz@netscape=2Enet for the =
author's
>>>     email address to match the address used by the same author in comm=
its
>>>     be9c61da and c0e86b76
>>>    =20
>>>     Change variable for XEN_PT_DEVICE_CLASS: xptc changed to xpdc
>>>=20
>>> v5: The patch of xen_pt=2Ec was re-worked to allow a more consistent t=
est
>>>     for the Intel IGD that uses the same criteria as in other places=
=2E
>>>     This involved moving the call to xen_host_pci_device_get from
>>>     xen_pt_realize to xen_igd_clear_slot and updating the checks for t=
he
>>>     Intel IGD in xen_igd_clear_slot:
>>>    =20
>>>     if (xen_igd_gfx_pt_enabled() && (s->hostaddr=2Eslot =3D=3D 2)
>>>         && (s->hostaddr=2Efunction =3D=3D 0)) {
>>>=20
>>>     is changed to
>>>=20
>>>     if (is_igd_vga_passthrough(&s->real_device) &&
>>>         s->real_device=2Edomain =3D=3D 0 && s->real_device=2Ebus =3D=
=3D 0 &&
>>>         s->real_device=2Edev =3D=3D 2 && s->real_device=2Efunc =3D=3D =
0 &&
>>>         s->real_device=2Evendor_id =3D=3D PCI_VENDOR_ID_INTEL) {
>>>=20
>>>     Added an explanation for the move of xen_host_pci_device_get from
>>>     xen_pt_realize to xen_igd_clear_slot to the commit message=2E
>>>=20
>>>     Rebase=2E
>>>=20
>>> v6: Fix logging by removing these lines from the move from xen_pt_real=
ize
>>>     to xen_igd_clear_slot that was done in v5:
>>>=20
>>>     XEN_PT_LOG(d, "Assigning real physical device %02x:%02x=2E%d"
>>>                " to devfn 0x%x\n",
>>>                s->hostaddr=2Ebus, s->hostaddr=2Eslot, s->hostaddr=2Efu=
nction,
>>>                s->dev=2Edevfn);
>>>=20
>>>     This log needs to be in xen_pt_realize because s->dev=2Edevfn is n=
ot
>>>     set yet in xen_igd_clear_slot=2E
>>>=20
>>> v7: The v7 that was posted to the mailing list was incorrect=2E v8 is =
what
>>>     v7 was intended to be=2E
>>>=20
>>> v8: Inhibit out of context log message and needless processing by
>>>     adding 2 lines at the top of the new xen_igd_clear_slot function:
>>>=20
>>>     if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
>>>         return;
>>>=20
>>>     Rebase=2E This removed an unnecessary header file from xen_pt=2Eh=
=20
>>>=20
>>>  hw/i386/pc_piix=2Ec    |  3 +++
>>>  hw/xen/xen_pt=2Ec      | 49 ++++++++++++++++++++++++++++++++++++-----=
---
>>>  hw/xen/xen_pt=2Eh      | 16 +++++++++++++++
>>>  hw/xen/xen_pt_stub=2Ec |  4 ++++
>>>  4 files changed, 63 insertions(+), 9 deletions(-)
>>>=20
>>> diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>>> index b48047f50c=2E=2Ebc5efa4f59 100644
>>> --- a/hw/i386/pc_piix=2Ec
>>> +++ b/hw/i386/pc_piix=2Ec
>>> @@ -405,6 +405,9 @@ static void pc_xen_hvm_init(MachineState *machine)
>>>      }
>>> =20
>>>      pc_xen_hvm_init_pci(machine);
>>> +    if (xen_igd_gfx_pt_enabled()) {
>>> +        xen_igd_reserve_slot(pcms->bus);
>>> +    }
>>>      pci_create_simple(pcms->bus, -1, "xen-platform");
>>>  }
>>>  #endif
>>=20
>> I would even maybe go further and move the whole logic into
>> xen_igd_reserve_slot=2E And I would even just name it
>> xen_hvm_init_reserved_slots without worrying about the what
>> or why at the pc level=2E  At this point it will be up to Xen maintaine=
rs=2E
>
>I see to do that would be to resolve the two pc_xen_hvm*
>functions in pc_piix=2Ec that are guarded by CONFIG_XEN and
>move them to an appropriate place such as xen-hvm=2Ec=2E
>
>That is along the lines of the work that Bernhard and Philippe
>are doing, so I am Cc'ing them=2E My first inclination is just
>to defer to them: I think eventually the little patch I propose
>here to pc_piix=2Ec is eventually going to be moved out of pc_piix=2Ec
>by Bernhard in a future patch=2E
>
>What they have been doing is very conservative, and I expect
>if and when Bernhard gets here to resolve those functions, they
>will do it in a way that keeps the dependency of the xenfv machine
>type on the pc machine type and the pc_init1 function=2E
>
>What I would propose would be to break the dependency of xenfv
>on the pc_init1 function=2E That is, I would propose having a
>xenfv_init function in xen-hvm=2Ec, and the first version would
>be the current version of pc_init1, so xenfv would still depend
>on many i440fx type things, but with the change xen developers
>would be free to tweak xenfv_init without affecting the users
>of the pc machine type=2E
>
>Would that be a good idea? If I get posiive feedback for this
>idea, I will put it on the table, probably initially as an RFC
>patch=2E

In various patches I've been decoupling 1/ PIIX3 from Xen and 2/ QEMU's Xe=
n integration code from the PC machine=2E My idea is to confine all wiring =
for a PIIX based PC machine using Xen in pc_piix=2Ec=2E The pc_xen_hvm* fun=
ctions seem to do exactly that, so I'd leave them there, at least for now=
=2E

What I would like to avoid is for the Xen integration code to make assumpt=
ions that an x86 or PC machine is always based on i440fx or PIIX3=2E

I like Michael's idea of going one step further, both in terms of the appr=
oach and the reasoning=2E

Best regards,
Bernhard

>Also, thanks, Michael, for your other suggestions for this patch
>about using macros for the devfn constants=2E
>
>Chuck
>
>>=20
>>> diff --git a/hw/xen/xen_pt=2Ec b/hw/xen/xen_pt=2Ec
>>> index 0ec7e52183=2E=2Eeff38155ef 100644
>>> --- a/hw/xen/xen_pt=2Ec
>>> +++ b/hw/xen/xen_pt=2Ec
>>> @@ -780,15 +780,6 @@ static void xen_pt_realize(PCIDevice *d, Error **=
errp)
>>>                 s->hostaddr=2Ebus, s->hostaddr=2Eslot, s->hostaddr=2Ef=
unction,
>>>                 s->dev=2Edevfn);
>>> =20
>>> -    xen_host_pci_device_get(&s->real_device,
>>> -                            s->hostaddr=2Edomain, s->hostaddr=2Ebus,
>>> -                            s->hostaddr=2Eslot, s->hostaddr=2Efunctio=
n,
>>> -                            errp);
>>> -    if (*errp) {
>>> -        error_append_hint(errp, "Failed to \"open\" the real pci devi=
ce");
>>> -        return;
>>> -    }
>>> -
>>>      s->is_virtfn =3D s->real_device=2Eis_virtfn;
>>>      if (s->is_virtfn) {
>>>          XEN_PT_LOG(d, "%04x:%02x:%02x=2E%d is a SR-IOV Virtual Functi=
on\n",
>>> @@ -950,11 +941,50 @@ static void xen_pci_passthrough_instance_init(Ob=
ject *obj)
>>>      PCI_DEVICE(obj)->cap_present |=3D QEMU_PCI_CAP_EXPRESS;
>>>  }
>>> =20
>>> +void xen_igd_reserve_slot(PCIBus *pci_bus)
>>> +{
>>> +    XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
>>> +    pci_bus->slot_reserved_mask |=3D XEN_PCI_IGD_SLOT_MASK;
>>> +}
>>> +
>>> +static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
>>> +{
>>> +    ERRP_GUARD();
>>> +    PCIDevice *pci_dev =3D (PCIDevice *)qdev;
>>> +    XenPCIPassthroughState *s =3D XEN_PT_DEVICE(pci_dev);
>>> +    XenPTDeviceClass *xpdc =3D XEN_PT_DEVICE_GET_CLASS(s);
>>> +    PCIBus *pci_bus =3D pci_get_bus(pci_dev);
>>> +
>>> +    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
>>> +        return;
>>> +
>>> +    xen_host_pci_device_get(&s->real_device,
>>> +                            s->hostaddr=2Edomain, s->hostaddr=2Ebus,
>>> +                            s->hostaddr=2Eslot, s->hostaddr=2Efunctio=
n,
>>> +                            errp);
>>> +    if (*errp) {
>>> +        error_append_hint(errp, "Failed to \"open\" the real pci devi=
ce");
>>> +        return;
>>> +    }
>>> +
>>> +    if (is_igd_vga_passthrough(&s->real_device) &&
>>> +        s->real_device=2Edomain =3D=3D 0 && s->real_device=2Ebus =3D=
=3D 0 &&
>>> +        s->real_device=2Edev =3D=3D 2 && s->real_device=2Efunc =3D=3D=
 0 &&
>>> +        s->real_device=2Evendor_id =3D=3D PCI_VENDOR_ID_INTEL) {
>>=20
>> how about macros for these?
>>=20
>> #define XEN_PCI_IGD_DOMAIN 0
>> #define XEN_PCI_IGD_BUS 0
>> #define XEN_PCI_IGD_DEV 2
>> #define XEN_PCI_IGD_FN 0
>>=20
>>> +        pci_bus->slot_reserved_mask &=3D ~XEN_PCI_IGD_SLOT_MASK;
>>=20
>> If you are going to do this, you should set it back
>> either after pci_qdev_realize or in unrealize,
>> for symmetry=2E
>>=20
>>> +        XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
>>> +    }
>>=20
>>=20
>>> +    xpdc->pci_qdev_realize(qdev, errp);
>>> +}
>>> +
>>=20
>>=20
>>=20
>>>  static void xen_pci_passthrough_class_init(ObjectClass *klass, void *=
data)
>>>  {
>>>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>>>      PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>>> =20
>>> +    XenPTDeviceClass *xpdc =3D XEN_PT_DEVICE_CLASS(klass);
>>> +    xpdc->pci_qdev_realize =3D dc->realize;
>>> +    dc->realize =3D xen_igd_clear_slot;
>>>      k->realize =3D xen_pt_realize;
>>>      k->exit =3D xen_pt_unregister_device;
>>>      k->config_read =3D xen_pt_pci_read_config;
>>> @@ -977,6 +1007,7 @@ static const TypeInfo xen_pci_passthrough_info =
=3D {
>>>      =2Einstance_size =3D sizeof(XenPCIPassthroughState),
>>>      =2Einstance_finalize =3D xen_pci_passthrough_finalize,
>>>      =2Eclass_init =3D xen_pci_passthrough_class_init,
>>> +    =2Eclass_size =3D sizeof(XenPTDeviceClass),
>>>      =2Einstance_init =3D xen_pci_passthrough_instance_init,
>>>      =2Einterfaces =3D (InterfaceInfo[]) {
>>>          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>>> diff --git a/hw/xen/xen_pt=2Eh b/hw/xen/xen_pt=2Eh
>>> index cf10fc7bbf=2E=2E8c25932b4b 100644
>>> --- a/hw/xen/xen_pt=2Eh
>>> +++ b/hw/xen/xen_pt=2Eh
>>> @@ -2,6 +2,7 @@
>>>  #define XEN_PT_H
>>> =20
>>>  #include "hw/xen/xen_common=2Eh"
>>> +#include "hw/pci/pci_bus=2Eh"
>>>  #include "xen-host-pci-device=2Eh"
>>>  #include "qom/object=2Eh"
>>> =20
>>> @@ -40,7 +41,20 @@ typedef struct XenPTReg XenPTReg;
>>>  #define TYPE_XEN_PT_DEVICE "xen-pci-passthrough"
>>>  OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
>>> =20
>>> +#define XEN_PT_DEVICE_CLASS(klass) \
>>> +    OBJECT_CLASS_CHECK(XenPTDeviceClass, klass, TYPE_XEN_PT_DEVICE)
>>> +#define XEN_PT_DEVICE_GET_CLASS(obj) \
>>> +    OBJECT_GET_CLASS(XenPTDeviceClass, obj, TYPE_XEN_PT_DEVICE)
>>> +
>>> +typedef void (*XenPTQdevRealize)(DeviceState *qdev, Error **errp);
>>> +
>>> +typedef struct XenPTDeviceClass {
>>> +    PCIDeviceClass parent_class;
>>> +    XenPTQdevRealize pci_qdev_realize;
>>> +} XenPTDeviceClass;
>>> +
>>>  uint32_t igd_read_opregion(XenPCIPassthroughState *s);
>>> +void xen_igd_reserve_slot(PCIBus *pci_bus);
>>>  void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
>>>  void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
>>>                                             XenHostPCIDevice *dev);
>>> @@ -75,6 +89,8 @@ typedef int (*xen_pt_conf_byte_read)
>>> =20
>>>  #define XEN_PCI_INTEL_OPREGION 0xfc
>>> =20
>>> +#define XEN_PCI_IGD_SLOT_MASK 0x4UL /* Intel IGD slot_reserved_mask *=
/
>>> +
>>=20
>> I think you want to calculate this based on dev fn:
>>=20
>> #define XEN_PCI_IGD_SLOT_MASK \
>> 	(0x1 << PCI_SLOT(PCI_DEVFN(XEN_PCI_IGD_DEV, XEN_PCI_IGD_FN)))
>>=20
>>=20
>>>  typedef enum {
>>>      XEN_PT_GRP_TYPE_HARDWIRED =3D 0,  /* 0 Hardwired reg group */
>>>      XEN_PT_GRP_TYPE_EMU,            /* emul reg group */
>>> diff --git a/hw/xen/xen_pt_stub=2Ec b/hw/xen/xen_pt_stub=2Ec
>>> index 2d8cac8d54=2E=2E5c108446a8 100644
>>> --- a/hw/xen/xen_pt_stub=2Ec
>>> +++ b/hw/xen/xen_pt_stub=2Ec
>>> @@ -20,3 +20,7 @@ void xen_igd_gfx_pt_set(bool value, Error **errp)
>>>          error_setg(errp, "Xen PCI passthrough support not built in");
>>>      }
>>>  }
>>> +
>>> +void xen_igd_reserve_slot(PCIBus *pci_bus)
>>> +{
>>> +}
>>> --=20
>>> 2=2E39=2E0
>>=20
>

