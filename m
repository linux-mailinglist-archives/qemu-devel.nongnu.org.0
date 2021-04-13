Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012F135E783
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 22:17:15 +0200 (CEST)
Received: from localhost ([::1]:53338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWPTG-00055Z-3D
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 16:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWPRj-0004Gy-HA
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 16:15:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:36256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWPRh-0007gt-3o
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 16:15:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lWPRe-00012b-RC
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 20:15:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C4BC32E8157
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 20:15:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Apr 2021 20:10:07 -0000
From: Adam Williamson <1923663@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: awilliamson
X-Launchpad-Bug-Reporter: Adam Williamson (awilliamson)
X-Launchpad-Bug-Modifier: Adam Williamson (awilliamson)
Message-Id: <161834460731.13851.12350778402155141357.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1923663] [NEW] Can't(?) disable default floppy drive any more in
 qemu 6.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9327c982b35e4a485a3c716663ed8345e279c16e"; Instance="production"
X-Launchpad-Hash: ac4fcfba22a7559d47f09235b81317beab8a764c
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
Reply-To: Bug 1923663 <1923663@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

There's a documented change in qemu 6.0:

https://qemu-project.gitlab.io/qemu/system/removed-features.html#floppy-
controllers-drive-properties-removed-in-6-0

where you can't configure floppy controller device properties with
-global any more. However, there's a thing you could do with the old
parameter which I can't figure out a way to do with the documented
replacement. openQA passed exactly this argument:

-global isa-fdc.driveA=3D

and that has the effect of removing/disabling the default floppy
drive/controller. If you just run `qemu-system-i686` (no other args)
you'll see the VM briefly try to boot from a floppy drive; if you run
`qemu-system-i686 -global isa-fdc.driveA=3D` (with an earlier version of
qemu, obviously) you'll see it does not do so.

I can't see a way to do this with `-device floppy`. Going by the docs,
the equivalent should be:

-device floppy,unit=3D0,drive=3D

but that does not seem to have the same effect. If you run `qemu-
system-i686 -device floppy,unit=3D0,drive=3D`, it still tries to boot from a
floppy drive.

I see there's a -nodefaults option that disables *all* default devices,
but I don't think that's what we want here either. We might want the
other default devices, we just don't want the floppy drive.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1923663

Title:
  Can't(?) disable default floppy drive any more in qemu 6.0

Status in QEMU:
  New

Bug description:
  There's a documented change in qemu 6.0:

  https://qemu-project.gitlab.io/qemu/system/removed-features.html
  #floppy-controllers-drive-properties-removed-in-6-0

  where you can't configure floppy controller device properties with
  -global any more. However, there's a thing you could do with the old
  parameter which I can't figure out a way to do with the documented
  replacement. openQA passed exactly this argument:

  -global isa-fdc.driveA=3D

  and that has the effect of removing/disabling the default floppy
  drive/controller. If you just run `qemu-system-i686` (no other args)
  you'll see the VM briefly try to boot from a floppy drive; if you run
  `qemu-system-i686 -global isa-fdc.driveA=3D` (with an earlier version of
  qemu, obviously) you'll see it does not do so.

  I can't see a way to do this with `-device floppy`. Going by the docs,
  the equivalent should be:

  -device floppy,unit=3D0,drive=3D

  but that does not seem to have the same effect. If you run `qemu-
  system-i686 -device floppy,unit=3D0,drive=3D`, it still tries to boot from
  a floppy drive.

  I see there's a -nodefaults option that disables *all* default
  devices, but I don't think that's what we want here either. We might
  want the other default devices, we just don't want the floppy drive.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1923663/+subscriptions

