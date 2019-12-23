Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F7B129AE7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 21:46:35 +0100 (CET)
Received: from localhost ([::1]:32912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijUb4-0003fQ-CB
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 15:46:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ijUaF-0003EP-De
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 15:45:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ijUaD-00085o-Ur
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 15:45:43 -0500
Received: from indium.canonical.com ([91.189.90.7]:47192)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ijUaD-00085C-PF
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 15:45:41 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ijUaC-00063R-8K
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 20:45:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3DC302E80C8
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 20:45:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Dec 2019 20:36:22 -0000
From: John Snow <1810400@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=jsnow@redhat.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: catborise jnsnow
X-Launchpad-Bug-Reporter: Ali Sag (catborise)
X-Launchpad-Bug-Modifier: John Snow (jnsnow)
References: <154651207567.4755.1320631258909444651.malonedeb@wampee.canonical.com>
Message-Id: <157713338224.27850.13380240318853798903.malone@chaenomeles.canonical.com>
Subject: [Bug 1810400] Re: Failed to make dirty bitmaps writable: Can't update
 bitmap directory: Operation not permitted
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 6ab419436eb648bafd48886bf70650440869ea99
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1810400 <1810400@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, this should be fixed in 4.2. It looks like you're still on 2.12.0
based on the report. Closing under the assumption this is fixed. If you
discover otherwise, please feel free to re-open (or file a new bug.)

** Changed in: qemu
       Status: Confirmed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1810400

Title:
   Failed to make dirty bitmaps writable: Can't update bitmap directory:
  Operation not permitted

Status in QEMU:
  Fix Released

Bug description:
  blockcommit does not work if there is dirty block.

  virsh version
  Compiled against library: libvirt 4.10.0
  Using library: libvirt 4.10.0
  Using API: QEMU 4.10.0
  Running hypervisor: QEMU 2.12.0

  Scenario:
  1. Create an instance
  2. Add dirty bitmap to vm disk.
  3. create a snapshot(external or internal)
  4. revert snapshot or blockcommit disk

  virsh blockcommit rota-test vda  --active
  Active Block Commit started

  virsh blockjob rota-test vda --info
  No current block job for vda

  =

  rota-test.log:
   starting up libvirt version: 4.10.0, package: 1.el7 (CBS <cbs@centos.org=
>, 2018-12-05-12:27:12, c1bk.rdu2.centos.org), qemu version: 2.12.0qemu-kvm=
-ev-2.12.0-18.el7_6.1.1, kernel: 4.1.12-103.9.7.el7uek.x86_64, hostname: vm=
-kvm07
  LC_ALL=3DC PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin QEMU_=
AUDIO_DRV=3Dspice /usr/libexec/qemu-kvm -name guest=3Drota-test,debug-threa=
ds=3Don -S -object secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libv=
irt/qemu/domain-101-rota-test/master-key.aes -machine pc-i440fx-rhel7.0.0,a=
ccel=3Dkvm,usb=3Doff,dump-guest-core=3Doff -cpu SandyBridge,hypervisor=3Don=
,xsaveopt=3Don -m 8192 -realtime mlock=3Doff -smp 3,sockets=3D3,cores=3D1,t=
hreads=3D1 -uuid 50dec55c-a80a-4adc-a788-7ba23230064e -no-user-config -node=
faults -chardev socket,id=3Dcharmonitor,fd=3D59,server,nowait -mon chardev=
=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol -rtc base=3Dutc,driftfix=3Dslew =
-global kvm-pit.lost_tick_policy=3Ddelay -no-hpet -no-shutdown -global PIIX=
4_PM.disable_s3=3D1 -global PIIX4_PM.disable_s4=3D1 -boot strict=3Don -devi=
ce ich9-usb-ehci1,id=3Dusb,bus=3Dpci.0,addr=3D0x5.0x7 -device ich9-usb-uhci=
1,masterbus=3Dusb.0,firstport=3D0,bus=3Dpci.0,multifunction=3Don,addr=3D0x5=
 -device ich9-usb-uhci2,masterbus=3Dusb.0,firstport=3D2,bus=3Dpci.0,addr=3D=
0x5.0x1 -device ich9-usb-uhci3,masterbus=3Dusb.0,firstport=3D4,bus=3Dpci.0,=
addr=3D0x5.0x2 -device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.0,ad=
dr=3D0x6 -drive file=3D/var/lib/libvirt/images/rota-0003,format=3Dqcow2,if=
=3Dnone,id=3Ddrive-virtio-disk0,cache=3Dnone -device virtio-blk-pci,scsi=3D=
off,bus=3Dpci.0,addr=3D0x7,drive=3Ddrive-virtio-disk0,id=3Dvirtio-disk0,boo=
tindex=3D1,write-cache=3Don -netdev tap,fd=3D61,id=3Dhostnet0,vhost=3Don,vh=
ostfd=3D62 -device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:0=
0:e8:09:94,bus=3Dpci.0,addr=3D0x3 -chardev pty,id=3Dcharserial0 -device isa=
-serial,chardev=3Dcharserial0,id=3Dserial0 -chardev spicevmc,id=3Dcharchann=
el0,name=3Dvdagent -device virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,cha=
rdev=3Dcharchannel0,id=3Dchannel0,name=3Dcom.redhat.spice.0 -spice port=3D5=
902,addr=3D0.0.0.0,disable-ticketing,seamless-migration=3Don -device qxl-vg=
a,id=3Dvideo0,ram_size=3D67108864,vram_size=3D67108864,vram64_size_mb=3D0,v=
gamem_mb=3D16,max_outputs=3D1,bus=3Dpci.0,addr=3D0x2 -chardev spicevmc,id=
=3Dcharredir0,name=3Dusbredir -device usb-redir,chardev=3Dcharredir0,id=3Dr=
edir0,bus=3Dusb.0,port=3D2 -chardev spicevmc,id=3Dcharredir1,name=3Dusbredi=
r -device usb-redir,chardev=3Dcharredir1,id=3Dredir1,bus=3Dusb.0,port=3D3 -=
device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x8 -sandbox on,=
obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcecontrol=3Dden=
y -msg timestamp=3Don
  2019-01-03T07:50:43.810142Z qemu-kvm: -chardev pty,id=3Dcharserial0: char=
 device redirected to /dev/pts/3 (label charserial0)
  main_channel_link: add main channel client
  red_qxl_set_cursor_peer:
  inputs_connect: inputs channel client create
  inputs_channel_detach_tablet:
  #block339: Failed to make dirty bitmaps writable: Can't update bitmap dir=
ectory: Operation not permitted

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1810400/+subscriptions

