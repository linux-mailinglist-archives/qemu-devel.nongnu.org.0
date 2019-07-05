Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E4C609DB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 17:59:52 +0200 (CEST)
Received: from localhost ([::1]:54372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjQco-0006oE-Qp
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 11:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38384)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hjQXt-0003JL-Mj
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 11:54:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hjQXs-0005dz-Fh
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 11:54:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:39040)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hjQXs-0005Vn-9Q
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 11:54:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hjQXq-0000Ht-D8
 for <qemu-devel@nongnu.org>; Fri, 05 Jul 2019 15:54:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 627A42E80CB
 for <qemu-devel@nongnu.org>; Fri,  5 Jul 2019 15:54:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jul 2019 15:37:30 -0000
From: Ari Sundholm <1462640@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: mips testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee janitor laurent-vivier megari th-huth
 v-adrien
X-Launchpad-Bug-Reporter: AH (v-adrien)
X-Launchpad-Bug-Modifier: Ari Sundholm (megari)
References: <20150606150101.12665.95850.malonedeb@soybean.canonical.com>
Message-Id: <156234105039.25091.1171772890331339515.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 6d01365b02d15f749bfefbde11a85c535832497e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1462640] Re: shmat fails on 32-to-64 setup
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
Reply-To: Bug 1462640 <1462640@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For comparison, the strace output when running natively:

shmget(IPC_PRIVATE, 688128, IPC_CREAT|IPC_EXCL|0666) =3D 72843341
shmctl(72843341, IPC_64|IPC_STAT, {shm_perm=3D{uid=3D1000, gid=3D1000, mode=
=3D0666, key=3D0, cuid=3D1000, cgid=3D1000}, shm_segsz=3D688128, shm_cpid=
=3D10883, shm_lpid=3D0, shm_nattch=3D0, shm_atime=3D0, shm_dtime=3D0, shm_c=
time=3D1562340846}) =3D 0
shmat(72843341, 0xf38ea000, 0)          =3D 0xf38ea000
fstat64(1, {st_mode=3DS_IFCHR|0620, st_rdev=3Dmakedev(136, 12), ...}) =3D 0
brk(NULL)                               =3D 0x58069000
brk(0x5808a000)                         =3D 0x5808a000
brk(0x5808b000)                         =3D 0x5808b000
write(1, "got err 0, ptr 0xf38ea000\n", 26got err 0, ptr 0xf38ea000
) =3D 26
exit_group(0)                           =3D ?
+++ exited with 0 +++
~/qemu$

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1462640

Title:
  shmat fails on 32-to-64 setup

Status in QEMU:
  Confirmed

Bug description:
  =

  I am trying to run a guest mips32 program (user mode) on a x86_64 host. T=
he program fails on a call to shmat() reproducibly. when digging into this =
problem, I could make a small guest POC that fails when compiled as i386 (-=
m32) running on a x86_64 host, but pass when compiled as 64bit. The problem=
 has to do with mmap flags.

  From what I can understand, when running 32bits guests programs, qemu
  reserve the whole guest virtual space with an mmap call. That mmap
  call specifys MAP:PRIVATE flag. When shmat is called, it tries to make
  part of that region MAP_SHARED and that fails.

  As a possible fix, it looks like it is possible to first unmap the shm
  region before calling shmat.

  steps to reproduce: =

  1 - create a file shm.c with content below
  2 - compile with: gcc -m32 shm.c -o shm32
  3 - run on a x86_64 host: qemu-i386 ./shm32 =

  4 - observe shmat fails, by returning ptr -1

  5- compile without -m32: : gcc shm.c -o shm64
  6 - observe it pass: qemu-x84_64 ./shm64


  #include <sys/ipc.h>
  #include <sys/shm.h>
  #include <sys/mman.h>
  #include <stdio.h>

  int main()
  {
      struct shmid_ds shm_desc;
      int err =3D 0;
      int id =3D shmget(IPC_PRIVATE, 688128, IPC_CREAT|IPC_EXCL|0666);
      err =3D shmctl(id, IPC_STAT, &shm_desc);
      const void *at =3D 0x7f7df38ea000;
      void* ptr =3D shmat(id, at, 0);
      printf( "got err %d, ptr %p\n", err, ptr );
  }

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1462640/+subscriptions

