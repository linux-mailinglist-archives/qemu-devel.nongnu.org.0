Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1731A2F94B7
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 19:47:28 +0100 (CET)
Received: from localhost ([::1]:57824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1D5C-0007nO-NK
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 13:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1D3X-0007Bo-9I
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 13:45:43 -0500
Received: from indium.canonical.com ([91.189.90.7]:43312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1D3V-0008Vo-40
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 13:45:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1D3S-0001LD-Lb
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 18:45:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A05252E8042
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 18:45:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 Jan 2021 18:37:00 -0000
From: Mingye Wang <1912107@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: artoria2e5
X-Launchpad-Bug-Reporter: Mingye Wang (artoria2e5)
X-Launchpad-Bug-Modifier: Mingye Wang (artoria2e5)
Message-Id: <161090862069.30717.14713485848942415507.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1912107] [NEW] Option to constrain linux-user exec() to emulated
 CPU only
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: be40cfcf53dc15885dcba041108ac82e1d7cc28d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1912107 <1912107@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

When trying to reproduce a bug someone reported on an actual AMD K10[1], =
=E2=80=8BI tried to directly throw `qemu_x86-64 -cpu =

=E2=80=8Bphenom path/to/wrongly-labelled-instruction-set/gcc 1.c` at the pr=
oblem, but failed to get an "illegal instruction" as expected. A quick inve=
stigation reveals that the error is actually caused by one of gcc's child p=
rocessess, and that the said process is being ran directly on the host. A s=
imilar problem happens with trying to call stuff with /usr/bin/env.

 =E2=80=8B[1]: https://github.com/Homebrew/brew/issues/1034

Since both the host and the guest are x86_64, I deemed binfmt
inapplicable to my case. I believe that QEMU should offer a way to
modify exec() and other spawning syscalls so that execution remains on
an emulated CPU in such a case. Call it an extra layer of binfmt, if you
must.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1912107

Title:
  Option to constrain linux-user exec() to emulated CPU only

Status in QEMU:
  New

Bug description:
  When trying to reproduce a bug someone reported on an actual AMD K10[1], =
=E2=80=8BI tried to directly throw `qemu_x86-64 -cpu =

  =E2=80=8Bphenom path/to/wrongly-labelled-instruction-set/gcc 1.c` at the =
problem, but failed to get an "illegal instruction" as expected. A quick in=
vestigation reveals that the error is actually caused by one of gcc's child=
 processess, and that the said process is being ran directly on the host. A=
 similar problem happens with trying to call stuff with /usr/bin/env.

   =E2=80=8B[1]: https://github.com/Homebrew/brew/issues/1034

  Since both the host and the guest are x86_64, I deemed binfmt
  inapplicable to my case. I believe that QEMU should offer a way to
  modify exec() and other spawning syscalls so that execution remains on
  an emulated CPU in such a case. Call it an extra layer of binfmt, if
  you must.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1912107/+subscriptions

