Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34016E97BD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 16:55:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVg4-0008AC-5I; Thu, 20 Apr 2023 10:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ppVg1-00089R-LZ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:54:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ppVfy-0001wj-O9
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682002461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=13xpk9Fr/rS6xhYHiZBXyOBuQXnZnABUgjUqEW2pZ0A=;
 b=gaSSHSRlwe+ZdK8E0j8CVXPb1LUPmwhlLq7B8EHCZSrIY2GlKhJC2G7MGwPeinL01Z9CBh
 6+1F9Yfhva5E0tUma1/wSkZnRvavTIknxKXlHV64QoGFdLP5Tjs/gMKY+f36rx5JJn+S08
 kxbk1S3hT4xdruzktboW3P2GcaTa1p8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-h4_QqeYXMaK4ZBDL5h-6oQ-1; Thu, 20 Apr 2023 10:54:20 -0400
X-MC-Unique: h4_QqeYXMaK4ZBDL5h-6oQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-3ef3c41a1ceso5064011cf.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 07:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682002459; x=1684594459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=13xpk9Fr/rS6xhYHiZBXyOBuQXnZnABUgjUqEW2pZ0A=;
 b=Ehuz3Hx3tyVG+vxZCeyUtE/JZ6xCfnIteTVPl2P4YbxGJJlMHt24iSicZoJWHKNetz
 4SaZxEEc02WqIGxClvszb25EvRYAp75vu2jo1Aqjr+qm5BHCvrbnftSRKVLQQm6GRrhx
 k5ZwM5th8EraJ3vAcfYnYnwurIoZlFjkDOT2gUEl2eIoOP9sAFTh3rY2TDIV3uijLzwH
 2XUkmTAG6A6/+Sn33CQJrExx4pHIaMFm5zOD/RjaQJJ1s+DkvREdDqqybk+dZll+N29v
 GRiF+ZRMshLxMOGMjUZA3XREmRXmojnQoMD1hnJLKE0ro8uUQl03p3xirnh9idiz6KTP
 DBiw==
X-Gm-Message-State: AAQBX9cLkT3Q+QiauBn9WrjG64t/F6u6EWon4o3eOTWCWv7AHKocfKEI
 O4aAjzZoCFbT8insgky4Op3fmcdQ71sWJ7T7vxgGXcqQClCtlfCeVfU+xPmcArsJxTWwpDaXjve
 aybxTm0G40EBMYRp2PE4qzZQ=
X-Received: by 2002:ac8:5ac8:0:b0:3bf:c3be:758e with SMTP id
 d8-20020ac85ac8000000b003bfc3be758emr2742167qtd.16.1682002458726; 
 Thu, 20 Apr 2023 07:54:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350asm2E92XoXYpAKJcAvAuncHL5f2RmZajikoVZyDAwyaHN518VEj9nBBH56nX0t+8Wk8IwQqw==
X-Received: by 2002:ac8:5ac8:0:b0:3bf:c3be:758e with SMTP id
 d8-20020ac85ac8000000b003bfc3be758emr2742115qtd.16.1682002458278; 
 Thu, 20 Apr 2023 07:54:18 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 w9-20020ac87189000000b003ef46e51448sm545015qto.18.2023.04.20.07.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 07:54:17 -0700 (PDT)
Date: Thu, 20 Apr 2023 16:54:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "zhangying" <zhangying134@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Thomas Lamprecht
 <t.lamprecht@proxmox.com>, "Michael S. Tsirkin" <mst@redhat.com>, Renxuming
 <renxuming@huawei.com>, "Wangyuan" <wangyuan38@huawei.com>, suxiaodong
 <suxiaodong1@huawei.com>
Subject: Re: [PATCH 1/2] i386/acpi: fix inconsistent QEMU/OVMF device paths
Message-ID: <20230420165414.6e5839c3@imammedo.users.ipa.redhat.com>
In-Reply-To: <870c1c09814346539231d5018d5b9fdc@huawei.com>
References: <870c1c09814346539231d5018d5b9fdc@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 19 Apr 2023 02:48:55 +0000
"zhangying (AZ)" <zhangying134@huawei.com> wrote:

> > On Tue, 18 Apr 2023 09:06:30 +0000
> > "zhangying (AZ)" via <qemu-devel@nongnu.org> wrote:
> >  =20
> > > > On 30.07.20 17:58, Michael S. Tsirkin wrote: =20
> > > > > macOS uses ACPI UIDs to build the DevicePath for NVRAM boot
> > > > > options, while OVMF firmware gets them via an internal channel th=
rough =20
> > QEMU. =20
> > > > > Due to a bug in QEMU ACPI currently UEFI firmware and ACPI have
> > > > > different values, and this makes the underlying operating system
> > > > > unable to report its boot option.
> > > > >
> > > > > The particular node in question is the primary PciRoot (PCI0 in
> > > > > ACPI), which for some reason gets assigned 1 in ACPI UID and 0 in
> > > > > the DevicePath. This is due to the _UID assigned to it by
> > > > > build_dsdt in hw/i386/acpi-build.c Which does not correspond to
> > > > > the primary PCI identifier given by pcibus_num in hw/pci/pci.c
> > > > >
> > > > > Reference with the device paths, OVMF startup logs, and ACPI table
> > > > > dumps (SysReport):
> > > > > https://github.com/acidanthera/bugtracker/issues/1050
> > > > >
> > > > > In UEFI v2.8, section "10.4.2 Rules with ACPI _HID and _UID" ends
> > > > > with the paragraph,
> > > > >
> > > > >     Root PCI bridges will use the plug and play ID of PNP0A03, Th=
is will
> > > > >     be stored in the ACPI Device Path _HID field, or in the Expan=
ded
> > > > >     ACPI Device Path _CID field to match the ACPI name space. The=
 _UID
