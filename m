Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C41E27DC86
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 01:12:09 +0200 (CEST)
Received: from localhost ([::1]:41098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNOn1-0007YV-RW
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 19:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kNOlm-0006gM-PN
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 19:10:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:44028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kNOlj-0007mS-RC
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 19:10:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kNOlh-0007b5-7I
 for <qemu-devel@nongnu.org>; Tue, 29 Sep 2020 23:10:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 309B82E80DB
 for <qemu-devel@nongnu.org>; Tue, 29 Sep 2020 23:10:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2020 23:00:48 -0000
From: Alex Williamson <1897481@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alex-l-williamson sergey-kukunin
X-Launchpad-Bug-Reporter: Sergiy K (sergey-kukunin)
X-Launchpad-Bug-Modifier: Alex Williamson (alex-l-williamson)
References: <160123953126.1246.10707501292033522741.malonedeb@gac.canonical.com>
Message-Id: <160142044897.23147.9277662326800857447.malone@gac.canonical.com>
Subject: [Bug 1897481] Re: qemu crashes with VGA pass-through, e-GPU,
 nvidia 1060
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d685c0a40836eb9844ed835c9700f20633c1d7af"; Instance="production"
X-Launchpad-Hash: 0524e26e9e20802c20637321def9bcf1fc638972
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 19:10:45
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.199, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1897481 <1897481@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please attach output from `dmesg` and `sudo lspci -vvv`, both from the
host.  Laptops typically don't provide sufficient resources for GPUs
attached like this, so my guess is that we're trying to add a quirk on
top of a BAR that isn't mapped.  If that's the case, the following host
kernel options might help: pci=3Drealloc,assign-busses,nocrs

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1897481

Title:
  qemu crashes with VGA pass-through, e-GPU, nvidia 1060

Status in QEMU:
  New

Bug description:
  I try to pass-through nvidia 1060 6gb card, which is connected via
  ExpressCard (EXP-GDC converter).

  I can successfully run my virtual machine without pass-through, but
  when I try to add the devices, qemu crashes.

  The coredump contains:

  Stack trace of thread 3289311:
  #0  0x0000000000614c49 memory_region_update_container_subregions (qemu-sy=
stem-x86_64 + 0x214c49)
  #1  0x00000000005c0e8c vfio_probe_nvidia_bar0_quirk (qemu-system-x86_64 +=
 0x1c0e8c)
  #2  0x00000000005bcec0 vfio_realize (qemu-system-x86_64 + 0x1bcec0)
  #3  0x000000000079b423 pci_qdev_realize (qemu-system-x86_64 + 0x39b423)
  #4  0x00000000006facda device_set_realized (qemu-system-x86_64 + 0x2facda)
  #5  0x0000000000887e57 property_set_bool (qemu-system-x86_64 + 0x487e57)
  #6  0x000000000088ac48 object_property_set (qemu-system-x86_64 + 0x48ac48)
  #7  0x000000000088d1d2 object_property_set_qobject (qemu-system-x86_64 + =
0x48d1d2)
  #8  0x000000000088b1f7 object_property_set_bool (qemu-system-x86_64 + 0x4=
8b1f7)
  #9  0x0000000000693785 qdev_device_add (qemu-system-x86_64 + 0x293785)
  #10 0x000000000061aad0 device_init_func (qemu-system-x86_64 + 0x21aad0)
  #11 0x000000000098c87b qemu_opts_foreach (qemu-system-x86_64 + 0x58c87b)
  #12 0x00000000006211cb qemu_init (qemu-system-x86_64 + 0x2211cb)
  #13 0x00000000005002aa main (qemu-system-x86_64 + 0x1002aa)
  #14 0x00007fce8af21152 __libc_start_main (libc.so.6 + 0x28152)
  #15 0x000000000050087e _start (qemu-system-x86_64 + 0x10087e)

  The whole running command is pretty long, since I use libvirt to
  manage my machines:

  LC_ALL=3DC \
  PATH=3D/usr/local/sbin:/usr/local/bin:/usr/bin \
  HOME=3D/var/lib/libvirt/qemu/domain-2-Win10 \
  XDG_DATA_HOME=3D/var/lib/libvirt/qemu/domain-2-Win10/.local/share \
  XDG_CACHE_HOME=3D/var/lib/libvirt/qemu/domain-2-Win10/.cache \
  XDG_CONFIG_HOME=3D/var/lib/libvirt/qemu/domain-2-Win10/.config \
  QEMU_AUDIO_DRV=3Dspice \
  /usr/bin/qemu-system-x86_64 \
  -name guest=3DWin10,debug-threads=3Don \
  -S \
  -blockdev '{"driver":"file","filename":"/usr/share/edk2-ovmf/x64/OVMF_COD=
