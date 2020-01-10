Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F80F136501
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 02:47:30 +0100 (CET)
Received: from localhost ([::1]:39374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipjOb-0004QJ-2o
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 20:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41967)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ipj8R-0006oR-58
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 20:30:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ipj8O-0002JP-5x
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 20:30:46 -0500
Received: from indium.canonical.com ([91.189.90.7]:41854)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ipj8N-0002FE-RT
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 20:30:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ipj8K-0003fK-Lx
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 01:30:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A11032E80C3
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 01:30:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jan 2020 01:23:56 -0000
From: Mike Swanson <mikeonthecomputer@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chungy
X-Launchpad-Bug-Reporter: Mike Swanson (chungy)
X-Launchpad-Bug-Modifier: Mike Swanson (chungy)
Message-Id: <157861943690.5587.1150668522953222724.malonedeb@gac.canonical.com>
Subject: [Bug 1859106] [NEW] 4.2 regression: ReactOS crashes on boot
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: d2f7fe2936ef8b0976c5247769c9f7533dc256c4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
X-Mailman-Approved-At: Thu, 09 Jan 2020 20:46:08 -0500
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
Reply-To: Bug 1859106 <1859106@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

In QEMU 4.1.x and earlier, ReactOS can successfully boot, but starting
with 4.2, it fails, instead coming up with an error "The video driver
failed to initialize."

This happens regardless of VM configuration (even -M pc-i440fx-4.1) and
it works well with older versions of QEMU. bisecting QEMU to find the
first bad commit reveals 0221d73ce6a8e075adaa0a35a6ef853d2652b855 as the
culprit, which is updating the seabios version; perhaps this bug belongs
there, but I don't know the appropriate avenue (it seems seabios is a
subproject of QEMU anyway?).

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859106

Title:
  4.2 regression: ReactOS crashes on boot

Status in QEMU:
  New

Bug description:
  In QEMU 4.1.x and earlier, ReactOS can successfully boot, but starting
  with 4.2, it fails, instead coming up with an error "The video driver
  failed to initialize."

  This happens regardless of VM configuration (even -M pc-i440fx-4.1)
  and it works well with older versions of QEMU. bisecting QEMU to find
  the first bad commit reveals 0221d73ce6a8e075adaa0a35a6ef853d2652b855
  as the culprit, which is updating the seabios version; perhaps this
  bug belongs there, but I don't know the appropriate avenue (it seems
  seabios is a subproject of QEMU anyway?).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859106/+subscriptions

