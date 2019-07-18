Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E22776CE9C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 15:11:14 +0200 (CEST)
Received: from localhost ([::1]:37882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho6Bk-00055v-7h
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 09:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56617)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1ho6BS-0004VG-Ju
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 09:10:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ho6BQ-0005d9-WF
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 09:10:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:35042)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ho6BQ-0005ba-Pw
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 09:10:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ho6BP-0001cy-DW
 for <qemu-devel@nongnu.org>; Thu, 18 Jul 2019 13:10:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5EFFD2E80CC
 for <qemu-devel@nongnu.org>; Thu, 18 Jul 2019 13:10:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jul 2019 13:04:54 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lersek pmaydell
X-Launchpad-Bug-Reporter: Laszlo Ersek (Red Hat) (lersek)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <155911887030.13016.15611981837118124440.malonedeb@soybean.canonical.com>
Message-Id: <156345509414.17790.850199149998870680.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19010";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 77f9b35f7c4f7b5428f9b87606d0e5eb759f66bc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1830864] Re: Assertion `no_aa32 || ({ ARMCPU
 *cpu_ = (cpu); isar_feature_arm_div(&cpu_->isar); })' failed
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
Reply-To: Bug 1830864 <1830864@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This happens because:
 * the host kernel is older than 4.15 and does not expose ID registers to u=
serspace via the KVM_GET_ONE_REG ioctl
 * our fallback set of ID register values in target/arm/kvm64.c kvm_arm_get=
_host_cpu_features() is extremely minimalist
 * the consistency checks on ID register values in arm_cpu_realizefn() are =
made unconditionally, rather than only if we're using TCG

https://patchwork.ozlabs.org/patch/1133724/ is a fix for this which
takes the approach of only asserting if we're using TCG, since that's
really the case we're guarding for problems with and the only one that's
a bug in QEMU (as opposed to an issue with the host kernel or host CPU).

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1830864

