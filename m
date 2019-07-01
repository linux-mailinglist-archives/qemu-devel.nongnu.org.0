Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4967231345
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 19:02:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46582 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWkvN-0007Gr-Gi
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 13:02:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hWktc-0006cy-JX
	for qemu-devel@nongnu.org; Fri, 31 May 2019 13:00:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hWkta-0000eP-Ft
	for qemu-devel@nongnu.org; Fri, 31 May 2019 13:00:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:43370)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hWkta-0000d5-2V
	for qemu-devel@nongnu.org; Fri, 31 May 2019 13:00:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hWktY-0007uO-P4
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 17:00:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id B7B552E80C9
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 17:00:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 May 2019 16:50:27 -0000
From: Jerry <ubuntu@mail.jerryxiao.cc>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
	assignee=None; 
X-Launchpad-Bug-Tags: aarch64 uefi
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee jerryxiao lersek
X-Launchpad-Bug-Reporter: Jerry (jerryxiao)
X-Launchpad-Bug-Modifier: Jerry (jerryxiao)
References: <155923186868.25498.16417785082829115907.malonedeb@gac.canonical.com>
Message-Id: <155932142803.24846.8987381570456503017.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18968";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 822faa9e982bb285ffe5d1fc0657909033a65830
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1831115] Re: qemu 4.0.0 on aarch64: uefi firmware
 oversize
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1831115 <1831115@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I just noticed that it was a libvirt bug that caused the error.

-drive file=3D/opt/ovmf/aarch64/AAVMF_CODE.fd,if=3Dpflash,format=3Draw,unit=
=3D0,readonly=3Don \
-drive file=3D/var/lib/libvirt/qemu/nvram/debiantesting_VARS.fd,if=3Dpflash=
,format=3Draw,unit=3D1 \

debiantesting_VARS.fd was never removed or replaced after its first
creation since the installation errored out. I deleted this file
manually and everything is fine now.

Sorry for your inconvenience.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1831115

Title:
  qemu 4.0.0 on aarch64: uefi firmware oversize

Status in QEMU:
  Invalid

Bug description:
  I'd like to enable uefi in my virtual machine, however qemu is always sho=
wing the same error:   qemu-system-aarch64: Initialization of device cfi.pf=
lash01 failed: device requires 67108864 bytes, block backend provides 78643=
2 bytes  =

  It's clearly impossible to fit a uefi firmware into 786432 bytes.  =


  Environment: qemu-system-aarch64 with kvm on an amlogic s905d aarch64
  dev board, running archlinuxarm, qemu in the repository is compiled
  with https://download.qemu.org/qemu-4.0.0.tar.xz

  (My AAVMF_CODE.fd and AAVMF_VARS.fd are extracted from debian package
  qemu-efi-aarch64 0~20181115.85588389-3)

  Below is my libvirt log.

  2019-05-30 15:07:44.216+0000: starting up libvirt version: 5.3.0, qemu ve=
rsion: 4.0.0, kernel: 4.19.46-1-ARCH, hostname: jerry-n1.localdomain
  LC_ALL=3DC \
  PATH=3D/usr/local/sbin:/usr/local/bin:/usr/bin \
  HOME=3D/var/lib/libvirt/qemu/domain-2-debiantesting \
  XDG_DATA_HOME=3D/var/lib/libvirt/qemu/domain-2-debiantesting/.local/share=
 \
  XDG_CACHE_HOME=3D/var/lib/libvirt/qemu/domain-2-debiantesting/.cache \
  XDG_CONFIG_HOME=3D/var/lib/libvirt/qemu/domain-2-debiantesting/.config \
  QEMU_AUDIO_DRV=3Dnone \
  /usr/bin/qemu-system-aarch64 \
  -name guest=3Ddebiantesting,debug-threads=3Don \
  -S \
  -object secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/=
domain-2-debiantesting/master-key.aes \
  -machine virt-4.0,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff,gic-version=
=3D2 \
  -cpu host \
  -drive file=3D/opt/ovmf/aarch64/AAVMF_CODE.fd,if=3Dpflash,format=3Draw,un=
