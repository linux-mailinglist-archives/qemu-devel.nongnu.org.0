Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B8813D461
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 07:36:45 +0100 (CET)
Received: from localhost ([::1]:37250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irylo-0000Mg-WC
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 01:36:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43524)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iryki-0008NA-91
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 01:35:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1irykg-0007ja-UW
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 01:35:36 -0500
Received: from indium.canonical.com ([91.189.90.7]:33064)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1irykg-0007ii-OY
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 01:35:34 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1irykf-00032K-Go
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 06:35:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7955A2E8042
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 06:35:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jan 2020 06:25:30 -0000
From: JS <1859916@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: js1943
X-Launchpad-Bug-Reporter: JS (js1943)
X-Launchpad-Bug-Modifier: JS (js1943)
Message-Id: <157915593050.14807.16939354364023930380.malonedeb@wampee.canonical.com>
Subject: [Bug 1859916] [NEW] coreaudio not working on MacOS
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: c4be049fec0ea77fccb6b84f9809d63a388651fa
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
Reply-To: Bug 1859916 <1859916@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

OS: MacOS Catalina 10.15.2

qemu-system-x86_64 -version
QEMU emulator version 4.2.50 (v4.2.0-13-g084a398bf8-dirty)
Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers

Qemu install via brew: brew install qemu

---

I use following to install Ubuntu 18.04 desktop successfully:-

IMG_CD=3D$HOME/Downloads/iso/ubuntu-18.04.3-desktop-amd64.iso
IMG_FILE=3D$HOME/code/vm/qemu/u64d01.qcow2
MAC_ADDR=3Dxx:xx:xx:xx:xx:xx

qemu-system-x86_64 \
-no-user-config -nodefaults \
-show-cursor \
-name u64d01 \
-M q35,accel=3Dhvf,usb=3Doff,vmport=3Doff \
-cpu host -smp 4 -m 2048 \
-overcommit mem-lock=3Doff \
-overcommit cpu-pm=3Doff \
-rtc base=3Dutc,clock=3Dhost \
\
-device virtio-tablet-pci \
-device virtio-vga \
\
-device virtio-blk-pci,drive=3Dssd1 \
-drive id=3Dssd1,file=3D$IMG_FILE,if=3Dnone,format=3Dqcow2 \
\
-device virtio-net-pci,netdev=3Dnic1,mac=3D$MAC_ADDR \
-netdev user,id=3Dnic1,ipv4=3Don,ipv6=3Don,hostname=3Du64d01,hostfwd=3Dtcp:=
:2222-:22 \
\
-device ich9-intel-hda,id=3Dsnd,msi=3Don \
-device hda-output,id=3Dsnd-codec0,bus=3Dsnd.0,cad=3D0,audiodev=3Dsnd0 \
-audiodev coreaudio,id=3Dsnd0,out.buffer-count=3D10000 \
\
-cdrom $IMG_CD

Removing the last -cdrom line Ubuntu desktop boot up and everything work
perfectly except the audio.

I test with wav audio driver by replacing the -audiodev line as follow,
which save the client audio to a wave file, like below and it work
perfectly:

-audiodev wav,id=3Dsnd0,path=3D$HOME/qemu.wav

I start the vm, open firefox and play a few video, then shutdown the vm.
Then I can play the qemu.wav file and all the audio was recorded there.

However, I can't get audio directly with coreaudio.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859916

Title:
  coreaudio not working on MacOS

Status in QEMU:
  New

Bug description:
  OS: MacOS Catalina 10.15.2

  qemu-system-x86_64 -version
  QEMU emulator version 4.2.50 (v4.2.0-13-g084a398bf8-dirty)
  Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers

  Qemu install via brew: brew install qemu

  ---

  I use following to install Ubuntu 18.04 desktop successfully:-

  IMG_CD=3D$HOME/Downloads/iso/ubuntu-18.04.3-desktop-amd64.iso
  IMG_FILE=3D$HOME/code/vm/qemu/u64d01.qcow2
  MAC_ADDR=3Dxx:xx:xx:xx:xx:xx

  qemu-system-x86_64 \
  -no-user-config -nodefaults \
  -show-cursor \
  -name u64d01 \
  -M q35,accel=3Dhvf,usb=3Doff,vmport=3Doff \
  -cpu host -smp 4 -m 2048 \
  -overcommit mem-lock=3Doff \
  -overcommit cpu-pm=3Doff \
  -rtc base=3Dutc,clock=3Dhost \
  \
  -device virtio-tablet-pci \
  -device virtio-vga \
  \
  -device virtio-blk-pci,drive=3Dssd1 \
  -drive id=3Dssd1,file=3D$IMG_FILE,if=3Dnone,format=3Dqcow2 \
  \
  -device virtio-net-pci,netdev=3Dnic1,mac=3D$MAC_ADDR \
  -netdev user,id=3Dnic1,ipv4=3Don,ipv6=3Don,hostname=3Du64d01,hostfwd=3Dtc=
p::2222-:22 \
  \
  -device ich9-intel-hda,id=3Dsnd,msi=3Don \
  -device hda-output,id=3Dsnd-codec0,bus=3Dsnd.0,cad=3D0,audiodev=3Dsnd0 \
  -audiodev coreaudio,id=3Dsnd0,out.buffer-count=3D10000 \
  \
  -cdrom $IMG_CD

  Removing the last -cdrom line Ubuntu desktop boot up and everything
  work perfectly except the audio.

  I test with wav audio driver by replacing the -audiodev line as
  follow, which save the client audio to a wave file, like below and it
  work perfectly:

  -audiodev wav,id=3Dsnd0,path=3D$HOME/qemu.wav

  I start the vm, open firefox and play a few video, then shutdown the
  vm. Then I can play the qemu.wav file and all the audio was recorded
  there.

  However, I can't get audio directly with coreaudio.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859916/+subscriptions

