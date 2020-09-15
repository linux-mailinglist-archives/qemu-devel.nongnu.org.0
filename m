Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DC3269BB5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 04:02:06 +0200 (CEST)
Received: from localhost ([::1]:42152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kI0IH-0005TJ-3P
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 22:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kI0H3-0004wn-Sp
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 22:00:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:53550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kI0H1-0001h3-IL
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 22:00:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kI0Gz-00025A-GJ
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 02:00:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 77B082E80DB
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 02:00:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2020 01:50:51 -0000
From: Michael Slade <1895602@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mslade
X-Launchpad-Bug-Reporter: Michael Slade (mslade)
X-Launchpad-Bug-Modifier: Michael Slade (mslade)
Message-Id: <160013465143.17527.17390472512040751238.malonedeb@soybean.canonical.com>
Subject: [Bug 1895602] [NEW] older OS's do not detect CD change
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="83bdf6c8a3a5f87722c8927e54838522f3e57504"; Instance="production"
X-Launchpad-Hash: eb718bad5117f86b94590a63360703df51f2c43b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 16:10:45
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1895602 <1895602@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

There are at least two older operating systems, being FreeBSD 2.2 and
FreeDOS 1.2, that misbehave when the change command is used on the IDE
CD drive, and work fine on a real machine.  In both cases, changing the
CD causes the guest to either refuse to read the disc or appear to read
bad data, and in both cases the guest read the disc without issue after
a system_reset.

A HD image that demonstrates this behavior can be produced if necessary,
however the FreeDOS 1.2 CD can be booted directly and used to test:

http://freedos.org/download/download/FD12CD.iso

(choose install then abort and you get a prompt in which you can type
"dir D:", say)

note, running eject before the change command does nothing to help.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1895602

Title:
  older OS's do not detect CD change

Status in QEMU:
  New

Bug description:
  There are at least two older operating systems, being FreeBSD 2.2 and
  FreeDOS 1.2, that misbehave when the change command is used on the IDE
  CD drive, and work fine on a real machine.  In both cases, changing
  the CD causes the guest to either refuse to read the disc or appear to
  read bad data, and in both cases the guest read the disc without issue
  after a system_reset.

  A HD image that demonstrates this behavior can be produced if
  necessary, however the FreeDOS 1.2 CD can be booted directly and used
  to test:

  http://freedos.org/download/download/FD12CD.iso

  (choose install then abort and you get a prompt in which you can type
  "dir D:", say)

  note, running eject before the change command does nothing to help.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1895602/+subscriptions

