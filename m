Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B453769E6
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 20:20:30 +0200 (CEST)
Received: from localhost ([::1]:52880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf55R-0003Li-O4
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 14:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lf50w-0000b2-DU
 for qemu-devel@nongnu.org; Fri, 07 May 2021 14:15:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:45276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lf50s-0004Z9-2v
 for qemu-devel@nongnu.org; Fri, 07 May 2021 14:15:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lf50n-0002O6-4L
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:15:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0DDE32E8139
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 18:15:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 18:06:48 -0000
From: Langston <1886097@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: langston0 th-huth
X-Launchpad-Bug-Reporter: Langston (langston0)
X-Launchpad-Bug-Modifier: Langston (langston0)
References: <159372304166.1717.6838286421660212766.malonedeb@chaenomeles.canonical.com>
Message-Id: <162041080938.6280.10573447462908821870.launchpad@gac.canonical.com>
Subject: [Bug 1886097] Re: Error in user-mode calculation of ELF program's brk
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: dff93ca60866149f6f3eb60d2107d6e0b771f875
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1886097 <1886097@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1886097

Title:
  Error in user-mode calculation of ELF program's brk

Status in QEMU:
  New

Bug description:
  There's a discrepancy between the way QEMU user-mode and Linux
  calculate the initial program break for statically-linked binaries. I
  have a binary with the following segments:

    Program Headers:
      Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Ali=
gn
      EXIDX          0x065a14 0x00075a14 0x00075a14 0x00588 0x00588 R   0x4
      PHDR           0x0a3000 0x000a3000 0x000a3000 0x00160 0x00160 R   0x1=
000
      LOAD           0x0a3000 0x000a3000 0x000a3000 0x00160 0x00160 R   0x1=
000
      LOAD           0x000000 0x00010000 0x00010000 0x65fa0 0x65fa0 R E 0x1=
0000
      LOAD           0x066b7c 0x00086b7c 0x00086b7c 0x02384 0x02384 RW  0x1=
0000
      NOTE           0x000114 0x00010114 0x00010114 0x00044 0x00044 R   0x4
      TLS            0x066b7c 0x00086b7c 0x00086b7c 0x00010 0x00030 R   0x4
      GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x8
      GNU_RELRO      0x066b7c 0x00086b7c 0x00086b7c 0x00484 0x00484 R   0x1
      LOAD           0x07e000 0x00089000 0x00089000 0x03ff4 0x03ff4 R E 0x1=
000
      LOAD           0x098000 0x00030000 0x00030000 0x01000 0x01000 RW  0x1=
000

  The call to set_brk in Linux's binfmt_elf.c receives these arguments:

    set_brk(0xa3160, 0xa3160, 1)
    =

  Whereas in QEMU, info->brk gets set to 0x88f00. When the binary is run in=
 QEMU, it crashes on the second call to brk, whereas it runs fine on real A=
RM hardware. I think the trouble is that the program break is set to an add=
ress lower than the virtual address of a LOAD segment (the program headers,=
 in this case).

  I believe that this discrepancy arises because in QEMU, info->brk is
  only incremented when the LOAD segment in question has PROT_WRITE. For
  this binary, the LOAD segment with write permissions and the highest
  virtual address is

    LOAD           0x066b7c 0x00086b7c 0x00086b7c 0x02384 0x02384 RW  0x100=
00
      =

  which overlaps with the TLS segment:

      TLS            0x066b7c 0x00086b7c 0x00086b7c 0x00010 0x00030 R   0x4
      =

  However, the Linux kernel puts the program break after the loadable segme=
nt with the highest virtual address, regardless of flags. So I think the fi=
x is for QEMU to do the same.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1886097/+subscriptions

