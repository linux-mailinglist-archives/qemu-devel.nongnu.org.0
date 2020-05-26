Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA93A1ABEC3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 13:07:48 +0200 (CEST)
Received: from localhost ([::1]:60882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jP2N2-0001VF-2Q
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 07:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42197)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jP2Lv-0000gC-Li
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 07:06:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jP2Lu-00056Z-Ks
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 07:06:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:52176)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jP2Lu-00056L-G8
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 07:06:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jP2Lt-0002GQ-3I
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 11:06:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 114412E8060
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 11:06:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Apr 2020 10:51:50 -0000
From: Alex <1871267@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 6-u3untu-h nevilad
X-Launchpad-Bug-Reporter: Russell Morris (6-u3untu-h)
X-Launchpad-Bug-Modifier: Alex (nevilad)
References: <158622241771.12256.11848293148646527356.malonedeb@chaenomeles.canonical.com>
Message-Id: <158703431056.16811.9006382939235019679.malone@wampee.canonical.com>
Subject: [Bug 1871267] Re: Multiple (Repeating) Keystrokes in macOS
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: ccc105c77754be76540d4ce675e0503044956981
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
Reply-To: Bug 1871267 <1871267@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Issues with time emulation. MacOS runs on qemu with a specific cpu option: =
-cpu Penryn,vendor=3DGenuineIntel,+invtsc,vmware-cpuid-freq=3Don.
The code of cpu_x86_cpuid has no handler for 0x40000010, so vmware-cpuid-fr=
eq is ignored.
Another solution is to modify tsc_increment_by_tick value in MSR_IA32_PERF_=
STATUS returned from helper_rdmsr. Currently it is val =3D 1000ULL. Try to =
set it to 2000ULL, and see what happens.

The solution for hardware emulation is to return real hardware values to
the guest. I think for tcg it can be passed from command line, so the
user can adjust it's value.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1871267

Title:
  Multiple (Repeating) Keystrokes in macOS

Status in QEMU:
  New

Bug description:
  Hi,

  I am finding this issue with v4.2.0, or the latest master - on a
  Windows host, with macOS guest. It happens using gtk (SPICE?) or VNC.
  When I get to a place to enter a keystroke, I quite reliably get
  multiple of the same key (i.e. press A, get AAAA).

  Thinking there may be a basic setting to address this? I did try it in
  Linux (kvm), no issue there.

  Thanks!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1871267/+subscriptions

