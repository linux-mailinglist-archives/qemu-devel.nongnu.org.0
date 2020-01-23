Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667821461D2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 07:12:43 +0100 (CET)
Received: from localhost ([::1]:51538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuVjO-0004kb-5W
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 01:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58630)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iuVhf-0003Sg-AN
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 01:10:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iuVhe-0007p9-5z
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 01:10:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:53672)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iuVhe-0007op-0s
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 01:10:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iuVhd-0001VY-9r
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 06:10:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4976A2E80C3
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 06:10:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jan 2020 05:59:55 -0000
From: Thomas Huth <1812861@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: crash linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell sleirsgoevy
X-Launchpad-Bug-Reporter: Sergey Lisov (sleirsgoevy)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154816740902.19321.3239172253055110269.malonedeb@gac.canonical.com>
Message-Id: <157975919624.5279.6134380484275709754.launchpad@wampee.canonical.com>
Subject: [Bug 1812861] Re: QEMU in user-mode emulation mode crashes when the
 user program jumps to an invalid address
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b8d1327fd820d6bf500589d6da587d5037c7d88e";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 7012ad5541fc5055f96d796f8b01c117e4c2410a
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

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1812861

Title:
  QEMU in user-mode emulation mode crashes when the user program jumps
  to an invalid address

Status in QEMU:
  Fix Released

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

