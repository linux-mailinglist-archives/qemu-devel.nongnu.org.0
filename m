Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DA784A88
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 13:21:46 +0200 (CEST)
Received: from localhost ([::1]:39924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvK0n-0005HV-7m
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 07:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53348)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hvK0C-0004Zm-5e
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 07:21:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hvK0A-0002lP-Qw
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 07:21:08 -0400
Received: from indium.canonical.com ([91.189.90.7]:34296)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hvK0A-0002kQ-JV
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 07:21:06 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hvK08-0007og-SQ
 for <qemu-devel@nongnu.org>; Wed, 07 Aug 2019 11:21:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D53A72E8019
 for <qemu-devel@nongnu.org>; Wed,  7 Aug 2019 11:21:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Aug 2019 11:12:53 -0000
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: glaubitz pmaydell
X-Launchpad-Bug-Reporter: John Paul Adrian Glaubitz (glaubitz)
X-Launchpad-Bug-Modifier: John Paul Adrian Glaubitz (glaubitz)
References: <151343792336.25601.1495072942778945687.malonedeb@wampee.canonical.com>
Message-Id: <156517637381.25988.15912214590331822086.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19015";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: c39e69a38ff2d8bb01369220d2dfb39855f17eff
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1738545] Re: Go binaries panic with "mmap errno
 9" on qemu-user
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
Reply-To: Bug 1738545 <1738545@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I can confirm that the issue has been resolved on arm. Unfortunately, on
sh4, the Go binaries are still crashing, albeit differently now. I
verified that they work fine on real sh4 hardware.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1738545

Title:
  Go binaries panic with "mmap errno 9" on qemu-user

Status in QEMU:
  Fix Committed

Bug description:
  Go binaries panic with "mmap errno 9" on qemu-user.

  root@nofan:/# cat hello.go =

  package main

  import "fmt"

  func main() {
      fmt.Println("hello world")
  }
  root@nofan:/# gccgo-7 hello.go -o hello
  root@nofan:/# ./hello =

  mmap errno 9
  fatal error: mmap

  runtime stack:
  mmap errno 9
  fatal error: mmap
  panic during panic

  runtime stack:
  mmap errno 9
  fatal error: mmap
  stack trace unavailable
  root@nofan:/#

  Tested with qemu from git master with Debian unstable for armel.

  Same binaries work fine on real hardware.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1738545/+subscriptions

