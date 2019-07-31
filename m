Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F44B7BD34
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 11:31:57 +0200 (CEST)
Received: from localhost ([::1]:39342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hskxg-0003Dr-Cm
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 05:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34364)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hskwW-0001jU-Es
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 05:30:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hskwV-0004lk-5v
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 05:30:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:34154)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hskwV-0004kv-01
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 05:30:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hskwT-0003dV-Cj
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 09:30:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5A3A32E80C9
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 09:30:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 31 Jul 2019 09:25:20 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: kvm qemu-kvm x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: stefan-proxmox
X-Launchpad-Bug-Reporter: Stefan (stefan-proxmox)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <156404155054.10633.9207967667458929652.malonedeb@wampee.canonical.com>
Message-Id: <156456512042.6843.12889194640468618584.launchpad@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19012";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 90dc6806a4ebff29bbfc12e31865926214c0243c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1837851] Re: hv-tlbflush malfunctions on Intel
 host CPUs with neither EPT nor VPID (qemu-kvm)
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
Reply-To: Bug 1837851 <1837851@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags added: kvm x86

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1837851

Title:
  hv-tlbflush malfunctions on Intel host CPUs with neither EPT nor VPID
  (qemu-kvm)

Status in QEMU:
  New

Bug description:
  Enabling hv-tlbflush on older hosts using Intel CPUs supporting VT-x
  but neither EPT nor VPID will lead to bluescreens on the guest.

  It seems KVM only checks if EPT is available, and if it isn't it
  forcibly uses VPID. If that's *also* not available, it defaults to
  basically a no-op hypercall, though windows is expecting the TLB to be
  flushed.

  hv-tlbflush is pretty useless on machines not supporting these
  extensions anyway (only reasonably fix I can see would be to flush the
  *entire* TLB on tlbflush hypercall in KVM (i.e. a kernel fix), but
  that would remove any performance benefits), so I would suggest some
  kind of preliminary check and warning/error if hv-tlbflush is
  specified on such a host.

  All CPUs mentioned in this thread[0] are confirmed to be affected by
  the bug, and I have successfully reproduced it on an Intel Core2Duo
  E8500.

  [0] https://forum.proxmox.com/threads/windows-guest-bluescreen-with-
  proxmox-6.56053/

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1837851/+subscriptions

