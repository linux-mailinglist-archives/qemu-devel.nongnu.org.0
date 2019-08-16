Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F2D8FA3D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 07:10:09 +0200 (CEST)
Received: from localhost ([::1]:49352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyUV6-0005gA-DI
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 01:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1hyUQx-0000hM-Rj
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 01:05:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hyUQw-000596-Oz
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 01:05:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:52950)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hyUQw-000588-GW
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 01:05:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hyUQv-0003fD-CQ
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 05:05:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5624B2E80D0
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 05:05:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Aug 2019 04:56:50 -0000
From: Thomas Huth <1794187@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell sedrubal th-huth
X-Launchpad-Bug-Reporter: sedrubal (sedrubal)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153782360135.24561.14757076619752022286.malonedeb@gac.canonical.com>
Message-Id: <156593141017.16299.3316091353454840000.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 3834923e7663cc6cb12cbe72aa69a487e168f60d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1794187] Re: improve error message,
 when using raspi3 and RAM>4G
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
Reply-To: Bug 1794187 <1794187@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dff3dcf28c0b7a3ac261

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1794187

Title:
  improve error message, when using raspi3 and RAM>4G

Status in QEMU:
  Fix Released

Bug description:
  Running `qemu-system-aarch64 image-aarch64.iso --machine raspi3 -m 8G`
  prints this error message:

  ```
  Unexpected error in visit_type_uintN() at /builddir/build/BUILD/qemu-3.0.=
0/qapi/qapi-visit-core.c:164:
  qemu-system-aarch64: Parameter 'vcram-base' expects uint32_t
  ```

  The problem is, that you musn't use more than 4 GB RAM for machine
  raspi3. As it took me some time to figure that out, I'd be glad, if
  you can print better error message, like you do, when using more than
  4 CPU cores with machine raspi3:

  ```
  Invalid SMP CPUs 8. The max CPUs supported by machine 'raspi3' is 4 =

  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1794187/+subscriptions

