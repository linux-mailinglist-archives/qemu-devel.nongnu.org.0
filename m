Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3007D126878
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 18:54:30 +0100 (CET)
Received: from localhost ([::1]:45722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii00K-0008Ff-HG
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 12:54:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46629)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ihze6-0005e8-J6
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:31:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ihze3-0001X6-F4
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:31:28 -0500
Received: from indium.canonical.com ([91.189.90.7]:57472)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ihzdz-0001Uz-Hv
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:31:25 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ihzdw-0000xJ-EH
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 17:31:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 423702E80C9
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 17:31:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Dec 2019 17:16:06 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: keks9n pmaydell
X-Launchpad-Bug-Reporter: Nikita Tsukanov (keks9n)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <157488086829.22230.13834952580158911996.malonedeb@soybean.canonical.com>
Message-Id: <157677576657.27697.6070237620377583554.malone@chaenomeles.canonical.com>
Subject: [Bug 1854204] Re: Menu is not clickable on OSX Catalina
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 40271c60d8a49be8864b9f2cc7847cdafd6e924b
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
Reply-To: Bug 1854204 <1854204@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for the research. That looks like an OSX bug to me -- the simple
two-line set of operations to do this that previously worked now needs
some horribly complicated multi-stage sequence, and the first suggested
workaround is doing something strange involving the Finder and a 0.1
second delay which I am definitely suspicious of. Apple should fix their
OS to stop breaking applications :-)

The second suggested approach is essentially to add:
 =

    SetSystemUIMode(kUIModeNormal, 0);
    [NSApp activateIgnoringOtherApps:YES];

which for us probably would want to go before the [NSApp run] (or at
least after we've created the sharedApplication).

It's a bit odd also that the stackoverflow question says this only
happens "if you don't call [TransformProcessType] early enough", because
QEMU calls that about as early as it is feasibly possible to do, very
near the top of main() in cocoa.m.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1854204

Title:
  Menu is not clickable on OSX Catalina

Status in QEMU:
  New

Bug description:
  1) Run `qemu-system-x86_64`
  2) Try to click on the main menu

  Menu is not clickable until another window is activated and QEMU
  window is activated again

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1854204/+subscriptions

