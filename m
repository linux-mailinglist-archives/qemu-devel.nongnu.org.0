Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669A4141230
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 21:17:03 +0100 (CET)
Received: from localhost ([::1]:34236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isY3C-0006Cu-0b
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 15:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45793)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1isY1v-0005lA-Ej
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 15:15:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1isY1q-000056-Mj
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 15:15:43 -0500
Received: from indium.canonical.com ([91.189.90.7]:46682)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1isY1q-0008SN-Bv
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 15:15:38 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1isY1o-0005Hj-6C
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 20:15:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 204112E802B
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 20:15:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jan 2020 20:05:39 -0000
From: JS <1859920@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: js1943 th-huth
X-Launchpad-Bug-Reporter: JS (js1943)
X-Launchpad-Bug-Modifier: JS (js1943)
References: <157915647770.15306.7117337280333115892.malonedeb@wampee.canonical.com>
Message-Id: <157929153959.24101.3244699514526045714.malone@chaenomeles.canonical.com>
Subject: [Bug 1859920] Re: daemoniz not working on MacOS
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f1052173880d8dae43faa7c2fc45da1b42227143";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: c7fb5e6ff30b6fc7be4c243541a25cfd8c6e644e
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
Reply-To: Bug 1859920 <1859920@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I tried with following and it work:

qemu-system-x86_64 -no-user-config -nodefaults -name u64d01 -M
q35,accel=3Dhvf,usb=3Doff,vmport=3Doff -cpu host -smp 4 -m 8192 -overcommit
mem-lock=3Doff -overcommit cpu-pm=3Doff -rtc base=3Dutc,clock=3Dhost -device
virtio-blk-pci,drive=3Dssd1 -drive
id=3Dssd1,file=3D/Users/js/code/vm/qemu/u64s01.qcow2,if=3Dnone,format=3Dqco=
w2
-device virtio-net-pci,netdev=3Dnic1,mac=3D52:54:98:76:54:33 -netdev
user,id=3Dnic1,ipv4=3Don,ipv6=3Don,hostname=3Du64d01,hostfwd=3Dtcp::2222-:22
-daemonize -display none -device virtio-tablet-pci -device virtio-vga
-show-cursor

The difference from my original command:
(1) removed -audiodev
(2) added -display none

So (1) and (2) together allow -daemonize work correctly.

Other observation during testing:

- If I only do (1), but not (2), the command will not exit, I cannot ssh
into the vm. So it seems vm initialization is stuck. I can ctrl-c to
break it.

- If I don't do (2), regardless of (1), I get following errors:
objc[1962]: +[NSNumber initialize] may have been in progress in another thr=
ead when fork() was called.
objc[1962]: +[NSNumber initialize] may have been in progress in another thr=
ead when fork() was called. We cannot safely call it or ignore it in the fo=
rk() child process. Crashing instead. Set a breakpoint on objc_initializeAf=
terForkError to debug.

Not sure if above observations are expected or unhandled error.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859920

Title:
  daemoniz not working on MacOS

Status in QEMU:
  Incomplete

Bug description:
  OS: MacOS Catalina 10.15.2
  Qemu install via brew: brew install qemu

  qemu-system-x86_64 -version
  QEMU emulator version 4.2.50 (v4.2.0-13-g084a398bf8-dirty)
  Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers

  ---

  Start Ubuntu Desktop 18.04 client as follow:

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
  -daemonize

  Give following error:

  objc[3432]: +[NSNumber initialize] may have been in progress in another t=
hread when fork() was called.
  objc[3432]: +[NSNumber initialize] may have been in progress in another t=
hread when fork() was called. We cannot safely call it or ignore it in the =
fork() child process. Crashing instead. Set a breakpoint on objc_initialize=
AfterForkError to debug.

  =

  I checked "ps -ef|grep qemu" before and after the command, there was no q=
emu process running.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859920/+subscriptions

