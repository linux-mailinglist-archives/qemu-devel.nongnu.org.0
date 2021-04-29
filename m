Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A02A36E863
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 12:08:04 +0200 (CEST)
Received: from localhost ([::1]:45764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc3aV-0008N0-6p
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 06:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc3Tp-0002bR-NU
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:01:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:57794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc3Tj-0003n4-5L
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:01:09 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lc3Ti-0001CF-1m
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 10:01:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 072592E8060
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 10:01:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Apr 2021 09:53:25 -0000
From: Thomas Huth <1779955@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: likan pmaydell
X-Launchpad-Bug-Reporter: Kan Li (likan)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153065712229.13372.17157400567540509420.malonedeb@gac.canonical.com>
Message-Id: <161969000579.12418.14809987333264323306.launchpad@soybean.canonical.com>
Subject: [Bug 1779955] Re: qemu linux-user requires read permissions on memory
 passed to syscalls that should only need write access
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 659a8887f19319e8dddf414d66f84086afb84b6e
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
Reply-To: Bug 1779955 <1779955@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags removed: qemu

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1779955

Title:
  qemu linux-user requires read permissions on memory passed to syscalls
  that should only need write access

Status in QEMU:
  Confirmed

Bug description:
  When read() function takes an mmap'ed address as output buffer, it
  returns EFAULT. The expected behavior is it should just work.

  The following code works for qemu-system-arm, but not for qemu-arm-
  static.

  QEMU version affected: latest release 2.12.0.

  Steps to reproduce (please substitute /path/to/qemu-arm-static with
  the path of the binary, and /tmp/a.cpp with the example source code
  attached):

  # First register binfmt_misc
  [hidden]$ docker run --rm --privileged multiarch/qemu-user-static:registe=
r --reset

  # Compile the code and run
  [hidden]$ docker run --rm -it -v /tmp/a.cpp:/tmp/a.cpp -v /path/to/qemu-a=
rm-static:/usr/bin/qemu-arm-static arm32v7/ubuntu:18.04 bash -c '{ apt upda=
te -y && apt install -y g++; } >& /dev/null && g++ -std=3Dc++14 /tmp/a.cpp =
-o /tmp/a.out && echo hehe > /tmp/haha.txt && /tmp/a.out'
  ofd=3D3
  ftruncate=3D0
  mmap=3D0xff3f5000
  fd=3D4
  0xff3f5023 -1 14

  The expected result in qemu-system-arm as well as natively on x86_64 host:
  hidden$ ./a.out
  ofd=3D3
  ftruncate=3D0
  mmap=3D0xb6fb7000
  fd=3D4
  0xb6fb7023 5 0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1779955/+subscriptions

