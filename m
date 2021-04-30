Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD95C36F7A3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:14:59 +0200 (CEST)
Received: from localhost ([::1]:48938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcPEg-00069I-PY
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcPBi-0004Qn-DU
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:11:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:34548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcPBa-0003na-6a
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:11:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcPBZ-00024u-0Z
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:11:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 035492E8160
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:11:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 09:02:52 -0000
From: Thomas Huth <1913341@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: modwizcode th-huth
X-Launchpad-Bug-Reporter: Iris Johnson (modwizcode)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161169229373.32028.17843536287596168887.malonedeb@chaenomeles.canonical.com>
Message-Id: <161977337237.10023.16078493403246882996.malone@gac.canonical.com>
Subject: [Bug 1913341] Re: Chardev behavior breaks polling based devices
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: c4718ddb99a61cab76f8586c75bd45036ce3f65d
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
Reply-To: Bug 1913341 <1913341@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

commit f2c0fb93a44972a96f93510311c93ff4c2c6fab5


** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913341

Title:
  Chardev behavior breaks polling based devices

Status in QEMU:
  Fix Released

Bug description:
  Currently in latest QEMU (9cd69f1a270235b652766f00b94114f48a2d603f at
  this time) the behavior of chardev sources is that when processed
  (before IO polling occurs), the chardev source will check the amount
  of space for reading.

  If it reports more than 0 bytes available to accept the read and a
  callback is not set, the code will set a child source connected to the
  QIOChannel submitted to the original source. If there's no buffer
  space reported, it will check for an active source, if registered it
  will detach this source.

  Next time the loop fires, if the buffer now reports space (most likely
  the guest has run, emptying some bytes from the buffer), it will setup
  the callback again.

  However, if we have a stupid simple device (or driver) that doesn't
  have buffers big enough to fit an available write when one is sent
  (say a single byte buffer, polled serial port), then the poll will be
  set, the poll will occur and return quickly, then the callback will
  (depending on the backend chardev used) most likely read the 1 byte it
  has space for from the source, push it over to the frontend hardware
  side, and the IO loop will run again.

  Most likely the guest will not clear this byte before the next io loop
  cycle, meaning that the next prepare call on the source will see a
  full buffer in the guest and remove the poll for the data source, to
  allow the guest time to run to clear the buffer. Except, without a
  poll or a timeout set, the io loop might now block forever, since
  there's no report from the guest after clearing that buffer. This only
  returns in a sane amount of time because often some other device/timer
  is scheduled which sets a timeout on the poll to a reasonable time.

  I don't have a simple submittable bit of code to replicate at the
  moment but connecting a serial port to a pty then writing a large
  amount of data, while a guest that doesn't enable the fifo spins on an
  rx ready register, you can observe that RX on the guest takes anywhere
  from 1s to forever per byte.

  This logic all occurs in chardev/char-io.c

  Fixing this can be as simple as removing the logic to detach the child
  event source and changing the attach logic to only occur if there's
  buffer space and the poll isn't already setup. That fix could cause
  flow control issues potentially if the io runs on the same thread as
  the emulated guest (I am not sure about the details of this) and the
  guest is in a tight loop doing the poll. I don't see that as happening
  but the logic might be there for a reason.

  Another option is to set a timeout when the source gets removed,
  forcing the poll to exit with a fixed delay, this delay could
  potentially be derived from something like the baud rate set, forcing
  a minimum time before forward progress.

  If removing the logic isn't an option, another solution is to make the
  emulated hardware code itself kick the IO loop and trigger it to
  reschedule the poll. Similar to how the non-blocking write logic
  works, the read logic could recognize when the buffer has been emptied
  and reschedule the hw on the guest. In theory this sounds nice, but
  for it to work would require adding logic to all the emulated chardev
  frontends and in reality would likely be going through the effort to
  remove the callback only to within a few nanoseconds potentially want
  to add it back.

  I'm planning to submit a patch with just outright removing the logic,
  but am filing this bug as a place to reference since tracking down
  this problem is non-obvious.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913341/+subscriptions

