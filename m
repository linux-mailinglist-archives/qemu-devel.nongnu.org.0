Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BD61BC6DA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 19:33:46 +0200 (CEST)
Received: from localhost ([::1]:41590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTU77-00020p-JY
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 13:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42508)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jTU4F-0007zz-3e
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 13:30:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jTU4E-0005z9-0c
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 13:30:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:48968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jTU4D-0005xN-GB
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 13:30:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jTU4A-00061e-Bm
 for <qemu-devel@nongnu.org>; Tue, 28 Apr 2020 17:30:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 551F62E80E7
 for <qemu-devel@nongnu.org>; Tue, 28 Apr 2020 17:30:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Apr 2020 17:22:45 -0000
From: agl <1875702@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: agl
X-Launchpad-Bug-Reporter: agl (agl)
X-Launchpad-Bug-Modifier: agl (agl)
Message-Id: <158809456539.8338.16342287412940632416.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1875702] [NEW] madvise reports success,
 but doesn't implement WIPEONFORK.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d1105341713c5be348effe2a5142c4a210ce4cde";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: dee11e89cccd175d33cdd4333bb635cb5241b6d2
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 13:30:42
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1875702 <1875702@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

The implementation of madvise (linux-user/syscall.c:11331, tag
v5.0.0-rc4) always returns zero (i.e. success). However, an application
requesting (at least) MADV_WIPEONFORK may need to know whether the call
was actually successful. If not (because the kernel doesn't support
WIPEONFORK) then it will need to take other measures to provide fork-
safety (such as drawing entropy from the kernel in every case). But, if
the application believes that WIPEONFORK is supported (because madvise
returned zero), but it actually isn't (as in qemu), then it may forego
those protections on the assumption that WIPEONFORK will provide fork-
safety.

Roughly, the comment in qemu that says "This is a hint, so ignoring and
returning success is ok." is no longer accurate in the presence of
MADV_WIPEONFORK.

(This is not purely academic: BoringSSL is planning on acting in this
way. We found the qemu behaviour in pre-release testing and are planning
on making an madvise call with advice=3D-1 first to test whether unknown
advice values actually produce EINVAL.)

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1875702

Title:
  madvise reports success, but doesn't implement WIPEONFORK.

Status in QEMU:
  New

Bug description:
  The implementation of madvise (linux-user/syscall.c:11331, tag
  v5.0.0-rc4) always returns zero (i.e. success). However, an
  application requesting (at least) MADV_WIPEONFORK may need to know
  whether the call was actually successful. If not (because the kernel
  doesn't support WIPEONFORK) then it will need to take other measures
  to provide fork-safety (such as drawing entropy from the kernel in
  every case). But, if the application believes that WIPEONFORK is
  supported (because madvise returned zero), but it actually isn't (as
  in qemu), then it may forego those protections on the assumption that
  WIPEONFORK will provide fork-safety.

  Roughly, the comment in qemu that says "This is a hint, so ignoring
  and returning success is ok." is no longer accurate in the presence of
  MADV_WIPEONFORK.

  (This is not purely academic: BoringSSL is planning on acting in this
  way. We found the qemu behaviour in pre-release testing and are
  planning on making an madvise call with advice=3D-1 first to test
  whether unknown advice values actually produce EINVAL.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1875702/+subscriptions

