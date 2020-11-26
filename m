Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909212C4DEB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 05:16:37 +0100 (CET)
Received: from localhost ([::1]:39292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki8hw-0002EL-66
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 23:16:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ki8hC-0001pU-Qt
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 23:15:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:42726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ki8hA-0007Sf-D6
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 23:15:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ki8h8-0007en-4f
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:15:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 02F222E813E
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:15:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2020 04:00:37 -0000
From: Doug Evans <1905651@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dje
X-Launchpad-Bug-Reporter: Doug Evans (dje)
X-Launchpad-Bug-Modifier: Doug Evans (dje)
References: <160635886967.28413.180075874214780604.malonedeb@chaenomeles.canonical.com>
Message-Id: <160636323710.25495.1266675492558936494.malone@wampee.canonical.com>
Subject: [Bug 1905651] Re: Tests cannot call g_error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: 57d9f40e230d2d5d8ec785b8830426a347f29195
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1905651 <1905651@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An alternative is of course to allow g_error to be called.
One might restrict tests to not call it, but it might be impractical to imp=
ose that on all code that goes into a test.
One will need to find a way to get glib to not call G_BREAKPOINT for this c=
ase.

  if (debugger_present && breakpoint)
    G_BREAKPOINT ();
  else
    g_abort ();

https://gitlab.gnome.org/GNOME/glib/-/blob/master/glib/gmessages.c#L555

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1905651

Title:
  Tests cannot call g_error

Status in QEMU:
  New

Bug description:
  I stumbled on this writing a new test, using tests/qtest/e1000e-test.c
  as a template.

  g_error() causes SIGTRAP, not SIGABRT, and thus the abort handler doesn't=
 get run.
  This in turn means qemu is not killed, which hangs the test because the t=
ap-driver.pl script hangs waiting for more input.
  There are a few tests that call g_error().

  The SIGABRT handler explicitly kills qemu, e.g.:

  qos-test.c:
      qtest_add_abrt_handler(kill_qemu_hook_func, s);

  ref:
  https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dtests/qtest/libqtest.c;h=
=3De49f3a1e45f4cd96279241fdb2bbe231029ab922;hb=3DHEAD#l272

  But not unexpectedly there's no such handler for SIGTRAP.

  Apply this patch to trigger a repro:

  diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
  index fc226fdfeb..e83ace1b5c 100644
  --- a/tests/qtest/e1000e-test.c
  +++ b/tests/qtest/e1000e-test.c
  @@ -87,6 +87,9 @@ static void e1000e_send_verify(QE1000E *d, int *test_so=
ckets, QGuestAllocator *a
       /* Wait for TX WB interrupt */
       e1000e_wait_isr(d, E1000E_TX0_MSG_ID);

  +    g_message("Test g_error hang ...");
  +    g_error("Pretend something timed out");
  +
       /* Check DD bit */
       g_assert_cmphex(le32_to_cpu(descr.upper.data) & dsta_dd, =3D=3D, dst=
a_dd);

  Then:

  configure
  make
  make check-qtest-i386

  check-qtest-i386 will take awhile. To repro faster:

  $ grep qtest-i386/qos-test Makefile.mtest
  .test.name.229 :=3D qtest-i386/qos-test
  $ make run-test-229
  Running test qtest-i386/qos-test
  ** Message: 18:40:49.821: Test g_error hang ...

  ** (tests/qtest/qos-test:3820728): ERROR **: 18:40:49.821: Pretend someth=
ing timed out
  ERROR qtest-i386/qos-test - Bail out! FATAL-ERROR: Pretend something time=
d out

  At this point things are hung because tap-driver.pl is still waiting
  for input because qemu is still running.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1905651/+subscriptions

