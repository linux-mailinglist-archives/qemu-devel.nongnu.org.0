Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825DD327F89
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:34:13 +0100 (CET)
Received: from localhost ([::1]:45264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGige-0005qd-Gc
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:34:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lGibM-00022t-35
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:28:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lGibE-0006kM-Q0
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:28:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614605312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwxlAELZpfpiv4D7Qx6Zh4pOfQoNKX2hCL3USanys54=;
 b=JaekVCFM4HzdoyUoOPuqlz2o+JK/qNx6nS/reti46kWXenf1t0wOh+Zvb6BQcxs10A8KPx
 cP9ch4P93+X5ol5RLTuBLXCFhYSCLjZx588ycZR4I3zz8krJidWfr14a+ycpTAEbrAKxdf
 ldFuNsQ7oyJ1kl+aHzC8XJ+nt6L4xzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-vrmc-GsLOwOc3D8Y_eH64Q-1; Mon, 01 Mar 2021 08:28:29 -0500
X-MC-Unique: vrmc-GsLOwOc3D8Y_eH64Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A79F98015FD;
 Mon,  1 Mar 2021 13:28:27 +0000 (UTC)
Received: from localhost (unknown [10.40.208.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0DFF60C04;
 Mon,  1 Mar 2021 13:28:21 +0000 (UTC)
Date: Mon, 1 Mar 2021 14:28:19 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 1/2] i386/acpi: fix inconsistent QEMU/OVMF device paths
Message-ID: <20210301142819.66b94a4e@redhat.com>
In-Reply-To: <20210228154208-mutt-send-email-mst@kernel.org>
References: <20200730155755.188845-1-mst@redhat.com>
 <5b40e1ac-03ca-7954-4d50-f5f96c339772@proxmox.com>
 <20210228154208-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Stefan Reiter <s.reiter@proxmox.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 vit9696 <vit9696@protonmail.com>, Laszlo Ersek <lersek@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 28 Feb 2021 15:43:40 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Sat, Feb 27, 2021 at 08:41:11PM +0100, Thomas Lamprecht wrote:
> > On 30.07.20 17:58, Michael S. Tsirkin wrote:  
> > > macOS uses ACPI UIDs to build the DevicePath for NVRAM boot options,
> > > while OVMF firmware gets them via an internal channel through QEMU.
> > > Due to a bug in QEMU ACPI currently UEFI firmware and ACPI have
> > > different values, and this makes the underlying operating system
> > > unable to report its boot option.
> > > 
> > > The particular node in question is the primary PciRoot (PCI0 in ACPI),
> > > which for some reason gets assigned 1 in ACPI UID and 0 in the
> > > DevicePath. This is due to the _UID assigned to it by build_dsdt in
> > > hw/i386/acpi-build.c Which does not correspond to the primary PCI
> > > identifier given by pcibus_num in hw/pci/pci.c
> > > 
> > > Reference with the device paths, OVMF startup logs, and ACPI table
> > > dumps (SysReport):
> > > https://github.com/acidanthera/bugtracker/issues/1050
> > > 
> > > In UEFI v2.8, section "10.4.2 Rules with ACPI _HID and _UID" ends with
> > > the paragraph,
> > > 
> > >     Root PCI bridges will use the plug and play ID of PNP0A03, This will
> > >     be stored in the ACPI Device Path _HID field, or in the Expanded
> > >     ACPI Device Path _CID field to match the ACPI name space. The _UID
> > >     in the ACPI Device Path structure must match the _UID in the ACPI
> > >     name space.
> > > 
> > > (See especially the last sentence.)
> > > 
> > > Considering *extra* root bridges / root buses (with bus number > 0),
> > > QEMU's ACPI generator actually does the right thing; since QEMU commit
> > > c96d9286a6d7 ("i386/acpi-build: more traditional _UID and _HID for PXB
> > > root buses", 2015-06-11).
> > > 
> > > However, the _UID values for root bridge zero (on both i440fx and q35)
> > > have always been "wrong" (from UEFI perspective), going back in QEMU to
> > > commit 74523b850189 ("i386: add ACPI table files from seabios",
> > > 2013-10-14).
> > > 
> > > Even in SeaBIOS, these _UID values have always been 1; see commit
> > > a4d357638c57 ("Port rombios32 code from bochs-bios.", 2008-03-08) for
> > > i440fx, and commit ecbe3fd61511 ("seabios: q35: add dsdt", 2012-12-01)
> > > for q35.
> > > 
> > > Suggested-by: Laszlo Ersek <lersek@redhat.com>
> > > Tested-by: vit9696 <vit9696@protonmail.com>
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  hw/i386/acpi-build.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > index b7bcbbbb2a..7a5a8b3521 100644
> > > --- a/hw/i386/acpi-build.c
> > > +++ b/hw/i386/acpi-build.c
> > > @@ -1497,7 +1497,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > >          dev = aml_device("PCI0");
> > >          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> > >          aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> > > -        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> > > +        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> > >          aml_append(sb_scope, dev);
> > >          aml_append(dsdt, sb_scope);
> > >  
> > > @@ -1512,7 +1512,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > >          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> > >          aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> > >          aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> > > -        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> > > +        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> > >          aml_append(dev, build_q35_osc_method());
> > >          aml_append(sb_scope, dev);
> > >          aml_append(dsdt, sb_scope);
> > >   
> > 
> > This "breaks" Windows guests created/installed before this change in the sense
> > of Windows gets confused and declares that most of the devices changed and thus
> > it has new entries for them in the device manager where settings of the old one
> > do not apply anymore.
> > 
> > We were made aware of this by our users when making QEMU 5.2.0 available on
> > a more used repository of us. Users complained that their static network
> > configuration got thrown out in Windows 2016 or 2019 server VMs, and Windows tried
> > to use DHCP (which was not available in their environments) and thus their Windows
> > VMs had no network connectivity at all anymore.
> > 
> > It's currently not yet quite 100% clear to me with what QEMU version the Windows VM
> > must be installed with, from reading the patch I have to believe it must be before
> > that, but we got mixed reports and a colleague could not replicate it from upgrade
> > of 4.0 to 5.2 (I did /not/ confirm that one). Anyway, just writing this all to avoid
> > people seeing different results and brushing this off.
> > 
> > So here's my personal reproducer, as said, I think that one should be able to just
> > use QEMU 5.1 to install a Windows guest and start it with 5.2 afterwards to see this
> > issue, but YMMV.
> > 
> > Note. I always used the exact same QEMU command (see below) for installation,
> > reproducing and bisect.
> > 
> > 1. Installed Windows 2016 1616 VM using QEMU 3.0.1
> >    - VirtIO net/scsi driver from VirtIO win 190
> > 2. Setup static network in the VM and shutdown
> > 3. Started VM with 5.2.0 -> Network gone, new "Ethernet #2" adapter shows up instead
> > 
> > Starting the  "Device Manager" and enabling "View -> Show hidden devices" showed
> > me a greyed out device duplicate for basically anything attached, SCSI disk, Basic
> > Display Adapter, CDROM device, ..., and the Network device.
> > 
> > The first difference I could find was the "Device instance path" one can find in
> > the "Details" tab of the devices' "Properties" window.
> > 
> > # old, from initial installation on QEMU 3.0.1
> > PCI\VEN_1AF4&DEV_1000&SUBSYS_00011AF4&REV_00\3&13C0B0C5&0&90
> > 
> > # new, from boot with QEMU 5.2
> > PCI\VEN_1AF4&DEV_1000&SUBSYS_00011AF4&REV_00\3&267A616A&0&90
> > 
> > They match until almost the end, not sure how important that is, but it caught my
> > eye (I'm really no windows guy since a decade so please excuse my terrible
> > debugging/exploring skills there. The rest of those properties looked pretty
> > much identical.
> > 
> > I then started a bisect, always just restarting the guest with the new QEMU build
> > and checking "Device Manager" and network settings to see if good/bad. That worked
> > pretty well and I came to this commit. See the bisect log attached at the end of
> > this mail.
> > 
> > So, from reading the commit message I figure that this change is wanted, what are
> > the implications of just reverting it? (which works out in bringing back the
> > old state in Windows + working static network config again).
> > 
> > Or any other way/idea to address this in a sane way so that those picky Windows
> > guests can be handled more graciously?  
> 
> Sure. The way to do that is to tie old behaviour to old machine
> versions. We'll need it in stable too ...
> 
> Igor want to cook up a patch?

It might be too late for that,
I mean VMs installed on qemu-5.2 will use new ACPI tables on all
machine types and reverting behavior back for old machine types
will cause the same headache for them.

The difference is that probably there are a lot less new
Windows installations than the old ones (especially with static IP assignment),
so it could be better to restore bug for old machine types to
avoid guest reconfiguration.

How about:
 * buggy ACPI for 5.1 machine types and older
 * fixed ACPI for 5.2 and newer?


> > I guess also that there could be more subtle effects from this patch here, the
> > network one may have just had quite visible effects to pop up as first issue...
> > 
> > Thanks if you read so far!
> > 
> > cheers,
> > Thomas
> > 
> > 
> > = QEMU Command =
> > 
> > (This was generated by our (Proxmox VE) stack, I only cleaned it up a bit to allow
> > easier manual running it)
> > 
> > ./qemu-system-x86_64 \
> >   -name win2016 \
> >   -chardev 'socket,id=qmp,path=/var/run/qemu-server/11765.qmp,server,nowait' \
> >   -mon 'chardev=qmp,mode=control' \
> >   -smbios 'type=1,uuid=6324fb28-e98a-44cf-85db-694d1b3405f5' \
> >   -smp '2,sockets=1,cores=2,maxcpus=2' \
> >   -nodefaults \
> >   -boot 'menu=on,strict=on,reboot-timeout=1000' \
> >   -vnc unix:/var/run/qemu-server/11765.vnc,password \
> >   -no-hpet \
> >   -cpu 'host,hv_ipi,hv_relaxed,hv_reset,hv_runtime,hv_spinlocks=0x1fff,hv_stimer,hv_synic,hv_time,hv_vapic,hv_vpindex,+kvm_pv_eoi,+kvm_pv_unhalt,+md-clear,+pcid,+spec-ctrl' \
> >   -m 2048 \
> >   -device 'pci-bridge,id=pci.1,chassis_nr=1,bus=pci.0,addr=0x1e' \
> >   -device 'pci-bridge,id=pci.2,chassis_nr=2,bus=pci.0,addr=0x1f' \
> >   -device 'vmgenid,guid=2e56e6ca-2cf8-4f1d-8cc3-9b19a2510c01' \
> >   -device 'piix3-usb-uhci,id=uhci,bus=pci.0,addr=0x1.0x2' \
> >   -device 'usb-tablet,id=tablet,bus=uhci.0,port=1' \
> >   -device 'VGA,id=vga,bus=pci.0,addr=0x2,edid=off' \
> >   -chardev 'socket,path=/var/run/qemu-server/11765.qga,server,nowait,id=qga0' \
> >   -device 'virtio-serial,id=qga0,bus=pci.0,addr=0x8' \
> >   -device 'virtserialport,chardev=qga0,name=org.qemu.guest_agent.0' \
> >   -device 'virtio-balloon-pci,id=balloon0,bus=pci.0,addr=0x3' \
> >   -iscsi 'initiator-name=iqn.1993-08.org.debian:01:468faae9322b' \
> >   -drive 'file=/mnt/pve/iso/template/iso/virtio-win-0.1.190.iso,if=none,id=drive-ide0,media=cdrom,aio=threads' \
> >   -device 'ide-cd,bus=ide.0,unit=0,drive=drive-ide0,id=ide0,bootindex=200' \
> >   -drive 'file=/mnt/pve/iso/template/iso/Win2016-1616-evaluation.ISO,if=none,id=drive-ide2,media=cdrom,aio=threads' \
> >   -device 'ide-cd,bus=ide.1,unit=0,drive=drive-ide2,id=ide2,bootindex=201' \
> >   -device 'virtio-scsi-pci,id=scsihw0,bus=pci.0,addr=0x5' \
> >   -drive 'file=/dev/WDnvme/vm-11765-disk-0,if=none,id=drive-scsi0,format=raw,cache=none,aio=native,detect-zeroes=on' \
> >   -device 'scsi-hd,bus=scsihw0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0,id=scsi0,rotation_rate=1,bootindex=100' \
> >   -netdev 'type=tap,id=net0,ifname=tap11765i0,script=/var/lib/qemu-server/pve-bridge,downscript=/var/lib/qemu-server/pve-bridgedown,vhost=on' \
> >   -device 'virtio-net-pci,mac=02:98:90:43:42:1D,netdev=net0,bus=pci.0,addr=0x12,id=net0,bootindex=300' \
> >   -rtc 'driftfix=slew,base=localtime' \
> >   -machine 'type=pc' \
> >   -global 'kvm-pit.lost_tick_policy=discard'
> > 
> > 
> > = bisect log =
> > 
> > git bisect start
> > # bad: [553032db17440f8de011390e5a1cfddd13751b0b] Update version for v5.2.0 release
> > git bisect bad 553032db17440f8de011390e5a1cfddd13751b0b
> > # good: [d0ed6a69d399ae193959225cdeaa9382746c91cc] Update version for v5.1.0 release
> > git bisect good d0ed6a69d399ae193959225cdeaa9382746c91cc
> > # bad: [ed799805d00ccdda45eb8441c7d929624d9e98a6] qom: Add kernel-doc markup to introduction doc comment
> > git bisect bad ed799805d00ccdda45eb8441c7d929624d9e98a6
> > # bad: [e4d8b7c1a95fffcfa4bdab9aa7ffd1cf590cdcf5] Merge remote-tracking branch 'remotes/nvme/tags/pull-nvme-20200902' into staging
> > git bisect bad e4d8b7c1a95fffcfa4bdab9aa7ffd1cf590cdcf5
> > # bad: [af1dfe1ec0864e6700237a43cc36018176f9eba9] acpi: update expected DSDT files with _UID changes
> > git bisect bad af1dfe1ec0864e6700237a43cc36018176f9eba9
> > # good: [d7df0ceee0fd2e512cd214a9074ebeeb40da3099] Merge remote-tracking branch 'remotes/philmd-gitlab/tags/sd-next-20200821' into staging
> > git bisect good d7df0ceee0fd2e512cd214a9074ebeeb40da3099
> > # good: [df82aa7fe10e46b675678977999d49bd586538f8] Merge remote-tracking branch 'remotes/edgar/tags/edgar/xilinx-next-2020-08-24.for-upstream' into staging
> > git bisect good df82aa7fe10e46b675678977999d49bd586538f8
> > # good: [e39a8320b088dd5efc9ebaafe387e52b3d962665] target/riscv: Support the Virtual Instruction fault
> > git bisect good e39a8320b088dd5efc9ebaafe387e52b3d962665
> > # good: [a6841a2de66fa44fe52ed996b70f9fb9f7bd6ca7] qcow2: Add subcluster support to qcow2_co_pwrite_zeroes()
> > git bisect good a6841a2de66fa44fe52ed996b70f9fb9f7bd6ca7
> > # good: [2f8cd515477edab1cbf38ecbdbfa2cac13ce1550] hw/display/artist: Fix invalidation of lines near screen border
> > git bisect good 2f8cd515477edab1cbf38ecbdbfa2cac13ce1550
> > # good: [a5d3cfa2dc775e5d99f013703b8508f1d989d588] iotests: Add tests for qcow2 images with extended L2 entries
> > git bisect good a5d3cfa2dc775e5d99f013703b8508f1d989d588
> > # good: [8e49197ca5e76fdb8928833b2649ef13fc5aab2f] Merge remote-tracking branch 'remotes/hdeller/tags/target-hppa-v3-pull-request' into staging
> > git bisect good 8e49197ca5e76fdb8928833b2649ef13fc5aab2f
> > # bad: [af1b80ae56c9495999e8ccf7b70ef894378de642] i386/acpi: fix inconsistent QEMU/OVMF device paths
> > git bisect bad af1b80ae56c9495999e8ccf7b70ef894378de642
> > # good: [42a62c20925e02aef0d849f92a0e9540888e79ae] acpi: allow DSDT changes
> > git bisect good 42a62c20925e02aef0d849f92a0e9540888e79ae
> > # first bad commit: [af1b80ae56c9495999e8ccf7b70ef894378de642] i386/acpi: fix inconsistent QEMU/OVMF device paths  
> 
> 


