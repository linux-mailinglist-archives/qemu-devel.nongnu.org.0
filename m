Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07974287DA2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 23:07:13 +0200 (CEST)
Received: from localhost ([::1]:38028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQd83-0005Sm-Is
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 17:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kQd6Y-0004wU-JE
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 17:05:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:60418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kQd6V-0002eF-TE
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 17:05:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kQd6T-0000Ho-RH
 for <qemu-devel@nongnu.org>; Thu, 08 Oct 2020 21:05:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AAAF72E80DE
 for <qemu-devel@nongnu.org>; Thu,  8 Oct 2020 21:05:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2020 20:57:06 -0000
From: Cleber Rosa <1899082@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: acceptance pc replay test x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cleber-gnu
X-Launchpad-Bug-Reporter: Cleber Rosa (cleber-gnu)
X-Launchpad-Bug-Modifier: Cleber Rosa (cleber-gnu)
Message-Id: <160219062643.30310.16188463455229225461.malonedeb@gac.canonical.com>
Subject: [Bug 1899082] [NEW] ReplayKernel.test_x86_64_pc fails intermittently
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="781851f4dc11c93bc506eb54e6a0d35c919a1ce6"; Instance="production"
X-Launchpad-Hash: 2ec72f96cba9b1d12bf5631a1946c154f39e40d6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 17:05:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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

Public bug reported:

Even though this acceptance test is already skipped on GitLab CI, the
intermittent failures can be seen on other environments too.

The record phase works fine, but during the replay phase fail to finish
booting the kernel (until the expected place):

16:34:47 DEBUG| [    0.034498] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0=
, 1GB 0
16:34:47 DEBUG| [    0.034790] Spectre V2 : Spectre mitigation: LFENCE not =
serializing, switching to generic retpoline
16:34:47 DEBUG| [    0.035093] Spectre V2 : Mitigation: Full generic retpol=
ine
16:34:47 DEBUG| [    0.035347] Spectre V2 : Spectre v2 / SpectreRSB mitigat=
ion: Filling RSB on context switch
16:34:47 DEBUG| [    0.035667]
16:36:02 ERROR| =

16:36:02 ERROR| Reproduced traceback from: /home/cleber/src/avocado/avocado=
/avocado/core/test.py:767
16:36:02 ERROR| Traceback (most recent call last):
16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance/r=
eplay_kernel.py", line 92, in test_x86_64_pc
16:36:02 ERROR|     self.run_rr(kernel_path, kernel_command_line, console_p=
attern, shift=3D5)
16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance/r=
eplay_kernel.py", line 73, in run_rr
16:36:02 ERROR|     False, shift, args, replay_path)
16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance/r=
eplay_kernel.py", line 55, in run_vm
16:36:02 ERROR|     self.wait_for_console_pattern(console_pattern, vm)
16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance/b=
oot_linux_console.py", line 53, in wait_for_console_pattern
16:36:02 ERROR|     vm=3Dvm)
16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance/a=
vocado_qemu/__init__.py", line 130, in wait_for_console_pattern
16:36:02 ERROR|     _console_interaction(test, success_message, failure_mes=
sage, None, vm=3Dvm)
16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance/a=
vocado_qemu/__init__.py", line 82, in _console_interaction
16:36:02 ERROR|     msg =3D console.readline().strip()
16:36:02 ERROR|   File "/usr/lib64/python3.7/socket.py", line 575, in readi=
nto
16:36:02 ERROR|     def readinto(self, b):
16:36:02 ERROR|   File "/home/cleber/src/avocado/avocado/avocado/plugins/ru=
nner.py", line 77, in sigterm_handler
16:36:02 ERROR|     raise RuntimeError("Test interrupted by SIGTERM")
16:36:02 ERROR| RuntimeError: Test interrupted by SIGTERM
16:36:02 ERROR| =


On my workstation, I can replicate the failure roughly once every 50
runs.

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: acceptance pc replay test x86

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

