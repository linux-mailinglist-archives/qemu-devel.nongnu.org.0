Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015521CBD24
	for <lists+qemu-devel@lfdr.de>; Sat,  9 May 2020 06:16:34 +0200 (CEST)
Received: from localhost ([::1]:59520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXGuf-0005Rc-Pv
	for lists+qemu-devel@lfdr.de; Sat, 09 May 2020 00:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jXGtm-0004xu-Dn
 for qemu-devel@nongnu.org; Sat, 09 May 2020 00:15:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:34116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jXGtk-0006ow-Gd
 for qemu-devel@nongnu.org; Sat, 09 May 2020 00:15:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jXGti-0007JY-M4
 for <qemu-devel@nongnu.org>; Sat, 09 May 2020 04:15:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9B6DB2E80E7
 for <qemu-devel@nongnu.org>; Sat,  9 May 2020 04:15:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2020 04:04:49 -0000
From: Lu Haocong <1877706@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: wish-star
X-Launchpad-Bug-Reporter: Lu Haocong (wish-star)
X-Launchpad-Bug-Modifier: Lu Haocong (wish-star)
Message-Id: <158899708918.5208.6641592290214669384.malonedeb@soybean.canonical.com>
Subject: [Bug 1877706] [NEW] [Feature request] qemu does not support for
 Octeon MIPS64 on X86
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: a2d76c16a236029d491e61c6581df1396f24844a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/09 00:00:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1877706 <1877706@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Description of problem:

I use mips64-octeon-linux-gnu-gcc cross toolchain on X86,and generate
binary file.

> mips64-octeon-linux-gnu-gcc hello.c -static
> file a.out
> a.out: ELF 32-bit MSB executable, MIPS, N32 MIPS64 rel2 version 1 (SYSV),=
 statically linked, for GNU/Linux 2.4.0, not stripped

I execute it with mips64-linux-user mode in qemu, it is invalid.

> ./qemu-5.0.0/mips64-linux-user/qemu-mips64 a.out
> a.out: Invalid ELF image for this architecture

when I choose mips-linux-user mode, it regards as illegal instruction.

> ./qemu-5.0.0/mips-linux-user/qemu-mips a.out
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> Illegal instruction (core dumped)

I would like to know, is this due to my problem or does qemu not support
Octeon MIPS64 on X86?

if qemu has supported Octeon MIPS64 on X86, how can I emulate it.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877706

Title:
   [Feature request] qemu does not support for Octeon MIPS64 on X86

Status in QEMU:
  New

Bug description:
  Description of problem:

  I use mips64-octeon-linux-gnu-gcc cross toolchain on X86,and generate
  binary file.

  > mips64-octeon-linux-gnu-gcc hello.c -static
  > file a.out
  > a.out: ELF 32-bit MSB executable, MIPS, N32 MIPS64 rel2 version 1 (SYSV=
), statically linked, for GNU/Linux 2.4.0, not stripped

  I execute it with mips64-linux-user mode in qemu, it is invalid.

  > ./qemu-5.0.0/mips64-linux-user/qemu-mips64 a.out
  > a.out: Invalid ELF image for this architecture

  when I choose mips-linux-user mode, it regards as illegal instruction.

  > ./qemu-5.0.0/mips-linux-user/qemu-mips a.out
  > qemu: uncaught target signal 4 (Illegal instruction) - core dumped
  > Illegal instruction (core dumped)

  I would like to know, is this due to my problem or does qemu not
  support Octeon MIPS64 on X86?

  if qemu has supported Octeon MIPS64 on X86, how can I emulate it.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1877706/+subscriptions

