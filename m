Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91E12CB210
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 02:08:12 +0100 (CET)
Received: from localhost ([::1]:37854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkGct-0007W8-Nd
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 20:08:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kkGaW-0006hm-F8
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 20:05:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:48326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kkGaT-0001bW-9K
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 20:05:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kkGaR-0007rP-D1
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 01:05:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5F7F82E802E
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 01:05:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Dec 2020 00:57:39 -0000
From: Doug Evans <1906463@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dje
X-Launchpad-Bug-Reporter: Doug Evans (dje)
X-Launchpad-Bug-Modifier: Doug Evans (dje)
Message-Id: <160687065946.3791.11439184384818467145.malonedeb@soybean.canonical.com>
Subject: [Bug 1906463] [NEW] "-device help" does not report all devices
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="08644ab21771254a8c489299c99344a1828acad8"; Instance="production"
X-Launchpad-Hash: 13949ff2dd4b7b93147eab5843d4299abb377e09
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: Bug 1906463 <1906463@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

-device help doesn't report all devices.
E.g., devices that are instantiated by a board don't get printed in part be=
cause they don't exist when "-device help" is processed. As an experiment I=
 deferred processing of "-device help" as long as possible and some devices=
 were still not printed, so there's more going on here.

QEMU commit hash: 944fdc5e27a5b5adbb765891e8e70e88ba9a00ec

Repro:
$ configure --target-list=3Darm-softmmu
$ make
$ ./qemu-system-arm -device help | grep npcm7xx
<empty>

I'd expect to see things like npcm7xx-rng in the output.

I can imagine enumerating board-provided devices is a challenge.
Still, it'd be really nice if "-device help" printed them, and having
"-device $driver,help" work as well.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906463

Title:
  "-device help" does not report all devices

Status in QEMU:
  New

Bug description:
  -device help doesn't report all devices.
  E.g., devices that are instantiated by a board don't get printed in part =
because they don't exist when "-device help" is processed. As an experiment=
 I deferred processing of "-device help" as long as possible and some devic=
es were still not printed, so there's more going on here.

  QEMU commit hash: 944fdc5e27a5b5adbb765891e8e70e88ba9a00ec

  Repro:
  $ configure --target-list=3Darm-softmmu
  $ make
  $ ./qemu-system-arm -device help | grep npcm7xx
  <empty>

  I'd expect to see things like npcm7xx-rng in the output.

  I can imagine enumerating board-provided devices is a challenge.
  Still, it'd be really nice if "-device help" printed them, and having
  "-device $driver,help" work as well.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906463/+subscriptions

