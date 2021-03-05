Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB7F32F426
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 20:42:31 +0100 (CET)
Received: from localhost ([::1]:46804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIGLG-00068L-8x
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 14:42:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lIGJe-00055m-P7
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 14:40:50 -0500
Received: from indium.canonical.com ([91.189.90.7]:55994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lIGJc-0001A9-Jv
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 14:40:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lIGJb-0002wy-6j
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 19:40:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 26FA02E8047
 for <qemu-devel@nongnu.org>; Fri,  5 Mar 2021 19:40:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Mar 2021 19:28:57 -0000
From: Jessica Clarke <1917940@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jrtc27
X-Launchpad-Bug-Reporter: Jessica Clarke (jrtc27)
X-Launchpad-Bug-Modifier: Jessica Clarke (jrtc27)
Message-Id: <161497253793.31770.9218035606388599691.malonedeb@gac.canonical.com>
Subject: [Bug 1917940] [NEW] -bios edk2-$arch-code doesn't work for x86
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fc09074b06b3b9178bd28175bdab646b3b5abfce"; Instance="production"
X-Launchpad-Hash: 6e886fb244a8c966a2262269991db9cfc129215a
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
Reply-To: Bug 1917940 <1917940@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Whilst creating a flash device is recommended, -bios <file> is extremely
useful in many cases as it automatically searches $PREFIX/share/qemu
rather than requiring the caller (be it a human or a script) to work out
where that directory is for the QEMU being called and prepend it to the
file name.

Currently, all the x86 EDK2 FD code files are 3653632 bytes in size, or
0x37c000 bytes. However, for some reason I cannot find the answer to (I
traced the code back to 7587cf44019d593bb12703e7046bd7738996c55c), x86's
-bios only allows files that are multiples of 64K in size
(x86_bios_rom_init), which would require the EDK2 ROMs to be rounded up
to 0x380000 bytes. If I delete the check, QEMU is able to load the only-
16K-multiple-sized EDK2 and boot an OS just fine. If I pad EDK2 with 16K
of zeroes at the *start* (since the ROM gets mapped counting backwards),
it also works just fine (but padding at the *end* doesn't). Please
therefore either relax the check in x86_bios_rom_init or ensure the EDK2
binary is suitably padded.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1917940

Title:
  -bios edk2-$arch-code doesn't work for x86

Status in QEMU:
  New

Bug description:
  Whilst creating a flash device is recommended, -bios <file> is
  extremely useful in many cases as it automatically searches
  $PREFIX/share/qemu rather than requiring the caller (be it a human or
  a script) to work out where that directory is for the QEMU being
  called and prepend it to the file name.

  Currently, all the x86 EDK2 FD code files are 3653632 bytes in size,
  or 0x37c000 bytes. However, for some reason I cannot find the answer
  to (I traced the code back to
  7587cf44019d593bb12703e7046bd7738996c55c), x86's -bios only allows
  files that are multiples of 64K in size (x86_bios_rom_init), which
  would require the EDK2 ROMs to be rounded up to 0x380000 bytes. If I
  delete the check, QEMU is able to load the only-16K-multiple-sized
  EDK2 and boot an OS just fine. If I pad EDK2 with 16K of zeroes at the
  *start* (since the ROM gets mapped counting backwards), it also works
  just fine (but padding at the *end* doesn't). Please therefore either
  relax the check in x86_bios_rom_init or ensure the EDK2 binary is
  suitably padded.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1917940/+subscriptions

