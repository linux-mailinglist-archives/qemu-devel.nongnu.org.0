Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9826A3C32C9
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 06:28:29 +0200 (CEST)
Received: from localhost ([::1]:42890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m24bM-0002va-Km
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 00:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24ZO-00006p-AE
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:26 -0400
Received: from indium.canonical.com ([91.189.90.7]:45588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24ZM-0000aX-GH
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:26 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m24Z8-0003mm-9y
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:26:10 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A0A192E81FD
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:26:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Jul 2021 04:17:21 -0000
From: Launchpad Bug Tracker <1905651@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dje janitor th-huth
X-Launchpad-Bug-Reporter: Doug Evans (dje)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160635886967.28413.180075874214780604.malonedeb@chaenomeles.canonical.com>
Message-Id: <162589064169.5654.5909569497251448974.malone@loganberry.canonical.com>
Subject: [Bug 1905651] Re: Tests cannot call g_error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: ce682b054a5c481d939666d061583035f5b11e2b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1905651

Title:
  Tests cannot call g_error

Status in QEMU:
  Expired

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