> > > > >     in the ACPI Device Path structure must match the _UID in the =
ACPI
> > > > >     name space.
> > > > >
> > > > > (See especially the last sentence.)
> > > > >
> > > > > Considering *extra* root bridges / root buses (with bus number >
> > > > > 0), QEMU's ACPI generator actually does the right thing; since
> > > > > QEMU commit
> > > > > c96d9286a6d7 ("i386/acpi-build: more traditional _UID and _HID for
> > > > > PXB root buses", 2015-06-11).
> > > > >
> > > > > However, the _UID values for root bridge zero (on both i440fx and
> > > > > q35) have always been "wrong" (from UEFI perspective), going back
> > > > > in QEMU to commit 74523b850189 ("i386: add ACPI table files from
> > > > > seabios", 2013-10-14).
> > > > >
> > > > > Even in SeaBIOS, these _UID values have always been 1; see commit
> > > > > a4d357638c57 ("Port rombios32 code from bochs-bios.", 2008-03-08)
> > > > > for i440fx, and commit ecbe3fd61511 ("seabios: q35: add dsdt",
> > > > > 2012-12-01) for q35.
> > > > >
> > > > > Suggested-by: Laszlo Ersek <lersek@redhat.com>
> > > > > Tested-by: vit9696 <vit9696@protonmail.com>
> > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > ---
> > > > >  hw/i386/acpi-build.c | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c index
> > > > > b7bcbbbb2a..7a5a8b3521 100644
> > > > > --- a/hw/i386/acpi-build.c
> > > > > +++ b/hw/i386/acpi-build.c
> > > > > @@ -1497,7 +1497,7 @@ build_dsdt(GArray *table_data, BIOSLinker =
=20
> > *linker, =20
> > > > >          dev =3D aml_device("PCI0");
> > > > >          aml_append(dev, aml_name_decl("_HID", =20
> > > > aml_eisaid("PNP0A03"))); =20
> > > > >          aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> > > > > -        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> > > > > +        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> > > > >          aml_append(sb_scope, dev);
> > > > >          aml_append(dsdt, sb_scope);
> > > > >
> > > > > @@ -1512,7 +1512,7 @@ build_dsdt(GArray *table_data, BIOSLinker =
=20
> > *linker, =20
> > > > >          aml_append(dev, aml_name_decl("_HID", =20
> > > > aml_eisaid("PNP0A08"))); =20
> > > > >          aml_append(dev, aml_name_decl("_CID", =20
> > > > aml_eisaid("PNP0A03"))); =20
> > > > >          aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> > > > > -        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> > > > > +        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> > > > >          aml_append(dev, build_q35_osc_method());
> > > > >          aml_append(sb_scope, dev);
> > > > >          aml_append(dsdt, sb_scope);
> > > > > =20
> > > >
> > > > This "breaks" Windows guests created/installed before this change in
> > > > the sense of Windows gets confused and declares that most of the
> > > > devices changed and thus it has new entries for them in the device
> > > > manager where settings of the old one do not apply anymore.
> > > >
> > > > We were made aware of this by our users when making QEMU 5.2.0
> > > > available on a more used repository of us. Users complained that
> > > > their static network configuration got thrown out in Windows 2016 or
> > > > 2019 server VMs, and Windows tried to use DHCP (which was not
> > > > available in their environments) and thus their Windows VMs had no =
network =20
> > connectivity at all anymore. =20
> > > >
> > > > It's currently not yet quite 100% clear to me with what QEMU version
> > > > the Windows VM must be installed with, from reading the patch I have
> > > > to believe it must be before that, but we got mixed reports and a
> > > > colleague could not replicate it from upgrade of 4.0 to 5.2 (I did
> > > > /not/ confirm that one). Anyway, just writing this all to avoid peo=
ple seeing =20
> > different results and brushing this off. =20
> > > >
> > > > So here's my personal reproducer, as said, I think that one should
> > > > be able to just use QEMU 5.1 to install a Windows guest and start it
> > > > with 5.2 afterwards to see this issue, but YMMV.
> > > >
> > > > Note. I always used the exact same QEMU command (see below) for
> > > > installation, reproducing and bisect.
> > > >
> > > > 1. Installed Windows 2016 1616 VM using QEMU 3.0.1
> > > >    - VirtIO net/scsi driver from VirtIO win 190 2. Setup static
> > > > network in the VM and shutdown 3. Started VM with 5.2.0 -> Network =
gone, =20
> > new "Ethernet #2" =20
> > > > adapter shows up instead
> > > >
> > > > Starting the  "Device Manager" and enabling "View -> Show hidden de=
vices"
> > > > showed me a greyed out device duplicate for basically anything
> > > > attached, SCSI disk, Basic Display Adapter, CDROM device, ..., and =
the =20
> > Network device. =20
> > > >
> > > > The first difference I could find was the "Device instance path" one
> > > > can find in the "Details" tab of the devices' "Properties" window.
> > > >
> > > > # old, from initial installation on QEMU 3.0.1
> > > > PCI\VEN_1AF4&DEV_1000&SUBSYS_00011AF4&REV_00\3&13C0B0C5&0&90
> > > >
> > > > # new, from boot with QEMU 5.2
> > > > PCI\VEN_1AF4&DEV_1000&SUBSYS_00011AF4&REV_00\3&267A616A&0&90
> > > >
> > > > They match until almost the end, not sure how important that is, but
> > > > it caught my eye (I'm really no windows guy since a decade so please
> > > > excuse my terrible debugging/exploring skills there. The rest of
> > > > those properties looked pretty much identical.
> > > >
> > > > I then started a bisect, always just restarting the guest with the
> > > > new QEMU build and checking "Device Manager" and network settings to
> > > > see if good/bad. That worked pretty well and I came to this commit.
> > > > See the bisect log attached at the end of this mail.
> > > >
> > > > So, from reading the commit message I figure that this change is
> > > > wanted, what are the implications of just reverting it? (which works
> > > > out in bringing back the old state in Windows + working static netw=
ork config =20
> > again). =20
> > > >
> > > > Or any other way/idea to address this in a sane way so that those
> > > > picky Windows guests can be handled more graciously?
> > > >
> > > > I guess also that there could be more subtle effects from this patch
> > > > here, the network one may have just had quite visible effects to po=
p up as =20
> > first issue... =20
> > > >
> > > > Thanks if you read so far!
> > > >
> > > > cheers,
> > > > Thomas
> > > > =20
> > >
> > > We have a similar problem and want to solve it further.
> > >
> > > Description of problem:
> > >
> > > When QEMU is upgraded from 4.1 to 6.2, if the machine type is not fix=
ed as 4.1 =20
> > and NIC was configured with static IP address, Windows will make origin=
al
> > 'network connection' inactive and create a new one (which is not config=
ured as
> > desired). As result guest looses network connectivity. =20
> > >
> > > Test 1:
> > > Steps to test the guest loses the network connection:
> > > 1. on QEMU 4.1 install Windows Server 2019 guest with virtio NIC 2.
> > > configure NIC with static IP and shutdown guest 3. start guest on
> > > qemu-6.2 with machine version as qemu 6.2
> > >
> > > Test 2:
> > > Steps to test the guest does not lose the network connection:
> > > 1. on QEMU 4.1 install Windows Server 2019 guest with virtio NIC 2.
> > > configure NIC with static IP and shutdown guest 3. start guest on
> > > qemu-6.2 with machine version as qemu 4.1
> > >
> > > Here's a historical analysis of the problem:
> > >
> > > Commit af1b80ae56c9 ("i386/acpi: fix inconsistent QEMU/OVMF device pa=
ths") =20
> > fixed UID of PCI root bridge in ACPI tables for all pc/q35 machine
> > versions.however it was discovered that this change updates Windows
> > configuration in an incompatible way causing network configuration fail=
ure unless
> > DHCP is used.
> >=20
> > that's expected,
> > by upgrading machine type you basically change hardware.
> >  =20
> > >
> > > And Commit 0a343a5add75 ("i386/acpi: restore device paths for pre-5.1=
 vms") =20
> > reverts the _UID update from 1 to 0 for q35 and i440fx VMs before versi=
on 5.2 to
> > maintain the original behaviour when upgrading. This requires that the =
same
> > machine type be used after the QEMU upgrade to 5.2 or later. =20
> > >
> > > We want all VMs to be able to use the features of the new qemu 6.2 ve=
rsion =20
> > After upgrade, we'd like to ask some questions: =20
> > >
> > > 1. When the QEMU is upgraded from 4.1 to 6.2, is there any method to =
ensure =20
> > that the guest does not lose the network connection for Test 1? could a=
nyone
> > give some suggestions?
> >=20
> > Upgrading qemu itself is fine as long as you keep using 4.1 machine typ=
e.
> >=20
> > If you wish to upgrade machine type,
> > you will have to reconfigure manually configured 'Network connection's =
(nothing
> > else would help you)
> >=20
> > From admin point of view it would be better to use DHPC (and if you nee=
d fixed
> > IPs, pin them on DHCP server side to VMs MAC addresses)
> >  =20
> > > 2. If no other method is available, reverts the _UID update from 1 to=
 0 for all =20
> > QEMU versions(the prerequisite is that macOS is not used). Is there any=
 risk? Is it
> > recommended to do this? =20
> > > 3. When the QEMU is upgraded from 4.1 to 6.2, set _UID to 1 for versi=
ons =20
> > earlier than QEMU 5.1 and to 0 for versions later than QEMU 5.2 Through
> > Parameters, but start guest on qemu-6.2 with machine version as qemu 6.=
2 to
> > solve Test 1's problem. Is this solution feasible? Is there any risk?
> >=20
> > that's what we already do by flipping UID value based on machine type v=
ersion.
> > Risk is that by staying on old machine type you might not get some fixe=
s or
> > changed defaults/behavior. You can analyze changes by looking at versio=
n-ed
> > FOO_machine_options() and hw_compat_x.y pc_compat_x.y property list and
> > decide if old machine type is good enough for you. =20
>=20
>=20
> Thanks for the answer, but there are still some questions=EF=BC=9A
> 1. Because our services do not involve macOS, we want to roll back the _U=
ID of all qemu versions from 1 to 0. However, we do not know whether there =
are potential risks. Do you suggest this?

you'll have to maintain downstream patch on your own

> 2. Flipping UID value based on machine type version, This will cause mult=
iple VMs of different machine types to run on the same host. We want to run=
 VMs of only one machine type on one host. If the machine type remains unch=
anged, and a new parameter is added to notify the VM, If the VM is upgraded=
 from 4.1, the UID is set to 1. If the VM is newly created, the UID is set =
to 0. However, this will cause different operations for the same machine ty=
pe version. Is this appropriate? Will there be some potential problems?

frankly speaking you lost me between 'if-s'

even after upgrading qemu to the latest you can still use old machine type =
(pc-q35-4.1) for exiting and new VMs to have the same behavior as qemu-4.1

> 3. QEMU is upgraded from 4.1 to 6.2. Is there any other problem about the=
 _UID except that the IP address of Windows is lost?

as for risks, no one would be able to tell you.
Common sense tells me "Check Changelogs to decide if you need a new version=
 and do some testing before rolling out changes."

>=20
>=20
> > > Thanks.
> > > =20
> > > > =3D QEMU Command =3D
> > > >
> > > > (This was generated by our (Proxmox VE) stack, I only cleaned it up
> > > > a bit to allow easier manual running it)
> > > >
> > > > ./qemu-system-x86_64 \
> > > >   -name win2016 \
> > > >   -chardev
> > > > 'socket,id=3Dqmp,path=3D/var/run/qemu-server/11765.qmp,server,nowai=
t' \
> > > >   -mon 'chardev=3Dqmp,mode=3Dcontrol' \
> > > >   -smbios 'type=3D1,uuid=3D6324fb28-e98a-44cf-85db-694d1b3405f5' \
> > > >   -smp '2,sockets=3D1,cores=3D2,maxcpus=3D2' \
> > > >   -nodefaults \
> > > >   -boot 'menu=3Don,strict=3Don,reboot-timeout=3D1000' \
> > > >   -vnc unix:/var/run/qemu-server/11765.vnc,password \
> > > >   -no-hpet \
> > > >   -cpu
> > > > 'host,hv_ipi,hv_relaxed,hv_reset,hv_runtime,hv_spinlocks=3D0x1fff,h=
v_s
> > > > timer,hv
> > > > _synic,hv_time,hv_vapic,hv_vpindex,+kvm_pv_eoi,+kvm_pv_unhalt,+md-cl
> > > > ear,
> > > > +pcid,+spec-ctrl' \
> > > >   -m 2048 \
> > > >   -device 'pci-bridge,id=3Dpci.1,chassis_nr=3D1,bus=3Dpci.0,addr=3D=
0x1e' \
> > > >   -device 'pci-bridge,id=3Dpci.2,chassis_nr=3D2,bus=3Dpci.0,addr=3D=
0x1f' \
> > > >   -device 'vmgenid,guid=3D2e56e6ca-2cf8-4f1d-8cc3-9b19a2510c01' \
> > > >   -device 'piix3-usb-uhci,id=3Duhci,bus=3Dpci.0,addr=3D0x1.0x2' \
> > > >   -device 'usb-tablet,id=3Dtablet,bus=3Duhci.0,port=3D1' \
> > > >   -device 'VGA,id=3Dvga,bus=3Dpci.0,addr=3D0x2,edid=3Doff' \
> > > >   -chardev
> > > > 'socket,path=3D/var/run/qemu-server/11765.qga,server,nowait,id=3Dqg=
a0' \
> > > >   -device 'virtio-serial,id=3Dqga0,bus=3Dpci.0,addr=3D0x8' \
> > > >   -device 'virtserialport,chardev=3Dqga0,name=3Dorg.qemu.guest_agen=
t.0' \
> > > >   -device 'virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x3'=
 \
> > > >   -iscsi 'initiator-name=3Diqn.1993-08.org.debian:01:468faae9322b' \
> > > >   -drive
> > > > 'file=3D/mnt/pve/iso/template/iso/virtio-win-0.1.190.iso,if=3Dnone,=
id=3Ddr
> > > > ive-ide0,me
> > > > dia=3Dcdrom,aio=3Dthreads' \
> > > >   -device 'ide-cd,bus=3Dide.0,unit=3D0,drive=3Ddrive-ide0,id=3Dide0=
,bootindex=3D200' =20
> > \ =20
> > > >   -drive
> > > > 'file=3D/mnt/pve/iso/template/iso/Win2016-1616-evaluation.ISO,if=3D=
none,
> > > > id=3Ddrive-
> > > > ide2,media=3Dcdrom,aio=3Dthreads' \
> > > >   -device 'ide-cd,bus=3Dide.1,unit=3D0,drive=3Ddrive-ide2,id=3Dide2=
,bootindex=3D201' =20
> > \ =20
> > > >   -device 'virtio-scsi-pci,id=3Dscsihw0,bus=3Dpci.0,addr=3D0x5' \
> > > >   -drive
> > > > 'file=3D/dev/WDnvme/vm-11765-disk-0,if=3Dnone,id=3Ddrive-scsi0,form=
at=3Draw,
> > > > cache=3D
> > > > none,aio=3Dnative,detect-zeroes=3Don' \
> > > >   -device
> > > > 'scsi-hd,bus=3Dscsihw0.0,channel=3D0,scsi-id=3D0,lun=3D0,drive=3Ddr=
ive-scsi0,i
> > > > d=3Dscsi0,rotati
> > > > on_rate=3D1,bootindex=3D100' \
> > > >   -netdev
> > > > 'type=3Dtap,id=3Dnet0,ifname=3Dtap11765i0,script=3D/var/lib/qemu-se=
rver/pve-
> > > > bridge,d ownscript=3D/var/lib/qemu-server/pve-bridgedown,vhost=3Don=
' \
> > > >   -device
> > > > 'virtio-net-pci,mac=3D02:98:90:43:42:1D,netdev=3Dnet0,bus=3Dpci.0,a=
ddr=3D0x1
> > > > 2,id=3Dnet0,
> > > > bootindex=3D300' \
> > > >   -rtc 'driftfix=3Dslew,base=3Dlocaltime' \
> > > >   -machine 'type=3Dpc' \
> > > >   -global 'kvm-pit.lost_tick_policy=3Ddiscard'
> > > >
> > > >
> > > > =3D bisect log =3D
> > > >
> > > > git bisect start
> > > > # bad: [553032db17440f8de011390e5a1cfddd13751b0b] Update version for
> > > > v5.2.0 release git bisect bad
> > > > 553032db17440f8de011390e5a1cfddd13751b0b
> > > > # good: [d0ed6a69d399ae193959225cdeaa9382746c91cc] Update version
> > > > for
> > > > v5.1.0 release git bisect good
> > > > d0ed6a69d399ae193959225cdeaa9382746c91cc
> > > > # bad: [ed799805d00ccdda45eb8441c7d929624d9e98a6] qom: Add
> > > > kernel-doc markup to introduction doc comment git bisect bad
> > > > ed799805d00ccdda45eb8441c7d929624d9e98a6
> > > > # bad: [e4d8b7c1a95fffcfa4bdab9aa7ffd1cf590cdcf5] Merge
> > > > remote-tracking branch 'remotes/nvme/tags/pull-nvme-20200902' into
> > > > staging git bisect bad
> > > > e4d8b7c1a95fffcfa4bdab9aa7ffd1cf590cdcf5
> > > > # bad: [af1dfe1ec0864e6700237a43cc36018176f9eba9] acpi: update
> > > > expected DSDT files with _UID changes git bisect bad
> > > > af1dfe1ec0864e6700237a43cc36018176f9eba9
> > > > # good: [d7df0ceee0fd2e512cd214a9074ebeeb40da3099] Merge
> > > > remote-tracking branch 'remotes/philmd-gitlab/tags/sd-next-20200821'
> > > > into staging git bisect good
> > > > d7df0ceee0fd2e512cd214a9074ebeeb40da3099
> > > > # good: [df82aa7fe10e46b675678977999d49bd586538f8] Merge
> > > > remote-tracking branch
> > > > 'remotes/edgar/tags/edgar/xilinx-next-2020-08-24.for-upstream' into
> > > > staging git bisect good df82aa7fe10e46b675678977999d49bd586538f8
> > > > # good: [e39a8320b088dd5efc9ebaafe387e52b3d962665] target/riscv:
> > > > Support the Virtual Instruction fault git bisect good
> > > > e39a8320b088dd5efc9ebaafe387e52b3d962665
> > > > # good: [a6841a2de66fa44fe52ed996b70f9fb9f7bd6ca7] qcow2: Add
> > > > subcluster support to qcow2_co_pwrite_zeroes() git bisect good
> > > > a6841a2de66fa44fe52ed996b70f9fb9f7bd6ca7
> > > > # good: [2f8cd515477edab1cbf38ecbdbfa2cac13ce1550]
> > > > hw/display/artist: Fix invalidation of lines near screen border git
> > > > bisect good
> > > > 2f8cd515477edab1cbf38ecbdbfa2cac13ce1550
> > > > # good: [a5d3cfa2dc775e5d99f013703b8508f1d989d588] iotests: Add
> > > > tests for
> > > > qcow2 images with extended L2 entries git bisect good
> > > > a5d3cfa2dc775e5d99f013703b8508f1d989d588
> > > > # good: [8e49197ca5e76fdb8928833b2649ef13fc5aab2f] Merge
> > > > remote-tracking branch
> > > > 'remotes/hdeller/tags/target-hppa-v3-pull-request' into staging git
> > > > bisect good 8e49197ca5e76fdb8928833b2649ef13fc5aab2f
> > > > # bad: [af1b80ae56c9495999e8ccf7b70ef894378de642] i386/acpi: fix
> > > > inconsistent QEMU/OVMF device paths git bisect bad
> > > > af1b80ae56c9495999e8ccf7b70ef894378de642
> > > > # good: [42a62c20925e02aef0d849f92a0e9540888e79ae] acpi: allow DSDT
> > > > changes git bisect good 42a62c20925e02aef0d849f92a0e9540888e79ae
> > > > # first bad commit: [af1b80ae56c9495999e8ccf7b70ef894378de642]
> > > > i386/acpi: fix inconsistent QEMU/OVMF device paths =20
> > > =20
> >  =20
>=20


