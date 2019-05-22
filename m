Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D1625C61
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 05:53:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTIJZ-0003Vc-1w
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 23:53:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hTIGy-0001k4-EU
	for qemu-devel@nongnu.org; Tue, 21 May 2019 23:50:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hTIGx-0000uM-4F
	for qemu-devel@nongnu.org; Tue, 21 May 2019 23:50:36 -0400
Received: from indium.canonical.com ([91.189.90.7]:58474)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hTIGw-0000to-Uz
	for qemu-devel@nongnu.org; Tue, 21 May 2019 23:50:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hTIGv-0000ff-Ta
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 03:50:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id DD0D72E80C7
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 03:50:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 May 2019 03:45:05 -0000
From: Eunseok Choi <1829964@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: android-x86 leak virt-gpu vram
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: riosnai
X-Launchpad-Bug-Reporter: Eunseok Choi (riosnai)
X-Launchpad-Bug-Modifier: Eunseok Choi (riosnai)
References: <155849647074.15430.13880026935625975661.malonedeb@wampee.canonical.com>
Message-Id: <155849670573.15101.16014286335079778238.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18962";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 5962a1036a3b3282d76e2b0dd9007a7d4273d628
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1829964] Re: HOST VRAM Leak when performs
 android-x86 window rotation with Virt-GPU
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
Reply-To: Bug 1829964 <1829964@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here are qemu options I used...

-machine type=3Dq35,accel=3Dkvm -cpu host --enable-kvm \
-smp cpus=3D4,cores=3D4,threads=3D1 -m 4096 \
-drive file=3Dctb0319.qcow2,format=3Dqcow2,if=3Dvirtio,aio=3Dthreads \
-device virtio-vga,virgl=3Don \
-device qemu-xhci,id=3Dxhci -device usb-mouse,bus=3Dxhci.0 -device usb-kbd,=
bus=3Dxhci.0 \
-soundhw hda -display sdl,gl=3Don -netdev user,id=3Dqemunet0,hostfwd=3Dtcp:=
:4000-:7000,hostfwd=3Dtcp::5555-:5555,hostfwd=3Dtcp::4012-:7012,hostfwd=3Dt=
cp::4013-:7013 -device virtio-net,netdev=3Dqemunet0 -boot menu=3Don

** Description changed:

  I will report something strange thing about host VRAM leakage after
  anroid-x86 window rotation when it runs with virt-gpu(+ virgl-renderer)
  =

  Please watching below video link.
  =

  https://www.youtube.com/watch?v=3DmJIbGZLWF1s&feature=3Dyoutu.be
  =

  (orginal video file : https://drive.google.com/file/d
  /1lkdTx_8yTbSVjKXlnxnnk96fWe-w6Mxb/view?usp=3Dsharing)
  =

  I don't sure what is the problem...
  =

  Here are my tested history
  -------------------------------------------------------------------------=
-------------------------
  Install android-x86 on I7 desktop PCs with intel UHD GPU  - No leak.
  Install android-x86 on I7 desktop PCs with NVIDIA GTX GPU series - No lea=
k.
  Install android-x86 on guest machine emulated skylake cpu with QEMU(+virt=
-gpu, virgl-renderer) - Leak
  (HOST CPU - I5, INTEL UHD GPU)
  Install android-x86 on guest machine emulated skylake cpu with QEMU(+virt=
-gpu, virgl-renderer) - Leak
  (HOST CPU - I7, NVIDIA GTX GPU)
  =

  COMMON:
  In case of NVIDIA GPU : check vram using nvidia-smi
  In case of intel UHD GPU : check shared-vram using free cmd
  =

  We checked guest android-x86 system down when vram is full after performi=
ng many rotation
  -------------------------------------------------------------------------=
------------------
  =

  Is it virt-gpu driver's problem?
  =

  I hope someone can help me...
  =

  Thanks in advance!!
+ =

+ =

+ PS
+ =

+ =

+ Here are qemu options I used...
+ =

+ -machine type=3Dq35,accel=3Dkvm -cpu host --enable-kvm \
+ -smp cpus=3D4,cores=3D4,threads=3D1 -m 4096 \
+ -drive file=3Dctb0319.qcow2,format=3Dqcow2,if=3Dvirtio,aio=3Dthreads \
+ -device virtio-vga,virgl=3Don \
+ -device qemu-xhci,id=3Dxhci -device usb-mouse,bus=3Dxhci.0 -device usb-kb=
d,bus=3Dxhci.0 \
+ -soundhw hda -display sdl,gl=3Don -netdev user,id=3Dqemunet0,hostfwd=3Dtc=
p::4000-:7000,hostfwd=3Dtcp::5555-:5555,hostfwd=3Dtcp::4012-:7012,hostfwd=
=3Dtcp::4013-:7013 -device virtio-net,netdev=3Dqemunet0 -boot menu=3Don

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1829964

Title:
  HOST VRAM Leak when performs android-x86 window rotation with Virt-GPU

Status in QEMU:
  New

Bug description:
  I will report something strange thing about host VRAM leakage after
  anroid-x86 window rotation when it runs with virt-gpu(+ virgl-
  renderer)

  Please watching below video link.

  https://www.youtube.com/watch?v=3DmJIbGZLWF1s&feature=3Dyoutu.be

  (orginal video file : https://drive.google.com/file/d
  /1lkdTx_8yTbSVjKXlnxnnk96fWe-w6Mxb/view?usp=3Dsharing)

  I don't sure what is the problem...

  Here are my tested history
  -------------------------------------------------------------------------=
-------------------------
  Install android-x86 on I7 desktop PCs with intel UHD GPU  - No leak.
  Install android-x86 on I7 desktop PCs with NVIDIA GTX GPU series - No lea=
k.
  Install android-x86 on guest machine emulated skylake cpu with QEMU(+virt=
-gpu, virgl-renderer) - Leak
  (HOST CPU - I5, INTEL UHD GPU)
  Install android-x86 on guest machine emulated skylake cpu with QEMU(+virt=
-gpu, virgl-renderer) - Leak
  (HOST CPU - I7, NVIDIA GTX GPU)

  COMMON:
  In case of NVIDIA GPU : check vram using nvidia-smi
  In case of intel UHD GPU : check shared-vram using free cmd

  We checked guest android-x86 system down when vram is full after performi=
ng many rotation
  -------------------------------------------------------------------------=
------------------

  Is it virt-gpu driver's problem?

  I hope someone can help me...

  Thanks in advance!!


  PS


  Here are qemu options I used...

  -machine type=3Dq35,accel=3Dkvm -cpu host --enable-kvm \
  -smp cpus=3D4,cores=3D4,threads=3D1 -m 4096 \
  -drive file=3Dctb0319.qcow2,format=3Dqcow2,if=3Dvirtio,aio=3Dthreads \
  -device virtio-vga,virgl=3Don \
  -device qemu-xhci,id=3Dxhci -device usb-mouse,bus=3Dxhci.0 -device usb-kb=
d,bus=3Dxhci.0 \
  -soundhw hda -display sdl,gl=3Don -netdev user,id=3Dqemunet0,hostfwd=3Dtc=
p::4000-:7000,hostfwd=3Dtcp::5555-:5555,hostfwd=3Dtcp::4012-:7012,hostfwd=
=3Dtcp::4013-:7013 -device virtio-net,netdev=3Dqemunet0 -boot menu=3Don

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1829964/+subscriptions

