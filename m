Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6024E74F7D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 15:31:13 +0200 (CEST)
Received: from localhost ([::1]:60222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqdpw-0004nS-93
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 09:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49554)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hqdpW-0003v8-QL
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 09:30:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hqdpV-0006Be-JQ
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 09:30:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:39230)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hqdpV-0006B2-DY
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 09:30:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hqdpT-0002Xe-Uj
 for <qemu-devel@nongnu.org>; Thu, 25 Jul 2019 13:30:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E6EE22E80C7
 for <qemu-devel@nongnu.org>; Thu, 25 Jul 2019 13:30:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jul 2019 13:23:04 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: edward-vielmetti pawel-moll pmaydell will-newton
X-Launchpad-Bug-Reporter: Will Newton (will-newton)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <149693268144.10005.16353270944603688746.malonedeb@wampee.canonical.com>
Message-Id: <156406098430.18447.16620761789543773910.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19010";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: ece518ad706d5963ba3c1c175656248375a0717f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1696773] Re: golang calls to exec crash user
 emulation
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
Reply-To: Bug 1696773 <1696773@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'qemucrash' test case problem seems to be because we were
incorrectly implementing 'sigaltstack' as setting a process-wide signal
stack. This is incorrect, as sigaltstack stacks are supposed to be per-
thread, and the Go runtime relies on this. I've just sent a patch which
seems to me to fix the qemucrash test case, at least:

https://patchew.org/QEMU/20190725131645.19501-1-peter.maydell@linaro.org/


** Changed in: qemu
       Status: Confirmed =3D> Won't Fix

** Changed in: qemu
       Status: Won't Fix =3D> In Progress

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1696773

Title:
  golang calls to exec crash user emulation

Status in QEMU:
  In Progress

Bug description:
  An example program can be found here:

  https://github.com/willnewton/qemucrash

  This code starts a goroutine (thread) and calls exec repeatedly. This
  works ok natively but when run under ARM user emulation it segfaults
  (usually, there are occasionally other failures).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1696773/+subscriptions

