Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B48D31846F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 05:59:17 +0100 (CET)
Received: from localhost ([::1]:60628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA44S-0007vP-GC
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 23:59:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lA413-0004SZ-8D
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 23:55:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:42782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lA410-0002mb-Sk
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 23:55:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lA40y-0001mS-QG
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:55:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C5D282E8134
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:55:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Feb 2021 04:46:44 -0000
From: Cleber Rosa <1899082@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: acceptance pc replay test x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: beraldoleal cleber-gnu dovgalyuk
X-Launchpad-Bug-Reporter: Cleber Rosa (cleber-gnu)
X-Launchpad-Bug-Modifier: Cleber Rosa (cleber-gnu)
References: <160219062643.30310.16188463455229225461.malonedeb@gac.canonical.com>
Message-Id: <161301880440.3870.15755598145503260493.malone@chaenomeles.canonical.com>
Subject: [Bug 1899082] Re: ReplayKernel.test_x86_64_pc fails intermittently
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e34ce994f03aae76d4610a97bccf86c0f2cf9f70"; Instance="production"
X-Launchpad-Hash: 41e1415b6b7e4fbe3b604bb615f9f107a53e6074
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1899082 <1899082@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I was able to run the reproducer from Beraldo Leal, and achieved the
same results.

Additionally, I got the following output from QEMU:

   qemu-system-x86_64: Missing character write event in the replay log

Which seems to come from replay/replay-char.c:158.

I then tested the record and replay separately, and found that, while
the above message is given and QEMU exits at the replay phase, the
amount of CPUs given to the *record* stage actually make the difference.
When the recording is done with a single CPU, the replay log seems to be
written with the "missing character write event".

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1899082

Title:
  ReplayKernel.test_x86_64_pc fails intermittently

Status in QEMU:
  New

Bug description:
  Even though this acceptance test is already skipped on GitLab CI, the
  intermittent failures can be seen on other environments too.

  The record phase works fine, but during the replay phase fail to
  finish booting the kernel (until the expected place):

  16:34:47 DEBUG| [    0.034498] Last level dTLB entries: 4KB 0, 2MB 0, 4MB=
 0, 1GB 0
  16:34:47 DEBUG| [    0.034790] Spectre V2 : Spectre mitigation: LFENCE no=
t serializing, switching to generic retpoline
  16:34:47 DEBUG| [    0.035093] Spectre V2 : Mitigation: Full generic retp=
oline
  16:34:47 DEBUG| [    0.035347] Spectre V2 : Spectre v2 / SpectreRSB mitig=
ation: Filling RSB on context switch
  16:34:47 DEBUG| [    0.035667]
  16:36:02 ERROR| =

  16:36:02 ERROR| Reproduced traceback from: /home/cleber/src/avocado/avoca=
do/avocado/core/test.py:767
  16:36:02 ERROR| Traceback (most recent call last):
  16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance=
/replay_kernel.py", line 92, in test_x86_64_pc
  16:36:02 ERROR|     self.run_rr(kernel_path, kernel_command_line, console=
_pattern, shift=3D5)
  16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance=
/replay_kernel.py", line 73, in run_rr
  16:36:02 ERROR|     False, shift, args, replay_path)
  16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance=
/replay_kernel.py", line 55, in run_vm
  16:36:02 ERROR|     self.wait_for_console_pattern(console_pattern, vm)
  16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance=
/boot_linux_console.py", line 53, in wait_for_console_pattern
  16:36:02 ERROR|     vm=3Dvm)
  16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance=
/avocado_qemu/__init__.py", line 130, in wait_for_console_pattern
  16:36:02 ERROR|     _console_interaction(test, success_message, failure_m=
essage, None, vm=3Dvm)
  16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance=
/avocado_qemu/__init__.py", line 82, in _console_interaction
  16:36:02 ERROR|     msg =3D console.readline().strip()
  16:36:02 ERROR|   File "/usr/lib64/python3.7/socket.py", line 575, in rea=
dinto
  16:36:02 ERROR|     def readinto(self, b):
  16:36:02 ERROR|   File "/home/cleber/src/avocado/avocado/avocado/plugins/=
runner.py", line 77, in sigterm_handler
  16:36:02 ERROR|     raise RuntimeError("Test interrupted by SIGTERM")
  16:36:02 ERROR| RuntimeError: Test interrupted by SIGTERM
  16:36:02 ERROR| =


  On my workstation, I can replicate the failure roughly once every 50
  runs.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1899082/+subscriptions

