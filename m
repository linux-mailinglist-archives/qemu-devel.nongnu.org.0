Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A75B1488
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 20:43:36 +0200 (CEST)
Received: from localhost ([::1]:37692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8U47-0007Ak-Je
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 14:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59124)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i8U1b-0005aO-Qe
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 14:41:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i8U1a-0003Ou-JW
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 14:40:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:37010)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i8U1a-0003Oj-EO
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 14:40:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i8U1Y-00059w-46
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 18:40:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0D8792E80CC
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 18:40:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Sep 2019 18:32:22 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: fpu ppc testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 7-pc
X-Launchpad-Bug-Reporter: Paul Clarke (7-pc)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <156830716414.515.16944012251535902875.malonedeb@wampee.canonical.com>
Message-Id: <156831314322.17231.11777012720914361981.launchpad@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19044";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: fc78766f54e0b62ec53935a52a781e95c5fd896d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1843795] Re: 'mtfsf' instruction can clear FI
 incorrectly
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
Reply-To: Bug 1843795 <1843795@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags added: fpu ppc testcase

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1843795

Title:
  'mtfsf' instruction can clear FI incorrectly

Status in QEMU:
  New

Bug description:
  Using mtfsf instruction can clear the FPSCR FI bit incorrectly.  This cod=
e snippet exhibits the issue:
  --
    fpscr.ll =3D 0x1fffffff;
    __builtin_mtfsf (0b11111111, fpscr.d);
    fpscr.d =3D __builtin_mffs ();
  --

  On POWER9 hardware:
  mffs    : FPSCR =3D 0x000000007ffff7ff

  On qemu (git master; "-cpu POWER9"):
  --
  $ ./mtfsf
  mffs    : FPSCR =3D 0x000000007ffdffff
  --

  Two differences:
  bit 52: "reserved", so maybe a "don't care" case
  bit 46: "FI"

  $ git log -1 master
  commit 89ea03a7dc83ca36b670ba7f787802791fcb04b1
  Merge: 019217c 2531164
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Mon Sep 9 09:48:34 2019 +0100

  I tracked the clear is coming from do_float_check_status, likely the
  one in gen_mtfsf, but then I get lost figuring out what _should_ be
  happening. :-/

  Test attached.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1843795/+subscriptions

