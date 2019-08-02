Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB9780301
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Aug 2019 00:56:34 +0200 (CEST)
Received: from localhost ([::1]:37860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htgTR-0006vo-NF
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 18:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35744)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1htgSX-0006Nf-QP
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 18:55:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1htgSW-0004y7-Pr
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 18:55:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:55920)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1htgSW-0004xS-K6
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 18:55:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1htgSV-0008TJ-9y
 for <qemu-devel@nongnu.org>; Fri, 02 Aug 2019 22:55:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 497C62E80C7
 for <qemu-devel@nongnu.org>; Fri,  2 Aug 2019 22:55:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Aug 2019 22:48:36 -0000
From: Toolybird <1838703@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gschafer philmd
X-Launchpad-Bug-Reporter: Toolybird (gschafer)
X-Launchpad-Bug-Modifier: Toolybird (gschafer)
References: <156469612119.27436.5161465617131751094.malonedeb@chaenomeles.canonical.com>
Message-Id: <156478611680.27696.12226053803211829678.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19014";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 2c4ef6de1daf90d62d0ca8b9d00d5c42f0d15169
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1838703] Re: Makefile BUG in edk2 firmware
 install 4.1.0-rc3
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
Reply-To: Bug 1838703 <1838703@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm on Arch, but that shouldn't matter. It's a clear bug in the
Makefile.

I note that Fedora doesn't ship these blobs as they're provide by
separate edk2 package.

Attached patch fixes it for me.

** Patch added: "edk2 Makefile fix"
   https://bugs.launchpad.net/qemu/+bug/1838703/+attachment/5280623/+files/=
qemu-makefile.patch

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838703

Title:
  Makefile BUG in edk2 firmware install 4.1.0-rc3

Status in QEMU:
  New

Bug description:
  DESTDIR installs end up with wrong paths in JSON files installed to
  $prefix/share/qemu/firmware. For example, the file:

    50-edk2-x86_64-secure.json

  ends up incorrectly with:

    "filename": "/build/qemu/pkg/qemu/usr/share/qemu/edk2-x86_64-secure-
  code.fd",

  instead of the correct:

    "filename": "/usr/share/qemu/edk2-x86_64-secure-code.fd",

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838703/+subscriptions

