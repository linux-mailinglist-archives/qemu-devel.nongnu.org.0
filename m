Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF7F1BEC2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 22:33:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34613 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQHdE-0005cD-0o
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 16:33:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hQHar-0004RI-IL
	for qemu-devel@nongnu.org; Mon, 13 May 2019 16:30:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hQHaq-0007Qt-IW
	for qemu-devel@nongnu.org; Mon, 13 May 2019 16:30:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:37646)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hQHaq-0007Q3-DG
	for qemu-devel@nongnu.org; Mon, 13 May 2019 16:30:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hQHap-0002nC-2L
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 20:30:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id C7A6F2E80CC
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 20:30:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 May 2019 20:24:28 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: tcg testcase x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: sonicadvance1
X-Launchpad-Bug-Reporter: Sonicadvance1@gmail.com (sonicadvance1)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <155776862725.26593.3375928624162381326.malonedeb@soybean.canonical.com>
Message-Id: <155777906883.15148.14858421233704231057.launchpad@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18962";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 4807d06e31b601cfa674f24120997510282a5e63
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1828867] Re: QEmu translation is incorrect when
 using REX in combination with LAHF/SAHF
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1828867 <1828867@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags added: tcg testcase x86

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1828867

Title:
  QEmu translation is incorrect when using REX in combination with
  LAHF/SAHF

Status in QEMU:
  New

Bug description:
  When translating code that is using LAHF and SAHF in combination with the=
 REX prefix then qemu translates incorrectly.
  These two instructions only ever use the AH register. Contrary to other i=
nstructions where if you use REX + high bit offsets then it'll pull in rsp =
and a few other registers.
  On hardware the REX prefix doesn't effect behaviour of these instructions=
 at all.
  QEMU incorrectly selects RSP as the register of choice here due to this c=
ombination of REX + AH register usage.

  I've attached a patch that is super terrible just so I can work around
  the issue locally and to sort of show off how it is to be "fixed"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1828867/+subscriptions

