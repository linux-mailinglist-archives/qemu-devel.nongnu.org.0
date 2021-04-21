Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0730E3666ED
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 10:22:29 +0200 (CEST)
Received: from localhost ([::1]:33498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ87w-0003bN-43
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 04:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZ870-0003CU-EW
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 04:21:30 -0400
Received: from indium.canonical.com ([91.189.90.7]:37520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZ86y-0003lR-52
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 04:21:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZ86v-0003uL-0b
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 08:21:25 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 365062E8170
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 08:21:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Apr 2021 08:07:36 -0000
From: Hansni Bu <1924669@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm vfp
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hansni
X-Launchpad-Bug-Reporter: Hansni Bu (hansni)
X-Launchpad-Bug-Modifier: Hansni Bu (hansni)
References: <161854448336.19133.14178473340326539208.malonedeb@wampee.canonical.com>
Message-Id: <161899245704.10328.7546492827536683605.malone@wampee.canonical.com>
Subject: [Bug 1924669] Re: VFP code cannot see CPACR write in the same TB
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: b320e066c3e3a215299f2fff868d8b1b94ca1a94
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
Reply-To: Bug 1924669 <1924669@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry, it's because a "ISB" is missing after CPACR is changed. Not bug
of qemu.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1924669

Title:
  VFP code cannot see CPACR write in the same TB

Status in QEMU:
  Invalid

Bug description:
  If FPU is enabled by writing to CPACR, and the code is in the same
  translation block as the following VFP code, qemu generates "v7M NOCP
  UsageFault".

  This can be reproduced with git HEAD (commit
  8fe9f1f891eff4e37f82622b7480ee748bf4af74).

  The target binary is attached. The qemu command is:
  qemu-system-arm -nographic -monitor null -serial null -semihosting -machi=
ne mps2-an505 -cpu cortex-m33 -kernel cpacr_vfp.elf -d in_asm,int,exec,cpu,=
cpu_reset,unimp,guest_errors,nochain -D log

  If the code is changed a little, so that they are not in the same
  block, VFP code can see the effect of CPACR, or -singlestep of qemu
  has the same result.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1924669/+subscriptions

