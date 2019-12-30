Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B329212CB69
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Dec 2019 01:21:24 +0100 (CET)
Received: from localhost ([::1]:56286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilioF-0002Vo-Cg
	for lists+qemu-devel@lfdr.de; Sun, 29 Dec 2019 19:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46584)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ilinT-00025s-Jv
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 19:20:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ilinS-0001Zb-DT
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 19:20:35 -0500
Received: from indium.canonical.com ([91.189.90.7]:57340)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ilinS-0001ZD-8I
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 19:20:34 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ilinQ-0001GC-Ny
 for <qemu-devel@nongnu.org>; Mon, 30 Dec 2019 00:20:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9C5002E805B
 for <qemu-devel@nongnu.org>; Mon, 30 Dec 2019 00:20:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 30 Dec 2019 00:13:36 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1857449@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cirosantilli philmd
X-Launchpad-Bug-Reporter: =?utf-8?b?Q2lybyBTYW50aWxsaSDlha3lm5vkuovku7Yg?=
 =?utf-8?b?5rOV6L2u5YqfIChjaXJvc2FudGlsbGkp?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <157719032956.5393.6667899255989227451.malonedeb@gac.canonical.com>
Message-Id: <157766481703.27484.8151704558958836012.malone@chaenomeles.canonical.com>
Subject: [Bug 1857449] Re: QEMU x86_64 -nographic full system breaks host Bash
 terminal line wrapping state after simulation ends,
 requires reset or "tput smam" to fix it
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 90b0bbf7055c0c48b522a8b9a5c2fa58dbf11891
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Bug 1857449 <1857449@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Apparently the code you run (BIOS?) is sending the DECRST control sequence =
to the terminal, which disable the auto-wrap mode flag.
Looking at the detailed explanations on https://github.com/mattiase/wraptes=
t I'm not sure how QEMU can save/restore this flag.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1857449

Title:
  QEMU x86_64 -nographic full system breaks host Bash terminal line
  wrapping state after simulation ends, requires reset or "tput smam" to
  fix it

Status in QEMU:
  New

Bug description:
  QEMU 4.2.0 compiled from source, Ubuntu 19.10, open a fresh new gnome
  terminal.

  If you print 1000 =3D chars on the host terminal, then they do wrap
  around the end of the terminal:

  printf "=3D%.0s" {0..1000}

  However, if you first run QEMU:

  x86_64-softmmu/qemu-system-x86_64 -nographic

  and then quit it in any way, e.g. with Ctrl + A, and then re-run on
  the host terminal:

  printf "=3D%.0s" {0..1000}

  then the signs don't wrap around anymore, they just go "off the
  terminal to the right".

  This can be fixed with either:

  reset
  tpam smam

  but unfortunately those don't work in tmux for some reason:
  https://github.com/tmux/tmux/issues/969

  I consider this buggy behavior, QEMU should restore the original
  terminal state if possible.

  Related: https://github.com/cirosantilli/linux-kernel-module-
  cheat/issues/110

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1857449/+subscriptions