E.fd","node-name":"libvirt-pflash0-storage","auto-read-only":true,"discard"=
:"unmap"}' \
  -blockdev '{"node-name":"libvirt-pflash0-format","read-only":true,"driver=
":"raw","file":"libvirt-pflash0-storage"}' \
  -blockdev '{"driver":"file","filename":"/var/lib/libvirt/qemu/nvram/Win10=
_VARS.fd","node-name":"libvirt-pflash1-storage","auto-read-only":true,"disc=
ard":"unmap"}' \
  -blockdev '{"node-name":"libvirt-pflash1-format","read-only":false,"drive=
r":"raw","file":"libvirt-pflash1-storage"}' \
  -machine pc-q35-5.1,accel=3Dkvm,usb=3Doff,vmport=3Doff,dump-guest-core=3D=
off,pflash0=3Dlibvirt-pflash0-format,pflash1=3Dlibvirt-pflash1-format \
  -cpu host,migratable=3Don,hv-time,hv-relaxed,hv-vapic,hv-spinlocks=3D0x1f=
ff \
  -m 8192 \
  -overcommit mem-lock=3Doff \
  -smp 2,sockets=3D2,cores=3D1,threads=3D1 \
  -uuid 7043c77b-4903-4527-8089-9679d9a17fee \
  -no-user-config \
  -nodefaults \
  -chardev stdio,mux=3Don,id=3Dcharmonitor \
  -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \
  -rtc base=3Dlocaltime,driftfix=3Dslew \
  -global kvm-pit.lost_tick_policy=3Ddelay \
  -no-hpet \
  -no-shutdown \
  -global ICH9-LPC.disable_s3=3D1 \
  -global ICH9-LPC.disable_s4=3D1 \
  -boot strict=3Don \
  -device pcie-root-port,port=3D0x10,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,mu=
ltifunction=3Don,addr=3D0x2 \
  -device pcie-root-port,port=3D0x11,chassis=3D2,id=3Dpci.2,bus=3Dpcie.0,ad=
dr=3D0x2.0x1 \
  -device pcie-root-port,port=3D0x12,chassis=3D3,id=3Dpci.3,bus=3Dpcie.0,ad=
dr=3D0x2.0x2 \
  -device pcie-root-port,port=3D0x13,chassis=3D4,id=3Dpci.4,bus=3Dpcie.0,ad=
dr=3D0x2.0x3 \
  -device pcie-root-port,port=3D0x14,chassis=3D5,id=3Dpci.5,bus=3Dpcie.0,ad=
dr=3D0x2.0x4 \
  -device pcie-root-port,port=3D0x15,chassis=3D6,id=3Dpci.6,bus=3Dpcie.0,ad=
dr=3D0x2.0x5 \
  -device qemu-xhci,p2=3D15,p3=3D15,id=3Dusb,bus=3Dpci.2,addr=3D0x0 \
  -device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.3,addr=3D0x0 \
  -blockdev '{"driver":"file","filename":"/home/sergiy/VirtualBox VMs/win4g=
ames.img","node-name":"libvirt-2-storage","auto-read-only":true,"discard":"=
unmap"}' \
  -blockdev '{"node-name":"libvirt-2-format","read-only":false,"driver":"ra=
w","file":"libvirt-2-storage"}' \
  -device ide-hd,bus=3Dide.0,drive=3Dlibvirt-2-format,id=3Dsata0-0-0,bootin=
dex=3D1 \
  -blockdev '{"driver":"file","filename":"/home/sergiy/Downloads/Win10_2004=
_Ukrainian_x64.iso","node-name":"libvirt-1-storage","auto-read-only":true,"=
discard":"unmap"}' \
  -blockdev '{"node-name":"libvirt-1-format","read-only":true,"driver":"raw=
","file":"libvirt-1-storage"}' \
  -device ide-cd,bus=3Dide.1,drive=3Dlibvirt-1-format,id=3Dsata0-0-1 \
  -chardev pty,id=3Dcharserial0 \
  -device isa-serial,chardev=3Dcharserial0,id=3Dserial0 \
  -chardev spicevmc,id=3Dcharchannel0,name=3Dvdagent \
  -device virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharchanne=
l0,id=3Dchannel0,name=3Dcom.redhat.spice.0 \
  -spice port=3D5900,addr=3D127.0.0.1,disable-ticketing,image-compression=
=3Doff,seamless-migration=3Don \
  -device qxl-vga,id=3Dvideo0,ram_size=3D67108864,vram_size=3D67108864,vram=
64_size_mb=3D0,vgamem_mb=3D16,max_outputs=3D1,bus=3Dpcie.0,addr=3D0x1 \
  -chardev spicevmc,id=3Dcharredir0,name=3Dusbredir \
  -device usb-redir,chardev=3Dcharredir0,id=3Dredir0,bus=3Dusb.0,port=3D1 \
  -chardev spicevmc,id=3Dcharredir1,name=3Dusbredir \
  -device usb-redir,chardev=3Dcharredir1,id=3Dredir1,bus=3Dusb.0,port=3D2 \
  -device vfio-pci,host=3D0000:04:00.0,id=3Dhostdev0,bus=3Dpci.4,multifunct=
ion=3Don,addr=3D0x0 \
  -device vfio-pci,host=3D0000:04:00.1,id=3Dhostdev1,bus=3Dpci.4,addr=3D0x0=
.0x1 \
  -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.5,addr=3D0x0 \
  -sandbox on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourc=
econtrol=3Ddeny \
  -msg timestamp=3Don

  I've forced vfio_pci module for the VGA, and ensured that lspci shows

    Kernel driver in use: vfio_pci

  My laptop is Thinkpad x230, that runs on Intel(R) Core(TM) i5-3320M CPU @=
 2.60GHz. =

  I run 5.8.6-1-MANJARO kernel and run QEMU emulator version 5.1.0.

  Thank you for your attention. I'd love to provide more information,
  but I don't know what else matters.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1897481/+subscriptions

