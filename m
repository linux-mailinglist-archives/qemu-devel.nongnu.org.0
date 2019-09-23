Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47265BB698
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 16:23:15 +0200 (CEST)
Received: from localhost ([::1]:57196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCPFC-00046I-DI
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 10:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iCPCp-0001bS-6B
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:20:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iCPCo-00012b-0S
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:20:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:51490)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iCPCn-000120-R1
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:20:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iCPCm-0008Mt-Uj
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 14:20:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CE7A32E80C8
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 14:20:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Sep 2019 14:07:34 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: crash linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell sleirsgoevy
X-Launchpad-Bug-Reporter: Sergey Lisov (sleirsgoevy)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <154816740902.19321.3239172253055110269.malonedeb@gac.canonical.com>
Message-Id: <156924765422.13271.10520481631630134751.malone@gac.canonical.com>
Subject: [Bug 1812861] Re: QEMU in user-mode emulation mode crashes when the
 user program jumps to an invalid address
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: c8889867c4c573d722f82f5429b4cb3f4ccedf3d
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
Reply-To: Bug 1812861 <1812861@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm not sure exactly when we fixed this (the fix is probably in the 4.1
release) but as of current head-of-git this correctly generates the
SIGSEGV.


** Changed in: qemu
       Status: New =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1812861

Title:
  QEMU in user-mode emulation mode crashes when the user program jumps
  to an invalid address

Status in QEMU:
  Fix Committed

Bug description:
  Running this code:

  void (*func)() =3D 0x12345678;

  int main()
  {
      func();
      return 0;
  }

  Produces the following output:

  qemu-arm-static: /build/qemu-DqynNa/qemu-2.8+dfsg/translate-all.c:175: tb=
_lock: Assertion `!have_tb_lock' failed.
  qemu-arm-static: /build/qemu-DqynNa/qemu-2.8+dfsg/translate-all.c:175: tb=
_lock: Assertion `!have_tb_lock' failed.
  Segmentation fault

  The expected result is as follows:

  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  Segmentation fault

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1812861/+subscriptions

