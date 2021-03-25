Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2210349954
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 19:16:52 +0100 (CET)
Received: from localhost ([::1]:35290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPUXL-0000Ye-OE
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 14:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lPUMb-00052I-80
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:05:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:44332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lPUMX-0004CY-G8
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:05:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lPUMV-0002M4-N7
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 18:05:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 93AB22E8073
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 18:05:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Mar 2021 18:00:33 -0000
From: =?utf-8?q?Martin_Sch=C3=B6nstedt?= <1921092@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm debug
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: m-schoenstedt pmaydell
X-Launchpad-Bug-Reporter: =?utf-8?q?Martin_Sch=C3=B6nstedt_=28m-schoenstedt?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Martin_Sch=C3=B6nstedt_=28m-schoenstedt?=
 =?utf-8?q?=29?=
References: <161658153575.32717.2347487454546278840.malonedeb@soybean.canonical.com>
Message-Id: <161669523361.28473.16337375491580259815.malone@gac.canonical.com>
Subject: [Bug 1921092] Re: gdbstub debug of multi-cluster machines is
 undocumented and confusing
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: 1fbfa6b0fc7b2bc6128e95bc08db29e70b4603b1
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
Reply-To: Bug 1921092 <1921092@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-system-arm -cpu cortex-m33 -machine mps2-an521 -nographic -m 16
-vga none -net none -chardev stdio,id=3Dcon,mux=3Don -serial chardev:con
-mon chardev=3Dcon,mode=3Dreadline -icount shift=3D7,align=3Doff,sleep=3Dof=
f -rtc
clock=3Dvm -device loader,file=3D<remote_dir>/zephyr.elf -s -S -kernel
<master_dir>/zephyr.elf

i've included both .elf files in a zip. That should be enough for
running the sample

** Attachment added: "zephyr_sample.zip"
   https://bugs.launchpad.net/qemu/+bug/1921092/+attachment/5480969/+files/=
zephyr_sample.zip

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921092

Title:
  gdbstub debug of multi-cluster machines is undocumented and confusing

Status in QEMU:
  Confirmed

Bug description:
  Working with Zephyr RTOS, running a multi core sample on mps2_an521 works=
 fine. Both cpus start.
  Trying to debug with options -s -S the second core fails to boot.

  Posted with explanation also at: https://github.com/zephyrproject-
  rtos/zephyr/issues/33635

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921092/+subscriptions

