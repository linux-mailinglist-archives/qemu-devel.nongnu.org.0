Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED4B160771
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 01:11:40 +0100 (CET)
Received: from localhost ([::1]:38150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3U0h-0008MY-3Y
	for lists+qemu-devel@lfdr.de; Sun, 16 Feb 2020 19:11:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j3Tzp-0007dl-DC
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 19:10:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j3Tzo-0006cI-AX
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 19:10:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:33932)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j3Tzo-0006Yy-4n
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 19:10:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j3Tzm-0001kb-Gp
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 00:10:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 614B72E8047
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 00:10:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Feb 2020 23:59:04 -0000
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: helmutsch rth
X-Launchpad-Bug-Reporter: Helmut (helmutsch)
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
References: <158188126194.31124.5348536044519461550.malonedeb@wampee.canonical.com>
Message-Id: <158189754568.30066.9937603898112491392.launchpad@wampee.canonical.com>
Subject: [Bug 1863508] Re: qemu-system-arm stops with SIGSEGV in
 helper_gvec_eq16
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="19413b719a8df7423ab1390528edadce9e0e4aca";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 71fef7babe23af84603918bb32eaa3001ace70ca
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Reply-To: Bug 1863508 <1863508@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1863508

Title:
  qemu-system-arm stops with SIGSEGV in helper_gvec_eq16

Status in QEMU:
  In Progress

Bug description:
  Segmentation fault when trying to start FreeBSD-arm system with qemu-
  system-arm (version 4.1.1 on Fedora 31)

  Commandline:
  gdb -q --args /bin/qemu-system-arm \
   -name FreeBSD12,debug-threads=3Don \
   -m 1536 -machine virt -smp 2 \
   -M virt,highmem=3Doff -serial mon:stdio -monitor telnet::45452,server,no=
wait \
   -machine virt,accel=3Dtcg,usb=3Doff,dump-guest-core=3Doff,gic-version=3D=
2 \
   -overcommit mem-lock=3Doff -no-reboot -device virtio-rng-device \
   -bios u-boot-qemu.bin \
   -drive file=3DFreeBSD-12.1-RELEASE-arm-armv7-CUBIEBOARD2.img,if=3Dnone,i=
d=3Ddrive0,format=3Draw \
   -device ich9-ahci,id=3Dahci -device ide-drive,drive=3Ddrive0,bus=3Dahci.=
0 =


  Results:
  ....
  Mounting local filesystems:.

  Thread 4 "CPU 1/TCG" received signal SIGSEGV, Segmentation fault.
  [Switching to Thread 0x7fffcedfe700 (LWP 53608)]
  0x00005555558d9332 in helper_gvec_eq16 (d=3D0x5555566748d8, a=3D0x5555566=
748e0, b=3D0x5555566748d0, desc=3D0) at /usr/src/debug/qemu-4.1.1-1.fc31.x8=
6_64/accel/tcg/tcg-runtime-gvec.c:948
  948     DO_CMP2(16)

  Tested different versions of qemu. qemu-3.0.1 worked, but qemu-3.1.1
  failed with the same error.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1863508/+subscriptions

