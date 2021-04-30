Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0E936F739
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 10:37:11 +0200 (CEST)
Received: from localhost ([::1]:53452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcOe6-000864-9X
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 04:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOYo-0003EV-8C
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:31:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:49336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOYh-0005Sg-1S
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:31:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcOYd-0002JG-O8
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:31:31 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AC4A92E815B
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:31:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 08:23:21 -0000
From: Thomas Huth <1773743@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: arnaudalies-py pmaydell th-huth
X-Launchpad-Bug-Reporter: mou (arnaudalies-py)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152749166822.25806.7057935660205888607.malonedeb@wampee.canonical.com>
Message-Id: <161977100144.14015.6733658150386163122.malone@wampee.canonical.com>
Subject: [Bug 1773743] Re: qemu-user -g xxx -E LD_PROFILE=xxx segfault
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: aee5a926739788c09eac36ffda8aff1e5cb6b551
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
Reply-To: Bug 1773743 <1773743@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

https://gitlab.com/qemu-project/qemu/-/commit/3ddd9036389f5f577e09

** Changed in: qemu
       Status: In Progress =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1773743

Title:
  qemu-user -g xxx -E LD_PROFILE=3Dxxx segfault

Status in QEMU:
  Fix Released

Bug description:
  Here is two simple steps to reproduce the bug:

  $ qemu-x86_64 -E LD_PROFILE=3Dlibc.so.6 -E LD_PROFILE_OUTPUT=3D. -g 12345
  -L / /bin/ls

  (libc.so and /bin/ls might change on your system, in this case we just
  need a binary with a profilable needed library)

  In a other window launch:

  $ gdb
  (gdb) target remote :12345
  (gdb) c

  At this point qemu will segfault.

  It seems this problem is appends when sigprof passed to gdb.
  One way I have found to bypass this:
  patch gdbstub.c gdb_handlesig and ignore sig if
  sig =3D=3D TARGET_SIGPROF
  (which means now I can't catch sigprof on gdb anymore)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1773743/+subscriptions

