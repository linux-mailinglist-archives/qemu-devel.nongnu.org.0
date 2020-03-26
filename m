Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2EE1946EB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 20:02:10 +0100 (CET)
Received: from localhost ([::1]:57778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHXlZ-0003Lk-7E
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 15:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54341)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jHXkK-0002OJ-Cg
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:00:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jHXkI-000821-Uh
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:00:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:37902)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jHXkI-00081c-Ot
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:00:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jHXkG-0007DK-UJ
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 19:00:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E19C12E80C3
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 19:00:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Mar 2020 18:54:26 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1693050@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: paulmenzel philmd rmustacc
X-Launchpad-Bug-Reporter: Robert Mustacchi (rmustacc)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <149558234717.18218.15801621819682136328.malonedeb@chaenomeles.canonical.com>
Message-Id: <158524886678.11449.17935218369956127168.malone@soybean.canonical.com>
Subject: [Bug 1693050] Re: xhci HCIVERSION register read emulation incorrectly
 handled
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3a6db24bbe7280ec09bae73384238390fcc98ad3";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 38bf5bf0778e75858c0634b38cfede01129f7e66
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Reply-To: Bug 1693050 <1693050@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Odd, this should be fixed by commit 6ee021d41 and
36960b4d66..98f52cdbb5c.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1693050

Title:
  xhci HCIVERSION register read emulation incorrectly handled

Status in QEMU:
  New

Bug description:
  We had an illumos user trying to run illumos in QEMU 2.9.0 with the
  qemu-xhci device enabled. Note, that while this was discovered against
  QEMU 2.9.0, from my current read of the HEAD, it is still present. The
  illumos bug at https://www.illumos.org/issues/8173 has additional
  information on how the user invoked qemu. While investigating the
  problem we found that the illumos driver was reading a version of
  0x0000 when reading the HCIVERSION register from qemu.

  In the illumos driver we're performing a 16-bit read of the version
  register at offset 0x2. From looking around at other OSes, while Linux
  performs a 4 byte read at offset 0x0 and masks out the version, others
  that care about the version are doing a two byte read, though not all
  actually act on the version and some just discard the information.

  The user who hit this was able to enable tracing (note the tracing
  file is attached to the illumos bug linked previously) and we hit the
  unimplemented register read with offset 0x2 at
  http://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dhw/usb/hcd-
  xhci.c;hb=3DHEAD#l2960. The xhci register specifies today that its
  allowed for users to do 1-4 byte reads; however, that it implements
  only four byte reads in its implementation
  (http://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dhw/usb/hcd-
  xhci.c;hb=3DHEAD#l3333). Hence why when we read the HCIVERSION register
  at offset 0x2, it isn't handled in xhci_cap_read() which then returns
  zeros.

  From digging into this, I think that we're coming into
  memory_region_dispatch_read() and then memory_region_dispatch_read1().
  However, I don't see anything in either the general memory region
  logic or in the xhci_cap_read() function that would deal with
  adjusting the offset that we're reading at and then masking it off
  again. While the access_with_adjusted_size() attempts to deal with
  this, it never adjusts the hardware address that's passed in to be a
  multiple of the implementation defined offset that I can see. I
  suspect that the FIXME at line 582
  (http://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dmemory.c;hb=3DHEAD#l582) =
and
  the implementation in the xhci code is the crux of the problem.

  For the time being we're working around this in the illumos driver,
  but I wanted to point this out such that it might be helpful for other
  systems which are assuming that they can do the two byte read like on
  hardware.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1693050/+subscriptions

