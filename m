Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD11147392
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 23:06:58 +0100 (CET)
Received: from localhost ([::1]:34636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iukcq-0000Bu-Kn
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 17:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38025)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iukbv-00080B-Mc
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 17:06:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iukbu-00045O-5z
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 17:05:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:33712)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iukbu-000423-0E
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 17:05:58 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iukbs-0002s9-1g
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 22:05:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id ED3182E80C9
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 22:05:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jan 2020 21:56:19 -0000
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: grassead rth vdehors
X-Launchpad-Bug-Reporter: Adrien Grassein (grassead)
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
References: <157903678645.2454.11578772527064917210.malonedeb@soybean.canonical.com>
Message-Id: <157981657960.5691.15660022070280707948.malone@wampee.canonical.com>
Subject: [Bug 1859713] Re: ARM v8.3a pauth not working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b8d1327fd820d6bf500589d6da587d5037c7d88e";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 66bc8673124ca7c9c0c7577f063baae07ac1265a
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
Reply-To: Bug 1859713 <1859713@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now upstream as commit de0b1bae6461f67243282555475f88b2384a1eb9.

** Changed in: qemu
       Status: Confirmed =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859713

Title:
  ARM v8.3a pauth not working

Status in QEMU:
  Fix Committed

Bug description:
  Host: Ubuntu 19.10 - x86_64 machine
  QEMU version: 3a63b24a1bbf166e6f455fe43a6bbd8dea413d92 (master)

  ARMV8.3 pauth is not working well.

  With a test code containing two pauth instructions:
      - paciasp that sign LR with A key and sp as context;
      - autiasp that verify the signature.

  Test:
      - Run the program and corrupt LR just before autiasp (ex 0x3e00000400=
660 instead of 0x3e000000400664)

  Expected:
      - autiasp places an invalid pointer in LR

  Result:
      - autiasp successfully auth the pointer and places 0x0400660 in LR.

  Further explanations:
      Adding traces in qemu code shows that "pauth_computepac" is not robus=
t enough against truncating.
      With 0x31000000400664 as input of pauth_auth, we obtain "0x55b1d65b2c=
138e14" for PAC, "0x30" for bot_bit and "0x38" for top_bit.
      With 0x310040008743ec as input of pauth (with same key), we obtain "0=
x55b1d65b2c138ef4" for PAC, "0x30" for bot_bit and "0x38" for top_bit.
      Values of top_bit and bottom_bit are strictly the same and it should =
not.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859713/+subscriptions