Title:
  Assertion `no_aa32 || ({ ARMCPU *cpu_ =3D (cpu);
  isar_feature_arm_div(&cpu_->isar); })' failed

Status in QEMU:
  New

Bug description:
  The following assertion:

      assert(no_aa32 || cpu_isar_feature(arm_div, cpu));

  introduced in commit 0f8d06f16c9d ("target/arm: Conditionalize some
  asserts on aarch32 support", 2018-11-02), fails for me. I intended to
  launch a 32-bit ARM guest (with KVM acceleration) on my AArch64 host
  (APM Mustang A3).

  Libvirt generated the following QEMU command line:

  > LC_ALL=3DC \
  > PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin \
  > QEMU_AUDIO_DRV=3Dnone \
  > /opt/qemu-installed-optimized/bin/qemu-system-aarch64 \
  >   -name guest=3Df28.32bit,debug-threads=3Don \
  >   -S \
  >   -object secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/q=
emu/domain-2-f28.32bit/master-key.aes \
  >   -machine virt-4.1,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff,gic-ver=
sion=3D2 \
  >   -cpu host,aarch64=3Doff \
  >   -drive file=3D/root/QEMU_EFI.fd.padded,if=3Dpflash,format=3Draw,unit=
=3D0,readonly=3Don \
  >   -drive file=3D/var/lib/libvirt/qemu/nvram/f28.32bit_VARS.fd,if=3Dpfla=
sh,format=3Draw,unit=3D1 \
  >   -m 8192 \
  >   -realtime mlock=3Doff \
  >   -smp 8,sockets=3D8,cores=3D1,threads=3D1 \
  >   -uuid d525042e-1b37-4058-86ca-c6a2086e8485 \
  >   -no-user-config \
  >   -nodefaults \
  >   -chardev socket,id=3Dcharmonitor,fd=3D27,server,nowait \
  >   -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \
  >   -rtc base=3Dutc \
  >   -no-shutdown \
  >   -boot strict=3Don \
  >   -device pcie-root-port,port=3D0x8,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0=
,multifunction=3Don,addr=3D0x1 \
  >   -device pcie-root-port,port=3D0x9,chassis=3D2,id=3Dpci.2,bus=3Dpcie.0=
,addr=3D0x1.0x1 \
  >   -device pcie-root-port,port=3D0xa,chassis=3D3,id=3Dpci.3,bus=3Dpcie.0=
,addr=3D0x1.0x2 \
  >   -device pcie-root-port,port=3D0xb,chassis=3D4,id=3Dpci.4,bus=3Dpcie.0=
,addr=3D0x1.0x3 \
  >   -device pcie-root-port,port=3D0xc,chassis=3D5,id=3Dpci.5,bus=3Dpcie.0=
,addr=3D0x1.0x4 \
  >   -device pcie-root-port,port=3D0xd,chassis=3D6,id=3Dpci.6,bus=3Dpcie.0=
,addr=3D0x1.0x5 \
  >   -device qemu-xhci,id=3Dusb,bus=3Dpci.1,addr=3D0x0 \
  >   -device virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.2,addr=3D0x0 \
  >   -device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.3,addr=3D0x0 \
  >   -drive file=3D/var/lib/libvirt/images/f28.32bit.root.qcow2,format=3Dq=
cow2,if=3Dnone,id=3Ddrive-scsi0-0-0-0,werror=3Denospc,cache=3Dwriteback,dis=
card=3Dunmap \
  >   -device scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,drive=
=3Ddrive-scsi0-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D1,write-cache=3Don \
  >   -drive file=3D/var/lib/libvirt/images/f28.32bit.home.qcow2,format=3Dq=
cow2,if=3Dnone,id=3Ddrive-scsi0-0-0-1,werror=3Denospc,cache=3Dwriteback,dis=
card=3Dunmap \
  >   -device scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D1,drive=
=3Ddrive-scsi0-0-0-1,id=3Dscsi0-0-0-1,write-cache=3Don \
  >   -netdev tap,fd=3D29,id=3Dhostnet0,vhost=3Don,vhostfd=3D30 \
  >   -device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:6f:=
d1:c8,bus=3Dpci.4,addr=3D0x0,romfile=3D \
  >   -chardev pty,id=3Dcharserial0 \
  >   -serial chardev:charserial0 \
  >   -chardev socket,id=3Dcharchannel0,fd=3D31,server,nowait \
  >   -device virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharch=
annel0,id=3Dchannel0,name=3Dorg.qemu.guest_agent.0 \
  >   -device usb-tablet,id=3Dinput0,bus=3Dusb.0,port=3D1 \
  >   -device usb-kbd,id=3Dinput1,bus=3Dusb.0,port=3D2 \
  >   -vnc 127.0.0.1:0 \
  >   -device virtio-gpu-pci,id=3Dvideo0,max_outputs=3D1,bus=3Dpci.5,addr=
=3D0x0 \
  >   -object rng-random,id=3Dobjrng0,filename=3D/dev/urandom \
  >   -device virtio-rng-pci,rng=3Dobjrng0,id=3Drng0,max-bytes=3D1048576,pe=
riod=3D1000,bus=3Dpci.6,addr=3D0x0 \
  >   -msg timestamp=3Don

  and then I got:

  > qemu-system-aarch64: /root/src/upstream/qemu/target/arm/cpu.c:986:
  > arm_cpu_realizefn: Assertion `no_aa32 || ({ ARMCPU *cpu_ =3D (cpu);
  > isar_feature_arm_div(&cpu_->isar); })' failed.

  QEMU was built at commit 8dc7fd56dd4f ("Merge remote-tracking branch
  'remotes/philmd-gitlab/tags/fw_cfg-20190523-pull-request' into staging",
  2019-05-23).

  (Originally reported on the mailing list in the following thread:
  <http://mid.mail-archive.com/3e3d2018-3993-f651-8e94-5bea612bd776@redhat.=
com>.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1830864/+subscriptions

