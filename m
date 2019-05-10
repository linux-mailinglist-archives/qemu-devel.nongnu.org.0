Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF7B1A1D8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 18:49:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46726 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP8i9-0000ET-Fo
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 12:49:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hP8Ug-00068f-Te
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:35:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hP8Uf-0006yI-TX
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:35:34 -0400
Received: from indium.canonical.com ([91.189.90.7]:57998)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hP8Uf-0006xu-OF
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:35:33 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hP8Ue-0007xu-Tl
	for <qemu-devel@nongnu.org>; Fri, 10 May 2019 16:35:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id E000F2E80C0
	for <qemu-devel@nongnu.org>; Fri, 10 May 2019 16:35:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 May 2019 16:28:09 -0000
From: Daniel Berrange <1828608@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anisse berrange
X-Launchpad-Bug-Reporter: Anisse Astier (anisse)
X-Launchpad-Bug-Modifier: Daniel Berrange (berrange)
References: <155750549613.15038.5455007066011551794.malonedeb@wampee.canonical.com>
Message-Id: <155750568929.21598.15422700614768176532.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18962";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 9134f6809f3fb98a09eb5c09af8493d4c3e6347f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1828608] Re: Chardev websocket might not support
 pasting more than a few chars
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
Reply-To: Bug 1828608 <1828608@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the problem only happens with a websockets channel enabled, it
possibly a bug in the QIOChannelWebsock impl rather than the chardev

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1828608

Title:
  Chardev websocket might not support pasting more than a few chars

Status in QEMU:
  New

Bug description:
  When sending more than 4-5 characters on the websocket serial console
  (with pasting for example), the guest might not receive all of them,
  or worse interpret the input as Magic SysRq keys.

  This might be due to the io loop not checking the backend readiness
  before calling the read function.

  Attached patched fixes the problem on my system. I'm not sure it's the
  proper approach, this is just to start discussion.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1828608/+subscriptions

