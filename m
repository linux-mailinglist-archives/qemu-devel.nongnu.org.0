Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8568EBA3
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 14:37:52 +0200 (CEST)
Received: from localhost ([::1]:41488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyF0q-0006g3-0t
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 08:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39844)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1hyEyZ-0005Aa-HR
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 08:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hyEyY-0004b3-F8
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 08:35:31 -0400
Received: from indium.canonical.com ([91.189.90.7]:41568)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hyEyY-0004YA-9h
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 08:35:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hyEyX-0000aa-3l
 for <qemu-devel@nongnu.org>; Thu, 15 Aug 2019 12:35:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 19AF62E80C7
 for <qemu-devel@nongnu.org>; Thu, 15 Aug 2019 12:35:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Aug 2019 12:25:42 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1840249@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: docker
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
Message-Id: <156587194288.26490.13000707858275373489.malonedeb@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 74e7a0bd89c5466ad9befc1bef9386aef7e8d5c9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1840249] [NEW] Cancelling 'make
 docker-test-build' does not cancel running containers
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
Reply-To: Bug 1840249 <1840249@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

version: v4.1.0-rc5

Run 'make -k docker-test-build', wait a few, cancel with ^C:

$ make -k docker-test-build 2>&1 > /dev/null
^C

$ docker ps
CONTAINER ID        IMAGE                            COMMAND               =
   CREATED             STATUS
62264a2d777a        qemu:debian-mips-cross           "/var/tmp/qemu/run t=
=E2=80=A6"   10 minutes ago      Up 10 minutes
80807c47d0df        qemu:debian-armel-cross          "/var/tmp/qemu/run t=
=E2=80=A6"   10 minutes ago      Up 10 minutes
06027b5dfd4a        qemu:debian-amd64                "/var/tmp/qemu/run t=
=E2=80=A6"   10 minutes ago      Up 10 minutes

The docker containers are still up building QEMU.

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: docker

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1840249

Title:
  Cancelling 'make docker-test-build' does not cancel running containers

Status in QEMU:
  New

Bug description:
  version: v4.1.0-rc5

  Run 'make -k docker-test-build', wait a few, cancel with ^C:

  $ make -k docker-test-build 2>&1 > /dev/null
  ^C

  $ docker ps
  CONTAINER ID        IMAGE                            COMMAND             =
     CREATED             STATUS
  62264a2d777a        qemu:debian-mips-cross           "/var/tmp/qemu/run t=
=E2=80=A6"   10 minutes ago      Up 10 minutes
  80807c47d0df        qemu:debian-armel-cross          "/var/tmp/qemu/run t=
=E2=80=A6"   10 minutes ago      Up 10 minutes
  06027b5dfd4a        qemu:debian-amd64                "/var/tmp/qemu/run t=
=E2=80=A6"   10 minutes ago      Up 10 minutes

  The docker containers are still up building QEMU.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1840249/+subscriptions

