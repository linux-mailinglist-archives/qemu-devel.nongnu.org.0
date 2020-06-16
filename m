Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F121FB991
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 18:05:06 +0200 (CEST)
Received: from localhost ([::1]:41330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlE5A-0005AL-SU
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 12:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jlE1M-0001IN-NX
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 12:01:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:59376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jlE1K-0003Ch-AY
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 12:01:08 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jlE1I-00044O-Fu
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 16:01:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 773662E8052
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 16:01:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2020 15:52:59 -0000
From: Bugs SysSec <1681439@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bugs-syssec janitor jnsnow kempniu th-huth
X-Launchpad-Bug-Reporter: =?utf-8?b?TWljaGHFgiBLxJlwaWXFhCAoa2VtcG5pdSk=?=
X-Launchpad-Bug-Modifier: Bugs SysSec (bugs-syssec)
References: <20170410132346.31250.84835.malonedeb@wampee.canonical.com>
Message-Id: <159232277945.11261.12671654413959189703.malone@gac.canonical.com>
Subject: [Bug 1681439] Re: qemu-system-x86_64: hw/ide/core.c:685:
 ide_cancel_dma_sync: Assertion `s->bus->dma->aiocb == NULL' failed.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b190cebbf563f89e480a8b57f641753c8196bda0";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 334ed2cb7be4d2ab5ede1f854c76e5450f466f16
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 11:30:43
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1681439 <1681439@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We found a reproducer during fuzzing:

```
qemu-system-x86_64: hw/ide/core.c:724: ide_cancel_dma_sync: Assertion `s->b=
us->dma->aiocb =3D=3D NULL' failed.
```

To reproduce run the QEMU with the following command line:
```
qemu-system-x86_64 -cdrom hypertrash.iso -nographic -m 100 -enable-kvm -net=
 none -hda hda.img
```

QEMU Version:
```
# qemu-5.0.0
$ ./configure --target-list=3Dx86_64-softmmu --enable-sanitizers; make
$ x86_64-softmmu/qemu-system-x86_64 --version
QEMU emulator version 5.0.0
Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers
```

To create disk image run:
```
qemu-img create hda.img 10M
```


** Attachment added: "ide_assert1.zip"
   https://bugs.launchpad.net/qemu/+bug/1681439/+attachment/5384437/+files/=
ide_assert1.zip

** Changed in: qemu
       Status: Expired =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1681439

Title:
  qemu-system-x86_64: hw/ide/core.c:685: ide_cancel_dma_sync: Assertion
  `s->bus->dma->aiocb =3D=3D NULL' failed.

Status in QEMU:
  New

Bug description:
  Since upgrading to QEMU 2.8.0, my Windows 7 64-bit virtual machines
  started crashing due to the assertion quoted in the summary failing.
  The assertion in question was added by commit 9972354856 ("block: add
  BDS field to count in-flight requests").  My tests show that setting
  discard=3Dunmap is needed to reproduce the issue.  Speaking of
  reproduction, it is a bit flaky, because I have been unable to come up
  with specific instructions that would allow the issue to be triggered
  outside of my environment, but I do have a semi-sane way of testing that
  appears to depend on a specific initial state of data on the underlying
  storage volume, actions taken within the VM and waiting for about 20
  minutes.

  Here is the shortest QEMU command line that I managed to reproduce the
  bug with:

      qemu-system-x86_64 \
          -machine pc-i440fx-2.7,accel=3Dkvm \
          -m 3072 \
          -drive file=3D/dev/lvm/qemu,format=3Draw,if=3Dide,discard=3Dunmap=
 \
  	-netdev tap,id=3Dhostnet0,ifname=3Dtap0,script=3Dno,downscript=3Dno,vhos=
t=3Don \
          -device virtio-net-pci,netdev=3Dhostnet0 \
  	-vnc :0

  The underlying storage (/dev/lvm/qemu) is a thin LVM snapshot.

  QEMU was compiled using:

      ./configure --python=3D/usr/bin/python2.7 --target-list=3Dx86_64-soft=
mmu
      make -j3

  My virtualization environment is not really a critical one and
  reproduction is not that much of a hassle, so if you need me to gather
  further diagnostic information or test patches, I will be happy to help.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1681439/+subscriptions

