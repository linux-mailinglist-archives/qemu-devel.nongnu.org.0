Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F6F2F0510
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 05:27:50 +0100 (CET)
Received: from localhost ([::1]:45474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kySKT-000122-JV
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 23:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIk-0007ks-Et
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:02 -0500
Received: from indium.canonical.com ([91.189.90.7]:40382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIh-0000g0-PC
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:02 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kySIf-0000Dj-Lw
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:25:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A45582E8147
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:25:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 Jan 2021 04:17:33 -0000
From: Launchpad Bug Tracker <1761153@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor mgautierfr th-huth
X-Launchpad-Bug-Reporter: Matthieu Gautier (mgautierfr)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <152284551397.28710.6742910020765706357.malonedeb@chaenomeles.canonical.com>
Message-Id: <161025225373.18863.12111676248942722411.malone@loganberry.canonical.com>
Subject: [Bug 1761153] Re: qemu-user incorrect mmap for large files on 64bits
 host and 32bits executable.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 45fc62b23d126ecc10ca99f2f9629ca95364a25d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1761153 <1761153@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1761153

Title:
  qemu-user incorrect mmap for large files on 64bits host and 32bits
  executable.

Status in QEMU:
  Expired

Bug description:
  qemu-user seems to incorrectly mmap a file if the offset is > 4GiB and
  guest binary is 32 bits elf.

  See attached test program `test_mmap.c`.

  ```
  $ gcc -g -m32 -march=3Di386 test_mmap.c -o test_mmap
  $ file test_mmap
  test_mmap: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dyna=
mically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux 3.2.0, BuildI=
D[sha1]=3De36db05f4dfd8a9cfde8a969214a242c1f5a4b49, with debug_info, not st=
ripped
  $ uname -a
  Linux localhost.localdomain 4.15.10-300.fc27.x86_64 #1 SMP Thu Mar 15 17:=
13:04 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux
  $ qemu-i386 --version
  qemu-i386 version 2.10.1(qemu-2.10.1-2.fc27)
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers
  $ ./test_mmap
  $ qemu-i386 test_mmap
  Incorrect data 1
  ```

  Tested with qemu-i386 packaged in Fedora 27 and qemu-i386 compiled
  from git master (094b62cd9c)

  The issue was firstly detected on (more complex program) using qemu-
  arm (with 32bits binary) so it is probably a 32/64bits problem
  independently of the cpu family.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1761153/+subscriptions

