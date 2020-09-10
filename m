Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AFC263BA9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 05:56:30 +0200 (CEST)
Received: from localhost ([::1]:41730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGDhF-0005WW-3I
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 23:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kGDgU-00050e-GV
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 23:55:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:40988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kGDgS-0005lB-5D
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 23:55:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kGDgP-0001mz-BL
 for <qemu-devel@nongnu.org>; Thu, 10 Sep 2020 03:55:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0827F2E8105
 for <qemu-devel@nongnu.org>; Thu, 10 Sep 2020 03:55:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2020 03:46:21 -0000
From: Hansni Bu <1895080@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hansni
X-Launchpad-Bug-Reporter: Hansni Bu (hansni)
X-Launchpad-Bug-Modifier: Hansni Bu (hansni)
Message-Id: <159970958159.31371.12301700684467003959.malonedeb@wampee.canonical.com>
Subject: [Bug 1895080] [NEW] pgb_reserved_va: Assertion `addr == test' failed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="90a5703803d95539bdb5c0b289b1675630569e1e"; Instance="production"
X-Launchpad-Hash: a332120a5d9b48ef8c3971e7ccaf6f779a5bcfae
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 23:55:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1895080 <1895080@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

This problem occurs on CentOS-7.5 (64-bit) with qemu-5.1.0, qemu head
(commit 9435a8b3dd35f1f926f1b9127e8a906217a5518a) for riscv32-linux-
user.

Firstly, compile fails:
Compiling C object libqemu-riscv32-linux-user.fa.p/linux-user_strace.c.o
../qemu.git/linux-user/strace.c:1210:18: error: =E2=80=98FALLOC_FL_KEEP_SIZ=
E=E2=80=99 undeclared here (not in a function)
     FLAG_GENERIC(FALLOC_FL_KEEP_SIZE),

I have to add below include to linux-user/strace.c
diff --git a/linux-user/strace.c b/linux-user/strace.c
index 11fea14fba..22e51d4a8a 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -7,6 +7,7 @@
 #include <sys/mount.h>
 #include <arpa/inet.h>
 #include <netinet/tcp.h>
+#include <linux/falloc.h>
 #include <linux/if_packet.h>
 #include <linux/netlink.h>
 #include <sched.h>

Then trying qemu-riscv32 with a simple ELF, I get:
linux-user/elfload.c:2341: pgb_reserved_va: Assertion `addr =3D=3D test' fa=
iled.

strace shows that:
mmap(0x1000, 4294963200, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_NORESERVE=
, -1, 0) =3D 0x10000
write(2, "qemu-riscv32: ../qemu.git/linux-"..., 103qemu-riscv32: ../qemu.gi=
t/linux-user/elfload.c:2341: pgb_reserved_va: Assertion `addr =3D=3D test' =
failed.
) =3D 103

The source code is in the function pgb_reserved_va (linux-
user/elfload.c). I think mmap cannot guarantee that the returned pointer
(test) equals to the parameter of addr. So is this a bug to assert (addr
=3D=3D test)?

Attached configure script and test ELF file.

Thanks.

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "config script and test ELF file"
   https://bugs.launchpad.net/bugs/1895080/+attachment/5409254/+files/confi=
g_and_elf.tar.xz

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1895080

Title:
  pgb_reserved_va: Assertion `addr =3D=3D test' failed

Status in QEMU:
  New

Bug description:
  This problem occurs on CentOS-7.5 (64-bit) with qemu-5.1.0, qemu head
  (commit 9435a8b3dd35f1f926f1b9127e8a906217a5518a) for riscv32-linux-
  user.

  Firstly, compile fails:
  Compiling C object libqemu-riscv32-linux-user.fa.p/linux-user_strace.c.o
  ../qemu.git/linux-user/strace.c:1210:18: error: =E2=80=98FALLOC_FL_KEEP_S=
IZE=E2=80=99 undeclared here (not in a function)
       FLAG_GENERIC(FALLOC_FL_KEEP_SIZE),

  I have to add below include to linux-user/strace.c
  diff --git a/linux-user/strace.c b/linux-user/strace.c
  index 11fea14fba..22e51d4a8a 100644
  --- a/linux-user/strace.c
  +++ b/linux-user/strace.c
  @@ -7,6 +7,7 @@
   #include <sys/mount.h>
   #include <arpa/inet.h>
   #include <netinet/tcp.h>
  +#include <linux/falloc.h>
   #include <linux/if_packet.h>
   #include <linux/netlink.h>
   #include <sched.h>

  Then trying qemu-riscv32 with a simple ELF, I get:
  linux-user/elfload.c:2341: pgb_reserved_va: Assertion `addr =3D=3D test' =
failed.

  strace shows that:
  mmap(0x1000, 4294963200, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_NORESER=
VE, -1, 0) =3D 0x10000
  write(2, "qemu-riscv32: ../qemu.git/linux-"..., 103qemu-riscv32: ../qemu.=
git/linux-user/elfload.c:2341: pgb_reserved_va: Assertion `addr =3D=3D test=
' failed.
  ) =3D 103

  The source code is in the function pgb_reserved_va (linux-
  user/elfload.c). I think mmap cannot guarantee that the returned
  pointer (test) equals to the parameter of addr. So is this a bug to
  assert (addr =3D=3D test)?

  Attached configure script and test ELF file.

  Thanks.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1895080/+subscriptions

