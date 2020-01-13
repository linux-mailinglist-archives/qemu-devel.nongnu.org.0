Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B623138910
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 01:26:36 +0100 (CET)
Received: from localhost ([::1]:43210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqnYx-0005VP-2s
	for lists+qemu-devel@lfdr.de; Sun, 12 Jan 2020 19:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37069)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iqnY3-0004dQ-Ny
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 19:25:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iqnY2-00064C-6x
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 19:25:39 -0500
Received: from indium.canonical.com ([91.189.90.7]:51514)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iqnY2-00060x-1Q
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 19:25:38 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iqnY0-0002bR-GH
 for <qemu-devel@nongnu.org>; Mon, 13 Jan 2020 00:25:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 784CB2E80C0
 for <qemu-devel@nongnu.org>; Mon, 13 Jan 2020 00:25:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jan 2020 00:15:34 -0000
From: Benjamin David Lunt <1859378@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fysnet
X-Launchpad-Bug-Reporter: Benjamin David Lunt (fysnet)
X-Launchpad-Bug-Modifier: Benjamin David Lunt (fysnet)
Message-Id: <157887453515.27484.18206056235819884101.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1859378] [NEW] xhci Control Transfer requiring a Status TRB
 before starting transfer
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: a4f323dc915c2378cae7db3d85813514df792804
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Bug 1859378 <1859378@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

This may not necessarily be a bug, but more of a change.

A little background may need to be in order.

With all USB Control transfers, there is a SETUP transfer, zero or more
DATA transfers, and if successful, a STATUS transfer.  This STATUS
transfer is used to indicate to the recipient that the previous
transfers were successful.  For example, in a CONTROL IN transfer, the
host sends a SETUP packet to the device, receives zero or more DATA
packets, and then on successful transfer, the HOST sends the STATUS
packet indicating to the device that all was received.

If no DATA packets are received, the HOST is not to send a STATUS
packet.  This could be due to a STALL or other error.

With this in mind, the STATUS transfer, in this case an xHCI STATUS TRB,
may not even be on the transfer ring yet.  The HOST software may be
waiting for a successful transfer before it submits the STATUS transfer.

However, if you look at the test at line 1701
(https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dhw/usb/hcd-xhci.c#l1701), =
the
current code will not start the CONTROL transfer at all if it doesn't
see that STATUS TRB on the ring.

In my opinion, this is in error.  It is not required that a STATUS TRB
be on the ring to start the CONTROL transfer.  This STATUS TRB can be
placed on the ring after a successful SETUP and zero or more DATA
transfers followed by a ring to the door bell.  Then after a successful
transfer to this point, placing this STATUS TRB on the ring and another
ring to the door bell.

In my opinion, the check at line 1701 should be removed.

Thank you,
Ben

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859378

Title:
  xhci Control Transfer requiring a Status TRB before starting transfer

Status in QEMU:
  New

Bug description:
  This may not necessarily be a bug, but more of a change.

  A little background may need to be in order.

  With all USB Control transfers, there is a SETUP transfer, zero or
  more DATA transfers, and if successful, a STATUS transfer.  This
  STATUS transfer is used to indicate to the recipient that the previous
  transfers were successful.  For example, in a CONTROL IN transfer, the
  host sends a SETUP packet to the device, receives zero or more DATA
  packets, and then on successful transfer, the HOST sends the STATUS
  packet indicating to the device that all was received.

  If no DATA packets are received, the HOST is not to send a STATUS
  packet.  This could be due to a STALL or other error.

  With this in mind, the STATUS transfer, in this case an xHCI STATUS
  TRB, may not even be on the transfer ring yet.  The HOST software may
  be waiting for a successful transfer before it submits the STATUS
  transfer.

  However, if you look at the test at line 1701
  (https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dhw/usb/hcd-xhci.c#l1701),
  the current code will not start the CONTROL transfer at all if it
  doesn't see that STATUS TRB on the ring.

  In my opinion, this is in error.  It is not required that a STATUS TRB
  be on the ring to start the CONTROL transfer.  This STATUS TRB can be
  placed on the ring after a successful SETUP and zero or more DATA
  transfers followed by a ring to the door bell.  Then after a
  successful transfer to this point, placing this STATUS TRB on the ring
  and another ring to the door bell.

  In my opinion, the check at line 1701 should be removed.

  Thank you,
  Ben

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859378/+subscriptions