it=3D0,readonly=3Don \
  -drive file=3D/var/lib/libvirt/qemu/nvram/debiantesting_VARS.fd,if=3Dpfla=
sh,format=3Draw,unit=3D1 \
  -m 1024 \
  -overcommit mem-lock=3Doff \
  -smp 4,sockets=3D4,cores=3D1,threads=3D1 \
  -uuid 508d100a-b4e5-4199-9ff9-ac6d40fe2896 \
  -display none \
  -no-user-config \
  -nodefaults \
  -chardev socket,id=3Dcharmonitor,fd=3D25,server,nowait \
  -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \
  -rtc base=3Dutc \
  -no-reboot \
  -boot strict=3Don \
  -device pcie-root-port,port=3D0x8,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,mul=
tifunction=3Don,addr=3D0x1 \
  -device pcie-root-port,port=3D0x9,chassis=3D2,id=3Dpci.2,bus=3Dpcie.0,add=
r=3D0x1.0x1 \
  -device pcie-root-port,port=3D0xa,chassis=3D3,id=3Dpci.3,bus=3Dpcie.0,add=
r=3D0x1.0x2 \
  -device pcie-root-port,port=3D0xb,chassis=3D4,id=3Dpci.4,bus=3Dpcie.0,add=
r=3D0x1.0x3 \
  -device pcie-root-port,port=3D0xc,chassis=3D5,id=3Dpci.5,bus=3Dpcie.0,add=
r=3D0x1.0x4 \
  -device pcie-root-port,port=3D0xd,chassis=3D6,id=3Dpci.6,bus=3Dpcie.0,add=
r=3D0x1.0x5 \
  -device qemu-xhci,p2=3D15,p3=3D15,id=3Dusb,bus=3Dpci.2,addr=3D0x0 \
  -device virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.3,addr=3D0x0 \
  -device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.4,addr=3D0x0 \
  -drive file=3D/mnt/hddp1/jerry/libvirt/aarch64-images/debiantesting.qcow2=
,format=3Dqcow2,if=3Dnone,id=3Ddrive-scsi0-0-0-0 \
  -device scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,device_id=
=3Ddrive-scsi0-0-0-0,drive=3Ddrive-scsi0-0-0-0,id=3Dscsi0-0-0-0,bootindex=
=3D2 \
  -drive file=3D/mnt/hddp1/jerry/libvirt/aarch64-iso/debian-testing-arm64-n=
etinst.iso,format=3Draw,if=3Dnone,id=3Ddrive-scsi0-0-0-1,readonly=3Don \
  -device scsi-cd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D1,device_id=
=3Ddrive-scsi0-0-0-1,drive=3Ddrive-scsi0-0-0-1,id=3Dscsi0-0-0-1,bootindex=
=3D1 \
  -netdev tap,fd=3D27,id=3Dhostnet0 \
  -device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:d5:28:6=
d,bus=3Dpci.1,addr=3D0x0 \
  -chardev pty,id=3Dcharserial0 \
  -serial chardev:charserial0 \
  -chardev socket,id=3Dcharchannel0,fd=3D28,server,nowait \
  -device virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharchanne=
l0,id=3Dchannel0,name=3Dorg.qemu.guest_agent.0 \
  -object rng-random,id=3Dobjrng0,filename=3D/dev/urandom \
  -device virtio-rng-pci,rng=3Dobjrng0,id=3Drng0,bus=3Dpci.5,addr=3D0x0 \
  -sandbox on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourc=
econtrol=3Ddeny \
  -msg timestamp=3Don
  2019-05-30 15:07:44.216+0000: Domain id=3D2 is tainted: host-cpu
  char device redirected to /dev/pts/2 (label charserial0)
  2019-05-30T15:07:46.701125Z qemu-system-aarch64: Initialization of device=
 cfi.pflash01 failed: device requires 67108864 bytes, block backend provide=
s 786432 bytes
  2019-05-30 15:07:46.779+0000: shutting down, reason=3Dfailed
  (END)

  # /etc/libvirt/qemu.conf  =

  nvram =3D [
          "/opt/ovmf/aarch64/AAVMF_CODE.fd:/opt/ovmf/aarch64/AAVMF_VARS.fd"
  ]

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1831115/+subscriptions

