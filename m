Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7912F15921A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 15:42:34 +0100 (CET)
Received: from localhost ([::1]:50752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1WkD-0002wG-II
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 09:42:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53030)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j1Wiz-0002EB-V4
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:41:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j1Wiy-0001RY-Sg
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:41:17 -0500
Received: from indium.canonical.com ([91.189.90.7]:45342)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j1Wiy-0001R6-NT
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:41:16 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j1Wiw-0000tk-HM
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 14:41:14 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 66EF52E80C8
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 14:41:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Feb 2020 14:34:04 -0000
From: Thomas Huth <1661815@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: shqking th-huth
X-Launchpad-Bug-Reporter: shqking (shqking)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20170204082040.20702.26524.malonedeb@gac.canonical.com>
Message-Id: <158143164456.4193.17045622028698450853.malone@soybean.canonical.com>
Subject: [Bug 1661815] Re: Stack address is returned from function
 translate_one
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0a62c17273454a1313f81a74a2198ec30b44c7b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 3244471e83f35aee0ea6e4b0a570da0864ebaf9b
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
Reply-To: Bug 1661815 <1661815@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D344a7f656e8d211cdd6e

** Changed in: qemu
       Status: New =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1661815

Title:
  Stack address is returned from function translate_one

Status in QEMU:
  Fix Committed

Bug description:
  The vulnerable version is qemu-2.8.0, and the vulnerable function is
  in "target-s390x/translate.c".

  The code snippet is as following.

  static ExitStatus translate_one(CPUS390XState *env, DisasContext *s)
  {
      const DisasInsn *insn;
      ExitStatus ret =3D NO_EXIT;
      DisasFields f;
      ...
      s->fields =3D &f;
      ...
      s->pc =3D s->next_pc;
      return ret;
  }

  A stack address, i.e. the address of local variable "f" is returned
  from current function through the output parameter "s->fields" as a
  side effect.

  This issue is one kind of undefined behaviors, according the C
  Standard, 6.2.4 [ISO/IEC 9899:2011]
  (https://www.securecoding.cert.org/confluence/display/c/DCL30-C.+Declare+=
objects+with+appropriate+storage+durations)

  This dangerous defect may lead to an exploitable vulnerability.
  We suggest sanitizing "s->fields" as null before return.

  Note that this issue is reported by shqking and Zhenwei Zou together.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1661815/+subscriptions

