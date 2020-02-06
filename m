Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFC8154435
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 13:43:28 +0100 (CET)
Received: from localhost ([::1]:37974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izgVD-00048C-QL
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 07:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51462)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1izgSt-0001sf-To
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:41:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1izgSs-00048q-7s
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:41:03 -0500
Received: from indium.canonical.com ([91.189.90.7]:60888)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1izgSs-000418-1R
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:41:02 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1izgSq-0000Al-Jp
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 12:41:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8E09A2E80C7
 for <qemu-devel@nongnu.org>; Thu,  6 Feb 2020 12:41:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Feb 2020 12:26:24 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=alex.bennee@linaro.org; 
X-Launchpad-Bug-Tags: plugin tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee mhodog
X-Launchpad-Bug-Reporter: Robert Henry (mhodog)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <157973034496.4473.7342941286220324914.malonedeb@soybean.canonical.com>
Message-Id: <158099198453.8288.8248770750149957824.malone@chaenomeles.canonical.com>
Subject: [Bug 1860610] Re: cap_disas_plugin leaks memory
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0a62c17273454a1313f81a74a2198ec30b44c7b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: ad13350355e0963b044ee229f4f74ef6a1edb312
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
Reply-To: Bug 1860610 <1860610@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looking at the way disas is structured it seems cap_insn is allocated
once (per thread) and re-used for each disassembly so we shouldn't be
free'ing it after each usage. In fact the comments to cap_disas_start
imply we want to do better than re-initialising the library for every
set of instructions we disassemble.

It is true that we don't clean-up any of the disassembly machinery on
exit but the same can be said for a lot of QEMU's static state. So
currently I don't see a leak rather than a one-time allocation. Unless I
can reproduce the leak I'm going to mark this as incomplete for now.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1860610

Title:
  cap_disas_plugin leaks memory

Status in QEMU:
  Incomplete

Bug description:
  Looking at origin/master head, the function cap_disas_plugin leaks
  memory.

  per capstone's examples using their ABI, cs_free(insn, count); needs
  to called just before cs_close.

  I discovered this running qemu under valgrind.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1860610/+subscriptions

