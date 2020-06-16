Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78001FB9DB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 18:07:28 +0200 (CEST)
Received: from localhost ([::1]:48402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlE7T-00006V-PC
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 12:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jlE5v-00074k-3J
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 12:05:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:59916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jlE5r-0004EJ-Qo
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 12:05:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jlE5p-0004Vc-I3
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 16:05:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 86EAA2E802B
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 16:05:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2020 15:56:16 -0000
From: Bugs SysSec <1883739@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bugs-syssec
X-Launchpad-Bug-Reporter: Bugs SysSec (bugs-syssec)
X-Launchpad-Bug-Modifier: Bugs SysSec (bugs-syssec)
Message-Id: <159232297702.28606.15425668787325606341.malonedeb@soybean.canonical.com>
Subject: [Bug 1883739] [NEW] ide_dma_cb: Assertion `prep_size >= 0 &&
 prep_size <= n * 512' failed.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b190cebbf563f89e480a8b57f641753c8196bda0";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 5f37e17c2c2640fa9b80bee92c1d2ce3f41a916d
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
Reply-To: Bug 1883739 <1883739@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

To reproduce run the QEMU with the following command line:
```
qemu-system-x86_64 -cdrom hypertrash.iso -nographic -m 100 -enable-kvm -net=
 none -drive id=3Ddisk,file=3Dhda.img,if=3Dnone -device ahci,id=3Dahci -dev=
ice ide-hd,drive=3Ddisk,bus=3Dahci.0
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
dd if=3D/dev/zero of=3Dhda.img bs=3D1024 count=3D1024
```

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "ide_bug_2.zip"
   https://bugs.launchpad.net/bugs/1883739/+attachment/5384438/+files/ide_b=
ug_2.zip

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1883739

Title:
  ide_dma_cb: Assertion `prep_size >=3D 0 && prep_size <=3D n * 512' failed.

Status in QEMU:
  New

Bug description:
  To reproduce run the QEMU with the following command line:
  ```
  qemu-system-x86_64 -cdrom hypertrash.iso -nographic -m 100 -enable-kvm -n=
et none -drive id=3Ddisk,file=3Dhda.img,if=3Dnone -device ahci,id=3Dahci -d=
evice ide-hd,drive=3Ddisk,bus=3Dahci.0
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
  dd if=3D/dev/zero of=3Dhda.img bs=3D1024 count=3D1024
  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1883739/+subscriptions

