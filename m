Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0762E135BEB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 15:58:08 +0100 (CET)
Received: from localhost ([::1]:33772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipZGB-0001hR-1w
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 09:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33851)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ipZDp-0007sf-LU
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 09:55:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ipZDm-00054z-Sc
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 09:55:40 -0500
Received: from indium.canonical.com ([91.189.90.7]:53452)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ipZDm-0004zT-LB
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 09:55:38 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ipZDl-0003U0-AJ
 for <qemu-devel@nongnu.org>; Thu, 09 Jan 2020 14:55:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4A7462E806B
 for <qemu-devel@nongnu.org>; Thu,  9 Jan 2020 14:55:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jan 2020 14:44:48 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alexlngw
X-Launchpad-Bug-Reporter: Alex Longwall (alexlngw)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <157857629827.5165.2496570379985305724.malonedeb@gac.canonical.com>
Message-Id: <157858108925.3421.1810983606333957041.launchpad@soybean.canonical.com>
Subject: [Bug 1859021] Re: qemu-system-aarch64 (tcg): cval + voff overflow not
 handled, causes qemu to hang
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 349fbbfacbd4a29fe1a51917f17db7ffba349754
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
Reply-To: Bug 1859021 <1859021@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags added: arm tcg

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859021

Title:
  qemu-system-aarch64 (tcg):  cval + voff overflow not handled, causes
  qemu to hang

Status in QEMU:
  New

Bug description:
  The Armv8 architecture reference manual states that for any timer set
  (e.g. CNTP* and CNTV*), the condition for such timer to generate an
  interrupt (if enabled & unmasked) is:

  CVAL <=3D CNT(P/V)CT

  Although this is arguably sloppy coding, I have seen code that is
  therefore assuming it can set CVAL to a very high value (e.g.
  UINT64_MAX) and leave the interrupt enabled in CTL, and never get the
  interrupt.

  On latest master commit as the time of writing, there is an integer
  overflow in target/arm/helper.c gt_recalc_timer affecting the virtual
  timer when the interrupt is enabled in CTL:

      /* Next transition is when we hit cval */
      nexttick =3D gt->cval + offset;

  When this overflow happens, I notice that qemu is no longer responsive an=
d that I have to SIGKILL the process:
      - qemu takes nearly all the cpu time of the cores it is running on (e=
.g. 50% cpu usage if running on half the cores) and is completely unrespons=
ive
      - no guest interrupt (reported via -d int) is generated

  Here the minimal code example to reproduce the issue:

      mov     x0, #1
      msr     cntvoff_el2, x0
      mov     x0, #-1
      msr     cntv_cval_el0, x0
      mov     x0, #1
      msr     cntv_ctl_el0, x0 // interrupt generation enabled, not masked;=
 qemu will start to hang here

  Options used:
  -nographic -machine virt,virtualization=3Don,gic-version=3D2,accel=3Dtcg =
-cpu cortex-a57
  -smp 4 -m 1024 -kernel whatever.elf -d unimp,guest_errors,int -semihostin=
g-config enable,target=3Dnative
  -serial mon:stdio

  Version used: 4.2

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859021/+subscriptions

